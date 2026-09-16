Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA54A33E1
	for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550219; cv=none; b=lR6BzgcvoM0v2uJfUye+t3XQX36tIQ494+PuwHItara1ES7JO3l4Gjx4ZRo/0edzZjXoust8GBm9wlco1ogt+7m/K9dj2jSrcQZJ4IUnHyWmqIuBhFQxTP+cb+BDzS/wZF5Nxd96XB20Rb/OsLrh3cXEAJ3AZLeeWl7h2wFjIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550219; c=relaxed/simple;
	bh=NXsR+7YdoDi6ZZdYasO2eePVdxt36IJHMMDJ4nl2K1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blYvB++87jPvN1Qb/yETEFGezD9UylTCjwtdmcVsLflh93Gnyn1IpDb/J2oXo/GquDA2m5xAh4wfoJInIJ0anffROSaBElfy+pMBi8/uNIYb+Z1N1/FzuhXu/ZQyelGkcLni/MiEjOOpsxWPYZJaV5xCkA7KGXX/HRzmC58Ik3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi/nFNRs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi/nFNRs"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso5642385ad.2
        for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550201; x=1790155001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6hU/GP1FtIfUUKp4semB07auuKYgomg3/U1as99ctQ=;
        b=Vi/nFNRsbOC/YO1a7zFRVk9Mi7I4Nqm3GAYWRHnJxtqr9v+wiw+/kO4Uxuzp2n/lL/
         KyxBWpZ71gpPCtGrfqYuVmF4IdcUD3OXDWrjPn88mfphV+l2hl3vTt0HKIA4WBG1IsXL
         fT1kmIVdgmzwMOYcZJsFAxNUnGN1iJIogab9cxxb3C2OEyjc3Rcsc8u3vbOagUT3Ajxg
         0STjo76UnUv9Xx+zrvtoZc3Vv+pGZ6zn/bv8+ag02P3KBxLyxm92SyKM4YbsDEPhJ1z8
         jUPjQqkRUrNsPHkVBXnX0Sn9a6tckfvGpdK2iyFOld/gnDG9oYJNpg3zPhD+zcful2YQ
         YjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550201; x=1790155001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6hU/GP1FtIfUUKp4semB07auuKYgomg3/U1as99ctQ=;
        b=L1Xby0CgxkcvA//QMFRq65kB+h2R6H+KTbAGTGk27j66hnq+u62TgOru2vAaGlRiOS
         5q4bGVlIA9vOWr5U9S15brmNnO1NN3cU1tBYh0ShQJHXNWojCFyeOyFpPpCv+/OVfhi7
         Qg2zx19TXh/BZnNvQhWrEfG/xdaxT7BqI9Pgm+v3qUBAWUyioPUqtm9CJi/xcjrFQp4z
         04YV7fEIfxjnj7zgkN25jhndLkQFcjRfXTHZanH8Z+iqWcM7up0W7FKtMaN3u4lMQxc9
         WEvbPHb19ISynPwKdBNlV8E3C6I9dKvJ+ia313D6W+eUeFPyFWja4KbZw1U7Vx25g53e
         /Fwg==
X-Forwarded-Encrypted: i=1; AKwUvBxH4x+ogXh41UvcrlqDLqvqWIs893sVlt5goH7IgQnGr2UwDQuO9pT6IgveRfmr/bZ+UJ8s@lists.linux.dev
X-Gm-Message-State: AFuF++kZmDDtu+Z89MTq2pshv6J4OrRc9UzA8+KH9xswJ1P/OKDuSNVE
	tHwIsIcsiEQNXn89x4zEmyZOOq94QtIbA0+L5GGawL8PzeUNt3E4UV21
X-Gm-Gg: AYBFou3qz0ygXIKgx0tHmuX6Tb6VRThAToThwWdKMB3q0IQ7mxPLIf2o53Nqc3DDo/1
	fZQtyDDTj8Zg0cWVxkHhEZYap+xaIMzz9Xv6lhelvq8RTQCRgmncOiTc5TBE/06o8gNVYWN7g16
	vVaUG8t67D6665VWHNnd+6lpX0KiWXdwpxQVNZZ14jaA4I8zgC4SypX+LLaYDPojmjetIOpESPC
	35fs536NQrsCVRa+qT7jgkSiVIEtu6z2JFugTV59SYjRApSVbMAETHLrM3oEKBI2y+juwxoE5Wv
	X9F9CmWf+LS7Wdyo+l9LlHEoxpETEziG9FqKykbnTEyUiqaXQrbCngKQfW9BlsR2jHxTPzUAWVc
	9pzV+Ln/T/XlxOwDSLBg1dUSvPu7DdE4105n6w+T8/kGdDlbF88NXKA6RtO0FYGRwobvl3BAWJF
	a2IHai/jpuRCXuHFRQA3dBmM7Xzg04MbdRKFQKwlY1+8m6L23EYPM003Oj26NNHKovWizJVpech
	y6RvJE3ZxXwtDMdQQ==
