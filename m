Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88458238D52
	for <lkmm@lists.linux.dev>; Mon, 22 Jun 2026 16:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146308; cv=none; b=bpsTpYuGUcnOx1m/7MNVryrUIQfLkcx08tPMpx1Z1IBzlgXDicPXFEa1tx7aQMyLPqzhUgCJbcDzhfeDsONGemvs7s14hI0I35gKwAd3YkQhdpEwbo5dOaC461YKUBjWaiK52cmvuk2Ma3Cp8hd6l723haVZeV7hiNBKmBEprvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146308; c=relaxed/simple;
	bh=GN2TgrusrWjJLdy+vhek14iGseyacTyoF2Rep5nUMIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oRLK452V/45uhMbxWQm3OqxBPezJPo3sZZ/EQgtEMA37XR8iztbFb6wB8qtkVZ7rLeFAh9Xj9LhcJ4n72olc/yBnverhIkGs1vX8pirVF1FjbJ90DSY7BRTaJjGQaBB6GIJZRUdleb5xsXA2mc9b2I/noqRHVSr+t/Qqf7yXwaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=peuAkjrW; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="peuAkjrW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782146304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Idd98Jw/kHUQSqvo8neFVSQ1pGEnnE6l+alhk7FmbDI=;
	b=peuAkjrWJO/zh2PEd9ln0s3B7Cf5WIuuVRuiEjCbDLSS2XsNZYgxi/iIfyX0RvPYMrEYCZ
	3IevyOeFoqnFctADyE2mNS7WW3l/VS498s/JBJmUgj2rv87Haac06dH5xWl3/WK0rtvrxT
	MdGtBFfXMKjsXmbBZjuHpYM3UuwGuoU=
From: Usama Arif <usama.arif@linux.dev>
To: lkmm@lists.linux.dev,
	joelagnelf@nvidia.com,
	linux-kernel@vger.kernel.org,
	marco.crivellari@suse.com,
	paulmck@kernel.org,
	rafael.j.wysocki@intel.com,
	rdunlap@infradead.org,
	riel@surriel.com,
	sshegde@linux.ibm.com,
	tglx@kernel.org,
	ulfh@kernel.org,
	usama.arif@linux.dev,
	yury.norov@gmail.com,
	rcu@vger.kernel.org
Cc: shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	kernel-team@meta.com
Subject: [PATCH v2] smp: Use release stores for csd_lock_record() state
Date: Mon, 22 Jun 2026 09:38:07 -0700
Message-ID: <20260622163807.4187558-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

__csd_lock_record() publishes per-CPU CSD debug state that is read by
csd_lock_wait_toolong() on another CPU.  The remote side first reads
cur_csd with smp_load_acquire() and, when non-NULL, may then read the
matching cur_csd_func and cur_csd_info fields.

Use smp_store_release() when publishing cur_csd so that the preceding
cur_csd_func and cur_csd_info stores are ordered before the pointer
that csd_lock_wait_toolong() acquires.  This replaces the open-coded
smp_wmb() plus plain cur_csd store with the release operation that
matches the smp_load_acquire() in csd_lock_wait_toolong().

For the clear path, use smp_store_release(&cur_csd, NULL) so that
clearing the diagnostic state remains ordered after the preceding
callback/unlock work, without requiring a full barrier before the
store.  On x86 this removes the locked full barrier from the clear
path; on weaker memory models it uses the release operation needed by
the smp_load_acquire() in csd_lock_wait_toolong().

The old code also had smp_mb() calls around cur_csd updates. Those would
only be needed if cur_csd were treated as an exact live-state marker whose
publication had to be observed before callback execution or CSD unlock.
CSD stall warnings do not currently have RCU-style stall-ended checks, so
they already allow the stall to end while diagnostics are being assembled.
The cur_csd record is therefore best-effort diagnostic context, not a
precise completion/stall boundary.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
v1 -> v2: https://lore.kernel.org/all/01437928-ff79-4d8e-823b-7f20146946f6@linux.dev/
- Document where the smp_store_release() synchronizes with (Alan Stern,
  Randy Dunlap and Paul McKenney).
---
 kernel/smp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index a0bb56bd8dda..685829875a3e 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -182,16 +182,22 @@ static atomic_t csd_bug_count = ATOMIC_INIT(0);
 static void __csd_lock_record(call_single_data_t *csd)
 {
 	if (!csd) {
-		smp_mb(); /* NULL cur_csd after unlock. */
-		__this_cpu_write(cur_csd, NULL);
+		/*
+		 * Pairs with smp_load_acquire() of cur_csd in
+		 * csd_lock_wait_toolong(): orders any preceding CSD
+		 * callback/unlock before a remote reader observes NULL.
+		 */
+		smp_store_release(this_cpu_ptr(&cur_csd), NULL);
 		return;
 	}
 	__this_cpu_write(cur_csd_func, csd->func);
 	__this_cpu_write(cur_csd_info, csd->info);
-	smp_wmb(); /* func and info before csd. */
-	__this_cpu_write(cur_csd, csd);
-	smp_mb(); /* Update cur_csd before function call. */
-		  /* Or before unlock, as the case may be. */
+	/*
+	 * Pairs with smp_load_acquire() of cur_csd in
+	 * csd_lock_wait_toolong(): publishes cur_csd_func and
+	 * cur_csd_info before the non-NULL pointer becomes visible.
+	 */
+	smp_store_release(this_cpu_ptr(&cur_csd), csd);
 }
 
 static __always_inline void csd_lock_record(call_single_data_t *csd)
-- 
2.53.0-Meta

