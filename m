Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809384734D9
	for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548382; cv=pass; b=ikC7LjYmh+8Xfr0Vs8fRsr3lqfWhjgVG+cLgLfPYV6a3TfsDQnfGVmi3AZhpbYnjP9gRXlefW4qJiMc5OkPHzVfkYdUFyyj3ZoJMsugQffYmkSCGs2eBYrTHmCdsgtu/mZL1F8CNHlgnWmI/Ws2CHUglUyzsuMBKLAvCBIQMR08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548382; c=relaxed/simple;
	bh=IEjLqaIu8AkCAZFWhjQLI5kBxN9JYLswj17xjaCSYi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWypGQfMbUStPgNXTDkGxvCdCerfxlTedmJnYXXMhoSx4P1qY7614NwLPcYqGDIsvHfzarlBDJCnKjGKwT9CQ3f8zO59qoZ4Jnthc0q3M3iLltpef8s9i1frfVpMCUHDzwn58AVJoInPBPbmqTPOxkx9wgsn5UU/TGTBgjFMD4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bal0Shvv; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bal0Shvv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso284315f8f.0
        for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 01:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789548378; cv=none;
        d=google.com; s=arc-20260327;
        b=DiO+5ixq+UDtgqBJahxx3q4dT5UqXxs9Q57D4MJ92en9bURkWtIq8hCEFpFAgGZwCj
         rDZIdzdVjj431/TaPwH6P9BasEap/y4lgGwCO+w8E0h/PigWlfIJRlGsbda3bTseeQ9c
         jm6e8TwyDAQ/D5QJa4lQmkt303sxb/NLpZJZSnkZTd9W/wiVm8cJM6UmFy4vYZQTKi7e
         gcOwQIIW+WmzO8Fok8vObBo21UZ64Vu5Jdnmc1ZSCulJ8N/8rbJnoKKpAR51B5Jz3jpn
         Lmt5nY6mAQu4/gIMV9kJR8QIhIJ6XKb2leshBcMA85j1svV84744xBRQmuQK/CgUf0ic
         C+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rSiQZTcfAtXGEaMMQ863f3u/xpmDXOVO366eO3VYe58=;
        fh=wUt36tirpOrXvnjwfKaaxw/QQDQNRrSWlOrxzqO6TPI=;
        b=F8yZg4yxU2WMswopH4RjWY/2d+A/6W30LzGAYA515zG80b579YTwr/G96iYUgmLCiM
         kaoMPQ2Muib1CPSFPfx+751ZHkX38mlPuApDaZOfOkhvXkhTE0OgvGYyf7wbZieqW+Xq
         hsZObMwGDgZUHEs6nkCTozG8F61orliZ4+++2d8q64UjvQel/6vJTxr72KLXf2f6vMaz
         cEvwAQh3Yj7mnkNehgawnR86OB5cw/t1OI+SRIEtdAz314GHmNSMq+SL1qT7w7P6JCjq
         Wgv66jPGxqsWTAgZDd0mTBjVH7F1MgEDswK97lQrSeCBlGaOUB/hj+S4H76jQ8HrOQuG
         yHww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789548378; x=1790153178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSiQZTcfAtXGEaMMQ863f3u/xpmDXOVO366eO3VYe58=;
        b=bal0ShvvNvoufKyEmQ78iY2sUm4ov1SQgNVQhGpv30hsUMCAVE6Qg6obQPGWobm0AH
         lgQCS37iuwSiz9PZqutLaCVoKUrUXB+dV8AhR2xanrT28YzlRh3AUs/6+41x4MREggnW
         cp0Fhnjg+cQDzVVn4ww6C+ozxDiOd9p9HXDYmdYwWANBzcn+owEGcFmZzSyACzKNGUNF
         EUpANSyo8PCftZeg0QbGzsj1qCSdp71T2yngbIBafTzAHjaTdiM7ZsC80Y2+b5Aw5qvH
         HLS0oXJYkQ6W14K2sZ+39wayppbFC59ugvDpR4QL6GT0rtH/EbcEa2iqMD+ottPLbK5a
         skLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548378; x=1790153178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSiQZTcfAtXGEaMMQ863f3u/xpmDXOVO366eO3VYe58=;
        b=G8LTl4drWXTvEplzi/8fRdsWtnMHKs8IHSEE4ZmNiP1jE9buR8tLUK4xXK1Fsgncuz
         g4L9XKS/v77q1ZTHug1AfvMw3dOUu6qm8pOlVXYhaT2oaWXl+GxxPGIXyzIsIa/uIz+W
         mawd6EFW5xppeV/QLdSAQGcFvt/0I4u2VDzd2QweqN/w8s6yIFURjhW6Ac8K5k9k86lG
         iOdHCPIJpAsH3U9BaAtdzvGFQIlaxYClX+w36wpKM8ZsQpTjl8dOfnOerY8hCIl7ysDL
         rb4Yps1khrBlEvqDKZwoSur/X8ABcK6EDvKN640GNwDPwjYeWuJzEcphy0QyA2rgdrF9
         W1Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzINAZ6WfgKz7bjmwFT9a7tqP6+CtsHJmlhigXu/bMNTYtcN94RQks6iZmkCKSpMTBQ1yEo@lists.linux.dev
