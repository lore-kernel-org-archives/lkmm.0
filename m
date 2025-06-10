Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9493223C501
	for <lkmm@lists.linux.dev>; Tue, 10 Jun 2025 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576661; cv=none; b=JmmQrCXgCBLAhmE6htphK99ii2BhSs/Z6rHhtWso37RdKquEonSy2k1DFFwPmnuy+I0f+yGV5fcHEvQtjz0KIXe0fDftdFO5H6oZNsunkTjSWXA9PNzQ4RJxBQ6iayvQGfEhoAVnvgMl6OxbdODMcLlsPEijEJCOr9YnpJ6IurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576661; c=relaxed/simple;
	bh=0NiHXbG4vYgb34rXAoH4moQ99hl+z8icp5lnTGEVaII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUaYWNjUzfEXyEJDK3VTTcCPOUf5nIvFtaNQ1Qx+ceSKollu0x6ZWNaB7/oO9Mu1hoeBby1i76mhN7vh/X2vcuTdJnLsGDWPkfkJbUEq+AOWNIEXjCoAsCptxc/nrGsadoWusbeotYiYIFhz8dpVDMqE1+YywVuWOGtBDCoe0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbFunvtm; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbFunvtm"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so21260406d6.2
        for <lkmm@lists.linux.dev>; Tue, 10 Jun 2025 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749576658; x=1750181458; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJdykh2EXzW6mCPNCtZcUijMyr6QYBWb9z7jw/427yo=;
        b=ZbFunvtmk+VqX8fuu+hckn8yUGIApOe4cf4GNpYlO8yrFLMGp0ATM5WVwrFCl2Ivaa
         XkiGJjEpNEUZ3gxTc8sDV73pWL/CTQdaNfmonuBZoigAwxXKoEwJncjtp4K2zjIpHq1V
         CFP8fUD274fdIsu7Bh3BGpvqflzp0sqhUtuA8r9Ve7thlHFs0sFacKwZn0rp+JtKPCCb
         uwKjNdFiBZD3RHqDpv1qi3fHR0W+MYMl9+hPEyIiMM7Xg8XWMTDBYO5+caf2uxTnLRTO
         oxXXPL0TmTXYTcoCUR5gOZrGs+WihQnWVG+qr4x/a2XDRQf8Z5ULUFoGxosEt17olFts
         J9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576658; x=1750181458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJdykh2EXzW6mCPNCtZcUijMyr6QYBWb9z7jw/427yo=;
        b=iDWB6P/U/8dpoQvvMSYtzKWsIHFah73XsBhDXp7dbBahUEgMcoV09gGWSSBntlgAUN
         lKS2bJe4Yrio6wl10jUOxGyEASAiVcWCSnnxJG5wyF5p7UGorLPt8WTkHFr+pyx24kQH
         Tiooh7EyAzJyEooUYQOSJTO/QHZU4OLkq3NWE1XgmdYh8eaJ5ovpvmp9BjPPc+ZevxG2
         HId1MoFhzBg+i1frDHpEStCcfMyb8jz/VOXjeiZVkNpbNC4Ypotp8Gl713UDOMZP73y2
         wCNNaSXH0vHC0xdZerw7mt3PRkjZuxkZUcKUPZ7Z9JHQroScPnlRoIO6NJKlDLO/ybvb
         gMuA==
X-Forwarded-Encrypted: i=1; AJvYcCUL7IRiIoYvTa0CDrVaA0Jr3/+5T8xeisq4wq6+oae40WBA9Gju7wY3neGW1xN4KwyBV9K9@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6rmRDzdcY37gXWNL0otW56pBhSRNU6rcs9520NTqiiUjL6qVf
	NdLV5FntgGbIirVukushnZ0wrSaYDj3+a7YhfMoM8zXwpm+HfNstmOg7
X-Gm-Gg: ASbGncsUKlP/TEj4wYyL9Ys3HJiSlZ6OvfsSJsjobq750HqXe8M876nxw9yftaoYh7u
	Sb02R+iwQ5sjLoQmqXv44Z1fIy/rqWPFKPJSVQkjqrZTnYJmnIAfKaKNT7UE1Z99A3RvjD1SolP
	8lEP5vjy95WZifjxJc/nMDjwf/iTqEL7A63J341EdLytHvq9vUQwELLsjR/vx4x7vKqlyCjIge/
	XH7VI6njlvgBRia3sIYDcqG/AF+U7K1I4T1Fm09rZMp8NCAEmr3tn45LxqdiuBosflpA3c8S4FU
	42IEkz455vV+QlQZDDj0J60ADVFwUYUoORXnNyOxOuuP3P1O4raZoimPvsHxN1ZHKz00IPJZCNf
	VMjergmZo8cPkj+IdKMLGEOt4uLMHDnIFiaizGsqyM7ZOyanM8T3SwA74WQ/AFDQ=
