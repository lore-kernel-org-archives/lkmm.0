Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC814DD3B1
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220566; cv=none; b=My6CdJzPJg+luw147fSRb474Tjtluk7tkImlE43/nj9dlXdctRScQn6ym8Yx1JPVXpJ1gm2mxn8b+WTvOZyGSvwO9g8Ck9o4AzfQRWZtq7fd85zSdPV30IKKvYCWCNcX6RC+P77Ev1rIDqKbITyAWdYSPeDPh9YSnFdG5+hDQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220566; c=relaxed/simple;
	bh=NerSRQgPomHVGQsyQmO2Em3s0dFaIoYpp/fMfD73Ojo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJUMc6ztcd50DaMIsaeC/LFse6olp4JCmhwNTCgVhV0nmSLUoOZWF6ScAfzA1VbK8N2JeCRh6FEy5T6rQ7gIkI87l9rYWhRZfS6vvSj9+HbdgZaugaFZ+oxxl2FNdjEQVjdF8g62zp9OFe0uIdGalu04AwntIv1qLIQXayxXo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw2+5URh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw2+5URh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1337617a91.0
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220564; x=1791825364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=Fw2+5URhQyg0lzmNStBVjtyL155KSVU+RHrPV4ShgqSGbNcGPpGBenOO8Qmfu7q5xJ
         DINC+SP0SqVEX3+QwdFo1eqkGyTGX+ozAQHuNN7zXIxgEiV5zhc/Qsf9OtuCvFptvCYv
         e2I0PE1nq3wIkKGrIeXohAsrLFUj1fTPDc6LOov2xhbqsC5FD4YXJbLBna6x1iHTBwm1
         UCS93LB0xk3QgQYpIb4SeS6DlkUxh3fYYrgpruHzY7c0XH7z3+7XcB6ufG9kBFPre5k6
         edJduNo+lJKV8dyKvvkTUeddNURsDL6hzcIkbaIBGKHnWxF8X4PIEI4uT0AEnAuFa97b
         588Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220564; x=1791825364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=pZbqmX4Ksayb/hgFuEinnnGLjvqNa+9N8pGVVmDFZtlp0ulvd9gpSir5gD4QOCWgk8
         aFCNDkfe0nBNgKH4Aj2/YybOqme5b1ffetEib6klv11g4XF0E1prZjecIcb2PdCh1y0/
         eAzQTIXvKnnMCvYhmLmr+GDkm+phG82qVfhyDecovZmeMaCU6Lhq9EaqAbY/0c0T1ZUZ
         1fhUAdg8jVZ4nNNBnzUw5YjbgM3q6ltIoROaQwfT9efl2/0n+tDG1ytMrcrdJpUTGzdy
         wxpEWHtzB83EBbUWiQS8SjgFSnMp+BS1v5py2GpG1IJMfsuEVtQpqrgMevQqD+z+ACR8
         xJfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKju9D0dHTQG2sc6kdbDOthc9dTrdaGIhW9h533ocBJtOoEokb7tqSgAToCSifv1FaWNnX@lists.linux.dev
X-Gm-Message-State: AFq9FYKDbLVxzrpr3QOHF1mQfb9xuGF1xaiIGbyDO60va9MfiAFkfkFr
	cUZAVQp+1FoD3NpN2GDmEYLwSTmuw3TuEMkZx2+alNkD7eONqisU7AwT
X-Gm-Gg: AYBFou2DaPlxCPSNUVB56iAhECZlogq4qgy81ci1Yf4q+2IomWK0bSV5DXxVGTKbujt
	RxxCwfSQb/Df6pNu0Q74OYl8bKwunWqyAOFkrHRjrjKxy3nmiPNsaz5sGBkQ8otjThgkNm3h2Jh
	ViYq4DKlWQ4kMi/sZZRem+SvRTVKxaaJ81kXTA5NspiQqqt0fCVLeAf00566JxFz3Vc8kBtGjm0
	wG+7hqn6EFCGt/wjax0pD8tihagxi+1YBDOv7/hI2In5g/+uBU5WG5jrMX4moXRSw84Xps5lWde
	dR/OXQErjPkDlt9CTom/8GmdxfpqjW03/dmc8+Sh7zxPYhlcoRef9vbTj6M/fC4KFgNc5hgxVs8
	HvgWy/yscugjcrhClUzkEK7t6mKpgmhIkd3NI8v3RD0FwyHBhvz3oTrJsQedCm4+jEuckVPxf1i
	fz93PRbQ/4XZ4OhZRqYUd/Mwbsm6+ugVtPyEIuOFhYxpisQ2FS0Y2xRkcaI/7J0sO00D5Y9yncG
	Lfh+GMkUoB1+V3Ve7moPE86SshWsFY=
