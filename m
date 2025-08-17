Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C0F482EB
	for <lkmm@lists.linux.dev>; Sun, 17 Aug 2025 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755399869; cv=none; b=Fj3qPvwKxvoudbmcmKiDc9kHiAL3KCJswzeVf9sgbNWZ9xioFco5ZOuqTVfzuRirLMdleKKaZaA+9AzQJeZ2MkJy7KZWTFv/Buhbz+jz8ngjlbh4YAqub5wiXRT2bgy/1DdLxWDFfRbwJ8pGcMtp+lHjkq4z2t94UlmeFVOh3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755399869; c=relaxed/simple;
	bh=bwzZ0EHT9CLOPYhrp9QBXtnFojq0Dx5Sqmor4zirmvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8TPNT2tMRyaK+vFCgB58DPaz0uSwi70zUQnNDhKjJaEnBF5jX09R0aD/AI1dt8cHJ7/+lE7YyG0bbsA6ctJagMyoA2LntOJMNHEM7xQc+8rqHdARGbwf3dGh0FJE+FbRSdWQXXWUJR4jwVFo6MLx4ZSxGLauhLTGKANHS35I3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ2asSnA; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ2asSnA"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e870636870so313354485a.2
        for <lkmm@lists.linux.dev>; Sat, 16 Aug 2025 20:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755399867; x=1756004667; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZs6He76FpZcbIW1aa62IVHXHMVIhxGtWlvMIkdGXCc=;
        b=XQ2asSnAJW4tBWR1rCrzHQy60viFackyQOflAp0mFGC2rYM12kwC36MNmol0Rrd3rR
         xXIWC7oxgD6j3oSMeA9Imn8Az1kUFhYBeuNJ3oaHF3CzyORfER27Fq3XFR+GS7N8VU7E
         4RwmqwVqlKJS8ZagDbKBsUz+DaHCXBRUbYDpMbTewVi9xQqoOF/e5pBOkfycfjOpeh2T
         kwF5k5Ti2g68tJ7EuU8Xx5/dZ5R3QW+TC4sRg8w/C7QR4j9wrrF+QTZp04EOezrzilZI
         GT/EUTHUtbA5b0GvQ8xdlIIPzUDHe2F/lcci/HFKWrJTLQ59mIF4lcACrZIok2/20NYE
         sruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755399867; x=1756004667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZs6He76FpZcbIW1aa62IVHXHMVIhxGtWlvMIkdGXCc=;
        b=LIAEsa1WTDfhMrHU5HEHaZrvueOjkvjWu22d27twapfE1gmRm55jRvIIjY5abc3gEO
         mLb0Jj7nd9qg9fSRe/ZxGoxmCiOBMUhRS+nZmrmxtGeoX4+LJHMrR5B+SZvnBbmx/EBY
         M5VP6bzVFTDT6ag2plINXZPXxjAhOChMgCjuVR/AgKgW5idrit1/z++DHPFVA/ml9iqk
         xi7/I24sJEMRU/KHbIALqXMDdHuIXpwutKRpCHYOXimo+H8aoRPqnnZ8A/Z6X26vdrXs
         a8h9z8u/U1w1bk9qTBAbPSPUWHWeHjmUxXNrdge9aZjkVscRMoFDEexYDA+TT1cuwqAz
         dV3g==
X-Forwarded-Encrypted: i=1; AJvYcCWXJ5D+NiDxtmoLYngiUfbW1EXWBLdFd76HwvoYnEFl4CWofuU8yz9F2nGWOBVxlwplIcp3@lists.linux.dev
X-Gm-Message-State: AOJu0YyGm68ctyxilFXbn1kcrrNWj/E7A4vG047KzrIAPc/L0A3riT7F
	cQRYK5Pg5+U+VGYyv8kBU6CXpD/YU4H3BoLpNs7a8gy1azS4vfirwefF
X-Gm-Gg: ASbGnctXsKPhnOxbLTAVj87qrQ83xce8SsU7jnJR9/YiFTZ1wnvbVxxXUnekqHls3o5
	79oCegBu4/i+gUr5vYuv/mLXu6jU9jVcK3OvPWsUy1KGzkUqbKNzfeMy+EJP+B9m6By3V/i8oav
	BjDJB/kp2mtGuM3qfE/Pjm0+2rX+mEZI6eHXqMQF5vWPcjMUpoSMvX3sRWq5E3WAjLxhHz5YdQj
	ggBMtyH/JwX4QAC5R2CnE2AHYPI0IR5gqrd8GEc6fbr5okiWGKoHueEizyL9UeddsVHR1pEMxgX
	B6BL1X/2pxuQ7RFw3lSAPeKssEQWyGx9frxlNxCI1QR91HpMcP1r1R4ywoxeqmP22bSsVPn/ykQ
	4b9NiCqVIGgY6BCXR4TuaxdRCA0spWw1QNdv72amx4PIYSTo5cQ+MbE49APbNxuvhonLImmOihA
	eESqgJto6grP9VWsH0CrXeWfQ=
