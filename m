Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1F28B4FA
	for <lkmm@lists.linux.dev>; Wed, 23 Sep 2026 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138443; cv=pass; b=A9pXxE9e8Xpixq2Nc3xIWR8yn2/QgPO65lB/5iSbcxhAshXKPhMyOj15h5LAGinboPYi3Erm10fk33SEnGkWlOE8kaae50EpGRMC/DfZwK11bBgdbmIjyOysWZeAOSnET1zXZVd+9bY3HMLha2PVTXP5AJk+up25s3BQhfgvhpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138443; c=relaxed/simple;
	bh=DfwslUgXH9iUiGASTRA0OnW94V4DmVUUOxWiW01jeOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfjXzQOJ9w6W/7MaNqYAzaaIY63e86JSml/4xHg6F5CLRp/OtYByYUQJL1W9JSchv7N1/uT8aTgtAE/0v5F6ouBNVIM5MTe0K92U4KpRhDFx3kfV8LSa7DR1QJfIvezfGo14yV5h8AxJvCSCPjM9XcYY45opMCGatpCtKwKwH/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSVDYs6m; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSVDYs6m"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so2196815e9.1
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 21:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790138439; cv=none;
        d=google.com; s=arc-20260327;
        b=nLHcf8kYaePzjKvp2cvk/o2ngnCI6HJamfzbsCDDWW55FW4mXK0p40xLW/pmMV0JJm
         l68xDv7lH2qLrn3Vh3y+b3KA08gaC7k6Gve+AGDWR7z+lrMIam+4LyKAe7XFsMO7EUR1
         6Etyx5uC9CKpCRaXTou12H5orlX11bwaKR50q2S0/QTPgXmp/tzreVH48kHBbW8JZV+/
         tkpRiLGULTXmvsis8M6sO6Sg5L+Es/YRVvmM92ScB44OIe+AFKcRCwdEYkeUM3aDVX3M
         79GFeD2H2EE/fkaWAJskvpimMsnDqb3giuMCKxYK74aq5rUefdAj7z0CjdDjzVtBr+0Z
         r/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        fh=wl3nx1IxUmtXozL1XPIgHbL6t4/wLbm7QZBJ4SQW8Vk=;
        b=FXJOmwy89XjKTVdGJv7KdOgegyPdrQ+yetVEbjdGHHG/lNDBzt5g2l02LTJjF8vRDt
         60n1fDLWztsESnqsw5OePO3U88+MNtFZNfRwEAWIxYFqMS9ngCsVtwxcBI8Gewc0qgxU
         fAhgyCteiPMfovODkacsmqtTxI6gLgCBxmSDTwFoBFm/Bf4pc7SD2DLA6vHrCLvZkq5k
         4Q/aPLq8hnBFelv8thkgH1Zb292GndO/q6H68iCOQbdySMhxbdRKXw7+wziGdMbgH+9q
         pFONZ0WORrJ+EZWJ823RJEFnvoqkuwHdlSQkI8VVkxFC+wQRf1+LlN45FihNOQsoFLO+
         a6Tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790138439; x=1790743239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        b=YSVDYs6maOcBTkS5e/QjxREl+s0LCYu3ikF5IqMu1bJ4v73QgCOZNjE17w7LxOZAKg
         XdZQnhgo6tjhj2mSpbm9LZ7y7L96zgilqLckef7/8kEfCX83Qii00FwiLjEvfJThCBgj
         3iPsuXVtelQcreNyUpNQW7VqoQeu/rPto9dN28VdBy6KLEwrBuJcPMBRkjiJ6bCF93gV
         3sG39qcx+bLjBXGSidZk4nkBnYUi+9XXDk2eTqoKpBfJ1T/BPHtZcEHEiEhVPS/zISMk
         X1Ac2KknU6nX8dpJi0U+ntRjInt+INk/RJbMnDxsD5M7kVEGSQpszKQ1jSYiEL/4trtp
         RONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790138439; x=1790743239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3v8KouzydVZ2wFebRu1KMgQMureFqXEgF0puCqWitK4=;
        b=XUeWAk0BOsqwwLFq/O9Hv3TTczo67arBSETZhmcm4Fpg5I7w4dxaZh9DVjVSZOCLZV
         Tghi8ScDwRpZtbjZ5CeDxTrfqEuv7rJOE2rnXjBh/rZtfr1NQ3XNHPtc+UQUUqtpFbDx
         kGEbp3rY5ROMC2gVTeG+xmefhDB05NMeqAAH5OAPSCCwVE1kQlKY89W5t8o5Z2C3DUQx
         4sAR0xzkGFs+T8VbpnMbSjiQ/nDgwNxxew45iX+YekxoN0vkkviwOrrzdFDEuzvVI39M
         F2iQuJ863DgSDh3i7cwJl7UHlu7/mY+WEytFbLcheHGZKz8q9L313XLNcuPyPnDuNXRe
         ik/Q==