X-Google-Smtp-Source: AGHT+IGeesgQ5STX3VBjTboY2m69/yDnUInxC81+kPGTrT4lMFU1EFCkk1W39S/XN0uHx1OdE8hWAw==
X-Received: by 2002:a05:6214:2249:b0:6fa:c81a:6230 with SMTP id 6a1803df08f44-6fb2c32dd04mr3967336d6.12.1749576658310;
        Tue, 10 Jun 2025 10:30:58 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab9595sm69151066d6.6.2025.06.10.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:30:57 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D9BA1200068;
	Tue, 10 Jun 2025 13:30:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 10 Jun 2025 13:30:57 -0400
X-ME-Sender: <xms:0GtIaHB6Vr7mjToj7PrcMCK9OiM_1Orfw8q-3HLYPCJppAWQvEhrhA>
    <xme:0GtIaNjdCARYN74EEBH3aUJGajYLai2_KWYCIcJVMduy-oYIM0nSzphtAShiHEA6e
    xdFlE142PBjE2FBiw>
X-ME-Received: <xmr:0GtIaCndlnnuX-PbRx-KjKBl1o8XzKOhe_2_EIVUAX5IS8yKgWAM3npYRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduuddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgr
    hihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhord
    hnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:0GtIaJxsngQY-Wo97-J4weFuu2li-Rk-PhtWI_5liMIwmczLZDkSJA>
    <xmx:0GtIaMQqHPFytiFA8z4PiryLpxM-KYy4OX6mIY2v9f0Vf2cdGJI6zA>
    <xmx:0GtIaMbpAN37rvx4sbuv16QVHY1ssjJHPXKiYc_y-cg3THQNk6IK7A>
    <xmx:0GtIaNT-kJQOzSft0Y9H44tfX1zDeiyWZDc4cFfuk7jS08PxlrJ4aw>
    <xmx:0WtIaCDFz1L5yRdSwEpquOmtDJ6e5-zuYpGGeQD5ciY0a3PRhy-KAYHH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 13:30:56 -0400 (EDT)
Date: Tue, 10 Jun 2025 10:30:55 -0700
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 03/10] rust: sync: atomic: Add ordering annotation
 types
Message-ID: <aEhrzxltkdnub_bR@tardis.local>
References: <20250609224615.27061-1-boqun.feng@gmail.com>
 <20250609224615.27061-4-boqun.feng@gmail.com>
 <DAIQG9ALK4QC.2P2C2MC4U9YVX@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAIQG9ALK4QC.2P2C2MC4U9YVX@kernel.org>

On Tue, Jun 10, 2025 at 11:07:16AM +0200, Benno Lossin wrote:
> On Tue Jun 10, 2025 at 12:46 AM CEST, Boqun Feng wrote:
> > Preparation for atomic primitives. Instead of a suffix like _acquire, a
> > method parameter along with the corresponding generic parameter will be
> > used to specify the ordering of an atomic operations. For example,
> > atomic load() can be defined as:
> >
> > 	impl<T: ...> Atomic<T> {
> > 	    pub fn load<O: AcquireOrRelaxed>(&self, _o: O) -> T { ... }
> > 	}
> >
> > and acquire users would do:
> >
> > 	let r = x.load(Acquire);
> >
> > relaxed users:
> >
> > 	let r = x.load(Relaxed);
> >
> > doing the following:
> >
> > 	let r = x.load(Release);
> >
> > will cause a compiler error.
> >
> > Compared to suffixes, it's easier to tell what ordering variants an
> > operation has, and it also make it easier to unify the implementation of
> > all ordering variants in one method via generic. The `IS_RELAXED` and
> > `ORDER` associate consts are for generic function to pick up the
> > particular implementation specified by an ordering annotation.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Looks good, I got a few comments on the details below.
> 

Thanks for taking a look!

