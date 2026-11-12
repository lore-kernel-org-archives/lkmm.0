Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501640;
	b=ASQeGiziupV4O2CyUjPglP2+6yow1DBnDcHkpML0JkiXMkSdpLaZc4b6ZTy639zwXzIy
	 ldlNgmukxhmXCJlFn6TtpDJkDK9BfFQd+GQEZzCUW0CeHjNSQWOQzfEh05XW/DH9gODXR
	 YIP63x76zNxIwyGJTaN2/jiHGPsu9JbLiqlD8o5UUEgk1tUJ7HBHmc1URh6ikjl0Wc5oi
	 Wma6MF7atAKdmk5v4xvhmZHDGPt/xgwFxAb44K/Z2BZjGPI761SyNEwd5+//KqmeUVtoM
	 7DyYFqLCt52hBwYeFTC28P64WGQmeW5UdbNwTyPbj/OKhLG2J5zdIUezvkRtHBLZbLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
	b=zgx7dSOqUxukEqCd/GUHB/KweSqpioyH9xcNRHDvp1Ff2ERxzJ30xtwInQghG4mMV8Zi
	 EnHuJLImPTVrVWq3khEquDcgiz8j7sj7TayzC3GIuOKDLvT4zbNQwo36MeLMQpWiGHsoG
	 WXrlXNRcmIxfJKIOujvSBm8f2iuf6dGEalSAqpLa7E41qGz07c+eWCohJUgCn+SWs5I/a
	 og4tSh9H+N0n/uRfLP4Px608SJBk2nSgV4hR0hIYTWhEweKeFvUPPD2PuIUa0YfqG6rI/
	 spRYFsX7NQ5tRmPt52atdYTwTjAUMq/BZ3KVHnUpryIEML6vVr5F2Dxl951MC6Nh9Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usw5ERNs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63700606A338
	for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63700606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=usw5ERNs
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so44272725e9.3
        for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 08:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501638; cv=none;
        d=google.com; s=arc-20260327;
        b=G9eS+KlMnXqa8tzaC/WHS1ReIJRADUh1587o11qi8aX3UqsTxnz7nat7UxRDHu8zyp
         iz3m/7UmmTuwORvq1k6ugA62KB6rNy15iT+smf7UmxB3diZFAyQ+r2OMUMKUnhAVVYSY
         zwHoHpBS0K1jWAylwnQVWOWS3mlgl5vxqiXc2KKUUl694ffFwHTV4/fVIMShfMDw/LTD
         ahuMF8L1kizXI1jdgBhOphozDwJszg0zj91AvZLntS12N37klfzeri9YsGlj2GO+3LkG
         Tw05dZLY7MTGWd78CJUua+BopqavBc1Wa+e1JqEBWwq3is+dEB09SDljqJ3o55ZLcyns
         bQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        fh=fLN7WIFFfZpvRhDIeh4ReLznYCsHW3j4wW6QWgpxixw=;
        b=ouM3/aRPNJu/c3q9MAltE9eqoLgZ+AuCuvQx1ATz53THVPIa0T5ClW9D7Z0t7uCoun
         UW6R9ZluJGfP/sLoRCJ8GdSeb/iHmko5lGuT51HP4zoK7PwYdg0+c3revdZxFXZwKhW3
         xAbYk3QzfTJTrAMC/4mcR9uWB1/mOnXulM5MNqxrK1m29NgIaIoB108bhfKHl9w8AzmA
         eNiHh7ccypRRdhpbxFicJGviWq1+z4G5zapycVfLLAyTLaOMa/nRd3zeGbBNYywDILDd
         3G8fHiMkOonZ/NvDVSt1xWm29541GKlYCQ1ihvkqD+CNiKSrQDFkFYQW58kMKY3vp9Y+
         EKaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501638; x=1795106438; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=usw5ERNsJXnT0Di678RMO6MvJxdHCBU+GoVgXHL2+LptlbAuI+lvATAHLfltKeKxfs
         pwnBA7EC+/RMmI/g/71XpSNDTqoHFLThXWgtwRNuQRvxR8ZIROSa+o0F6J4ubhctOGir
         GAQnE5y5i7YnIsLWvEg+vc/2opG6rNakGB8cwsyyJXy5qMpfGgNsxyNnxFZAQCUyO8y3
         QnZ59Q2lA61DvOKza+Ixc7qAUvAeRakw1AXg1FEJIwEcISYmDz7V/I1ohqhJdHtnQvar
         qxExP1pQflM+3y3nGzvnXqMFs88qkqUoqkzvi/vqimm/GvUKA38mGUs6Qxr9McqUgxjI
         1HxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501638; x=1795106438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=J0o8lHUUtTh7EgCo2/N8Qsw1lSlDv9OEnIZFF/Ja+omKXQpEfwZSLMWncCCO2tXHWS
         9o1OnoFlis65VEx08hlChteZ0xnNYgKoqMQT+6wmRvHq+5PTP/SKezgnkUfLiMzEzc/W
         oiLF4HkmvGK2C+C+c71X0XhukGZmTv49H1mqkp6Mzei1wbf8i/hvTDUpODsvz8S/3Amz
         TojKN41YIevlGHfL4PSX8po3WcIuB7AwGaIZ7h17hBtQ1DikAChlFoR2qGS2vg398dAr
         IUjCsS7heVHglE0Rb3jL+9e0UdcPrIV1dZItYovqbqlLXn9f0qv/Tjy8DyXWXgZ1kzx6
         lsjA==
