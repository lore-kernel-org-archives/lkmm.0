Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811340;
	b=3qRAXxLv4A0TrZze90iLiV0b3NL0in2n+gndVs2SWw6gaGVA7LGKIbeD8afwtiuAF4kX
	 YgqzTk1X48lrGmB4/ECuF4kJAs4DSNGVAAxeL8uJZkOwewIxP1WTZNomWyEh9PYi8WBxL
	 dgMGyKBsEO5p8W/PmZObK0Vl8m+HYv+acxfVR4GZTMR49xkeXO21GRzsl3tz9AhndbSxK
	 U4kYN30BTkaKywMyQoul0lGYNcOSjfqIylHVjVmRivlamp0p8oqTjXJA7iVO80chPnus5
	 l99TgPuceQWB2fU+/gyF6YZ1MMQegzjk/dWiIyvHEyzQfZSWotckCoKiGnFbmK0Kzjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
	b=mcqneXlaZwCSVRtv3BVmTJmBqh3DsgNAgawNL8jD/tcn4ZjexyUhIS2nA3kWc9zlxT9M
	 RE2wOZ4zJebz+UEedQn16ML1jOrPRL2F8C/RvD0ZTBAec6HvlbVxRGiCGqcCi64sJU3P9
	 5fLFZzN+Y5MQ2fn9zcCyArnfD5o0HR/X9ofX3ZkHNtSldyQkkMgbZGwvI9jQV1ZX8UjaT
	 MZY36LakA8ipHlCZMmdd5+1TYCKyDpz1qtJd4qHCTWf+ik20D9yZDa7y+0uIzoMMarpPt
	 kXmWxbjavWTAkuDl2WVAfp7sj3fx149XdYExUEokvc0gjruevYAhnxSRWwW8+B60Elg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SNkV4xg2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F58606A31B
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SNkV4xg2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so1255228eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811339; x=1794416139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
        b=SNkV4xg2NStB8zybA9GfrLsr1pc3wMRzyjPOufgLHju4txE7+s7wgT2swT0ypneoJ4
         TnRY9oC+tnVEkxgM2wmuJ9y+KS++jrIwTsqtLoVAQFTWRFpJWWCMDH0F6HczXjbcRjkx
         yqnXQw8QJ/M9ODEmdgWKtFwENDn/SdIMao0nGd5nXMObU3sYkbN1FrstPSdQFspis9Ze
         2ZGtwJWD5hQYVEQwheyQ52r1VQ5LbJKJDQbv2Zfs//uM58nJMfYSlIl/4jHT585bx4cq
         AXAMsXJmYRR4fgQ+Slbh/j34mymuuD05Eqrb84QTtGds38Yy23rt6uLZh0ANhKnd6Qbl
         wh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811339; x=1794416139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfiEJ9ZFFgFLvm1lz7uB9aBGd1QKPWSUh66STtJdHAI=;
        b=ErO+fDdff4PwNLGSLLRxGzAQiA2mRf2j1Ge80w7e4v5T41cnYLR2wdlm2ibmGVZSLG
         LJ1jSP+cuQPtRkKv4Xluu8dDI08K2kTcqEyGI3ag4mPBpYi1no82mG3f7mBjYgF6MRJS
         LBgpqGB5xHPoCjjqjMwsMOL7Nx3rP+clEULZzFAacuh0dJi4GAIT90GouBGRqdyVEvJp
         xiIgZ1mcewQtKCyGTX3wqJdZeLGcJy1/1wtOcStTCqCUn0cb8js9RL9KYwhg0nWSkcYX
         SldPVTGpXaCO56ebGFD6VbLaq5fO9zHJRA1nFjSy0tp+D178k9524Zb59s577Gk4JUEV
         u8sg==
X-Forwarded-Encrypted: i=1; AKwUvBxueFt0RMPAT7HYE+TUxRqv75WJbYtQlseWOLyYPR59cs2KKG7oVAEPRSBJRGNmXSn+DXJY@lists.linux.dev
X-Gm-Message-State: APuU4Z9Hrhp1XpYjpn6OVPSR+6ZQR9FyraiG4496pW5KwIaWJPAC7hC9
	4FH2UM0u7pG5zuqvLVbngKd6xykr9QUZS6Ss2Kt5ddWce3UFyAFTEBVS
X-Gm-Gg: AYBFou1BnOZCpSMiXH48HvK5o8iQ8aYZDUctLJmhxZWQ3etTOduPe7fUFkxSnNFMD4C
	tKX+ICNgQqT0FSlUOPFbXjYy9Bu9dZCPsqPYbHmsR/OmGTAli9zGgC9UKu5n3y+/mgDnbvpZ1Mp
	0EuaFAPLH4JJtRdnqz9O8MlHDYHkHVOcHBZ/0o+DD63VR4b2BmQGBsO05DPtzS4Zd1WnJ3kgPwS
	T/jyj+/F5bcqdegn6DNX98scHcLe/Ff2fZHwIgmGCF/fcMldf5qDfN5cS5zkHVEZlwCl2QJCIoX
	0w8yHFptinfR8tEw85OKDo2ujkpJ1lkuiiD6LoWbKCmbKM944yWlghkAHKkhafpBnhhhGjJyBpE
	1NglhtI/lAwQDQB1zXHII8QGO+dsZHWKBDDPEKAv4luDnFA2gzyyvaeqQQtF8vKcfYZ6Cfv6ZKj
	tBUPzPfYMN1RkX2h3EZkb55liubpQNMnaiEhjFPn2FjshtrMTIb7Q+vJ37Po/R7zZp+S9l77DZs
	NFtgJOH71w8MvP4LXXAgn8BQJ/dWbcpn+HgWWeou1hP21J2fhivDJIXumkbCtlbcymYp+CFiNKV
	px7wU+rmWr6whAd2xitke5eZr+ZbD509yh32QKc=
