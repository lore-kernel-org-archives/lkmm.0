Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525C2E62A7
	for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 14:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034620; cv=none; b=jKWNUklq/gTIZyH3DV0dV//TjC8x5kqU2F++dZfV8Btp9EADsOab8n67RdO2UhN+fF0RkTZygpmZ2ZMrmAodvV7PTxW7BVHXDKWLu0IUQTRY0INEbPhtOIBYzuQeMwy3Id4bKjyKPRkMYrDtFQqah1p6gY+2qAYOiblhbNavEQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034620; c=relaxed/simple;
	bh=dxTyY/jvjld50ba6RZse3oSqo6fYE/3t+2v83ihL4Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRuvxE/MgaroFykIS8fDIzakoj1Yiyb8T+0p/RH4y0I05elkMjdmGLgJdAwUVrWardRwktiXet6kY6xc2/EqGLOvL5tVfybBgz79tcmn031OPrd380axA779Uz2z1ejHTYkc/hTvHn9yBulz9DQ86tqC1aeUPFs2t5f/onw/LOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVCNP+Pz; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVCNP+Pz"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6facc3b9559so31177266d6.0
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034618; x=1751639418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOgFwxZwpVGFqBdT+RV21mmScPfNpeelSubRi+cOqMo=;
        b=hVCNP+Pzyndhuf5X1hLwNmKwArvgKyvRbXYxq88w2mqxCLLFwTJm6qT3H/J0oFb1ZV
         RUlEYQ4U6UAwRINxTxkhzlm9QbQf7BXvnPonQcT8HxUTNA+qooHCueHz+YtI4iM+ME+D
         0J1KuK+aod8rL04OqwuT0cCszNxoa2o6GEfVy0d4vTnclls4ev0CSMEdOIllvCyZxxtf
         effQQsbt2pb1JleTvwVBR7NPhTf28r9mN3k41ioEL2QzsRSPHaMZZcr1uo7PbWJaidnG
         ARwXymgeW0mVVF+nVdSQjy63bc1P4RxLgxTxD4HsHk4IHXCrhlrmMojXiAaK6D8YGeWu
         HWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034618; x=1751639418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOgFwxZwpVGFqBdT+RV21mmScPfNpeelSubRi+cOqMo=;
        b=schVj5I9ieswf1JnGtnEtC14bXOqYla95EqueVjVZDbc8H191JORHdo10PENMOjgqn
         8dn1gouAznEdRyyfv9LEcxm4Kcb7Ne5qJhOHYhCIumls1dxUWQFIgH9Cdpbx5Of/ThTP
         T3IsXOyvpKyxvyEzQug/ubP505qghD15x0ip8Q8hideRaenC1P9PQNepdBEiFOpGcf0O
         jjMz95MEvIvB5A5hcBABzcEEt8N+g5I49fFYZ0sBXFqu2mQNCRDSxU7j0JQlOBsAMKEY
         /XDh1wxsotShLzAXdzty05xZRgju+hWZMegXiI/rsHkDCpDYkBspLQEZfj4Xu/6udu3z
         2WVg==
X-Forwarded-Encrypted: i=1; AJvYcCWYRWxX6t1Mjz8QSONY2hNOS5b8VinwYhcOZsdaX1DKF1vC4xb9HdMKrIHmrohV+tqJolLv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywiax/kg8hcFBw14HxTAa10CCX8YAWCA15NKydxrY52bg/nnYTc
	vNHvQhGJeG9EwlZanv+kVuAAt5fO31vETpckEUPiqMO1T7hCziRWDLqWZrQJ9Q==
X-Gm-Gg: ASbGncvGXWw1pVERVW5VVvlswc+PnwYWZDeSKlJ+Z7b3rfCDE2qnjfjjSnXm8mPHMyv
	Dyl7DuoMMIBIg410VobII5yZL9zRmhxGJNRM7RUqD7b8+2bZgEzHp2Qu292CMbng4ieCuW13xAH
	hmZkVE8Kg23/C6/gM9ryZVAg+lcMMdxjGis30DfMxjJMgKWuclKDVJ0sFB++2skD1e54ruTO/bB
	Ocvi1WIHC0xnOmeo+YjQFsEUXASl7KNNGg87qStCskPF7k8MMg5JOAflmLIu9IVLj0vDXHxxauI
	/EAnBPRIMx90dwkVzmLeGgwYFFp3AZVnZcxPfEAxyn1pRXP7diASCRtYUo87yzguy4PRLPTftdK
	nGSalHbtsJDZ8xT9SK9BMAuObsTSFjWKjo382fhRdTP0RIQpknX9t
