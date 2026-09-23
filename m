Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1834389C
	for <lkmm@lists.linux.dev>; Wed, 23 Sep 2026 04:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136936; cv=pass; b=ll0cySErHOKjrukYclv6goqvVimOcOisnUXbp4JbXuY/I9m5Y+dhvtjzLz4p0UCNfwR36KQ/0WPJEakwSUeglAqHfodobX7kgn2HICQs8AChG5DzVa741GDNZW+y+KKQobFFrXOtPRgT/t9f8O6mNMPbxd4J4nzgbXtwDv7IuDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136936; c=relaxed/simple;
	bh=oUewmwn77TqWmsD8jxMMcsLsXwJkucdFvCNJu5PgVaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtHInkcVYBh43Ib+Y+5WNdPxSBYEuRtrvnbYzjoxI6IPZ2mxGJhJn7NMhbS7zq14k92BGh7FQDEeFUza5QPkkrHD6vK3JpB2cR/8wgFkzlHSGsqPKASeOWQqsLsEjxbda0xbbI+7R5BTulwyWG+kQ/ZNT9bK71Ip05RPYtdLgkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muiXKYir; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muiXKYir"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so3650075e9.3
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 21:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790136933; cv=none;
        d=google.com; s=arc-20260327;
        b=HEUy/8UpbEYyGaoAkXZmf1wQpSgd0fXGQiQvRVhfTi1XqRNsEVi+xBuaPLFy0iUebv
         U/46E6bJBfia7rb9DkCn6jdauYCCKIuMqUCkH9ZYJFkMnyuwXJ/lySlsejXjohqxLfXW
         KvbEcCHx1f8cgLojmTBwXZqURgE+/b1WgT0xWO6e2pUVKevppygIcozktgrQcMhDLK8T
         ivbEMDJiy4yulcyv2pXe9XX3PXEt0OI31uA3R2z7b3ylaqOawZKSIK9ZoVBypI1cqOII
         j/kTSA/cZOf5/cvBu1GZ7Eq3bnMoe7yTanGeN4uWuD7rQZVOq2IdMsX2xkrmRsFHtQqh
         J2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        fh=W4chmSFcvWSx6GxCF47ZRnQan+bQ29ZXeUAex75i9oQ=;
        b=heW+MEq9n+xmJnF3mneLFcKH8bk4thdJEzA+vsKjLoFNdi66adWLDidGs+8sXHUxZ7
         NJ/Wa34Du0tqNzvKzt8hR6HUGyC5Gv9FMw5ckMKPtkdqVnjIekmn3RrDh9AivwcWcUw7
         FIW5Sd+WlqtJWwYhP4gwhKomhffwje9cLEkXxubfvbh6q6D7EuBgHbBAZ9ZPRMH83rd7
         27tUDY+R/aPMkVvhDfmlOMmPKfG7cE+q5AYW9+dMdwHV4bK7PXJKn8lyeExrgyB6DCXN
         ry8uaKsozRwhMU0jSttT+1X8cEXxpWoyLcA8iL/Zsr+Jz26k+2IVnHLRFmZOdka/fiR0
         9YEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136933; x=1790741733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        b=muiXKYirNON0pVcWtGA3BTRjiyiMkGuTG1cZFG4qHsURBc610Ab6SEZIib6VBZ1tRM
         TzG7JVW2x6wTFYeGJXoA9aYkJIerPT5QRA3jV4JZcGOCT8zSc1669zL5VNILl/yfjN9Z
         UgJ34R+tBWMp3hxDWAmFfIxcw1zg22DqG6foBWcFg/1GCtv+D5CVs69+R+6D85Z47XbG
         aHA34kD3G86P9YN0RlCzt0+SobWtK8cZKg5bXdMZjyyraiIA/PCwHpyCjj0ewqdtv/cy
         iOcyfz8cL4W/fK7vw4p5v9YPsUyCD+5f1rXkwJ05KYrZE+uTkytNFG89zYZADwAKkx/5
         frGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136933; x=1790741733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i36f7xtnWKpVJBn7KVPs9Rgrmv9naoWJLljKyz9tnJM=;
        b=LOYnCvmFwfNfwVReghF3JWfFa2T12UAjLlXCepd04SCBIGbIUaAhxqLsaswQLh+wYC
         3/vIMvNMWqQ0/jc55Hv72mtTeGpK0XlvW+8s9V93xCO0XwNA3vlsbIEvhXm/jcYLimeP
         gUQgscD9MLswbGg4u1B+5UaV4EbcHe6ttzkb2VlbAR5tPLbRRtFC4uj7g/4VB1NrXBMa
         Nsvaz8aaC5EUUm1+7ry0BoGGncsDAlOOlQUaANbCHgFkZi1/bi9jH1BA0/8+x3pBy7lu
         oqudZICGYTAQKhtHoTT1g3MeCnCh3ccsV9J1l2G9xaPT4d/2KTRGwbWQHjephoTeXM72
         j/4A==
