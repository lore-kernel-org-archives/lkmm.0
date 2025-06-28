Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827F32D600
	for <lkmm@lists.linux.dev>; Sat, 28 Jun 2025 03:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079840; cv=none; b=GuIUCCwJMPE3YgTjYjk+OgyYWkfF9SPiEBpQeYA7dyrBfQlrpBdMXf/rhMU6Y7M+8Zogv0y1g2S6Bq+Wl0GLkMXZUoizEkxMfBDh/B4099xGFy/a+jtcGr5gyEx8RoOSo7GS59N/4AbAW4jvOSDm1HT7KZmHWviUzRyXQCzY1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079840; c=relaxed/simple;
	bh=z2g6FwoM1+yP/R1AO2qvEMxVHFZmKzDH0+Yb2w/7CAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIX7PkAOP4wtOu3K8VQGdGdlvtXJEsXjk8Bn2dTtmSLoMOqwgZWIxRdlgfD6yrWEtv4LZCt257/MwJVnMYVqdq5TBAyqaRPGRFvjVFzttYEs5qHBoC3GGRE7AMQ7oCZPa21x+jT6eS2op+fSwU3l9IH9PZ0c6AZDTW+MaAZaOQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXBvF4h+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXBvF4h+"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a77ffcb795so28532801cf.0
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 20:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751079837; x=1751684637; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKfdkGsHs7NqMRbo/7Qs4sBJbj00KoBTElEavTmIUM0=;
        b=aXBvF4h+GDebWULSPkBtNAop6s764zgdCrGDrdcz1YaevYC+shPaPEQnQ4tmzd5uUm
         lP545UI/GRBLyF3u5Q9/XL7kUUOZj2PjRjmRutjT2L/1VdPAQlm5nP/sWM3yg6vfc5EG
         i5eC/9ANPDxQsQTrtimm//4y7hc5eO//xX176FyXv40uNwEQ91x6VW7MKPasZ9EqAHmH
         SMKX0TO7PxY0bYIsuN/4933K7b4slK+FuPq5W4kx3Wo//3sHIkch8ZcDvk6FgYiOA5nn
         dDv/BFhLTJaJUFfWEA26ehxM048IfbU6YyiEoWTmI0gFwuMNd6ikhjQ43o6uRmEfPrLh
         PXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079837; x=1751684637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKfdkGsHs7NqMRbo/7Qs4sBJbj00KoBTElEavTmIUM0=;
        b=G0znlGU99tqizLQMn8aiNlo5YXPAm3bFIAbeHEFEIMKQ/NO43vjwqTLF6Ut9o4g1Iu
         VeLPneJOXabVU2oXRYa9r+/YPEbtHFiL0VzYV3q/jUTB19JMHF9apnqfYm17d2Fx3RKG
         AqnVUX5rhRhncsRb9q0+RZfX8MU2qRPHs0wgpL96DbnQv2T0FT/zrs8r2MkdAMJb63XW
         4+Twz6o7Q0E1xD1DsoYyK5ygyZy1mlFNofUxYuJBi3ajwq55OT+gG+qKb9CIbScETsZ+
         kfDuxlVIlywRFvGBLs5Lzb5cx4TS+Tk90AfaAdhfJVTf4YvcG/eCTk46ecvnUcnDrC67
         etgw==
X-Forwarded-Encrypted: i=1; AJvYcCVV3tWjqKGdRpPnOHocKDgsYujNtIthJ4+7p/X7dwf560pOVOyfnXvz0LljJBkDTht59CTD@lists.linux.dev
X-Gm-Message-State: AOJu0YxiT874IWKCjQWeUJMFiMwpSKg7mOC90h6kHKgA7n76v2oc8F1V
	LcMC3jmrAYrJiOtufdXAD+395bfrkqAxN0OSO2hBtDV8Mnh3Jd2eMcaa
X-Gm-Gg: ASbGncvvCn9PARRfYKk/9rjQ4RPuzmsEGJm7TIyFpBaJ1lFzXlO5gwRGw0/5CAy5WXT
	6Yi01c7NRxjOkF7qNugn6lqiXLiLz4BgA+ogpyfb7BzqRKiDOjHV20Rs2SspSsUzhNaw3DZ3GrX
	wpQxOtZ9TBl3UDj8A+Bo8Eh8BuNPCbTI1xsVbdKfmfliqir1qTeWfV0nHv4udlKmmhZ3y+kozEc
	N+43Ir3uoPnTg+f8F0CicnF6K2uGZFfr+fVjt9IZmN1eJay+RwFOx3LxokhjupeZTs//d0oz6Wi
	Y613ZBeyGQ+DaUTenhjTTJbkRSYEicV8qcCWDEYTMoOvmIIBF8wWv/bbOr1KJCaG6Thfv+VK507
	PJ4V6BJA4c9r5UZ+ZwyxClantvDYI/AG/FS20Tz5SITVmWhxPuWsZPLDBpbrFvfw=
X-Google-Smtp-Source: AGHT+IENHGG6gjc1y6TnpBpTdkf27mATfXOIOHmBDYkft5eYdEI+PM3hm40FM9FR4iCyeuRlYqKnJA==
X-Received: by 2002:a05:622a:4e9a:b0:4a7:b73:5356 with SMTP id d75a77b69052e-4a7fcae8dc1mr89595271cf.40.1751079837258;
        Fri, 27 Jun 2025 20:03:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c67esm23103201cf.48.2025.06.27.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:03:56 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id F0B08F40066;
	Fri, 27 Jun 2025 23:03:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 27 Jun 2025 23:03:56 -0400
