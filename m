Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB725D1FE
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507255; cv=none; b=J5j7jWOvqMfPYqLAf8Ant0/iFEc/hv8AWtMwNZDlyULyzt7qum1KRciFNNhQtDVhOBeNM1Oaw8JIltKioJcfMtOB5UHzblbl/1ENmV4kQ/PKM8/1BM0vdiMJcibVuW5v4/fHg0WxaVyZPNYKWsXuIzKQAbzv7PouZWSMvqqEUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507255; c=relaxed/simple;
	bh=g+O+Onw4EEFGOhr3iVz4F85RgpHcqoS4Sf24nG8i2RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg6Kv214XkjY5dAHYglaHqYDELLNxhSBh4wfv3xr8uGdqcRD+Cce4i21kttpg4kqUbkAvrFhjZ+kkqPi1pGLvfZH+EzzzkoNjcZ2xsEhyC/z0R48ddpLrq9Ej8RNrHIIp74J7HgSxokzBSfBut05JA6HclaCTiRdo8fSoHOpoZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYnKAQsL; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYnKAQsL"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e095510a6cso272951085a.1
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507253; x=1753112053; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1ah1KiBYa+nQwV3ZRjbCEW6rsly24N5LKmoT4ikCOg=;
        b=GYnKAQsLhXj8UV7hQCja937eJDP1gUmfsxbpEso5oAEANTGRbVmw9BGdeDkaN7jcnE
         Wq9DK+V0S6TCJhg0/SSKSLd9en2Apm/BtpzVVGOZpNowuHMVaHxmNNeu/8j1ukk1XsJA
         EJMkCgvSoQI9y5YbXv7B4IAtfgkZhcFjZIjtKiN0rtIhgfzooryMTEdaZGU7I9/wB0+1
         pyi9BSpX53+DxaDuh8cmC/lxIVSZeX+9s43UJil6glrizQ5WgByFp9JcJtqt1D/Pdm4g
         ghdTSjTMWOfLGdtJEkCU4qC8P+UCCP7ylOHC8FJxRnAMdUCWBqppZ1FXERvjEW/To1Se
         Hdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507253; x=1753112053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1ah1KiBYa+nQwV3ZRjbCEW6rsly24N5LKmoT4ikCOg=;
        b=nU7i0j0LtA876rhmzJ8z3SOxod9kh5DFrrkCGzmMH5vbsXl0CSYNqVJ8BymJQVAYan
         oEoQSm/H5USVltV8XkcsY1LJPHwxl1ioTPNnFIDlWPLZQZNTDvQQFIgO6QFzTIAZ3sZw
         FeF6MtxT8x6fu7AXvz2ICce2c+VvGjuMrABXxTCq2sR4WVS65IaQa22rKjJRl7ZIOMmZ
         BRrEx5Ju9GAIUWgq/xWtOuVK6FhYRjtXsCKn3mDQ2wxK3xgNePwigU/hBpIxsKGbikIU
         G4PNDPAymz8F2AAyiNrOYCCJwcw0fyACwl4QzwF3wGcbpMIa3gj5eru5k5uI/DoLgKLj
         eWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmCFp5CW6jfL2/lJKr1P766EQZcss8T41Y5fBfkApMSPLoMKb8fcsNk8JMY9JKZfXjyVF5@lists.linux.dev
X-Gm-Message-State: AOJu0YxLOKIHV0zO5VPg6JK5sVVh5sqYul2gIMrxnElbWZeJZ5BXlKZh
	9wXaz8ee33Cn7nnrK2KYgNII7KvrVxccdDs4QU6ikqrEOWaHVl3Pp/vo
X-Gm-Gg: ASbGncuECUYT04c3eLbXVmso0SBEcr9Sb0Kw/j5/e9FASOuCXGCKfAnizAd6ZpcOXYl
	8e3OZ8hZNu8qMGBVRnugaKcl5sjX3reLLh/w7Q6OqlP5OwGVkmHRYXlOKuhoRhWQuYUJ2L4bzH7
	q9Kx1AwSlPX5rwTrx1OyVasolp8/JEBL0FDFS9odd2f2w+rNGgd64K5uPBHTzjJpW8YUdEqncQ3
	NQOYl7BRgIxYmIPac37TlLmqmVqVNJ9N2yOMmVgKqkf1Uu/0VxmjH4r8vgQBxJJHfdEXD7moQlc
	5TASBAl+5lm5KXCRKvXKXg682RmQhb7AhM0EQi9d9xiVALNMtgnk0fQibookI+1V/5RRWTPndur
	FKosR5e7JY50g2pHMHl+I4W3lszvRirYVdcxl2k9/h3VjHYo6THIo0zajqR0m1sVLH9frniAmeM
	oFUaNwWETbYNZ0
