Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119140;
	b=HC1/I21+kE8USVvnVti3z4EypXfKw3svg+K+F3wKeH6sAFA1kYWOOUrbRgasLuY63UGn
	 5ListAYYRhYwOcJEXMnlEji+KJQRY3Vp9aotadVBkwGOgy3QvAUP39N7jztDuDt/lOTr3
	 DH1AO8lLn9bsu3hbgBQQm04wrzTdCBlWjPvCTauSw1zX0Vdm51Ny5BaBKpTXx8flt3WTs
	 HOPkWwpn/HVnPkYWZ32+s4VUT+m/bjQyTRFx+m8V8fQsFM+QlQDgMK6BQCyN9TrIiVSiI
	 SY/VaTdTb4dhZes0xIVfhMrlEKct7lbMuY1IY6/1k0zSm3jb+q3dKJmY8quKu/xxHxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
	b=DvRsVCOm9LADltKtziN5ZMypbvHT60FU38c74hLpsMU2djteM/eLWRjNYd2gyVCW7AdF
	 GEcttLzXmV0IJxCx9StnxnhdrlDgxy+luECVojAJ+PBZsRc+4aa73L572AXYos476lmqG
	 B1gMiwJ8FQgVUc01DuEU8xGWhCseeL3oZLqLeKIQ3raMXumUV/ylBiLi7czEbHfW/1bYF
	 lDXc0FZxMM414AMxQ2xQK20EylyLDLscvO3STKAM1xd3e6E4AQcp1+sPtOaCClg4vAOfE
	 aAGZb2EK57NvuhHv/PbDVHsQeQ9q8ufcD/rjG7cYfQbybf2OmfuwoEMOKYSngeOKkTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwAQEvbu;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B95606A331
	for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 16:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B95606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rwAQEvbu
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so282925e9.2
        for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119138; x=1793723938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
        b=rwAQEvbu0w66dDmmCa+NhEDLcrNjrw727pWjyDLsP3ZM1ww3dxDnFaWjluD+jfB0xc
         Q5evYxw+jK4wMfAqNKJbeiElvY/jyUe3EFR4CvJMDl0JvbA2kgHYxCHNrSrcBJV35HoO
         SSrg8RmqmWLoMFJwyKegsVQ8rGosshG7nymHcEhLVhjb2Aquke11kwdivnZGYXIS1r2c
         1EuXEXgFMbhMnN73Z11Uek9JdAiL76qtKe09WU3xP9RukIFqc4ycSk5XJrFZEkXslSla
         2jyF4l6wjuk5ed1HzjTQJP3T9aQHJbHR3hRgMDlOY7T7WiiwDZOdEGsodIR4GM8qToa6
         jVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119138; x=1793723938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uOoh9IXRFNxNkyBrfne1vGxftWSxATGplynCIne7a4=;
        b=X3kQdKAs7SxeLaO72Mz1uhAzCp67RytKAmQe+aRuNhVXd3blA7tQidx7+ESn0/Vu3u
         /e3qjOneuf37JS+5yErUkLnmG09dFUO3DaUq3NDCYAqdx3t9WzhlLqDseY/OgAszuBco
         FvFj+uf2D5PSwDo3y2OLZPHjVsYR1+oskCHI6NQvHkzFYmr6zJp5J61CsI/a9nkrGszM
         rBBLahquI2bPHSg6pj/SyNpC6DrbKS62PPxLupCUPHUIvhI5ZFcK5k+Ap8hp3esJUd+X
         bUV7wq49Wl/vGveHG/a1y1qwAjrtpBPK4vuyD8MQXw1dCUCvJJ9+AF5tJXGy1qH0D0iR
         p46A==
X-Forwarded-Encrypted: i=1; AKwUvBzcBOSQuo7QNeWNf2OOrojtCQi1yZBWpzWxO88ilMLkiV2yNojZof+OWYp6ivBRcLC7vAdQ@lists.linux.dev
X-Gm-Message-State: AFq9FYLxfRQlC3J295d/XweaRr3UlbilaFWdk71Hv5OPINSh7lj4SqR5
	7IlbV8TR5O7/5iuWvZJELY7rxUgUI/qSqsMIzI4dRuJ2DFhIFuXX4pXK
