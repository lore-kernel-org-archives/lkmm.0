Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811395;
	b=vhjpZJmZ3iEeND1UQy+Z1EDIqhfDiCHLqzRcYhJSXFRBTSyqraq4aXrkfm/rUkMpq2B/
	 MZGOnNJ3fOUlH0Bbn0kSQYkdNLwL+QxRIuleouUD0dYM8D2aHPuGcV7vJdZkKTo+ERhcU
	 GDUEebPzzZLYIWismkaOlPBGtOdD4Kea1wZzWyUS2u3zuL/dFa7G1jndhKYS7Dra4ULue
	 Af1YCW6LXX4wWDZOat4lu/OXmtih92KwuwtBJLF6LZiOiUkpyRGZFk1kCBMeHQcruBhZb
	 7Sbp5lj2F4YT+3+XMlN9Zp1TGn70NwvspFKEP6ZvhF9DPt6xNsxCHHYGW3y8UIGT2Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
	b=EPd270clOfYMQt3Q8hqXQFj2BvZvC0cdO/1nMbYI0CC/zhBjuzku+7VTN2BEZsHmeF5G
	 naX0BFZ6CzSjAa4htKJep0SaqFOhbBrPzODy6ACywMpGNnwA5zBgf14NuHbQdHLhP9PQn
	 DVXyzOJl83+7jhR8Vq6KW9y+QR1bwHSOMCTlP6oTlVsAieTJW3y9podMOhttHPb1JEcMo
	 zoKlnno0w5xWHFVzj1kW4hrXcnPLKCixFg1hLcV5THh9uDa8bGeHgU6E9HbrVT+n4I+5d
	 zBx5OfcVMuUNiBL7vsDhfXZKBFVcHx+xUtmvFiqEBKOBMvp1YKfByf80fKnqD0uem/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+cFjgRO;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEB606A32E
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EEB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w+cFjgRO
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1671785eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811394; x=1794416194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
        b=w+cFjgRO2KpF51eDEkHZWwrQYRE9CXmUx8eZ8bKiEYOaB0rhGRlJljJXHJvY/0U8xg
         6eqNpkaBLxRd0b54FwAGMnTFc7X+bY6455U7UgVaPhnxEuJpLz2jxih81iCKDvTFt3mK
         8F63q3B7FVUisCA/VPQkch36dIeZ8nEkwG5Ek+4MZD8/+AswU9H0QwgP1nHYO21pNJ3O
         gOkL3LjvZOIerWTRRn9G18P8RJRPYRixVT7deTAN1QpMUAPlPzOS6yh/F0vBrzyuH4ZE
         NO0LP+3rCoKxMZH9yl4fLm+jSS++9GYwUhvVvnaiqkcZ/pbQsbTErlT410qi86xC0HoE
         LDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811394; x=1794416194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8jhzhdMxuYGAzmakVQAbRKMvL/Wa43vi3WcMVI8m4w=;
        b=mtS9YzAbO9t3zYel8c51HpTkKcFHgPhIOsVGDP9PiBOAxbXPfa8zIY1shM7+3viR+D
         M7skYoqYW00zFOgV/5RtLXfxaj7Uqm8QrTQUN97lVqvk+JNIRDaiw9QQXf+kLHSYuIGy
         oYrijFRhE1UN1YVaUSh2gSgDbQb4Jhsf3DFaB70cwosc0boDIlC6hQOtejTB3ZYXtddO
         k7l34SG3hTWX1tjM93C9qdOK23wyqMBO8KRSZb/tYFBpd9kSiGXRaB1u7OmDzI9RaN/6
         /MRvOlPAIUUoHbb9NRvnRPIl0ugVZdp1QhduZZdegzEE678JK20aC1cKQzt/9yMEBUDp
         D0BA==
