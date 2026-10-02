Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B734F5E0E
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960997; cv=none; b=tnqw3+tLN4aVqYcTjmb2YdzlVfSDQSi/V9EhxHNhUJfeVWHLgFpQy9h4tMhjs0lMCGjpxqyBbOg3HDxyknypXnZqGLTqgyBKNYUHBaeTLiC5iblMKnE7Jb+0jYkQXB2CDBVpTNoSAF29xLNmw2xkHCx89mBWS5ECftF0///fj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960997; c=relaxed/simple;
	bh=8NuyF6qDUWQBXBIkLeP3/lavelfuwnWRCmtSE2YKnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDcIXu/JQd5tnPSI63npHO/MywMNUk34+3aJtCLGQVixyuTjWBGRn4QX8DHafvd/C53dHllM+WzIuLeCsmuohg8i4IH9KWiqhYXeNv8X6XpZkwqETEW0jm8KBNJZs2G8nOmKAiyF0kgY474utPTwfeRpXiElKWPsFwvvLj0IqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAeoV50Y; arc=none smtp.client-ip=74.125.227.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAeoV50Y"
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2e2e688de2eso29059775ad.3
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960988; x=1791565788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=NAeoV50YWSsQW2ZY38DvstMnD5Xx5r7A3ciWuFbskTzLdsKOmaVw13ThPn/f5sMjTC
         dolGuNLlgWaHHlBJ56Zi+pIea1l91j0SrOHC4Hac1QWcB13OHi/anbi+yuAKBIEvhy4N
         hief9cNDn6j3isbRu3UgqZD0dij7oU95SeYdFsrppKLqTRKg8hGv8eqOlK5Q7Pp97RtL
         hp3t8f6No6wuvWQO9SW96uGRoyOofTx/Vlf8Ddy4nDBL4eMmutPRTufnchVvrVFIQP24
         Nb9yWcmesnQMr+CqzkzYmV7vQoSqXS1HPo+xy6w85Y83J3IOapRuXhCZT4XzBxQW70oT
         LlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960988; x=1791565788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=offFpo81F3Rvbcrx9if9hNr3B87ZO2KUpiwIldn9vDmb/YT0gOdkvuPH6qHCpaQxo2
         NkeaM7IkAG5b/LUYzWKmIcmnleI98hA+c1magrZVR+2LUW/X+fGODTrZIq4CAq+6cpAi
         0QfnOeXpHClANQXnciqPNzXqiG8uXr1N43alJiiR9Dap75r5AWZptWpUozr9NLn219ly
         FMhjvDkuiu/g6L0V0a1N5HnvEji9kvjHFsigFGQhOSYg8KXmhzUPMNp06abbNBJ5kCub
         6Enx42REhwN8wMsF8GBqJauWAPQWyJbfVW8JqjDO7gLxfTHqLH2HDV3uHRtvTwJ+weBb
         MLQw==
X-Forwarded-Encrypted: i=1; AKwUvBxowJGRcIs0ZJkb2X+OD5D53hXs//8Eke6ZVOtr8W7sSB77+XdPrbRqpPgDpWOtmWpuM+sn@lists.linux.dev
X-Gm-Message-State: AFq9FYIbEo7aEw7wbSyOcV1ClCXHHSEOXX1ulMzHo82C9AgMpzsbZ2qp
	WQDS6Howr2aLdVm2NkVulM13FC+th4fWGfbFzYnIOcesD7r17Sdv4+1J
X-Gm-Gg: AYBFou1QOW4MRgZTmJoEpNqWzdw5s7FVMGMw9A/GMr+A+Rng5+LrlUljn0XtBRp9K2v
	CNYK75oiJfAqEuP6xxQp0xohnZO9t2Q7fXYaGQCQ4XWdAQWVyI1r3SqRRdAbCEl0Z7bjcVkp/ur
	RKJCgtkG6wKLW803akoTKSJUVpwokjWwIOFAhEOdgaUKDjeuzvstzQ9u8qnpcmJsw0o4Y2q6COQ
	+G90A+GNAenVtrGT+xOI/unxQFuPRzk142s5elm2oWp4GiojyzGL98GQ9VBZCqNyYOO+9ltJnkS
	hKMNa3QEU3lPuCUE68DDNdudWVFdSpsnF6Of+fBzLyFDviqBG0EoaowsYLeQ990VnTy/gvLdhjn
	H37LiPYYvadW8XjPTFq3HZtgB7lSBsFuQGUnapzaYYPELc2yJJuDjNAy6MELhgqUp+6qcU5wWYx
	McD00lhNTqX7IfBzIoFb2rGskt//HL4+fawetup6E9EkQxZU4hRbBw8gVEjVtjsUQG9VvCe3ADM
	HYINL0VsENgzGJe6A==
X-Received: by 2002:a17:90b:564e:b0:3a4:e9e4:37f9 with SMTP id 98e67ed59e1d1-3a6ceaeebe3mr3029048a91.31.1790960987338;
        Fri, 02 Oct 2026 10:09:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:46 -0700 (PDT)
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
Subject: [PATCH RFC v2 04/15] hazptr: add scoped_guard() support
Date: Sat,  3 Oct 2026 01:08:36 +0800
Message-ID: <20261002170847.3653663-5-kunwu.chan@gmail.com>
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

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d1670121947a..275cbe54b075 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -320,6 +320,57 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+/**
+ * struct hazptr_guard - cleanup.h guard for a single hazard pointer
+ *
+ * @ctx: Pointer to the caller-provided hazard-pointer context.
+ * @addr: The address returned by the matching hazptr_acquire().
+ */
+struct hazptr_guard {
+	struct hazptr_ctx *ctx;
+	void *addr;
+};
+
+/**
+ * hazptr_guard_acquire - Acquire a hazard pointer for scoped_guard() use
+ *
+ * @ctx: The caller-provided hazard-pointer context.
+ * @addr_p: Pointer to the pointer that is to be hazard-pointer protected.
+ *
+ * Acquire a hazard pointer using @ctx and return a guard that
+ * cleanup.h releases via hazptr_release() on scope exit.  The guard
+ * only carries the ctx pointer and the address returned by
+ * hazptr_acquire().
+ */
+static inline struct hazptr_guard
+hazptr_guard_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
+{
+	struct hazptr_guard g;
+
+	g.ctx = ctx;
+	g.addr = hazptr_acquire(ctx, addr_p);
+	return g;
+}
+
+DEFINE_CLASS(hazptr, struct hazptr_guard,
+	     hazptr_release(_T.ctx, _T.addr),
+	     hazptr_guard_acquire(ctx, addr_p),
+	     struct hazptr_ctx *ctx, void * const *addr_p)
+DEFINE_CLASS_IS_UNCONDITIONAL(hazptr)
+
+/*
+ * The ctx must remain at a stable address while the hazard pointer
+ * is held because the slow path can chain its backup slot
+ * into the overflow list by address.
+ *
+ *	struct hazptr_ctx ctx;
+ *	void *obj = ptr;
+ *
+ *	scoped_guard(hazptr, &ctx, &obj) {
+ *		...
+ *	}
+ */
+
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

