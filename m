Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B04D5975
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220578; cv=none; b=H/3dmt8TiiXNUjV/pq6JeaUaF4MkufSSizOBPGSGfTg305dGQiTajPKLP/QoFizVHKVEYVUIUcwr1ReFUtAiTCJ6vuG/r1HzXsac4oXqUqRfhgVOj47fVAm3B+L6cI6Ey2Sn/zYnjntLdczb4p7SKKp9D2NhVvVCtq0vwRwRlHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220578; c=relaxed/simple;
	bh=LfZ5/lSdai4qmcULNQ0sZLI2MsuRTJuBplORHvku1dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDDozvBZgEvLEoqzsaC5In04KrR0OlbTol5IsYl0N73pimMLs8D28vzxGMzp24DZye9u9E2pbJzog0x2gi5cd8tG0aonspIgTZ/mlgY9tngYh2pZ0Iscqb24wW+xQKooy8gmmhto8LGRTouu5C+E0r0OkQd7A2N37u3sCdc+j+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT0LgSNG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT0LgSNG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so823621a12.2
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220576; x=1791825376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaUov767om1ufidMBuv+Qa8IE9x5ePpDXkwVM9ozpyI=;
        b=kT0LgSNG39bWHvyXXPnLVggavB3ssYy5ZfWtQlwRDCIxRlHorg7RK9qEYIiedDLtya
         sE9otQu+iR2LFSKIfZt13FOfOkTFCVPgt4XyYzWBYtxdePhTPM26omIgczZFkqiiHyCe
         /v6+3e00Pr7qGza3KHX5fmWEbgvPuije3IZ3FfePzXgcNSpLPC3jRWAqza+VZJzxP9+j
         cMJ/aW6oCKLtvDpmZcg0aXYnZm5TH6yOSDfTRk8uJfwdvZOxH9pp9CsdJ+1cfT0o0bBV
         VAE/SpnSlW1lKlRl3rbXIQdloYOQbzgFuPBoBHUJG/oNsW4MVWOLuZqmWeGBVUcsaJm5
         HB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220576; x=1791825376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaUov767om1ufidMBuv+Qa8IE9x5ePpDXkwVM9ozpyI=;
        b=zLp1PUvs3lafCLd+rRPM3m9f6E8O0ydKJA7MV6aC2zWgkCGm10gQZA5t5zZd78VriH
         S8x8yXPn6+v+7Qqo5QxtAG9HE6cDCTt+aWAiHDNTiKQAAgCaZu31zSEaMDLUGtSLb3CK
         9ksDtuMR5+9w7COnvLQn8ZqOTQMDoRQjAT0nQ2IHmeKzC7OKZjZUfvBv6pp3GyOmu378
         g0lVIHApqLcFQS9GeujDNnXRrp2jaC1QqGpzrQXm68Yq9SacFOC4cgVq6Ejtx5wTfH/k
         TrPP6Zv1umbNV15F9cBhewdg6w1rzywkccgirKmw4fzFow6wzKK2lDbn05qDTsdbupAz
         N7JA==
X-Forwarded-Encrypted: i=1; AKwUvBz5qnqKtHxjcEktblTQorsgNco3Ehs9SYLfYBtPGrlb9wz2Cqn/NBDtW54WWtgU2bS4bZC4@lists.linux.dev
X-Gm-Message-State: AFq9FYKbz+7AB4BhiieZcUAuIJfFVnF9fPMHr8sDXdw6FVHFwYlxtFEf
	ndnO60ywIkXhMGHTa73LQ6fNFSDAdEpRi3B9vIlRBxuU917MfEwX3uVv
X-Gm-Gg: AYBFou0vsINajLBuoJvcJUIEwJsN2q0lxc8mFxJj4a1lZ+441lIaVnYtsyu3z6GDDcp
	ZZdlO3HWdYCKlfz4Xwcyea85+FK8YTnzzF1A8DpFArNwqnciN4a2mdeVD53Q/a1Tly5pMxh21cR
	kkq99wwP/MLMbGtxQq8/vl71fCxtEa8ZFX7wxNej0I84H4Y8mmBCvjMR+CG876MdYsWojzHmHWz
	ESPZ/ukU+790NMloB9hFWl8pzf3aF+eZofnWANwKJ673U+RXJGGAPj+zV+NNtkwJh9dBf8D9LLt
	SohXKhI0EkAfcbyXVxcn3sbxX61ONu5ylbGpq4JIJXUUuCOd/dAN9ULNF98C/Of/wLpH61a4Jn7
	uuhKZrlrM14UYfIDYO6UodzSCZpJ+9fABiSNoFHgzLSZEMfpl9J2HJhIAMk7XKvIwBcmLl1/pu4
	ygGwZOHzk2o1l57I5qRc2qX1cD3hGHWNeEtfxC+mLx/QpQrMJk8C7kJZCThOaXHzTW3ZTIbr3/6
	596M6Gsz/2nCbT/p1/PCl6fbYKu1Q==
X-Received: by 2002:a17:90b:4a48:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3a7872b63bdmr7172810a91.26.1791220575398;
        Mon, 05 Oct 2026 10:16:15 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:14 -0700 (PDT)
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
Subject: [PATCH RFC v3 02/15] hazptr: use Bloom filter for shared scan waiters
Date: Tue,  6 Oct 2026 01:15:16 +0800
Message-ID: <20261005171529.1378809-3-kunwu.chan@gmail.com>
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

Replace the per-waiter exact-match scan with a shared Bloom filter
built during the second drain pass: each observed non-wildcard
address sets three bits, so a waiter whose address hashes to an
unset bit can be completed without another slot walk.

