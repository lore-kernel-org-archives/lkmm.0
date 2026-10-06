Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F1637B01A
	for <lkmm@lists.linux.dev>; Tue,  6 Oct 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267214; cv=pass; b=te+8TeFmGjQZjepGcUTQWyEhObKpIxVizwdfm1Lo8l/zOHo6B7Qho+TrnWbRiutuFO6VyuyVqBCQEJwmb7cnliSbADKZ+DaNwHf899DJVEM93YWBnBT1dQ/2cy/viatLTLqg8t9D58c9CxiPIOpK8m9gy6WlamHwYKXLbCkTsmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267214; c=relaxed/simple;
	bh=tUmcbY2LGjhuvkOD8Wnif+BGx0U4Ife6GiX/aWsmJ5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAhKNx4ZKG3GCl4I3eb7mUnOFDL0wmDjHwBGr/LUirThMZGjdztngqgdm181xCgvuU+VBqTk9VDvFLe0HWap1x5AunqpUodgjwsHrf5q6i3uReDI1TrIu+8t0UwvMLvVSBz4VHLmliYOFcuu6cBOEXo/t/MMB3TUtpDSeID/35s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLwhGTut; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLwhGTut"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24117265e9.3
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 23:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791267210; cv=none;
        d=google.com; s=arc-20260327;
        b=G3I4hPUNTR/N85F9UnAb+U1DnWFrtbC1RqeUzrTSJKLCHAiQgMSzw01WFPOA+rzOBh
         /qwOqftHB0Eu/9Ddk19mhm15WSk0RTpfWnSVRcJaxr3gAC3CCsOsnGVy6s+vhjgHM0Et
         753nuULfJViS3XDqJ5ei3iwrx/enNx2Xf5DMU0Uq3YFyTv4x+afQ2pBXPJdcJqZ5Z9MR
         41DUvRoHvSPTmIUUS6Jgp9yoy539RmK1mC7l9UC5Qnzx1eRwFSaPddwR5mUcdLxoS4vT
         7gmWa71fiy5idfa+Gm2vuRCAaBwdeltTu41I8kh2Q8QKWlgksi4pDZsAfZAUydyp3dR4
         dvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        fh=hOXZ0JkYZduz42unpYSPchh0y3JDuNpc2BWdMF+trok=;
        b=lTjVY7D15K0YmeFwtcNEQn253S/2LB5X9vomneNo34oZAzwNuXNFL1vMlP0UXfAFSM
         /li7CSqjHmYRpR8HQYTHPsnV9gIyJoNd0uGQ4GWXHt8FYDrTg/jTmYK+LPED48QuSfWn
         /d0HszvFl7D10VOLMJtqsS7zINBC8MPW6W4hZulewalKyZcVgv936B62+Y7RaTO4l0xt
         96DHtivgMAqjVPB5B+v+n8lXkMLwLeGkyqLYrpo1GQu9Q5yiOuCjPoi8Rk71zgJZK4rM
         QMbN4dM2mlkqfu1pZuiylELMmZoZOmsbJjpCLq3UToqT8rVZDxvHtmgjL6OM6x7Wn9LB
         utRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267210; x=1791872010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        b=sLwhGTutIMlZeUszNDreBDS8wOrLEeUb9AN2rJuLq5UqFStp+mBbtKWRw3uhV3GmfK
         rmAlxp8keY1l91S7ut/O6SiOLGbN1nOfxESALRdJya76SiyHNSOZDehL5er1/MyBCzm7
         t+PoZlktyRSR7+OEvqceIufVQlXcHldX1lNAs6EjkG05pdrmpQlrypULXENMIh28IObe
         4C3mecW+BreVy/7YtVgwf0edSbXEuKClCYtr0xVRncxHKR4ni4FWWjfFIV5IiQFvARC8
         lphSkm688PL3M5ZFWYB3ldZoHnUa98VZsI8vgIPe7xJc8s4pE89h13Vis4WLOb6NtXOi
         +Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267210; x=1791872010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDVYF6o0gmAoJIiHellWQW2xAg271OU0hbLK0g0y5g8=;
        b=fpCGJeW/UHzJXzasiQUybdluvT7DoMdkNtd6ahhq2AgNHA4bGv7XEXNBUJtrhcuJss
         iloKA6pCRgcIoBaPO9fctK+Zh+c+OtBAq1+v5CWzd6HfAYIP4NxUvTF11ryPlDRH5T6S
         XZM/0VIZqoEJMZ6i7DS6lQRDexTZrRF2f0C1Je7PLNFm1qvhkGgdHDKBjEHSbeolXUR7
         5dRwLPjuKzG9LFLdj/aaih746He6JqABNALzdPu89Au+img39eRDYOq6mML+bH212idT
         9pbSOGDgm/rkTLE2vfvZpan27J1yTGOAhFeTo4NYYwkHyg1tfmLHP2AAlc3kbjMxCx8e
         PgxA==