X-Google-Smtp-Source: AGHT+IFmUKHtXtb7dpJhb3zmSZ1eVrPeDqvK2CSHNEiPnxRXmpl4kr66ZO7VxCg9aDpOs9IfcA6Fkg==
X-Received: by 2002:a05:620a:3190:b0:7d4:4b9b:3eed with SMTP id af79cd13be357-7de05769905mr2084229985a.25.1752507252602;
        Mon, 14 Jul 2025 08:34:12 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e407sm48780616d6.23.2025.07.14.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:34:12 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 74DFDF40066;
	Mon, 14 Jul 2025 11:34:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 14 Jul 2025 11:34:11 -0400
X-ME-Sender: <xms:cyN1aHmQVSMW2S2kEq1pJPrebkugzUZZx7YSPkqXy92gzTKnBgbOjQ>
    <xme:cyN1aMWimFINoAGnOsd9k2-95HuuNjyfZvtfXxt3C144lclHGnYiYmH2XP1GkvWtR
    FfmAOs2ELA7odHkGQ>
X-ME-Received: <xmr:cyN1aCOr5XRn66xwYrCaGaBmW8Mw1sEOEIic3APIUkO34OXuYJTEcin3Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgt
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:cyN1aPH5wN_4PmpthNSngTdrYOPJjgSl15y13eQUJj_aQD9DH9kFGA>
    <xmx:cyN1aD1J3MVqK-QZtu3f2ou6mS4vPSyPB9KByu2qLhsCR4qjF8R-wQ>
    <xmx:cyN1aHMTeBwM7TrQisU8VdSZ1GfDbQmh4LIhCesL8I_3ljXaHCvUGA>
    <xmx:cyN1aLKjTvhAQH3Na9-PBi3nibRPE6UbgVpON2CqydagPKOgBL6Lnw>
    <xmx:cyN1aAaAU6I6XSTTQYdwSmB3rGmKKNGqPScIUTdw_qwz8-ZlwVgyLlI4>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 11:34:10 -0400 (EDT)
Date: Mon, 14 Jul 2025 08:34:09 -0700
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
Subject: Re: [PATCH v7 2/9] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <aHUjcSI_r0rYdTwc@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-3-boqun.feng@gmail.com>
 <DBBOXLF23VVA.2T3U6GBOZ3Y20@kernel.org>
 <aHUJYTv4_wsatAw5@Mac.home>
 <DBBV9KHTEM3E.3T10KY9JN754X@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBV9KHTEM3E.3T10KY9JN754X@kernel.org>

On Mon, Jul 14, 2025 at 05:00:56PM +0200, Benno Lossin wrote:
> On Mon Jul 14, 2025 at 3:42 PM CEST, Boqun Feng wrote:
> > On Mon, Jul 14, 2025 at 12:03:11PM +0200, Benno Lossin wrote:
> > [...]
> >> > +declare_and_impl_atomic_methods!(
> >> > +    /// Basic atomic operations
> >> > +    pub trait AtomicHasBasicOps {
> >> 
> >> I think we should drop the `Has` from the names. So this one can just be
> >> `AtomicBasicOps`. Or how about `BasicAtomic`, or `AtomicBase`?
> >> 
> >
> > Actually, given your feedback to `ordering::Any` vs `core::any::Any`,
> > I think it makes more sense to keep the current names ;-) These are only
> > trait names to describe what operations do an `AtomicImpl` has, and they
> > should be used only in atomic mod, so naming them a bit longer is not a
> > problem. And by doing so, we free the better names `BasicAtomic` or
> > `AtomicBase` for other future usages.
> >
> > Best I could do is `AtomicBasicOps` or `HasAtomicBasicOps`.
> 
> But you are already in the `ops` namespace, so by your argument you
> could just use `ops::BasicAtomic` :)
> 
> I'm fine with `AtomicBasicOps`.
> 
> >> > +declare_and_impl_atomic_methods!(
> >> > +    /// Atomic arithmetic operations
> >> > +    pub trait AtomicHasArithmeticOps {
> >> 
> >> Forgot to rename this one to `Add`? I think `AtomicAdd` sounds best for
> >
> > No, because at the `AtomicImpl` level, it's easy to know whether a type
> > has all the arithmetic operations or none (also the `Delta` type should
> > be known). But I don't have opinions on renaming it to `AtomicAddOps` or
> > `HasAtomicAddOps`.
> 
> Ahh right yeah this makes sense. So let's use `AtomicArithmeticOps` if
> you insist on the `Ops` part.
> 

Done with AtomicBasicOps AtomicExchangeOps and AtomicArithmeticOps ;-)
Thank you!

Regards,
Boqun

> ---
> Cheers,
> Benno
