Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811359;
	b=CnliAB1C1BWA/ZCf+aL6lqsyQiuNfBR7D0eGLn0G2AL8Ve37nAWuQj+6yg+yoQhy8Hzf
	 PAJ5h830BYBHTGlI5LUhV8R5IdgNm0Q8vC/WYZR3DE2Pydv466AE5XbveBSmYzrriUEYh
	 hhUwDha31chRT0SeEjJiOsEULSueLVZqhWATuYVNdPKnwd74UiJgBcyAIU/bbzH8IdMDt
	 EzEjqkTVdIpFANJbSaAHkGa2tQ9l8v/ONbjys3NHZiTZ6T6N7j8OLRRIuXvcC6G/wbZDk
	 kycHnoRvTsv7X5eYy9wxo1kRcr3ZjJp4ebIf1s+ouA1Xz73lFwnoVQyxgMVKzoG+XPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
	b=0tR5mkxp0kweNKGrLlDQQ94GKvuF/1H7trl+8tJLeLLP9FAmkbJ6/QeWQrTMU4bvidoH
	 c/iYDxqLYPO+UhVCn50D8Gn3Qid8PuAaGkTSYOLUSlvDsfgN7kv+O/7Uhm+ETDgMaNQhV
	 G23hRQ5b0d28RI1h/7Ssyh9UF3TsDg8jwDtynsHNBed4ZpziIQHToHYRNfcjmJDz7UVON
	 GKyzZ5suV4n9t07MVcOX3GgjiEDuoYNeNREthAawzX1uLvYZx63DIHjtObWYkJzNMbS/f
	 O1gWpcrgvkl4NN10Q1KcyxNeeqDSPvqX//ytVYbz8/jIukxJ71s7KyVaiYQ4qLkiPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XelFOrMe;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFE606A32D
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAFE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XelFOrMe
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so1894593eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811357; x=1794416157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=XelFOrMe1NRO2zXVXEQGAjsAk4HwMeVF204KlsbSZtC50+hhycjWumIF/bEut357Cd
         +EfBpT7pUavPeX3Z4qmDeO0uac51balivwX+0juDFaip/6rPGTJA4ZBLjBVMlwSH1cZC
         M3Zs6qzGmZ3nAmruZgff44iPItIBwX+HNGUOxy/WmE+jL6xKcSzgxeEW/M8AiNtSNOGM
         KxWa4Z4wC6/+DOOuSLteY+6Kds5okK3i3lozPSO4srDSLxTXXp+wlczPZJKfUqCvd2Q9
         ZIFYwILKIJlrYenHA9Y02CwtWkkJ47V+FgwhqlPws4K2Ci5RFuJqjAgl+UWzjR2zMZkh
         HoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811357; x=1794416157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8KQWyBKBxvk/GyclF/OXvG/qT94C95aX0wcu8sQa/8=;
        b=es6Hed7h7DfCiRDSn15+dtpDITOABg7ORSu+J8snSFf72IqrKIkjZPDTRa2S42HTJq
         Mv8YCwoNac+/H2c//qDqgUUn3FxALn6zK4/SOA/5/O9ghUdsSR2D4Ja/TqhHjJYFmig3
         VtgYQz8r8fwuzTwpR4EQFn3AxPe4iNCfavc4XlfdOVX4MWV4u/XiROG74Gxi5OmkzViM
         K+9zcdIEsKXLQVgMNmbJ4kKrLcgJR/seO3SR013XTRD5WwbJSql3U9psMn/KegfWo0Gh
         Oqt4oNH6pecuLnOF5DgMQol12XNhakW+rCMbOem5xiDWWkvtHU3OHjsYsDoIVWR4JXL3
         eaxg==