X-Google-Smtp-Source: AGHT+IGcMwbdnLOU/Jdo5arOUkSgi1767XdorgELUE4dALb/Ur6c6MU/9CJpaLJZjTw5Obb5cGqE1g==
X-Received: by 2002:a05:6214:300c:b0:6fd:ace:4cfb with SMTP id 6a1803df08f44-7000214f5fcmr75895896d6.27.1751034616224;
        Fri, 27 Jun 2025 07:30:16 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fcb24sm21179186d6.91.2025.06.27.07.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:30:15 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 85D11F40066;
	Fri, 27 Jun 2025 10:30:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 27 Jun 2025 10:30:14 -0400
X-ME-Sender: <xms:9qpeaASPDa-z-TL_DFCsP7fUkNp7-lg2JQfmnz0LT_Kvp3LsJpNCjA>
    <xme:9qpeaNyY6U5P-R8hFm99bDa6t7uT20leCu9Z2i5LUhjn5CrgjWDONq4zKCDEO79pI
    9JPHedMJUmQIMd84w>
X-ME-Received: <xmr:9qpeaN0V_CIzHVFfcGX7POpzNOoIQf00W66tmQKDYhT3N5l-WxpCEPWu_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhu
    shhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    rghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:9qpeaEBJmXNsFyWLlye1cFbdorgRwvyzp0IXco8jy7L2qMuN7FfwXQ>
    <xmx:9qpeaJh0VzMxVoQRvYadK43T3abAdcmiSftEHxuNGVFAeRJgGyiLig>
    <xmx:9qpeaArRAzz6fzcYibPs1ubDw1NGsD2jGwNZMV9qxqJIVLiFN91ooA>
    <xmx:9qpeaMiORM-KnbyrcSWLBB7ArWbb4gZyWXGXknMpN-UyaaRzaxmhzg>
    <xmx:9qpeaARIifEFeiy7MCuGHuby1FGa27lNqjgjQ2cKpYOLfxZSqOSwS3sD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 10:30:13 -0400 (EDT)
Date: Fri, 27 Jun 2025 07:30:13 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
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
Subject: Re: [PATCH v5 02/10] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <aF6q9e4sQ-U1O3mS@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <CUuSJ1MRuO5_kQUQw69PENREVroAdiGBE0Rfy5-G7AD2Z5TNu1FUYRME9kvZZHT0GSIqtYK3yID0jB8xvfg2Qw==@protonmail.internalid>
 <20250618164934.19817-3-boqun.feng@gmail.com>
 <878qle24et.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qle24et.fsf@kernel.org>

On Thu, Jun 26, 2025 at 12:17:14PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> > Preparation for generic atomic implementation. To unify the
> > implementation of a generic method over `i32` and `i64`, the C side
> > atomic methods need to be grouped so that in a generic method, they can
> > be referred as <type>::<method>, otherwise their parameters and return
> > value are different between `i32` and `i64`, which would require using
> > `transmute()` to unify the type into a `T`.
> 
> I can't follow this, could you expand a bit?
> 

So let's say I want to implement a generic `Atomic::load()`, without the
unification, what I can use are:

    pub fn atomic_read(ptr: *mut i32) -> i32

and

    pub fn atomic64_read(ptr: *mut i64) -> i64

and the implementation of `Atomic::load()` would be:

    impl<T:...> Atomic<T> {
        pub fn load(&self) -> T {
	    if size_of::<T> == 4 {
	        unsafe { transmute(atomic_read(self.0.get())) }
	    } else {
	        unsafe { transmute(atomic64_read(self.0.get())) }
	    }
	}
    }

because although load() is function of a generic struct, "if ... else
..." expression requires each branch has the same return type, so the
`transmute()` would be needed. What I meant was a trait method was
provided to `i32` and `i64`:

    impl AtomicImpl for i32 {
        fn atomic_read(ptr: *mut Self) -> Self;
    }

    impl AtomicImpl for i64 {
        fn atomic_read(ptr: *mut Self) -> Self;
    }

so that I could do:

    impl<T:...> Atomic<T> {
        pub fn load(&self) -> T {
	    T::atomic_read(self.0.get())
	}
    }

