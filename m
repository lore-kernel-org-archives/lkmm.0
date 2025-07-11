Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D021A457
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 21:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752268939; cv=none; b=Nwx4VpuuitaG2VHh9OPod8YZhpBNlXM0WHGClKxM5XSSQE23uhuQsxX8VG6RiL03t4lU7640ClMg1VCNZKrp5te1RYd8B10je2mT8RNG81FlHvcfpr5Hff78p3p7mTAtE3/hlAal262U4IwSeHCFs6tH2FvcAH2wgRSkjvtsOhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752268939; c=relaxed/simple;
	bh=/6jx1eXNGaD49/dIGd6+A9ItUXIEm9RDVUUAuS7ycJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH7tKKuoMVxMX/iB+7Ll0Z59AGXS9bgqmt6t1TI1wtvGI1bDo5S/rrBI1cjKM88q1xoIEBUpMmKFhPWeXBapff57K9E63+IqUx8Jny07dnl8GP1xNOIXz0Vhs1p3yAIoD5b9gwe8K9PFEAawo1v/mSAckdbwmDSaXAMfukbrTdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWNJL4XY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWNJL4XY"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d09f11657cso237553885a.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752268936; x=1752873736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f18fbZZRbveSqbmKFgVw+VUk1+2XWjIRNb+rjsHPdcE=;
        b=mWNJL4XY35XRsKd8md/Ei6FOIdD9sQwxInrCOhz5H2FaNDp43mvQf1uLBSLx8SaMjm
         GNdcG9F5ZLdlAKFtvkN/DlyHbwXAKqpWW/rcD0QMjhOChRx2UQ5LLFwWwuyPXi03C28d
         Cyeatb8s7nhq0sauFJONN03rDj/BAroGdXRrSuaNz1ihB0Xi2QELCqf/uGJ39Lhh3sQh
         Rlr1BTMbaEUMTe4c7vYQUTA7cYPtYbvoeYkMAxL1JapU37ETdkkVQjQQjb6ObkQPSf1q
         BwGuVKYdhLF1h7Eo04gppd6rbBSiC3aCwkcBBeEdcD7L02J2/PCmJkvhfn0mufVasi2Z
         S/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752268936; x=1752873736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f18fbZZRbveSqbmKFgVw+VUk1+2XWjIRNb+rjsHPdcE=;
        b=obOsZ7s3vHaIyQ2WnCYkZ82H0VdUAg+eK2T79DOOjYMf2oU4uZt9fdP4zVQOKAh3Y2
         kztuJwOoy/hFI49vGKglLgSRHRCT4YieT7VOndM99Ilv81jBqzv4bJiegggQFqt2smr/
         DazWv5KH47FYIwuqoMEIw2safwYjsGaZ46rkrEpeDbkyDEhcxm+qGqcyBuLc7tRz1+zF
         XvpvWSiJqLkyN/k8cbcwf1fTj/uSGaz5cAzjnNlqflAAH41bF/r/k+LOyNl5FIX3lrVF
         mQj0J9Ppq6bMx7cNL0fNLwirl1swLf8+Q813jqI5JDaVPVcyZdWFgjJw+pFj/Xz6RJQu
         VZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUw8V1gfa3wlVf+FfNgoDeBnO8snKyMsUtvPhRNe/mo6dkll775h5klSkat/7j94NkYEB4E@lists.linux.dev
X-Gm-Message-State: AOJu0YypPRJe9UImiuRhng953sJW4rmxd4uRniKd0SKPJEd9EnxDfXKq
	HUq4Rwrd687Ds57QMpHiMj1IC2K9IOe0IGRvmvrQB0aGiBBp4nMKtxKj
X-Gm-Gg: ASbGncsM/wp7p0YkRy+8tYFCPVYzQoBZhvGfjQcgHcT9PqLiawZM1PfunC7KFrzd10U
	oS+kTCK+TEBTzmM4lwiL6Jr+//pt59biFJVR58a0JPcAyCi78AC/Hje+J6CcFf7xnLGFEwWOo3n
	+u36etrX6fm/V38cpCz3qAxj08tciP6fFrooXiF959ckkWWnklW+3dMZ60E1mnARWogKntq65ms
	krbU4kQwRGC2iiUL+aFci/Cgw+B7hVVMmWLBhVKf2NrMy8t83mApkEJibhQxcu30rCjaCvOVRU2
	b3o6hz4Q2eUBF7r3CZ1AQtlyigs6z8OmK7c8Exhf9OoHeONQ16DxdggiuhISVSxA2BhEmKgvZK7
	I5J9CiNNlFOc/d5utHTC2IZ7m1+XacTtxfimPyDErDhq+HGa7jiTLfteQtEjFjXgkpa7CTAhGKf
	hArFYUtvzl2LNA
