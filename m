Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A48361DC1
	for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359004; cv=pass; b=DIErNhOl0ZBio0EvNZPpmybTZvXXl3Tk/CdNvR+ihYsFKBMItfrFIeDVma7hioP/FI6BjBaTTpAD916tTSmpVobgqocaYmkyk6S2W366eFF7Imd1AlL4RFKxlAC91SfHSaH4bQ9Rbl8XoLLtizS5Z7NNEe8veYOln13ngbmncrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359004; c=relaxed/simple;
	bh=OuocpLdMNPQW3Fx2t6L/bKgKdcwFNsKd1HJmgA5pc9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NylerrC5pdO5w7gmGJN9q0m81atJ1q9CJHFWfd7OaDsaHd7aylY0SxilFmu1SSbqyKp+Y55KDjI/QQOSljY7YVn4NH54B024pis4qAHqlfwcMrSUzfmWETcJKf0X9aiBQmxlbIukvekNVLyvXwV1aFUTUH9CcDdu7RB6p5+gmjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcdEjhxY; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcdEjhxY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so12490135e9.3
        for <lkmm@lists.linux.dev>; Sun, 13 Sep 2026 21:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789359001; cv=none;
        d=google.com; s=arc-20260327;
        b=YfLIt4L/ifpKi6CbWXUr0JRziEt/Ycn/eQ9zeuxuSsD3EumkZP/0Q2UCel4qIGpKhs
         wY+dnhA1yujiWwyhOm6b8jRepbLfugPmQlOL/n2PDBc3B3+HoHe0NfgO1qD7sXDqKfPD
         96uueUF2JsV6XnaRFGq7f76lydWTlS7/5PzsuAB9gqgbKiXe5MxQHZWbQSYqi/rHiGuq
         8j2Lxo9M6mNfje98OLRyFoGzmIuh3CaqxzDQum0jXN2ILGjKaozGs330QebEalnm9278
         zEAl2Vz0CwTme3dTcDpfWHSPPZlBVg9uft+/VQ4nUTQZI0oCjeXRts7kCcUhJtQAd1il
         IXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        fh=JXggLUbBKjOL1Wf9iZTfsOQ0ROKUftdQwt+PYm7YzTI=;
        b=EEAxfLNMg7pNzUhNScdNtRZ/tHcStvH1NPJ/YhnH47LUC5hFtY+UG+l2ovvezGIcZ6
         d91UAPtSAeNjJBdJxYJEW/XDmH4ObIYGUJZxJcSXQ6lx8kAfLrtfx8v6ClnoISSb8mgF
         z6oluq5fyb+LRjHOApkfe4i5JV87j5UxNqXdD8hOpkF9+69i5G2nlHbGrsqV4fGKkSSz
         7c0FomBjkjch0Q2IyPfOSzxLtv4nv5SZyiZ60IeRmFvMps254I5lyt9NFYUb0oTojvZX
         QGoPXr+MiNKyKr/biwB1C9V1MZsJH8OVNxkrkyukmYW4JllriFN44wC4KuN1Ub98Q+0X
         g3tg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789359001; x=1789963801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        b=KcdEjhxYJnWv750oQYzFyrGwFHNDKBMMeBj1AwNUxsq3ePkNBjVwbUNx6WWnDkJAb8
         Mt1dX9cp5hNzonF/W5hmH1GWR7u7dpwJMydaPEiY8Z8VZ6dY3VCCUIaSKpnp4kErUZ/n
         tyW1uTprID9b3sYfI4ufwIa4v0oXtbpC/+ffh4v/DtHT/FmoZ8/gFJQPfmgPXxe4a81Z
         WT9kgX1eAGTe1uTRKrk2+2bJ5ETTB42gLx2Up/c+GT0NN+5B+313PQ+FkB/lR5ye4QHP
         pHrjkwTAS+dQFw6AEk+cboLzSH3Jzlk5OdgUwWo+iIgupk69n6HZ0bBcKyRlBTBZTD2q
         BHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359001; x=1789963801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtqliJ4xhgZPrGv7aDR1sY82Ecpr9o/c+cAlkpJq1QM=;
        b=eHwWYqX/d7or5BldjFAxMs52ig2g7WLsh2D8iR9Sqg3wBq04Eahfn4dIXuGKNR9/Kw
         Eq94YhkzwGxekT6y897EIOxCkm3c1Ys7FQy9IPuZmVa8Q/zajLPPSyCrOOcBP6ju4PD7
         s/J3Bp7ZzMorcucikNLNU4BYu7vgfw7u2+0FN7dNaHbrQxvqcrtQj7jSkhIUMA3piBZP
         CPSJ1tXIzyuRRKrkTiVDx5duqcj3QHA+UramWXtkcpZytJWOw6uc+6tSe76CUYgsgKq3
         UKdSCmvzNGh2vOnpfVtuLNL5aAtjyT/8RrdqhObZ4VQDOD8HtWJiVBVM9s6I6z/0WGQg
         gXnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdI3w2RIBGgQ70nA3POF3WsnjeVmTorpq1YNvoFsME7oJQTZh52SkSzmCSnwrZ+yfW3UnB@lists.linux.dev
