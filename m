Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74E1B78F3
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752158582; cv=none; b=b9e11KAXiCEij1YBIYyHc9zJ5y2XbyQImIO5rXilJTmg88SIiG6hwgb9C80f4s6YZtQCH/WKBLS+9xUIHxfCpgwU10QO5qr2TnV2O013kpODSSAEFHrw/H0pzzjEOKH82Ky6harrMWLvtnUxreqfNT1Bhp/VJcoKEgVIHzXeYAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752158582; c=relaxed/simple;
	bh=5szyi6yH0oGGrfKIg9Xi5xiZ5wKO/TDCmsZjQgVklsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT7mKNZssvShnCQzYuYin1tTJEAZvBksjuHXufTdxiNxYX/FP/HlPtCsbp7zLSkZ06Dl40MLGFjfOjxEKsa0KqcoCPt0IPloEUS4IhBetMJ9nuivlXSPrOiklMFEkQmOYGnB9xQhjEpg7lZ8zCvQ/RkvDK/oE7iH6NUyyVUUg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6vfZuCp; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6vfZuCp"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6face367320so9451916d6.3
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752158580; x=1752763380; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4R+5ty4AWv2gsK8CU8Hv/60eryRGjAiYmsZeghCD00=;
        b=V6vfZuCpApuqblsZGz3/BvAQ3tWefRfVP3KlxA0iLBVOzEFbKQ8eVK0+M2VkKdRPMO
         KPdXd5epsYG9tILGfBSxEAVVh2rWN5wlNQ7cMoCyxHWlMTyics6FxGIR/zvgg+/jvKC5
         VyY9y0jaG6B6eYb2e7OCFq5wwQaDxuLSquHDqNYJ6ElYfjCRuw7bGrVkPdCeRHpx4HGC
         JT6hlC+jeAKh9/P2TgcFsa3NTmK/PFMlsnwf5rx6rV5jZg3du8jzlDxRKYWNPxLYnTNF
         kHkS/USTJUnicLW9mbUrqNC3AMoYXCKBJNJfHY6q3Y/DKrLpBsqC6+KA0RqGSlyBdMi9
         kfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158580; x=1752763380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4R+5ty4AWv2gsK8CU8Hv/60eryRGjAiYmsZeghCD00=;
        b=KBLEZMMR4fgHUZlK83IZ6QUlfddGZg14we8JuJR0WW+3ubFDIUv7yQJUPSPU8aGvRL
         vc0BGAIwLU2mrh16KRmVhSm7GsP46IYkTB/xYLTdqDN/jvhyIEr+YZaVshpXusbSHDpK
         f84AxTHIlLijcCG7US5k+lxTuyMEqdORe7d3B5WyMRg0sYlukONRwvO1MPKR5uZzz+8b
         PICv2SYS7xx6RH/ee1DsCDlpvMKQiGfmpuOVK9OWFMbEzainb17X60eCGcDpy/asQMO4
         /c7OFHUbyCnZQK7556/ma3a5Wiwr48pEh/JoGlujOVXQCVyVRy/5oGnOUuJiJqiqVM9+
         3BeA==
X-Forwarded-Encrypted: i=1; AJvYcCXTkgIGZhNhU3aJmvt5yYEafDucLb+SlhfJsuXMkqEmmx+ceGUqp3ib9iLqrewX4bAN0YWE@lists.linux.dev
X-Gm-Message-State: AOJu0YxFOkQ8YIEMkHARzEuKNAVDUsSjbg/qBIji8G0wXpeR68QuiNAo
	ni0zMIlRRX9seVIPfxZ/1iMJtKdt7XErABy5sC6GEXcAcSo9tkPSmgjJ
X-Gm-Gg: ASbGncvX7SS/EmPSEhoYgy7wOGY3pJSGGckZ6WGXDQ6iYkPPJzPceFoKXRnCruEBfh/
	/vEFCzRpxNIXur4nscVIgC9pBmkYmhPoi49F7xu7ONzvYCu009josjMUy4oSg3XeAa+DmssRinh
	GR8Olrid+amRgt41rIjbgDSwrA/vC9W8xTvz7jv+VEW8he7mn5lBIK50vbX3B+XHKqt0vkJxl74
	2sqPVqyaOOIGV5SQUTQE7KYYcczGYhmpCNUQ4SIXBNBTDPL1SBSKhht/EWIKw5EOEt0KENErSTs
	k37zfdjBWX26zsmfWbyDlLXIO+E2ZrDex3EphmnDbwNdylMGr6SsMSj9UpmvUIbIkvFATEK0UNR
	g4eMjWjCGjWzWKtdeKoO+A0lsVSkQ8ErQG9UX3SScODWI763CnF95
