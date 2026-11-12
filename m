Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496999;
	b=g/p3Lv8c1KXT0L5zs/a2dq1kbcD0oB6TCR8qoUtzl7ufa7CTRh/Aq+LZnaslaGU2xiCi
	 BrIOhsX3Ue5WMx/wYac1q8SpizuFAj7DNSjUR/Zo1VTfD7ZWFMdiepAqX+KQYtqz4GJoS
	 FbTa7m8n90hG+BD1qtjLBMscjfZuRRFmappn/sRI87sX+M5at9MFaeAw0SwHJcdonGB0A
	 J0nSpDwj/I14YHM54yaMHu5DHI3Nior9eLt1Bjry5ney9zB8H8XzU/X3G6LIJ5P5eJN1g
	 BInLJY7E16nmzK07F70qMzgDieKvh7Cm8JQM7c4tGGVo+MAxvKzji+a0V1qnfLsNouw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
	b=42/L3W1Fk7lo+6d9lT/62x7PuphsqAv5o75ZipI6rC0mzvo3ZaOWOF9ugeMLNsmL/jKf
	 s30Yf3mk2+9BG5tTMr0YcIBwGksABUOAZH9iBQ1FHV/ZzGX+dPG0+ZsbVdmD89GHFcXJy
	 4fpZ22dajccN+lljyzBQX9d0mVHFDCSdeVD/JseDCS5ZLKt7i52wYts6/OEy1U67g+W87
	 j5/QDXlxye1MrpjImOrOMjRxCUrEkOYLDu9PWlYhmJuawoo9qqSxcgVt6+oeybYNW46nD
	 gvS5a2YccYYig/ApWNN1oTTg5Iw5KVjOcuAMPXp+u7itLBAB9JFqjkWNwZYpmOf4cOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOnEovHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586E60A3827
	for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 15:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D586E60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOnEovHe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38954895e9.2
        for <lkmm@lists.linux.dev>; Thu, 12 Nov 2026 07:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496997; cv=none;
        d=google.com; s=arc-20260327;
        b=MHZ2SaNd4P5vkM19nR/bck91u2Rx1vpp9K3S0msUE5cc/7K0WYE5p/9sB2Yg39TSbf
         H/DJDUS1cZeE27iarz+rrDZWNc6Cunz0OqSPe65CaDD7WG582Ar2eSwF8fpzu0eqsbnV
         HvviKojGnvNB0V6kuT2mHKvQTKXp6k69IWg6zgFptFTKtKkXMM4YEOeVQ7exwwJfiAy7
         OOsZfKCkyvklWS21gEl/jAlSROZkZTnUr681+KdRCTDQYPYjQEQVQqj6OgtPdQet8ZLa
         I1K+76OzPKoDbp5ikFVzoX2hGm9OmDha8RVasekjJJdjJOGuY3nroLgk8gJ2EXLA/GGl
         wWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        fh=Xw2jpuRTsaIWfRcyPsiuLlqh43aTkRT3Cr938BbJIXY=;
        b=ASIibSFrb5bqXAN1LDThHNMEXGATPWPCGyX12iHZmjB5O1kxhaQ9doBr5kbEo00MPB
         L46i931epnutjhY+I29vj8V9D9feJPf0g8Qh5w9xBgAYP2DD/YGunw9bCJPufnYJln3T
         UTOTH27a5+L1rr981yY94gcfPvQQaKjRQ8QRv+HgbzyA9Okqa9I3JxzrqmdfMuVRzxUi
         1wQqG+HA3ediMXa9sy4lh0VJt7zY4bTnkZKVMk86igWT9BYqUvdXBC/IsEJWaRa4qd23
         XWDiu4KIMpUl3Tlpn17cmlpGyDISiVQrANzvNVjRFmBo/b/Gmx222KznIKgZ6PcjJY4K
         rpJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496997; x=1795101797; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=mOnEovHehJ1i1wQrT6EbsgwA9pXE+F1UvhhcqEQoGhI+1pOYLF/RjKpYiHr0BVKmRr
         nRYAxJHNO/u3VfAwGt+JpKYaFUgL2htYb/2Ec876463SH48QjuBBpJKyOcsUk96em+wv
         DoC5rU5ZDZ+EwF2lbM5KouasDu5/ek8chEQ7KUc8UfT65dytHdHs5lW+t5bCvhNhJ91x
         1DNEbNzkrE7bdX04ZlUG2/CnX2gfNu/PKACdljQJl8NfhdpnoePL1GZVjld2I/KKl/SR
         rgWLRmcu3/BxVXM916tf9D8KnSc0VefMWdqgfRnubN7PXgYQK8XbZbfuUODKQBs5UlQC
         c6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496997; x=1795101797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=hBF6liCwuoPPmgrEIK34YkHjIvV4R3ENpPwQsaXqCO2XW7c5gxXY6o6PtQFRFWLyUQ
         MiTIz8bYZcKyq1xxeph3SN95nIloMtWOxxlNxVDwS685AMr6DJMAuIxR1pD/tbvii7qO
         +6KE3D281iMIzbY1YLXlPzNca6UAzOsn+BWOsRhlY+Ts5fH8JKy6+Adgrll0qWiqyix9
         IgJJw6QFM7P/i8iQJXwWFXnGdhP9h3wNZwRFZE90HHKFXMu+qSulTo8jDn7mhjd4PU1q
         ocb4jxIiId/ViTmM3Xi9uefuyrR3BrHL5uUteHx8segbn+zIuHiKSnRVxB750GHiM4nw
         naEg==
