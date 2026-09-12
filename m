Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B301FBEA6
	for <lkmm@lists.linux.dev>; Sat, 12 Sep 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180975; cv=none; b=QGK8dfWpiZah1TO7vOyS3i0Clkzp1Rz+ps8177ksuiMJZ3O3wSFskAmHSCwCvCNZsd7wJxtqEWqXHTv+BRVfzhQgYyxJlDz0Mqu2sjQENNdNNA2+3sgrnLWALjy2WLIAcSM3ovZQ3tP7rydsmcm15Po8GinARz2hDuz6ke5eg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180975; c=relaxed/simple;
	bh=yIOgwWYaZtGZFD7XRrXRqAp5oBf5PZvCJzw4s9fhOhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnOWdB9PyVp/H4KkTh43BJsfas6eLqsl7WVGkYxxYIioH3FuCntwYXy9aibeHjY7SUaEsHNnxbRekuS2dWk6Bwg3478tjRIzVaQLyRBkv+V3sgpoc2bWCGwPdEW3LTzcTEu7hhidG2YEwzU5pnp7vo9vnDG+nXzYahJLWR+AQNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3crpWEb; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3crpWEb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so439656a91.0
        for <lkmm@lists.linux.dev>; Fri, 11 Sep 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180973; x=1789785773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=A3crpWEbg66Sey2AQseINW/eCEPAviqjFZpMKqrprVPBcm0A2+3IrBlchqmiNSZOpD
         /TMQU6t2KCUBtyc6CQuBCAPM0ruGsOMkOb95zAjwHA5vNWfwMHHcLGoaOIF1/HRdsu9B
         0pYeQiUXRD8pemhsiovaCQRGY11TnO3AC4nV3LEdEemJfLfmC2WVgzrPiNpSgbdDlmOM
         xDTxskhSvqJTYqxiH0OsIt+XRqwXEHYxyOnLfwWCtMrVcK9t8XpUT+z/zO63xZrA+2Gm
         BrnqrdBIR9zRpmmTIwFpGfUnJvf0LhWW1SHz2mmjobgNYa1BWFL/1ZAKCFIPnqDe+L4u
         bi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180973; x=1789785773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=E54WQ0aZQXWPUGlfa7+9wpTCQkONfM1l75CRWiL1KtJdvMazwwXhK3dL3xGlxGzBy4
         fctfO7ktyABGBKK/V6ZNZZwjkp1JFD8nebeb6WcsUxT2RU6McC/oIuUGgtIC2XabIYzW
         Bnyw3MND4JJXfFVVfp8mQezne/bXepDlYinZsJW+vKDOFxw/Ih4TEX51lBSZGtvK8srU
         wss6Ab6ne0w9ht3oJ9AA4k3d1eL0Z7XNBr24oCBvFYXiE5OMnx3hh2X97YmWxwSll/Sf
         MOKIlWLCygQdaDeMSHFYNe8u/vWeTU0oGd0nWpQJIsG+a+lMrIyuoY2bcbxDrc3wRJE/
         1iKg==
X-Forwarded-Encrypted: i=1; AKwUvBxwi08oufKyUXBGT4QvVE1P68iYni40reU3n8UXST+tgj0tkwKz01MNIDRlXpRBZ8H4/8ZS@lists.linux.dev
X-Gm-Message-State: AFuF++lGCpa4sFsvYYwE1ptqNi2+hWrCgq6e7Gp85MxsPbQdaUUYOo+1
	t/K2wtvuIpQjJbJWvT/CE9vLxznTfqZ0moOOmW/RPGo+cF8HznT+b+Il
X-Gm-Gg: AYBFou30kZPaZyzP8yJODkMiowW3nXYI1eMHkM0b2ShwmdD2xk6TdOv1KHpdE37u51X
	+4BlkOUJXyQ5cu3nlfJyTS4QRAIy+qvs8QvRoIFme60qd7TCHIxdYtEuYf+UbywyN6oONyA/Lxp
	FnMQjpStthSMtTVyB2TUGkDXkvVYTDuUPvk92HzaIbgnITXzGZxeLQGawztIaAS98MblbgMb76m
	KOIuWqujjhxnSIIHCfX3Z60DpZdkGCL6uK0HP9C4utwo5PCdtWcwXGsIybbxvMZ7iHaiI5Yw+6y
	9g9/cQZKyc/kcMLQO4AlshuUxobkzQyeDnVqc9HoQ/pOhF/6eq78WsVklTgg9qmAkPo88ZlhmrT
	QNWkPqV8ajXKcUM20WT0Q3wA35Dvommnk/8TE67gn96qJ1jkKFDk+s/+c5y5Asnq1WpAN62Rgvx
	rDnslaHpnfrBAQwHbdsgYyXNHk0nxTnem9Rz4ly3VADqjQgPd9MKZmjfNyv3KFzWicPSv7pK8LT
	Hb+cBXL85n6ms/3Lw==
X-Received: by 2002:a17:90b:1f8e:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39d9bd9917cmr13284613a91.8.1789180972076;
        Fri, 11 Sep 2026 19:42:52 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:51 -0700 (PDT)
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
Subject: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Sat, 12 Sep 2026 10:42:24 +0800
Message-ID: <20260912024225.2872265-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912024225.2872265-1-kunwu.chan@gmail.com>
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synchronize_srcu_atomic() may end its grace period immediately when
its scan of the per-CPU lock counters finds no readers.  Correctness
requires the grace-period anchor written by srcu_gp_start() to precede
the smp_mb() ordering the lock scan.  This ordering ensures that any
reader whose lock increment is missed by the scan cannot have
incremented its lock counter before the grace-period anchor, and
therefore cannot be a pre-existing reader of this grace period.

This litmus test models the key ordering between the grace-period
anchor and the lock counter scan, where "seq" models the
grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
smp_mb() and the lock scan.  P1 models the reader-side counter
increment, with the smp_mb() of __srcu_read_lock() following the
increment.  P2 models an observer that sees the reader's increment
before seeing the anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..efa9c0c4e047
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,57 @@
+C SRCU-fastpath-anchor-before-scan
+
+(*
+ * Result: Never
+ *
+ * The synchronize_srcu_atomic() fastpath may end its grace period
+ * immediately when its scan of the per-CPU lock counters finds no
+ * readers.  Correctness requires the grace-period anchor written by
+ * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
+ * This ordering ensures that any reader whose lock increment is missed
+ * by the scan cannot have incremented its lock counter before the
+ * grace-period anchor, and therefore cannot be a pre-existing reader
+ * of this grace period.
+ *
+ * This litmus test models the key ordering between the grace-period
+ * anchor and the lock counter scan, where "seq" models the
+ * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
+ * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
+ * smp_mb() and the lock scan.  P1 models the reader-side counter
+ * increment, with the smp_mb() of __srcu_read_lock() following the
+ * increment.  P2 models an observer that sees the reader's increment
+ * before seeing the anchor.
+ *
+ * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
+ * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
+ * which permits this outcome.
+ *)
+
+{}
+
+P0(int *seq, int *ctr)
+{
+	int r2;
+
+	WRITE_ONCE(*seq, 1);
+	smp_mb();
+	r2 = READ_ONCE(*ctr);
+}
+
+P1(int *ctr)
+{
+	WRITE_ONCE(*ctr, 1);
+	smp_mb();
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