X-Gm-Message-State: AFuF++kpscNHER3kktHl2D7CZojMJjUYeiH4gpV8UBnWAyqZWi1MYyYA
	q3eJAGMji6KEGDS+lfNNzvyCi73NpO8j8gneDMPBflTSEVV2NV0kKfwon4qgw5hnnJZGNovGQC1
	4+vmrPw0Y+kFzwPEV61qpQw3x1YnbrGQ=
X-Gm-Gg: AYBFou2uNMd9dd4Sh7v1bEfIjqAR9NNTyptPqWL0Jao5Wn+/0praWAvDjsPzPqenIhP
	DrhnuFZd1OGhdFdR6l1dBjAo4R+fuBqXxGjOrTcHvHxME0j1AEtit2PR2AaiEbA2OwSEepOr8XZ
	WhT3X49uWwXWuXHCWJ4Z7EyjppwwifVNNJUhVeNyk7DA5bUyTZ39dGtma0Ss1S0GVxxJjcKeHpg
	xtrN+r+NMcbusZ5zTBOM/cYaSSxiFAQNln7t4g/vxTB5BGHuN7j0fnl2JtjsvByIgOtcFuouB4W
	8RLWohz1MoyrbDLA9bEPp5HHzHOI9WqVijn4ZNPlIWiwxkVDZgMDtDVvuUOJNfoVHc0CAcioby5
	ReTtRPQEza93RIw==
X-Received: by 2002:a05:600c:19d2:b0:49c:fa21:1c8b with SMTP id
 5b1f17b1804b1-49e7a69c84dmr7218505e9.32.1789359000887; Sun, 13 Sep 2026
 21:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
 <20260912024225.2872265-2-kunwu.chan@gmail.com> <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
In-Reply-To: <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 14 Sep 2026 12:09:49 +0800
X-Gm-Features: AcwNN1XWLLaBfaxSIDxW2V2ijIMl_XRWS1t07_7EbkNNIYKP6enYpyX1l6ij_8I
Message-ID: <CAN_Opa-Rr=R1JfuPb+o=DQTHjQEp_0ceKUU=qSPkJbw6HMcnTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath
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

On Sun, Sep 13, 2026 at 5:48=E2=80=AFPM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> Hi,
>
> This is more of a knee-jerk reaction, but
>
> On Sat, 12 Sep 2026 10:42:24 +0800, Kunwu Chan wrote:
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
> > increment, with the smp_mb() of __srcu_read_lock() following the
> > increment.  P2 models an observer that sees the reader's increment
> > before seeing the anchor.
> >
> > The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> > SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> > which permits this outcome.
> >
> > Tested with herd7 7.58 using linux-kernel.cfg.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-ancho=
r-before-scan.litmus
> >
> > diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-befor=
e-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before=
-scan.litmus
> > new file mode 100644
> > index 000000000000..efa9c0c4e047
> > --- /dev/null
> > +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.=
litmus
> > @@ -0,0 +1,57 @@
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
> > + * increment, with the smp_mb() of __srcu_read_lock() following the
> > + * increment.  P2 models an observer that sees the reader's increment
> > + * before seeing the anchor.
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
> > +P1(int *ctr)
> > +{
> > +     WRITE_ONCE(*ctr, 1);
> > +     smp_mb();
> > +}
>
> As P1() has a single memory access, this smp_mb() can't have any
> effect on the outcome.
>
> The one you see in "__srcu_read_lock() following the increment" is
> there for other ordering requirements, I guess.
>
> Ditto smp_mb() in P1() of 2/2.

Hi Akira,

Good catch =E2=80=94 P1's smp_mb() is indeed vacuous as written.  I'll add =
a
critical-section access after it to match __srcu_read_lock()'s
semantics.  The verdicts don't change, but the barrier now has
something to order.

Will include the fix in v3.

Thanks,
KunWu

>
> Thanks, Akira
>
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
> > --
> > 2.43.0
