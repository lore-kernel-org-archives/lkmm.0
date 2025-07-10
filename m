Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057A27467D
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160368; cv=none; b=aqrSOTJayS3mW91fO9EGa0ugCwhKwQ/Y0QjE5OzB4bb0b2sPOQffCMTNaAG7E/f3cXxSkgTNfbirllGI47vIaG4gSMk+SOsSs94ray5WZ2Ztn02Ej1NQNVr8+6l+f4YaBiCA6ORStoV0sScZncyNmb7P4CbtGD+6pgwCxbeLb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160368; c=relaxed/simple;
	bh=GgOjJjNhfxbdPscR6Rcl+Lm5A623RErZUMr28VV/AD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD8yByNRx1iFLqdVYEXdb7IMYy0oGJZNhk7p8fbPfcP5mtUwPtEmvkgDVh6Ae14hFm3AT5d8H3+NrwtwVYfZoojnmupczCbv0dUNh46c2z/ZmgRpvHqrYMOxbdi1nQzt2vHjuYu/TqKSaWRava5m9kVcHBPGs89aUGvht+KxWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdsqID1t; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdsqID1t"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d0976776dcso123674985a.2
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752160365; x=1752765165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7A/GLY3skkEqUm5DsmGuTgpMULWmEN8ea1a9wjie1g=;
        b=fdsqID1titB03Um6BnySvOx9+sxxtQlNm7/paDOGxo5azb1de7bQ6XcJa2fPQDid+C
         vPi6UOhLxSZFTJyKlIMFNzCC4ITG1B4rGIbHrm56j80nAfbmPNnZTtGD347SAcKQuFVn
         GSZnhnNf4cY8DOfyO3FjnDhSexTEJfwFT4fld2G8x0f4+Sd67n9El3/JmVT4wWhmhrvt
         kK9GYkkrkCVIKenRw30p4bA/Y2eDZFKUlNUncUJDAsMq/ZsRRIh9pXiQjtqwHjXr3ML7
         mylLly1IZodEgxrbmLwY3gQv4LBXdhHAH0PyBD/EtcoQ429fyg0QmVkMSJXPMFI3CZTQ
         AN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160365; x=1752765165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7A/GLY3skkEqUm5DsmGuTgpMULWmEN8ea1a9wjie1g=;
        b=WE6R/uVuYMShwSleCll6zer6FTGI6cnJuSQ2F6tkcYif3suatg6Bq1YK7FbxCU9NSP
         MH5ok2mIuX17np7WF4vHE4EUBgzXRrFbaXv3l7/4azsqe0ttq29JNOfuG8JGdLf2pAMo
         7CgThr+PHV0kEJDC9enNg6bqw5qEfFXm4BxXyMivpV1hF99/IWzsSyuKmP9henkqi5qT
         IBcAb9sohtvYn1owg6BgnixD9Jk+KQER7ttGkm2U1B3rbbT/1BXsJRFKrxMnBPUNmxFT
         DYmyUjgFyHHSEiryqaWHKppw5TSs9n5nfeydADw80v2nIAci43p8UAjJ1JolKz7E5Zl5
         zYLA==
X-Forwarded-Encrypted: i=1; AJvYcCWy68HseEWEG8Mhzrpq5fjgJD3PtSuIPHUjAUpbuRQgOHAGsLKLQbyoMpjyX/LMIoNNVKo8@lists.linux.dev
X-Gm-Message-State: AOJu0YzwOQLWa2AlJQL5VhP2woprPdryp1/XUSvPpYrdgWPezllNsrbu
	Q04iuAhlTXWipwbhHO5skgXHLGWxwoj/2wRK3OX2pP+E0934wIk4qfIT
X-Gm-Gg: ASbGncvOi8Nn3y16ZhnqZUsTOZynZnLRZStQLsCrnjOh5x8FmpNFxflb8QbWNYLx0d/
	MwowgR6zKQcwkMNlZQPpEjW7KsnR4wl2oXU96xdIZB6VZiiS3a2kXYA4QWt0X5uPAIp5BWEyBuI
	krxA6BYUq2OafseY6qp5okarTmR3jpwyUHveMR+HYyjYWB4TzwecQVF7YiEOEoZgghaQHpbppv1
	rozQBIfOIfJFP0whZMOINtZ2Vv2A6mr7io++MsfF1S2mj10SnzOtG9DIMxsfOylatmEpP/UFaus
	aG0LgruIX87+DdzXJZAnuj1qlTKZXHacL62tYmY3vnJYUad/pJwhiC57dqQ5NcqlZG2lqipSg51
	EOnmIJn1aSIQliBMtDtNThX2u6sLRikJFb5wuWW7dyaaoTRNmG9iv
