Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AF49EC62
	for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550202; cv=none; b=YBtj3XHLw6XEjrDoGNux3zUKqz8u4K6m2sG/v+dLyghWTdqPk0MRwjBhLSbwVD/fu/T5ygUQl+lds6uRV7Sf/n+WBUPV4n2HnX6nrUFyZsHwufbBeFpnvhmmj6g4g+mvcVMBrros3NFcBM15VXzlttDWOU9/6OwMNvPi25rPyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550202; c=relaxed/simple;
	bh=6sTeDDjKSFvgsN4cu4tsIBYnWTn8JjdXtJLzUSVRVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnru3ZNugMIpauOtZIaCdsoHgmcFJL/JQbrFvYXYeTerobLLqrdsYdMiwT8i8bjdmjLEgj/LDO4tN0ZHNm/bbMF07pm9f9lJAfUuBj/iE+bNclMb+jan8MY+L7eHx3UbbzeMiFjUQZ9YbS63fR9cRb9evqd1FhXdmCt1fh4D+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfJVook9; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfJVook9"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe205dso411990a12.2
        for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550193; x=1790154993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAaYJ0cCHSkAupcV4TiiavIJbWVLvlaY/AF2/Kqu3b0=;
        b=GfJVook9P0+Y3QvScQLT8SUAyN6Xqp5FYl9sKWL3vgsca2SqdEdPw2OvXcHpeBzpqE
         /LcdhAgJnhx8h+tkW2mKL3xtjw39HSLOh4+gRE9oPO1fgj93WYTzZm9yEEZmmKCRqt2U
         OAfU1dlfpGgmmhzFeeflwtmeC/XeghuFzVn8fjzVYuzD6gPgYNoPhRq8hgAGThxKitLK
         SECLoZ+QmTNW7TCE8ehBlghoLFRxzCebJNe6ZbuK5DIntvFSFr2WV20hjvDzytqQPpGs
         R4LeeoNVlghjfur6M3TC8XREewerqq8o8hpOvZjdtKVCM9460VqxRT5InSCgyW7B0fR5
         5Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550193; x=1790154993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAaYJ0cCHSkAupcV4TiiavIJbWVLvlaY/AF2/Kqu3b0=;
        b=z94xTi+2Dag2wLRfTC31JRJ3QwROTcXMboG9fXFAMT/FgQaaAunwiULGjme0V0ZxqM
         zj7TSg8MndkK+2ze9xH5n7LDuy8xjM/cLfWLI3+Z6OGA1cHHS1jiqqNGWIbrNThDCBK4
         gfhEMT2/CDea7Q5TF7tqNd4Vl5BuPcNRfY6jJFCKwaIP+pDSZbrFrz2u0a2O3mO5dhP9
         B/bj1rbx/VNs6e8qNJ2zijmlNSaB8Nk8Mg6lR/f8kvrUNqHuD90XQYW/4Z3oemBfN+jo
         rTMExeXeT6kuBq/8CAhM42DhQy/j+A399+YAq1tvw36WQaxTOe8REn9hRCA7T6pBo3bk
         BDLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgn1bc+fjTmjqgPbGF5rB8l5hjrePLPdNg5iGg3mYBIFMU4bs8qXnYy1qxbrY9j708SSH+@lists.linux.dev
X-Gm-Message-State: AFuF++lbJattMHoPBoRg0xPy0AhIS2fu/XHjxJKplPAsV8Fh8xTPLc6v
	qaL9C8Cdvm8hFPk6wT8qPxfB0COhM+Yh9jE7zKfyuXCD/D5EHzk+VaDJ
X-Gm-Gg: AYBFou1dxCwua54Xs7l/qtdDjKWCRu8lxQZvkG87UXQ/vWnh1kQSX0clwsXRhNDPDmO
	ZsRvvj4oBz2cfQde3ZzgkwGBQD7pnBlfi0BzzDb3MSscEIP2ufpd9bLyRzFMrU3tYwvbnY9tR0J
	UV69R3EH+JfK6H0e8BFV3JM6ckllcSlrtkQO3q4OlTVJ6jk4U7jTL/Z4ntHJaMuwAtl8aME5k4H
	EyYwg0lmnY5vuDz+V2FvWoVC2UGwfDPK7C/2v4j0dS/yzJw3Lht6O0mmQLpo9b04HdijplAeI1e
	aYKdGMkD2nftlZvY6n6fb194HGWoPz+Ei7mRnlc9+14RXMMYKI1nneLJFDn9bANAvzreTOZQNI/
	rxLtZWt41TlqEOfpEO85H2yszjWdU5l07/86aUqoJyiZAr5/Mrcu3PWl7JjHs24CdWo4IrzrBkO
	8jKUlnFP35ihS264EY3F+DtUtj+udGWjA3lIs4TlVLQlGBmzEs4jNO9GdVlK55Wv2Ea9oARFPmc
	U2cArH+X5Kxc2rlIw==
X-Received: by 2002:a17:90b:2d4f:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1df86c10mr4712387a91.0.1789550193313;
        Wed, 16 Sep 2026 02:16:33 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:32 -0700 (PDT)
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
Subject: [PATCH v4 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Wed, 16 Sep 2026 17:16:12 +0800
Message-ID: <20260916091613.78352-2-kunwu.chan@gmail.com>
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
increment.  P2 models an observer that sees the reader's increment
before seeing the anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..8028f2ade733
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,55 @@
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

