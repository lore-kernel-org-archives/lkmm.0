Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D138D6AD
	for <lkmm@lists.linux.dev>; Sat, 12 Sep 2026 02:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180981; cv=none; b=ZocTRPkagyihkB0jFe69HE9o31+nvM/SSh/2+rz9lMnL2QGv5G6ZDe8ToOiNLFqyB5JPK/NHJN+rUHgiph4ktdGK3NaZVkVRaavIl/WGa0esTdOb8+JD8X25aWIirMKRSoGFb557WZMDgJk27vGPzMLEgE0enQfUK+73/b4UOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180981; c=relaxed/simple;
	bh=uK7HAOo0XGA640EhrLFvGJWqXs75fzhrrXXDy+FcH+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3AgylKfDldYjwqJL0hiuPB3llrzydo6bhIWZhGLbzMQPCrnLnYY4BXwtnJyd1RRBQjm8aMfQ++MpcZ7l66DrtnDaFqD8DFrHxamMp5+9Xsysw3LPhOLSKLVaqXA6zNtFpSa/0kvHbUg/M6A9Fe2nVPyc24wujntexj53AA03ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KG6CoBFF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KG6CoBFF"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso443468a91.3
        for <lkmm@lists.linux.dev>; Fri, 11 Sep 2026 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180979; x=1789785779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8y+2G0lbVO7qrpdZ9gvoGNdOPIses0q/HemIii5KS0=;
        b=KG6CoBFFr5hgo1TvhWEqJQ9hePCLceCwbwXfu7jtExvC38FsLCKArQ26p05xzCH5Fa
         9UlU+ve8KcodaRdtf6Rb5w7HAgtSYF6xU/FvyTlPnKfSzAFYqkoy2ZgLylb5cHZ/PaNN
         FPHZjIXeGfOHQPwfGkcBJVoF0iDb6Lf3OSpclOqN5chb1wrzzQ6dtE0nmit2hBu8/7e5
         LVRWBaUh5ZGuOb4SFkYD0ZMQaZDPCsPJh6++aDPu2wgOXf174iQCvBtQ2U/o+W9Q57my
         EsgTIh2uYLAjkE3nLFd+z480rocXuKEAED/L4jRfRaM7Y1i/MMNs6lJvdb/Db5IZiZSo
         GRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180979; x=1789785779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8y+2G0lbVO7qrpdZ9gvoGNdOPIses0q/HemIii5KS0=;
        b=kPEg9f4d/DCA3TPOAhgyaPSIaPfKvyMQutT9uozFJgx/9egBQbX930Z8GU4CHI5ZiR
         7l7+1UdgTOIRfNSiJHvEdyN3ezf56NQSurkggd6PqMEUVf4Xohfs9YFFl9LNO4PErjon
         pxWSqX8JUua0pq/bN0ykgY+TlEFCKTmvOJLYCbngkpv4Fov1eFwQajRyVxLhlygAvk3g
         S7v9Isb74yoPyuFugZMtZSh/5UwyU78AD+GSZyOLRhbGudjOOHAuMXKtqtQNCx0ML4bU
         bkA6bqPi75W8+GOdHrxr96DazsJ9Wb8JYEVtARRIBO/pNA9BvkIYIlIOQLLmTDm6/831
         ui8w==
X-Forwarded-Encrypted: i=1; AKwUvBxYY/MwAJc45MoJJJP2VK3U0mGMbFc0iB58OqADQoat8a/2+Pj1STitCjqxPr8KjjdsrFnl@lists.linux.dev
X-Gm-Message-State: AFuF++kyD7jxDzNI6wxFKAE8gG0ToOrXfD9NS/NmlIh1R4jgSMddYcRW
	uqO+PMdacTHaJJV5BfgaPAVL2MqUpWlG5+m7QmECWSNUJ7+5pE7chMCn