X-Google-Smtp-Source: AGHT+IGZRT3Ek+k6ptGou00R1ZtWCEc1SgeI24oeuNzsyYq0PSGK5DVt2zsoYjwPFBI7QMY7TQ3imA==
X-Received: by 2002:a05:620a:2b9b:b0:7d5:dc2a:c5f8 with SMTP id af79cd13be357-7dcc9f15c86mr356156685a.12.1752160364903;
        Thu, 10 Jul 2025 08:12:44 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0fa32asm107520885a.48.2025.07.10.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:12:44 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id CF2F4F4006B;
	Thu, 10 Jul 2025 11:12:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 10 Jul 2025 11:12:43 -0400
X-ME-Sender: <xms:a9hvaH97HvLX8EF-t8Gr7m-MFe7jAcliP0B9jHTp9RTu75KLZ0nIVg>
    <xme:a9hvaFMY1L6RdI2StmMWCv4_jwtS5ihI1NF5G6QIdj8J1Rq931Am_0WkLl0qpY5oL
    5VRbADRuOkIDn1IJA>
X-ME-Received: <xmr:a9hvaJlMvHgL-iqokBkxLipM3ib9zH5kh-RFzNdkAaIrM6tNxCGCmCtKkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdejjecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:a9hvaC-9-4PxyYxvoHig2CGDJSpUDZSOM_ySAyvwgLwkGZT9N_nDsQ>
    <xmx:a9hvaKMecz-Pv9KwMAHeZvLL2fO61dtnI7qiAk9oClfjqigX3wjg_A>
    <xmx:a9hvaOGTcpOMAbwt4U5DFfIAap85eck5zIsSxKP94U_SdHqchBQ6pg>
    <xmx:a9hvaIgmwnlbxCaM4k1yxqFyzOHUDVGaezVE5lYXFNR56_e1aUmnsQ>
    <xmx:a9hvaCR5VrluecWU5tUCEDOvzd5Sa7hik4lQByisKubHy-7FvPilLY92>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 11:12:43 -0400 (EDT)
Date: Thu, 10 Jul 2025 08:12:42 -0700
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
Subject: Re: [PATCH v6 2/9] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <aG_Yah5FFHcA3IZy@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-3-boqun.feng@gmail.com>
 <DB8BQGJNFDAY.BGQ8CZSFFOLH@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8BQGJNFDAY.BGQ8CZSFFOLH@kernel.org>

On Thu, Jul 10, 2025 at 01:04:38PM +0200, Benno Lossin wrote:
> On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> > Preparation for generic atomic implementation. To unify the
> > implementation of a generic method over `i32` and `i64`, the C side
> > atomic methods need to be grouped so that in a generic method, they can
> > be referred as <type>::<method>, otherwise their parameters and return
> > value are different between `i32` and `i64`, which would require using
> > `transmute()` to unify the type into a `T`.
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
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Overall this looks good from a functionality view. I have some cosmetic
> comments for the macros below and a possibly bigger concern regarding
> safety comments. But I think this is good enough for now, so:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 

Thanks!

> > diff --git a/rust/kernel/sync/atomic/ops.rs b/rust/kernel/sync/atomic/ops.rs
> > new file mode 100644
> > index 000000000000..da04dd383962
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/ops.rs
> > @@ -0,0 +1,195 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Atomic implementations.
> > +//!
> > +//! Provides 1:1 mapping of atomic implementations.
> > +
> > +use crate::bindings::*;
> 
> We shouldn't import all bindings, just use `bindings::` below.
> 

Make sense!

