Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB010E6
	for <lkmm@lists.linux.dev>; Tue, 29 Oct 2024 00:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730160286; cv=none; b=Usq0+ZuJJgqFlvNfJxIroKwCIPytSh6Ck1Qhxn/rjrs9elA/WXsU+zYQ/O8siQZNqCaN/KucRFLntcX3R2ZPDRwOnvjLWKJ3vHOQi+f19an4XAHj3lXnz8dNBQLuINftgd1WcXcp7LL/hb0dYaNqt8LCrEUDZ8BR0G7MF5YyNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730160286; c=relaxed/simple;
	bh=m92hPDNHnswjHYGuZO4s4WZLF8jY3juBi76Lv0ADrGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORfhh72tNgEQC0CRkq9XUPYjfuWx3Ux6+Or2w+NAivTrUqV1aXNuE3rxBMx2FLC9Dkdf96Zt7mmFub2eZb6zNlvjtFRnKN6QgDwsnJU4cmkJncAkZRetiuEpsLjPmnXBcS4iTuYVgRfwSs+IQlJfKEPLzoHjc70LCbQGKQPbSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnacfxJe; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnacfxJe"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b175e059bdso371468385a.0
        for <lkmm@lists.linux.dev>; Mon, 28 Oct 2024 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730160283; x=1730765083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Ug8PeAl6jWQKFLewUNUk412ruhmbZrs66oyq2vYhk=;
        b=XnacfxJeFTmTtc6mGAsOypCHXJy55EnzNXAbhDs/mfdjgxAHIzZt+RD69UoLmCGD4e
         00u/8zEAYlmjt3wdZtpSVGNwwd6M/jXHHQXqvaz3uItG8BVWasohdjT5Qo3qFQD9oM0c
         mfHEvvbzagesmffdEkKxCt1aoyhcJkrqPsV3pj07GfEsBObxTd9M3LFCHNEzpsmGi+c3
         Hu/P2tEjrq1/2ijddbY7Ct4aPmT77YXp611B7tncANkWqIBVcqpyUnp5sAeGdbLGSHDI
         WG9yWiB1VfrVGvnbLdUNEmYoHrYs0D8gWYCbzuM/emHbCbekj7ARnp+c035kWxvXbsb8
         kXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730160283; x=1730765083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8Ug8PeAl6jWQKFLewUNUk412ruhmbZrs66oyq2vYhk=;
        b=FBD3d4qgqtrBguWLy2yMFdyfUzYMJpA0oy/PnFs5jZadgO2ryYq57mx0ZfMay56bey
         pyoaYnR9G3oS/eRS+xyN7wggMdKbU2FrE3oTntKJ+k1thybO8+uUP70jvO+wFhybd2fB
         Ad3WHQlxz/XNGUYAsH17nD07FDUhyRrxlzG+n6udJU1ATEKfZ46yW++9V3w7TBVXoPzf
         GrOMxn3KH9uP2ga6MaOiYNItpgazONOxoO7qeowRoMGJNEkkznWCepZ2LXqK/PIIoKFV
         KJajplJ5IDUWzj+cFMEIBDdqmsg4fLOaeSUYktx1RZP4TeJ2axFwAUheoMHFy7U7o9HG
         oXtg==
X-Forwarded-Encrypted: i=1; AJvYcCWOFabSefPV3Gs2NSx5+OgXoorhzRT3am/yeOMRMMVvrmw6GOpZvL2DAhaTpvRdDaKq1/gS@lists.linux.dev
X-Gm-Message-State: AOJu0YzDqdhCQ5l0bf+zOIYSohb1axDwKxgrChVT8Wgs/mS8Qjcrs1cI
	o9O7fVPUtPUdqlzboPvwm3cCtC73UU87A10JN7ylk3mUKgb/nlTv
X-Google-Smtp-Source: AGHT+IE5ua9ZEIGkzkZsGatBiQmvz/Qq5OTua52WelyrSwNaZH0e17tA6DIIKkLPavK7bmoEGm/Ubw==
X-Received: by 2002:a05:620a:284b:b0:7b1:374d:75b with SMTP id af79cd13be357-7b193eff930mr1529517985a.34.1730160281796;
        Mon, 28 Oct 2024 17:04:41 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d331a28sm368853085a.75.2024.10.28.17.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:04:41 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81FF0120006C;
	Mon, 28 Oct 2024 20:04:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Oct 2024 20:04:40 -0400