X-Google-Smtp-Source: AGHT+IEcGyW6Wy1k4I4mrqmEJrNmhDO/3ICtkA1wv9HqXpE1GA4A8FOzSyKlvNXQZJn5H+9FCilqUQ==
X-Received: by 2002:a05:620a:29c5:b0:7e3:4aec:2888 with SMTP id af79cd13be357-7e8867ca173mr523543285a.35.1755399866644;
        Sat, 16 Aug 2025 20:04:26 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e06a913sm369430285a.26.2025.08.16.20.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 20:04:26 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 605B3F40066;
	Sat, 16 Aug 2025 23:04:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 16 Aug 2025 23:04:25 -0400
X-ME-Sender: <xms:uUahaLscPFBD_WSTneNGPp2tkdvcy1WgzXTblU8HYKZr-l7ZnjEo7Q>
    <xme:uUahaN-mnRssVlF_QUvBa9wNziqfXgIHq2pum7Vx6GebVrIArRiQKujn67vvmfeA1
    ugYnJCG2XvAieERqQ>
X-ME-Received: <xmr:uUahaDXGr-F5oHvn5Ad65Y7j-xA89I7gnGhvZfEHlSaPWRGkL4MxP8oK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeekiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhkeelhedtvdehhfdtvdekgffhkeefveffledvuedtffffveeiveegjedujedv
    udenucffohhmrghinhepohhpvghrrghtihhonhhsrdhsrghfvghthienucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhht
    phgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqd
    gsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgs
    pghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhssh
    hinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
    rhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:uUahaJusuFa-0t7Lw_LEL_9ELnKkA_q5UYdmYxy3Fk38xEm7-uWEmw>
    <xmx:uUahaJ8XkBhmWiod53qs32Uqv3mGw6F_d7yNCbJLqtNmUpLUlCvNFA>
    <xmx:uUahaC3_yhzmifJR9-qcusOPVtKDZLbqakA19xqCgKMAIr04CkG4pQ>
    <xmx:uUahaOQd3jaWfajZEboVoaO3emueN1D2NIBbuPtDwHdSgrBBPy4fmQ>
    <xmx:uUahaFBzSy_XpD15mAcb78ytkOv237PQkQqfHA-su0-RobZgt-Gj2hGh>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Aug 2025 23:04:24 -0400 (EDT)
Date: Sat, 16 Aug 2025 20:04:23 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v8 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aKFGtzQnUdH4zUGD@tardis-2.local>
References: <20250719030827.61357-1-boqun.feng@gmail.com>
 <20250719030827.61357-7-boqun.feng@gmail.com>
 <DC0AKAL1LW84.MR2RFTMX1H61@kernel.org>
 <aKCtbSDuJNrtdLNp@tardis-2.local>
 <DC43RPUDBY6M.1TGSQKJV9BKSF@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC43RPUDBY6M.1TGSQKJV9BKSF@kernel.org>

On Sat, Aug 16, 2025 at 09:35:26PM +0200, Benno Lossin wrote:
> On Sat Aug 16, 2025 at 6:10 PM CEST, Boqun Feng wrote:
> > On Tue, Aug 12, 2025 at 10:04:12AM +0200, Benno Lossin wrote:
> >> On Sat Jul 19, 2025 at 5:08 AM CEST, Boqun Feng wrote:
> >> > +/// Types that support atomic add operations.
> >> > +///
> >> > +/// # Safety
> >> > +///
> >> > +/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
> >> 
> >> Can you add a normal comment TODO here:
> >> 
> >>     // TODO: properly define `wrapping_add` in this context.
> >
> > Yeah, this sounds good to me. How do you propose we arrange the normal
> > comment with the doc comment, somthing like:
> >
> >     // TODO: properly define `wrapping_add` in this context.
> >     
> >     /// Types that support atomic add operations.
> >     ///
> >     /// # Safety
> >     ///
> >     /// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
> >     ...
> >     pub unsafe trait AtomicAdd<...> {
> >         ...
> >     }
> 
> 
> Inline maybe?
> 
>     /// Types that support atomic add operations.
>     ///
>     /// # Safety
>     ///
>     // TODO: properly define `wrapping_add` in this context:

The colon looks a bit weird to me. I would replace that with a period,
i.e.

     // TODO: properly define `wrapping_add` in the following comment.
     /// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to

Thoughts?

Regards,
Boqun

>     /// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
>     /// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
>     /// yield a value with a bit pattern also valid for `Self`.
> 
> ---
> Cheers,
> Benno
> 