> > +// This macro generates the function signature with given argument list and return type.
> > +macro_rules! declare_atomic_method {
> > +    (
> > +        $func:ident($($arg:ident : $arg_type:ty),*) $(-> $ret:ty)?
> > +    ) => {
> > +        paste!(
> > +            #[doc = concat!("Atomic ", stringify!($func))]
> > +            #[doc = "# Safety"]
> > +            #[doc = "- Any pointer passed to the function has to be a valid pointer"]
> > +            #[doc = "- Accesses must not cause data races per LKMM:"]
> > +            #[doc = "  - Atomic read racing with normal read, normal write or atomic write is not data race."]
> 
> s/not/not a/
> 
> > +            #[doc = "  - Atomic write racing with normal read or normal write is data-race, unless the"]
> 
> s/data-race/a data race/
> 
> > +            #[doc = "    normal accesses are done at C side and considered as immune to data"]
> 
>     #[doc = "    normal access is done from the C side and considered immune to data"]
> 
> > +            #[doc = "    races, e.g. CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC."]
> 
> Missing '`'.
> 

Fixed.

> 
> Also why aren't you using `///` instead of `#[doc =`? The only part
> where you need interpolation is the first one.
> 

I think at a certain point I was not using `paste!()` and then using
`///` wouldn't generate them into rustdoc, but with `paste!()` your
suggestion makes sense, thanks!

> > +            unsafe fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
> > +        );
> > +    };
> 
> > +declare_and_impl_atomic_methods!(
> > +    AtomicHasBasicOps ("Basic atomic operations") {
> > +        read[acquire](ptr: *mut Self) -> Self {
> > +            call(ptr.cast())
> > +        }
> > +
> > +        set[release](ptr: *mut Self, v: Self) {
> > +            call(ptr.cast(), v)
> > +        }
> > +    }
> 
> I think this would look a bit better:
> 
>     /// Basic atomic operations.
>     pub trait AtomicHasBasicOps {
>         unsafe fn read[acquire](ptr: *mut Self) -> Self {
>             bindings::#call(ptr.cast())
>         }
> 
>         unsafe fn set[release](ptr: *mut Self, v: Self) {
>             bindings::#call(ptr.cast(), v)
>         }
>     }
> 

Make sense, I've made `pub trait`, `bindings::#` and `unsafe fn`
hard-coded:

macro_rules! declare_and_impl_atomic_methods {
    (#[doc = $doc:expr] pub trait $ops:ident {
        $(
            unsafe fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
                bindings::#call($($arg:tt)*)
            }
        )*
    }) => {

It shouldn't be very hard to make use of the actual visibility or
unsafe, but we currently don't have other visibility or safe function,
so it's simple to keep it as it is.

> And then we could also put the safety comments inline:
> 
>     /// Basic atomic operations.
>     pub trait AtomicHasBasicOps {
>         /// Atomic read
>         ///
>         /// # Safety
>         /// - Any pointer passed to the function has to be a valid pointer
>         /// - Accesses must not cause data races per LKMM:
>         ///   - Atomic read racing with normal read, normal write or atomic write is not a data race.
>         ///   - Atomic write racing with normal read or normal write is a data race, unless the
>         ///     normal access is done from the C side and considered immune to data races, e.g.
>         ///     `CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC`.
>         unsafe fn read[acquire](ptr: *mut Self) -> Self {
>             // SAFETY: Per function safety requirement, all pointers are valid, and accesses won't
>             // cause data race per LKMM.
>             unsafe { bindings::#call(ptr.cast()) }
>         }
> 
>         /// Atomic read

Copy-pasta ;-)

>         ///
>         /// # Safety
>         /// - Any pointer passed to the function has to be a valid pointer
>         /// - Accesses must not cause data races per LKMM:
>         ///   - Atomic read racing with normal read, normal write or atomic write is not a data race.
>         ///   - Atomic write racing with normal read or normal write is a data race, unless the
>         ///     normal access is done from the C side and considered immune to data races, e.g.
>         ///     `CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC`.
>         unsafe fn set[release](ptr: *mut Self, v: Self) {
>             // SAFETY: Per function safety requirement, all pointers are valid, and accesses won't
>             // cause data race per LKMM.
>             unsafe { bindings::#call(ptr.cast(), v) }
>         }
>     }
> 
> I'm not sure if this is worth it, but for reading the definitions of
> these operations directly in the code this is going to be a lot more
> readable. I don't think it's too bad to duplicate it.
> 
> I'm also not fully satisfied with the safety comment on
> `bindings::#call`...
> 

Based on the above, I'm not going to do the change (i.e. duplicating
the safe comments and improve them), and I would make an issue tracking
it, and we can revisit it when we have time. Sounds good?

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > +);
> > +
> > +declare_and_impl_atomic_methods!(
> > +    AtomicHasXchgOps ("Exchange and compare-and-exchange atomic operations") {
> > +        xchg[acquire, release, relaxed](ptr: *mut Self, v: Self) -> Self {
> > +            call(ptr.cast(), v)
> > +        }
> > +
> > +        try_cmpxchg[acquire, release, relaxed](ptr: *mut Self, old: *mut Self, new: Self) -> bool {
> > +            call(ptr.cast(), old, new)
> > +        }
> > +    }
> > +);
> > +
> > +declare_and_impl_atomic_methods!(
> > +    AtomicHasArithmeticOps ("Atomic arithmetic operations") {
> > +        add[](ptr: *mut Self, v: Self) {
> > +            call(v, ptr.cast())
> > +        }
> > +
> > +        fetch_add[acquire, release, relaxed](ptr: *mut Self, v: Self) -> Self {
> > +            call(v, ptr.cast())
> > +        }
> > +    }
> > +);
