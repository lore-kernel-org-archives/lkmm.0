Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D9275AF7
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163035; cv=none; b=q/iHO/cXjdl4Qt+oWBj7I8jRtuTfCHVT7s9RP/S8+DOA9aI6o4DJPwUiH7kx+4pOGghhnaRDIg1qGe0o1ApF4ic1gZwPRClujYOHe1fEUM8L9mSarDrUY85AAQPfZ0AWDrz6VvkV0RrB7ZxyENye5QCxflNBVtMprNxxj19d4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163035; c=relaxed/simple;
	bh=+mABmYXOeNV8mM9HnoSX6J6gUSDBDbFmr1UdHiOlW5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THPzJniAWSRJg2BsVuJW5uhui9ZHz+gINbygGLQCrx6NJX0KvmlL7YEzJADYtef9QXY3Gnr7NgHYu6ITpssqw8qzmiCOez3/xc7w+cs21hUzMhMKHL00Wt6sbBPXeHzuHbgs9Rz4vqN8fOJosQOmQ7uph1z4cFvDCJCx/h6kRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWlgwkfv; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWlgwkfv"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d45f5fde50so111857685a.2
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 08:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752163033; x=1752767833; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TrK7hCfWutY70p0zkUOMvAeOn+WmB0RO4OTHpoohBs=;
        b=CWlgwkfvQoeee87Pp2buFmldZzRj+zKZIK2nOeLtQUnwNTHc2zPhkvCWmqwtmro5o8
         Nx+FagxSDC1BC/GI993RP2wzabhi+pm1AN/F9VI7ExRS2jIETH2dN0Qm403cLVIZbETC
         +WrAMsSrEbh79UFtfq9TEknbRBeI75Bng73WNYkEp6xJgQ76youcjmyyRMVhCouFIOs4
         Dg43mgk4o1PgAqvti7U+Pb1xMtuwv7EH24dcf4zRLmprnjW0AU4PciuXQesK3KXeD/zm
         5zy3fyoOyCryUjV5LKBC0tvbP3K4Kb8w+AWE6O3bjPE8h4RoUd5QxLzVeq695Lp54aK1
         AyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163033; x=1752767833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TrK7hCfWutY70p0zkUOMvAeOn+WmB0RO4OTHpoohBs=;
        b=dWzZ79xeFJ18WKpprpdPYeWY4bJiQuV0yBCbRT77KPpvkflmz9LZPuQ3OVfmnlBVVY
         BBr75cvg5FT7o7ZBBPdM4grBtwU6dmQkKWffMbW+7Cv8zbIAUsbdZhKIJcdZYqTvhRaB
         lU0qnCiso7ifGtVyG48dB/uvQ6MNQQCygysfqKiIWMCURDdYGKT+wZ0eZtVn80RyRPnI
         YAy43nBm5BcgnejlXg0RUCb64BDVysG0tSIKg4O0Kvr4n5MOETtvCpfRrcOPHz9t7YVm
         94YkxtNoO0pLuaIrRaR7YfLmpLuQK8fT1yueZGgYk+kf/83MZw5Z1Pr2rixl950KO+hD
         KWVw==
X-Forwarded-Encrypted: i=1; AJvYcCWPIyepYfNDJhpBIZYVkjck+1X4udANgNre7VQQq9HbBQZoa5SQE+uxE6s9Z6QpJRmSGohM@lists.linux.dev
X-Gm-Message-State: AOJu0YzGAPM4pydBWfKwt9jbFZr1huBDmKCHUOsByOgkQei+hWaZVRrp
	sKAnDj8DavLjOgPMTeG3eXatnBhlptyzbeDHkknwCk1RfRxoOpObtLZm
X-Gm-Gg: ASbGncvjR14U1xuSynPSYbz6Fl8SLSZUPxskoO4tUwBo4j8Hp7o5YJK6+UoEnqQw0fD
	SB6H7f7lu5f90yDlXUOXyjJ4OknGRSY2m2C4fBb/rfuTk14bTbOjXkxR8cs3RRYdf1idDbXLBv0
	bVd1dy6udSicn1F2W2aufyMQEKqoR6RfrWAEzZVrW7Sp1s1YcTPL+Zcx9b4VzrrAAzAf6RHhAzf
	LtWjq0I1WR2wrb056XuUUQyBmvtPWUy/mpfvKqNhYMOst+OkzUZ1e3RoPZvEcfgJ2QZYDKF5ZPO
	kPjho48YANnS0lg40F+YUk5GYJdtkYehtcmbJW0SHSnBw0ZzcPTznggF4Fp2X762dESjGzhtQsv
	JrBTV+iElvJD6XOvu5+eRLowYlIMoHoWQ2frqg/Luepgd+5X9SdZa
