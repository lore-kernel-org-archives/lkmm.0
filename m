Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5602D4B53
	for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705767; cv=none; b=NPYDwY2EEHstfyeXGZLwfvubkar3tiHopJgrqGME79h8d8jfaQfu12wRWpNiIIOGjdUOG6eJUdfyNXjpQ/n/vHPUzU1h10VF3UWSL1VtsiHtDWmuL7sMZhJQKyFoKUAkA6IX30O/r6QgaV3tfmRkUs77gVJmd8tiSLots7/aKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705767; c=relaxed/simple;
	bh=3aUrTipdBM0DvG+bnkRlIqVvv9Fl0CJzrYFcGMsX7+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kcq32xGTd8N5MThI8ZqwJhb/dTJkKFt3WUtjpMrViaP4klCb2uZU+MdlRLEe3uZvflzUaO/RSlZ54OlZrkd34X18/BrxbyGw5jEqCaYTlCrsl4ki2f9BrtLGigFMnS3TcfBElAYmHvFxGMaZdbNUYkOP2vmEwTJLoZptX5Gd/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibsG2uP8; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibsG2uP8"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d098f7bd77so480221185a.0
        for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750705764; x=1751310564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sms7B4y2rI1NnoG8cKJvlxEFKP61lyDQPa3zPMR/0k=;
        b=ibsG2uP8+wHkjWzn72p/BXry7X4eVwe+FeDEiCsNzAP9+VITWDjbbV+/Bp4BAyebju
         bZ/9dQTmdLrYogQIhM7IB4MBvzRaMjUWvu1VCRkzz3bGe4pIcms6UUFVvt6z3HtKfLzv
         TYftBsksLjZc1Hn5YAir6XTjJ6uhInRmiUUqGsEAczSLlwbB1m37DVll+kWmXN+bo0cU
         aK/8BJMFyqSGxAQV/zLUXgoafrYNiVuzPOvolWIozeo6juFJ2+1H9banV57uqzlryyyA
         5wJ0/NS0pKAQUoA5p4sTtTnMzGQo7iAPlmEdFOHFWmTIuTeJFZUTHdC84eeO+eKGp8wl
         M4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750705764; x=1751310564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sms7B4y2rI1NnoG8cKJvlxEFKP61lyDQPa3zPMR/0k=;
        b=mf6iqcvhzqOV/kUil7emMSInc3LJ7vZFFHgNZhnP5NU2/ugYM7Lud9ueRaG8yn2Tze
         dQ7jJZ81LNVIiJehmRafQvafApLa5NP+zlMhoDiaS1TokSHe1rUHnsXoB9wvecQhAOqQ
         /jYTBWhPDzfT4050yL7fk+EajuTfC9duT+T9HmsiLEebaJxlzFGcZMq4cvubGn3Bqgq4
         kLhy372aEJZo31cuLqpbN34LYJ+x/vXIWSx31B4qtnAmioRnNdwwXs3MDGaWsVKcngqN
         X0Wh9PoH38fSxSmVaIP6avJSC8eBZelMZvPhjHNlbgeyklDY065Y2xGcMowxbyP5mQH7
         581g==
X-Forwarded-Encrypted: i=1; AJvYcCX3YaADIvF95O9TNXeWz8DHlX+xTW6Su7T3KfVFcQsvG7I2fPehnV6Ajvo7VEw8Ekbjgb4Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8+g1vIDS/qb4MKsRdCYbbGiJ8ba5GDKD26Na6AKpw7OWxL+F7
	uBTRnBseyuy0MqulQE4+k42h/vQJfr0xYI6hk/dvdqtW9o10/R9ow4Fc
X-Gm-Gg: ASbGnctcfo6VKCcWzOL9v+VW3vbP1Eq4rgnEsT23qwLbPnLaGGblaWf9/UOwTczIZWD
	XSzD4Fomi5PUClV32gNDagZIbZ2RNO4aXXzsRFCOlk3bRlZ8rb41Ws/GiawhJ87vwASoRSA+oRp
	rQv5najzBgoBye2u1kI34Xx0ICTu1sJCJK2DNRq0cl88gnWkbL6UuKx6lUA4d0MJ7andcpEKISI
	3X5CbDfy9PvCfGSmX2czkp3DqrJIRUEjPUqZ65dHWgNrKr5pAfzSYuAwvZSRorHRf/NVMUQGTPa
	EcIoRnOKmil4+HOkhJASFWxr+UPN+TDVpMmdZqX01pA00/u51dZSM5vnyncwFfeBR8Vt2m8l4tY
	VmkoYITD35S4HU/OvUfnDsvlIMzwqRSv3ili8FkR4ZNi+zh7LsTXO
X-Google-Smtp-Source: AGHT+IFY0SLaBFXkzJuI5EVp2A8p77EVAtcc7Ba+/G4JrsIRg5C2bcRBKquGlsSNvaGt38E2kEU+VA==
X-Received: by 2002:a05:620a:a811:b0:7d4:2f2:a44f with SMTP id af79cd13be357-7d41ec42108mr75415285a.23.1750705764284;
        Mon, 23 Jun 2025 12:09:24 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f9a06e6csm417860185a.107.2025.06.23.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:09:23 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03AC51200043;
	Mon, 23 Jun 2025 15:09:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 23 Jun 2025 15:09:23 -0400
