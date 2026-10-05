Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E64E324B
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220592; cv=none; b=pDe0nMKTIEgL590iA8/1a7pah0LQMEUFxmANPFX3YWfksDQ3k8f04zaa4GZ08wjZGhXpOqJHFGD3ZbQiWbKSBh9JEoxT/gmfMzRH74Uc2aK8XPknPosEeiNzH4tzuZ+24ANT0EcXlaKbMsJO2evYb7wxmk1kA1HqSEKWXMqzxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220592; c=relaxed/simple;
	bh=SrwdHIX17te8vYpXerlPrT9uvUAXxdpliS9rJVsJABc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXpfdwQQQA5ht8beDdJsoRbMp47FyOPrCnDw5+5zUzC4KCNv4XLbxwseZLg6l5SlVyANAZdgHtUl7GP0RQIhlQ9gY9ZkD6HhBpx1e32xbFmzpMGL6bbvsH/ppsZi8RmcI6zg3XAoircJEnMK7/bNfbWZoRF2XhWaIzSV/h6Swuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNMKtuyN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNMKtuyN"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a7d7287703so1312057a91.2
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220590; x=1791825390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkxMy1Mx1AmQEa8UR49QVnQhvwoc8QcMpxJihofQjBM=;
        b=DNMKtuyNIu7EXT9YDszOw008E0OpNMwVvZX7dUX1A3ADXd7hg4KlVD4LRpEVrpAR7g
         ugW2YrKQCGi3YMCUg0HWMh4D9ba5rK6fpTr5FEcWfG8dJGJgZc0RZK/DxBbag3qym2hL
         CprYuS5dvQsx7tTMWmiMBU6DdN7HPRryukFnEKvK8PYPtlNVi/3cvoE34RMUvHB17qe1
         CX8h6mE3Pi1XGzwDEBRqL58mK3Vnt06ppNmmM37YSUPRQygsSPla2kHgbXsoz6cuQY35
         mvqErRqUWlgKmll0Y+gF7zvIdk6lUFT4WWSZdz1KIYQj+Ea88osXdWI7bZxcV0aiHAwO
         UGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220590; x=1791825390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkxMy1Mx1AmQEa8UR49QVnQhvwoc8QcMpxJihofQjBM=;
        b=Engwch4Qw2JNb+Sq0QW9v1nOKkNTFb6S1F6+erLd3Lxr7p2JRV/5T3Yj0ikv4YZqWn
         zCDEUm5RKtlDtTRsCv4u5kRIm12l9IPxN9pLikDfoZnzVG+aKqfh2lDEQcuGnYf79Fej
         dFzMlUoTw1SdVaG8SNDQeEgindMPJtOFOgpY81ZJ7Zr8zt7Ge2AzIfPvC2/BBwLb75st
         8gW7CiWDRpyWs2CdpEjDjdoIJodUgUBwElIWo15fTXOZRePdrDOmV3rCD+MUo+nDArNh
         G5qw1O0vI6hayqyo8xfV3nGzRtLAa6yA4Ldg6nagqhV3115xRv2HhB1cZbq8zxDzgsEs
         wL1w==
X-Forwarded-Encrypted: i=1; AKwUvBxLO5cxBkRA7skmrZQR8gypuq02zGhnkuWTWqAIZeER8SuquEdHOaKB3VPosJqdj3DKbaC9@lists.linux.dev
X-Gm-Message-State: AFq9FYLv6UuveMqwV/+jv1RohnwZp003PCTSFQNSeeEXP1Wxv43B9Emq
	CNJUL70/DprvR7TmDt5TNJws/mbLQqH+hhLdJxY0mHTSw8F2rKQJjDRT
X-Gm-Gg: AYBFou0Yo2zCF47IZ5QDPLp8i4o8UmSuR7PcOjmmvT5y32QSeLjEbeoA6VjXeZSbgHm
	GNBN6bFUyua/xtlHU+nnArUaTOKuOZ4+WjafEAvBVBvkYHROJxooboXEpLk6osr2KmVVxy9rGvR
	ZKkzbLAsTcKSUOzS1+1ZElWdK+nkNu8NrFTe4U8D4YbYmbj+j4U+1zKKKETQxMwvv+Kqr9OrgXq
	tbAD1LNL8t390/CT1RBHly0KsHImNtkiV72DePpcLx/oWMmuEbY/5fe0S4vrblvNHID8T4JRHPq
	iZacyqx6IxTJOxxh4RBGIkAGT1oVu1cXYHy0qgtsZMoz/GOAgdUwHOqc3DS9evCzx/ezlySgcBz
	+RKZC1dKadOYWSi6edQ0I/Ww4e05babhZpcpxq7vZXRPZgJDzkpfpxunTd7UOebe2Jb+PttVD8n
	xoc0mhcMbSA1fR6eDsfwQxaTXChDxOecxCrpwDtksM5R07xIds41BJrwXvbHkFavrNJMKIimMHe
	BNB1IPJxzBoaUq8umzjvr52AMfesQ==
