Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501749;
	b=Ga5XvpCAf5qydOAP/cfmMgEIE/saMTB+fszIBFmWWoKCdFHX2OrnewXUKDrc1GR3KC0U
	 gI2/n/oa6Am47jXKV8T9k+dldguPdPJ4qmmVb40Nv2iUW2qq2ETLEkqDzdJX+Gezm8elg
	 vYlysD97gx0MWfTPqy/KzZFIUdcIcV62U1NWXZUfNDzGG0W/9dGctx88Mbc3I0MmyHRuf
	 IrpqlaxRYilPLV2Wy7ShFdH4OACXJ7DYkOI3s4WumFxxq1U5uclpbiV6YgsuDOXOZhASO
	 ziLDeCxNNIonbLbThKTUIRXreSoahgmEd3OYvL4V6Kd5ezvlA6spAdnFebQFaMlBauQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
	b=dOBEiy/ptNU9xsmSNYjCm9Zq0++ZXlbpVFw7uVeHcJ+KpqiVyC2YbduAGIIl63Po+eBC
	 7opTyYVe2bjcTU/iCrcnslWflWOuEZk4Q5FeCpwZKmiosZcvLHBhfkBzUW35YD8gyXMvS
	 Cw7G4zPrPpzYV/0xfs5u48sf9su+Rnxa4eVS6IHVUc0ZxZjxW2f+rmqDgOLeg8QgxU34T
	 LKMTpee6upFpe+uOFY7kLd0TABOY0WcLZ2YL6PF8ECH9cuJJ2MMZAwoahvyD4vIip0pPQ
	 rMU+y7mnX/YIaFCCipUzB544vxYFd1++IKAGH7hU87TNJc6OsRQz4vwrTYg9CR2XFbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbEWJMGj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9A5606A323
	for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 16:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC9A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbEWJMGj
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4919a880834so2710790f8f.0
        for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 08:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501747; cv=none;
        d=google.com; s=arc-20260327;
        b=EZWWhSbyBkRbjmS3xRA4pGnk26RrvOC/8GsvJxUEutXC3+IkioyhjnIwFNJ11zD2BY
         aGU6smcaN9xzOuh1QOOtTIARZy188PseNvNc4RjQlgvw4+uOQX2AoAfBWlGPUMFGLmds
         C7dgcg9vddtDN2N+W2Zj51rl/EGcnRbxAZD9bszBfvdQKmgKeIxaW3swf+v7hgo7CH3w
         dnU882v/HxlN51cQBFlkbCZSRJrCufO0Z+727UuaiIp+WuQkTs32FhSoTwPYbzcK4356
         FaaQAgwu0mg1h887QpXVZNbTirgNXWbIVs5BsaIrQDpRdlIqPjcsZoG2M31cl9ek2lvz
         hpzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        fh=0j7d0ef5KG8jd0LYe1gnq/UTKqwzyjJkv1a4BUf1sD4=;
        b=jLH5Pi1L/uk/g93OdsTD1YB+1LybPt+phd3JGe2b9kM4lpmhIsUaiG0IEeQSYZRd+r
         g6mUZ0bNWenqcx434PnvpeyEJYHZb+qpgeUo/wruC8OIiOIfGZMTvWhtiEXJeBCxFDmJ
         RldL1LLYxD/X6MxQFGZBJlcVsoPTQz9iBf4hNlgQtrai6NJ05KZ2JPZKoT4+v9tZz/8T
         ix9l2JR6TX/vee/d4tLjLjkeIzO9LvdExVtBunZtQuAv8tPC07aCcRUM20wO52AP5roi
         yeRaMFjTwc98cHAUB+6dkOz2l4p/W43Nu0N/kztp+uHnVXgZJZnu028rpzPA5Da2xFQa
         PjfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501747; x=1795106547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=LbEWJMGj1TZ/7rNRO9qk8G8K4ibFutQglMvvWbMrMKAz8a521/IS2lqmS60cwp6gly
         btMH7XnvUxxMQ/RPETcx25f/1l/+LZ7u/R/of9lverJtetQpwNi211uKrmILWHf+GiRf
         GjPmdgsW7djv77OXTj9ysGSfslOdyUokqZKqGsH0rtq21bjdS0JUVkU9ucwuR0BVbpSp
         VQcQrYv5ja/LUi4qKJyPIGGqvvsxuN8w7sQ+BxtM8yP+9gfP8nJV86gJBh6UUx9ifPSr
         HjpUp6OgEVl92+S+mAAaP/0rdXHud4dG2Zu0zrXzqH8uLsFGBQOQydS9ogCXGq4+l/Nf
         nh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501747; x=1795106547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=SDRppt3av3+2BhBF0C3L8wyWndmKaa4o/biSLLbM/vfxFLEV1D+pmNwu5sLfgr/bG0
         83D/vrBcS29qzk8q9N8DXuTcx0BzaBQnrrU8USSu9N8wtQovVQUbghLLQwRg0GTiWcse
         XZcgzRDm4iazm0ffTssiPyPltOg1jZJ49+RdJM/54s3TanQeF6VTYNoM+tEtPiAKQXYt
         MVm3r41mqLFLz5wlYeM62k+xoMLYL5AAB+YigAl0SArMowFFRm3g2K0sKpCV2zrSJ40W
         9osSby7DfiDpylLBYFKVFS12hwdXMeprtVX1DtjYFSps/NGODvC3KjsWKXtSl0l5x0Lu
         eqAA==
