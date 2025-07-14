Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5C248F5A
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502921; cv=none; b=pGcAz81zB80ynn9Z/Lv2iRxjxbZgoSYr/CSakUy27wyB3lwdHddTlbcMpqp+jFLGP9nDTgirhbRrpSR5DvxSb1DkZlBnaycaZM0cWGOf619f2vLS4ORk/dsDQ5TceN3VXMyJcMfZWTpKm8iES8uquHBk0TUM6SwEAFnS4i0vN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502921; c=relaxed/simple;
	bh=LXYASdYs274xH5+7ZkutHgLnsf8arGwEpqGBiT9kquk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bny9g74p/LAL4lU1eX7ktEiswRCg1WPI2L7tP5Z4hnZErGKSjPTLC5+X//n41GaSJOVclwbukckEwksoaNJeW2vpQ0zmDeQMSeg23DDNUQaZVPj2zaD/EQwW+vVh6DcuUugsbgHS1yoZelz9BVlhWmk+yMkmPil7Y/h/gtRY7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHPZ5z7l; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHPZ5z7l"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ab644b8dc1so14771881cf.1
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752502919; x=1753107719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZ3UA4OiThrfJUfCAJnJai+VvM5KDOnLQOCMjU2eyNU=;
        b=kHPZ5z7l+V8HWWcsqHwCaZ0eifatac4D9LAQHdxA8fNFjOTgPhXUZ+UqNNPgYhoKc1
         ZzoJgbSs7HPa/ceJU/4JsQIE3lKw56MC+HPMfsCdbKoGsfCpOs9LtDSWro4qQcg5TiV+
         OsH4qRTfgMaNKcgSpnde9JuB/t5HdNmKnB3Nctue9WJ9uuLsOe2GDRDNGMxABdY+uxPJ
         pZiLksjuP/WEdCW2bJnFqUsDcL+rsDr2NsQFMGaEEC+Qyt8jmgdfdbgaiLpfg5ZYdX7M
         PzdBHIeo82Lb+yTF6+DSK+ebeWIwkFNB/Q/lefK8QXydbjyfZ0q7THMIcrMg/DoXzSKB
         sKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502919; x=1753107719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ3UA4OiThrfJUfCAJnJai+VvM5KDOnLQOCMjU2eyNU=;
        b=MEl72kBfqTYLpO0N0bkhO1zHRLmFB47owJmFL4A9T9aT5drxXN8zuXO4KQG9POeMbb
         90D1eNDi2P5HqWgQFiZApumhE6s6lbEuIjwgVovvoIV0YUgyIuFASaAQ0HGyQUf2HkAD
         b3oaO8c2FBzBJ3TXi2fq9GouZ6y3zXeiWZ9yiJItFUChG/Gp4XZa4pazJ2cLTDS9oaet
         sBSNOx92cyEqaWj/JIz/tqQKKJ/Gvzr3K3wxWTDzz0LgdkXYTqSFS/a+8XuCLnHbGknT
         8uG/LFkJMbJ/bcX74KdYOzF6hdZV9OlZ2T7SzoiULqk+avl6lGgpP++KXHr4SrPA075k
         jT8w==
X-Forwarded-Encrypted: i=1; AJvYcCUGQ8ibfMA3J5APmZpYkeqYrSazBzEXwV7rFv6kZP0znPi3E6+o+rCgeeAztwGXnKxzvrf0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5D3GKmagUlSDyQnZ5GGVLP5Sh8zNsBDK08MsrQQJZ/wsOz9e3
	V19OxyJ4T6MLmoUHC1kRqcbfpR4MVtdur3jsRCSW6LAlCcPhvuEd0G7a