X-Forwarded-Encrypted: i=1; AKwUvBxPxAkAVMTOZivjN3Z9WJjuRkG4V8vwpzBOU9R8tF89MS2kjZ5oeblaTPB2W0AEl5Et8c1R@lists.linux.dev
X-Gm-Message-State: AFuF++nkZj1pBtz2frcxBd0r37bWz72hjcSKIqQ7p4j62enxcBGB80nV
	/ZZJR1k5JI9GFbUDFqJvbucaqfsgjI2xPZQR2f0sGHJfbvC26Bt8z4jkRvFHM1OK0NmWFUxW0Va
	icIklAB/FHjmt3PpSRe0v9D8dGSqWtKM=
X-Gm-Gg: AYBFou0e6NzH3simKGUQv4LaN7GdgpbRpQum6b97id7/q3MzOAAKd5VPVLVQOWAxbf9
	Cns60OmVxiY53ODwc7jDQt1ZsT1k+3Ui8PB7DvZdVZ+DFDqsh8Knzb62dSaS/B+rctU5fSrlglB
	XbMDYewsoe6JlI6h/CRmp9aKIiz7coxJphz4NgNRhNQRoWLMPbJuWy1sBw7XX7SL11h2KuXAQtF
	ulDnxkJ3Ysmo/HYDi4AJ04gGbQQaTkTMK483vi5QuGdOfjO4l9b5746ej5N5LCTjA5babdChQ0H
	gbHoguU1Avy366auDdHZY49wAdtrRwhnqTy2N10L+n4pHDoj40bPTe02RftrQGEbsKVZ42BkPba
	jLiXyKw7Zur+c9A==
X-Received: by 2002:a05:600c:46cf:b0:49d:797:8488 with SMTP id
 5b1f17b1804b1-49fdeff7112mr14786765e9.1.1790136932220; Tue, 22 Sep 2026
 21:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
 <20260922070950.4173245-3-kunwu.chan@gmail.com> <arJBpQyOQf3AJ4cA@MacBook-0RXW5>
In-Reply-To: <arJBpQyOQf3AJ4cA@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 23 Sep 2026 12:15:21 +0800
X-Gm-Features: AclHuK_nckJ12y6T2Aoov6rc7a6r-smUS_AxTu-iCekyh8CIGeC66Dch7H_GWTo
Message-ID: <CAN_Opa9fyOApv8u-WxcdHDgYDLkOkv4tKLacGsuHgnz7GdNVTQ@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 2/4] locking/lockdep: use hazptr to wait for
 dynamic key lookups
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

