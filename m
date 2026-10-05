Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2B4EE875
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220619; cv=none; b=YcIodsW6uEWxoLo2FIjGh6E/DwIYlQhnQAEf9a2mOE3aQ3XSTjWXhQeOD9buKh27nQlfBeizGeCJgTGRUDzrwlPOz5/TEW6KucxU7LUELgh03LHZLybfU3/x7kYRMCD0k3akr8QNUthrfa7404lhfDzwQn7EaiuXII2skKxn+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220619; c=relaxed/simple;
	bh=9wEbN2n5LQFaWEnfgc/fjcdj12CgL82mEepIN/jxNKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNhlsfxs9+xK+8QT5g/hyDwHlmGpjKpPGMjGMOrjSksWVFqM0Calwkf6+1X8hqbwGho+/8Cq6LvcEEOwUNAja8Kv42gxqwLw5WPwwziA8AhRpUkxsZFyMopbLipAHZoSz91dbvkia9By75UA+4WGB5pham1SDOR8eLZbCkuzrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pk/hXdwy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pk/hXdwy"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so1246809a91.0
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220617; x=1791825417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=pk/hXdwyhyvm6nMGTWgeCLrBzWgv9ow7icIdUOOEi1Uo4J1kFXd3bpPOjyPOzhCOhz
         mh4rHiGbLZ+UoZgVfw28aeSRrCuwgryTii3gjcTrNki06DrzBVHFjUV6pMIfRIqIHoID
         HFekuhE74A7IBJ30VuiRvFh1NeQo+BUIf//x5kunN9WNtHN+pAqWlGn8+DgBaEJBp2V1
         oW+VOmj39aBdWQ2XmcNjkrp17sqO3KOdQtAbT92cItjPrvOKnhgZHF/LglGV0VtziZCm
         q/ScZvn1m0Xs7I/h6sNFYUd+cWh8EYFaUYHtWGI9fSTJ4aggLcUqrrTlwbAvIxsWd/84
         CBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220617; x=1791825417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InVY38nfxVAqb/WmgYkdpIBcCwx01OQ8UJwYgwWPio4=;
        b=eGdFZqzJHyNrLP0nKeEcwkDtU9J5QHKd0NNuxx1XsWT/izDr2kZ50aMUHWFpXvgY2t
         mlOf9qOdO9T9+b8UyM4qEFpg/1pzMqBJM1SvlTZIPXRsRHT8Nsv+4dXiXGhW2GsLoZS3
         84NyBQIO4MRBd/V+MeuvkAM7Q+Oe6UOPJi+sVRdhJ3R+umaMUG5i55NFB9azigDrDwIi
         djKFIZ7SkRJadl7mlizCEKa6tUSYbmMluT7OIQ/jVXt8wmClmi+cJySyle+l8Q8YLHHj
         uhzKW3nxuTAmL2itaLzrl3CuTvU0WIz7RJ8fnxhwczw5Zy3Id3/dLIfy4Fhld8Lj36IO
         s73g==
X-Forwarded-Encrypted: i=1; AKwUvByI6FQp+OS2627ZtXx9IvsIzkcXDSWwYHeGRQCHWRRofpTyo/Xb0yPYKJzFsND6TxIfdOT5@lists.linux.dev
X-Gm-Message-State: AFq9FYL2iiaybjsMqEzJ1AF3b0cwIfuyhoymaBV3r2x3APagCTVut8TT
	gJ4NcsOlyYyc26/vvA5vCX+xvnPvPGxrx/ehCFGP8PHXIcHLn9hUyxqv
X-Gm-Gg: AYBFou10zwi4mQybz4WUYYVp1OU/I7ZcJDZ9R5+zU0YEIhLc5G1hFz5Kz0h+2r9WPbF
	bywmAJbyeU8Oe8shHbW00hBKYM6QZ9Su+uAjHDrGdCdkJG+QJrmdgOcaFYpGAQR1brvf106/9e/
	PS0H0OTdUEhRXVq8432J5uVJjt+6ZL2alBHHjeA6muF0AxuYQ+k2bb3PaStubP7yxO1UcrrGCOv
	uMwHKjgKwW7BYVS7xOW00p87/Lh9VCFaiZ/A7H/B3OKbc6HC6YmMbtxPTl6BE1sNDGoGGORsYWw
	2A+KYsdnFvM/46lClmeLAZ9g5Jh/r1SSF541Omu5YVZxFqMsum7SbeSFLyzwtHhJJo5jtqVVNPB
	3IVkiRJrrTqpmLniHjSLevv8qKL/nmyKYxw46302NaaIij/6ofC/vvbyDmveeHKnHB10/b9LhzV
	Leg6Vdbi4IzmRn1HoPtXvmy3mw0y4dF+VIAmDwyTgcUPTZouzkaDtDtOhF84vaviQMrV+18yNLC
	h27D0QKMLYavAgy7ZUccm1/u9LBTg==
X-Received: by 2002:a17:90b:3e85:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3a783504695mr5636453a91.44.1791220616043;
        Mon, 05 Oct 2026 10:16:56 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:55 -0700 (PDT)
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
Subject: [PATCH RFC v3 05/15] hazptr: add debug option to force the acquire slow path
Date: Tue,  6 Oct 2026 01:15:19 +0800
Message-ID: <20261005171529.1378809-6-kunwu.chan@gmail.com>
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