X-Forwarded-Encrypted: i=1; AKwUvBxPVJBXwCkWtutvkWkroPdyxB/2sGV75tqqezsiOykpuIkJ8aXyTl0olWQUX3ALf+1BjNl+@lists.linux.dev
X-Gm-Message-State: APuU4Z8c4wAA++jU9z9WMcquHOQq9WJ6It0ZqZB/y7Yh2RObh3wy0BCO
	kHdLseIdvoWZdGUbaCC0PYXAjizSG1OQlELCOpl89Vfc+lFDOitDwDc1
X-Gm-Gg: AYBFou2R0mMa6AUjxUtsaIUGB0pJYEzS6Xt3/ZK+oDn+SGpaQqNwiCox1Azyc1MpvZv
	5cr1bA3zWEqZOpgmkCMQiet2FaCYm/ow2oO+38xdvJofYB4YEkZ7LNHktqERBSY780wSNEcsiMl
	95T/AhsbEKbfWFJim0hevWVm7YuNkmujQ4aRmjj4K7oZWeDXxMILHTSS8jSQWNTzIoEMswOQcMj
	d2gao2lW3nUVE2oO5W02i/1t/iMyw8b+3LxumUueTaTzVWDCmjTeehtbm1ad+mOJ8kwDfb34x/J
	6xyMe9uEv3v//JULrT6wT5jhauNBeAVKU2WLSlLOBWQ2W9Gv3wESHcrApH5PF3QCrvwgzlEb33k
	1N3fFY+0je2FjdeD65EmoibyFRXGVfrCaxp5KjqtBMbTWKliQ3/UAR/Jbetyk8ALWEYj2bX2OYe
	G+b85y0MmmE8fMVvJmstdV1ycJUNv7z9LCklQVP4fTw4uJYwCZ2EzUZyAjFbuY5fYN9aVbzin2B
	nx0kZQmP6IRkfx63khY0ajMYW32GX8ow2eKhnFZKV4HujZsDCXdlPar0gX6I97+lGd6ghURxKNF
	ts1T0zzU4sdpHLt89uuNBV/56SzbwWYkCMFVWzE=
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr5108211eec.30.1793811356604;
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:56 -0800 (PST)
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
Subject: [PATCH 04/28] hazptr: Add debug option to force the acquire slow path
Date: Thu,  5 Nov 2026 00:54:22 +0800
Message-ID: <20261104165504.2430480-5-kunwu.chan@gmail.com>
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

Add CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH: makes hazptr_acquire()
skip the per-CPU fast path entirely and enter __hazptr_acquire(),
even when a per-CPU slot is available.  This is useful for testing
slow-path locking, especially with lockdep.  It also lets
hazptrtorture exercise the slow path without requiring the per-CPU
slots to be exhausted.

Note that the forced path skips __hazptr_try_acquire() rather than
running it and discarding its result: a successful try_acquire
publishes the address to the per-CPU slot, and abandoning that
publication would leave a slot pointing at a stale ctx, which
hazptr_note_context_switch() then dereferences (use-after-free).

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h   |  2 ++
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 3372b1cdbee6..299ad8a07156 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -271,6 +271,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH))
+		return __hazptr_acquire(ctx, addr_p);
 	addr = __hazptr_try_acquire(ctx, addr_p, slot);
 	if (unlikely(!addr))
 		return __hazptr_acquire(ctx, addr_p);
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 7c3c6017b266..3a2e9d7f58f8 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -265,4 +265,14 @@ config HAZPTR_DEBUG
 
 	  Say Y here if you want to enable those assert, N otherwise.
 
+config HAZPTR_ACQUIRE_FORCE_SLOWPATH
+	bool "Force hazard-pointer acquire into the slow path"
+	depends on DEBUG_KERNEL
+	default n
+	help
+	  Make hazptr_acquire() always enter __hazptr_acquire().
+	  This is useful for testing slow-path locking, especially
+	  with lockdep.  It also lets hazptrtorture exercise the slow
+	  path without filling the per-CPU slots.
+
 endmenu # "RCU Debugging"
-- 
2.43.0

