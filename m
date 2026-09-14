Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA754481256
	for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396807; cv=none; b=LdxvQc3MRmr4WRcYrtL8f2MfofjvRAkQamBKjAiqACjbeSwE24tZjlq4kzBQeZruVBXhNXq+CU46e00ftLSCQDHESRHimkaqwZE6WY3Ofdk/F86pHbY85X6PKZh2Q0qSOCOoQoelFG+whZjDKtTa02DuowxJ2OqU+RkPRrH6OVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396807; c=relaxed/simple;
	bh=OxFt4akoNsEexOq08kiv4ugMYoiwz392oGi34kiEw08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HycyhcyClxUYiqXXntJgls0Z0NMH3hrlnJQf3vAkjRAVbsn7MmUyWFIyFimr8MKsb8jiZymHtD5f58lekiB9Q0o2tf5cSujcaUDhnqu9gmg955TeOES17YDkXtEosML9maDZ48G7QJ3ABw5+1ihbxMDxbhsi31hnRjiOGtYX/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gprGzBN2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gprGzBN2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so1595849a12.0
        for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396805; x=1790001605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn6DJj3lF06ye8TRKy/PBnP78dAx6rrnR2CCLvj5EOE=;
        b=gprGzBN20mOhSzeNvswNqneOg+z7SSnpU9oHM8gQ7v8LLTdDOaUURqQhNucP7nVQCd
         S4rjXat8NV2slFvYo2PTVPHapYpeVIINHD1D8oIg2ygq+zjkNX+/kHIQDv4KWlz8aq+c
         3H8F2ucnytY1cBLuQAlLcDzkdVQ4PncZf9FqjEwFENQFhV2dSReZAgbrW/dFQzem6Y6o
         mYjlIaCWeduOVFsUhO8ls3NlUzs/F6hbnv442496O0YYyggv3tQ+tnRTBghD2D9BNSEq
         mRsQCHd4A6J8UJcwYgP3ZmP5OUT2AcFWb4u8WtUltdB54J40GYyXv9eXlm5vdLwG2LuB
         u98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396805; x=1790001605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kn6DJj3lF06ye8TRKy/PBnP78dAx6rrnR2CCLvj5EOE=;
        b=BbPsEqhRpB5mN2GOkooAQ4hxbT4Dv2pJq7lNPyDLb3oAS941mhb1A7jS7pl9bIGAoV
         5BbcC/sMIIGGnsWXCxOsAJzgVI8oVONgOvmrjjvsumlcH/J85dQ5pXJPqX9A4js1Bick
         KzMTzz+t7L53olItzG7RFEsgOcnynLSCcme8IYreRFcmDdaptXkVHNY7+AdE6zHahwiO
         2pY9ZVXpnlmUjs1cvmxVP1y/FVyyXhvAqeVGpdU6GuqpIdxNIjgbfaO6qnVq8pKrZux/
         ppO5JWvrOAy4lYC/gJqHnOz29Mdy5ovtqUojtPMQu2rSObFY48UJkYIbp/BHya83g/kc
         xXDg==
X-Forwarded-Encrypted: i=1; AKwUvBxW5oWihdpN9HqAkYt+8pWTYixUeBYMLqmcrGU3IvcenerpFlf719Bd/WxJRuqg3MWrrqT3@lists.linux.dev
X-Gm-Message-State: AFuF++naVieywI9gQqmMfs7n3qmV4L3+AnqGhfpeKV4pKZrRX5dItwla
	gpiG9nvBMWy/nbioDr12tPp4BoHs9YjPAOfS05QYgxLcI3y6y+L4m6sz
X-Gm-Gg: AYBFou1eew1hzr+sDPPfe9Xc5ownvQENk6MmaE4qyh3CSSiTUlC1IZnh7XPju9Iz+DU
	4WjkWZUk++h2COEplBOnm2ATomX/3U1c69ayUx7Q2+iJk7MpnM3E27tw+K8jnnPQSZE8Phz4V4g
	EXCvC2XH1V5Vd5FMshFZ+AGIoVMNpQcJdyXAxfeTNxlfvz4JWE5H+CvehfQaZOY8uDV1dd8Hqij
	8IuR2SibCANjo8rlCOgf/WszumD4SjzQ/5S3B6mGORVjOgzmEnPrTjs6mrfVR2auuS82TyqlhMv
	g3MfnW571+FecbiOM95TeMOpxyczRVri6F4NMUDLQiZlQOUn+wCczsR0aBXwlZUL+rBO242lR/L
	ilWj/8SXPY7OJoxsLS4eoTFDYRIFqmtSAe5VxGj4Ed8ZP9NcxtuNyfFZ3fMhBr05xYpHAt2cuU9
	hW4jkxdlMqNYWsVOKhhnCIyWL8BhETDNucD3N3G4U0M8LbRrZPx0AjE6md+NZQlXhWrl3cigNlQ
	u+orHUnAnB9yUMYDxN48vN0PBazGw==
X-Received: by 2002:a05:6a20:728e:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3db404486dfmr6684782637.1.1789396804818;
        Mon, 14 Sep 2026 07:40:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:40:04 -0700 (PDT)
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
Subject: [PATCH v3 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Mon, 14 Sep 2026 22:39:41 +0800
Message-ID: <20260914143943.1503066-2-kunwu.chan@gmail.com>
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
increment and its smp_mb() from __srcu_read_lock(), which orders
the increment against subsequent critical-section access.  P2 models
an observer that sees the reader's increment before seeing the
anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..e0492a4d8e07
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,58 @@
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
+ * increment and its smp_mb() from __srcu_read_lock(), which orders the
+ * increment against subsequent critical-section access.  P2 models an
+ * observer that sees the reader's increment before seeing the anchor.
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