X-Google-Smtp-Source: AGHT+IFo5HxxuRZ6u/J4mgSOUZlvRs5fgOEFkl8u0k1/U/qjbOqofWDsz0TnG4Ksq/SUnO8IHLWzvQ==
X-Received: by 2002:a05:620a:2906:b0:7c5:962b:e87c with SMTP id af79cd13be357-7dded1f04ddmr2015685a.44.1752163032749;
        Thu, 10 Jul 2025 08:57:12 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdbb079eesm110174985a.17.2025.07.10.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:57:12 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9F1A0F40066;
	Thu, 10 Jul 2025 11:57:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 10 Jul 2025 11:57:11 -0400
X-ME-Sender: <xms:1-JvaG3YDd-0_A6g6b4Gbf8FEuPVgU0NxEniHcMQlz7zsEPsm7ra3g>
    <xme:1-JvaKl9pL1Nt-udWykYtO-WFqG6oFZJY8soHK-j_LlIN93qssLYwKIE8Yct8WvR4
    suxhyODHd3oI4GiIA>
X-ME-Received: <xmr:1-JvaDe2yjEjJvvdykzVaF_sTJ9FldzzDXJBV3wq76wXTWIdxxPb57xgkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlih
    hnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:1-JvaHWpqqP39ns8iX2QesksUcEImbUsie36qAkqad4a0lYDViwfuw>
    <xmx:1-JvaHGcvGlxRvDKt50S3P_H53q7ShTh3mE3Wh--AXWPGvGmAFmNBA>
    <xmx:1-JvaJc4rDlhruJUoTeas9x1kPn1_quLXTUh3gKR5ND2XN6_36HqiA>
    <xmx:1-JvaAbMELaLB8Vdfebc7b33lZ4OY60-7NtHJhYnbqEAG5w7V_vylg>
    <xmx:1-JvaMojquPgJlEe8muVgwWgLwNU6uDTQeyFturzlSlCOv15QvNqedFR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 11:57:10 -0400 (EDT)
Date: Thu, 10 Jul 2025 08:57:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Subject: Re: [PATCH v6 3/9] rust: sync: atomic: Add ordering annotation types
Message-ID: <aG_i1aQhkBa6k8JZ@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-4-boqun.feng@gmail.com>
 <4Ql5DIvfmXBHoUA428q2PelaaLNBI5Mi0jE3y3YPObJLRgY73zNZzQ8Pdl2qq25VWsMQFKUpYRHHQ1e7wFaGUw==@protonmail.internalid>
 <DB8BTA477Z2V.1J7XFLDXHMN2S@kernel.org>
 <87v7o0i7b8.fsf@kernel.org>
 <aG_RcB0tcdnkE_v4@Mac.home>
 <DB8GUTJA9QU1.X112WTV7ABZN@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8GUTJA9QU1.X112WTV7ABZN@kernel.org>

On Thu, Jul 10, 2025 at 05:05:25PM +0200, Benno Lossin wrote:
> On Thu Jul 10, 2025 at 4:42 PM CEST, Boqun Feng wrote:
> > On Thu, Jul 10, 2025 at 02:00:59PM +0200, Andreas Hindborg wrote:
> >> "Benno Lossin" <lossin@kernel.org> writes:
> >> > On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> >> >> +/// The trait bound for annotating operations that support any ordering.
> >> >> +pub trait Any: internal::Sealed {
> >> >
> >> > I don't like the name `Any`, how about `AnyOrdering`? Otherwise we
> >> > should require people to write `ordering::Any` because otherwise it's
> >> > pretty confusing.
> >> 
> >> I agree with this observation.
> >> 
> >
> > I'm OK to do the change, but let me show my arguments ;-)
> >
> > * First, we are using a language that supports namespaces,
> >   so I feel it's a bit unnecessary to use a different name just because
> >   it conflicts with `core::any::Any`. Doing so kinda undermines the
> >   namespace concepts. And we may have other `Any`s in the future, are we
> >   sure at the moment we should keyword `Any`?
> 
> I don't think `Any` is a good name for something this specific anyways.

Well, that's the point of namespace: providing contexts for a name, and
the contexts can be very specific. I'm sure we both have used "any" in
English to refer something specific ;-)

> If it were something private, then sure use `Any`, but since this is
> public, I don't think `Any` is a good name.
> 

This essentially means we keyword `Any` as a public trait name, then we
should document it somewhere, along with other names we want to keyword.

Regards,
Boqun

> > * Another thing is that this trait won't be used very often outside
> >   definition of functions that having ordering variants, currently the
> >   only users are all inside atomic/generic.rs.
> 
> I don't think this is a good argument to keep a bad name.
> 
> > I probably choose the `ordering::Any` approach if you guys insist.
> 
> I don't think we have a lint for that, so I'd prefer if we avoid that...
> 
> Someone is going to just `use ...::ordering::Any` and then have a
> function `fn<T: Any>(_: T)` in their code and that will be very
> confusing.
> 
> ---
> Cheers,
> Benno