X-Forwarded-Encrypted: i=1; AKwUvBxYfyTF6FvB0zI+I2hiz7HqKAVXTCIK6z2LM3Alc59VusWEK70gU05jQCmd3+aIX1QdqRwL@lists.linux.dev
X-Gm-Message-State: AFuF++mU8tPK8T4CZNzY8qHhA4tSssOtOzjNyZ1arRtnPJqlg6vSsUaJ
	QpO6evHp7CHDDGPa14BrtsN71+yvPIBD7Nz9SxbUfuQoP58rM8ryfIz7wvtsLh0Dcnr/Wwwbm9Q
	TuoHcjmrgAK0KGEuEO/x7pv2MZcJq7TU=
X-Gm-Gg: AYBFou3sFRZlsJ+wXPyYCTenhlk+NpKEukQtQnwWpVHMb/y4MFI69/7cH6uG+EfqGa1
	LDfU06aUeisCZBgJ98WXu6T6BiDlI6ghldjh/lUryn5hh/U/AgB7oM40GDbooQnVLyOpBwlhRul
	113sJ8XtnUEFQnKAA2/Z9ZHzrIaVrZx/wc2IB/Ex7MKO85n484EDTGzE+Mes9GDiOdw8aiCJjZC
	jUjLC8IYV7o2y1APs+LpDiWdcrz+OdwWRZwiacyFzOjxxFu60q29QdkcZjFaYrsh3r5cJJUCkiY
	3c6cS5Xhb0eRy8La22v7jsAPjQq+tThMIgBV78BPpofnAMwiUkULQgjnf2X8mxhUTxi+
X-Received: by 2002:a05:600c:3ba0:b0:4a0:236c:8601 with SMTP id
 5b1f17b1804b1-4a17b4b6c82mr7463485e9.0.1791267208960; Mon, 05 Oct 2026
 23:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-3-kunwu.chan@gmail.com> <bedc399a-151c-42e5-b33e-d78221702fa5@efficios.com>
In-Reply-To: <bedc399a-151c-42e5-b33e-d78221702fa5@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 6 Oct 2026 14:13:15 +0800
X-Gm-Features: AclHuK_ppGKVx44qdjA5Rxwn4Zvoh7x1d62IrHMgogUx403i6VttKqXBF_sphJI
Message-ID: <CAN_Opa-ngHYkvssm1dqdUUsOoECES5eGtCTyfKJ0Qsyx-sB5KQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 02/15] hazptr: use Bloom filter for shared scan waiters
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	boqun@kernel.org, npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 1:51=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-05 13:15, Kunwu Chan wrote:
> > Replace the per-waiter exact-match scan with a shared Bloom filter
> > built during the second drain pass: each observed non-wildcard
> > address sets three bits, so a waiter whose address hashes to an
> > unset bit can be completed without another slot walk.
> >
> > A Bloom filter has no false negatives, so an address absent from
> > the final drain scan cannot be held by an observed slot; false
> > positives only delay completion to a later scan cycle.
> >
> > The filter uses a one-page bitmap with three multiply-shift hash
> > functions.  It lives in the hazptr_scan_state and is only touched
> > by the scan kthread, so waiter state remains on the caller's stack
> > and no dynamic allocation is needed.
> >
> > Suggested-by: Boqun Feng <boqun@kernel.org>
>
> I actually suggested that to Boqun in the first place. Feel
> free to add my suggested-by tag as well. :)
>

