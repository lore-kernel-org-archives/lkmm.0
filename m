Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435571D86FB
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821090; cv=none; b=Z6NGe/54GRM+ow87IfDkBBm9Ig4LFmR6MkeMeEPB/0o9gNb2QMKP1Z/1X8r7xo6rET4eFC6OaL3Nwp7rpNzNcpGLF8hFbaFZCmMaX3nojpcVa494kI5jV/E3R+Qhpsajharv/ozcqoluQ/xzFPEB5Ny3p3u+oNxz9glfeEoTu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821090; c=relaxed/simple;
	bh=TpNMyZrlm4tnbU8qIbQP9OAezqCkZ8eRw46ditrX03g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cc84KsUrCKWTEIX1R6DV6oYpVOacXdkZ59/kYM1FViZTGyZzigbJD3WbRPVYFQyInaWoJg0xVnVx9eAwB23E8AuuGC+8MICmRZCeDYeySe4Y7UCY/rL6R0kVvH/y/YCAqDLj/+x5/Gny7JU2dm/pgf15IdjESpPA42VT3pT76V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCqqEDpl; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCqqEDpl"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fafdd322d3so68603086d6.3
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821087; x=1751425887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=boywPtnWXFrorYFTYWBJNeUbr+NvAx7NTSh4JFed8T4=;
        b=hCqqEDplfMV84Fne8L73Pk0LBsdagQf+fm2ydZQN/wO5ZLdnVea+D9k80TkiU/FWxB
         CmnT9yJnh1Ggy/pZL+JYHilHjGUufccBTC0wWW8rGnkDjH/IiXPNlpAy6hTyOMY0b1HP
         s0yPXeirOB6AZN1GgU8YKUM4eL3KUDBuhgWm+w4uCqltIN57iwE3amglR4R/b+TemIh4
         KTwfUPpEE0veEGcjKoAZfHiX5dSfCS1FtKbsHK6PB7pgNcVTzssM2LQchOFpw8Q5kuFu
         LslWWt2uCJlwQV4Nt265NKy3IsZ1jA2IAnY3DzGEMovvKVOLyYscwjkBrXMAerE/kBz7
         ULDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821087; x=1751425887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boywPtnWXFrorYFTYWBJNeUbr+NvAx7NTSh4JFed8T4=;
        b=BYlECf7aeNOtZmn7hux5dSp4WWHlqvpLHjXQ9ir/TjroZxd9+CtsTCeZupl5RuPQ1A
         g4N4BvtFoGYjj5cMwG+M8QPCnH5bNhZH99tMtIrldOX7tC2PGxtSr1Lao112e6WA5oto
         uCeRMYOtuG/kQA0wSh1TKwVhLynuCv2nLdOLZ3UoCLpOJ3oT6yDhPXYeGvYcFGEQTY6G
         CL9ur4PytweoWlkM6hqy8VOXVRK8WJ4hOnLEgWMlY/R262rE/cBQN8UMgXnlKtn0AT8e
         jms8SbckbXNo0ZSUpxNKifhVzm8gLITGQ9OxoYGQhGAVHdaxR4hipncKDeMB3581LEqR
         uTcg==
X-Forwarded-Encrypted: i=1; AJvYcCXVAr0Wjn0HG4mpdXt+iqorvtEWmBRZSljy5S6q3JnT6gmxeFHTuLrkaTI2Do2fl9wgemyb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9McmwJ2bpBl+wKZfQQuMqTkAywCs70axxIqkAkRcyJg0KrRBN
	B61O2hwB4CNWOI4ouVB0Uo99Ln4S+OUDqpk62j7C6av1OyN2ljKfIvU/
X-Gm-Gg: ASbGncs1zbuEA02dG4WnwpdzO7rwScEhq04bzrt1w7kQfiqkmV7hRb5Xbh5l11ReJ7T
	5LyvOTOmtv69y5yKa6EZwxPbjVa7jkDMKGfjavZsrkYcAWYFfFfAE6n/r5p6PU5W/298SS1onyx
	GU6aTumxYMXKhnC6HYNmgTm3gYVow4GAilvSjqNh09b4ivFPLGuH0vD5piOow1ItKXayJW2A6o5
	lzxnoP7jCXid8nnmf4MKHBKPvo6nyExHG0OyvRUo54iUVFtYHq4kl4i534IJfRReNmgEICAvdXe
	xO6QIDTdBK7hxBxQpbudWh+E7YTdJxqFF90qDGsLa/7yTJ5nlItdG4ciBYVRcuPRv3MoFGKGc17
	HTmDawxdpPKK8dU38zQehHUSRDUoDI3Du0RqPC126S2mPPXXJ/4tH
