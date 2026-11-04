Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811432;
	b=NhGS5hmyxFiYcA+2HssL1Fm7nrPrdVKCLroQtE8BugST4HFADnQVc1MFjYgH4XA65odB
	 0sJEqd7AsWOsh4LzY1AwVh02e6pzd8w5DCUBNDRBDCgUt/3EBLJ0Fng76RB+dDP77HkOZ
	 QvDHosrVjj2jDaon+2UxDkEQ1lSPi4sB4MU0ljv50eX4YzDGPr5lHziCMkD/Oj9H8oYJX
	 f6qZr0xTWgTTFAkC3LiqjRV/aLbMgYTS+yT35EO+HxCYo39+bEnZZ1hTN+RendgvShl96
	 SDZAoFnzvzewiz2ygp34bZA1ufrdoFi0aOJvMEHdUQs7HMpk382kxl3KEfVaR76EFzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
	b=uKmbPYwywqyBWGzD+P1jSuF9S0NxsZP9vLlWWqUDG2aotudRnaJUjU1NnCju4MU8+73E
	 kgf7J6bn6jSBtFb0VG39AwuoJuTnql4BIikUYaHHhGV13rnQvixHL+ahtKjnKzoHClNXJ
	 O/Ww2Molb4/GKNAYytJR0FqXDMCEIZE3yWc6QO0U5UCsBoxQ6PANTW7uXKpu8fwfsYLVU
	 2CvBIXfsS4U2jmNqBXh6BDTdpYyz+Vx6aArw5dBerp/ufTItRrb0rbIrvDNb2Mzf4JsUI
	 9laemm8xOJmfrtkT8vhiejY/dObTWIGGWcSNjmTXzdRDyPOgu/YBovDMIgE4b9c231Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4iHITKz;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A23606D81D
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A23606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4iHITKz
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so919866eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811431; x=1794416231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
        b=s4iHITKzWz9t4MK8MMY3wTQ7yfTUHT2iJg12f35qwpsGnXFYhTmAN2qDfCj6t5uSIv
         n2L3mvVgHLlvW0/6VLpcuHNNuRQ5roLi45amiFBoitVL+ps1QqmHyS3tLw3aAuoSdfz3
         OJ0JtZ6/apCte1Rxz/POtbZU24Renc3WXUsdv4c4TPKtxW2ppZHuCncs3u5lI/0JjL72
         bWHGBsZ+ClsB3i3+CIKlR2BpUsnwBNfKIHNJ4eZOboQMW8gDAGkqQVMJ6k8wEh/Wkgot
         GmkUGzxOmw6ihphm7N48IwU50MCZdxErl9eQcruslnxh7FTu54Dky3RksCvyIROvYadp
         Zu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811431; x=1794416231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXppOOg9gP9zhrC6rnkPUZoXeQTDUJQYOVYW2OTPzPI=;
        b=QP7s0Iqca76fsybQisdqyoJGr+v9wOMfzyuOtLARoFTHGvUpddQc14ANoEc/XOHOux
         pRyjQByTMkCy2NrbnHJRCkOyu+bucsc9zEzcst5pOR7o58XVZ8+WOVdOmbexWasRbSLG
         uUe4S9vsxB5O2ygJTaziJltQoRHnEL8D6+lTE9wNP1VOaXjAakLRLPGFIQpX2iSNoaFr
         sjPQmpBOfVHBum9HAI6WTrZ0k13VV1YWwQMBbuhADdOrvVEgIiTneV2OyzwNlQFyk1Mg
         EHY5YZci8ThvKQR5f3hPr0f4JJf35fw1fgD3wjR4IWhforM5n0B5DuA/OIlzQxN20hmY
         4dxw==
X-Forwarded-Encrypted: i=1; AKwUvBw3qt34KHy/7q0twAotVi36i3nINizSNJCWRunUQTw746wa07Z1P6xjfBWf7xT2XWlsL0tS@lists.linux.dev
X-Gm-Message-State: APuU4Z9X7yC1dP70O4nkZ60XMaeB4wECEtz/qEp7ik61Q3c8nCafQNKx
	tsu3BUplfzZKNPkaCpNx1V6vFZh+fn1j9DyC9PAVATBlIH4BUyILuX4F
