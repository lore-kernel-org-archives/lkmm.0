Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D024CCDCC
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061028; cv=none; b=NVeSzayXyR2Q1Q4CbVKpU1pFwy9AoJaKoW/7VDJwTtaIR3qQDnfgb3VPHO9s8Hlkogu7xOLngsrWq3HsAMwlZscK41Mp0d88ysiXsc4NPkEeT5sKYT9P+ALIbKspoT7zX8G6pVXEcfop18u0L/4RFTOXlvkGoLySAyqfoAK/UbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061028; c=relaxed/simple;
	bh=Z5Gkdx2wsDeiiFNXcQT9qA1i2avBskmfCcp53LcmQc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAjzTGCXcanXfWz+0cyzod4656DrLbRXSUokG7OfPsa64rMUrE/3yfZiGXMRAWEZLe0v/NSQIQrrnGRo3YufSRSRhTNz1Gt1qxHCUDENexOfB4D9HK2DrhLk1osfdSrr3JOdJAeR1xr5xi86J0A++Fy4LMWpYTFlqn+CqMfbYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMzYeIzm; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMzYeIzm"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3622908a91.3
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061025; x=1790665825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVuEObhXGSApyrXTtBablhdwNNS63ZjQVW0XfLpFgyY=;
        b=WMzYeIzmapGQhvzB8qNU/3fXmd7z01bpHi65G2iPMN9oRjsHxLqLsouqnfdcKBkBTF
         g4LxAwBwJadDQNQSHpT4hIQOSUJ342dttpdQeo9JlhGC/A9XbCKktOq+hgGKQhnrnhfg
         IAF6Z+I/YmfitSp1xDAGW0dzA0PLzdBsbXD80UgLZw8HrhcO6AssbLPTmrvRGiulQDGl
         LXN/H7aEDFAn+8dGQ05m7SpUcO+8UaIenfoGx+iyqk3L/JmVa2FdC949k/O44FH0bGBV
         qyqW0wT15h0oOQ5EoE1+gySTNT9HnAixj2Bo1EcMw/5UT8JTbDrwzAXcp5bPMvJxv/SN
         panQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061025; x=1790665825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVuEObhXGSApyrXTtBablhdwNNS63ZjQVW0XfLpFgyY=;
        b=C5tcez/V5xtIgYNY+H/m6t9FYDoPxLKeH2VVgROA9eBdC2myLFFsutYW5OC7S8UHC+
         qUwLk26R49s2DXA6t0kqLmGsXNLCU74srywQbofb8aEAsa9HzYIEIVHgH+owF0xle8Zj
         Ur6rIxbU8mDA6nxRE5RRmqrVCrzoZzsZdTsYWhIywdCAe41JIplXjS8JtjhvWu5dHuEM
         ZMGfcUFC8eXeOMCo88yHTxtW+0Qq+K0oBrDM4k4AuyxbdTqLaN1lWg0BO9sjRw/Qt+ON
         RwX4UCIIMYJ1uLixUqxuBYcB13oXoInSpn0rvPqOczN2URndyxGGYOJ/REtQIfFVht8T
         Eq5w==
X-Forwarded-Encrypted: i=1; AKwUvBxPinZZTpQSRhDjxQGVU+fh1g8tsHiwOJA/pt2QI5kTDZZTN/g1Czr8RorxBVtxbKeOVorN@lists.linux.dev
X-Gm-Message-State: AFuF++m4yiKRN5ZjRc6E5pJY0CCKtMIHDQ9JyMudfApWA+tlVbFD/EJm
	T1zI/jDE14ohx6pRhxlBBPtMXX/RzYg5iGsl5qNhIbLPonTL5SEw1Man
X-Gm-Gg: AYBFou3x6priFOQvojQZc+giyXi2o4kO5Ir9Sm2GIvlshphl08loDeWobxneRgpbyaC
	64t23wFe5bz68lYnJ2CFVmmM26BMAHd3YDgwhS6mi54hNCHF63hK2M/7xn67mijiOma5YSthgVs
	b1AuRetfDBK55dlCIrkv/HAc5M9K0AdhlsTl1jVl9bfTuHIlGoQ4XPkSzuC2shyFK5gXTJZEInF
	H4zJxOMaiFWz5gwoH0iczgs4JW1atqAmygXzup9R6aVgbhQQBfncHW7m43dy1uGzoCh/VSIfWhl
	l2wwmvBJK5LoI8uG8Zcm8atzq4NgjqZQLV49Yc7sdDa/DMIJpdmihTvVJCrNHf7peqaAAkRURJz
	/6fR/Fn/qIGq1TKPaSFOacXZQHSVrqGdgSlb9IykP5wMbfBznemUC03RQKPFOWDXROudeCSyYmP
	HHvIcThEcZPr3PYCgr25a3LYwHPb1ozZMRhk8ENu7HmFP0ucNfp9ExErxhbNKBb104ZKjnBvhxu
	a4YjLlKc+x2iuoemA==
X-Received: by 2002:a17:90b:4d8f:b0:39e:6a7f:eef1 with SMTP id 98e67ed59e1d1-3a0731ef87bmr231688a91.22.1790061025401;
        Tue, 22 Sep 2026 00:10:25 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:24 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
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
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 2/4] locking/lockdep: use hazptr to wait for dynamic key lookups
Date: Tue, 22 Sep 2026 15:09:48 +0800
Message-ID: <20260922070950.4173245-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070950.4173245-1-kunwu.chan@gmail.com>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep_unregister_key() waits for is_dynamic_key() callers with
synchronize_rcu_expedited(), which sends IPIs to every online CPU.
Have is_dynamic_key() mark the hash bucket with a hazard pointer
and use hazptr_synchronize() to wait specifically for those
traversals.

The hash bucket address from keyhashentry() is stable, making it a
suitable hazptr synchronize target.  The rest of the key hashlist
lifetime (hlist_del_rcu/call_rcu) remains RCU-based.

This adapts the lockdep use case from Boqun Feng's hazard-pointer
series to the current hazptr API.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/locking/lockdep.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c56a7f91d72e..f67d847f9abf 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/hazptr.h>
 
 #include <asm/sections.h>
 
@@ -1280,14 +1281,24 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
-	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
-		if (k == key) {
-			found = true;
-			break;
+	/*
+	 * The traversal is protected by a hazard pointer rather
+	 * than an RCU read-side critical section.
+	 */
+	{
+		struct hazptr_ctx ctx;
+		void *bucket = hash_head;
+		void *addr;
+
+		addr = hazptr_acquire(&ctx, &bucket);
+		hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
+			if (k == key) {
+				found = true;
+				break;
+			}
 		}
+		hazptr_release(&ctx, addr);
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6683,11 +6694,10 @@ void lockdep_unregister_key(struct lock_class_key *key)
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