X-Gm-Gg: AYBFou1ZP+qi/AlcM0agq3jMwmr2rIrkYiBBaHSxVy0Lsl1z0m+mYOdL/pB3/x66viV
	aQsUi7FIDzGZVH+bshicSS+49w/6BywCm2iY57xhT1kfkWkhIs35x53eEwxnl2KguIiRQn3iu/n
	aZ5vDayjeVDyaC9QjcOKoqGYRRByrAu0avqSR3eCXIrbuGMc6brOkw1suDEdRJrV5Azt/Gcj3Wz
	DNX0iKSdIZ1WylE4wgyVjShNYWKxMyDKt45Ec5SEmBrTnIKW/4WFw9i8Ur7b4c+93EeDJKjEBsN
	4nTpe7VSCQ8xq0bhXwU2QtKJuFttek9Azz2Mh3TDOsTniWjJbjUhX8Kkl6fItin99gkLx3SKipU
	wVJZ8WHNCdp6yz7tZDhUX1XF0f7sV0QKCL3cwUMCZwoxHTggqeyp8V6I/l7D2tyUZptApVuIZhF
	p+IFKd7SszxywYCSGoxMD8c6BC2x5RFK+S9Ca1L1S9PHLg2MxcCcwNu99oqWD1513nK/Fk5MaV+
	K/oOG9LAV6N6DJluQ==
X-Received: by 2002:a17:90b:4b90:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39d9bd99cd2mr10275855a91.9.1789180978938;
        Fri, 11 Sep 2026 19:42:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:58 -0700 (PDT)
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
Subject: [PATCH v2 2/2] Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test
Date: Sat, 12 Sep 2026 10:42:25 +0800
Message-ID: <20260912024225.2872265-3-kunwu.chan@gmail.com>
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

If the synchronize_srcu_atomic() fastpath instead places its lock scan
before the grace-period anchor, the scan can miss a reader whose
increment was already visible before the anchor.  That reader already
existed when the grace period started, so completing the grace period
without waiting for it would violate the SRCU grace-period guarantee.

This litmus test models the reversed ordering, with the lock scan placed
before the grace-period anchor.  "seq" models the grace-period anchor in
->srcu_gp_seq and "ctr" models the per-CPU ->srcu_ctrs[].srcu_locks
counter.  P0 scans the lock counter before writing the anchor, with an
smp_mb() between them.  P1 models the reader-side counter increment,
with the smp_mb() of __srcu_read_lock() following the increment.  P2
models an observer that sees the reader's increment before seeing the
anchor.

The same outcome is allowed with this ordering, and herd7 reports
"Sometimes".  The litmus-tests README is also updated to describe both
SRCU fastpath tests.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 21 ++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 54 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 6c666f3422ea..076a6edd70ff 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -78,3 +78,24 @@ RCU+sync+read.litmus
 RCU+sync+free.litmus
     Both the above litmus tests demonstrate the RCU grace period guarantee
     that an RCU read-side critical section can never span a grace period.
+
+
+SRCU (/srcu directory)
+--------------------
+
+SRCU-fastpath-anchor-before-scan.litmus
+        This models the synchronize_srcu_atomic() fastpath with the
+        grace-period anchor ordered before the lock-counter scan.  This
+        ordering prevents readers that existed before the grace period
+        from being missed by the scan.  See
+        SRCU-fastpath-scan-before-anchor.litmus for the reversed
+        ordering.
+
+SRCU-fastpath-scan-before-anchor.litmus
+        This models the synchronize_srcu_atomic() fastpath with the
+        lock-counter scan ordered before the grace-period anchor.  This
+        permits the scan to miss readers that existed before the grace
+        period, violating the SRCU grace-period guarantee.  See
+        SRCU-fastpath-anchor-before-scan.litmus for the opposite
+        ordering.
+
diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
new file mode 100644
index 000000000000..4d3bdb14d888
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
@@ -0,0 +1,54 @@
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
+ * reader-side counter increment, with the smp_mb() of __srcu_read_lock()
+ * following the increment.  P2 models an observer that sees the reader's
+ * increment before seeing the anchor.
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