X-Google-Smtp-Source: AGHT+IGI9wrJlk/EdUfzrnlCQdEcpgrX6ATeWyNj8eMASX/i9ZN1VLo/n+ONfa1cHmdrIXJcsnr9cg==
X-Received: by 2002:a05:6214:4015:b0:6fb:5f97:510f with SMTP id 6a1803df08f44-7049506ab79mr54563026d6.44.1752158579491;
        Thu, 10 Jul 2025 07:42:59 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497dcfc37sm8761616d6.115.2025.07.10.07.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:42:59 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 524EFF40067;
	Thu, 10 Jul 2025 10:42:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 10:42:58 -0400
X-ME-Sender: <xms:ctFvaAcE0iyTokvcj511T3GmrdPd12ZhuaIp6jzMZ4lL4EI73Vsa3w>
    <xme:ctFvaDtqT9dkquEesECpobe1DIsR3AMO4gzuMpqX4BF5DaGpvuHO680seBbsUow1T
    k-Xx6HPw13mXOmE3A>
X-ME-Received: <xmr:ctFvaGGctGKiFLg56nZeqHmXGhiSenZf9gEPnMEs0LX_inggxd56PBRFww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehloh
    hsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlih
    hnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:ctFvaFdlwzav-bMXb6DU3p5OMDDaBu6zYT4n09Dg6KyC6BpaTQ2ufw>
    <xmx:ctFvaKunaXRztOHCjPKQIQUqTpzdkw05qe7fEqzODp_3hlqV1ZZewg>
    <xmx:ctFvaEkc6OKIzkTs6cP7sNAmZxzY7Z0pXF-QEFBAmzJ1kmHM_pgncw>
    <xmx:ctFvaNCqOtcdGugFVUn0bTcYLYGE5JfFgr9eNYz5Kp7SwJ3B0ntc7A>
    <xmx:ctFvaMx73y5lXNEzdvWTfjWGV9hlBQSccSHDi-o4dFNhhkoabp-dwiRQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 10:42:57 -0400 (EDT)
Date: Thu, 10 Jul 2025 07:42:56 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
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
Message-ID: <aG_RcB0tcdnkE_v4@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-4-boqun.feng@gmail.com>
 <4Ql5DIvfmXBHoUA428q2PelaaLNBI5Mi0jE3y3YPObJLRgY73zNZzQ8Pdl2qq25VWsMQFKUpYRHHQ1e7wFaGUw==@protonmail.internalid>
 <DB8BTA477Z2V.1J7XFLDXHMN2S@kernel.org>
 <87v7o0i7b8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7o0i7b8.fsf@kernel.org>

On Thu, Jul 10, 2025 at 02:00:59PM +0200, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
> 
> > On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> >> Preparation for atomic primitives. Instead of a suffix like _acquire, a
> >> method parameter along with the corresponding generic parameter will be
> >> used to specify the ordering of an atomic operations. For example,
> >> atomic load() can be defined as:
> >>
> >> 	impl<T: ...> Atomic<T> {
> >> 	    pub fn load<O: AcquireOrRelaxed>(&self, _o: O) -> T { ... }
> >> 	}
> >>
> >> and acquire users would do:
> >>
> >> 	let r = x.load(Acquire);
> >>
> >> relaxed users:
> >>
> >> 	let r = x.load(Relaxed);
> >>
> >> doing the following:
> >>
> >> 	let r = x.load(Release);
> >>
> >> will cause a compiler error.
> >>
> >> Compared to suffixes, it's easier to tell what ordering variants an
> >> operation has, and it also make it easier to unify the implementation of
> >> all ordering variants in one method via generic. The `TYPE` associate
> >> const is for generic function to pick up the particular implementation
> >> specified by an ordering annotation.
> >>
> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> >
> > One naming comment below, with that fixed:
> >
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> >
> >> ---
> >>  rust/kernel/sync/atomic.rs          |  3 +
> >>  rust/kernel/sync/atomic/ordering.rs | 97 +++++++++++++++++++++++++++++
> >>  2 files changed, 100 insertions(+)
> >>  create mode 100644 rust/kernel/sync/atomic/ordering.rs
> >
> >> +/// The trait bound for annotating operations that support any ordering.
> >> +pub trait Any: internal::Sealed {
> >
> > I don't like the name `Any`, how about `AnyOrdering`? Otherwise we
> > should require people to write `ordering::Any` because otherwise it's
> > pretty confusing.
> 
> I agree with this observation.
> 

I'm OK to do the change, but let me show my arguments ;-)

* First, we are using a language that supports namespaces,
  so I feel it's a bit unnecessary to use a different name just because
  it conflicts with `core::any::Any`. Doing so kinda undermines the
  namespace concepts. And we may have other `Any`s in the future, are we
  sure at the moment we should keyword `Any`?

* Another thing is that this trait won't be used very often outside
  definition of functions that having ordering variants, currently the
  only users are all inside atomic/generic.rs.

I probably choose the `ordering::Any` approach if you guys insist.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