X-Gm-Gg: ASbGncsi/h7CxybBoY2KuLm3ZgPZdIca1DyzSuk0y7R0d+iC6ybMAd/9CU0kbrA6Mhu
	069WkufFTLxOi6OwsWJ3cphBxOCSBr+wbbG9wigRR6TBuTkNJiXXd7Ra+A1lbSyMS6DLe5SK2Nj
	kPBOWY2Pde+pJmf4ZxdJX/xIDHiHr7SVgP2Lp1dWRLgsrPNdNFYE4Vi9ltOtprUTLv3FQkXMO56
	objNoMB4jHkAi9pzGoeav+QVhrefarncxRwLYf783U8/vhlrbS5rU7TDT3kUA9FumO7JjRrVRZL
	goDFrRxHuZYVMWo2I/pQMcSFFLRfTB6as5NXZTVE5BFHAy5FkaEhiiNnfvCTxuRltPyzP2PoOHU
	WsPmUNjl+TlY7NniznLZpxVs3E1dZNKkxfTtIDRyuaky/zB9ZL/WtdqTpis9Xcl+R/E0tiBvM2w
	ynaCjaBR50/rpVT5h/RfH816w=
X-Google-Smtp-Source: AGHT+IFPSGvNAkBdeHK89MtoMem4TLxdLXh4OZGGwdCkz7tqSOs4eBK5tCKfiDABlgF9UHT6wbjqjg==
X-Received: by 2002:a05:6214:4105:b0:702:c042:82a2 with SMTP id 6a1803df08f44-704a4083bb6mr199236616d6.4.1752502918367;
        Mon, 14 Jul 2025 07:21:58 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d8eee2sm47343296d6.97.2025.07.14.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:21:57 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id D378CF40067;
	Mon, 14 Jul 2025 10:21:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 14 Jul 2025 10:21:56 -0400
X-ME-Sender: <xms:hBJ1aDGuMY4nwS1IWHR7fsftsJRHhMspcIAyaV49ruNh0A8EqV3-EA>
    <xme:hBJ1aB2apIqJlvd7uisnShqZRnfAgRRo9lEIe_UWpebKA7zbN8f9hSM7r38rqdN2e
    AWHtY9sDnR7xV3GvQ>
X-ME-Received: <xmr:hBJ1aJsLV2dd0SYLg3aM5c2jMCI89X5WjnkG49b8Hqtv_UmZv_oM6e1QRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvddukecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:hBJ1aAndUvXSTDtoRLanYeY1GLPCqR9APm1iHJI0MFcl_YNxQc7tlw>
    <xmx:hBJ1aHWKITGNp-uMHqPnwN9rk93WfIw-L4A70STwhCLMbRvktUJcAQ>
    <xmx:hBJ1aEsoLbEjTFVdP6DzVJIRMBlG9go7R2XjZiOaCa1WyZDeVoV1Ag>
    <xmx:hBJ1aKqTQoFr0MJuj9KJ8W9_41WszoJ3OB9Y5eFDXo2C_bnagj24tg>
    <xmx:hBJ1aJ58aWRW3w5DIuJshZtXpvwPTg1gN-OQnnB0OBJKPOm6DifSEz2w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 10:21:54 -0400 (EDT)
Date: Mon, 14 Jul 2025 07:21:53 -0700
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
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHUSgXW9A6LzjBIS@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>

On Mon, Jul 14, 2025 at 12:30:12PM +0200, Benno Lossin wrote:
> On Mon Jul 14, 2025 at 7:36 AM CEST, Boqun Feng wrote:
> > To provide using LKMM atomics for Rust code, a generic `Atomic<T>` is
> > added, currently `T` needs to be Send + Copy because these are the
> > straightforward usages and all basic types support this.
> >
> > Implement `AllowAtomic` for `i32` and `i64`, and so far only basic
> > operations load() and store() are introduced.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/kernel/sync/atomic.rs         |  14 ++
> >  rust/kernel/sync/atomic/generic.rs | 285 +++++++++++++++++++++++++++++
> >  2 files changed, 299 insertions(+)
> >  create mode 100644 rust/kernel/sync/atomic/generic.rs
> >
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index e80ac049f36b..c5193c1c90fe 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -16,7 +16,21 @@
> >  //!
> >  //! [`LKMM`]: srctree/tools/memory-model/
> >  
> > +pub mod generic;
> 
> Hmm, maybe just re-export the stuff? I don't think there's an advantage
> to having the generic module be public.
> 

If `generic` is not public, then in the kernel::sync::atomic page, it
won't should up, and there is no mentioning of struct `Atomic` either.

