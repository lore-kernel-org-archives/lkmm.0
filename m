Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA08E50129B
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061048; cv=none; b=R/g1j9XB/AdY55J5gsk7vP7CV4Lo9ojXUSjR9eonWfFihlN2OcuQLvxdEdRoTbk+dNmkwvlMkKz/8vJf8rOTAOu+MIGd1kquX+p0uh5UceCbFUh4CYmQOfkl//3UUDoNyz2oSDMKutWadGdnPJvaaFZ5Wlztpsa+reqg0c7UKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061048; c=relaxed/simple;
	bh=JeXul2Nkf2zeS2OWaaoOg5njiRzZPTKUOP2PjjDjokQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/YLwmyvjhJymnzZDFLfw3JIPRm2HAmf6kVgdciT8OcxYMEebu1ypcHa2BwTMsm5iUtBKx+wfuhHSU0HdydJBKeICqQ83SKcnnsfz2tnzkQjDXzE1MQKlGxqs1YYpgWb9afn8ntRwbU2Dvxj2Vb84BI57x0LbnyJQZHODUTalRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7IymeyH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7IymeyH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2645181a91.1
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061046; x=1790665846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM25rpREpN0YJ4vGmgefvM6EGacbAogSR9saanUz1wI=;
        b=A7IymeyHEEXIfmsGc/i5MK5srQTC9gAkAtybG8pN+13Ws1v4pIrV/hZ0hioVyZs70a
         /SE2dzVDg+eunCzZRw8rzSKBc65D6forMMOSIlNTs9z9CgszUX51R+QR1esIs05+AB0J
         VXhyK87vgOY2q4h7NDd9ixgYxsxD1H4h4KL1X54iBdVLPrT6bU0ZiEBtzS2NbBWmaypt
         Oe4ytRACQPKT2V+lEWkYTHup8qxc218gHF8cxkFeNNa2ycXxE6lvDghL0WG0HQOcKxzB
         aHShUyPzgYfKwfZxLaPQ25hVd5YYX2q862NDdKR3wzKWWlUks/rhe+KF9tNnXCaIeoNO
         n+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061046; x=1790665846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM25rpREpN0YJ4vGmgefvM6EGacbAogSR9saanUz1wI=;
        b=ZFwM97t6spRFGu1fB9Ha7nqZckIBb5vPxPSxQERDUvgccq8q4xopWfa0B8FoGtY1Hv
         5sEDnR964XH0JD8ZWOJAJW5cA9+abi1JlcjAWNN2P92ijWi4t2GDys5TOu3Y6lw21iL8
         xsEnEoNUv+35aq2dTzk+PeGHPiXKM2/J2JeRhLEHE38GrvzLlq1OV8PMG7BbH/u5hNFO
         McvNUU428oXoiZVyZ5BjZqidNvwVgB2SU95MTNfFT9QBh3bJLmQASHaObe0tY3btzyuq
         GR3moSsk1D/Ivo+GzHWTUSuzzUUP4NUp5HpTM1K1E4RWxIT59JqrDRDseBVoNEgpVKiX
         RS2A==
X-Forwarded-Encrypted: i=1; AKwUvBwvva/Z6fkC0N+rqktmOAPu/HMAR+4lOgknTnpiOrAClbJ7/vVZcp63kZkhXDlolMKBJv8/@lists.linux.dev
X-Gm-Message-State: AFuF++m58WM2TFOzU4XZmOaD1dZQzKbDR+e58NpDUa2uSP5EaXo8xc6k
	JxMULZUsHSFYQ8j2YdBEQdTZsIWwxNigwVVz2OIhC8t20RIIa+QvHYiw
X-Gm-Gg: AYBFou3R0NZ8ewYIwRqRhx0XBZzRHFxx1QkddEBceFtJNhVCi7AF0zxVCQrkES1VBLg
	3dbJz/zMEzAUNUocByuWH+1GaRpyPyXEHBtxIenmv2icxCG2qN8bzNBNZsI2zXZ8Cxy0OZMcdDG
	Xon4Dh/hHIDUnx4CI4HHOd4tHQkKQEstbQ7oAMx+6SoFlrTwRlfJa07DyhD0TDTxwDHRTEsBNn8
	r4Tq8mopgPyF11Jb4HKnGvbpkSd0PnppfXYAEyZaTK70mM5P8SYRmGxEl+KXE5uVLNC8Q7NUeep
	pXgK59fU0r7gSCMtRR207j2obinxRjUkElyRdX8ZTyadlTp0tIF2BR00VAFHJ85zL6gMHDVo2Wi
	L9JdPU8Y9gYjND+TdZbMbQJ8y/CM5JOECdjlSZs9UZd1NBco5ZjE/ApGzqwTr64NzxAWgeTfAS3
	TfySvDIhD9dNJHTycMvS8xV/zwdUAC+nVa89I4fYFGiY+bFXofVM24v8E6l/4wSgGpYJY9DcOkz
	4NcCCBCpmqQKIO/Ww==
X-Received: by 2002:a17:90b:58d0:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a07322a5bfmr239358a91.47.1790061045855;
        Tue, 22 Sep 2026 00:10:45 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:45 -0700 (PDT)
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
Subject: [RFC/WIP PATCH 4/4] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Tue, 22 Sep 2026 15:09:50 +0800
Message-ID: <20260922070950.4173245-5-kunwu.chan@gmail.com>
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

Add an LKMM test for the hazard-pointer publication protocol used
by the lockdep conversion.

The test checks that the reclaimer cannot miss a reader hazard
pointer publication while the reader still observes the
pre-unpublish pointer.  The smp_mb() pair provides the required
ordering.

Models the resolved-publication case; the in-flight wildcard window
is covered by the two-phase wildcard scan of the v3 implementation.

Verified with herd7: Never 0 6.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-acquire-before-scan.litmus  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..19df97f1c3b2
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,49 @@
+C hazptr-acquire-before-scan
+
+(*
+ * Result: Never
+ *
+ * The reclaimer unpublishes the pointer, executes smp_mb(), then
+ * scans the hazard-pointer slot.  The reader publishes the
+ * protected address, executes smp_mb(), then loads the pointer.
+ *
+ * The smp_mb() pair forbids the reclaimer from missing the
+ * publication while the reader still observes the pre-unpublish
+ * pointer.
+ *
+ * This is the publication protocol used by the lockdep
+ * is_dynamic_key()/lockdep_unregister_key() conversion.
+ *
+ * Models the resolved-publication case; the in-flight wildcard
+ * window is covered by the two-phase wildcard scan of the v3
+ * implementation.
+ *)
+
+{
+int ptr = 1;	(* 1: points to the object, 0: unpublished. *)
+int hp = 0;	(* Hazard-pointer slot: 0: empty, 1: holds the addr. *)
+int data = 1;	(* Object payload; 0: reclaimed. *)
+}
+
+P0(int *ptr, int *hp, int *data)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Store A: unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Load B: scan. */
+	WRITE_ONCE(*data, 0);	/* Reclaim. */
+}
+
+P1(int *ptr, int *hp, int *data)
+{
+	int r0;
+	int r1;
+
+	WRITE_ONCE(*hp, 1);	/* Store B: publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load A: load pointer. */
+	r1 = READ_ONCE(*data);	/* Access object. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

