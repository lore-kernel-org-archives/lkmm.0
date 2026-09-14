Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A7480DD5
	for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396815; cv=none; b=DfAtXTPsNrO4EwEkXKf6Yb+bV365LP8cJlRMn+Z9GJ5+RRMvI0kpJarOeJg/J2JktDuTBIWk1ckzVCd4mFu6zPkUn6oVzka6h2ZRz5/CQGLdNFKUzI9f0GUQcEHTDU9tv/fQYdvy4+/x3GqFiOLWQ+arlY/l7KUQoCvlQmQfHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396815; c=relaxed/simple;
	bh=PchcDlD3Npn6+8wPRM9VRYzNcIBmakxNDUNZLTTsXSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbl2zjSUeTzde1UF36EWiN16m3X2l8XtG+vULJfqFiUV73u9kf/T2H5yEY/NPD20lzyx2F7GSKuSlcQwsgeDRQphlWf+7KpaOsJdHPNgPfWR/6K12W95v10DOL47T6vnErP8JTz+HiKfewDmN60Ja20h8hYmaDmd/Cue5uln6Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaojXmS4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaojXmS4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbee846deecso4524779a12.1
        for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 07:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396811; x=1790001611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kBzFP/HpzVRM8R641fR3ZeSCydIAXhP1zBP9Whsejw=;
        b=YaojXmS4eg07A0y6hXrgmmLVI3M1bN5/4Kio1xLj/nQbYndiYc0yAdOkOIDAFplKIX
         0d1ryeeGPI4Qc6DX7faWCULRsD2bC5qITMIs76/vHKfP6XOIP0g8DndPUioVfZ6dQzYu
         rKFNTeOVyXuv9MIeHPouK1Y76Ccqp+LtzW9t3TbvkPyYw7BqFnLCk4UgIyG0KawyUw0a
         MgPqU4DFZelbSsV3RTyaEQNTuduHnkX+R0kqBQiMsWPno3pCE5+dO5ziL/ULBpUEjgTV
         vwB11qCzK4T05wZzboQ3lyUjfIBTrg1QHltYqGr+0PUDRPdzTBmBLMg/9xNlppC1ZLjK
         5ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396811; x=1790001611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kBzFP/HpzVRM8R641fR3ZeSCydIAXhP1zBP9Whsejw=;
        b=I3PbfvZE8oz0PsnXJ3GHE1ER73PjdZR3nAhp+Vxb0fXcgXwMYDRH5lMhPIWp1I2JiD
         z/EK0UJ5iQQdNVnw2tVJDXqLs814i3TZNS3iQVuHvnFBGWNVqhYvKbO3sR02ETovZ3Kj
         fQMbYhRzyuyyZanxK67x1yt9HtQRp8NX5w7FLl1SHoO6aqKU3u7N9z1xMOA8VOgqAPl9
         eYFSUmC5H3h6u1eeRCOlBepPgvdpBLq7PrzmPI2FwM6lUxNhsNUoIdqrnz9U396s8vdy
         C3xejkVW92L91HHqCEz/osFq1o3hCOLMSPzzJZroQZtQXiOtAWs4O0dq4rWHctag5fX1
         ZsVA==
X-Forwarded-Encrypted: i=1; AKwUvBx/fkcHHjaXBs//5hTQkBEtuN7KznrKeW6Jxk8CPsDFQkFUztpmOhrWFUUQLh1MVJk42zdz@lists.linux.dev
X-Gm-Message-State: AFuF++lphgErXmdPa+3EXx+9zbWekAhzCUhZLaO+ZYFQr2s2uoB6KUwT
	dRMWdxIcau/30B+NVwGHzaAE60hX8n1mkBiZ36wnP0Q0pk8OdO0ZdITc
X-Gm-Gg: AYBFou0Li5u6bwhHgvw9+FP1V8kWDwsWLcue81RM/vW21JG/xHAAHiiuIhKLTUH60Hy
	QLGqUn7aAeWsL25U2QPtjq4My/m7z1wLzhUxplMOJzvppxqT9HYar68mNA028yIrx6/4BIQxxUS
	V+0mEOgmaUlJ59z5IrjbDvuNXgXWlzpBMSq7NSc4nH4NN4S7kPvaxNQGJGQVWOv6c+/aqZWBe59
	z1wekXdwHmXQku+pg3FJttlEyx2VvNSKpSWihcbVy7xmhgI7Aa8G8inlwJygt5ERJv0Z9muzlQz
	anGiQZf70nhel5llEwsm5xH3Jszc/aDOjM0RIFV7Z+ATcmI07NZBmQFKJKwcuxvl8/wKqIYdPR3
	iLpZ5yh6oTMFE9tSc9PQ79sXq4fBPJku5gUsQwcOY3sKYKBLrMo/KYZLa5upVAA9rxEnnLC5USA
	a1+H/D/nHK9ONO6i3elx2PlVBOgVI59EaBUPND2vi+ynYY5NmUg9lNiHWc/mo5ylFL52W1VE+bW
	GPa2Mbjnbz2Gqr+RQ==
X-Received: by 2002:a05:6a21:4d06:b0:3da:e1b5:2baa with SMTP id adf61e73a8af0-3db404b4e1dmr6402183637.2.1789396811120;
        Mon, 14 Sep 2026 07:40:11 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:40:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test
Date: Mon, 14 Sep 2026 22:39:42 +0800
Message-ID: <20260914143943.1503066-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914143943.1503066-1-kunwu.chan@gmail.com>
References: <20260914143943.1503066-1-kunwu.chan@gmail.com>
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
smp_mb() between them.  P1 models the reader-side counter increment and
its smp_mb() from __srcu_read_lock(), which orders the increment against
subsequent critical-section access.  P2 models an observer that sees the
reader's increment before seeing the anchor.

The same outcome is allowed with this ordering, and herd7 reports
"Sometimes".  The litmus-tests README is also updated to describe both
SRCU fastpath tests.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 56 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 6c666f3422ea..f96eeacb002b 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -78,3 +78,24 @@ RCU+sync+read.litmus
 RCU+sync+free.litmus
     Both the above litmus tests demonstrate the RCU grace period guarantee
     that an RCU read-side critical section can never span a grace period.
+
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
+
diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
new file mode 100644
index 000000000000..d8808571063f
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
@@ -0,0 +1,56 @@
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
+ * reader-side counter increment and its smp_mb() from
+ * __srcu_read_lock(), which orders the increment against subsequent
+ * critical-section access.  P2 models an observer that sees the
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
+P1(int *ctr, int *x)
+{
+	WRITE_ONCE(*ctr, 1);
+	smp_mb();
+	WRITE_ONCE(*x, 1);
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

