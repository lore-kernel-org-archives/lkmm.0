Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499534;
	b=cUoWO/fNk1l2N/GToOv6V11Yo5dhsh0ty8elSrVgSgm/1a1UmtIQbXd5NHni39XRvMi/
	 tFky9ojo8T6xLgY71LHjTrFm7nvAb3YGLJdJG4irxOxb1ponV9X7AjXF6hDkJAJ9tA8T3
	 Rlbav5KLG0F9RoyTgFfs7C/GigbBegqnF19tOsVxlbKaxwLZa6Ir+zI8wC1Q063XmnQTx
	 z8QC4/rg3WNuTkvs9BJXqk70Go1zIL1Xstwg5beF+PYJAMzTSh/BoLF8HzKQG2CrH4vX1
	 sx6Qt3nUFC57CHP8XbM1UhF+QJf8jEuOXKV8NOg83PMaA8hYBdJXFcc0ghPZpODezEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
	b=Iv/ZhlWuc4WNu8/52dCcv4S5mQvqQt0/Bk5hYxDO3Yriy9Fvv3IllBkh3bD7sY9+76yw
	 xd0yvvn2ucJTV7kQk+62LZKucQZqfrhyVjDl2YgLpxl/pkAENnCoF4oxf5QaECbHQE6Ye
	 kN4pWc3fvUnkvc6wYuxOkjDNLbcOJXMDAznMRPXMrQtyidWCEebp51Eci+bYeLbghXpkW
	 gHZX9ia9yhLrKpy9cdDx0lDk1dus/rVIVTY79YW0QOW61U1KyVpGDaQ7xtlY+iyn8X5Ek
	 Ov8gOkbIYrxhfoHmk3uAZ1PGn8eODbWEvuWT/8V2jMkni9uqGbawpvrZk9rJqo1OyBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tr8Yhi4X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF2606A32E
	for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 16:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19AF2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tr8Yhi4X
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so41832925e9.0
        for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 08:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499532; cv=none;
        d=google.com; s=arc-20260327;
        b=brUSw2M0434LVbVR5F4l4XAylh+BCphJpBOmUMBI86XjmSoXnjmY17xmDOT7RfQiWS
         iow/+fywVuC+10l/Fd26gz71RHsWGihJceOdcheaJaU7N48SumqE+26uwvGYeMUpbZPx
         rJm63BBqopeQFeocmT/yBwMiiVDLIZNvR6hYrQvB1a+NFztyW80ORX34lXUbaWcAQiNb
         S6ohzmHdlwUKpeuscmSzV35pGAJl5rrA9esN3rKI2ZidHjdq4+9C853KIMCtwhDeqUO5
         jrOeOPKC5Rm4NsDSRI+cG4YHUoZJjo9JL0fmBBfnD15CbtGZKiZPEMYkjKZn4HrtzDL0
         2zKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        fh=3kD3RPJ4KYVrao2Vmn0RqKtC5VIeQslU/eZqPY8SLnA=;
        b=Cj04LkdTC8+WP2eAFc1jEZpoH6x/hVhMDwqtpbYeFeQRkEbck0u82fwRp3//wOCesq
         gJh/QTdpl8kpuIbctg19gMw6Q1H2OUEihWM4CkH2wtGLW4T/35E3to598ahVF4vpxn6L
         jm0loOx3CKhVQWrXl9HbUZInmA6sxEXfB63Qbhyg7gR5BoBqRltZ01oYSuJ+v+gl6c6f
         OUHH+E1yfCz3ihdbj1C0n9cC7AC602Is/wt4KLstm6y29veYNd/FZG/lSx4Go1v5uKVP
         hxLVbAo+LB1+Hs55lWgku8WHCcBTYL+xrBRqd4gcVTquTvLP1o7HXTQctwoDlYiBo83+
         dUAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499532; x=1795104332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        b=tr8Yhi4XQAcjm/ri4CcJPXuy4MD7IaXl+SRpo9mcOaG3bwsksIBGLOeBlaSkRxJyJW
         fE9WycBtUYnrNtLLmWFpZ8UX9ymnz/zpUsrvT2LazD+SxbZa9YbHsrT2cliFjhd/4lMx
         poHcvtqZ9VcWRB+yvvsj0YVGoMgfH02M2GchBcfae/eQ8bwzIBGoAceixbvOfjvp+UqS
         u3JFGbgOTW3VB/hMmuCwxSZAgdqrCFlRU5rMYtdR/OCLq/RPWGBCXjtXNSAeSXuPvQb+
         GxDTv5l5RxXQ8okDHVRYsjSmSTVlfr5N6zOLIr4+zEqP55OsFj4xGx9dZKW5toYG1zFZ
         F7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499532; x=1795104332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        b=jwQ030RqnCtdkEBNT1gB7Hl9X5qqbl7FLlqGUfLVuBCu6/LM7FUZrkntIPLrmcFDO7
         EJNxtRFG+OzRQ1l3sRxIjiZ4/01cFLG/xO3U6yzDhbT1hnjZvCy6o7D82ivXbCCkJQkR
         RnhgRGDxBAJb0SSZ4xwlPu+O1VvarvsRS28WHgOeBQa4jqiO4UiE0Ykwl6poHqtb59Bw
         QvjAYhtyauW7UgPzcNPpuzyFKp0L4MrhjSdbC5cdR9k6oQxEoKluNXFKHKGr/NSrMgiL
         qLln7/5rBBqNZKiT85d3LYaMTF4Q6IpWMfJfFQlvvwaCHXY6bCESWURZPiGIQMEiiBiW
         Buag==