X-ME-Sender: <xms:YqZZaO5SpQ3ZYuDdTaKH5kB30Vw-FyLc6Yo3ZNurN9fFUzDEgjGWdA>
    <xme:YqZZaH4_RHd_4UfZiShZ9a8h7m6h9NvzVMvq7sNUmSh6czwiF6R2HHQpAGpmd5DQl
    9rM5A_rNoo_rejFJQ>
X-ME-Received: <xmr:YqZZaNeUotxMrc1oYdOTAFQK3P-p0l5x5Il1IjTDHSUdb29ropMaFwlhjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmh
    hmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghh
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YqZZaLL1CfAXc78MDA_HThZsiJOPaWHUppguaQkdRm9DUhUflQQisg>
    <xmx:YqZZaCJNVz_4kAieWRiIGwQyaCPFGdUIRxabiWXcn4lQl5M6Kb2cUA>
    <xmx:YqZZaMz_tn-HXO3gMGH-g_JWzL0un4BBTs_BCC4F01eWizUo06qO_A>
    <xmx:YqZZaGLDafVPWyCiDz1UCxnuVGeU8PLYCdkkf8udWtei4dvkyceIAQ>
    <xmx:YqZZaJYJm6b2b0uOCNY-Kh5jD9JR1ggYaNpgaSRjWY1IN-OdIEc3h9f8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 15:09:22 -0400 (EDT)
Date: Mon, 23 Jun 2025 12:09:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <aFmmYSAyvxotYfo7@tardis.local>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <20250623193019.6c425467.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623193019.6c425467.gary@garyguo.net>

On Mon, Jun 23, 2025 at 07:30:19PM +0100, Gary Guo wrote:
> On Sun, 22 Jun 2025 22:19:44 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sat, Jun 21, 2025 at 12:32:12PM +0100, Gary Guo wrote:
> > [...]
> > > > +#[repr(transparent)]
> > > > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);  
> > > 
> > > This should store `Opaque<T::Repr>` instead.
> > >   
> > 
> > "should" is a strong word ;-) If we still use `into_repr`/`from_repr`
> > it's a bit impossible, because Atomic::new() wants to be a const
> > function, so it requires const_trait_impl I believe.
> > 
> > If we require transmutability as a safety requirement for `AllowAtomic`,
> > then either `T` or `T::Repr` is fine.
> > 
> > > The implementation below essentially assumes that this is
> > > `Opaque<T::Repr>`:
> > > * atomic ops cast this to `*mut T::Repr`
> > > * load/store operates on `T::Repr` then converts to `T` with
> > >   `T::from_repr`/`T::into_repr`.
> > >   
> > 
> > Note that we only require one direction of strong transmutability, that
> > is: for every `T`, it must be able to safe transmute to a `T::Repr`, for
> > `T::Repr` -> `T` transmutation, only if it's a result of a `transmute<T,
> > T::Repr>()`. This is mostly due to potential support for unit-only enum.  
> > E.g. using an atomic variable to represent a finite state.
> > 
> > > Note tha the transparent new types restriction on `AllowAtomic` is not
> > > sufficient for this, as I can define
> > >   
> > 
> > Nice catch! I do agree we should disallow `MyWeirdI32`, and I also agree
> > that we should put transmutability as safety requirement for
> > `AllowAtomic`. However, I would suggest we still keep
> > `into_repr`/`from_repr`, and require the implementation to make them
> > provide the same results as transmute(), as a correctness precondition
> > (instead of a safety precondition), in other words, you can still write
> > a `MyWeirdI32`, and it won't cause safety issues, but it'll be
> > incorrect.
> > 
> > The reason why I think we should keep `into_repr`/`from_repr` but add
> > a correctness precondition is that they are easily to implement as safe
> > code for basic types, so it'll be better than a transmute() call. Also
> > considering `Atomic<*mut T>`, would transmuting between integers and
> > pointers act the same as expose_provenance() and
> > from_exposed_provenance()?
> 
> Okay, this is more problematic than I thought then. For pointers, you

Welcome to my nightmare ;-)

> cannot just transmute between from pointers to usize (which is its
> Repr):
> * Transmuting from pointer to usize discards provenance
> * Transmuting from usize to pointer gives invalid provenance
> 
> We want neither behaviour, so we must store `usize` directly and
> always call into repr functions.
> 

If we store `usize`, how can we support the `get_mut()` then? E.g.

    static V: i32 = 32;

    let mut x = Atomic::new(&V as *const i32 as *mut i32);
    // ^ assume we expose_provenance() in new().

    let ptr: &mut *mut i32 = x.get_mut(); // which is `&mut self.0.get()`.

    let ptr_val = *ptr; // Does `ptr_val` have the proper provenance?

> To make things cost I guess you would need an extra trait to indicate
> that transmuting is fine.

Could you maybe provide an example?

Regards,
Boqun

> 
> Best,
> Gary
