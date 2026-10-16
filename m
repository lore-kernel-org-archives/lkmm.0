Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E03F44D7
	for <lkmm@lists.linux.dev>; Fri, 16 Oct 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139077; cv=pass; b=riQLf8bF4FgM6rTuSvHJwr7SkRLzuhCwoY1WKQTKu46thcJZsdn/aUUyLXi/+jwn4mQS92bWOpmvYOG5DaOmuoDkrTnmz2BTDHCS9WawjhOtgLJp2Qzl7FdhEcc2/KXvxLzoIA+eDVUD4wR6IEIPcUiN9Pye3pXw3HA2I+fX27M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139077; c=relaxed/simple;
	bh=zFZtjuMJCKAH5rWRVMQCBJBw5Fu75jP8ohWlhoXBSfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWtKVhV2WAmEpLuD07bSHmeY9KKeLv2wkcVYuPId4zfl/zdKf2UwS9CMoXr5P8wHcCV0+25XHvwYwD8XB0+M76+SnAs/LjwMQsVoTCUYSrVUWqTjn7Z7YQpgKaeHRipbooJ0WXj5geY3GMaQDt+6wzjbMUKm5r3pPxEDKao2SXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIb5FV93; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIb5FV93"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso13312315e9.1
        for <lkmm@lists.linux.dev>; Fri, 16 Oct 2026 01:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792139074; cv=none;
        d=google.com; s=arc-20260327;
        b=EfExraiPkAV61zr5wEZphJ8PGzujMCg/0ukK3lJHsqkQk/yarTbFHy66YwNNagE07u
         YE7q4NAfu2JG+f6EaQWJ/bZGq9YNlhI/eMyNJATL6rMlzhwuRLcc0D1RW4mF6XR/W4Su
         8+DJHhabMNtpsiycY3w6w9LJcbT+dyBPFDbT3RUa2Ndy67BTCNIIJecrBo9ccstOcByY
         YeDfJ1m6Va0B5rbtX5+k2rOAUE43o6ehkri+gdH/UcSFDngl/WSRnPqCfHe/tT8HVyGT
         l4nbx11ruK0Nex1KaFcrVOGxcM5oQhQQRKOhoUsMTUOhNdmb9wr+Ec65X1Zj0I76xCTH
         Zebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8gxo2ExdAcC67lQx6KTJbVCAq98YK23bGoiwCanXEA=;
        fh=rVX3xHpaWSOnNjQJUpoMCLTE/MzEmCrAJAD5+KvN4GU=;
        b=q6q2KTut3SR6ABghiqBBkh4ETp+TYM6No3cNV+Amk9hKXQNljEQDKfpDf8T/JUzk2L
         wHqlkJbHcciRyWOVvAD4YUB+QgfBt4bKD6vVa1t/Qpr/i/zTu8d2ewyBvUcMkEaB9EGG
         jZtsJMo3LFrT5+T5QkJQkLaB3cp3yCMIYSZAtedoO/tggTioQ3/UqPf6lGWrzsXKt0ZQ
         cEkCGDledIjZXCf5UtBLXEmdgCe29X/Hw/s3bSDYHS42TS6KjtnVkKZ7B1HcmaFHYA9A
         HvIquk6AebFTgBrP/9rWrfNFEcuBFEr9W4Uxr+vXv50d54lbZypTjXC/tXFZ33wtFOGl
         BvhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139074; x=1792743874; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8gxo2ExdAcC67lQx6KTJbVCAq98YK23bGoiwCanXEA=;
        b=BIb5FV93anlXNgemmEQIwgulNSBKRmITkQ2+mYH1UWYQK2st6DZF3j2ipHLE8JMZY8
         hqgMN4v/iL4ShIwJrYl0k2cLPZh1NTfulewOwDcRBrzyrE8pSMJWQFVAljrLAeTnoS8p
         x0ZZQRWIWSPbEnRN24p6d6pfjv7Y0RBNwd/l6sRKN21QGOpyERHbjJhTwYn/IZ7kbjJj
         QmcG6TCAwU+B5iC9CJMNkD8KwV3J3xVE4iPj54RC7lXDS45b6QElmttTWtlCQt4SnGdN
         XLFdKsfZObNSlxBjnAEKCxB6HG7WyWBtHSplD/m3Cmd6NCzG8cj7Qc6zU5mK7McuoRX5
         9lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139074; x=1792743874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8gxo2ExdAcC67lQx6KTJbVCAq98YK23bGoiwCanXEA=;
        b=0ThK7Poo8JdoRHJB6Bhaz43yiHQXVUSbiCFuH9f/OjN6ErHPiGXZnzdMBLNXDMJnP9
         ctB8TFKrRbhEefBK/HwxMK0++S5Nx4l6ES46YLG6qWKAR+yxSjaWAVApTLj7OUTBVLfq
         gpdxYYk0khyy25Sw2g20+fVdv6ZcvzKDs+5HIa7oCNb1xJpzvFuIOClvmF0noQOapnPL
         dHp28vIjhhQ9P1XfV38jAtJ7NPWfvayVhgXqcSNeoEGfdElOKZkEIMaj+PwBXfbRsv4U
         Iisx0vGYGjd6FJXE7TkUuHArFjOxmMsuzljwM3btbETtYhvIdXPpHafyN06/Qve8862f
         yAJw==