X-Forwarded-Encrypted: i=1; AKwUvBzAy2qpbQGXU8MTdFpk1W525VJdbc/Id2tFtiQyoCqvJtBI4uLo6ObgD5J/ipv5bjTKuY0Q@lists.linux.dev
X-Gm-Message-State: APuU4Z/hdex8d4/ifMPvaKONBEjfd0kpoRlk9c45N4ImzZMUukuZGtXd
	bBXeqFiLFJ0+cbZPrOFhX/UStCaHC4QWccc6UBd305N3s14PajS/c1Zz
X-Gm-Gg: AYBFou24511WdPaT/QEt0k6/pVOQz0ty8r/qRN/j+YYDtwHxoJQE5eyZcMKA/GETcoW
	ZJd5CeB6eFHc2Ib6dahN4sBv1RaweMrKId0Gr1PYk6+FFdxPJoXr9hIkdYCrBtE5atWcQI62hU8
	vMAnA7xjplTuPXAkgx9NaP/OAL7AByun8ur8v/2yLVApFuFdGs9jHukkrQKWzOwt8UlZbgOwTO2
	Y2BtHxMW+/g0Fu4jp4Eal6XoIRXGEk6VLDBzO5S0kW02B3KIcToDaZimNUubi7Bzrrx/9OjOTUI
	1FjUEWCABfWjWqfXMYMCTgCslB4gjkWimiC4xRoF8Gnn6PNzs99uEVB7Lg6dBms/TCtuyjDrDkP
	eCMTVuumQg76Qtu3mOOr+cIoSYzmNmkb4W8z/a2vReFqFI/mhvTgvFRtYGWL0LdHs8O3mCcDD6B
	mqaUSnC70m1CTf/0zs/OyM6LpOsVAWkcz/VFeOeMUeMjaZZOiNXbQUkHsqf5VjnqNLSswEX4Hj0
	c7/z7o1IxV3eMD9sFn/6dMoDEZ42eS8bkVe+kza+VeeYu16hCbOfitjIbtJFELquBvGRmikq35G
	vxL/BnGjoeUzTj8sIpipqPasE4O5mnZK8VQE4RE=
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr27554863eec.12.1793811393534;
        Wed, 04 Nov 2026 08:56:33 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:33 -0800 (PST)
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
Subject: [PATCH 08/28] hazptrtorture: Add slowpath and lockdep scenarios
Date: Thu,  5 Nov 2026 00:54:26 +0800
Message-ID: <20261104165504.2430480-9-kunwu.chan@gmail.com>
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

Add SLOWPATH and LOCKDEP configs: SLOWPATH enables
CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH for slow-path stress; LOCKDEP
combines PROVE_LOCKING with wq_churn=1 so each alloc_workqueue/
destroy_workqueue pair exercises the lockdep hazptr paths.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/hazptrtorture.c                    | 48 ++++++++++++++++++-
 .../rcutorture/configs/hazptr/LOCKDEP         | 16 +++++++
 .../rcutorture/configs/hazptr/LOCKDEP.boot    |  1 +
 .../rcutorture/configs/hazptr/SLOWPATH        | 16 +++++++
 4 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH

diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index c8b7c208775b..fe09280d063c 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -23,6 +23,7 @@
 #include <linux/torture.h>
 #include <linux/hazptr.h>
 #include <linux/rcupdate.h>
+#include <linux/workqueue.h>
 
 #include "rcu.h"
 
@@ -51,6 +52,8 @@ torture_param(int, shutdown_secs, 0, "Shutdown time (s), <= zero to disable.");
 torture_param(int, stat_interval, 60, "Number of seconds between stats printk()s");
 torture_param(int, stutter, 5, "Number of seconds to run/halt test");
 torture_param(int, verbose, 1, "Enable verbose debugging printk()s");
+torture_param(bool, wq_churn, false,
+	      "Churn workqueues to exercise lockdep dynamic keys");
 
 static char *torture_type = "hazptr";
 module_param(torture_type, charp, 0444);
@@ -62,6 +65,7 @@ static struct task_struct *preempt_task;
 static struct task_struct **reader_tasks;
 static struct task_struct *do_pending_task;
 static struct task_struct *stats_task;