Thanks, Mathieu. I wasn't aware that you originally suggested the Bloom
filter idea to Boqun. I'll add your Suggested-by tag.

> Did you run your Bloom filter in a test program on the side to
> see how it behaves with pointers, and confirm that the false
> positive rate is not too high due to hashing algorithm/constants
> concerns ?
>

I haven't run a standalone Bloom filter test yet. I'll test the actual
hash functions
and constants from the patch with pointer-like and aligned address
distributions,
and measure the false-positive rate for representative numbers of
observed addresses.

The in-kernel tests currently pass, including hazptr.sh and rcuscale,
but I agree that
these don't directly characterize the Bloom filter's false-positive rate.
I'll add the standalone test results to the next version.

Thanks,
Kunwu

> Thanks!
>
> Mathieu
>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >   kernel/hazptr.c | 93 +++++++++++++++++++++++++++++++++++++++++++-----=
-
> >   1 file changed, 83 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/hazptr.c b/kernel/hazptr.c
> > index 9e274a691af5..900ba35de2cb 100644
> > --- a/kernel/hazptr.c
> > +++ b/kernel/hazptr.c
> > @@ -7,6 +7,7 @@
> >    */
> >
> >   #include <linux/hazptr.h>
> > +#include <linux/bitops.h>
> >   #include <linux/percpu.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/mutex.h>
> > @@ -16,6 +17,7 @@
> >   #include <linux/kthread.h>
> >   #include <linux/swait.h>
> >   #include <linux/sched.h>
> > +#include <linux/bitmap.h>
> >
> >   /*
> >    * The current hazard pointer wildcard. Flips between 1UL and 2UL to =
guarantee
> > @@ -213,6 +215,55 @@ void hazptr_scan_period(void *addr, void *scan_wil=
dcard)
> >       }
> >   }
> >
> > +/* Number of hash functions for the Bloom filter. */
> > +#define HAZPTR_BLOOM_HASHES 3
> > +
> > +/* Number of bits in the Bloom filter bitmap: one page. */
> > +#define HAZPTR_BLOOM_NBITS (PAGE_SIZE * 8)
> > +
> > +struct hazptr_bloom {
> > +     unsigned long map[PAGE_SIZE / sizeof(unsigned long)];
> > +};
> > +
> > +/*
> > + * Multiply @addr by a per-hash odd constant and use the high bits
> > + * as the Bloom filter index.
> > + */
> > +static unsigned long hazptr_bloom_hash(void *addr, unsigned int i)
> > +{
> > +     static const u64 mult[HAZPTR_BLOOM_HASHES] =3D {
> > +             0x9E3779B97F4A7C15ULL,
> > +             0xC2B2AE3D27D4EB4FULL,
> > +             0x165667B19E3779F9ULL,
> > +     };
> > +     u64 hash =3D (u64)(unsigned long)addr * mult[i];
> > +
> > +     return hash >> (64 - ilog2(HAZPTR_BLOOM_NBITS));
> > +}
> > +
> > +static void hazptr_bloom_reset(struct hazptr_bloom *bloom)
> > +{
> > +     bitmap_zero(bloom->map, HAZPTR_BLOOM_NBITS);
> > +}
> > +
> > +static void hazptr_bloom_add(struct hazptr_bloom *bloom, void *addr)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> > +             __set_bit(hazptr_bloom_hash(addr, i), bloom->map);
> > +}
> > +
> > +static bool hazptr_bloom_contains(const struct hazptr_bloom *bloom, vo=
id *addr)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < HAZPTR_BLOOM_HASHES; i++)
> > +             if (!test_bit(hazptr_bloom_hash(addr, i), bloom->map))
> > +                     return false;
> > +     return true;
> > +}
> > +
> >   struct hazptr_waiter {
> >       struct list_head node;
> >       void *addr;
> > @@ -226,17 +277,26 @@ struct hazptr_scan_state {
> >       struct mutex lock;
> >       struct list_head pending;
> >       struct list_head scanning;      /* kthread only */
> > +     struct hazptr_bloom bloom;      /* kthread only */
> >   };
> >   static struct hazptr_scan_state hazptr_scan;
> >
> >   /*
> > - * Check per-CPU slots before overflow-list slots to match the
> > - * acquisition ordering of promoted slots.
> > + * Walk all slots and return true if @watch is present.  If @bloom
> > + * is non-NULL, record observed non-wildcard addresses in it.
> > + *
> > + * Per-CPU slots are examined before overflow-list slots on each CPU
> > + * to preserve the acquisition ordering required by the promote path:
> > + * synchronize must observe the per-CPU slot release before the
> > + * overflow-list entry can be missed.
> >    */
> > -static bool hazptr_value_present(void *val)
> > +static bool hazptr_scan_walk(void *watch, struct hazptr_bloom *bloom)
> >   {
> >       int cpu;
> >
> > +     if (bloom)
> > +             hazptr_bloom_reset(bloom);
> > +
> >       for_each_possible_cpu(cpu) {
> >               struct hazptr_percpu_slots *percpu_slots =3D per_cpu_ptr(=
&hazptr_percpu_slots, cpu);
> >               struct hazptr_overflow_list_flip *overflow_list_flip =3D =
per_cpu_ptr(&percpu_overflow_list_flip, cpu);
> > @@ -244,10 +304,14 @@ static bool hazptr_value_present(void *val)
> >
> >               for (idx =3D 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
> >                       struct hazptr_slot_item *item =3D &percpu_slots->=
items[idx];
> > +                     void *v;
> >
> >                       /* Pairs with smp_store_release in hazptr_release=
(). */
> > -                     if (smp_load_acquire(&item->slot.addr) =3D=3D val=
)
> > +                     v =3D smp_load_acquire(&item->slot.addr);
> > +                     if (v =3D=3D watch)
> >                               return true;
> > +                     if (bloom && v && !is_wildcard(v))
> > +                             hazptr_bloom_add(bloom, v);
> >               }
> >               for (int i =3D 0; i < 2; i++) {
> >                       struct hazptr_overflow_list *list =3D &overflow_l=
ist_flip->array[i];
> > @@ -256,11 +320,16 @@ static bool hazptr_value_present(void *val)
> >
> >                       raw_spin_lock_irqsave(&list->lock, flags);
> >                       hlist_for_each_entry(b, &list->head, overflow_nod=
e) {
> > +                             void *v;
> > +
> >                               /* Pairs with smp_store_release in hazptr=
_release(). */
> > -                             if (smp_load_acquire(&b->slot.addr) =3D=
=3D val) {
> > +                             v =3D smp_load_acquire(&b->slot.addr);
> > +                             if (v =3D=3D watch) {
> >                                       raw_spin_unlock_irqrestore(&list-=
>lock, flags);
> >                                       return true;
> >                               }
> > +                             if (bloom && v && !is_wildcard(v))
> > +                                     hazptr_bloom_add(bloom, v);
> >                       }
> >                       raw_spin_unlock_irqrestore(&list->lock, flags);
> >               }
> > @@ -276,7 +345,7 @@ static bool hazptr_value_present(void *val)
> >    */
> >   static void hazptr_drain_wildcard(void *wc)
> >   {
> > -     while (hazptr_value_present(wc))
> > +     while (hazptr_scan_walk(wc, NULL))
> >               cond_resched();
> >   }
> >
> > @@ -309,12 +378,16 @@ static void hazptr_scan_do_cycle(void)
> >       WRITE_ONCE(hazptr_wildcard, scan_wildcard);
> >       old_wildcard =3D flip_wildcard(scan_wildcard);
> >
> > -     /* Pass 2: drain the old wildcard. */
> > -     hazptr_drain_wildcard(old_wildcard);
> > +     /*
> > +      * Pass 2: drain the old wildcard while collecting observed
> > +      * addresses into the Bloom filter.
> > +      */
> > +     while (hazptr_scan_walk(old_wildcard, &hazptr_scan.bloom))
> > +             cond_resched();
> >
> > -     /* Complete waiters whose address is no longer held by any slot. =
*/
> > +     /* Complete waiters whose address is not in the filter. */
> >       list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
> > -             if (!hazptr_value_present(w->addr))
> > +             if (!hazptr_bloom_contains(&hazptr_scan.bloom, w->addr))
> >                       list_move(&w->node, &done);
> >       }
> >
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