A Bloom filter has no false negatives, so an address absent from
the final drain scan cannot be held by an observed slot; false
positives only delay completion to a later scan cycle.

The filter uses a one-page bitmap with three multiply-shift hash
functions.  It lives in the hazptr_scan_state and is only touched
by the scan kthread, so waiter state remains on the caller's stack
and no dynamic allocation is needed.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 93 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 10 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 9e274a691af5..900ba35de2cb 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/hazptr.h>
+#include <linux/bitops.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
@@ -16,6 +17,7 @@
 #include <linux/kthread.h>
 #include <linux/swait.h>
 #include <linux/sched.h>
+#include <linux/bitmap.h>
 
 /*
  * The current hazard pointer wildcard. Flips between 1UL and 2UL to guarantee
@@ -213,6 +215,55 @@ void hazptr_scan_period(void *addr, void *scan_wildcard)
 	}
 }
 
+/* Number of hash functions for the Bloom filter. */
+#define HAZPTR_BLOOM_HASHES 3
+
+/* Number of bits in the Bloom filter bitmap: one page. */
+#define HAZPTR_BLOOM_NBITS (PAGE_SIZE * 8)
+
+struct hazptr_bloom {
+	unsigned long map[PAGE_SIZE / sizeof(unsigned long)];
+};
+
+/*
+ * Multiply @addr by a per-hash odd constant and use the high bits
+ * as the Bloom filter index.
+ */
+static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
+{
+	static const u64 mult[HAZPTR_BLOOM_HASHES] = {
+		0x9E3779B97F4A7C15ULL,
+		0xC2B2AE3D27D4EB4FULL,
+		0x165667B19E3779F9ULL,
+	};
+	u64 hash = (u64)(unsigned long)addr * mult[i];
+
+	return hash >> (64 - ilog2(HAZPTR_BLOOM_NBITS));
+}
+
+static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
+{
+	bitmap_zero(bloom->map, HAZPTR_BLOOM_NBITS);
+}
+
+static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < HAZPTR_BLOOM_HASHES; i++)
+		__set_bit(hazptr_bloom_hash(addr, i), bloom->map);
+}
+
+static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, void *addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < HAZPTR_BLOOM_HASHES; i++)
+		if (!test_bit(hazptr_bloom_hash(addr, i), bloom->map))
+			return false;
+	return true;
+}
+
 struct hazptr_waiter {
 	struct list_head node;
 	void *addr;
@@ -226,17 +277,26 @@ struct hazptr_scan_state {
 	struct mutex lock;
 	struct list_head pending;
 	struct list_head scanning;	/* kthread only */
+	struct hazptr_bloom bloom;	/* kthread only */
 };
 static struct hazptr_scan_state hazptr_scan;
 
 /*
- * Check per-CPU slots before overflow-list slots to match the
- * acquisition ordering of promoted slots.
+ * Walk all slots and return true if @watch is present.  If @bloom
+ * is non-NULL, record observed non-wildcard addresses in it.
+ *
+ * Per-CPU slots are examined before overflow-list slots on each CPU
+ * to preserve the acquisition ordering required by the promote path:
+ * synchronize must observe the per-CPU slot release before the
+ * overflow-list entry can be missed.
  */
-static bool hazptr_value_present(void *val)
+static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
 {
 	int cpu;
 
+	if (bloom)
+		hazptr_bloom_reset(bloom);
+
 	for_each_possible_cpu(cpu) {
 		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
 		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
@@ -244,10 +304,14 @@ static bool hazptr_value_present(void *val)
 
 		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
 			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+			void *v;
 
 			/* Pairs with smp_store_release in hazptr_release(). */
-			if (smp_load_acquire(&item->slot.addr) == val)
+			v = smp_load_acquire(&item->slot.addr);
+			if (v == watch)
 				return true;
+			if (bloom && v && !is_wildcard(v))
+				hazptr_bloom_add(bloom, v);
 		}
 		for (int i = 0; i < 2; i++) {
 			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
@@ -256,11 +320,16 @@ static bool hazptr_value_present(void *val)
 
 			raw_spin_lock_irqsave(&list->lock, flags);
 			hlist_for_each_entry(b, &list->head, overflow_node) {
+				void *v;
+
 				/* Pairs with smp_store_release in hazptr_release(). */
-				if (smp_load_acquire(&b->slot.addr) == val) {
+				v = smp_load_acquire(&b->slot.addr);
+				if (v == watch) {
 					raw_spin_unlock_irqrestore(&list->lock, flags);
 					return true;
 				}
+				if (bloom && v && !is_wildcard(v))
+					hazptr_bloom_add(bloom, v);
 			}
 			raw_spin_unlock_irqrestore(&list->lock, flags);
 		}
@@ -276,7 +345,7 @@ static bool hazptr_value_present(void *val)
  */
 static void hazptr_drain_wildcard(void *wc)
 {
-	while (hazptr_value_present(wc))
+	while (hazptr_scan_walk(wc, NULL))
 		cond_resched();
 }
 
@@ -309,12 +378,16 @@ static void hazptr_scan_do_cycle(void)
 	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
 	old_wildcard = flip_wildcard(scan_wildcard);
 
-	/* Pass 2: drain the old wildcard. */
-	hazptr_drain_wildcard(old_wildcard);
+	/*
+	 * Pass 2: drain the old wildcard while collecting observed
+	 * addresses into the Bloom filter.
+	 */
+	while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
+		cond_resched();
 
-	/* Complete waiters whose address is no longer held by any slot. */
+	/* Complete waiters whose address is not in the filter. */
 	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
-		if (!hazptr_value_present(w->addr))
+		if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
 			list_move(&w->node, &done);
 	}
 
-- 
2.43.0

