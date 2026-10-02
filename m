Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E18E4E5332
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960982; cv=none; b=qfxrufhZoeAdJvssZjbruI9xBrhBkDR1Wboq2jJYPxcUPRMtqxiJC4mz/B/+/HGa8Mjf70QQXEPR5RrVoziulBbot571fcMAsOvTGDpfKQ3BEaOmGiGIC8aXFIm5h9MHBds9+hKwwqn/TWmCig+6tP8vz/GS0n8dgRuSk0AQbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960982; c=relaxed/simple;
	bh=SrwdHIX17te8vYpXerlPrT9uvUAXxdpliS9rJVsJABc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dqioycs1Ow8Q71tGRxcAosj+cDPOMXlabkaBgQ02qrps1xkElLx26IWhHzkL6Li6lOklmFGqfyC20Z5ol2ZUOuRaLzdtCuo3kaiUYJqwKogwz7S+fyvuDlxLV9yN+WRT77cVtqAkVvR23H4PQDzHeQMHdUKJ4S4H7ZJ8JvzLErE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyaqVpmJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyaqVpmJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso50232215ad.2
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960977; x=1791565777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkxMy1Mx1AmQEa8UR49QVnQhvwoc8QcMpxJihofQjBM=;
        b=cyaqVpmJDuPiPEghobEXpxK2nfhsCF2YWXFHs/dYrkrebPT5rg/LciA9TC0KZtn56e
         BgeTGdTsbKXxfwZnoVSh5WWIUD44DPVlomikLLHjxu/IN0XXJPsFiEUo+U8KSOIG+o/t
         g4V0nAch8wYzmQY8aeZk1h/NtDHhXrGPy03wKVP638xf6AOA2qxQUaWg10WRprNp4rTi
         0TSNaFl0SbYRaFJi1+aU37pDViTitQVC8MktYoASScDYbC+I0WKCNJeGyXWsHzD8VbYf
         lx+fA9g9lXHyJdyplooDdgTYfEmbOub+4Ngtan9UYXQO7YWX8+WNW/FVsWXQEcrM1j3N
         3cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960977; x=1791565777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkxMy1Mx1AmQEa8UR49QVnQhvwoc8QcMpxJihofQjBM=;
        b=DxlXqSklWNJctKFCxg6xNq5ku03sLJ9iuQ5bC5iVeoB8zuIWEzQZrk937M92Mvk+GU
         LV4yU9XxooNq2urRQBtZ1ASs+xpZPeh4Qqory3JL9xvp8430O7jhmzU7GtC+WNSTgKUi
         5V5+8UxktmnyF3O/y8TmcQa4DqVIxE7cc49hudxSlazm7CZxhF83oUnBeJ5/Y2czTOT3
         mjLGxmFZJGfHd71xHnqMDE48T2r6mGAkedJ5QjSBq3NEksDQFaR0MtDx/9u/yMF9qlKG
         R7dgbHeCVVvY1NIZ66FhFF3yO/OnmOPjbohIAPK3/Vgg0PLx6jN8iVC7QqK7lGeBhjRh
         f7uw==
X-Forwarded-Encrypted: i=1; AKwUvBx516TRjsoQaDqlAy8FQYUpJm+Rwe0Z0qw/+xeT8NWnBZmaMB4wNcP8MPfG636kcyoYQwp0@lists.linux.dev
X-Gm-Message-State: AFq9FYJd+P5Oe0XCPLOAex9+ZH9rN+gA6yFhO0r+pB+ratnQ9M1SS7QL
	viTzTbLSfz8m930D0gv00sgAb4T2F2Hcqv5ULMiFnrEqdo1rflUhKbjT
X-Gm-Gg: AYBFou2zsJU/0IWrqfDdogh8iXgHNi97X0UAIG0wPn7xw99Dkq/+ainSSu+xRgIg2jv
	nQbCKD1s3IPsx6gfQIHphs9ZgxzKCefxLsZeeIabzKuo2mhnuTlFcx8EZOxCWxguKaIaARbCKdO
	Ah634Yk8rQD0YHXsVp174csX4lIirvVqo13l3nzYCI42bUWgSuyjuwQmfxQPBPnMA0Ta3xbXK3Z
	zUDlsbYYu5KtF4mLI75SvaTr9JxbusuHCX9GNNzrWGrMp0juo0miefhcbs1UNzFVSWIRQbONRMk
	+CsJUOGbffDRXcFQpbA9/4O0oTGs9Ik4ax4ZSU971bebNEkdXYqrFaTKgSudOELJdMr+n3qThgb
	qfXOnGY6GGAB8yg7iwoIW/J18OKqiLUL6hCw36dXIkyS7s5IFeG+/rcCKjgyIeocAMcpoCcI/uN
	B3KIVNWOX3mGfvAChQ0vUATbNp43FhrTkyVX0feFR1Q3l1l8AOTuoAxgRKg2ImqULNsB9d3mMGk
	htY4cjHoiirOdFDGA==
X-Received: by 2002:a17:90b:134e:b0:3a4:aa26:21c7 with SMTP id 98e67ed59e1d1-3a6ceae5a45mr3035280a91.25.1790960976257;
        Fri, 02 Oct 2026 10:09:36 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:35 -0700 (PDT)
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
Subject: [PATCH RFC v2 03/15] hazptr: scan all per-CPU slots before overflow lists
Date: Sat,  3 Oct 2026 01:08:35 +0800
Message-ID: <20261002170847.3653663-4-kunwu.chan@gmail.com>
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