X-Google-Smtp-Source: AGHT+IEqiXYnHFo15mF1CWRFRUjm7j6mS/lEw9LW+x1CmanecObRrjvEinHOKHkL5F155PLbdXNuIQ==
X-Received: by 2002:a05:620a:4087:b0:7d3:9109:4472 with SMTP id af79cd13be357-7deca0fe414mr577569985a.37.1752268935832;
        Fri, 11 Jul 2025 14:22:15 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e01651b7c1sm67783385a.63.2025.07.11.14.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:22:15 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id A6519F40066;
	Fri, 11 Jul 2025 17:22:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 11 Jul 2025 17:22:14 -0400
X-ME-Sender: <xms:hoBxaCuv2RxoItsIXSENQAUoYCg8RZPC_0GNXlaTwwhsPcx3NHKjlw>
    <xme:hoBxaI-ghevSxo47y41EM_LPbfyaA1aR6zm68g8jdd3ND9hGSvrQaudgYXA0U9STF
    7Ef72j7b0FyBhPWKw>
X-ME-Received: <xmr:hoBxaCU2CaBZZ-srnDGYgp3ux68T1mJ4S-0yUlQ2sra7ysA96yOeIBU4befF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepffdtiefhieegtddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedtieeghedv
    necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomh
X-ME-Proxy: <xmx:hoBxaMv1ng42MYmS_42etUc8Qjt6vxXeFHJS9Tp1savv3DDkT8qnww>
    <xmx:hoBxaA9hnmP4ylJu6vNVBLUkCzF7shwXuBke_IRNagXwa7SxcP-W-g>
    <xmx:hoBxaN3jGrtARlalYaDlvc58Jm-yfQeUcRl_O7AC-rQIJTzgXKAIdA>
    <xmx:hoBxaNScmNipFMsmIdip6JU4gn4XVctPuCgh7gcIocqV_yQt6eTEag>
    <xmx:hoBxaIAf_77wnn7oXrAoUQpVjjBfSOXSbg6i77-iLPjxE_AION9Wj_wx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 17:22:14 -0400 (EDT)
Date: Fri, 11 Jul 2025 14:22:13 -0700
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
Subject: Re: [PATCH v6 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHGAhbmgsb9f3ImR@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-7-boqun.feng@gmail.com>
 <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>
 <aHEiE0OoA3w1FmCp@Mac.home>
 <DB9GDOR3AY9B.21YFXYHE4F0MP@kernel.org>
 <aHFrUa3VWaKTe0xr@tardis-2.local>
 <DB9J3GBDB2UK.2OHWT5AI5DXFD@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9J3GBDB2UK.2OHWT5AI5DXFD@kernel.org>

On Fri, Jul 11, 2025 at 11:03:24PM +0200, Benno Lossin wrote:
[...]
> > Actually at the beginning, I missed the round-trip transmutablity
> > (thanks to you and Gary for bring that up), that's only safe requirement
> > I thought I needed ;-)
> 
> So technically we only need round-trip transmutablity & same alignment
> (as size is implied as shown above), but I think it's much more
> understandable if we keep it.
> 

Agreed.

[...]
> >
> > Me too! Let's use it then. Combining with your `AtomicAdd<Rhs>`
> > proposal:
> >
> >     /// # Safety
> >     ///
> >     /// Adding any:
> >     /// - one being the value of [`Self::Repr`] obtained through transmuting value of type `Self`,
> >     /// - the other being the value of [`Self::Delta`] obtained through conversion of `rhs_into_delta()`,
> >     /// must yield a value with a bit pattern also valid for `Self`.
> 
> I think this will render wrongly in markdown & we shouldn't use a list,
> so how about:
> 
>     /// Adding any value of type [`Self::Delta`] obtained by [`Self::rhs_into_delta`] to any value of
>     /// type [`Self::Repr`] obtained through transmuting a value of type `Self` to must yield a value
>     /// with a bit pattern also valid for `Self`.
> 

Looks good to me.

> My only gripe with this is that "Adding" isn't really well-defined...
> 

I think it's good enough, and I created a GitHub tracking a few things
we decide to postpone:

	https://github.com/Rust-for-Linux/linux/issues/1180

> >     pub unsafe trait AtomicAdd<Rhs>: AllowAtomic {
> >         type Delta = Self::Repr;
> >         fn rhs_into_delta(rhs: Rhs) -> Delta;
> >     }
> >
> > Note that I have to provide a `Delta` (or better named as `ReprDelta`?)
> > because of when pointer support is added, atomic addition is between
> > a `*mut ()` and a `isize`, not two `*mut()`.
> 
> Makes sense, but we don't have default associated types yet :(
> 

Oops, we are lucky enough to only have a few types to begin with ;-)
Maybe we can use `#[derive(AtomicAdd)] to select the default delta type
later.

Regards,
Boqun
