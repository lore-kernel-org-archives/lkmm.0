Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811505;
	b=lcEPxoim/CFdtl43myqU8lxLMSXLEfH3QDkThsVQpQ2p3GTgGtBj1kRh8AQEMRHI2Bdm
	 fJUXBjL/fcsIeqk/k8HPWXN1Gtc4Qs0b5RvVWM5KeAmA1khUm8FioAKBOiMLXxZBF213/
	 PqDXogJ4AxTGPh0neRdQgNdedp25wh2Pg9nNfWvzJsJOn3HrucnJmmHW0IMzALCzAW72f
	 WmtArzaeGx0RHZMUaBe+BxFbYlFkDLc5qLC3bd/TPZnKP3vrgQMZiOwTeGGdT3uy5Ghhl
	 MAUDUTplWjGd9dTcPooc3KNdJDbZiM1Ukk7TTPZfLPH9+AoE2gDtQSzeJH46S8kxYmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
	b=sZebIVCVHxZHDCDF9ZS4bO55qH2LShf3r0G9/IBh5ESwsGGPdjavovqShnAa6/66cC47
	 yoncXA6lPn53UEBVnjBdCiufASs3RXIy7iMhyXLtk+NBPaWcd7wNGFGoYZq9lSf15xhbe
	 7xCftmvqfcbXUh1K/EIykxEu4bvRVtBll4L9oWiR5XQvjtsBNNsSyhgxvSDx3UCTNCQnt
	 Zq3YzNACTdoE0Xj1IfO52oecrbMydEJH0ecAbZ4NxMJCdvchqXjEFjyG1jGuRJXVk/jDl
	 6JLzb6R18SvMJmkQyHirOXs4jwisxRxHLwxw5Bjtkbcf6ZtE19+4TfNRUk255OMpYQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KIpW/1g5";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21471606A329
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21471606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIpW/1g5
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2055610eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811504; x=1794416304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=KIpW/1g5H7A5MTM1UW8q1mqSduPTWggx15BXea7+zQkwR+rWGqpP5JWHiVie24udS+
         Sn1UksEgp0oa4HS1gxUTg5LKcCZTKXuc7mXD1ol5cG1lia8mTabn8JOynkURJk/B6eEg
         wjm0ecAcbLJHD4xYUhKZ+mKjVwGHG2idIogkmFthdz5qmAQtJPgJGeyy71wnIe1Ux+fX
         5iLXzy2Qy8Yk058T6sADR5xODUDAqsBTF61VcWxuMc5MrJ+ee9YUeIeWLuQaAYP8V/rZ
         2qhBXNsIRTQMzczx8DfKYKFknefvCawkT3wR+HhNrUNWk/96DskQGVVNLHImvsKqdzTJ
         ay/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811504; x=1794416304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3exnuIEn75Mzl8OzBk9yKBvPuDEfR29myhkVg7oSY4=;
        b=V9GPOWvffA49AjteM9XOL4rsOz9i+c2X9OFMVb1Vw2hSaJFEVxbBnU4v9ufLzSmE7g
         7lAXluN8Ql5AqrP0+3GoyIZi3Dr50cQM2GP81ectxVLUjL3cmGwAFD8xQytqShUvKy2V
         sDpUYTIjX2w5T4Jzb77uv4lNDZe6bAHzudiMUuwRLd+azZgzmJtXMrGHQIooHy/9NSj3
         oHsvGjWqwOgabU7wQPfqtHYGvnFg4TbCVtSPKkLpuRTdR5omHE4HvJPh5ip3LmnxA5ru
         fvEY7lJBAbOse/l73BJEDNUpqIa1IyAH71PFFrRcbyBeAkPUAm5N5B1mOkaxz3H5zTqc
         WfDA==
X-Forwarded-Encrypted: i=1; AKwUvBzAdqh5p0W9Mdo/SnNp1Rw4+YtA5LJ+H9vvcm2QTnenBEoJcirY63rhjQ1LU6eBvC+gckVQ@lists.linux.dev
X-Gm-Message-State: APuU4Z9Jbkn82ush+aRDcUAp8YsvjEPVbFKsQeHkzsLFVw83Ko8IKhKO
	j/+rNNyL93MRd6dJimqwHHG6EGPCJuihaRsSeyljQ+o65dyOKPz9skC6
X-Gm-Gg: AYBFou3llWDOzSd7zTZTKc1O3cI5kDmRXfuYyrZj5mBv0DUo/nuUlqaNjgv4K50mh0f
	qfouWXJYtnCPR20c6lgv4keiHy92JQwXO8VH/3dHdPwfwhU7dnVPfFsnJLHbaRs0Gb9sA2+L183
	U2DG7izCH3D2bliMO4COHU8tnocd88Cct5H07F7rkcmeqM74h4B/mhb1pdgveDlIeVYqanHGOnI
	C4NusnjKrFhr909xLHLjydTPnAktx2CXnhDmuxMZ9ViPxmS483Vw2YYY4/v1hqo2QUjONrFR9Mv
	G3wkjMsz1nWpSkxzJoVu4ylvN3pnBFNovP3mSfKp8DDk11uDFZV+K2WBO00BNw3U/LjoZhPZhrZ
	Juayy9mhwVtRf8A8piXkxxve6h42GDLKKoTimEo6CIC2Y/uz7TNQrTEUkpRIYLAuhnrGzvijiDG
	y+aX+zPULpCtIYSDiJBXRWoj2gvps0VEovh53eMjUqa8xJBoNMmBA2Pwfyh5TRhIx5zWhGPQtxR
	8DcE/cma6PWHDWcr/cnthVR8uZ0Vvw120sQrNU5eELQElpz1hTyfkM5tCjvaiE2Yv7YeO6XrZpS
	MRL38QurmCLfsQ0ol6qoC+TzTIISMEeyjf4Bbdc=
X-Received: by 2002:a05:693c:87c2:20b0:36a:6ae5:23e2 with SMTP id 5a478bee46e88-36a6ae52e67mr14054524eec.17.1793811503835;
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:23 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 20/28] locking/lockdep: Use hazptr to wait for dynamic key lookups
Date: Thu,  5 Nov 2026 00:54:38 +0800
Message-ID: <20261104165504.2430480-21-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the system-wide synchronize_rcu_expedited() in
lockdep_unregister_key() with a hazptr_synchronize() scoped to
the per-key hash bucket.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef2..256f23a9041d 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1308,14 +1309,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+
+		scoped_guard(hazptr, &ctx, &bucket) {
+			hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+				if (k == key) {
+					found = true;
+					break;
+				}
+			}
 		}
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6717,11 +6723,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
 	 *
 	 * Some operations like __qdisc_destroy() will call this in a debug
 	 * kernel, and the network traffic is disabled while waiting, hence
-	 * the delay of the wait matters in debugging cases. Currently use a
-	 * synchronize_rcu_expedited() to speed up the wait at the cost of
-	 * system IPIs. TODO: Replace RCU with hazptr for this.
+	 * the delay of the wait matters in debugging cases. Replace the
+	 * expedited RCU wait with hazptr_synchronize().
 	 */
-	synchronize_rcu_expedited();
+	hazptr_synchronize(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.43.0