X-Forwarded-Encrypted: i=1; AL+hErGnfYMhXe6n2zVUelXcdknF65NW+329+NUjEeMlKSR0IJ+IkJRONrQoGOvVBrL7SNOxaJP7@lists.linux.dev
X-Gm-Message-State: APuU4Z+VqbGJjmsXlzCCRD8vngdk4QwGHhaxPy3kpofblQd1Hz8j/JiK
	PofamORVaJWV5fLUUFxn8yuIBoZAG0utpgAPJFrDuYXxKJ6RSnvjdl1A52qRZxWH9FLE3AYBuyx
	UMITqqWG1lfM3UuuUMs1GfHB/p4o/qeI=
X-Gm-Gg: AYBFou20Y7y+IIPsAu1y2Rwu01lSW+ySmbor+9c8K7YkGBGztXzDUV78Aj4Jb/l4Bit
	y0oN1s//Ec5HYeT+ML9bOXw3I8J4++mWua1G51HlEt/GfYhFKM1X1d13dVgv0QGBIDXMHm4WUZG
	cbZ0RP8qnPkHkj5chWCIv6ASkjZEg9+4Bd2mq5yLmRRHsPeFBeyTynhACncX4XKlNFg5ePn1TN+
	2YQ8cd2X7ZdCpQtw+veHh6DvtJJjkJQw/BLfV86Iwa/RstgjVB9snkt8BvRZ0OZnXcRyTYJ2iPm
	p2/OSNi6MQIoYmBGQkqufv2OTpwodBPUk4oUolMMNRHXylMBs7ZonnS/Rc9amDfirSaelBRX2wy
	DHyd2zssN5uBwR2F7PN6aMs63Iqqit/A420E8g0gj78/WY8AnSfdg/cmexuXrqxFgem4pPQ==
X-Received: by 2002:a05:600c:310e:b0:4a2:c9b:9b98 with SMTP id
 5b1f17b1804b1-4ba0936d857mr116824585e9.17.1794501746962; Thu, 12 Nov 2026
 08:42:26 -0800 (PST)
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
 <20261104165504.2430480-26-kunwu.chan@gmail.com> <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
In-Reply-To: <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:42:13 +0800
X-Gm-Features: AclHuK_5dn6ii1XkN_5ubWft1GmD866Yv1veX15FudsEky0EOAdtZ7tnwYRl5R4
Message-ID: <CAN_Opa-RGS=5kTnMVsj6KE=xCLS8aB=dYSqee7DuFeQ=uvDHKA@mail.gmail.com>
Subject: Re: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to
 enable tracepoint
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

On Wed, Nov 11, 2026 at 5:50=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:43AM +0800, Kunwu Chan wrote:
> > The hazptr torture test registers the hazptr_waiter_enqueue
> > tracepoint for its hot-address scenario; select TRACING so
> > that the register_trace_*() API is available.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> It is useful to run the torture tests without CONFIG_TRACING=3Dy in order
> to quickly isolate RCU bugs that tracing related.  Is there a way to do
> this so that people wanting to register tracing can do so, but so that
> it is still easy to run the tests without tracing?
>

Agreed. Only the HOTADDR and LONGHOLD scenarios need the enqueue
tracepoint; the other hazptrtorture scenarios should remain usable
without tracing.

I'll drop the select TRACING changes, make the tracepoint-dependent
scenarios conditional on CONFIG_TRACING, and enable tracing
explicitly in their scripted runs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/Kconfig.debug | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
> > index b500e96ea1c1..8fc6434a05d1 100644
> > --- a/kernel/rcu/Kconfig.debug
> > +++ b/kernel/rcu/Kconfig.debug
> > @@ -27,6 +27,7 @@ config RCU_SCALE_TEST
> >       tristate "performance tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance
> > @@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
> >       tristate "torture tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs torture tests
> > @@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
> >       tristate "Scalability tests for read-side synchronization (RCU an=
d others)"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance test=
s
> > @@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
> >       tristate "Torture tests for hazard pointers"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides in-kernel hazard-pointer stress tests.
> > --
> > 2.43.0
> >