X-Forwarded-Encrypted: i=1; AL+hErG1s5IsWBpJ64bESTm6/MWTi2hJVcQJMF/TKeyt0dIHOvmhUAVMNbEINgJOVUafendhuaUX@lists.linux.dev
X-Gm-Message-State: APuU4Z/71g5YaXFJKiJtc7fiNfe4XjgfFjZsU5BNPviEwWlWKFFamL5n
	f5HzR1H2a5+EWS7JaNh9V6tTKDWRj261a0TJu/rkloUqQtEjqu+19HU+y9r92SJkEIvxy62NaSb
	vvyouDB/xk3vjawEkxbA2ujhV0rvbvCo=
X-Gm-Gg: AYBFou3jzkM/Olmske/QnVSPOpEm/qHiZuJkmr7QrVFuSTVKy0LezO/8M07gLQMq9Jw
	xjyZ+qcHWlki0QMtNCoHIs4srsEjMPLJEOCcTA92XZ9yfRSZl8iMAClwJeBnclxHF8cMZ3DPZb9
	TFqcF9aYS10+N+229HRCcd5A8iQJSLSjClM7VRfdDr5+CO8RTrRE36HY8XoWz8AsFE7nYrAWbSS
	Cwh/sYiCLSnz66gOBiZwAshIpcFRAajD5qAu95xGjFYSZYEnuSZwzJ3TE09zGoiYczSj6T95krn
	6hVq99P26oqpE+q5EBSDKNhRw3+3DTgjGJWnR4mtmiwvjBMlJJcgs7Id2B6G2wJYQnq4NywmMhD
	OJDHFzmGqpPZvr2tDfcC73NvEyYTz57JsKdoMq1c0yCUmgxWO75N+3iADEYBT1xnNQAHhBw==