X-Google-Smtp-Source: AGHT+IGSm71fAe04SBpyuIDvnyyRGSPKtLQRNbYp3JCDXDkvCoRWay4YKL+d8dRstEpJV4yfKMo0Cg==
X-Received: by 2002:ad4:5f85:0:b0:6fa:c81a:621b with SMTP id 6a1803df08f44-6fd5ef42043mr21228666d6.14.1750821087055;
        Tue, 24 Jun 2025 20:11:27 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd1c2c544bsm43838116d6.30.2025.06.24.20.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:26 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17AD4F40066;
	Tue, 24 Jun 2025 23:11:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 24 Jun 2025 23:11:26 -0400
X-ME-Sender: <xms:3WhbaByz6eoAOuuNVOH22m3lV3L9CsA1OzrSuzd6rQwM_IF6s_G2Qg>
    <xme:3WhbaBSHMqpCnc5F1GahG5rvAZRHHoy7kHE-3pe7-Ph6kDNUXbXwjPRpceykZPv7r
    sYVO3sceET-TnfDFQ>
X-ME-Received: <xmr:3WhbaLXTr7J34C3T81DJQZm2bwXONkCy9JDMaHsMhK1wFbw88McLnfF6sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopegurg
    hvvgesshhtghholhgrsghsrdhnvght
X-ME-Proxy: <xmx:3WhbaDgu0XJd10XykLp5KOj6_Ba-AzkcTyX3fCt1H78glmdtLxZt7Q>
    <xmx:3WhbaDDCejoWtF8W9iTjodP-KlBmOQN7UllXdsTt8E6gqOallW5w-g>
    <xmx:3WhbaMJq4lV_cYF4ZKlnMqH6y96puf8UFVHvtFhuU1L3p7FGh-aH6w>
    <xmx:3WhbaCBSxxYaCH74trqxFuU-X_UCjZnosmG5Vn9q6I34coDCZlPOkQ>
    <xmx:3mhbaHyE10R5yEuAJfZ6_R33m-IVjO6WyKbJooNCZNkmT511yf278yCC>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:24 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	aeh@meta.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	jhs@mojatatu.com,
	kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: [PATCH 1/8] Introduce simple hazard pointers
Date: Tue, 24 Jun 2025 20:10:54 -0700
Message-Id: <20250625031101.12555-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625031101.12555-1-boqun.feng@gmail.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As its name suggests, simple hazard pointers (shazptr) is a
simplification of hazard pointers [1]: it has only one hazard pointer
slot per-CPU and is targeted for simple use cases where the read-side
already has preemption disabled. It's a trade-off between full features
of a normal hazard pointer implementation (multiple slots, dynamic slot
allocation, etc.) and the simple use scenario.

Since there's only one slot per-CPU, so shazptr read-side critical
section nesting is a problem that needs to be resolved, because at very
least, interrupts and NMI can introduce nested shazptr read-side
critical sections. A SHAZPTR_WILDCARD is introduced to resolve this:
SHAZPTR_WILDCARD is a special address value that blocks *all* shazptr
waiters. In an interrupt-causing shazptr read-side critical section
nesting case (i.e. an interrupt happens while the per-CPU hazard pointer
slot being used and tries to acquire a hazard pointer itself), the inner
critical section will switch the value of the hazard pointer slot into
SHAZPTR_WILDCARD, and let the outer critical section eventually zero the
slot. The SHAZPTR_WILDCARD still provide the correct protection because
it blocks all the waiters.

It's true that once the wildcard mechanism is activated, shazptr
mechanism may be downgrade to something similar to RCU (and probably
with a worse implementation), which generally has longer wait time and
larger memory footprint compared to a typical hazard pointer
implementation. However, that can only happen with a lot of users using
hazard pointers, and then it's reasonable to introduce the
fully-featured hazard pointer implementation [2] and switch users to it.

Note that shazptr_protect() may be added later, the current potential
usage doesn't require it, and a shazptr_acquire(), which installs the
protected value to hazard pointer slot and proves the smp_mb(), is
enough for now.

[1]: M. M. Michael, "Hazard pointers: safe memory reclamation for
     lock-free objects," in IEEE Transactions on Parallel and
     Distributed Systems, vol. 15, no. 6, pp. 491-504, June 2004

Link: https://lore.kernel.org/lkml/20240917143402.930114-1-boqun.feng@gmail.com/ [2]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 include/linux/shazptr.h  | 73 ++++++++++++++++++++++++++++++++++++++++
 kernel/locking/Makefile  |  2 +-
 kernel/locking/shazptr.c | 29 ++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/shazptr.h
 create mode 100644 kernel/locking/shazptr.c

