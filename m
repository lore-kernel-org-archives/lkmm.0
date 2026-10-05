Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B14D6C46
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220657; cv=none; b=AsYIANCKu4DZpSQEG8O2eiVVzXVdRHeeX6P5LyLEDQujf38fHkG7LmpnCPTgppuSUzVQ0zJBE7vqmgguNRi2vuSYuEpsIH1RJjgwKwQUaeCDz9Ij5EMsIFJWSE1BAJ2tCZiAFSXVLdkB7RoV/dKGCtHfTxQEzdTOWuqewlYgV20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220657; c=relaxed/simple;
	bh=efWEPmj0Vc93yD7ksoAs6CSfVahXXbn88QWzVR/N9r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pj0/q1QLYyKTBeK38oWSCY61PxD0CQh+yH6+emZYSEWj4MVdJxIciDMLeWvatDjjA/VmQ/hjUpJGbtfpBWUl31A99bxQqIKp1YDQKdmb5fNdbf5jgbijKH7hn0Vx+fBPPWUDGliIygPI+NUSZxeJXaUJ9iYCMQKmoYzt6GfJzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8c2f1DI; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8c2f1DI"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1632955a91.2
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220655; x=1791825455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=G8c2f1DIC7oDGTzDrFyO7reAZuUbj7QPl3CnSA8rMzs7ktinOY1qrhqEmu3MESmAfG
         erB8lBzsRM2Pg4yPwXqpHmxDbY5A49/LfipqICl96iLtZkK4xW+b4NN9EpJUkawxa6hk
         McQguujn2Vd83d4mUw/4Hbe4dC5+uRRaWVJCM0vP9H+zjWjo8+tqyZfoageOXBsNUOQ1
         HlxrtBrOp8OEPSuqaPTC9EF2eeWbIg9c3lth3bTMPQ3zAa99DC9Ga1FfCnMTFp2F9188
         3optQA86ioogIpvxzfD3NEAz3LF2mR8aJPo1P6K/GaKw7Dtg7pTPkVDT/S5Ok1nv3xIH
         8P8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220655; x=1791825455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3aHGH1btHKyA9bPipQiTAK39EsUtmJmoqAt6kx41g10=;
        b=phRQJ5NP/r8aWZCzO4l/kCaOvAdzI55RSSzU/pemMygWk/sI1qpuZzc0IfRcFkLBCs
         T74szB/kjc4Hk1FMEmAcAoqAtFJToxsCMcdImQglpVFNxbcKh7BkF/qX2WkgBf0mc7u8
         D1zwno/yVf+ovgd3ytj3IrXJ9FOvku4uXvoYCWTctOMySTrWQEm/w5VaUoHpuLPaaQ2k
         cp1S0nMZkf5uN5r0TWfo3rqowsDM3OfWuHy/adW2JsulQVVdjmqNH/dn3ICb7UBODRvn
         TNroRT5GN5JoZo/iOAc2mk7zD1VpRGRfOtWPkEtWbYTzRY8ob/p5viwTqdhZHik7ltcv
         uZXw==
X-Forwarded-Encrypted: i=1; AKwUvBxkyanC75CNdKl/+05SUP1NbOC+YY/f81Q+FDY8jNUR6w44rxzZphCTzC79tM/gpjpAx+BG@lists.linux.dev
X-Gm-Message-State: AFq9FYLktfyT+dK8/umSNPRZu6OPGCYUrsWp0gYEmUI0gHmF6lDOiXMW
	IJ3cpiMOjjZiHnvT4Kdc2qhBRs5EjlWqlHxWcoS0A9074nLHbQHPz1ni
X-Gm-Gg: AYBFou1I1zfq13OUxJ/XyaGQAL7P1j4pQFxhzonjVGNIrko0SJUqmX4doesR0tTkT35
	Ixz2m1wDBfQ+hCjWmdCCW/LrEJs1uQaueBKi30r/HyMyjDf//aYkdDeu9IOdkVIZQCrTL87Xz+t
	arn8k0c+AaH6M01d4vU7fhoTfH5i/Q4sXhLBU+fLYJ/dwQ3qb9A1pSvoOyYpYnL+VsUSh2oLoVG
	g82PtLyWxh/R1QzGAS3RAJKzbM4PBeSJbTfCMIgifzK9IJdPE2aG1LVnYZhNJ9zdGZyNxYIPdUL
	a75wP/4dS7lQApnGxclaBZxHB6AR7+zVeB/7kxXudx6klpVOwI1/O0hb0msRFTCPlg1f4blXpwx
	9UpX2znWJC+QgNA+BhJurCZdNHePYSypUVoM1LaxOW94QzWetqhfYV3KBHT8TC9ldzT7fdeMlFG
	hvceDRolkHcF2DclqtiyPmD1Wj+zL5EdvNabPS9xGvewf4nFJlZ0XsCBUy6K6cw/36lvqnYHgU9
	kfPykIUMGjZSD3oHeCg8mgf5xA5eioobvpDlVpS
X-Received: by 2002:a17:90b:4c52:b0:3a0:5413:49b4 with SMTP id 98e67ed59e1d1-3a6ce7fba39mr9628210a91.39.1791220654194;
        Mon, 05 Oct 2026 10:17:34 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:33 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for dynamic key lookups
Date: Tue,  6 Oct 2026 01:15:22 +0800
Message-ID: <20261005171529.1378809-9-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep_unregister_key() waits for is_dynamic_key() callers with
synchronize_rcu_expedited(), which requires system-wide coordination.
Make is_dynamic_key() protect the hash bucket with a hazard pointer
and use hazptr_synchronize() to wait for traversals of that bucket.

The hash bucket returned by keyhashentry() has a stable address, so
it can be used as the hazptr synchronization target.  Keep the key
hashlist lifetime RCU-based with hlist_del_rcu() and call_rcu().

Protect the traversal with the hazptr scoped_guard() added earlier
in this series.

This adapts the lockdep use case from Boqun Feng's shazptr series
to the current hazptr API.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c56a7f91d72e..d1ce5ace7fbf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1280,14 +1281,19 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
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
@@ -6683,11 +6689,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
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