X-Received: by 2002:a17:90b:4a0a:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a7873ea58amr6998626a91.44.1791220589334;
        Mon, 05 Oct 2026 10:16:29 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:28 -0700 (PDT)
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
Subject: [PATCH RFC v3 03/15] hazptr: scan all per-CPU slots before overflow lists
Date: Tue,  6 Oct 2026 01:15:17 +0800
Message-ID: <20261005171529.1378809-4-kunwu.chan@gmail.com>
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

Boqun Feng pointed out that a promote racing a scan can cause the
scan to miss a hazard pointer: hazptr_promote_to_backup_slot()
chains the backup slot into an overflow list before clearing the
per-CPU slot, so the scan must observe the old location before the
new one.  The scan currently visits each CPU's overflow lists right
after that CPU's per-CPU slots, so a promote that moves a hazard
pointer from a per-CPU slot of a later-scanned CPU into an overflow
list of an earlier-scanned CPU can be missed.

The direct two-phase scan has a related race because the overflow
list selection follows the wildcard phase: a promote racing the
wildcard flip can move a backup slot to the list not covered by the
second phase.

Fix this by scanning all per-CPU slots before any overflow-list
slot, in both the shared-scan walk and the direct fallback scan.
Give the overflow lists a flip phase of their own, independent of
the wildcard, so each list is scanned while it is the non-live one:
new backup slots are chained to the other list, preserving forward
progress.

The same race was also addressed by Mathieu Desnoyers.

Fixes: 0b8114b25f17 ("hazptr: Implement two-phase wildcard scan")
Reported-by: Boqun Feng <boqun@kernel.org>
Link: https://lore.kernel.org/all/20260925195958.4766-1-mathieu.desnoyers@efficios.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 88 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 24 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 900ba35de2cb..799784f698ed 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -23,13 +23,20 @@
  * The current hazard pointer wildcard. Flips between 1UL and 2UL to guarantee
  * hazptr_synchronize forward progress even with a steady stream of readers.
  * This wildcard value is used by acquire to temporarily tag the per-CPU slots.
- * This also affects the overflow list selection: the current list used by
- * readers is array[(unsigned long) hazptr_wildcard - 1].
  */
-static DEFINE_MUTEX(hazptr_wildcard_lock);	/* Protect the wildcard flip. */
+static DEFINE_MUTEX(hazptr_phase_lock);
+/* Protect the wildcard and overflow-list phase flips. */
 void *hazptr_wildcard = (void *) 1UL;
 EXPORT_SYMBOL_GPL(hazptr_wildcard);
 
+/*
+ * The current overflow list phase. Independent from the wildcard so that the
+ * overflow list scan can be placed after the per-CPU slot scan while still
+ * scanning the non-live list: the current list used by readers is
+ * array[hazptr_overflow_list_phase].
+ */
+static unsigned int hazptr_overflow_list_phase;
+
 struct hazptr_overflow_list {
 	raw_spinlock_t lock;		/* Lock protecting overflow list and list generation. */
 	struct hlist_head head;		/* Overflow list head. */
@@ -59,6 +66,12 @@ void *flip_wildcard(void *wildcard)
 	return ((unsigned long) wildcard == 1UL) ? (void *) 2UL : (void *) 1UL;
 }
 
+static
+unsigned int flip_list_phase(unsigned int phase)
+{
+	return 1 - phase;
+}
+
 static
 bool is_wildcard(void *addr)
 {
@@ -184,15 +197,12 @@ void hazptr_synchronize_cpu_slots(int cpu, void *addr, void *scan_wildcard)
 }
 
 static
-void hazptr_scan_period(void *addr, void *scan_wildcard)
+void hazptr_scan_cpu_slots_period(void *addr, void *scan_wildcard)
 {
-	unsigned int scan_idx = (unsigned long) scan_wildcard - 1;
 	int cpu;
 
 	/* Scan all CPUs slots. */
 	for_each_possible_cpu(cpu) {
-		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
-
 		/*
 		 * Scan CPU slots.
 		 * Forward progress against recurring wildcards is guaranteed
@@ -205,12 +215,22 @@ void hazptr_scan_period(void *addr, void *scan_wildcard)
 		 * to acquire that same hazard pointer value.
 		 */
 		hazptr_synchronize_cpu_slots(cpu, addr, scan_wildcard);
+	}
+}
+
+static
+void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
+{
+	int cpu;
+
+	/*
+	 * Scan backup slots in percpu overflow lists.
+	 * Forward progress is guaranteed by scanning one list
+	 * while new elements are added into the other list.
+	 */
+	for_each_possible_cpu(cpu) {
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
 
-		/*
-		 * Scan backup slots in percpu overflow lists.
-		 * Forward progress is guaranteed by scanning one list
-		 * while new elements are added into the other list.
-		 */
 		hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
 	}
 }