X-Received: by 2002:a17:90b:4d0d:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39e1e27b244mr4153452a91.4.1789550200800;
        Wed, 16 Sep 2026 02:16:40 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:39 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v4 2/2] Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test
Date: Wed, 16 Sep 2026 17:16:13 +0800
Message-ID: <20260916091613.78352-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916091613.78352-1-kunwu.chan@gmail.com>
References: <20260916091613.78352-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the synchronize_srcu_atomic() fastpath instead places its lock scan
before the grace-period anchor, the scan can miss a reader whose
increment was already visible before the anchor.  That reader already
existed when the grace period started, so completing the grace period
without waiting for it would violate the SRCU grace-period guarantee.

This litmus test models the reversed ordering, with the lock scan placed
before the grace-period anchor.  "seq" models the grace-period anchor in
->srcu_gp_seq and "ctr" models the per-CPU ->srcu_ctrs[].srcu_locks
counter.  P0 scans the lock counter before writing the anchor, with an
smp_mb() between them.  P1 models the reader-side counter increment.
P2 models an observer that sees the reader's increment before seeing
the anchor.

The same outcome is allowed with this ordering, and herd7 reports
"Sometimes".  The litmus-tests README is also updated to describe both
SRCU fastpath tests.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 19 +++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 52 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 6c666f3422ea..4d4ec9c6f2cc 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -78,3 +78,22 @@ RCU+sync+read.litmus
 RCU+sync+free.litmus
     Both the above litmus tests demonstrate the RCU grace period guarantee
     that an RCU read-side critical section can never span a grace period.
+
+SRCU (/srcu directory)
+----------------------
+
+SRCU-fastpath-anchor-before-scan.litmus
+    This models the synchronize_srcu_atomic() fastpath with the
+    grace-period anchor ordered before the lock-counter scan.  This
+    ordering prevents readers that existed before the grace period
+    from being missed by the scan.  See
+    SRCU-fastpath-scan-before-anchor.litmus for the reversed
+    ordering.
+
+SRCU-fastpath-scan-before-anchor.litmus
+    This models the synchronize_srcu_atomic() fastpath with the
+    lock-counter scan ordered before the grace-period anchor.  This
+    permits the scan to miss readers that existed before the grace
+    period, violating the SRCU grace-period guarantee.  See
+    SRCU-fastpath-anchor-before-scan.litmus for the opposite
+    ordering.
diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
new file mode 100644
index 000000000000..7df0641b5470
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
@@ -0,0 +1,52 @@
+C SRCU-fastpath-scan-before-anchor
+
+(*
+ * Result: Sometimes
+ *
+ * If the synchronize_srcu_atomic() fastpath instead places its lock
+ * scan before the grace-period anchor, the scan can miss a reader whose
+ * increment was already visible before the anchor.  That reader already
+ * existed when the grace period started, so completing the grace period
+ * without waiting for it would violate the SRCU grace-period guarantee.
+ *
+ * This litmus test models the reversed ordering, with the lock scan
+ * placed before the grace-period anchor.  "seq" models the grace-period
+ * anchor in ->srcu_gp_seq and "ctr" models the per-CPU
+ * ->srcu_ctrs[].srcu_locks counter.  P0 scans the lock counter before
+ * writing the anchor, with an smp_mb() between them.  P1 models the
+ * reader-side counter increment.  P2 models an observer that sees the
+ * reader's increment before seeing the anchor.
+ *
+ * The same outcome is allowed with this ordering, and herd7 reports
+ * "Sometimes".  See SRCU-fastpath-anchor-before-scan.litmus for the
+ * opposite ordering, which forbids this outcome.
+ *)
+
+{}
+
+P0(int *seq, int *ctr)
+{
+	int r2;
+
+	r2 = READ_ONCE(*ctr);
+	smp_mb();
+	WRITE_ONCE(*seq, 1);
+}
+
+P1(int *ctr)
+{
+	WRITE_ONCE(*ctr, 1);
+}
+
+P2(int *seq, int *ctr)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*ctr);
+	smp_mb();
+	r4 = READ_ONCE(*seq);
+}
+
+filter (0:r2 = 0)
+exists (2:r3 = 1 /\ 2:r4 = 0)
-- 
2.43.0