diff --git a/include/linux/shazptr.h b/include/linux/shazptr.h
new file mode 100644
index 000000000000..287cd04b4be9
--- /dev/null
+++ b/include/linux/shazptr.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Simple hazard pointers
+ *
+ * Copyright (c) 2025, Microsoft Corporation.
+ *
+ * Author: Boqun Feng <boqun.feng@gmail.com>
+ *
+ * A simple variant of hazard pointers, the users must ensure the preemption
+ * is already disabled when calling a shazptr_acquire() to protect an address.
+ * If one shazptr_acquire() is called after another shazptr_acquire() has been
+ * called without the corresponding shazptr_clear() has been called, the later
+ * shazptr_acquire() must be cleared first.
+ *
+ * The most suitable usage is when only one address need to be protected in a
+ * preemption disabled critical section.
+ */
+
+#ifndef _LINUX_SHAZPTR_H
+#define _LINUX_SHAZPTR_H
+
+#include <linux/cleanup.h>
+#include <linux/percpu.h>
+
+/* Make ULONG_MAX the wildcard value */
+#define SHAZPTR_WILDCARD ((void *)(ULONG_MAX))
+
+DECLARE_PER_CPU_SHARED_ALIGNED(void *, shazptr_slots);
+
+/* Represent a held hazard pointer slot */
+struct shazptr_guard {
+	void **slot;
+	bool use_wildcard;
+};
+
+/*
+ * Acquire a hazptr slot and begin the hazard pointer critical section.
+ *
+ * Must be called with preemption disabled, and preemption must remain disabled
+ * until shazptr_clear().
+ */
+static inline struct shazptr_guard shazptr_acquire(void *ptr)
+{
+	struct shazptr_guard guard = {
+		/* Preemption is disabled. */
+		.slot = this_cpu_ptr(&shazptr_slots),
+		.use_wildcard = false,
+	};
+
+	if (likely(!READ_ONCE(*guard.slot))) {
+		WRITE_ONCE(*guard.slot, ptr);
+	} else {
+		guard.use_wildcard = true;
+		WRITE_ONCE(*guard.slot, SHAZPTR_WILDCARD);
+	}
+
+	smp_mb(); /* Synchronize with smp_mb() at synchronize_shazptr(). */
+
+	return guard;
+}
+
+static inline void shazptr_clear(struct shazptr_guard guard)
+{
+	/* Only clear the slot when the outermost guard is released */
+	if (likely(!guard.use_wildcard))
+		smp_store_release(guard.slot, NULL); /* Pair with ACQUIRE at synchronize_shazptr() */
+}
+
+void synchronize_shazptr(void *ptr);
+
+DEFINE_CLASS(shazptr, struct shazptr_guard, shazptr_clear(_T),
+	     shazptr_acquire(ptr), void *ptr);
+#endif
diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index a114949eeed5..1517076c98ec 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -3,7 +3,7 @@
 # and is generally not a function of system call inputs.
 KCOV_INSTRUMENT		:= n
 
-obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
+obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o shazptr.o
 
 # Avoid recursion lockdep -> sanitizer -> ... -> lockdep & improve performance.
 KASAN_SANITIZE_lockdep.o := n
diff --git a/kernel/locking/shazptr.c b/kernel/locking/shazptr.c
new file mode 100644
index 000000000000..991fd1a05cfd
--- /dev/null
+++ b/kernel/locking/shazptr.c
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Simple hazard pointers
+ *
+ * Copyright (c) 2025, Microsoft Corporation.
+ *
+ * Author: Boqun Feng <boqun.feng@gmail.com>
+ */
+
+#include <linux/atomic.h>
+#include <linux/cpumask.h>
+#include <linux/shazptr.h>
+
+DEFINE_PER_CPU_SHARED_ALIGNED(void *, shazptr_slots);
+EXPORT_PER_CPU_SYMBOL_GPL(shazptr_slots);
+
+void synchronize_shazptr(void *ptr)
+{
+	int cpu;
+
+	smp_mb(); /* Synchronize with the smp_mb() in shazptr_acquire(). */
+	for_each_possible_cpu(cpu) {
+		void **slot = per_cpu_ptr(&shazptr_slots, cpu);
+		/* Pair with smp_store_release() in shazptr_clear(). */
+		smp_cond_load_acquire(slot,
+				      VAL != ptr && VAL != SHAZPTR_WILDCARD);
+	}
+}
+EXPORT_SYMBOL_GPL(synchronize_shazptr);
-- 
2.39.5 (Apple Git-154)