X-Forwarded-Encrypted: i=1; AL+hErFsSqZR1++j1MRDR/+pQJyvWzegrsL2Bj8NVbPP3yturDKsyUPrsErIXRPA2OP56PSbNI5b@lists.linux.dev
X-Gm-Message-State: APuU4Z/zvi+l5F/QptUtWUK2OTmZa8VzoZ2kVKPQJ8GW5Q1n9AqQOStA
	ucMs9fhEsdIO1044omDQeOOasY3LSQr/5z0CC1usoO7Diua8KvFnkp6jzTIfblHVfEWKU/iqKG0
	wYe4wR2LqHjLz6AYZtWC3j91r6chW9Rs=
X-Gm-Gg: AYBFou1IGU7b0kXdL5YSv+l2EzpgKcnYBeCyWNS/UzLEw4VatgEVgTBRQVVGMmPqvh8
	I5N4A0tqRFWKeBqNXURdZ1eXXuuyZcxy35Mh7YN7aT24gtQ+FkeS/svrYubXEnohtthdgb3KB1G
	QDkdBGUyG2ROpFxKSMWJeeg01t2U5fugBvg4rCgIG39pAiHipUpKnfsDM5CaUob0kR8pLIHbVHV
	gryVDYopC5xVskFL3A6ygu83Bv0TjJbDvZ15sqxl+PrMy5oxDq6kD5DkxiIV008fXGA+r4LZRk2
	F7mFDV0o9EJGdcCk8RfrQFSyzB3v9OUV6m3s6sn4TEgtMttuzSGrA9NPiWvvdT5RyXPb8j1KZLf
	MsGE/xLpPscaMTUgbRrxxh3MCWQsDOKPMJalb/4mRaJ5nN3wd9HyldZb/7b3B/eBV7rmsDg==
X-Received: by 2002:a05:600c:354a:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4ba0939cc9cmr116023935e9.6.1794501637516; Thu, 12 Nov 2026
 08:40:37 -0800 (PST)
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
 <20261104165504.2430480-24-kunwu.chan@gmail.com> <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
In-Reply-To: <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:40:24 +0800
X-Gm-Features: AclHuK9v_Y77arVgZcVVGwgCPDnh2ZgjQdSu0zI-cG-aALJ_JZ_d5zP_ayWkNKk
Message-ID: <CAN_Opa-z5mmmw-OB7bU3xuKJAHp0L4Tp8a9A7tjqiaY4s9V5+A@mail.gmail.com>
Subject: Re: [PATCH 23/28] rcuscale: Add hazptr scale type
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

On Wed, Nov 11, 2026 at 5:45=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:41AM +0800, Kunwu Chan wrote:
> > Add a hazptr scale type for per-writer hazptr_synchronize()
> > cost and per-reader hazptr_acquire()/hazptr_release() overhead.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 5659eaebc5c0..6e3e3f296f85 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> >  #include <linux/sched/debug.h>
> > +#include <linux/hazptr.h>
> >
> >  #include "rcu.h"
> >
> > @@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
>
> Ah, maybe this is why you want hazptrtorture and rcuscale to be built
> into the same kernel.
>
> But what you really want is hazard pointers to be built in, right?
> As opposed to the torture test?  But this patch will be on top of the
> patches providing unconditional hazard-pointer support in the kernel,
> so you can just omit the above #ifdef.
>
> The reason for the CONFIG_HAZPTR_TORTURE_TEST #ifdef is that it is
> possible to build kernels that do not support Tasks Trace RCU.
>

Hi Paul,

Yes, that guard is what led me to enable hazptrtorture for the
rcuscale runs in patch 26. rcuscale only needs the hazptr core,
which is available unconditionally at this point in the series.

I'll remove the guard and add &hazptr_scale_ops directly to
scale_ops[]. This also removes the need for the torture_type=3Dnone
workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > +#define HAZPTR_SCALE_NR_OBJS 8
> > +static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
> > +static atomic_t hazptr_scale_sync_idx =3D ATOMIC_INIT(0);
> > +
> > +struct hazptr_scale_state {
> > +     struct hazptr_ctx ctx;
> > +     void *addr;
> > +};
> > +static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
> > +
> > +static int hazptr_scale_read_lock(void)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +     int idx =3D smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
> > +     void *ptr =3D &hazptr_scale_obj[idx];
> > +
> > +     state->addr =3D hazptr_acquire(&state->ctx, &ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     hazptr_release(&state->ctx, state->addr);
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
> > +     .exp_completed  =3D hazptr_scale_completed,
> > +     .sync           =3D hazptr_scale_sync,
> > +     .exp_sync       =3D hazptr_scale_sync_exp,
> > +     .name           =3D "hazptr",
> > +};
> > +
> > +#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
> > +#else
> > +#define HAZPTR_SCALE_OPS
> > +#endif
> > +
> >  static unsigned long rcuscale_seq_diff(unsigned long new, unsigned lon=
g old)
> >  {
> >       if (!cur_ops->gp_diff)
> > @@ -1140,6 +1206,7 @@ rcu_scale_init(void)
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> >               &rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> >               TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