X-Gm-Gg: AYBFou3FfFQJ86xebYl2h6V86aHrE3ww7f+kknKbpJDzvFkIYw573QjnWdmmhiyP+qM
	XRBoZzWI70fYP6v+h2EMCFKC4d8p69Y/z+HBZeQ+GjGgAnzNM0oAkLeN0L121mwSTzqRp1TcNKk
	Z6JvVOIpVQkS+1N0Q2YMkLPmhZHO9q52NXp3H3YP4dVpgsPgWqH1kHcgTFRWnBi5AMacJLkPHhS
	QBKCJqft+K2sniXzxLaB/hbLdHL9tsymwDWILv+NHTEIBKBC4+pg0y6nCBe/rJvsm0yUcIapXWp
	Dm/2nQH7cA+NbcReUXDAmMH1ZPBLINIRuLWfd9VUprZ0OpdEjWdeODPKMk9uPrtVimW6AypRsNe
	ESi02RuOzYpCuAayKri7R7udG24pMX4fyfKHIn+4VGCm+XJpRkRPz7OD7OGcw4fgixFrQpa5tL1
	X6ndvWxOkV8OMx3L4QQ6NFKIPf+ZXWYbfz7j/UD9W2XMzTN2Xi+H/NkHiBd43LTq/ptTDzQzpRC
	U3NBVqTFX8bwroi9vg1MLSGHKdds0ffqLY0qRtmoy3LbYPs39Sgn4OvWx51suK5iTIKxl0JQ8IL
	l3oJ208tUGQemyFvw1jwNrOikBNsJ51D41BWdWg=
X-Received: by 2002:a05:7301:b82:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36de5f700bbmr85786eec.6.1793811430093;
        Wed, 04 Nov 2026 08:57:10 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:09 -0800 (PST)
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
Subject: [PATCH 12/28] hazptr: Remove per-waiter scan fallback, simplify synchronize
Date: Thu,  5 Nov 2026 00:54:30 +0800
Message-ID: <20261104165504.2430480-13-kunwu.chan@gmail.com>
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

With try_acquire, per-CPU slots publish their target address
directly (no wildcard transient), so a single Bloom-walk pass
suffices.  Drop the per-waiter exact-match fallback that
busy-waited on remote slots; waiters whose address is in the
Bloom filter wait for the next scan cycle.

Extend hazptr_scan_walk() with an optional @watch parameter for
exact-match lookups (used by the upcoming stall detector).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 104 +++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 059c356ceaa7..4784df78be4e 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -39,10 +39,6 @@ struct hazptr_overflow_list {
  * successively iterates on both lists. Therefore, only list removals
  * can cause the iteration to retry, and the number of removals is
  * limited to the number of list elements.
- *
- * Due to the overflow list raw spin lock, the hazard pointer readers are
- * blocking, starvation-free with bounded waiting, assuming bounded critical
- * sections and no NMI or virtualization-induced holder preemption.
  */
 struct hazptr_overflow_list_flip {
 	struct hazptr_overflow_list array[2];
@@ -153,12 +149,12 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 EXPORT_SYMBOL_GPL(__hazptr_acquire);
 
 /*
- * Perform piecewise iteration on overflow list waiting until "addr" and
- * wildcard are not present. Raw spinlock is released and taken between each
- * list item and busy loop iteration. The overflow list generation is checked
- * each time the lock is taken to validate that the list has not changed before
- * resuming iteration or busy wait. If the generation has changed, retry the
- * entire list traversal.
+ * Perform piecewise iteration on overflow list waiting until "addr" is
+ * not present. Raw spinlock is released and taken between each list
+ * item and busy loop iteration. The overflow list generation is checked
+ * each time the lock is taken to validate that the list has not changed
+ * before resuming iteration or busy wait. If the generation has
+ * changed, retry the entire list traversal.
  */
 static
 void hazptr_synchronize_overflow_list(struct hazptr_overflow_list *overflow_list, void *addr)
@@ -228,8 +224,8 @@ void hazptr_scan_cpu_slots(void *addr)
 	}
 }
 
-static
-void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
+static void __maybe_unused
+hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
 {
 	int cpu;
 
@@ -310,15 +306,28 @@ static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, void *addr)
 }
 
 /*
- * Walk all slots and record observed non-wildcard addresses into
- * the Bloom filter.  A single pass suffices on the try_acquire
- * fast path (readers publish their target directly).
+ * Walk all slots and return true if @watch (non-NULL) is present.
+ * If @bloom is non-NULL, record observed non-wildcard addresses in it.
+ * A NULL @watch means pure collection mode: never early-returns on a
+ * match.
+ *
+ * A wildcard in an overflow-list slot means a slow-path acquire is in
+ * flight: that slot may resolve to any address (including @watch or a
+ * Bloom-collected one) after the walk.  To keep the single-pass
+ * completion decision safe, the caller must observe wildcards and
+ * defer completion decisions for one cycle; @wildcard (if non-NULL)
+ * is set to true in that case.  In watch mode, a wildcard also counts
+ * as "present" so exact-match callers do not complete.
  */
