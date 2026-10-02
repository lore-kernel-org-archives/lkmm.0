Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6154FDE69
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961118; cv=none; b=SdXmqZ6dUNqW7l4C2zQtyLIYPiCSXUpQ6PR/1sZWBA1Cbm+zUEUwUefrRGf7xqgoOXxPS/9pbYBCzIteV7knfsszUvbRt3QZVK0Rf4cWjt+S5jbDayJSPOxjXH6pfWNfVjYUbz1h95NCbuPo6ZaJ+mTp/Np8RILF0BHE+dPczW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961118; c=relaxed/simple;
	bh=c7ckEYnsoc8lY6bepSRx0MX3kspdeIxVPo6r8T3T7fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/I1HC1ELfXDMpH3bBXYQZVv+T7VKKhIv1+oyOYMEwA/dbm9z+x7tk8MT7N5Pb/JHqM6cn7RwXgi66gWYUfP0/NTLdNtA3JtFrAurZA6McuJAyH+ZdqJg+OXjowIALS3a8LpZPFFOSjbZPJ/7jOYaAJPgKZS2V8Ss/SxAdJcylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l58clo6s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l58clo6s"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so3546922a12.0
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961105; x=1791565905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=l58clo6sBuA0D12MKfq91LrXiPcvVBhytPEOM1iB29d0wFwbgrBCawGaYuGCHj/Tbb
         n+FG5Lfzsst1yfQQ1ZIJofWdvFZSsgic1MrSf9NvcDvEsifUbQHGM2cuVmwFFF2CS11Q
         GzqBfha2f2+Sj729XlwCaf0IGBlg3JZAfgEBsi2zh9wSw/fJjCOFXbRnTCZPgolrw9Xm
         HTyx3qaOvzJNic43rZIq8GV56g+UnSfFvJxPm1aNOBqdhaqP1PbyFuhxthvCDqObXkVY
         vQZXGQdg7QNf6dvOV2Uqwcsduseb+BP8YDPro3aW+gugVmZHSlTXGOcii3YhMJagWNkM
         2+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961105; x=1791565905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU/Grob0sdS1Fvpq0qkYiAVVEirXYMwyKGEgxNCUeKM=;
        b=YYZm5VazOXWLZ/lW4SOZzaUIKrQ8AGYxsXbcc3nj6oxYPg58LIQ0pyDIJXk9SrHhkB
         5Q5sj3QWg3XMJYgN8WUf1uoLfN7qpyuHOUhEqa5Iy6yD51DWSLgd2owY5zd5gfSfLpUL
         adak4IfJPfjSlJpwAkkBIrjZi148CLgdrqIliAJeCkPvCMODPuL/qZq2ULDPmP42N7gC
         y9GM3731TtVQvAEmjeYLwWoTLMuatoRV/C7du1kKMaH4vuxt0UPNazKdPYZGDQL+juF2
         BXuMFkmi5WbdQT0WT3ghNCElabYZrjHGLOpYkclPy4jQHoAnReVkwJ+EmgoHPOY2b1VM
         Q6Fw==
X-Forwarded-Encrypted: i=1; AKwUvByd3zZCKhFJP8N7WuGzaxSMU56VZ+DDjKl2atOww1m2aYpjDpl19ksMk+SRezR6NsBXuJ1T@lists.linux.dev
X-Gm-Message-State: AFq9FYI8zvp2fnX7KSN80Ej419OwGQuwjLppyi0zYivFokGYtzDZ2Mnl
	guMv2JSZmBh3i4KRrIiGebxrS7b2jlrH8vBytJ0SFwMXCeoDs5TPDws4
X-Gm-Gg: AYBFou2VWL8U8EqwpZ2m1jMcLZ5GDpai/h05Ka1ddwZuDAbLiiuTpasTjxCSOfhR//G
	fjL4PhbmshozPOgwl/LnWrXuK2/0TsIC/PTK2OCPfnKKyM7WhC8kMo66zZIuocgydDgUYncSLq5
	/qzDsk/BguWBH8IyqUemImrNZJ32jYhs2psBIPTslokMpGQYaOJYdoWBVQp//SUMUX8LhKMDFCK
	ztUcLXCDPXcr8AV4TtusNyujcYFQMhB3wiFwdoa/ckQiWrojp0EddE+QfYXTv/UeA1sP6WXr2V4
	hARdA/mtZrSc80aKiBVlFMAH2BFs/o0OmxYXrwCs8uIgkbT0oX431GTv/e2ztBRVZXVvb3j8UpQ
	xCVgr6m/pGZK3jVdY3WiJFqMa1d0zVbRDtz5XWwdIoshj1Pe66d1uyM44Cvb7W3uF0xHx+y7bbn
	Pgf1tUhSUDmL1ZnJftLsRU0qL8AJb3lPSNuURNvqaFyOdLpkzUjFNh/gaxpJq62ASHsZaJPIiha
	K8UX2suxFcH3psn4Kixy2TybAbT
X-Received: by 2002:a17:90b:3d84:b0:3a6:c7e8:1e3f with SMTP id 98e67ed59e1d1-3a6ce34d7edmr3083622a91.3.1790961104965;
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:44 -0700 (PDT)
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
Subject: [PATCH RFC v2 14/15] hazptrtorture: add 128- and 256-CPU configs
Date: Sat,  3 Oct 2026 01:08:46 +0800
Message-ID: <20261002170847.3653663-15-kunwu.chan@gmail.com>
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