> > ---
> >  rust/kernel/sync/atomic.rs          |  3 +
> >  rust/kernel/sync/atomic/ordering.rs | 94 +++++++++++++++++++++++++++++
> >  2 files changed, 97 insertions(+)
> >  create mode 100644 rust/kernel/sync/atomic/ordering.rs
> >
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 65e41dba97b7..9fe5d81fc2a9 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -17,3 +17,6 @@
> >  //! [`LKMM`]: srctree/tools/memory-mode/
> >  
> >  pub mod ops;
> > +pub mod ordering;
> > +
> > +pub use ordering::{Acquire, Full, Relaxed, Release};
> > diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
> > new file mode 100644
> > index 000000000000..14cda8c5d1b1
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/ordering.rs
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Memory orderings.
> > +//!
> > +//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
> > +//!
> > +//! - [`Acquire`] and [`Release`] are similar to their counterpart in Rust memory model.
> > +//! - [`Full`] means "fully-ordered", that is:
> > +//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
> > +//!   - It provides ordering between the annotated operation and all the following memory accesses.
> > +//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
> > +//!     accesses.
> > +//!   - All the orderings are the same strong as a full memory barrier (i.e. `smp_mb()`).
> 
> s/strong/strength/ ?
> 

Good catch.

> > +//! - [`Relaxed`] is similar to the counterpart in Rust memory model, except that dependency
> > +//!   orderings are also honored in [`LKMM`]. Dependency orderings are described in "DEPENDENCY
> > +//!   RELATIONS" in [`LKMM`]'s [`explanation`].
> > +//!
> > +//! [`LKMM`]: srctree/tools/memory-model/
> > +//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
> > +
> > +/// The annotation type for relaxed memory ordering.
> > +pub struct Relaxed;
> > +
> > +/// The annotation type for acquire memory ordering.
> > +pub struct Acquire;
> > +
> > +/// The annotation type for release memory ordering.
> > +pub struct Release;
> > +
> > +/// The annotation type for fully-order memory ordering.
> > +pub struct Full;
> 
> Is this ordering only ever used in combination with itself? (Since you
> don't have a `FullOrAcquire` trait)
> 

Yes, `Full` is an ordering that is stronger than `Acquire`.

> > +
> > +/// The trait bound for operations that only support relaxed ordering.
> > +pub trait RelaxedOnly: AcquireOrRelaxed + ReleaseOrRelaxed + All {}
> > +
> > +impl RelaxedOnly for Relaxed {}
> > +
> > +/// The trait bound for operations that only support acquire or relaxed ordering.
> > +pub trait AcquireOrRelaxed: All {
> > +    /// Describes whether an ordering is relaxed or not.
> > +    const IS_RELAXED: bool = false;
> > +}
> > +
> > +impl AcquireOrRelaxed for Acquire {}
> > +
> > +impl AcquireOrRelaxed for Relaxed {
> > +    const IS_RELAXED: bool = true;
> > +}
> > +
> > +/// The trait bound for operations that only support release or relaxed ordering.
> > +pub trait ReleaseOrRelaxed: All {
> > +    /// Describes whether an ordering is relaxed or not.
> > +    const IS_RELAXED: bool = false;
> > +}
> > +
> > +impl ReleaseOrRelaxed for Release {}
> > +
> > +impl ReleaseOrRelaxed for Relaxed {
> > +    const IS_RELAXED: bool = true;
> > +}
> > +
> > +/// Describes the exact memory ordering of an `impl` [`All`].
> > +pub enum OrderingDesc {
> 
> Why not name this `Ordering`?
> 

I was trying to avoid having an `Ordering` enum in a `ordering` mod.
Also I want to save the name "Ordering" for the generic type parameter
of an atomic operation, e.g.

    pub fn xchg<Ordering: ALL>(..)

this enum is more of an internal implementation detail, and users should
not use this enum directly, so I would like to avoid potential
confusion.

I have played a few sealed trait tricks on my end, but seems I cannot
achieve:

1) `OrderingDesc` is only accessible in the atomic mod.
2) `All` is only impl-able in the atomic mod, while it can be used as a
trait bound outside kernel crate.

Maybe there is a trick I'm missing?

> > +    /// Relaxed ordering.
> > +    Relaxed,
> > +    /// Acquire ordering.
> > +    Acquire,
> > +    /// Release ordering.
> > +    Release,
> > +    /// Fully-ordered.
> > +    Full,
> > +}
> > +
> > +/// The trait bound for annotating operations that should support all orderings.
> > +pub trait All {
> > +    /// Describes the exact memory ordering.
> > +    const ORDER: OrderingDesc;
> 
> And then here: `ORDERING`.

Make sense, thanks!

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
> 
> > +}
> > +
> > +impl All for Relaxed {
> > +    const ORDER: OrderingDesc = OrderingDesc::Relaxed;
> > +}
> > +
> > +impl All for Acquire {
> > +    const ORDER: OrderingDesc = OrderingDesc::Acquire;
> > +}
> > +
> > +impl All for Release {
> > +    const ORDER: OrderingDesc = OrderingDesc::Release;
> > +}
> > +
> > +impl All for Full {
> > +    const ORDER: OrderingDesc = OrderingDesc::Full;
> > +}
> 