If I made it public and also re-export the `Atomic`, there would be a
"Re-export" section mentioning all the re-exports, so I will keep
`generic` unless you have some tricks that I don't know.

Also I feel it's a bit naturally that `AllowAtomic` and `AllowAtomicAdd`
stay under `generic` (instead of re-export them at `atomic` mod level)
because they are about the generic part of `Atomic`, right?

> >  pub mod ops;
> >  pub mod ordering;
> >  
> > +pub use generic::Atomic;
> >  pub use ordering::{Acquire, Full, Relaxed, Release};
> > +
[...]
> > +/// A memory location which can be safely modified from multiple execution contexts.
> > +///
> > +/// This has the same size, alignment and bit validity as the underlying type `T`.
> 
> Let's also mention that this disables any niche optimizations (due to
> the unsafe cell).
> 

Done

> > +///
> > +/// The atomic operations are implemented in a way that is fully compatible with the [Linux Kernel
> > +/// Memory (Consistency) Model][LKMM], hence they should be modeled as the corresponding
> > +/// [`LKMM`][LKMM] atomic primitives. With the help of [`Atomic::from_ptr()`] and
> > +/// [`Atomic::as_ptr()`], this provides a way to interact with [C-side atomic operations]
> > +/// (including those without the `atomic` prefix, e.g. `READ_ONCE()`, `WRITE_ONCE()`,
> > +/// `smp_load_acquire()` and `smp_store_release()`).
> > +///
> > +/// [LKMM]: srctree/tools/memory-model/
> > +/// [C-side atomic operations]: srctree/Documentation/atomic_t.txt
> 
> Did you check that these links looks good in rustdoc?
> 

Yep.

> > +#[repr(transparent)]
> > +pub struct Atomic<T: AllowAtomic>(UnsafeCell<T>);
> > +
> > +// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
> > +unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
> > +
> > +/// Types that support basic atomic operations.
> > +///
> > +/// # Round-trip transmutability
> > +///
> > +/// `T` is round-trip transmutable to `U` if and only if both of these properties hold:
> > +///
> > +/// - Any valid bit pattern for `T` is also a valid bit pattern for `U`.
> > +/// - Transmuting (e.g. using [`transmute()`]) a value of type `T` to `U` and then to `T` again
> > +///   yields a value that is in all aspects equivalent to the original value.
> > +///
> > +/// # Safety
> > +///
> > +/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
> > +/// - [`Self`] must be [round-trip transmutable] to  [`Self::Repr`].
> > +///
> > +/// Note that this is more relaxed than requiring the bi-directional transmutability (i.e.
> > +/// [`transmute()`] is always sound between `U` to `T`) because of the support for atomic variables
> 
> s/ to / and /
> 

Fixed.

> > +/// over unit-only enums, see [Examples].
> > +///
> > +/// # Limitations
> > +///
> > +/// Because C primitives are used to implement the atomic operations, and a C function requires a
> > +/// valid object of a type to operate on (i.e. no `MaybeUninit<_>`), hence at the Rust <-> C
> > +/// surface, only types with no uninitialized bits can be passed. As a result, types like `(u8,
> 
> s/no uninitialized/initialized/
> 

hmm.. "with initialized bits" seems to me saying "it's OK as long as
some bits are initialized", how about "with all the bits initialized"?

> > +/// u16)` (a tuple with a `MaybeUninit` hole in it) are currently not supported. Note that
> 
> s/a tuple with a `MaybeUninit` hole in it/padding bytes are uninitialized/
> 

Done.