X-Forwarded-Encrypted: i=1; AL+hErEg06pbASh5Js5in5gtVuIHai3/vHxxfa5t3tmnMjA6j/EQLpmHw5TsBGyYmxKVGeB0mJpP@lists.linux.dev
X-Gm-Message-State: APuU4Z/zCzzJsigmNFIJ67shrF/0GpfHq5bmaqHcODdpE6Hz+BIggyGv
	EoF/SRjJFy8QrmFsVNAbApRJW0VQR7/d9BlTx0jJm7XQMANeBzxMniizPa/upVQWadonkmyCXsQ
	sK0MqSSyPppGoQuoFVVrh+t+yNMiI8CI=
X-Gm-Gg: AYBFou1+4VTLK4nLaFEDjkkjy1NSqKXjxFDSElhsIYGbpaCwWdGp3BcDV7GDLldoPET
	wWRo8+XVqdXtkfsY6gO9z1aEo+aWlns/AlJss4Hnk88PSB6fQqT2QfDd4iVq9ly8NGaBDl8u7O7
	YB5Lo8RGgRlYUdnmxGJk/GAJl/p5IcJ2TyxDdWP8NN1g9Xa/8pLAtoNkZqBAdBT/LVVXk0BhyRw
	1TThI7Ud9+2vu008+4AwSkNIR8O/nFMhCXvZYpMAIEwstgMRM4pJ0/Gzo5jtlpPOLNYQ2mSR/eU
	FT8eVEgkUt28uKKGNDC7OvSfwhARl0+ziTzZknDNIMPDxXfF5bQyTyWef2V46TQOHFbocO8zzxm
	yZIK3pPIBqsd0wrfOWDSPw/SR6eK6oKb+anQiLIfDigJX5jJ/SUWYFci1OBKiUfNclxppgoFzf3
	cXXJFT361WS6ypqxXM
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ba0937a886mr110753845e9.17.1794496996738; Thu, 12 Nov 2026
 07:23:16 -0800 (PST)
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
 <20261104165504.2430480-27-kunwu.chan@gmail.com> <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
In-Reply-To: <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:23:05 +0800
X-Gm-Features: AclHuK-Vxw-TWlfdg2rnJncie6E1-Z5rOKezLCml8xvtMgG1OEVJSy5iWLiq3yg
Message-ID: <CAN_Opa8-macEL323Tw3JUai3ETmq0CCt93ddCZ+Xqd1RF1Q5nA@mail.gmail.com>
Subject: Re: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for
 rcuscale coexistence
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

On Wed, Nov 11, 2026 at 5:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:44AM +0800, Kunwu Chan wrote:
> > When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
> > the same kernel, hazptrtorture calls torture_init_begin() first
> > and rcuscale fails with -EBUSY.  torture_type=3Dnone makes
> > hazptrtorture return early without registering, allowing the
> > rcuscale hazptr scale type to run in the same boot.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>

 Thanks Paul for the detailed reply.

> You are only supposed to build one of them into the kernel at a time,
> so the intent of the torture_init_begin() failure paths is to enforce
> this rule.  If you want to run both in the same kernel, the way to do
> that is to build both as kernel modules, then do modprobe and then rmmod
> of the first one, followed by modprobe and rmmod of the second one.
>
> So please help me out here.  Why do we need to allow both rcuscale and
> hazptrtorture to be built into the same kernel?
>

You're right. I had incorrectly made rcuscale's hazptr scale ops
depend on CONFIG_HAZPTR_TORTURE_TEST.
That led me to enable both tests in the same kernel and add
torture_type=3Dnone to keep hazptrtorture from registering.

> If your desire is simply better handling of an error condition, an
> alternative is to force either a Kconfig or build failure when more than
> one of the modules invoking torture_init_begin() is built into the same
> kernel at the same time.
>

The hazptr core is available independently, so that dependency is
unnecessary. I'll remove the guard from patch 23, leave
HAZPTR_TORTURE_TEST disabled in the rcuscale configuration, and
drop the torture_type=3Dnone workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
> >  .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
 b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > new file mode 100644
> > index 000000000000..c5e9cf0184ae
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > @@ -0,0 +1,13 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_TORTURE_TEST=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_STALL_DETECTOR=3Dy
> > +CONFIG_HAZPTR_STALL_TIMEOUT=3D1000
> > +CONFIG_HAZPTR_DRAIN_ASSIST=3Dy
> > +CONFIG_RCU_SCALE_TEST=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > new file mode 100644
> > index 000000000000..e9cca4cf453b
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dnone
> > --
> > 2.43.0
> >