X-ME-Sender: <xms:mCYgZ0RXP8_nLhgjgYRx2aN1kUFFcbT45g5wCHUKnJjTdnF4YJQCXw>
    <xme:mCYgZxxcBdmSJR72F7X5d9cn4MXVyaDLTb75h0i95Q7fgthdsDRG4mlefDVtJI82B
    KPnTGi84A5V9xVRtA>
X-ME-Received: <xmr:mCYgZx24OWHDuVTiW4_o3sbCcRTZkkzDBMPxoSm35VZw3U-6qLvn7KCB8LE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdektddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhhonhgrshdrohgsvghrhhgruhhsvghrsehhuhgrfigvihgtlhhouhgurdgtohhmpdhr
    tghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtvg
    hrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtthhopehprghrrhhi
    rdgrnhgurhgvrgesghhmrghilhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopeguhhhofi
    gvlhhlshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepjhdrrghlghhlrghvvgesuhgt
    lhdrrggtrdhukh
X-ME-Proxy: <xmx:mCYgZ4DenGb9m23WPsox55lqvsa1m8Yy_ZfcEQqvIZRw65UU0jvTXg>
    <xmx:mCYgZ9iA9fqSA7_WY644JxSurbLRFETJpfrzI3cvCQUZJOY1Zh1zGQ>
    <xmx:mCYgZ0qIUAS4fKaFAY-YhSrTIvCEgSnthPtLIgQx9-j_AkI9Lf-6yw>
    <xmx:mCYgZwgVknMf_Fo5QGI4N9nbJj7D0XmpN7jqXrkuTXL6vPJwyWP0Uw>
    <xmx:mCYgZ0TxKNCjdChem3xovQAhDeURNG-psbHXiKQQfRhweDDweMF8lLm->
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 20:04:39 -0400 (EDT)
Date: Mon, 28 Oct 2024 17:04:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [PATCH v4 4/5] tools/memory-model: Switch to softcoded herd7 tags
Message-ID: <ZyAmlh5GDBsqY0sZ@Boquns-Mac-mini.local>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
 <20240930105710.383284-5-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930105710.383284-5-jonas.oberhauser@huaweicloud.com>

On Mon, Sep 30, 2024 at 12:57:09PM +0200, Jonas Oberhauser wrote:
> A new version of herd7 provides a -lkmmv2 switch which overrides the old herd7
> behavior of simply ignoring any softcoded tags in the .def and .bell files. We
> port LKMM to this version of herd7 by providing the switch in linux-kernel.cfg
> and reporting an error if the LKMM is used without this switch.
> 
> To preserve the semantics of LKMM, we also softcode the Noreturn tag on atomic
> RMW which do not return a value and define atomic_add_unless with an Mb tag in
> linux-kernel.def.
> 
> We update the herd-representation.txt accordingly and clarify some of the
> resulting combinations.
> 
> (To be) Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

One bit below:

> ---
>  .../Documentation/herd-representation.txt     | 27 ++++++++++---------
>  tools/memory-model/README                     |  2 +-
>  tools/memory-model/linux-kernel.bell          |  3 +++
>  tools/memory-model/linux-kernel.cfg           |  1 +
>  tools/memory-model/linux-kernel.def           | 18 +++++++------
>  5 files changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/memory-model/Documentation/herd-representation.txt b/tools/memory-model/Documentation/herd-representation.txt
> index ed988906f2b7..7ae1ff3d3769 100644
> --- a/tools/memory-model/Documentation/herd-representation.txt
> +++ b/tools/memory-model/Documentation/herd-representation.txt
> @@ -18,6 +18,11 @@
>  #
>  # By convention, a blank line in a cell means "same as the preceding line".
>  #
> +# Note that the syntactic representation does not always match the sets and
> +# relations in linux-kernel.cat, due to redefinitions in linux-kernel.bell and
> +# lock.cat. For example, the po link between LKR and LKW is upgraded to an rmw
> +# link, and W[acquire] are not included in the Acquire set.
> +#
>  # Disclaimer.  The table includes representations of "add" and "and" operations;
>  # corresponding/identical representations of "sub", "inc", "dec" and "or", "xor",
>  # "andnot" operations are omitted.
> @@ -60,14 +65,13 @@
>      ------------------------------------------------------------------------------
>      |       RMW ops w/o return value |                                           |
>      ------------------------------------------------------------------------------
> -    |                     atomic_add | R*[noreturn] ->rmw W*[once]               |
> +    |                     atomic_add | R*[noreturn] ->rmw W*[noreturn]           |