X-Forwarded-Encrypted: i=1; AKwUvBw5MN4KPRzK+91sk7A+A1JFd3Z3yDck1x/kyCk98kNpNhEZX/4MAAHn7cTrXqczodWZXNh7@lists.linux.dev
X-Gm-Message-State: AFq9FYKXN5tMXXTxvr82D7U27DYaRdm/7tZFMkzAb4Gey44YBMB89ZOT
	fx92n8M5Uy4RhS+YHzBDl7XlxQZfhs1mUaji1klaWt4XzJQ4EHB+/QFdTLnlYRdoKUb/rpphSpK
	5mPK2hl5QQqZWzBsqOjR0Q3C87Hyzl94=
X-Gm-Gg: AYBFou2IpwzqTear+Dkn1fLY8FGYsT8Y92r2udM03bt7QjLvufJ12QY07EaD6ITVzXo
	sbEZgfRyTl1GKAWRVKE4XUZCJS9eToE+GMpUjnsWPo69dK3Vo8ghJSGyEuFOAC9f0swJ2BrHcgZ
	iRMf3jkJI1ksgXdqnM3rB/9Od18W9PKUIg4nFcbrtv977lW3txxXie+4f5+P1/zGWsCbPI2Z+sW
	S4d0dDI0xuAhew8eTfEd0oqshifhs2wYeKux3OqKxbw3MGqlc2JDFzfeBPC5ClpaWE6NwUbC3EI
	DG4/jm7ZG36ShWDn98QyZMcK4SU031+oWYPT6fXJkl2x5JyBeHkwQ0et
X-Received: by 2002:a05:600d:82c1:b0:4a1:6a10:4dc8 with SMTP id
 5b1f17b1804b1-4a1bd175fa1mr146577265e9.28.1792139073577; Fri, 16 Oct 2026
 01:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011194902.97364-1-mathieu.desnoyers@efficios.com> <20261011194902.97364-2-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261011194902.97364-2-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 16 Oct 2026 16:24:21 +0800
X-Gm-Features: AclHuK_PTuneKkOgmgJaVDS6GjsvRFKMkj_6VcBtfZcfMgJ14F3yG1rp3naG8VE
Message-ID: <CAN_Opa-zH=+By+Qrsrg3W0prQPNv17xCCh_n0CzfimUB9__obA@mail.gmail.com>
Subject: Re: [PATCH hazptr v3 1/4] hazptr: Fix two-phase hazptr_synchronize
 race with detach
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Bradley Morgan <brads@mainlining.org>, Gary Guo <gary@garyguo.net>, 
	rcu@vger.kernel.org, lkmm@lists.linux.dev, Lian Wang <lianux.mm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Scanning all per-CPU slots before the overflow lists
addresses the race where a backup slot can be moved to
a list that has already been scanned.

Using a separate overflow-list phase also decouples list
selection from the wildcard phase.


Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu

On Mon, Oct 12, 2026 at 3:49=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Boqun Feng pointed out that a detach happening concurrently with
> hazptr_synchronize can miss a slot. Indeed, scanning the per-CPU
> slots needs to be done *before* scanning the overflow lists. Fix the
> implementation accordingly.
>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reported-by: Boqun Feng <boqun@kernel.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Bradley Morgan <brads@mainlining.org>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: <rcu@vger.kernel.org>
> Cc: <lkmm@lists.linux.dev>
> Cc: Lian Wang <lianux.mm@gmail.com>
> Cc: Kunwu Chan <kunwu.chan@gmail.com>
> ---
> Changes since v0:
> - Load the new overflow list phase word in "hazptr_chain_backup_slot".
> - Rename the lock to hazptr_phase_lock to make it clear that it
>   protects both the wildcard and the overflow list phases.
> ---
>  kernel/hazptr.c | 50 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/hazptr.c b/kernel/hazptr.c
> index d3d1050d92cf..13faa5ba7677 100644
> --- a/kernel/hazptr.c
> +++ b/kernel/hazptr.c
> @@ -13,6 +13,8 @@
>  #include <linux/list.h>
>  #include <linux/export.h>
>
> +static DEFINE_MUTEX(hazptr_phase_lock);        /* Protect the wildcard a=
nd list phase flip. */
> +
>  /*
>   * The current hazard pointer wildcard. Flips between 1UL and 2UL to gua=
rantee
>   * hazptr_synchronize forward progress even with a steady stream of read=
ers.
> @@ -20,10 +22,12 @@
>   * This also affects the overflow list selection: the current list used =
by
>   * readers is array[(unsigned long) hazptr_wildcard - 1].
>   */
> -static DEFINE_MUTEX(hazptr_wildcard_lock);     /* Protect the wildcard f=
lip. */
>  void *hazptr_wildcard =3D (void *) 1UL;
>  EXPORT_SYMBOL_GPL(hazptr_wildcard);
>
> +/* The current overflow list phase. */
> +static unsigned int hazptr_overflow_list_phase;
> +
>  struct hazptr_overflow_list {
>         raw_spinlock_t lock;            /* Lock protecting overflow list =
and list generation. */
>         struct hlist_head head;         /* Overflow list head. */
> @@ -53,6 +57,12 @@ void *flip_wildcard(void *wildcard)
>         return ((unsigned long) wildcard =3D=3D 1UL) ? (void *) 2UL : (vo=
id *) 1UL;
>  }
>
> +static
> +unsigned int flip_list_phase(unsigned int phase)
> +{
> +       return 1 - phase;
> +}
> +
>  static
>  bool is_wildcard(void *addr)
>  {
> @@ -178,15 +188,12 @@ void hazptr_synchronize_cpu_slots(int cpu, void *ad=
dr, void *scan_wildcard)
>  }
>
>  static
> -void hazptr_scan_period(void *addr, void *scan_wildcard)
> +void hazptr_scan_cpu_slots_period(void *addr, void *scan_wildcard)
>  {
> -       unsigned int scan_idx =3D (unsigned long) scan_wildcard - 1;
>         int cpu;
>
>         /* Scan all CPUs slots. */
>         for_each_possible_cpu(cpu) {
> -               struct hazptr_overflow_list_flip *overflow_list_flip =3D =
per_cpu_ptr(&percpu_overflow_list_flip, cpu);
> -
>                 /*
>                  * Scan CPU slots.
>                  * Forward progress against recurring wildcards is guaran=
teed
> @@ -199,6 +206,17 @@ void hazptr_scan_period(void *addr, void *scan_wildc=
ard)
>                  * to acquire that same hazard pointer value.
>                  */
>                 hazptr_synchronize_cpu_slots(cpu, addr, scan_wildcard);
> +       }
> +}
> +
> +static
> +void hazptr_scan_overflow_list_period(void *addr, unsigned int scan_idx)
> +{
> +       int cpu;
> +
> +       /* Scan all CPUs overflow lists. */
> +       for_each_possible_cpu(cpu) {
> +               struct hazptr_overflow_list_flip *overflow_list_flip =3D =
per_cpu_ptr(&percpu_overflow_list_flip, cpu);
>
>                 /*
>                  * Scan backup slots in percpu overflow lists.
> @@ -218,6 +236,7 @@ void hazptr_scan_period(void *addr, void *scan_wildca=
rd)
>   */
>  void hazptr_synchronize(void *addr)
>  {
> +       unsigned int scan_list_phase;
>         void *scan_wildcard;
>
>         /*
> @@ -235,18 +254,29 @@ void hazptr_synchronize(void *addr)
>         /* Memory ordering: Store A before Load B. */
>         smp_mb();
>
> -       guard(mutex)(&hazptr_wildcard_lock);
> +       guard(mutex)(&hazptr_phase_lock);
> +
> +       /* Scan per-CPU slots. */
>         scan_wildcard =3D flip_wildcard(hazptr_wildcard);
> -       hazptr_scan_period(addr, scan_wildcard);
> -       WRITE_ONCE(hazptr_wildcard, scan_wildcard);     /* Flip the curre=
nt wildcard. */
> -       hazptr_scan_period(addr, flip_wildcard(scan_wildcard));
> +       hazptr_scan_cpu_slots_period(addr, scan_wildcard);
> +       WRITE_ONCE(hazptr_wildcard, scan_wildcard);                     /=
* Flip the current wildcard. */
> +       hazptr_scan_cpu_slots_period(addr, flip_wildcard(scan_wildcard));
> +
> +       /*
> +        * Scan overflow lists *after* scanning per-CPU slots. See
> +        * hazptr_promote_to_backup_slot() for scan ordering requirement.
> +        */
> +       scan_list_phase =3D flip_list_phase(hazptr_overflow_list_phase);
> +       hazptr_scan_overflow_list_period(addr, scan_list_phase);
> +       WRITE_ONCE(hazptr_overflow_list_phase, scan_list_phase);        /=
* Flip the current list phase. */
> +       hazptr_scan_overflow_list_period(addr, flip_list_phase(scan_list_=
phase));
>  }
>  EXPORT_SYMBOL_GPL(hazptr_synchronize);
>
>  struct hazptr_slot *hazptr_chain_backup_slot(struct hazptr_ctx *ctx)
>  {
>         struct hazptr_overflow_list_flip *overflow_list_flip =3D this_cpu=
_ptr(&percpu_overflow_list_flip);
> -       unsigned int list_idx =3D (unsigned long) READ_ONCE(hazptr_wildca=
rd) - 1;
> +       unsigned int list_idx =3D READ_ONCE(hazptr_overflow_list_phase);
>         struct hazptr_overflow_list *overflow_list =3D &overflow_list_fli=
p->array[list_idx];
>         struct hazptr_slot *slot =3D &ctx->backup_slot.slot;
>
> --
> 2.43.0
>