> >
> > Introduce `AtomicImpl` to represent a basic type in Rust that has the
> > direct mapping to an atomic implementation from C. This trait is sealed,
> > and currently only `i32` and `i64` impl this.
> >
> > Further, different methods are put into different `*Ops` trait groups,
> > and this is for the future when smaller types like `i8`/`i16` are
> > supported but only with a limited set of API (e.g. only set(), load(),
> > xchg() and cmpxchg(), no add() or sub() etc).
> >
> > While the atomic mod is introduced, documentation is also added for
> > memory models and data races.
> >
> > Also bump my role to the maintainer of ATOMIC INFRASTRUCTURE to reflect
> > my responsiblity on the Rust atomic mod.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  MAINTAINERS                    |   4 +-
> >  rust/kernel/sync.rs            |   1 +
> >  rust/kernel/sync/atomic.rs     |  19 ++++
> >  rust/kernel/sync/atomic/ops.rs | 199 +++++++++++++++++++++++++++++++++
> >  4 files changed, 222 insertions(+), 1 deletion(-)
> >  create mode 100644 rust/kernel/sync/atomic.rs
> >  create mode 100644 rust/kernel/sync/atomic/ops.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0c1d245bf7b8..5eef524975ca 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3894,7 +3894,7 @@ F:	drivers/input/touchscreen/atmel_mxt_ts.c
> >  ATOMIC INFRASTRUCTURE
> >  M:	Will Deacon <will@kernel.org>
> >  M:	Peter Zijlstra <peterz@infradead.org>
> > -R:	Boqun Feng <boqun.feng@gmail.com>
> > +M:	Boqun Feng <boqun.feng@gmail.com>
> >  R:	Mark Rutland <mark.rutland@arm.com>
> >  L:	linux-kernel@vger.kernel.org
> >  S:	Maintained
> > @@ -3903,6 +3903,8 @@ F:	arch/*/include/asm/atomic*.h
> >  F:	include/*/atomic*.h
> >  F:	include/linux/refcount.h
> >  F:	scripts/atomic/
> > +F:	rust/kernel/sync/atomic.rs
> > +F:	rust/kernel/sync/atomic/
> >
> >  ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
> >  M:	Bradley Grove <linuxdrivers@attotech.com>
> > diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> > index 36a719015583..b620027e0641 100644
> > --- a/rust/kernel/sync.rs
> > +++ b/rust/kernel/sync.rs
> > @@ -10,6 +10,7 @@
> >  use pin_init;
> >
> >  mod arc;
> > +pub mod atomic;
> >  mod condvar;
> >  pub mod lock;
> >  mod locked_by;
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > new file mode 100644
> > index 000000000000..65e41dba97b7
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Atomic primitives.
> > +//!
> > +//! These primitives have the same semantics as their C counterparts: and the precise definitions of
> > +//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (Consistency) Model is the
> > +//! only model for Rust code in kernel, and Rust's own atomics should be avoided.
> > +//!
> > +//! # Data races
> > +//!
> > +//! [`LKMM`] atomics have different rules regarding data races:
> > +//!
> > +//! - A normal write from C side is treated as an atomic write if
> > +//!   CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y.
> > +//! - Mixed-size atomic accesses don't cause data races.
> > +//!
> > +//! [`LKMM`]: srctree/tools/memory-mode/
> > +
> > +pub mod ops;
> > diff --git a/rust/kernel/sync/atomic/ops.rs b/rust/kernel/sync/atomic/ops.rs
> > new file mode 100644
> > index 000000000000..f8825f7c84f0
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/ops.rs
> > @@ -0,0 +1,199 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Atomic implementations.
> > +//!
> > +//! Provides 1:1 mapping of atomic implementations.
> > +
> > +use crate::bindings::*;
> > +use crate::macros::paste;
> > +
> > +mod private {
> > +    /// Sealed trait marker to disable customized impls on atomic implementation traits.
> > +    pub trait Sealed {}
> > +}
> > +
> > +// `i32` and `i64` are only supported atomic implementations.
> > +impl private::Sealed for i32 {}
> > +impl private::Sealed for i64 {}
> > +
> > +/// A marker trait for types that implement atomic operations with C side primitives.
> > +///
> > +/// This trait is sealed, and only types that have directly mapping to the C side atomics should
> > +/// impl this:
> > +///
> > +/// - `i32` maps to `atomic_t`.
> > +/// - `i64` maps to `atomic64_t`.
> > +pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {}
> > +
> > +// `atomic_t` implements atomic operations on `i32`.
> > +impl AtomicImpl for i32 {}
> > +
> > +// `atomic64_t` implements atomic operations on `i64`.
> > +impl AtomicImpl for i64 {}
> > +
> > +// This macro generates the function signature with given argument list and return type.
> 
> Perhaps could we add an example expansion to make the macro easier for
> people to parse the first time:
> 

That might be a good idea, I will see what I can. However, note that
these macros are only for internal usage (i.e. not an export macro)
similar to impl_item_type!() in configfs.rs, so you can just expand the
file to see the result.

Actually, I could use scripts (similar to patch #1) to generate these,
but was suggested to use macros instead.

The current hesitation from me is because I need to change these macros
and I would probably look into adding expansion examples when things are
stable (i.e. I don't need to change) again. So maybe not the next
version.

> declare_atomic_method!(
>     read[acquire](ptr: *mut Self) -> Self
> );
> 
> ->
> 
> #[doc = "Atomic read_acquire"]
> ..
> unsafe fn atomic_read_acquire(ptr: *mut Self) -> Self;
> 
> #[doc = "Atomic read"]
> ..
> unsafe fn atomic_read(ptr: *mut Self) -> Self;
> 
> 
[..]
> 
> Lastly, perhaps we should do `ptr.cast()` rather than `as *mut _` ?
> 

Sure, that makes sense. I missed that because clippy cannot work on
macro'd code?

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
