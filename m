Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499284;
	b=rCOspfoO4P1dzhosWr46R6zetHCZz0I4WAW+5n6Nf+L5rykA62FZVHx/Rvf7Cr3GF1t3
	 gG/JohuWeVtWBccINmFTKs5p4mvr+7Vt4gZ/frWUBhF0+VbaABuIOEt8IrUjGxxJy9wG1
	 ULWZf4YfKaCLAf9wDSOaXF3w4CjsFNJyouyQZYyqmKPDtjDHQ105Vz5+6DbtRPVdeaUKJ
	 1Sr/4LRWP+BbQWc9qk3v5Wmn1qjde/rM9jarxDagV6ihIzP+R4S2aIbZypK102dc1bDet
	 H4i1EiJuXXkRk/P4HKIXRIWLeSzniRuifiGJqXAe4B/dlhTcz08Qm8K4kYrkCZT6zDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
	b=VO4x/VaYr24HoVHcOakg86tI6it7eBifTEgA0lO0wyhSIh1xElai/eWdmyiXn6YM7HsQ
	 w8pDh/myS8Yg+NvgW+qTkuLvXn0qFIC57DuReOrj7dxQyKw5kO7dG+e5gAvzkEm1LzGyh
	 62lpZr2c+TjBxPfeBn6DG84TDo5tw2ha07G0c6HX/0LwvspZumWqsh129i8AFYNssKuwc
	 x8hDReHOmfNuY0I/xOPKO13qS2jBJuBhBwJafz4OY4k2jn1i2UTLtzaZY+SYzrQTTgwmb
	 602NIijfHs3/VU/iIcH3x3j/fr3PbEuWWzesz8wGupGeg59ljxsWEXguDGJOMjAbP3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOzLk11Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2B606A32D
	for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 16:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC2B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dOzLk11Q
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so55530865e9.0
        for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 08:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499283; cv=none;
        d=google.com; s=arc-20260327;
        b=JL154I4rp0fmkO8yIz+NJ+jj5NeGHF4eOCuLhGPS3tW3L7dieU3SJ09tXXX7RoMupm
         h42L2S4F9dGrfGhquK2m00VD5nh8YMmL7ler0JFbuBmYgrIkt/LIJUQ2tc7Kfd+O+gLe
         v3BovE2grCDu6sd593VSWZQ+3fFIKhS35CHscz/9rGeqtRuqupbf3QCyDB9bDINeY8f9
         tPI/UBBZSMIYm3TcRSimHxjkHtJp7O1q+Wd4yfSCwJBMnSAD6kU+hI4JX3MeDNOfKCWI
         aVntppvUdFBJ6Max0nyJuAAJYdpYdflTKlp5epEStKDIxdgkuG+K7On6gUxRxtYASWqR
         6aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        fh=89lGGlcV4xsRp6BRVBbkN+KSOkWwXiO7UUmX3onuoQ4=;
        b=dtaoz6vV/+lKCnA5ST5sDnCgTqLSjNQ+CqH9O+BGddPsM6lGx1vhiipYNMtpaWuJJj
         OXNQ/fd6y8qfi7yP7MAkrcefhw8nYK+NPu1NgbxTzj9MN4EkqgaV2Zjfi17VkHpVb6hD
         JPnxH/dmIyZZg2mnBr/QMVrIDPMCEorqhOBfPUaXqhk0qAuCRJieIT/rJixqmBMO51IR
         umFv2jQJo1+a2TQicV5la9TKfCtiZVP5FetBcQQs+RGP0Gk4qZX1TCIdXevIx1kolOBA
         76nO8XZ+XNOj9c3oRr/hs+ICCCdQYpZ04rfwqPAtlr68rPeSLytRWwmTURYmouvLXMp3
         0LQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499282; x=1795104082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=dOzLk11Q38SZnzVnZ+XXp9zl4C125KFJtUCRoqICU3UIi7GGQX6xLcd03U0PPoPn2/
         4Gjb1Z0v7eFzTZSS77NCEMyaoCff5WRQDkO4zxGVa4FEOqKhB3iQFOehswMzIRrXmYg4
         SxODTYmekL6Tv7h6Wohb96TXe4QWXv0qocB11zwijl3tlcUsx+wrkC/KXj573sfIJI0m
         VqOFjqUhJuLKmDuruV2MVMUipnCVmr0rt8dMEtWzDDH78cP1vIF3AFsHGTCNS5k+ukTj
         fVs6/OV3YdEN73LYygWe7cKMr7qzMPLXt2T7a6amTOySmqZR2xHjEZoMO71a6enMSG2b
         dr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499282; x=1795104082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=hnDZ4px5wYLcc/joUK5vSwZQ1OJkuAJNVSTsigFt16nGm+LC89pv+Wl1AxYk0w+YSh
         mLfSx+jrZVI94nJwzn9WVwrImIxN1xPCfacU/GPCzV5w69jngrgLyPNzIdpJAQghxai/
         j6GFEV52ypuDKSt1iyHuXe5Rop9S/XhtbUfhgp6eut9cH29olyYJDHC1f1+WdD+gLyTe
         Askk/3k6A70MJdi4A73zmtn0sCx4Q/MNOMoEWp0PGhn0LfhONeA2Wg0pU6s9kX8xLhio
         Un+e3e6bmBeSsA012eozggO3moJSXlSrvkhxfZyw3KfL/M3oZNlGfCcvRN8UTATAwhoy
         O5BA==
