Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426743;
	b=cKa+iU+ObFhXZ67lNucQ9CsNUBpWthJ6JlaK4XLSHiXFCWyrTSawMn0GE3Srp/TVaUUf
	 bnkDsnzffN38qIS4jlF5f3Dqvj2bx3ysaKzitq5j4ukZX8BfHuS32tX6/ylfvO5bRmh9Q
	 02zcx19XWJaF0GXMPeyhPMoSXTMLaN2onYskgmvy3izsiDCQ0Ue/8FCBQIikt1XkPp+Pb
	 KiuKBW/9c4Vs8lda2HtDOu72SciE5XTikBtUDGO1Zp2nbSkMkvNoNJxVtoSmGm81MF+xM
	 tfu7G4VIhXSxYAPpp+grm2E10ZevISEuxYqoqbDFpAMgAmVXLbwWGTBSJiTbpGFbH2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
	b=rTEPJDQnfica7n/waLP4CFjPupTtJgbWUunRUH5ted55us0rzhe4MRRsMQPuABEm8Uxw
	 KqVf7NTYDRBi70pyf2xL4/8lGptn/tdxksHvD0YJ72Llj+x+oXbSLTxiNvkK9TzZVHlct
	 6GDCddvdTFWD8is7wSi8A7H6/R1YpCKiUQhFAbHpGmj2aGuoKmvBjqCKI6I2VbzD4qMmT
	 sbyglcuO+cSvELQnfmUXezEjiuTcrwlh6Gb2AsGy+CDXPJbcZa99ERBE3EtmvJzhBS/h3
	 Kv15ewMp25KoQnXYOkdg6HN76PnMju9UlOQKDp+7QJEPCx1+Lx+v8PL9KVBlQDa/RZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Na+S3H8X;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E2606A339
	for <lkmm@lists.linux.dev>; Mon, 19 Oct 2026 16:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867E2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Na+S3H8X
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1484824f8f.2
        for <lkmm@lists.linux.dev>; Mon, 19 Oct 2026 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426742; x=1793031542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
        b=Na+S3H8XGj5WgBTTB+1xaZl6NPRPEcIWQ4I4IArKcUfvn/OFZ6hPSJ034699czvFIw
         HcgMLEcrMJUkr0ztK72B+/GmgAI7wH3Mni24Xthcb+j6x73l4OElCxxsBq3BkkC6uTOY
         qqF7Y/dmgttPEFnJBo5Izw7hIX8YJyHVqAehgQ5+dgwBxYUGrBe/Eb4x0dkVnZkWKHI1
         6lCYtT3Nwuk8LlYQDh7WU8HA/jMdKZ5Z9QWpUNjFhKoeUv3OfuNIyzuaOw+i91HdtUNb
         6YNomvzcnQ9md9g9FE/N3e7Y1MajV8/QpvlmFexnsjA5bNRqD32v1/NTvjRcfAEt+anF
         Yu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426742; x=1793031542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9Tb0vIxGUTYeQFZpnnr31SkLxL+7bR6Ze3b3cjJEa0=;
        b=X+JRsaeGCbOC4JT+0uDyAwDu54pYjjSfo1aoxryxKGp75CQjis5xuOKi8t87iNYxVH
         my8c6o+DJB0GOOZrK9qO5iUxujpJiginGsSGXF4QMCkb3/IWqA9oNra6SqN/6Z0L19ji
         KXOR58i5vT+0eDnhYnTC51d3QzsgqS5XETdY2TS/M5kgZ2ioxLgee+8ZRNIgs01/QAv+
         s0YN85FEYvyyKOomCHS5ImsOneWKaLX3CUqXBwZF5VLCqtxCdSfxGb438FULKvKmOw4P
         7UUDdfvkiMTtbCTpmyR1p3SnJWnMprLwQUNwndZ0iAC+IIwya/dyhL+CXCp0b9wLV0X6
         yu3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPsrzVAYh/vw90evBWpCbXOGEN9OzruLcGTrtgu/1eNGAtSqdkW7nO2biN+Xagd9hFKXha@lists.linux.dev