Not in this patch, but don't you need to update this again to all cap
to match your changes in patch #5? ;-)

Regards,
Boqun

>      |                     atomic_and |                                           |
>      |                      spin_lock | LKR ->po LKW                              |
>      ------------------------------------------------------------------------------
>      |        RMW ops w/ return value |                                           |
>      ------------------------------------------------------------------------------
> -    |              atomic_add_return | F[mb] ->po R*[once]                       |
> -    |                                |     ->rmw W*[once] ->po F[mb]             |
> +    |              atomic_add_return | R*[mb] ->rmw W*[mb]                       |
>      |               atomic_fetch_add |                                           |
>      |               atomic_fetch_and |                                           |
>      |                    atomic_xchg |                                           |
> @@ -79,13 +83,13 @@
>      |            atomic_xchg_relaxed |                                           |
>      |                   xchg_relaxed |                                           |
>      |    atomic_add_negative_relaxed |                                           |
> -    |      atomic_add_return_acquire | R*[acquire] ->rmw W*[once]                |
> +    |      atomic_add_return_acquire | R*[acquire] ->rmw W*[acquire]             |
>      |       atomic_fetch_add_acquire |                                           |
>      |       atomic_fetch_and_acquire |                                           |
>      |            atomic_xchg_acquire |                                           |
>      |                   xchg_acquire |                                           |
>      |    atomic_add_negative_acquire |                                           |
> -    |      atomic_add_return_release | R*[once] ->rmw W*[release]                |
> +    |      atomic_add_return_release | R*[release] ->rmw W*[release]             |
>      |       atomic_fetch_add_release |                                           |
>      |       atomic_fetch_and_release |                                           |
>      |            atomic_xchg_release |                                           |
> @@ -94,17 +98,16 @@
>      ------------------------------------------------------------------------------
>      |            Conditional RMW ops |                                           |
>      ------------------------------------------------------------------------------
> -    |                 atomic_cmpxchg | On success: F[mb] ->po R*[once]           |
> -    |                                |                 ->rmw W*[once] ->po F[mb] |
> -    |                                | On failure: R*[once]                      |
> +    |                 atomic_cmpxchg | On success: R*[mb] ->rmw W*[mb]           |
> +    |                                | On failure: R*[mb]                        |
>      |                        cmpxchg |                                           |
>      |              atomic_add_unless |                                           |
>      |         atomic_cmpxchg_relaxed | On success: R*[once] ->rmw W*[once]       |
>      |                                | On failure: R*[once]                      |
> -    |         atomic_cmpxchg_acquire | On success: R*[acquire] ->rmw W*[once]    |
> -    |                                | On failure: R*[once]                      |
> -    |         atomic_cmpxchg_release | On success: R*[once] ->rmw W*[release]    |
> -    |                                | On failure: R*[once]                      |
> +    |         atomic_cmpxchg_acquire | On success: R*[acquire] ->rmw W*[acquire] |
> +    |                                | On failure: R*[acquire]                   |
> +    |         atomic_cmpxchg_release | On success: R*[release] ->rmw W*[release] |
> +    |                                | On failure: R*[release]                   |
>      |                   spin_trylock | On success: LKR ->po LKW                  |
>      |                                | On failure: LF                            |
>      ------------------------------------------------------------------------------
> diff --git a/tools/memory-model/README b/tools/memory-model/README
> index dab38904206a..59bc15edeb8a 100644
> --- a/tools/memory-model/README
> +++ b/tools/memory-model/README
> @@ -20,7 +20,7 @@ that litmus test to be exercised within the Linux kernel.
>  REQUIREMENTS
>  ============
>  
> -Version 7.52 or higher of the "herd7" and "klitmus7" tools must be
> +Version 7.58 or higher of the "herd7" and "klitmus7" tools must be
>  downloaded separately:
>  
>    https://github.com/herd/herdtools7
> diff --git a/tools/memory-model/linux-kernel.bell b/tools/memory-model/linux-kernel.bell
> index 7c9ae48b9437..8ae47545df97 100644
> --- a/tools/memory-model/linux-kernel.bell
> +++ b/tools/memory-model/linux-kernel.bell
> @@ -94,3 +94,6 @@ let carry-dep = (data ; [~ Srcu-unlock] ; rfi)*
>  let addr = carry-dep ; addr
>  let ctrl = carry-dep ; ctrl
>  let data = carry-dep ; data
> +
> +flag ~empty (if "lkmmv2" then 0 else _)
> +  as this-model-requires-variant-higher-than-lkmmv1
> diff --git a/tools/memory-model/linux-kernel.cfg b/tools/memory-model/linux-kernel.cfg
> index 3c8098e99f41..69b04f3aad73 100644
> --- a/tools/memory-model/linux-kernel.cfg
> +++ b/tools/memory-model/linux-kernel.cfg
> @@ -1,6 +1,7 @@
>  macros linux-kernel.def
>  bell linux-kernel.bell
>  model linux-kernel.cat
> +variant lkmmv2
>  graph columns
>  squished true
>  showevents noregs
> diff --git a/tools/memory-model/linux-kernel.def b/tools/memory-model/linux-kernel.def
> index a12b96c547b7..d7279a357cba 100644
> --- a/tools/memory-model/linux-kernel.def
> +++ b/tools/memory-model/linux-kernel.def
> @@ -63,14 +63,14 @@ atomic_set(X,V) { WRITE_ONCE(*X,V); }
>  atomic_read_acquire(X) smp_load_acquire(X)
>  atomic_set_release(X,V) { smp_store_release(X,V); }
>  
> -atomic_add(V,X) { __atomic_op(X,+,V); }
> -atomic_sub(V,X) { __atomic_op(X,-,V); }
> -atomic_and(V,X) { __atomic_op(X,&,V); }
> -atomic_or(V,X)  { __atomic_op(X,|,V); }
> -atomic_xor(V,X) { __atomic_op(X,^,V); }
> -atomic_inc(X)   { __atomic_op(X,+,1); }
> -atomic_dec(X)   { __atomic_op(X,-,1); }
> -atomic_andnot(V,X) { __atomic_op(X,&~,V); }
> +atomic_add(V,X) { __atomic_op{noreturn}(X,+,V); }
> +atomic_sub(V,X) { __atomic_op{noreturn}(X,-,V); }
> +atomic_and(V,X) { __atomic_op{noreturn}(X,&,V); }
> +atomic_or(V,X)  { __atomic_op{noreturn}(X,|,V); }
> +atomic_xor(V,X) { __atomic_op{noreturn}(X,^,V); }
> +atomic_inc(X)   { __atomic_op{noreturn}(X,+,1); }
> +atomic_dec(X)   { __atomic_op{noreturn}(X,-,1); }
> +atomic_andnot(V,X) { __atomic_op{noreturn}(X,&~,V); }
>  
>  atomic_add_return(V,X) __atomic_op_return{mb}(X,+,V)
>  atomic_add_return_relaxed(V,X) __atomic_op_return{once}(X,+,V)
> @@ -144,3 +144,5 @@ atomic_fetch_andnot(V,X) __atomic_fetch_op{mb}(X,&~,V)
>  atomic_fetch_andnot_acquire(V,X) __atomic_fetch_op{acquire}(X,&~,V)
>  atomic_fetch_andnot_release(V,X) __atomic_fetch_op{release}(X,&~,V)
>  atomic_fetch_andnot_relaxed(V,X) __atomic_fetch_op{once}(X,&~,V)
> +
> +atomic_add_unless(X,V,W) __atomic_add_unless{mb}(X,V,W)
> -- 
> 2.34.1
> 
> 