X-Received: by 2002:a05:600c:3144:b0:4a1:a45a:88f with SMTP id
 5b1f17b1804b1-4ba0939ccc5mr113980935e9.20.1794499532112; Thu, 12 Nov 2026
 08:05:32 -0800 (PST)
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-9-kunwu.chan@gmail.com> <3433f88a-027a-4f70-be5b-2c35f9318fd4@paulmck-laptop>
In-Reply-To: <3433f88a-027a-4f70-be5b-2c35f9318fd4@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:05:20 +0800
X-Gm-Features: AclHuK8xdCr_GIOWnwsADKv_-qsCDHnNK6PLsB5r8AjwlSaUjiXIHJvwzGzBDkI
Message-ID: <CAN_Opa_SW3_2uMYudKJcJpeMHaitpvZPnyqxoQTmajx6aW6Q7Q@mail.gmail.com>
Subject: Re: [PATCH 08/28] hazptrtorture: Add slowpath and lockdep scenarios
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:41=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:26AM +0800, Kunwu Chan wrote:
> > Add SLOWPATH and LOCKDEP configs: SLOWPATH enables
> > CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH for slow-path stress; LOCKDEP
> > combines PROVE_LOCKING with wq_churn=3D1 so each alloc_workqueue/
> > destroy_workqueue pair exercises the lockdep hazptr paths.
> >
> > Suggested-by: Boqun Feng <boqun@kernel.org>
>
> Could the --kconfigs and --bootargs kvm.sh parameters be used here
> as well?  My concern is the proliferation of almost-identical scenario
> files.

Hi Paul,

Agreed. I added the configs to keep the forced-slowpath and
lockdep-churn cases explicit and repeatable. I'll drop the
separate scenario files and retain both as scripted PREEMPT runs
using --kconfig and --bootargs.

