Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F44F5E0E
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961005; cv=none; b=SI6e31+TdSEIxDSQoQlXYetpDcksl8YUNOU6qpUCjgiCM/My+3VdflLudmL+HmlR75f5kgqWI76shPVFABTrp5+ARZT7Em91ktCgq6S2B7wkfaSYCx/y+0SmJf85LtO+ZYVw7YnvQboCO6Nw6ZYuNQaEMaYmT1ABHqVeY3lQCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961005; c=relaxed/simple;
	bh=9wEbN2n5LQFaWEnfgc/fjcdj12CgL82mEepIN/jxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSMuk8/QvbwBzxqPjLwCicUrIOXqsc0eWSiNnE1Ge3SKdjpjsCR991Qk1AHMt1OIPqswqQl6cvpW458SW+LSTixWJjb3pGwes/kNvO67ApPSV/1lcOQm/ADiK5VCa9Pr9TyIJ3MFzHxNc2riqPDCVF3CA+rAqDQOhtOf+jL7oSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZEarUbb; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZEarUbb"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso113826a91.0
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960998; x=1791565798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=gZEarUbbYXyFG4PDrEwiHMEIH2dnkS1cM68Sspa8jQ2lQb89G4u30ICiIZhwkXh9kw
         qTsKvb/Maxn9gwcnJk2Rmem/7vYAkG8hULpXVzKNzFr1A4JCJYw1eVFZjQY98zqv4Lll
         raIHJdsQLg1Jkerz4IU8dCiSkW2MpkBGaU7nsSe4twXFwYoGll4dJaOv2c0/4TElU06J
         DOpyqLD4qNK4muqGg8mYbWUn8jJ53Upmrx+NIsFvWUnln31Won+3asD1PIrKgbQG3O94
         Se1+r8yL7H5Uh0kPiYXlMw5MkD8MiQdQ+ngvWoJxMna613iNMVagoAh1Tf0LWsR9Fxiz
         LwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960998; x=1791565798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=W0/WbpO1orRm+Ycm+RbswKTlG1jcWMEie4fV8lB38m4nA7/3vBKW8nVYcFyOSin9AQ
         2M/MCFYh65a1g6d7J2McSb9XAzlzTAjwMRXu9u4Bwmchj6JWjgq/1YSTLl+ewUbxQbqe
         Du5eWIkMXsysVwsA7+xm7Zar6lt0zjbGMkIyZlkA9x7l3tJCn7PJVQZNPqLVNrnaqs4u
         Ca2DczR+Z8r6DQJ0sTb4SZtwwCdbfEGIOVgFqQLBP0fDwXPak5IOBBcy5NMzw+tbPtpW
         KbYbJi0q9cxuBCuihj9IoOmSZ5Bevo1FqOHOEnIJ4PXlWxNKrp8sjJZALzXPP9subCue
         fiXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/mS80cTpEowQM2HY5B6acYr067I52V3NtGD9Q6lPEarmkBHMgLshN0bmx5NZmsnaEo39g@lists.linux.dev
X-Gm-Message-State: AFq9FYKVe3cy9jXd+yWqjPShZjkvsKtjtCdpVTPAEHB8bezn4ixHuxWU
	GoYJxcTjtUQ6pe6iNKi28/TaGcRKq4xCDytiM6i86EuinfrlTkabw/Zu
X-Gm-Gg: AYBFou10yEuU3HxlCj/kxRUexyzO08mKGJzBWtoNqjHkYqfCXkmXWwsElSF7Z9Cs21Q
	QUBfY/4LtQV0dsF/FnKxIWldivEvJsJAmBHNBgSrIINUdpq5jRYAVhmOYrLbUb8OB1Abx/YvHOv
	s6V2QhFW25qIebnVX7gwG54sn9B5NGY8Hvc+V7nuxi06tCmC5LpIlvmdCtyIfJWDA7MlbnrXAsB
	f2zDAYSJ3pgTDEeyigUbzEdlJ8c+dugZcas9FE4HKUioNi1GUTsoKn2+MC1cg6YrLo1B6GnFRJK
	35v57kbxhBTlKnWF24kSuftMrBD+72hHI6ckrLJ9v3nTTRRP74WFSldZ1rv4DoGubSxTrREphNl
	f1fkXTK+4ds0BUlGg7PpQhAhfKQzEkFLqpgIBZWXGIjww6q0Aa7T4fmwg0pw/NFx6lfya5RqSbV
	RtcNSmOkuYP8Kz4V3TmmiliD0xYehIK43dGEiIMsSLXXegUh4idVnc8BQFZy6MLmgec2Z9cLdU9
	0zdm10t6AzK8dacFg==
X-Received: by 2002:a17:90b:39ac:b0:3a4:a7eb:1da7 with SMTP id 98e67ed59e1d1-3a6ce7f8bcbmr2920094a91.42.1790960997498;
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:09:57 -0700 (PDT)
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
Subject: [PATCH RFC v2 05/15] hazptr: add debug option to force the acquire slow path
Date: Sat,  3 Oct 2026 01:08:37 +0800
Message-ID: <20261002170847.3653663-6-kunwu.chan@gmail.com>
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

Add a debug option that makes hazptr_acquire() always enter
__hazptr_acquire(), even when a per-CPU slot is available.

This allows the slow path, including its lock acquisition, to be
exercised by lockdep-heavy workloads.  It also lets hazptrtorture
exercise the slow path without requiring the per-CPU slots to be
exhausted.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h   |  3 ++-
 kernel/rcu/Kconfig.debug | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 275cbe54b075..4ee02d23abc9 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -245,7 +245,8 @@ void *hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	ctx->acquire_cpu = smp_processor_id();
 	ctx->acquire_caller = _THIS_IP_;
 #endif
-	if (unlikely(slot->addr))
+	if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
+	    unlikely(slot->addr))
 		return __hazptr_acquire(ctx, addr_p);
 	WRITE_ONCE(slot->addr, READ_ONCE(hazptr_wildcard));	/* Store B */
 
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

