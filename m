Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269951CF55
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220711; cv=none; b=UfYf+SAZqPl/fiSnDFMjvVJGommYdtavyhNPMbKabEDyoJS6TAmUVR9L9KmWqArroWGix9q0eL1GEk3PlRyO0LEjfzANUUgvT672738t25j0z+h1Z9opyYmiEiNiJ1QWpiQmToHnbL5yp9FRIF7RGMNXy0xva2Ucg1eWwjYQhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220711; c=relaxed/simple;
	bh=VRRvq3zLEbjKyIt2UhIB5bfMCL6WQ+2ygOmVvN1KkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqK5pnu8sumpujFzaG+Po4LMahPshSYSd+gfIqP/k2y8W2D16JgbLyrea2A8GBB9dqv/EHcqvsNhBTLD0T7gSHd3PzrodnB6/7Gzkod9SR+0fCuK7ip9El9yo0PAYPc17KMrNuwWxI+peg5d+79+Vhg+b9wI0TMoZkh2UH3FVPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqyGDLKk; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqyGDLKk"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso1373001a91.2
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220709; x=1791825509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=ZqyGDLKkWils0rrmtvau2VoPKiBD0aKEhMfrsLIKlgn4DwjKQH8WEjBRB63nRPKcpS
         kNjIF05Aeb2FzXDzbwL/CFBelbf+s7Ti3ZgbToFJrN7X1pKYYr1nZE76ZWqXj93wsTS3
         DHR+H8BUV/7vPKkEfXtyKbfAdXezyTVwiaInU1K48XB1W16DVtW6K9upLYSnipQZITs6
         OK+GfFwAK6dBafYlUvU9JgVxLp5wdFHunD303skVLeRH6LhEhH/5z6Hffmg9Vc06NI1h
         Cxnu7iqwvv3I6cyTBvCnf++luaihCz2ziwcYrreFA/XuN8O+3FqEP7ddJLwd5VcSey7S
         FSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220709; x=1791825509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQJb7vr8ZMuFWHiL+RnTPMV3r43UUmwaGCJuJ+OyJv4=;
        b=M4goRpc9PzghBrf11bOtnhqd7N7AYgThnlG+mdyTRjp04UtGlbBSPXXpKrDmWCkmW2
         xdj4GyhdZXrkLszTobrpUE9sANEtIZW+qTfh2b6RqupDosub7YluGSfmF2eNZfT01saY
         xSsX+FXVnCX4vbxdd8rpDN6ELT3/hdhr6dnkbuvS820AmmLgP+HXSBgYjYKbaT7RF78e
         t95RaiTNb8M5HylFwVFtowEIClCNuNlXWRW/2+WOmcQjvETmiGJB8ZlvEqNtsvWl7JK3
         +RkPSBGTgNT6jKh44QsuZpF2cNrdjt3Enk5YwLoxQ8Vfk5HyMD9sDibV4v8SjD0vV3yd
         hqzg==
X-Forwarded-Encrypted: i=1; AKwUvBzqtJLKh+FOutlOq5igOux7yH96Ic6tB7GkaY4uxlOHjcqbHE5XZdPGvsbK/VVTswVK2pNN@lists.linux.dev
X-Gm-Message-State: AFq9FYI+EFWGyPSwzkaX5UZMUKYMw4tt8U5YSyPqJivYfeJvXujFPqSb
	L/LHsd7BV4xCf5RX4Xoq5HE/W5epxxDsbYIXp8PdA3ugaMNpG826FwG3
X-Gm-Gg: AYBFou00Eow6fC108ObDOnVKUcOq77u2G0zF+FRpWkdiSk+L1xxyBl2tWbid08iSqye
	0U2lPjuMaqCeTSKcM2CXHu3fEWGfdQ4YFljs0HolFHzHfh+8EUVfxQNzpaoDswSlVvTl0SjdqZU
	Ha0nzU50LhEFebsJjPLmg+p0JikIetwAQ6pRDr+9+IKN7OTtztjaq6GZILjaWAorByCN0DbeHjz
	AZnFeKxu58musb3yQNhe8PzY1zer3jqhB4PU/IFGHhQ0ew9tiNuAh+Q/ufZa3Ai8KBsQRdLr9sc
	vYDEu1kAEpKjTEOKvgaYzN+lArK0H05AoYc0PU7u9i4nIFTUsyYifL2EHo4NkyU9ojcXnVz5o+2
	pSNrWsOR/KzlCuNWg2+J4m3AxlBQ6ZRRZ4fheVri+f3KdcebSCJMjjhsr3Vk2CPqVpb2x3lAft4
	t5ss9ECXm/ZCw/Sa0ngCFTGoXZYuY2TVGhaO889Sv64H4Pe0+r8rO2f9T0ewyoKUEKIm/RRatEx
	m8kmdNsyHi0kODXwfBVQAh7WccsCA==
X-Received: by 2002:a17:90b:270d:b0:3a4:97ea:f0d8 with SMTP id 98e67ed59e1d1-3a6ced37137mr10733555a91.51.1791220708564;
        Mon, 05 Oct 2026 10:18:28 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:28 -0700 (PDT)
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
Subject: [PATCH RFC v3 11/15] Documentation/litmus-tests: add hazptr acquire-before-scan test
Date: Tue,  6 Oct 2026 01:15:25 +0800
Message-ID: <20261005171529.1378809-12-kunwu.chan@gmail.com>
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