X-Gm-Message-State: AFuF++kRatbuFqPT41HlZlUBhK96p7YSTgIicfkUjuGNAZYYb98QAQku
	wAQ3tMDehEAAY3zVqcbu/mfOD+D8AyNJ6cZSxCTRoIajtzEkk0nJC4q/SVNV0sBhDWQy2vMTyMq
	paIxJHNUGvZJDi26XepR8/Z85rPz4TFY=
X-Gm-Gg: AYBFou1y6R1TpYiwQ+oIHWkA5y9cKGBqLawIwTiEPZz6tcwGz6xjv2OCHXe/6iWlI6H
	AkgzL0Maq9j0xTqkRnBKwbrQhmZZmjYfc71mm4NUcMOmtR0QYYJzvMYAoBuuuwcUJwzzLIgYqKT
	KzAcMUcyh7f2Wn3MY2UH/PQ0+jKS0OHwMNt3tP73FkkiQg+EeGszHkW6rsP08f8O6jrBy+B33lv
	49zgeaDFcEuEBNZwSuKUPOldhSXD50r28S9WR7D/jzw3bzU96ATLGoFQamhtFM6wTgGbKCdGjZe
	LRkr/5Fm5r8HrdwpsQKryOUTG+GfmU2usEuFd/ObXnAV7HCGmnxjl/DPBpQCcFSfzjqcp6Ryh7W
	MDa32ScsS1NE0lzLSIPw7R6Ex
X-Received: by 2002:a05:600c:1da8:b0:49c:fc6c:be09 with SMTP id
 5b1f17b1804b1-49eb7345517mr18152035e9.32.1789548378291; Wed, 16 Sep 2026
 01:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914143943.1503066-1-kunwu.chan@gmail.com>
 <20260914143943.1503066-2-kunwu.chan@gmail.com> <9106d07e-a8e5-4379-bec6-eb4ee9f0df5c@gmail.com>
In-Reply-To: <9106d07e-a8e5-4379-bec6-eb4ee9f0df5c@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 16 Sep 2026 16:46:07 +0800
X-Gm-Features: AcwNN1X9jYkXw3kugvUA-Sbwd9dezj6tZoTKrloGClMvzUYrftm_f3hZejBHjCU
Message-ID: <CAN_Opa-s-4f_7FRHL_WdUQERP2wZ9N5X5ie0o=DZ5QQektiAxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Documentation/litmus-tests: Add SRCU fastpath
 anchor-before-scan test
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, paulmck@kernel.org, 
	dlustig@nvidia.com, joelagnelf@nvidia.com, corbet@lwn.net, 
	luc.maranget@inria.fr, j.alglave@ucl.ac.uk, dhowells@redhat.com, 
	npiggin@gmail.com, boqun@kernel.org, peterz@infradead.org, will@kernel.org, 
	parri.andrea@gmail.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:34=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> Hi,
