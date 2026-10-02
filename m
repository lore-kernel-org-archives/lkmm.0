Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED250129B
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961031; cv=none; b=QOAAZfI3oYllOpUYAiJ9p+pxwlrWxa/lPE+gXcLOn5EytuULuvhKQ40o7KWFnU6INZNlbrXJErhipvibHOqdIdVqUDhyurK/vz/2e5DR53qLK56izMX4Ggafr6mI1lJs+gq+uH+7F/Rl75/3vG45f4QA4thvPcVZUEo5iLEbNL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961031; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEk+sIh9sRI+mQ9lRFXujrmIGFlbeBsBCi1PBDgFzSWqt0j9ZzC8moo1PyJJjs9dN5OlXsQZ13i0gWUn3PnHzYYEUpsocu+M2GRGLiGq3SnnwrVb8Qa4aDgX8yMmKIvFvC65KDsMzzTiAY74HIAsM53uHNN/AiLd2eQI5P7Gcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y371RrFy; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y371RrFy"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e49be254c3so4767065ad.2
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961019; x=1791565819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=Y371RrFyBYvHxV/sHLra0MFmQ9cjsppus1lJrCnIyUt11v7QBwhqt9JulPotuP27u+
         iVMSGGDSMFVCFG9hyhUVvj7XZdQx6I2qK7d035sbXn/qC/mQScyHiMeIUgApaQNCrMiB
         L4fm9udWWKTDCCU58o+V7iYLKqOkgOKGKXVW6WgtZmvoPUPYsTWnMesYlRPcZnAfhTdF
         Vazx5HwyKwKG6jJHUBhSq//3O+o6OzJyOaEcRtOnWctGvvyeoU1/XqDdpno4exufqCOD
         2ucvMHjLHBH+jnmnIQ8JHKDIFLwljkhOJkB0X1QIWf8Xgr79jUgWaKemT1/Dr/fNe5Wb
         kq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961019; x=1791565819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=k3ufj1ETKADiX0xyE6cyMekfNHxdjfjvN9U5oUJBHlbHzs2mS5tBHmJkMSKrzD7rDi
         CB/ZULJlfp8mS8KVHsYV4Br48gzHpeWX3w+oKSP5/1PxVv4VZg2XiIFjdOUjt37pwgHZ
         RhBPCJ3/RIsWa2muDWfGwB+UJfNbHvLELtKvCG8ThHIL/XWXjOCBJHahPlprzQ5XhnP+
         JruuaU4pryXLJukT4ssTyktieYwKbfdO4Te23QPYG2WIfReDNjpxl1kx0SCYExkk0TsG
         KgIoWaDFYdgOni4RjkClDO6fNcK5phoZ7nz6Cvq8OAw7loCZDWnjJK/JDboDMc0g6eiW
         8xsA==
X-Forwarded-Encrypted: i=1; AKwUvBxU8FvK5WIui+L/O4HEFwP7nfVsArTz7ZuJTltnmUzYxU0ei06hCCIvDnOGnFZfPElkMdNv@lists.linux.dev
X-Gm-Message-State: AFq9FYJXqTYoANhyXrWD2Z884a4zsCiE88/lnSN72d5fEJT7f9ZE9BzE
	uMG4YLjzNNJmDKWw5e7x3iJ65QFqO1Bz2kUTdXnBNQyoriopYjILcN47
X-Gm-Gg: AYBFou3YwdHdiwlh08T4ZcKiVy6WmVPwE4pMrXwdzaxudqg/HlLM/W4KLz7ikt/uw3y
	AO1pIEHRZZSadvrQqFej7Av1xVP6+xvUcdY2utSTCAJssuMtGnG9l5Rz6XRWCY1VB5/UPFws1On
	gj5ouAE06u+6gM/R+QTasm98xra9sXSvPm8ccvmX1kA+GroQ0i0TTjqTpIUF+S96Zu1r/vRPAX5
	J9nUMDp/Oc3ZKAggQI83qO1QVzx9bvhqviWliy6ySwZeS1kSm2vi3Bj0jUXsxMcy54c1IfgdAbb
	By5ug0/QY8IvjQydnA8nMbLaQNwDGLLAGh2HWF98ULxIxvDKFxBoURwqBpRxnQ7fJDmoVq/UXD0
	216AaAGHnqJbiE+LrvO5uBcb9V0wLzvxNSurVJX2v5Jz0xFXdF9TmXKICQMiCGomW1jryGh7sTe
	ynPPQQtThkfoLPgVPoQ2MwbXFSgVm0ymo+iV4RK/190bRGd2ZVXHTPsfaz1nM8l1mAiH/qCl28S
	Y7ThZxPbrWSTj+pRg==
X-Received: by 2002:a17:90b:1dce:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3a6ce959345mr2937077a91.25.1790961018501;
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:18 -0700 (PDT)
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
Subject: [PATCH RFC v2 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Sat,  3 Oct 2026 01:08:39 +0800
Message-ID: <20261002170847.3653663-8-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass wildcard-flip scan.

P0 models hazptr_synchronize(): it unpublishes the object and
enqueues the waiter after its memory barrier.

P1 models the scan kthread: it picks up the waiter, flips the
wildcard, and performs the final hazard-pointer walk.

P2 models a straggling hazptr_acquire(): it reads and publishes
the old wildcard, then loads the object after its publication
barrier.

The forbidden outcome is that the final walk misses the
straggler's slot while the straggler still loads the unpublished
object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

