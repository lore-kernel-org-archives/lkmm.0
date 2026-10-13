Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C8C345741
	for <lkmm@lists.linux.dev>; Tue, 13 Oct 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900323; cv=pass; b=PUljKtqtU8HbgYeQuw7A68PuC5cK59FU9sU0gEY/tnHvdNvKWFleY1270QQZH00GRaxF4pOuFJXhhtcUgOWKul1ulitFTAAsEz9zVN6kORAuTKNBieqB7VjIRjcBwUuoLW015KKDtA33d9PppKQyetLgPLhsUaPdFW1+oyrDmVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900323; c=relaxed/simple;
	bh=efwpqbn4KqWJ83/+b8Z3Sx2CVCm9Kiqp5MA7PhTFAxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVWrFuLIyCVWWHjI6X2oBB5HiOnwUGLvT6YPdOVDDZATaE6TCa+CVyGcmXVOmnC/3DWtVO4uKDVkxKrXv91nh8wxPkbE/FUx8lloALl8AY3IABTpUbXNX1tj3jqJVU29js9NoD2RgC+210Qd/vLtyD+4g4xnV7gBQtPv9emmFrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJe6KpJC; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJe6KpJC"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93efc0452b5so33520085a.0
        for <lkmm@lists.linux.dev>; Tue, 13 Oct 2026 07:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900320; cv=none;
        d=google.com; s=arc-20260327;
        b=nd3681m0jZCKxva9pVeRfS0x6UhhvTnY5OR7OfRvfSE2FBfl/sEpjR+BrOWoG8BOZQ
         mhZ1JkV2FB1DVhnrdvZe5z36oKuvzUXBRhn/DAYZbAJ5kF1yUJ2eIGuCu6RoBcQKpM1X
         dJYJq1UuiuUHR+SVMkNAfBragIdQRyl+Tm/NvVgDZ3AWJKWSSQtKvqGB3c4z7jwGLoD0
         LTm+qXiTK/dQEdGTNGwcR8x8zoD7CftejIGjEMy1Gpszx5VDcTxWJYX3J0B3INujw2Fh
         4/sbTi2QzI90wDoGXhnyGA7Hd9A714UWmR+Cxup6oi8ISyCm8KoglyErZ/MJ3kbiGSM1
         /tBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        fh=jKY+vhIMFA8Vc49A7jSF03Ddz+AAe3SPupuHF9Fy4WY=;
        b=YoL0M1lTXS+MGoERTwZvesN9cSn+r/8cir+R21m3BY+8rpo94+9BLyQZIgM86FWA/I
         crR/gfQJZ5NiWC+Ji7rPUCv24ew4HHg9o40SHFtRM1n1sTrVdZ3qdpG6jPEf7YI4XDBw
         XrtBtBgD7IejX88U0t4+hLwcfJohiMvHIIGJiH5Ajo+2TzGfDcx7Cthdi/pJ1ugkaG37
         grMmscs8fcq/HkFff5rfbOl6sin0cgxJV6bIRPpVhK7AIEeFAg6yAER/qYb1HlogP6Wk
         8Ls/jLDtsI7BoSZV2O9KloNwfEUnB+tewi7xoS0qvfc6G6R/sLuBH/oMGfDHgLeyWP/K
         dvmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900320; x=1792505120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=MJe6KpJCWtN25mrWs2wHH28c5qezTuD9tv1FXrLj79cTGMJt72YV2PphaKhVLpu5de
         WErkPi+IbT5eDwTt4RcmUijoTmlwIT60ZL1eBCFpdNewieEDXsuN7DXY3tCyTGXZM4c2
         KhHZZYcNVk6oCwq8V+ErAAlqkvkpR9oaXq5uJsIJ9vHN20SVBBQjg1tGL8mdRp2PcZJR
         +k+b3EXGZd1q+jc5WE/k9E9mfJRHJZPCqTB5yRUiWzQcb+qOffnYrtFlpmiaRAfzDX4h
         t5N3xESeOhXcNoXVKe0ympf33cvPqmmtMcndoSzUtq5ecKkPeL8prFhj7c1S5eBq8wSN
         FVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900320; x=1792505120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=FdIwhyytywNI6EtEo5do1WCz9QQSVPhPBiQFNGKsP6DMsJEVOOfktjpN9zL92DKZyw
         O7Ae+GDkghGK2ExnVD2VaM8WkwM+VP+RwgmVMosVDnif3PeO0n/RLKTSIM986lCq0a6u
         qxMxSLbaJuNbPH+ATkJcDvDqGxqTCJCcbDGhkFPtsv7qYqga59LQX3vZBMQkP48fMDmL
         31qYK7fMd3GjLaJOUuznIsCsq422LpPH9R7ZtaPDL9jeVk9SJ8tbI/fCBeJciiS0oJDp
         X7UK8i7WpI9zVifC1MZRKCfE39ZZJCo/URFXo36FLRIOASZqW+fi7Fe6BdQhRZGx7nb5
         kU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxh5iFuSbdryIlRja0c+SxuvDnF7k0GpybXtLrbyF5xiK9n6jkx0OpE/p0RABBTXcBeP0BV@lists.linux.dev