On Tue, Sep 22, 2026 at 4:51=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:48PM +0800, Kunwu Chan wrote:
> > lockdep_unregister_key() waits for is_dynamic_key() callers with
> > synchronize_rcu_expedited(), which sends IPIs to every online CPU.
> > Have is_dynamic_key() mark the hash bucket with a hazard pointer
> > and use hazptr_synchronize() to wait specifically for those
> > traversals.
> >
> > The hash bucket address from keyhashentry() is stable, making it a
> > suitable hazptr synchronize target.  The rest of the key hashlist
> > lifetime (hlist_del_rcu/call_rcu) remains RCU-based.
> >
> > This adapts the lockdep use case from Boqun Feng's hazard-pointer
> > series to the current hazptr API.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/locking/lockdep.c | 30 ++++++++++++++++++++----------
> >  1 file changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> > index c56a7f91d72e..f67d847f9abf 100644
> > --- a/kernel/locking/lockdep.c
> > +++ b/kernel/locking/lockdep.c
> > @@ -58,6 +58,7 @@
> >  #include <linux/context_tracking.h>
> >  #include <linux/console.h>
> >  #include <linux/kasan.h>
> > +#include <linux/hazptr.h>
> >
> >  #include <asm/sections.h>
> >
> > @@ -1280,14 +1281,24 @@ static bool is_dynamic_key(const struct lock_cl=
ass_key *key)
> >
> >       hash_head =3D keyhashentry(key);
> >
> > -     rcu_read_lock();
> > -     hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
> > -             if (k =3D=3D key) {
> > -                     found =3D true;
> > -                     break;
> > +     /*
> > +      * The traversal is protected by a hazard pointer rather
> > +      * than an RCU read-side critical section.
> > +      */
> > +     {
> > +             struct hazptr_ctx ctx;
> > +             void *bucket =3D hash_head;
> > +             void *addr;
> > +
> > +             addr =3D hazptr_acquire(&ctx, &bucket);
> > +             hlist_for_each_entry_rcu(k, hash_head, hash_entry, 1) {
> > +                     if (k =3D=3D key) {
> > +                             found =3D true;
> > +                             break;
> > +                     }
> >               }
> > +             hazptr_release(&ctx, addr);
>
> This looks good to me. However, we probably want to use scoped_guard()
> here, that means cleanup.h support for hazptr.
>

Thanks for the suggestions. That makes sense.

I'll add a DEFINE_CLASS wrapper for hazptr so is_dynamic_key() can use
scoped_guard().

> The other thing that could be added is a debug option that force we
> skip the fast path, so we always go into the show path in
> hazptr_acquire(). This occurs to me because the slow path here means
> acquiring a lock inside lockdep code, it should work, but I just want to
> be careful. So something like:
>
>         void *hazptr_acquire(..)
>         {
>                 ...
>                 if (IS_ENABLED(CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH) ||
>                     unlikely(slot->addr))
>                         return __hazptr_acquire(ctx, addr_p);
>                 ...
>         }
>
> Thoughts?

Agreed on the slow path. I'll add CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH to
always enter __hazptr_acquire(), and exercise it with lockdep-heavy
workloads under
CONFIG_PROVE_LOCKING.
The existing hazptrtorture module can also cover the forced-slowpath
path for additional
stress, including per-CPU slot contention that can trigger the backup-slot =
lock.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> >       }
> > -     rcu_read_unlock();
> >
> >       return found;
> >  }
> > @@ -6683,11 +6694,10 @@ void lockdep_unregister_key(struct lock_class_k=
ey *key)
> >        *
> >        * Some operations like __qdisc_destroy() will call this in a deb=
ug
> >        * kernel, and the network traffic is disabled while waiting, hen=
ce
> > -      * the delay of the wait matters in debugging cases. Currently us=
e a
> > -      * synchronize_rcu_expedited() to speed up the wait at the cost o=
f
> > -      * system IPIs. TODO: Replace RCU with hazptr for this.
> > +      * the delay of the wait matters in debugging cases. Replace the
> > +      * expedited RCU wait with hazptr_synchronize().
> >        */
> > -     synchronize_rcu_expedited();
> > +     hazptr_synchronize(keyhashentry(key));
> >  }
> >  EXPORT_SYMBOL_GPL(lockdep_unregister_key);
> >
> > --
> > 2.43.0
> >
