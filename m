Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811331;
	b=4rCnHMm1eArEOhsooZRAkDjF+R7RTIQ4/74CJut74XHdNUXYz4OZxNxQLyfBi+k/3jSI
	 MHh1lzeP5DcPWluRYinL9Kt61+hBJRTZbT+U6FLmgFor6Kpy+5p2ZegofGD7EqwDHjoqh
	 yWs/GIQfabnUrP71tFL6hrT05ehfqek6g7KXiRNjL3PrNWYGlaf7lwZ0TGbgunWW8SlIR
	 kLhN+laCcjEWiIcqxB5JteEFj4LiVH+9IQJu6C1tqmC6gyp/EykZL9DKR8nnboxG/hhz3
	 Weg3wlTABZOqY1IkAVJghstiyTS1FXqPdk5YPJpwuHGyagsI7tDH+9F3KyYAb/w1EvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
	b=bj/VvvwbFgncnTMnF4GJDNwVsWe7xDMeEo43mxr4c03e+rf9iyCIK25AYvkw17bcb+Q6
	 IIyA7FE9MO4YZnJoZydatLp5TvgY+bOu75a32suwXHE/uJX3gUnaJlQ7wpXAKlO0EtV2Q
	 s0/nC27tATqAV6fs3D6e6qrhqk5fELQRGqNZEmWJz7SdqiIP17WclmIGrnMoTLeloSOQD
	 NRemClDutVbVz833A0L88PyhhZesNerT/RWkVVFiHe/7z09oKzMvOuwrX898vO0RmeL3U
	 EuJKGjan5YT0U6vHQ5r4hYox0xeQAWC+niepb0sbfkCrBr7CUwQPrupHgfG8UdjRZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzet35Bt;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E5606A329
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C89E5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pzet35Bt
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so1742061eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811330; x=1794416130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=Pzet35BtyWR8Owod6Xx7tDjdXbkNJqo5PN94vbLsD3xc8tN/PAGlf+ZtSnDDZXlQBX
         vcvpUpfgbslDx9tnCdEGilVNOEdU91wDTLKE7Vt4E9dzHWo89G2OyJKuOUPBL5VYud1J
         kBreXtpC6Vcmt4ik+AEF8s0hAIypPAvS3x5o+YExQwsPKNeHgdKjzXmDITjTSoDsgZXu
         g7WgYwIGiFz4T5vc6Jz4W9IXZh8YqA0Psb8N2Ra3tpcFqQyiEkEM8Nl2uuG8KTR6TOYw
         Fo3JoMUIJjilxyNM/iM2ZwF05eHodoscSkXXJjS3lJEa2EabM48laR6pm5EXa0vZ79Q3
         xXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811330; x=1794416130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=svAmYvSZ5GutHDmHcCUE5c3ghjL8LeEt2/DysvEiXC8=;
        b=aBrHNnI2OM/+0MDNG16LycfFJ6GduqnF947EzPSyl87G4r6x++HoRZ5t0Pm8TGRgcK
         0yPcdA8JdYrl3bJPmBjMQsE6rPz4UyLZBAx7dnE7d/t3QDl1/P4/3kxzbOW1dTqEztji
         pNrl9lLzEsUmm6BVfBqZMYXcd/AnGSLIwDFbi6BHN1CaOynmHU7b1+TynDhoRKv/hCTs
         GrL0+w6KcF9N9wv9F7wGisEroQSPAzxZ+pO6b9D7mykRJlp9OOL5ILNSDhYPcQ7Dfkr9
         Do5YlHCOotKXnnUjm8DAZOZo0cNBy1Ha37T0Xs7zXu8yUUBHCr+8zyWyLes0ZB1zNTRo
         tHiw==
X-Forwarded-Encrypted: i=1; AKwUvBz5KOzLGyNN4A+NqNTvQm/6GyLwcvjty3W1o8xBxhVhjscTiqThBBud9sl1LfqJJd4IqA/y@lists.linux.dev
X-Gm-Message-State: APuU4Z/ppKfZa2GoSK6mm2fft4N1hIgGw3kgkPL6qyJhwCLOs9wFBmCE
	DtEd9TNPQUSMteC3WRorvMLwfDrujKdTzmFc1nFG4FLOvz0wCorGjZgw
