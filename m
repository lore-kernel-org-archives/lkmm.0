Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA323AE9A
	for <lkmm@lists.linux.dev>; Sat, 16 Aug 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755360627; cv=none; b=mpChUMkqtS54rbCyPGXWBsxTwMgYXib0uHh5BxfMMBqtdNyURr0fat0Xt8aTCeW6AdGnjuVYxljquXxOqnqVbi2l82O0We5iQjaCxNHa5mqxaxHikuuAiDMTlpeqbTcjFL+1AQSP6/qE5QskyS7EigTEBzrzfsTRtQ/mZdxXqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755360627; c=relaxed/simple;
	bh=IUaTF+NFDqwsFAta5s9Kk+XUn0JlCEzmJ8Sm0Gdx7lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBwvdzHm6X/tI3xcFNfndo7rAltMP4nFSGAGi6cRBr1V9QRd0L+NWfB25a1PlHyeOEX6Hlh+vNOkwxJnreoOLmwzSawfJ9wysGPex8w/zCxCb6qaUKIKNdcEiVpxUFlZjMeF8DFdWzZpc5z7nsJlsIS0VIhrvdJ6ejAD5KGoap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flx9RHEG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flx9RHEG"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b0faa6601cso41251081cf.1
        for <lkmm@lists.linux.dev>; Sat, 16 Aug 2025 09:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755360624; x=1755965424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg/mieQTPz9vtPLm51BfuUqCjgPFftVnx3T2UKgvrvA=;
        b=flx9RHEGDBXPwKejRjM3eWxqVWHVkC39s3vNsgqw6zLsuLeUZujQFzKdqGajas98kd
         jlx+2SPq5TDA8Meiyi58qxL1aNuFJz+XXD2oYtdtdD37MCU8rZ6+ppvxid0cfUGjU8c/
         541Sc6B27LO1BT/EGA7lk+5Fc6LAw0BJHNSX937HCQFUrxN9wCxsktN5bqGtgW2R9TVl
         zgecefEtgiScarOPQianfmy3ScB9qWMYRt/nJyy9LKW3yge57WTTWlZ9QnRweF1OZgKh
         A7QXOWvzkMO1ZShtR3MO1niSD0ri2z4/QOTFNq0pw/sgcq8cDidcwShV1jWdiCNWscx4
         Clmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755360624; x=1755965424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg/mieQTPz9vtPLm51BfuUqCjgPFftVnx3T2UKgvrvA=;
        b=hKaGcND8PcLje47IHhNnH2yV/XkMcP9HjQrBYOlPaLBhSa4/CWdMApzLcSOfuJkIqA
         43sM8H9peuCiUgeFXhfR5R0AVqD91EQhGJGAfgx6ATlEbVDVOILswdtEYoaH3eecung+
         VNTVgpCt8cC6FSaIdWZxXO3W/4+Qz5gGosNMDh/6hkLoOLswDJAg4D/Ax8wAx8+Twaob
         2H87+9OtzYGvIaaaLzIiH94IoV5gHQRPtzBNtCrUWcAIeKyUVS3w6oyiOi3bgJaNL8ni
         65idZOHGk/zrvKfLomiSghpJvjl5I1mlq8jWTUDgs/p62dsiVvFUpjalM9ByGOtn0lGT
         I5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdRQcARGxjFBxGlXNw/mnH/6V0KPlGGaZY3PhefMDk09dbQjmLl72DI1QAax3A6eEEPmiE@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8p1LHYDJes+upDzv8GU7OM8l44fJ+vWQu0nHQYq/11BntwMsv
	N3VjLh/8WqwLMTCcpe8pMWTLZ9JdROZIB3HGbZoEuTeDeDwWeAPhKTIw
X-Gm-Gg: ASbGncvO+go2+9tdjkSheqOax9EdB8lvfwUGxK0OCNKzLyo1q6lhTaRUDpXEPuvmSf6
	QXVw4B1Bvvhj+AFj3eoFihXkn+EgvrfLObMxQRvgS4CGpLds6q5M//nF7PY0QAgIEK9lbDFYnxk
	RE5ilMWEdDb76EbaNUEfhAg9Bm80mMW4p1LrqExlJzQdbrUQRXqh74ptYhTAxv7qPYY24ie/tL7
	JQG7FTRPrmgrZAhEZWb+S91vD0y1u8WhT5flKw8MuRL4q0p0F/QkeUDc8WXWEftPVkP301sRZsh
	FYIU3AeJL6DQ+iUPva93+6Pg8Tp4oM1DgABo8WKo+Euv72Muq8Wt8RaG5Lbhemhrk9KGuQBDJGh
	hAuhT29xK5esa7AgpNn/bWV66Hv3ygY/4dyqTPTYAzckrdNfWkKc4wX0I4sWqudnjzVffuEw+6i
	/sigUlKZcG7lwPkBmsL6SlE+Hf4+FhUD2Q1Bre6GymqNd8