X-Forwarded-Encrypted: i=1; AL+hErH6eFtsNFWBQ7J0NMe6rbMpU5XXsLGoMVmBuSwIJbqcntmlyKrRCqbwhGDWa7lvY/WZSSiQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/BElTCOmB8yR5iACW+OUUYTCFd+zzgH5sjpFnaUCjDxPAG9w63
	5P6mPOnItE8bIRI5fZdiG8uTRce9M5u4ruocwrogHHGjIlaErdoA3Ahx23QFVyQHzlbS7eKJ7ov
	uEidAwnTqpC0TQ/p3O+P++5crL4Nej6c=
X-Gm-Gg: AYBFou0xUKSNL1Zi9CDIW3dstk+GA7ILjyM2V5GM1kJQdli5WYxM9u5D7HbEs1SBUj/
	Jb8rFEhHz+C5UGHTWYmIXNDlZHMTPIkY303wkHtch9KgLPNLZ4EJYZVGORzIdfs2W36crqVa6m/
	fQ/ck0TEM4xeScpUqQxOSlYNgYu4zPKSr/fQLGmyHEIXovAcPMUlAWVEk6dEeWRDdZ8QkK43yFc
	3eknWi54HUjvmo9vOnkqc8GTZVEk6qpBWhlavRMz48FWobq43WS5mpyUL9jjHInLijX9QYEoCFA
	4I3+HnxmvxzVJPU42uHkyvWNiTbM3Q9OHSttbslqIaOEcc2nbhqAUgYudwj9JYpF4SucmbDw+mh
	qRu/3xTyVRq+2nbq5fTQTSAwaJD9hFFkc79k8iVZ9S8cvltG92MoM7ChnVhmXPEfTXtp8Qg==
X-Received: by 2002:a05:600c:1d29:b0:4a6:42cc:bf65 with SMTP id
 5b1f17b1804b1-4ba0938182bmr115084735e9.17.1794499282029; Thu, 12 Nov 2026
 08:01:22 -0800 (PST)
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
 <20261104165504.2430480-10-kunwu.chan@gmail.com> <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
In-Reply-To: <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:01:10 +0800
X-Gm-Features: AclHuK_r0z0qzRgTWpnMwVZyYzYAfYE6f8hG1Sg9QutknQhxmorMBRwJwam3dq4
Message-ID: <CAN_Opa9F9prFRqta5KwCHoQHrmsOEB4_m2tst0+0VY+fh5o2cg@mail.gmail.com>
Subject: Re: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
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

On Wed, Nov 11, 2026 at 5:37=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:27AM +0800, Kunwu Chan wrote:
> > Add READERS4 and READERS0 configs to cover reader-active and
> > reader-free synchronize paths.
> >
> > Both use the PREEMPT baseline and hazptr-stack torture type,
> > with four readers for READERS4 and no readers for READERS0.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not just add '--bootargs "hazptrtorture.nreaders=3D0"'
> to the kvm.sh command line, for example in torture.sh?  Ditto for the
> four-readers case.
>
Hi Paul,

Agreed. I wanted to keep the zero- and four-reader cases as
explicit, repeatable tests. I'll drop the separate configs and
retain them as scripted PREEMPT runs, passing nreaders=3D0 or 4
and torture_type=3Dhazptr-stack through --bootargs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
> >  .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
> >  4 files changed, 36 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
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
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > new file mode 100644
> > index 000000000000..f5564c218902
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D0
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
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
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > new file mode 100644
> > index 000000000000..0d0df3f7dca4
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D4
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