X-ME-Sender: <xms:m1tfaNN3CCBDYWLgTmC0HrwD5BOHWjNquEzLHu4PDn5QIoYq6xMvNQ>
    <xme:m1tfaP-yvPebA6oK2kDQgHqJNNi7aF6qDJCXHJmW9MkFa39sUq8lDt-oxTyVGaz4_
    P97WMtWxx5knvzvZA>
X-ME-Received: <xmr:m1tfaMSonSBlVUIF9z5IZl3yqLoUHWYd-ClnofsmSVucMM_PX1CC-FnwUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegkeduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:m1tfaJtfVFqgsAVdx0fRjarA2xgGOpdHtrpo2iBFtKWS6xxKUIylgw>
    <xmx:m1tfaFe7-QxzKOy8f9pgXpFhG-Xr-nJ1zzbY4_Eu2NGSK1S3XKvu1A>
    <xmx:m1tfaF2Kv4sNjvwOCuBiY-nAFnoF-eo9XHoAh3TeApOPkcpCycMATA>
    <xmx:m1tfaB8JNz01A4lKxbk7szR3jw05_mYcnVRbhm76PgdGXd2wsihjNg>
    <xmx:m1tfaA-J5dUpJYNnarlWOsRs9W-lyuz-hHMToJZUoWNR7PcwWfldlGFF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 23:03:55 -0400 (EDT)
Date: Fri, 27 Jun 2025 20:03:54 -0700
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
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <aF9bmpX-i6HVMlaj@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <jBAtISwM9LKkR7KuCHEnym75NfGOM4z408pMuDfk4U8VzN8PQuk9JJfBc33Usre3YSjbgtFRj8c0ZNeeQMpZsA==@protonmail.internalid>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <87a55uzlxv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a55uzlxv.fsf@kernel.org>

On Thu, Jun 26, 2025 at 03:12:12PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> > xchg() and cmpxchg() are basic operations on atomic. Provide these based
> > on C APIs.
> >
> > Note that cmpxchg() use the similar function signature as
> > compare_exchange() in Rust std: returning a `Result`, `Ok(old)` means
> > the operation succeeds and `Err(old)` means the operation fails.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/kernel/sync/atomic/generic.rs | 154 +++++++++++++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> >
> > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
> > index 73c26f9cf6b8..bcdbeea45dd8 100644
> > --- a/rust/kernel/sync/atomic/generic.rs
> > +++ b/rust/kernel/sync/atomic/generic.rs
> > @@ -256,3 +256,157 @@ pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
> >          };
> >      }
> >  }
> > +
> > +impl<T: AllowAtomic> Atomic<T>
> > +where
> > +    T::Repr: AtomicHasXchgOps,
> > +{
> > +    /// Atomic exchange.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42);
> > +    ///
> > +    /// assert_eq!(42, x.xchg(52, Acquire));
> > +    /// assert_eq!(52, x.load(Relaxed));
> > +    /// ```
> > +    #[doc(alias("atomic_xchg", "atomic64_xchg"))]
> > +    #[inline(always)]
> > +    pub fn xchg<Ordering: All>(&self, v: T, _: Ordering) -> T {
> > +        let v = T::into_repr(v);
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_xchg*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> 
> Typo: `AllowAtomic`.
> 

Fixed.

> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        let ret = unsafe {
> > +            match Ordering::TYPE {
> > +                OrderingType::Full => T::Repr::atomic_xchg(a, v),
> > +                OrderingType::Acquire => T::Repr::atomic_xchg_acquire(a, v),
> > +                OrderingType::Release => T::Repr::atomic_xchg_release(a, v),
> > +                OrderingType::Relaxed => T::Repr::atomic_xchg_relaxed(a, v),
> > +            }
> > +        };
> > +
> > +        T::from_repr(ret)
> > +    }
> > +
> > +    /// Atomic compare and exchange.
> > +    ///
> > +    /// Compare: The comparison is done via the byte level comparison between the atomic variables
> > +    /// with the `old` value.
> > +    ///
> > +    /// Ordering: When succeeds, provides the corresponding ordering as the `Ordering` type
> > +    /// parameter indicates, and a failed one doesn't provide any ordering, the read part of a
> > +    /// failed cmpxchg should be treated as a relaxed read.
> 
> Rust `core::ptr` functions have this sentence on success ordering for
> compare_exchange:
> 
>   Using Acquire as success ordering makes the store part of this
>   operation Relaxed, and using Release makes the successful load
>   Relaxed.
> 
> Does this translate to LKMM cmpxchg operations? If so, I think we should
> include this sentence. This also applies to `Atomic::xchg`.
> 

I see this as a different style of documenting, so in my next version,
I have the following:

//! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
//!   following memory accesses.
//! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
//!   the annotated operation.

in atomic/ordering.rs, I think I can extend it to:

//! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
//!   following memory accesses, and if there is a store part, it has Relaxed ordering.
//! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
//!   the annotated operation, and if there is load part, it has Relaxed ordering

This aligns with what we usually describe things in tool/memory-model/.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