>
> On 9/14/26 23:39, Kunwu Chan wrote:
> > synchronize_srcu_atomic() may end its grace period immediately when
> > its scan of the per-CPU lock counters finds no readers.  Correctness
> > requires the grace-period anchor written by srcu_gp_start() to precede
> > the smp_mb() ordering the lock scan.  This ordering ensures that any
> > reader whose lock increment is missed by the scan cannot have
> > incremented its lock counter before the grace-period anchor, and
> > therefore cannot be a pre-existing reader of this grace period.
> >
> > This litmus test models the key ordering between the grace-period
> > anchor and the lock counter scan, where "seq" models the
> > grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > smp_mb() and the lock scan.  P1 models the reader-side counter
> > increment and its smp_mb() from __srcu_read_lock(), which orders
> > the increment against subsequent critical-section access.  P2 models
> > an observer that sees the reader's increment before seeing the
> > anchor.
> >
> > The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > which permits this outcome.
> >
> > Tested with herd7 7.58 using linux-kernel.cfg.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-ancho=
r-before-scan.litmus
> >
> > diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-befor=
e-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before=
-scan.litmus
> > new file mode 100644
> > index 000000000000..e0492a4d8e07
> > --- /dev/null
> > +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.=
litmus
> > @@ -0,0 +1,58 @@
> > +C SRCU-fastpath-anchor-before-scan
> > +
> > +(*
> > + * Result: Never
> > + *
> > + * The synchronize_srcu_atomic() fastpath may end its grace period
> > + * immediately when its scan of the per-CPU lock counters finds no
> > + * readers.  Correctness requires the grace-period anchor written by
> > + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> > + * This ordering ensures that any reader whose lock increment is misse=
d
> > + * by the scan cannot have incremented its lock counter before the
> > + * grace-period anchor, and therefore cannot be a pre-existing reader
> > + * of this grace period.
> > + *
> > + * This litmus test models the key ordering between the grace-period
> > + * anchor and the lock counter scan, where "seq" models the
> > + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> > + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> > + * smp_mb() and the lock scan.  P1 models the reader-side counter
> > + * increment and its smp_mb() from __srcu_read_lock(), which orders th=
e
> > + * increment against subsequent critical-section access.  P2 models an
> > + * observer that sees the reader's increment before seeing the anchor.
> > + *
> > + * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > + * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > + * which permits this outcome.
> > + *)
> > +
> > +{}
> > +
> > +P0(int *seq, int *ctr)
> > +{
> > +     int r2;
> > +
> > +     WRITE_ONCE(*seq, 1);
> > +     smp_mb();
> > +     r2 =3D READ_ONCE(*ctr);
> > +}
> > +
> > +P1(int *ctr, int *x)
> > +{
> > +     WRITE_ONCE(*ctr, 1);
> > +     smp_mb();
> > +     WRITE_ONCE(*x, 1);
> > +}
> > +
> > +P2(int *seq, int *ctr)
> > +{
> > +     int r3;
> > +     int r4;
> > +
> > +     r3 =3D READ_ONCE(*ctr);
> > +     smp_mb();
> > +     r4 =3D READ_ONCE(*seq);
> > +}
> > +
> > +filter (0:r2 =3D 0)
> > +exists (2:r3 =3D 1 /\ 2:r4 =3D 0)
>
> Another knee-jerk reaction with exaggeration  :-)
>
> Why does P1() have an access to an un-shared variable x ?
> smp_mb() in P1() can't pair with any of other thread's smp_mb().
> This doesn't make sense!
>
> Let me rephrase.
>
> Litmus tests is supposed to be minimal.
> Every memory access and memory barrier is expected to
> have some effect in the outcome of the test.

Thanks Akira, you are right.

>
> In this case,
>
> P1(int *ctr)
> {
>         WRITE_ONCE(*ctr, 1);
> }
>
> should be good enough, I guess.

I'll change in v4.

Thanks,
Kunwu

>
> (That is, IF I understand what you are testing here...)
>
> Regards, Akira
>