@@ -285,10 +305,13 @@ static struct hazptr_scan_state hazptr_scan;
  * Walk all slots and return true if @watch is present.  If @bloom
  * is non-NULL, record observed non-wildcard addresses in it.
  *
- * Per-CPU slots are examined before overflow-list slots on each CPU
- * to preserve the acquisition ordering required by the promote path:
- * synchronize must observe the per-CPU slot release before the
- * overflow-list entry can be missed.
+ * All per-CPU slots are examined before any overflow-list slot: a
+ * promote (hazptr_detach() or a context switch) moves a hazard
+ * pointer from a per-CPU slot to an overflow list by chaining the
+ * backup slot before clearing the per-CPU slot, see
+ * hazptr_promote_to_backup_slot().  Therefore the scan must observe
+ * the old location before the new location for every slot/list
+ * pair, including pairs on different CPUs.
  */
 static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 {
@@ -297,9 +320,9 @@ static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 	if (bloom)
 		hazptr_bloom_reset(bloom);
 
+	/* Scan all per-CPU slots before any overflow-list slot. */
 	for_each_possible_cpu(cpu) {
 		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
-		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
 		unsigned int idx;
 
 		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
@@ -313,6 +336,10 @@ static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 			if (bloom && v && !is_wildcard(v))
 				hazptr_bloom_add(bloom, v);
 		}
+	}
+	for_each_possible_cpu(cpu) {
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+
 		for (int i = 0; i < 2; i++) {
 			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
 			struct hazptr_backup_slot *b;
@@ -359,14 +386,14 @@ static void hazptr_scan_do_cycle(void)
 	struct hazptr_waiter *w, *n;
 	LIST_HEAD(done);
 
-	mutex_lock(&hazptr_wildcard_lock);
+	mutex_lock(&hazptr_phase_lock);
 
 	mutex_lock(&hazptr_scan.lock);
 	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
 	mutex_unlock(&hazptr_scan.lock);
 
 	if (list_empty(&hazptr_scan.scanning)) {
-		mutex_unlock(&hazptr_wildcard_lock);
+		mutex_unlock(&hazptr_phase_lock);
 		return;
 	}
 
@@ -391,7 +418,7 @@ static void hazptr_scan_do_cycle(void)
 			list_move(&w->node, &done);
 	}
 
-	mutex_unlock(&hazptr_wildcard_lock);
+	mutex_unlock(&hazptr_phase_lock);
 
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
@@ -463,6 +490,7 @@ static void hazptr_synchronize_queued(void *addr)
 void hazptr_synchronize(void *addr)
 {
 	void *scan_wildcard;
+	unsigned int scan_list_phase;
 
 	/*
 	 * Busy-wait should only be done from preemptible context.
@@ -486,18 +514,30 @@ void hazptr_synchronize(void *addr)
 	}
 
 	/* Fallback: use the direct scan path. */
-	guard(mutex)(&hazptr_wildcard_lock);
+	guard(mutex)(&hazptr_phase_lock);
 	scan_wildcard = flip_wildcard(hazptr_wildcard);
-	hazptr_scan_period(addr, scan_wildcard);
+	/* Scan per-CPU slots. */
+	hazptr_scan_cpu_slots_period(addr, scan_wildcard);
 	WRITE_ONCE(hazptr_wildcard, scan_wildcard);	/* Flip the current wildcard. */
-	hazptr_scan_period(addr, flip_wildcard(scan_wildcard));
+	hazptr_scan_cpu_slots_period(addr, flip_wildcard(scan_wildcard));
+
+	/*
+	 * Scan overflow lists *after* scanning all per-CPU slots, see
+	 * hazptr_promote_to_backup_slot().  Flip the overflow list phase
+	 * between the two lists so that each list is scanned while it is
+	 * the non-live one.
+	 */
+	scan_list_phase = flip_list_phase(hazptr_overflow_list_phase);
+	hazptr_scan_overflow_list_period(addr, scan_list_phase);
+	WRITE_ONCE(hazptr_overflow_list_phase, scan_list_phase);
+	hazptr_scan_overflow_list_period(addr, flip_list_phase(scan_list_phase));
 }
 EXPORT_SYMBOL_GPL(hazptr_synchronize);
 
 struct hazptr_slot *hazptr_chain_backup_slot(struct hazptr_ctx *ctx)
 {
 	struct hazptr_overflow_list_flip *overflow_list_flip = this_cpu_ptr(&percpu_overflow_list_flip);
-	unsigned int list_idx = (unsigned long) READ_ONCE(hazptr_wildcard) - 1;
+	unsigned int list_idx = READ_ONCE(hazptr_overflow_list_phase);
 	struct hazptr_overflow_list *overflow_list = &overflow_list_flip->array[list_idx];
 	struct hazptr_slot *slot = &ctx->backup_slot.slot;
 
-- 
2.43.0