X-Gm-Message-State: AFq9FYL3mBJOhiaS6pOGrRAhfQ6pypwZ2EC6zhqGmtLzS0IzM80j6fB9
	2As+6mz/I5wHPtlVtRQhEfemTM0DnsHuiePrpNEAB3xkTLSVjKKzINPB
X-Gm-Gg: AYBFou0IofRwy33Y7e9bmOfUlwSJvEKgvOyXXTQf2hzo6dE0j2PKbMgS+2lSsbkCEQi
	7eDAyCEjXvCv8E9ibpiumTey+mmMtkvrhlihZwVRuOoXVUdCKxq5LVXWs/sIcFfxKh1TXh4lgo4
	4stzzggvY6GA/bobdc2h7ET6D5uxqQREJp2kjw994ANA+pHZ4XtGS1tdQ8EKbf9PPJ0HOzhd8rZ
	6PiD1X+z4pRLetefrQKILCJeBgauE+be/dYUc2sQhlh8o/M+ysq5/tgUMFiEanOgqiNAVQ91MJc
	djjlLcmKu/9Y2w0XHoNkozPhaY4aS0mXxyeaIPyCdNY/w+0HdYAbyLcPylHQvPVjFCm2FsiEzZq
	yZ8e5CBnKj2Gt9rHI6coBVId2wC0LOq+PAGT5yIPFSN0YwfgBWwbWcrRrWOg2P90z2SMssnsHOO
	DzP2tDfMi8PNeVGS7cKSJZ4Wr9Jac4+qwxzCirBO8Zx/Tg6mpV0tDQXwVYgNNGvWHRlj1PWnVlt
	3Wq+mPW6zukWgVoFOX8J4NBOOlTEnA7MkWqxdrE43IxE9TlNIf0cA==
X-Received: by 2002:a05:6000:260a:b0:486:f9ea:796f with SMTP id ffacd0b85a97d-48e07fa67d5mr16626694f8f.41.1792426741547;
        Mon, 19 Oct 2026 09:19:01 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm25961466f8f.4.2026.10.19.09.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:19:01 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC -rcu/dev] hazptr: Record per-CPU slot owner after claiming the slot
Date: Mon, 19 Oct 2026 18:18:48 +0200
Message-ID: <20261019161852.12783-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
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

An interrupt that uses a hazard pointer while the interrupted task is
in the acquire slow path can leave its own context recorded as the
owner of the per-CPU slot the task then publishes into.  The next
context switch promotes the task's pointer with the interrupt's
context.

hazptr_get_free_percpu_slot() records the owner when it picks an empty
slot, but only Store B in __hazptr_try_acquire() claims the slot.  An
interrupt in between picks the same slot, as the lowest free one:

  Task on CPU 0                        IRQ on CPU 0
  -------------                        ------------
  hazptr_acquire(ctx)
    fast path fails
    __hazptr_acquire(ctx)
      picks item k (empty)
      item k->ctx.ctx = ctx
                                       hazptr_acquire(irq_ctx)
                                         claims item k
                                         item k->ctx.ctx = irq_ctx
                                       hazptr_release(irq_ctx)
                                         clears slot k
      __hazptr_try_acquire()
        Store B into slot k
      (item k still names irq_ctx)
  sleeps holding the pointer
  hazptr_note_context_switch()
    promotes item k with irq_ctx

The task gets there with k > 0 when it already holds an outer hazard
pointer in slot 0; no other task can, as its slot is promoted when it
is switched out.

The task gets there with k == 0 when the fast path leaves slot 0
empty: either its ptr_eq() check fails because an updater changed the
pointer, or the pointer is NULL and an updater publishes a non-NULL one
before the slow path loads it.