+static struct task_struct *wq_churn_task;
 
 #define HAZPTR_TORTURE_PIPE_LEN 10
 
@@ -83,6 +87,7 @@ static atomic_t n_hazptr_torture_alloc;
 static atomic_t n_hazptr_torture_alloc_fail;
 static atomic_t n_hazptr_torture_free;
 static atomic_t n_hazptr_torture_error;
+static atomic_t n_hazptr_torture_wq_churn;
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires);
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_releases);
 static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires_irq);
@@ -668,13 +673,14 @@ hazptr_torture_stats_print(void)
 		atomic_read(&n_hazptr_torture_alloc_fail),
 		atomic_read(&n_hazptr_torture_free));
 	torture_onoff_stats();
-	pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: %lld relundefer %lld\n",
+	pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: %lld relundefer %lld wqchurn: %d\n",
 		torture_sum_pcpu_atomic_long(&hazptr_torture_acquires),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_acquires_irq),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_irq),
 		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_defer),
-		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_undefer));
+		torture_sum_pcpu_atomic_long(&hazptr_torture_releases_undefer),
+		atomic_read(&n_hazptr_torture_wq_churn));
 
 	pr_alert("%s%s ", torture_type, TORTURE_FLAG);
 	if (i > 1) {
@@ -788,6 +794,38 @@ static int hazptr_torture_preempt(void *unused)
 	return 0;
 }
 
+static void hazptr_torture_wq_churn_fn(struct work_struct *work)
+{
+}
+
+/*
+ * Repeatedly create and destroy workqueues.  Each workqueue creation
+ * registers a lockdep dynamic key and each destruction unregisters it,
+ * which exercises both is_dynamic_key() and lockdep_unregister_key().
+ */
+static int hazptr_torture_wq_churn(void *unused)
+{
+	VERBOSE_TOROUT_STRING("hazptr_torture_wq_churn task started");
+	do {
+		struct workqueue_struct *wq;
+		struct work_struct churn_work;
+
+		wq = alloc_workqueue("hazptr-torture-churn", WQ_PERCPU, 1);
+		if (!wq) {
+			torture_hrtimeout_ms(10, 10, NULL);
+			continue;
+		}
+		INIT_WORK(&churn_work, hazptr_torture_wq_churn_fn);
+		queue_work(wq, &churn_work);
+		flush_work(&churn_work);
+		destroy_workqueue(wq);
+		atomic_inc(&n_hazptr_torture_wq_churn);
+		stutter_wait("hazptr_torture_wq_churn");
+	} while (!torture_must_stop());
+	torture_kthread_stopping("hazptr_torture_wq_churn");
+	return 0;
+}
+
 static void
 hazptr_torture_cleanup(void)
 {
@@ -880,6 +918,7 @@ static int __init hazptr_torture_init(void)
 	atomic_set(&n_hazptr_torture_alloc_fail, 0);
 	atomic_set(&n_hazptr_torture_free, 0);
 	atomic_set(&n_hazptr_torture_error, 0);
+	atomic_set(&n_hazptr_torture_wq_churn, 0);
 	for (i = 0; i < HAZPTR_TORTURE_PIPE_LEN + 1; i++)
 		atomic_set(&hazptr_torture_wcount[i], 0);
 	for_each_possible_cpu(cpu) {
@@ -960,6 +999,11 @@ static int __init hazptr_torture_init(void)
 		if (torture_init_error(firsterr))
 			goto unwind;
 	}
+	if (wq_churn) {
+		firsterr = torture_create_kthread(hazptr_torture_wq_churn, NULL, wq_churn_task);
+		if (torture_init_error(firsterr))
+			goto unwind;
+	}
 
 	torture_init_end();
 	return 0;
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
new file mode 100644
index 000000000000..f0ff29925a54
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
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
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
new file mode 100644
index 000000000000..7b16720214bd
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
@@ -0,0 +1 @@
+hazptrtorture.wq_churn=1
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
new file mode 100644
index 000000000000..4d13028ca84c
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
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
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=y
-- 
2.43.0