X-Received: by 2002:a05:7300:dd42:b0:36a:7c69:3f83 with SMTP id 5a478bee46e88-36c8d2540fcmr6653140eec.3.1793811338443;
        Wed, 04 Nov 2026 08:55:38 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:37 -0800 (PST)
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
Subject: [PATCH 02/28] hazptr: Use Bloom filter for shared scan waiters
Date: Thu,  5 Nov 2026 00:54:20 +0800
Message-ID: <20261104165504.2430480-3-kunwu.chan@gmail.com>
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

Replace the per-waiter sequential scan with a shared Bloom filter
built during a single walk: each observed non-wildcard address
sets three bits.  A waiter whose address hashes to an unset bit
can be completed without another slot walk.

A Bloom filter has no false negatives, so an address absent from
the scan cannot be held by an observed slot; false positives only
delay completion to a later scan cycle.

The filter uses a one-page bitmap with three multiply-shift hash
functions.  It lives in the hazptr_scan_state and is only touched
by the scan kthread.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 kernel/hazptr.c | 122 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 6 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 013c24021c43..059c356ceaa7 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -16,6 +16,8 @@
 #include <linux/kthread.h>
 #include <linux/swait.h>
 #include <linux/sched.h>
+#include <linux/bitops.h>
+#include <linux/bitmap.h>
 
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
@@ -57,6 +59,12 @@ unsigned int flip_list_phase(unsigned int phase)
 	return 1 - phase;
 }
 
+static
+bool is_wildcard(void *addr)
+{
+	return (unsigned long)addr == (unsigned long)HAZPTR_WILDCARD;
+}
+
 static
 struct hazptr_slot_item *hazptr_get_free_percpu_slot_item(void)
 {
@@ -252,6 +260,98 @@ static void hazptr_scan_overflow_list_all(void *addr)
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
+/*
+ * Walk all slots and record observed non-wildcard addresses into
+ * the Bloom filter.  A single pass suffices on the try_acquire
+ * fast path (readers publish their target directly).
+ */
+static void hazptr_scan_walk(struct hazptr_bloom *bloom)
+{
+	int cpu;
+
+	hazptr_bloom_reset(bloom);
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+		unsigned int idx;
+
+		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
+			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+			void *v;
+
+			v = smp_load_acquire(&item->slot.addr);
+			if (v && !is_wildcard(v))
+				hazptr_bloom_add(bloom, v);
+		}
+		for (int i = 0; i < 2; i++) {
+			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
+			struct hazptr_backup_slot *b;
+			unsigned long flags;
+
+			raw_spin_lock_irqsave(&list->lock, flags);
+			hlist_for_each_entry(b, &list->head, overflow_node) {
+				void *v;
+
+				v = smp_load_acquire(&b->slot.addr);
+				if (v && !is_wildcard(v))
+					hazptr_bloom_add(bloom, v);
+			}
+			raw_spin_unlock_irqrestore(&list->lock, flags);
+		}
+	}
+}
+
+/* Need is_wildcard for the Bloom filter */
 /*
  * Shared scan: batch concurrent hazptr_synchronize() callers into a
  * single kthread-driven scan, avoiding redundant per-CPU and
@@ -272,6 +372,7 @@ struct hazptr_scan_state {
 	struct mutex lock;
 	struct list_head pending;
 	struct list_head scanning;	/* kthread only */
+	struct hazptr_bloom bloom;	/* kthread only */
 };
 static struct hazptr_scan_state hazptr_scan;
 
@@ -315,19 +416,28 @@ static void hazptr_scan_do_cycle(void)
 	}
 
 	/*
-	 * Process each waiter: scan per-CPU slots and overflow lists
-	 * until the waiter's address is released.  This is the same
-	 * scan the direct fallback performs, delegated to a kthread so
-	 * callers sleep instead of busy-waiting.
+	 * Walk all slots and record observed addresses into the
+	 * Bloom filter, then complete waiters whose address is
+	 * not present.  On the try_acquire fast path, readers
+	 * publish their target directly (no wildcard transient),
+	 * so a single pass suffices.
 	 */
+	hazptr_scan_walk(&hazptr_scan.bloom);
+
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
+			list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_phase_lock);
+
+	/* Waiters still blocked: their address was observed present. */
 	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
 		hazptr_scan_cpu_slots(w->addr);
 		hazptr_scan_overflow_list_all(w->addr);
 		list_move(&w->node, &done);
 	}
 
-	mutex_unlock(&hazptr_phase_lock);
-
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