-static void hazptr_scan_walk(struct hazptr_bloom *bloom)
+static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom,
+			     bool *wildcard)
 {
 	int cpu;
 
-	hazptr_bloom_reset(bloom);
+	if (bloom)
+		hazptr_bloom_reset(bloom);
+	if (wildcard)
+		*wildcard = false;
 
 	for_each_possible_cpu(cpu) {
 		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
@@ -329,8 +338,11 @@ static void hazptr_scan_walk(struct hazptr_bloom *bloom)
 			struct hazptr_slot_item *item = &percpu_slots->items[idx];
 			void *v;
 
+			/* Pairs with smp_store_release in hazptr_release(). */
 			v = smp_load_acquire(&item->slot.addr);
-			if (v && !is_wildcard(v))
+			if (watch && (v == watch || is_wildcard(v)))
+				return true;
+			if (bloom && v && !is_wildcard(v))
 				hazptr_bloom_add(bloom, v);
 		}
 		for (int i = 0; i < 2; i++) {
@@ -342,16 +354,24 @@ static void hazptr_scan_walk(struct hazptr_bloom *bloom)
 			hlist_for_each_entry(b, &list->head, overflow_node) {
 				void *v;
 
+				/* Pairs with smp_store_release in hazptr_release(). */
 				v = smp_load_acquire(&b->slot.addr);
-				if (v && !is_wildcard(v))
+				if (watch && (v == watch || is_wildcard(v))) {
+					raw_spin_unlock_irqrestore(&list->lock, flags);
+					return true;
+				}
+				if (bloom && v && !is_wildcard(v))
 					hazptr_bloom_add(bloom, v);
+				else if (v && is_wildcard(v) && wildcard)
+					*wildcard = true;
 			}
 			raw_spin_unlock_irqrestore(&list->lock, flags);
 		}
 	}
+
+	return false;
 }
 
-/* Need is_wildcard for the Bloom filter */
 /*
  * Shared scan: batch concurrent hazptr_synchronize() callers into a
  * single kthread-driven scan, avoiding redundant per-CPU and
@@ -416,28 +436,32 @@ static void hazptr_scan_do_cycle(void)
 	}
 
 	/*
-	 * Walk all slots and record observed addresses into the
+	 * Scan all slots: record observed addresses into the
 	 * Bloom filter, then complete waiters whose address is
 	 * not present.  On the try_acquire fast path, readers
 	 * publish their target directly (no wildcard transient),
-	 * so a single pass suffices.
+	 * so a single pass suffices for per-CPU slots.
 	 */
-	hazptr_scan_walk(&hazptr_scan.bloom);
+	{
+		bool wildcard;
 
-	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
-		if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
-			list_move(&w->node, &done);
+		hazptr_scan_walk(NULL, &hazptr_scan.bloom, &wildcard);
+		/*
+		 * A wildcard in an overflow-list slot is a slow-path
+		 * acquire in flight: that slot can resolve to any
+		 * address after the walk, so defer completion
+		 * decisions to the next cycle.
+		 */
+		if (!wildcard)
+			/* Complete waiters whose address is not in the filter. */
+			list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+				if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
+					list_move(&w->node, &done);
+			}
 	}
 
 	mutex_unlock(&hazptr_phase_lock);
 
-	/* Waiters still blocked: their address was observed present. */
-	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
-		hazptr_scan_cpu_slots(w->addr);
-		hazptr_scan_overflow_list_all(w->addr);
-		list_move(&w->node, &done);
-	}
-
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
@@ -496,8 +520,6 @@ core_initcall(hazptr_scan_init);
  */
 void hazptr_synchronize(void *addr)
 {
-	unsigned int scan_list_phase;
-
 	/*
 	 * Busy-wait should only be done from preemptible context.
 	 */
@@ -521,18 +543,8 @@ void hazptr_synchronize(void *addr)
 	}
 
 	guard(mutex)(&hazptr_phase_lock);
-
-	/* Scan per-CPU slots. */
 	hazptr_scan_cpu_slots(addr);
-
-	/*
-	 * Scan overflow lists *after* scanning per-CPU slots. See
-	 * hazptr_promote_to_backup_slot() for scan ordering requirement.
-	 */
-	scan_list_phase = flip_list_phase(hazptr_overflow_list_phase);
-	hazptr_scan_overflow_list_period(addr, scan_list_phase);
-	WRITE_ONCE(hazptr_overflow_list_phase, scan_list_phase);	/* Flip the current list phase. */
-	hazptr_scan_overflow_list_period(addr, flip_list_phase(scan_list_phase));
+	hazptr_scan_overflow_list_all(addr);
 }
 EXPORT_SYMBOL_GPL(hazptr_synchronize);
 
-- 
2.43.0