The promotion moves the task's pointer into irq_ctx's backup slot,
which nothing unchains, so hazptr_synchronize() on that pointer never
returns.  The task's ctx->slot still names slot k, so its
hazptr_release() clears whatever another reader on that CPU has since
published there.

If the interrupt detaches instead, as hazptr_torture_acquire() does,
the promotion chains irq_ctx's backup slot a second time while it is
still linked.  The overflow list then loops on that node, or follows
LIST_POISON1 once hazptr_unchain_backup_slot() removes it.

Record the owner after __hazptr_try_acquire() succeeds, as the fast
path in hazptr_acquire() does.  This should be safe because an
interrupt that used the slot has released or detached it by the time
the task resumes, and only hazptr_note_context_switch() reads the
owner, which cannot run before the task enables preemption.

Fixes: 50b568234163 ("hazptr: Implement Hazard Pointers")
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---

Notes:
    With this patch, hazptrtorture's NOPREEMPT scenario passes a 30-minute
    run on x86_64 with 8 CPUs.  PREEMPT runs clean for 30 minutes but can
    hang at shutdown, in hazptrtorture's release of deferred hazard
    pointers; that hang does not involve this patch, and is addressed by
    "hazptrtorture: Release all deferred hazard pointers before stopping",
    posted separately.
    
    With that fix also applied, 30-minute runs pass for PREEMPT, for
    NOPREEMPT with torture_type=hazptr, for PREEMPT with
    torture_type=hazptr-stack, and for PREEMPT with CONFIG_HAZPTR_DEBUG=n.
    
    PREEMPT and NOPREEMPT also pass without this patch: their readers hold
    one hazard pointer each, so they reach the slow path only when the
    ptr_eq() check fails or the pointer is NULL, which happens only before
    the writer publishes its first element and after it stops.
    
    A KUnit reproducer, with a test-only hook in __hazptr_try_acquire()
    between the free-slot check and Store B, fails on 940793b926aa and
    passes with this patch.  I can post it if useful.

 kernel/hazptr.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 3ca73b56a5c25..b15b84ebd4ceb 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -54,19 +54,16 @@ unsigned int flip_list_phase(unsigned int phase)
 }
 
 static
-struct hazptr_slot *hazptr_get_free_percpu_slot(struct hazptr_ctx *ctx)
+struct hazptr_slot_item *hazptr_get_free_percpu_slot_item(void)
 {
 	struct hazptr_percpu_slots *percpu_slots = this_cpu_ptr(&hazptr_percpu_slots);
 	unsigned int idx;
 
 	for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
 		struct hazptr_slot_item *item = &percpu_slots->items[idx];
-		struct hazptr_slot *slot = &item->slot;
 
-		if (!slot->addr) {
-			item->ctx.ctx = ctx;
-			return slot;
-		}
+		if (!item->slot.addr)
+			return item;
 	}
 	/* All slots are in use. */
 	return NULL;
@@ -78,6 +75,7 @@ struct hazptr_slot *hazptr_get_free_percpu_slot(struct hazptr_ctx *ctx)
  */
 void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 {
+	struct hazptr_slot_item *item;
 	struct hazptr_slot *slot;
 	void *addr;
 
@@ -85,10 +83,17 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	 * In case we are called due to nested use of hazard pointers,
 	 * try a slot protection with per-CPU slots.
 	 */
-	slot = hazptr_get_free_percpu_slot(ctx);
-	if (likely(slot)) {
+	item = hazptr_get_free_percpu_slot_item();
+	if (likely(item)) {
+		slot = &item->slot;
 		addr = __hazptr_try_acquire(ctx, addr_p, slot);
 		if (addr) {
+			/*
+			 * Record the owner only once Store B has claimed the
+			 * slot, as hazptr_acquire() does: an interrupt may
+			 * have used this slot since it was chosen.
+			 */
+			item->ctx.ctx = ctx;
 			ctx->slot = slot;
 			return addr;
 		}

-- 
2.53.0