X-Gm-Message-State: AFq9FYLhLw7wZ9jTbwkGhOSZwzzoGNqFizZl8jUW5y+t72uDwnwEuq8s
	cyyYuUUwIOVrr/YfOVqthGrA7m6v2GR7pWg241RfQWyXfJW2u5Oriax13O0SslNmuWZMX81+rzT
	lfJBk0micTKhbrpu7rkjmYIio1RGbkpo=
X-Gm-Gg: AYBFou2lVH01He9/v6R0P8+fe5mG5OkAshBbiFiQChuR5K9ER3JVWIovcuR35h1CxqJ
	AzDgJVONTJsseAW6/Sdu7rYtMduF3Fmt5k3GtmI49rmNrFVSBd6LLS24OpUsIOpImbSHqmSFqXs
	HXzyIyt+hHmlSjGVDflmV62rJQ3a9K3VPSJ162wADy8jI2iUVK5RrK+LF/yZo/cnR6K+UefHMwI
	RvLiDRWOSCNRM2cn96avrbm4F99YSUYU3GsmsXfzbhDjxLx8smHEAJTi7+FwRxgkSdD1qUvAGFj
	fbwjPt8CHBcqcGOo9SBlDFN9GXfo6KWn3Kn0Itf6x0pHL0oQzLE+vqea1zdKVDJFarLDOzDi0Ms
	xGvFjIAzuu7SOPlVSyRaB9EU=
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93ebd24b2fcmr2220976385a.37.1791900320079; Tue, 13 Oct 2026
 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-9-kunwu.chan@gmail.com> <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
 <as4ooZSWA2lAIceu@tardis.local> <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
In-Reply-To: <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 13 Oct 2026 22:05:08 +0800
X-Gm-Features: AclHuK9Y6wjNtKPnooCMgRZOapMzF0kyKCufRscUU_wsuFWoqVB6jP59bjMM3m0
Message-ID: <CAJhGHyBd5wuLO9H7bHJDO==2=z8MGQ3ehvszLiB1brztpRXu8A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun@kernel.org>, Kunwu Chan <kunwu.chan@gmail.com>, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-13 08:48, Boqun Feng wrote:
> > On Tue, Oct 13, 2026 at 03:40:36PM +0800, Lai Jiangshan wrote:
> [...]
> >>
> >> This breaks the forward-progress argument used by the underlying
> >> hazptr implementation: after removing an object from publication,
> >> there should not be a continuing stream of new readers acquiring
> >> that same object. Here, the bucket is never unpublished.
> >>
> >> For example, let B be the bucket containing key K:
> >>
> >>    Updater                    Reader                 Scan kthread
> >>    -------                    ------                 ------------
> >>    Unlink K from B
> >>    hazptr_synchronize(B)
> >>                               Acquire B
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               Acquire B again
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               ...                    ...
> >>
> >
> > This is more of an implementation issue,
> I agree with Boqun about the point that this is really an implementation
> issue.
>
> If we care about forward progress in the scenario of a repeated
> address reuse, we just need to wire up a "0/1" low bit phase tag and
> make hazptr acquire pick it up and set it within its hazptr slot. This
> will ensure forward progress in that scenario. hazptr synchronzie
> would therefore flip this phase between 0 and 1, and check that the
> pointer it's looking for is not set in the other phase, in alternance,
> handling both phases within one synchronize. Indeed, this phase concept
> comes from the realm of RCU implementations.

Regardless of which implementation approach is adopted, this would effectiv=
ely
introduce a new read-side synchronization mechanism based on hazard pointer=
s.
I would prefer to see it introduced under a distinct name in the
kernel, so that its
semantics and intended usage can be clearly distinguished from those of
conventional hazard pointers.

Thanks,
Lai

>
> I think that the overall mindset so far has been "RCU does this" and
> "Hazard pointers do this" as if those were entirely predefined
> mechanisms. I think the way forward is not "one or the other", but
> rather to combine the strengths of each of those mechanisms into
> something better.
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