X-Google-Smtp-Source: AGHT+IFYZv5YRaAFBtbmtnhCh7ln4coorVbby1YEzxczCjIN9KAFBwrnQ0BFqfrw0CPvusbFLicOpA==
X-Received: by 2002:a05:620a:471e:b0:7e0:e2d7:e03 with SMTP id af79cd13be357-7e87db77a36mr791075485a.7.1755360624081;
        Sat, 16 Aug 2025 09:10:24 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1e15besm285785885a.72.2025.08.16.09.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 09:10:23 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id AED63F40066;
	Sat, 16 Aug 2025 12:10:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 16 Aug 2025 12:10:22 -0400
X-ME-Sender: <xms:bq2gaNHxhAgGhftN_kkXh6fkv-wcrpIEMLkBwD0RsnK249D7qN4lGw>
    <xme:bq2gaD0lWoZM1mgofjfuny5OIzW1CVDTuJC1C0ipALvkHHHZG8aYpWEDlFeSlbuiJ
    _0C457XnqjQXjlDEw>
X-ME-Received: <xmr:bq2gaDsIIrArzNPtDRIK8Fvka_GneNsyXW0RB408jXnPO5h4ZXvCGngaB4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeekjefhvddvheeftdevjeffudevhffgteeigeffgeegveefgfejhedvvdekueei
    gfenucffohhmrghinhepohhpvghrrghtihhonhhsrdhsrghfvghthienucevlhhushhtvg
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
X-ME-Proxy: <xmx:bq2gaCktOPYQOVH-9-aacjtfeVjpYoVpCH7CxcLqVh-daB-WdOqEZQ>
    <xmx:bq2gaBVoQTZXZLgY7od7Bu1-cfF8MbFlg2afyFBvs-7-gxynTEMEtw>
    <xmx:bq2gaGtFXJDY63JlhanCXkANLGTfFZejV_i6JaQRzy4qkXxPHmtWnQ>
    <xmx:bq2gaEq6_HWq5SxvoWdSbzvtCuIfbhvWJOR130adu-LiLBW1glexnA>
    <xmx:bq2gaL6u3zFp2kb9yWPCPqqExMGSsMkWLCw1A-l0_vaoGT0vR_LVvW6y>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Aug 2025 12:10:22 -0400 (EDT)
Date: Sat, 16 Aug 2025 09:10:21 -0700
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
Message-ID: <aKCtbSDuJNrtdLNp@tardis-2.local>
References: <20250719030827.61357-1-boqun.feng@gmail.com>
 <20250719030827.61357-7-boqun.feng@gmail.com>
 <DC0AKAL1LW84.MR2RFTMX1H61@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC0AKAL1LW84.MR2RFTMX1H61@kernel.org>

On Tue, Aug 12, 2025 at 10:04:12AM +0200, Benno Lossin wrote:
> On Sat Jul 19, 2025 at 5:08 AM CEST, Boqun Feng wrote:
> > One important set of atomic operations is the arithmetic operations,
> > i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
> > make senses for all the types that `AtomicType` to have arithmetic
> > operations, for example a `Foo(u32)` may not have a reasonable add() or
> > sub(), plus subword types (`u8` and `u16`) currently don't have
> > atomic arithmetic operations even on C side and might not have them in
> > the future in Rust (because they are usually suboptimal on a few
> > architecures). Therefore the plan is to add a few subtraits of
> > `AtomicType` describing which types have and can do atomic arithemtic
> > operations.
> >
> > One trait `AtomicAdd` is added, and only add() and fetch_add() are
> > added. The rest will be added in the future.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 

Thank you!

> > ---
> >  rust/kernel/sync/atomic.rs           | 93 +++++++++++++++++++++++++++-
> >  rust/kernel/sync/atomic/predefine.rs | 14 +++++
> >  2 files changed, 105 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 793134aeaac1..e3a30b6aaee4 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -16,7 +16,6 @@
> >  //!
> >  //! [`LKMM`]: srctree/tools/memory-model/
> >  
> > -#[allow(dead_code, unreachable_pub)]
> >  mod internal;
> >  pub mod ordering;
> >  mod predefine;
> > @@ -25,7 +24,7 @@
> >  pub use ordering::{Acquire, Full, Relaxed, Release};
> >  
> >  use crate::build_error;
> > -use internal::{AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
> > +use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
> >  use ordering::OrderingType;
> >  
> >  /// A memory location which can be safely modified from multiple execution contexts.
> > @@ -115,6 +114,18 @@ pub unsafe trait AtomicType: Sized + Send + Copy {
> >      type Repr: AtomicImpl;
> >  }
> >  
> > +/// Types that support atomic add operations.
> > +///
> > +/// # Safety
> > +///
> > +/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
> 
> Can you add a normal comment TODO here:
> 
>     // TODO: properly define `wrapping_add` in this context.

Yeah, this sounds good to me. How do you propose we arrange the normal
comment with the doc comment, somthing like:

    // TODO: properly define `wrapping_add` in this context.
    
    /// Types that support atomic add operations.
    ///
    /// # Safety
    ///
    /// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
    ...
    pub unsafe trait AtomicAdd<...> {
        ...
    }

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
> 
> > +/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
> > +/// yield a value with a bit pattern also valid for `Self`.
> > +pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
> > +    /// Converts `Rhs` into the `Delta` type of the atomic implementation.
> > +    fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
> > +}
> > +
> 