[...]
> > +
> > +#[inline(always)]
> > +const fn into_repr<T: AllowAtomic>(v: T) -> T::Repr {
> > +    // SAFETY: Per the safety requirement of `AllowAtomic`, the transmute operation is sound.
> 
> Please explain the concrete parts of the safety requirements that you
> are using here (ie round-trip-transmutability).
> 

Done.

> > +    unsafe { core::mem::transmute_copy(&v) }
> > +}
> > +
> > +/// # Safety
> > +///
> > +/// `r` must be a valid bit pattern of `T`.
> > +#[inline(always)]
> > +const unsafe fn from_repr<T: AllowAtomic>(r: T::Repr) -> T {
> > +    // SAFETY: Per the safety requirement of the function, the transmute operation is sound.
> > +    unsafe { core::mem::transmute_copy(&r) }
> > +}
> > +
> > +impl<T: AllowAtomic> Atomic<T> {
> > +    /// Creates a new atomic `T`.
> > +    pub const fn new(v: T) -> Self {
> > +        Self(UnsafeCell::new(v))
> > +    }
> > +
> > +    /// Creates a reference to an atomic `T` from a pointer of `T`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `ptr` is aligned to `align_of::<T>()`.
> > +    /// - `ptr` is valid for reads and writes for `'a`.
> > +    /// - For the duration of `'a`, other accesses to `*ptr` must not cause data races (defined
> > +    ///   by [`LKMM`]) against atomic operations on the returned reference. Note that if all other
> > +    ///   accesses are atomic, then this safety requirement is trivially fulfilled.
> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
> > +    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
> > +    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
> > +    ///
> > +    /// ```
> > +    /// # use kernel::types::Opaque;
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
> > +    ///
> > +    /// // Assume there is a C struct `foo`.
> > +    /// mod cbindings {
> > +    ///     #[repr(C)]
> > +    ///     pub(crate) struct foo {
> > +    ///         pub(crate) a: i32,
> > +    ///         pub(crate) b: i32
> > +    ///     }
> > +    /// }
> > +    ///
> > +    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2 });
> > +    ///
> > +    /// // struct foo *foo_ptr = ..;
> > +    /// let foo_ptr = tmp.get();
> > +    ///
> > +    /// // SAFETY: `foo_ptr` is valid, and `.a` is in bounds.
> > +    /// let foo_a_ptr = unsafe { &raw mut (*foo_ptr).a };
> > +    ///
> > +    /// // a = READ_ONCE(foo_ptr->a);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is valid for read, and all other accesses on it is atomic, so no
> > +    /// // data race.
> > +    /// let a = unsafe { Atomic::from_ptr(foo_a_ptr) }.load(Relaxed);
> > +    /// # assert_eq!(a, 1);
> > +    ///
> > +    /// // smp_store_release(&foo_ptr->a, 2);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is valid for writes, and all other accesses on it is atomic, so
> > +    /// // no data race.
> > +    /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
> > +    /// ```
> > +    ///
> > +    /// However, this should be only used when communicating with C side or manipulating a C
> > +    /// struct.
> 
> This sentence should be above the `Safety` section.
> 

Hmm.. why? This is the further information about what the above
"Examples" section just mentioned?

> > +    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
> > +    where
> > +        T: Sync,
> > +    {
> > +        // CAST: `T` is transparent to `Atomic<T>`.
> > +        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
> > +        // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
> > +        // guarantees other accesses won't cause data races.
> > +        unsafe { &*ptr.cast::<Self>() }
> > +    }
> > +
> > +    /// Returns a pointer to the underlying atomic `T`.
> > +    ///
> > +    /// Note that use of the return pointer must not cause data races defined by [`LKMM`].
> > +    ///
> > +    /// # Guarantees
> > +    ///
> > +    /// The returned pointer is properly aligned (i.e. aligned to [`align_of::<T>()`])
> 
> You really only need this guarantee? Not validity etc?
> 

Nice find, I changed it to also guarantee the pointer is valid.

> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    /// [`align_of::<T>()`]: core::mem::align_of
> > +    pub const fn as_ptr(&self) -> *mut T {
> > +        // GUARANTEE: `self.0` has the same alignment of `T`.
> > +        self.0.get()
> > +    }
> > +
> > +    /// Returns a mutable reference to the underlying atomic `T`.
> > +    ///
> > +    /// This is safe because the mutable reference of the atomic `T` guarantees the exclusive
> 
> s/the exclusive/exclusive/
> 

Done.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > +    /// access.
> > +    pub fn get_mut(&mut self) -> &mut T {
> > +        // SAFETY: `self.as_ptr()` is a valid pointer to `T`. `&mut self` guarantees the exclusive
> > +        // access, so it's safe to reborrow mutably.
> > +        unsafe { &mut *self.as_ptr() }
> > +    }
> > +}