X-Forwarded-Encrypted: i=1; AKwUvByuNhfrTNoyd5+7Ji1lnmycTdcYrG4/f6QBHtDIZlVhgsrxaJ/THaZoyutnE/tFjlO5es7b@lists.linux.dev
X-Gm-Message-State: AFuF++nDZSOdpD0qUDqFNmUH7H/MdCba0EYrSXVQx9DREj/lDoDO50St
	yvKwm4jgcecTxZ8t87mppG8fBnMt/rXj4SqAkJMmJrBeOXiVe999aC2i/9KpUbsdYm289odsl2D
	/0pAQQolaWmfoRTIjfEjBzcbDISgF4/M=
X-Gm-Gg: AYBFou15vXdA3CvKRW6GnsrQy1v0D5yBiEIKiRfYIzXdZCddDucjFA4v6ddI6oyGyWN
	rSpokQwqabuI8fDU4DV0aS9WTSAsyOJmruDnmEJPxbPiL2Q/nQ1VwJnGnKp0UspufjgM4wymNLK
	+Tt1pDkfAwsLYJaajbHWPYPopqp3XTUp1mmUV7FIMIAxblpxfOevL0S3D39ILD/wn5PVTsxZTa/
	PMoz0+ydSeF5RTaSE+/kinx3ui3qNJPvKmn6wpaVEp7F+DDikeJsJFQMQ5XpTk4fUG+0ITdL3uy
	XEnQK8bVK3jkHY95Ay2TncqNxqx18O6d2SoTvI6mpeh90g7iIO1xvj2D4tKtdAXxlnLz2Aip7so
	DIxTmj4/uA9/0xg==
X-Received: by 2002:a05:600c:4704:b0:49e:799e:c1c3 with SMTP id
 5b1f17b1804b1-49fdf12d3dbmr12321785e9.17.1790138438843; Tue, 22 Sep 2026
 21:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
 <20260922070950.4173245-4-kunwu.chan@gmail.com> <arI0bexTH7CL66Dc@MacBook-0RXW5>
In-Reply-To: <arI0bexTH7CL66Dc@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 23 Sep 2026 12:40:27 +0800
X-Gm-Features: AclHuK_6rmoBk0Xrp8rz2DECfqwOHj3oChdP_Pi51R31FmxB0rmW3v9rvLOe0xk
Message-ID: <CAN_Opa-B+ipfSyvzBCtJf7jbiKjBFT1i=-8y9LCj+dCiRh=Z_w@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 3/4] rcuscale: add hazptr scale type
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:55=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:49PM +0800, Kunwu Chan wrote:
> > Add hazptr reader and synchronize operations so that synchronize
> > latency can be measured alongside RCU and SRCU.
> >
> > The read side acquires the hazard pointer in readlock() and holds
> > it until readunlock(), matching the RCU/SRCU reader model.  The
> > address of a static object serves as the synchronize target, which
> > is stable and never reclaimed.  Both normal and expedited sync map
> > to hazptr_synchronize(), since hazptr has no expedited concept.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 65 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 64 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 1097ec15879c..072ddf9526c3 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/torture.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> > +#include <linux/hazptr.h>
> >  #include <linux/sched/debug.h>
> >
> >  #include "rcu.h"
> > @@ -418,6 +419,66 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
> > +
> > +static int hazptr_scale_obj; /* Stable, non-NULL, never reclaimed. */
>
> You can probaly make hazptr_scale_obj an arrary, and let an updater
> either randomly or round-robin select an object to wait, it'll reflect
> better to a real world workload.
>
> > +static void *hazptr_scale_ptr =3D &hazptr_scale_obj;
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
> > +
> > +     preempt_disable();
>
> I think you can drop the preempt_disable() and preempt_enable() below,
> since the new hazptr_acquire()/hazptr_release() work without them (i.e.
> the hazptr acquisition no longer requires preemption disable).

Thanks, Boqun. Both points make sense.

I'll drop the explicit preempt_disable()/preempt_enable() and use an array =
of
objects with round-robin selection on the updater side.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> > +     state->addr =3D hazptr_acquire(&state->ctx, &hazptr_scale_ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     udelay(10);
> > +     hazptr_release(&state->ctx, state->addr);
> > +     preempt_enable();
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     hazptr_synchronize(hazptr_scale_ptr);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     hazptr_synchronize(hazptr_scale_ptr);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
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
> > @@ -1110,7 +1171,9 @@ rcu_scale_init(void)
> >       long i;
> >       long j;
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> > -             &rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS=
 TASKS_TRACING_OPS
> > +             &rcu_ops, &srcu_ops, &srcud_ops,
> > +             TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
