Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB82509F18
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961105; cv=none; b=G+mdh8EFIhPDbxnBkIa05tfs9MDPeVUGss6wvgch9Teu/1LZsgJYQFE2ymJ3d9RyDdqdY1mGRq7orAqi/eiSj9eVICdrdxqRSUf5+OPG1oRRxVXDSD6FbLKjiYaZG7CJbV76lNZXesDJALZ+kGAn6huz2FN9bEICcbnVCnicKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961105; c=relaxed/simple;
	bh=ikRDPvJS94ZCR7PUsAAuEp28RxgBvB/t5DdR/IX8Lk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaZUI8jGwXIOSx9Uj96yWpJDKXlfR7S4Uf2JgSC1TuNt7sNObliPaLjt4QwKzWNWfPslfCSRsCUiFSQ4MtDw20fHE9pqWQoNsvAKP144SxiEvTxbN77NfnHY9jQIxUc+WXuX7DAijC51DvkuADGQeDf3Ygqds0/WfxyhrAtYvAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1DqGiuf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1DqGiuf"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so157579a91.0
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961095; x=1791565895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=m1DqGiuf+D564R+rpb9TuTOrqG5TNf/mDUEPcaApyeQ0GR1wp6EU8GngebxrIMydGr
         8tiIjMyTmY3An3nFKKtwP2KhnRP9ZavKMqwvsckz/MIK25tU922qpVzsWevZ5mnLKhdg
         JN7ulObJdHpXZ6trsggHkZB/zZKHxjoKupoyJ1TYgC+IJ2MGbW2YjGHwSjcf5ITXJC43
         S6qX4koptAhVq1SsbwtITrznE569M8Kiz6Zmz7yTlagtYnX0btNDlM0lzOHKqswZbwqU
         yIumne03qBcu6+QFxRQ+vOWtNAsBrDh605wvZ5vPH8LACjU5ousX50CadmfHRmEMdeuk
         dl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961095; x=1791565895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=Jk10FBqut1WnTH3lKTrscrpviPvCc3iqERqmwpM5rM/Mzgq3aw8JbKBNeIxfVNU2HJ
         AitwRTVKctVvMxr5U3R7/xpbpNVLjFYijIN0TcTGRQ60VnoopjAZty5De/DfWkBlC+IW
         kTSFupzTehsh38qaroCzkPpyewD4uU4x1SWwElB+fTsEmWRBcfsRhDLEn8aXHSUHMYH8
         dcaqUE+FLAnskD2qHxBj+JTzOaSf2SnG7VhUjfoyp7xjhK602Lz7XeCMHfsyC62x3Kxs
         5FpJ2jBsYo75Z8TQc7ucPV91oTzRnU9MJMzTY0tSis0/SWQ0N2ezNFdXsA9cI0crrABI
         u1/w==
X-Forwarded-Encrypted: i=1; AKwUvBynuP1R4YgCJViGcjFK6J7OpaWCHo+E25sWtmsw00wL8xFCtpcGoaZawDtRvLAwWNlwdal1@lists.linux.dev
X-Gm-Message-State: AFq9FYLeKKw1GpHMXIGpNWjyXjqXN9AlvYltXYYrWa2IaAgInH+F8Loj
	cW7OSoiyVPBYDjpT4RBcsbGNyuRXROJZzhUp9tgKWhja7NCnKqPqPhUb
X-Gm-Gg: AYBFou1LMfhZI+4huLt/6pVmwpqcm13U4Y2atLlVKyjgBRr/NoWrJTyIPk3aTVvMEWF
	9nEZiE8+D21mlB5dkL6uUQN32OzSPTfTo2x+WA7KNIH3uh9SZWTnV5xok0POAH0f773aqqSsIn4
	eYqxjUhmOCn2vzcuCYwGtRD4jmhAyDJzm021w+VcCjVOAU3/VVyJCk+f9XhH635MAXANu+AfUjW
	TXMqKZ3mza7NV1HB5/LhgHl3UF3qpDPQvHjd3idKiE7RZPvJQrp213pt/Qh5mp6lfXsKNr1cjIT
	EbVnV6sxUMN6S3K3fG5bQYC+aA4ZpWKrEziRrI/yCiEmhA5Bd82JLys/5U2pxux70Ohiu1R1bvG
	CHY1ROn+MdGcWEPlKutCnEkflRZsQcqe4Lee2w0ibUI8g+I7dBjBTA/s9ESI72VUUoiBc7J8Ahl
	rZJk2WJaioO8toZTL+9OazMhv8meBWjN4bZQmRTLLRkXC/bg+vhlQJEgyJFpfpuwutC3bSoeTqk
	DF9xoMWBrq5jLKtukvhYJiCyVc8
X-Received: by 2002:a17:90b:2ec3:b0:3a6:fec5:c184 with SMTP id 98e67ed59e1d1-3a6fec5d190mr1028380a91.7.1790961094328;
        Fri, 02 Oct 2026 10:11:34 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:11:32 -0700 (PDT)
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
Subject: [PATCH RFC v2 13/15] hazptrtorture: add READERS4 and READERS0 torture configs
Date: Sat,  3 Oct 2026 01:08:45 +0800
Message-ID: <20261002170847.3653663-14-kunwu.chan@gmail.com>
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

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 5 files changed, 38 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 380b8402ccc9..1826be30c066 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -1,4 +1,6 @@
 NOPREEMPT
 PREEMPT
+READERS0
+READERS4
 SLOWPATH
 LOCKDEP
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
new file mode 100644
index 000000000000..f5564c218902
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=0
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
new file mode 100644
index 000000000000..0d0df3f7dca4
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=4
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