X-Gm-Gg: AYBFou3VpbQ+N2s3oMqcBn8UiCDnyFgj5Xd1CL0ibRmCAL9RaUELDITGJCrdkeACfZ2
	q4A7gM5N+1ha1Az3d3yRnWDZH8DjLerkKPM3MHbFslGpjA/ThwlXAfVaY+cBaeuNXK67VSJHsb4
	Pb/K9bMvhN1flq3qUWzlU3Gi7rnBiHVv3G9IKADi5z+kNpkIuHh8POqqaveTt/jxAyHjRRM3VIa
	kMYyBZoapbtlsTRIyQSo8UVoIrDn4WL6XY5mYdn2D3Id3HQ+ZFYIDTjVh2Y+yAL2hvnOe2mGkRm
	xwW1HCPurv0RmXZFzbHVQNsPv2hyE/FXrL3Czu2xyT2C9NeLWNVjW33WGv3LvChBeZdWDdGSg+m
	ZNIIrJhh0ujJKJJs/Pes0/dsF4SXpaSCEw9PlQ/0uBq95nXjcEqw6JeaOQanhxvAs7W3g8/6Jef
	eQT856V8yl1Zf2UJSp4mXJ7gkhblvIDlbRT9R5i2Z5XUX0rejDPavr2tJ7SqBAhf5w1IKkY3rn2
	AAz/2w6LQH5Y5rcT/h/OzBf7TjtIpbn+k37CJT+6lRybNSfPv1qYnEhIT+wZ+V73htg8Vqvsnyv
	hNSOJ/ZNOZF9ay3U0R5TvFygDReyhF2bfzrYhfCU/ecqA5U=
X-Received: by 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr139023805e9.22.1793119137915;
        Tue, 27 Oct 2026 09:38:57 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:57 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 4/4] hazptrtorture: Nest a second hazard pointer in readers
Date: Tue, 27 Oct 2026 17:38:06 +0100
Message-ID: <20261027163811.2470569-5-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
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

hazptrtorture rarely exercises the race fixed by "hazptr: Record per-CPU
slot owner after claiming the slot": an interrupt handler acquiring a
hazard pointer after the interrupted task chooses a slot in
__hazptr_acquire() and before it claims it.  Readers get there only when
their pointer is NULL or changes under them.

This commit therefore adds the nest_acquire module parameter, which
makes a reader acquire and release a second hazard pointer while holding
the first, once per the specified number of acquisitions on average
(default two, zero disables).  While the outer hazard pointer is in
slot 0 of the reader's CPU, the nested acquisition finds that slot in
use and goes to __hazptr_acquire(), where hazptr_torture_acquire()
handlers from other readers can interrupt it.

Without that fix, and with the checks added by "hazptr: Check per-CPU
slot owner with CONFIG_HAZPTR_DEBUG", the PREEMPT and NOPREEMPT
scenarios at default parameters report the race 6.3 and 6.0 seconds
after boot, and NOPREEMPT oopses 1.3 seconds later.  With
nest_acquire=0, both run 10 minutes without a report.

With the fix, 30-minute runs of both scenarios pass, as does a 10-minute
PREEMPT run with irq_acquire=100 and nest_acquire=1.

The nesting costs about a third of the outer reader iterations, as seen
in the IPI acquisitions, which readers send once per irq_acquire
iterations.  PREEMPT counts acqirq: 270645 in 10 minutes without nesting
and acqirq: 544976 in 30 minutes with it.

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 kernel/rcu/hazptrtorture.c                    | 27 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e3c5a6b68fc34..63bb7719457dd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1992,6 +1992,12 @@ Kernel parameters
 			is equal to zero, in which case it instead
 			defaults to zero (disabled).
 
+	hazptrtorture.nest_acquire= [KNL]
+			Acquire a second, nested hazard pointer on
+			average one out of the specified number of
+			reader acquisitions.  Zero disables.  Defaults
+			to two.
+
 	hazptrtorture.nreaders= [KNL]
 			Number of hazard-pointer reader kthreads, each
 			of which repeatedly acquires and releases hazard
diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index c46083a8af093..4373bc5fe11e5 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -37,6 +37,8 @@ torture_param(int, irq_release, -1,
 	      "Release hazard pointers from irq handlers once per specified #, zero to disable");
 torture_param(int, kthread_do_pending_ms, -1,
 	      "Delay between cleanups for deferred hazard pointers (ms), zero to disable");
+torture_param(int, nest_acquire, 2,
+	      "Nest a second hazard pointer once per specified # of reader acquires, zero to disable");
 torture_param(int, nreaders, -1, "Number of hazard-pointer reader threads");
 torture_param(bool, nwriters, 1, "Number of hazard-pointer writer threads, 0 or 1");
 torture_param(int, onoff_holdoff, 0, "Time after boot before CPU hotplugs (s)");
@@ -449,6 +451,22 @@ static void hazptr_torture_defer(struct hazptr_pending *hppp, struct torture_ran
 	atomic_long_inc(per_cpu_ptr(&hazptr_torture_releases_defer, raw_smp_processor_id()));
 }
 
+/*
+ * Acquire and release a second hazard pointer while the caller holds one.
+ * If the caller's hazard pointer is in this CPU's slot 0, this acquisition
+ * takes the slow path, which first tries another per-CPU slot and can race
+ * there with hazptr_torture_acquire() handlers.
+ */
+static void hazptr_torture_nested_reader(struct torture_random_state *trsp)
+{
+	struct hazptr_pending hpp;
+
+	hpp.hpp_htp = cur_ops->readlock(&hpp.hpp_hc);
+	atomic_long_inc(per_cpu_ptr(&hazptr_torture_acquires, raw_smp_processor_id()));
+	if (hpp.hpp_htp)
+		hazptr_torture_reader_tail(&hpp, trsp);
+}
+
 /*
  * Hazard-pointer torture reader kthread.  Repeatedly dereferences
  * hazptr_torture_current, incrementing the corresponding element of the
@@ -497,6 +515,8 @@ static int hazptr_torture_reader(void *arg)
 			schedule_timeout_interruptible(HZ / 10);
 			continue;
 		}
+		if (nest_acquire && !(torture_random(&rand) % nest_acquire))
+			hazptr_torture_nested_reader(&rand);
 		if (time_after(jiffies, lastsleep) && !torture_must_stop()) {
 			torture_hrtimeout_us(500, 1000, &rand);
 			lastsleep = jiffies + 10;
@@ -721,6 +741,7 @@ hazptr_torture_print_module_parms(struct hazptr_torture_ops *cur_ops, const char
 	pr_alert("%s" TORTURE_FLAG
 		 "--- %s: nreaders=%d nwriters=%d "
 		 "defer_modulus=%d irq_acquire=%d irq_release=%d kthread_do_pending_ms=%d "
+		 "nest_acquire=%d "
 		 "onoff_interval=%d onoff_holdoff=%d "
 		 "preempt_duration=%d preempt_interval=%d "
 		 "reader_sleep_us=%d "
@@ -728,6 +749,7 @@ hazptr_torture_print_module_parms(struct hazptr_torture_ops *cur_ops, const char
 		 "verbose=%d\n",
 		 torture_type, tag, nrealreaders, nwriters,
 		 defer_modulus, irq_acquire, irq_release, kthread_do_pending_ms,
+		 nest_acquire,
 		 onoff_interval, onoff_holdoff,
 		 preempt_duration, preempt_interval,
 		 reader_sleep_us,
@@ -891,6 +913,11 @@ static int __init hazptr_torture_init(void)
 		WARN_ON(IS_BUILTIN(CONFIG_HAZPTR_TORTURE_TEST));
 		irq_release = 0;
 	}
+	if (nest_acquire < 0) {
+		pr_alert("Cannot have negative nest_acquire (%d), disabling.\n", nest_acquire);
+		WARN_ON(IS_BUILTIN(CONFIG_HAZPTR_TORTURE_TEST));
+		nest_acquire = 0;
+	}
 	reader_tasks = kzalloc_objs(reader_tasks[0], nrealreaders);
 	for (i = 0; i < nrealreaders; i++) {
 		firsterr = torture_create_kthread(hazptr_torture_reader, (void *)i,
-- 
2.53.0

