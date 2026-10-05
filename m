Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6252F29B
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220755; cv=none; b=omDYJVC7FZWo0Te+ETUSYDS4ON84hxr7BdRO2cd3Kffee3p1LQvABl7FaWifOxE5SbarSuT+ZDfhwezJA4STv+h+4fddpVtFtdoBCBu/5vfP9pGfgIVNszvQ0GN8v6AOcl+8nrceIUA78jMNsbYblgbeH4bvncmQi5qNj4svNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220755; c=relaxed/simple;
	bh=c7ckEYnsoc8lY6bepSRx0MX3kspdeIxVPo6r8T3T7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZywJSHldxgb/0z0bnGRXFi6/PaZIiwwDO97iYeEKffPZOLtE9rRoKX7nHFGfyf3qF2qkV+IRsj0OKzf4/JSqsZbZH66zv+DU9E/U3t+CxsWbjiagRKjnoBoHdCewLi2wrvALFQTfeEjB6Mjhp/dXVxL3OvwXyETgB/9Wzk7f9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwaeHyux; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwaeHyux"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1340053a91.0
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220752; x=1791825552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=SwaeHyux0OcRghI80+hdJf2MZqlOapVRZi+UdmSRxgCt963wPZK+A5EuQx4agpOIgX
         uLoUKJFfxBfEZ4ykMxjKgm4pCwAomJCEy8sZn5HjnIkzTvr92PI/Ny+g9aluTiRsWc5X
         0o9jTftH/ZUUDIBZQC1y43nq7o7r1Ri0H/8RGvBosSMMpok8fiPP1DHQ+/D4XnLh+W9E
         sfpSqZtJHCtMmcfvp6bVybUVw2N3pufg45UHe+MN1fiYyEcfkBpd9YkTAE51xitDD4Sy
         ZFSK2dIYq1XDkiOCjahaKLk71SMDLOpj07m0Pc6E5Ss/BFPo9UJUeYY6mtgkV4794BVX
         xxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220753; x=1791825553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=FGR9Vvo3aPCecxagdElkcrLIZCLv/VAqWD6f27hrnVrZXYwODwhveRAnsWHFa1Bdej
         UGyXAGaYfyJRas/udSJ3oRzIktSfMG00JVdc4IqAM0BhDOMYCecGq80Ectrib00Wc0PX
         36tRaGVu6FAfEU9r418B7aownKwwUOW2Ni0Pxe/RaG7lSJ+/MMXjWpZ8RVeOVJwzMQ5K
         D3ypmkCnqNZDb8YDij2aLqTlpNwkri6e3nmfWiJNgT3xDN3ydvqsGIAQ1Ce5eJ7dH3cg
         TasmIldboWROHlTm4RXoUzLd6YU62eq5S3Y6DJZEe4qaVNAwbSZ48C6vrllayraQGT+4
         EUDw==
X-Forwarded-Encrypted: i=1; AKwUvBz7EOZ5RxVSI6gTw2H4a1mWQXlpgi3usApHYElBmG2Wnn9MfYuRud1frkZvp9toxksaed8/@lists.linux.dev
X-Gm-Message-State: AFq9FYLPxqTVFV3Ug6ifYrF/DHOutIuKajt/eqiuIb0Ci6SKBbp1QN4g
	Ukstj1p0Xc2utwYpIZl8/ywOty9yE1gW0FegVfSv6g2ztPtBBBULDcTk
X-Gm-Gg: AYBFou232coAY0qGGLVRi77kuUPcUQWLi05hQLgUXDcnxW0xn0XD8akiBPqL3Y0B2L3
	0MR1a57MI/6c1VEiff4p713yh+cQDtnzxGkWqIP4BpM2I0GsRorTDTQw4/UCg12XwZvOwLw7XtJ
	gd2ojuCbLU0NmdYGqsgx/K46no4A2NdUgg1hBY/aa+DCbxj9M5JvZcEydkpU6jpBYxe/YhRmw3g
	/tZDdj/JJLt8As2aPzOjeuVZfMtd1BgcTjCFK/BUNSSmic9iNdMqbA1qmCSz7xYHE+H8Is9s23S
	VYIM37+t7JhAqGvp0SFii7DnB8aPe75Qj8hS4H7aLR8yDgUFJqzqvQ+2WjBJxSn0QF0LiY5GyBD
	LSwKBkBxGhY8IG0A5mlsWOBTLnCSCYVdim0bQDKjzGNxxIfsaiVNJfbtVtBCuo4yHpD7m3Tc9BI
	lP7w49ekNkwGaS8OE1lu2DH4rgd90tKmLRiN1kiWBkk/LeOh92WwV2A+eKrWdOhisJldA8EMq5/
	ohqgEIu/+W4uo3iJkNmNqYExeRJ97U=
X-Received: by 2002:a17:90b:3c07:b0:3a7:9adb:2a0e with SMTP id 98e67ed59e1d1-3a79adb32ecmr5763152a91.33.1791220752112;
        Mon, 05 Oct 2026 10:19:12 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:19:11 -0700 (PDT)
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
Subject: [PATCH RFC v3 14/15] hazptrtorture: add 128- and 256-CPU configs
Date: Tue,  6 Oct 2026 01:15:28 +0800
Message-ID: <20261005171529.1378809-15-kunwu.chan@gmail.com>
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

Add CPU128 and CPU256 configs for hazptr-stack torture testing.

These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 5 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 1826be30c066..90ef09b0e654 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -4,3 +4,5 @@ READERS0
 READERS4
 SLOWPATH
 LOCKDEP
+CPU128
+CPU256
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

