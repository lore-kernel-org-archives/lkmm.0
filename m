Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93E4502764
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961081; cv=none; b=EPdgGsTXd24uD2O3O8XWyLILyKsAb3myrWosi8vsOOecS9P0C+xnJryj3ODBJ1ibmzY+sj/PbV5K3msKPPphhezfQgR9Gw1X0GKq7y7Rk9PW8Ywej7gkZns9XCzoqRggS2Wv+1EJy7c2KzeKu5Zsv6zk1pZXV5GevFEEXeO/l/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961081; c=relaxed/simple;
	bh=VRRvq3zLEbjKyIt2UhIB5bfMCL6WQ+2ygOmVvN1KkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSwhMACqszGdR9TMrvHLb1l9qw3sj7xSvQY6x5gJoZfUKtAh7gtVIqX5euLNspERTuM2v0r17dZddYteQErkQyRAciX9HGZ6rBvUjtNvLBGRN/M4/fv26Hnml5I6dE46BSADmHtgeUcKFHp8CZkHYIstL1PasfBnjjmXMZfVxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFT5KQM1; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFT5KQM1"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bd597d68so1999510a91.2
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961072; x=1791565872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=bFT5KQM1r01RHBSDmArVmrok/UxS2zQaEFv8VutL14ACqn3a4UCEMl4vNMjIXea7S6
         TDoFcJz7iK6q27YOo4eq3T0BoH+cETEAz1zAMG6gZ4M3/9JBhsveAUxfTTT7xdSrmWsr
         a9CfUA9LPvlBxcHZhhTXVQqinavEBHj63dbsAnLZB63kDDSYtMu6Cav4ZkkbIsHOaRnE
         /APeBth3EkjR5vV8abVXFMug7YeV7OSPIeXe8AOksbuvkqvjzX7+mjYmRVjxzjHq2fyQ
         kdr/lGIbLBx8PrSPEHZM4uitxnq3gyBd7rIQJOuEWP27BWSe1415DlJdtbA6FC7n9/n1
         +mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961072; x=1791565872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=J+txLWlufSXmdL9TTXmF7inlm1b6PyrCJc0m9lEAaW7HG0BKZeWYVCHZmfPH+hC+AA
         A0xlU9itewd5qOWRACXGdFxXrXQw29ecfNVtdCAKq909+8MWPXl1kQG9Y8D3LebWJo2m
         xgW4DdmHVwcKf7czQHOHnoLIoCnvgOM4DY7sn/6+hGMY2Gup7QUhMfGjB8f4iwTF3lSe
         tK4+cLDExBhgkk80apnY+B0A9o8AYroDtGZthMAIF+8ANSMTxex6zBXAVXQ4zh04XY8T
         F2xOXZ+WjmsUrmQD6SBFM87Pt0hinaB/eAam72/4ntj1RX+sPqwyisOvtrYRxJ9qWUyd
         FDIw==
X-Forwarded-Encrypted: i=1; AKwUvBwyiNscx7P0+S/QacCykPGktBHceSsxQk8RPT3yL1z8GM2dGETOZVnJ6gOX5JullbMB2Cao@lists.linux.dev
X-Gm-Message-State: AFq9FYLZrqvSgron/bP+nMr1jU/92N+VyL78XY8iK7Z8RiZ3IMj/Bh6J
	SntG59WV74Ko88XjdGFDtd2G8i1gMpx4dmHpVpBDR74lrkIwdlueooZB
X-Gm-Gg: AYBFou08HPdYPZ6i+jHHrmcfVPumcO3955GVH2QUqYU0RKfc1kxPqPuTEDBZZgy48oc
	Njiin3r+YA6+DBt0v/wvRG9/6SufIpvOnH4kAxvDns/kJ2kT8JCH0/A3wbrmBk8RAOMPWvLxrC+
	akrgvQG9zWjnYMHirHCy15aQGpeLQfUNH6XDXcp58Gb91X6AeFw/cK8+A7vrPxDz0HidWpKJGP5
	hxYvydvRfixFmWHc3oE4am58cVnUavoj/QYZ2+gRM+OVngHqgL1/LV4iMXAoTeCUO1znBXkDErm
	YXvttW4Yu34UrFDtmSH2xp9e/mrAxAL0TwWtfTS3NI4N8xs109a/T2RCyUdRuFdlb/U/tOVWhqh
	1r0MZgUIu8urTG8LaF/uvGEoqKhJIzotq8QdWwDSBkzbsnycLUKjxSWm/th8DvVMN1oT739mejg
	3KuAVKb+cUXgjbL9Ku2ixKFlzRtL/zEzQwwP+kuX/xFJqni1q6oW3519Z3qzNzUJP61vFsTYuFJ
	1ucM1N3/RwbllLqqkbRT7+ZKSh2
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2938832a91.25.1790961071827;
        Fri, 02 Oct 2026 10:11:11 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:59 -0700 (PDT)
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
Subject: [PATCH RFC v2 11/15] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Sat,  3 Oct 2026 01:08:43 +0800
Message-ID: <20261002170847.3653663-12-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an LKMM test for the hazard-pointer publication protocol used
by the lockdep conversion.

The test checks that a scan cannot miss a hazard-pointer
publication while the reader still observes the pre-unpublish
pointer.  The smp_mb() pair provides the required ordering.

This covers the resolved-publication case.  The in-flight wildcard
window of the wildcard-flip scan is covered by
hazptr-wildcard-flip-escape.litmus.

Verified with herd7: Never 0 3.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 13 ++++++
 .../hazptr/hazptr-acquire-before-scan.litmus  | 45 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 4d4ec9c6f2cc..c2bf20fa4092 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -97,3 +97,16 @@ SRCU-fastpath-scan-before-anchor.litmus
     period, violating the SRCU grace-period guarantee.  See
     SRCU-fastpath-anchor-before-scan.litmus for the opposite
     ordering.
+
+
+hazptr (/hazptr directory)
+--------------------------
+
+hazptr-acquire-before-scan.litmus
+    Test the resolved-publication ordering between hazard-pointer
+    publication and the scan.
+
+hazptr-wildcard-flip-escape.litmus
+    Test the in-flight wildcard window of the single-pass wildcard-flip
+    scan: a straggling acquire that published the old wildcard after
+    the final walk cannot still load the unpublished object.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..6dc13830c07c
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,45 @@
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
+ * This models the resolved-publication case.  The in-flight
+ * wildcard window of the wildcard-flip scan is covered by
+ * hazptr-wildcard-flip-escape.litmus.
+ *)
+
+{
+int ptr = 1;
+int hp = 0;
+}
+
+P0(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Scan. */
+}
+
+P1(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*hp, 1);	/* Publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load pointer. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