X-Gm-Gg: AYBFou0vFft23mrL/fRslVYY0H854KnzFpVZF/kKQfp0GYeGpPnNhGFoNmp5ku7p6+u
	Nrog4WqyoXv0/yFgqs714A0xVlQjZPqqCUOYjbNxD30h7Zjm/AjFO0hu3vA0OV24CAFYDA7M7OT
	iM6BxWZoX3M9MmHXXY5FUHGr5a1O0eQEr0HFDz78Qqs0cjWymlvoeBl2NL6EPotyyIo4QeXTAID
	bo+U6gGppTiE7wdakXmdlHgwJrI5jwsRhgeI3tyjRnKAiZhPPGxJjU9oe43FV3BR+NNE34KVQyd
	UX/NgikB7yU/pOHJEaBTiQaSixATD27I01J1ysAjC+DqoSrES1Odv1T5z++vdxu56VZlEfahAqu
	gL5MkRmHbJ6/Z/k1rdg/4aao6FYGM57jT3MxWu9/hr4aH3aYoxF6C6s7upVQjfTurvxQJjNCwg0
	U3Vr2SlOu2OALbV6BK1cWdGvlWPSYbnkXJmnNNTixk8ddAHK2WQQ2kkjVhgbp0jS57DvTIKi0lu
	XvC1fDDXkQLz7+YwrVCJ/TxE+jSJKDTANThbDEwKyaV+g1nTo9bo/LYIq5V9TOcuGV7ZdFlA9bp
	FyWq/ojpc3njaAm2IRQ79ZX33X058Ug85Ng5/Es=
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr23626146eec.5.1793811329298;
        Wed, 04 Nov 2026 08:55:29 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:28 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
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
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 01/28] hazptr: Add shared scan kthread
Date: Thu,  5 Nov 2026 00:54:19 +0800
Message-ID: <20261104165504.2430480-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch concurrent hazptr_synchronize() callers into a single kthread
scan.  Waiters sleep on completions instead of busy-waiting.

The kthread processes queued waiters sequentially: for each waiter,
it scans per-CPU slots and both overflow-list phases until the
address is released.  This is the same scan the direct fallback
performs, delegated to a kthread.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.  Fall back to the
direct scan if the kthread is unavailable.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/hazptr.c | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index b06164aac3a7..013c24021c43 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -12,6 +12,10 @@
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/export.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+#include <linux/swait.h>
+#include <linux/sched.h>
 
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
@@ -234,6 +238,145 @@ void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
 	}
 }
 
+/* Helper: scan both overflow-list phases. */
+static void hazptr_scan_overflow_list_all(void *addr)
+{
+	unsigned int scan_idx = READ_ONCE(hazptr_overflow_list_phase);
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
+		hazptr_synchronize_overflow_list(&overflow_list_flip->array[flip_list_phase(scan_idx)], addr);
+	}
+}
+
+/*
+ * Shared scan: batch concurrent hazptr_synchronize() callers into a
+ * single kthread-driven scan, avoiding redundant per-CPU and
+ * overflow-list walks per caller.  Waiters sleep on completions
+ * instead of busy-waiting.
+ */
+
+struct hazptr_waiter {
+	struct list_head node;
+	void *addr;
+	struct completion done;
+};
+
+struct hazptr_scan_state {
+	struct task_struct *kthread;
+	struct swait_queue_head wq;
+	bool wakeup;
+	struct mutex lock;
+	struct list_head pending;
+	struct list_head scanning;	/* kthread only */
+};
+static struct hazptr_scan_state hazptr_scan;
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the caller's
+ * stack, so no allocation is needed.
+ */
+static void hazptr_synchronize_queued(void *addr)
+{
+	struct hazptr_waiter waiter = {
+		.addr = addr,
+	};
+
+	init_completion(&waiter.done);
+	INIT_LIST_HEAD(&waiter.node);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	wait_for_completion(&waiter.done);
+}
+
+static void hazptr_scan_do_cycle(void)
+{
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_phase_lock);
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_phase_lock);
+		return;
+	}
+
+	/*
+	 * Process each waiter: scan per-CPU slots and overflow lists
+	 * until the waiter's address is released.  This is the same
+	 * scan the direct fallback performs, delegated to a kthread so
+	 * callers sleep instead of busy-waiting.
+	 */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		hazptr_scan_cpu_slots(w->addr);
+		hazptr_scan_overflow_list_all(w->addr);
+		list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_phase_lock);
+
+	list_for_each_entry_safe(w, n, &done, node) {
+		list_del_init(&w->node);
+		complete(&w->done);
+	}
+}
+
+static int hazptr_scan_kthread(void *unused)
+{
+	for (;;) {
+		bool idle;
+
+		swait_event_idle_exclusive(hazptr_scan.wq,
+					   READ_ONCE(hazptr_scan.wakeup));
+		hazptr_scan_do_cycle();
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+		if (idle)
+			continue;
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Initialize the scan kthread.  Failure falls back to the
+ * direct scan.
+ */
+static int __init hazptr_scan_init(void)
+{
+	struct task_struct *t;
+
+	init_swait_queue_head(&hazptr_scan.wq);
+	mutex_init(&hazptr_scan.lock);
+	INIT_LIST_HEAD(&hazptr_scan.pending);
+	INIT_LIST_HEAD(&hazptr_scan.scanning);
+
+	t = kthread_run(hazptr_scan_kthread, NULL, "hazptr_scan");
+	if (!IS_ERR(t))
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
@@ -261,6 +404,12 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
 	guard(mutex)(&hazptr_phase_lock);
 
 	/* Scan per-CPU slots. */
-- 
2.43.0