The wq_churn workload itself will remain in this patch.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/hazptrtorture.c                    | 48 ++++++++++++++++++-
> >  .../rcutorture/configs/hazptr/LOCKDEP         | 16 +++++++
> >  .../rcutorture/configs/hazptr/LOCKDEP.boot    |  1 +
> >  .../rcutorture/configs/hazptr/SLOWPATH        | 16 +++++++
> >  4 files changed, 79 insertions(+), 2 deletions(-)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/L=
OCKDEP
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/L=
OCKDEP.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/S=
LOWPATH
> >
> > diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
> > index c8b7c208775b..fe09280d063c 100644
> > --- a/kernel/rcu/hazptrtorture.c
> > +++ b/kernel/rcu/hazptrtorture.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/torture.h>
> >  #include <linux/hazptr.h>
> >  #include <linux/rcupdate.h>
> > +#include <linux/workqueue.h>
> >
> >  #include "rcu.h"
> >
> > @@ -51,6 +52,8 @@ torture_param(int, shutdown_secs, 0, "Shutdown time (=
s), <=3D zero to disable.");
> >  torture_param(int, stat_interval, 60, "Number of seconds between stats=
 printk()s");
> >  torture_param(int, stutter, 5, "Number of seconds to run/halt test");
> >  torture_param(int, verbose, 1, "Enable verbose debugging printk()s");
> > +torture_param(bool, wq_churn, false,
> > +           "Churn workqueues to exercise lockdep dynamic keys");
> >
> >  static char *torture_type =3D "hazptr";
> >  module_param(torture_type, charp, 0444);
> > @@ -62,6 +65,7 @@ static struct task_struct *preempt_task;
> >  static struct task_struct **reader_tasks;
> >  static struct task_struct *do_pending_task;
> >  static struct task_struct *stats_task;
> > +static struct task_struct *wq_churn_task;
> >
> >  #define HAZPTR_TORTURE_PIPE_LEN 10
> >
> > @@ -83,6 +87,7 @@ static atomic_t n_hazptr_torture_alloc;
> >  static atomic_t n_hazptr_torture_alloc_fail;
> >  static atomic_t n_hazptr_torture_free;
> >  static atomic_t n_hazptr_torture_error;
> > +static atomic_t n_hazptr_torture_wq_churn;
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires);
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_releases);
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires_irq);
> > @@ -668,13 +673,14 @@ hazptr_torture_stats_print(void)
> >               atomic_read(&n_hazptr_torture_alloc_fail),
> >               atomic_read(&n_hazptr_torture_free));
> >       torture_onoff_stats();
> > -     pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: =
%lld relundefer %lld\n",
> > +     pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: =
%lld relundefer %lld wqchurn: %d\n",
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_acquires),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_acquires_irq=
),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases_irq=
),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases_def=
er),
> > -             torture_sum_pcpu_atomic_long(&hazptr_torture_releases_und=
efer));
> > +             torture_sum_pcpu_atomic_long(&hazptr_torture_releases_und=
efer),
> > +             atomic_read(&n_hazptr_torture_wq_churn));
> >
> >       pr_alert("%s%s ", torture_type, TORTURE_FLAG);
> >       if (i > 1) {
> > @@ -788,6 +794,38 @@ static int hazptr_torture_preempt(void *unused)
> >       return 0;
> >  }
> >
> > +static void hazptr_torture_wq_churn_fn(struct work_struct *work)
> > +{
> > +}
> > +
> > +/*
> > + * Repeatedly create and destroy workqueues.  Each workqueue creation
> > + * registers a lockdep dynamic key and each destruction unregisters it=
,
> > + * which exercises both is_dynamic_key() and lockdep_unregister_key().
> > + */
> > +static int hazptr_torture_wq_churn(void *unused)
> > +{
> > +     VERBOSE_TOROUT_STRING("hazptr_torture_wq_churn task started");
> > +     do {
> > +             struct workqueue_struct *wq;
> > +             struct work_struct churn_work;
> > +
> > +             wq =3D alloc_workqueue("hazptr-torture-churn", WQ_PERCPU,=
 1);
> > +             if (!wq) {
> > +                     torture_hrtimeout_ms(10, 10, NULL);
> > +                     continue;
> > +             }
> > +             INIT_WORK(&churn_work, hazptr_torture_wq_churn_fn);
> > +             queue_work(wq, &churn_work);
> > +             flush_work(&churn_work);
> > +             destroy_workqueue(wq);
> > +             atomic_inc(&n_hazptr_torture_wq_churn);
> > +             stutter_wait("hazptr_torture_wq_churn");
> > +     } while (!torture_must_stop());
> > +     torture_kthread_stopping("hazptr_torture_wq_churn");
> > +     return 0;
> > +}
> > +
> >  static void
> >  hazptr_torture_cleanup(void)
> >  {
> > @@ -880,6 +918,7 @@ static int __init hazptr_torture_init(void)
> >       atomic_set(&n_hazptr_torture_alloc_fail, 0);
> >       atomic_set(&n_hazptr_torture_free, 0);
> >       atomic_set(&n_hazptr_torture_error, 0);
> > +     atomic_set(&n_hazptr_torture_wq_churn, 0);
> >       for (i =3D 0; i < HAZPTR_TORTURE_PIPE_LEN + 1; i++)
> >               atomic_set(&hazptr_torture_wcount[i], 0);
> >       for_each_possible_cpu(cpu) {
> > @@ -960,6 +999,11 @@ static int __init hazptr_torture_init(void)
> >               if (torture_init_error(firsterr))
> >                       goto unwind;
> >       }
> > +     if (wq_churn) {
> > +             firsterr =3D torture_create_kthread(hazptr_torture_wq_chu=
rn, NULL, wq_churn_task);
> > +             if (torture_init_error(firsterr))
> > +                     goto unwind;
> > +     }
> >
> >       torture_init_end();
> >       return 0;
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP =
b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
> > new file mode 100644
> > index 000000000000..f0ff29925a54
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > +CONFIG_PROVE_LOCKING=3Dy
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.=
boot b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
> > new file mode 100644
> > index 000000000000..7b16720214bd
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.wq_churn=3D1
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH=
 b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
> > new file mode 100644
> > index 000000000000..4d13028ca84c
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=3Dy
> > --
> > 2.43.0
> >