X-Received: by 2002:a17:90b:3843:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a6ce6ca70bmr10121855a91.20.1791220563141;
        Mon, 05 Oct 2026 10:16:03 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:02 -0700 (PDT)
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
Subject: [PATCH RFC v3 01/15] hazptr: add shared scan kthread
Date: Tue,  6 Oct 2026 01:15:15 +0800
Message-ID: <20261005171529.1378809-2-kunwu.chan@gmail.com>
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

Batch concurrent hazptr_synchronize() callers into a shared scan
cycle, avoiding redundant wildcard flips and slot scans.

Queue waiters to a kthread and perform a two-phase wildcard scan
once for all queued waiters.  After both phases, complete waiters
whose address is no longer held by any slot; waiters that remain
blocked are retried in a later cycle.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.

Fall back to the direct scan if the scan kthread is unavailable.

Adapted from the scan-kthread approach in Boqun Feng's shazptr
implementation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index d3d1050d92cf..9e274a691af5 100644
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
 
 /*
  * The current hazard pointer wildcard. Flips between 1UL and 2UL to guarantee
@@ -209,12 +213,179 @@ void hazptr_scan_period(void *addr, void *scan_wildcard)
 	}
 }
 
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
+ * Check per-CPU slots before overflow-list slots to match the
+ * acquisition ordering of promoted slots.
+ */
+static bool hazptr_value_present(void *val)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+		unsigned int idx;
+
+		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
+			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+
+			/* Pairs with smp_store_release in hazptr_release(). */
+			if (smp_load_acquire(&item->slot.addr) == val)
+				return true;
+		}
+		for (int i = 0; i < 2; i++) {
+			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
+			struct hazptr_backup_slot *b;
+			unsigned long flags;
+
+			raw_spin_lock_irqsave(&list->lock, flags);
+			hlist_for_each_entry(b, &list->head, overflow_node) {
+				/* Pairs with smp_store_release in hazptr_release(). */
+				if (smp_load_acquire(&b->slot.addr) == val) {
+					raw_spin_unlock_irqrestore(&list->lock, flags);
+					return true;
+				}
+			}
+			raw_spin_unlock_irqrestore(&list->lock, flags);
+		}
+	}
+	return false;
+}
+
+/*
+ * Wait until no per-CPU slot or overflow-list slot holds @wc.
+ * Callers must ensure that the wildcard value in use by new acquires
+ * differs from @wc, so that the set of slots holding @wc only
+ * shrinks, which guarantees forward progress.
+ */
+static void hazptr_drain_wildcard(void *wc)
+{
+	while (hazptr_value_present(wc))
+		cond_resched();
+}
+
+/*
+ * Move pending waiters to ->scanning and perform a two-phase
+ * wildcard scan shared by all waiters.
+ */
+static void hazptr_scan_do_cycle(void)
+{
+	void *scan_wildcard, *old_wildcard;
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_wildcard_lock);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_wildcard_lock);
+		return;
+	}
+
+	/* Pass 1: drain the unpublished wildcard. */
+	scan_wildcard = flip_wildcard(READ_ONCE(hazptr_wildcard));
+	hazptr_drain_wildcard(scan_wildcard);
+
+	/* Flip so new acquires use the new generation. */
+	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
+	old_wildcard = flip_wildcard(scan_wildcard);
+
+	/* Pass 2: drain the old wildcard. */
+	hazptr_drain_wildcard(old_wildcard);
+
+	/* Complete waiters whose address is no longer held by any slot. */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		if (!hazptr_value_present(w->addr))
+			list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_wildcard_lock);
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
+
+		hazptr_scan_do_cycle();
+
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+
+		if (idle)
+			continue;
+		/* Waiters still blocked: retry after a short delay. */
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the
+ * caller's stack, so no allocation is needed.
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
+	/* Enqueue and wake the scan kthread. */
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	/* Sleep until the scan kthread completes this waiter. */
+	wait_for_completion(&waiter.done);
+}
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
  * Wait to observe that each slot contains a value that differs from
  * @addr before returning.
  * Should be called from preemptible context.
+ *
+ * If available, queue the caller for a shared scan; otherwise use
+ * the direct scan path.
  */
 void hazptr_synchronize(void *addr)
 {
@@ -235,6 +406,13 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
+	/* Fallback: use the direct scan path. */
 	guard(mutex)(&hazptr_wildcard_lock);
 	scan_wildcard = flip_wildcard(hazptr_wildcard);
 	hazptr_scan_period(addr, scan_wildcard);
@@ -282,3 +460,26 @@ void __init hazptr_init(void)
 		}
 	}
 }
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
+		/* Pairs with smp_load_acquire in hazptr_synchronize(). */
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
-- 
2.43.0

