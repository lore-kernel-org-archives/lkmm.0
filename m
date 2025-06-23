Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288987261A
	for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 05:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750656204; cv=none; b=fQ9cSvSTgidLhwrR0H1IOcR4avFY7S1vEvS30NrhChK7f+g2EmzZ42P6oSzfl9CJAwZZk9CCfpht8tYr9sO3KhscuVKLzpa28nrvIjJQ2GYcb5i7orUQWBZjuv7g2olzHzJx4yMRSoiizbKs/7H3KFlhWhCQdcZxOvrk6gMVH7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750656204; c=relaxed/simple;
	bh=I9Tqdm0liT8qHxpY2SF1FPCTfF6GGAr8ugJt3v6wxdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXAGngFDHj3PPYi3wEXWZxPR1MlbhwYY9FHE5gqRCltG3cpkJTywz3ZoG6UIJhm/xOVpA3zbeMwoNDZxF6bOXtEj0bEdZ3Xf2fvZBCfNx+JVVgxV7UXaACaaqei+D9K3N2qD1pZfh8nPaLOMAHqFmDmYyTqWSgZlCvh+SFa99Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIl419Gs; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIl419Gs"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a77ea7ed49so25261671cf.0
        for <lkmm@lists.linux.dev>; Sun, 22 Jun 2025 22:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750656202; x=1751261002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr5oEbFyfEjRzNkoJqnkBmtmxzigx3Ub/Q0nw1vBNVw=;
        b=eIl419GsTdGmqQuHUNovqyh7kcIextiVcUaLP1Ri5hrLAhTTsy42v/NL0rdE+LoAkg
         1+FaSweSvpJw1znjMBwFB2UzmbKA4B7AhydxV2NycySACiB3PhreliyJeG6jsDgWI+p8
         z5snQ4YxaVq+qme7+4BqNl2GpJWcPYGPBWsyWePx5FZz2PfYLGC7oDLgFlWaCSbHuvhu
         T1noAMk+fSE3UpbkSkW6EyKLzRuDVFtnLhsshX0bj9ysN92RQF6y69vCOr/s6Jn3ccZu
         ztnl1Kg15u8CuW+H2TlzxYv/BtbzbriaYoSoLmgSAnvYKyD2SBpoCDY4BJLXsTXhcTuw
         FheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656202; x=1751261002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr5oEbFyfEjRzNkoJqnkBmtmxzigx3Ub/Q0nw1vBNVw=;
        b=Mwax/Ha0avseJlKHR52L3FcYrTwtF80KpBwLm5Y+dWdEatyHMXTGn+17pKDcB5nrie
         bI9L+acprluSb4w4Un160Rz8pv1q8556NXlD5lW+laBbOzwI4AOhXjoCCHGd948FsUK6
         M4U06UCmF3lr3WeO0n/Qc9Od9BS48AfivM+Py1c6HNjz+MugbrJdM+nmuT3x3/m6VsXf
         uv8h0dns8mNu/CIQje2jTsfsGOa1f8typlZgkIwJK0G+A6AGtLssW4aO8m6YpXLPw4xt
         AFWqS50O+kIBcfasCJV/Hy+VZ04YTEDEZtNX7xx24mN/I/bnVQT/gNeCCuyKmysXgjrD
         ADcg==
X-Forwarded-Encrypted: i=1; AJvYcCVUYOBWZdkultj1K8vDjINLOGn3n0YWJcV2XFWMg72R2biVHouAgFqQ3tZa5WEx8Hg94Ehf@lists.linux.dev
X-Gm-Message-State: AOJu0YziOVSz6o1qj+BSus9MhSl9NENqd5JdQCsOnmXO43HEv0a/BYEp
	Z4HbJ5ACAz2n5FCsVJLbcgOt5XJRT6h8IKeiRvWSkFL03TeNhOwLylgx
X-Gm-Gg: ASbGncsNWEuJ+SDiNkOOGM7zpxyF9rNUE8QcxAnaUp84z6k3HRh+mwkhm5kY9IdESdX
	+gFeTMREGM6z2bE/0xwgPgPUpkyOY4ln91eJePywIE9KHd30DR6TLXyK3GtViuvwjEwaGiTirxL
	iDA8vwo00EDiC9h64HdFFYAMihGqfDO36tkHd/QQosVVBj6FUSU6/E0Zfbo0Ya/9EWxhSHou30p
	Re+lZVHbsLqnM21yyGQQTtYgt2FaUb5x7tcqsxWio+qwa6WpNdOouTdHqblt/HH92jVlpEPN038
	IKRNkHVbPyU2LMmRllzp5nglH/9mmPKra5fjSL7gf8elc8CMvRhTwd/q3JqIABEnix8b/N6B5ha
	dxW4Hh3INnnChTUIFcL9D2NRwOz7d6c5M0LnbUonVYgnQ9NweQeKW
X-Google-Smtp-Source: AGHT+IF8ui6HcFrhNAQtPJsyNOrh2z91qZHAYXZ2gqkTVMHabrtx84Vz5YTt6FSz0HrHPvK3EvWhLA==
X-Received: by 2002:a05:622a:250d:b0:49a:4fc0:56ff with SMTP id d75a77b69052e-4a77c35892amr165709491cf.12.1750656201862;
        Sun, 22 Jun 2025 22:23:21 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a79de8d57bsm9746031cf.72.2025.06.22.22.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:23:20 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8FD4B1200043;
	Mon, 23 Jun 2025 01:23:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 23 Jun 2025 01:23:19 -0400
X-ME-Sender: <xms:x-RYaLMk8b8X3XWefmq8a_pWjZDfjiJ_cDxCzoDe8Ak3y0kbJo6Hlg>
    <xme:x-RYaF-On7f3oTuTWWWEOh-fVaYHRPg4geZ4h4rIk2d6tRGMZi8bzSvVzhfaZUk2o
    vW_mQRoIHA0q57zjw>
X-ME-Received: <xmr:x-RYaKRQzSHoNjuRY1R8nvjP3Iqe8TLjWMT3VJHNdnIxDCmaXVL-3tQZsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduiedujecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:x-RYaPsZ8q7KxqSsU17dj9nZUC-zC_DY-xdSUjjxd54QslsyQu5Bkg>
    <xmx:x-RYaDdWFNrLr0LiV3_QMhzt5AzsDZOkaAIcSki1Kiy7U_FFxZHhjg>
    <xmx:x-RYaL27uM2IvG8h_Hjy48nZlOJ9zXw9VSE1NRNiXeFBXoJQNfOT2w>
    <xmx:x-RYaP9OLftPMCDJyjdl4GM0Z45SRvFRnR2noZjHkLZF2H0i1rJ8Xw>
    <xmx:x-RYaG-JCKVJTWPvrt_yVArB38gAlJT5GTYnnRrkpwzYZVZve_TU0qZG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 01:23:19 -0400 (EDT)
Date: Sun, 22 Jun 2025 22:23:18 -0700
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
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <aFjkxqnU60kqESjp@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <20250621123753.2009f05b.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621123753.2009f05b.gary@garyguo.net>

On Sat, Jun 21, 2025 at 12:37:53PM +0100, Gary Guo wrote:
[...]
> > +    /// Atomic compare and exchange.
> > +    ///
> > +    /// Compare: The comparison is done via the byte level comparison between the atomic variables
> > +    /// with the `old` value.
> > +    ///
> > +    /// Ordering: When succeeds, provides the corresponding ordering as the `Ordering` type
> > +    /// parameter indicates, and a failed one doesn't provide any ordering, the read part of a
> > +    /// failed cmpxchg should be treated as a relaxed read.
> > +    ///
> > +    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
> > +    /// otherwise returns `Err(value)`, and `value` is the value of the atomic variable when
> > +    /// cmpxchg was happening.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Full, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42);
> > +    ///
> > +    /// // Checks whether cmpxchg succeeded.
> > +    /// let success = x.cmpxchg(52, 64, Relaxed).is_ok();
> > +    /// # assert!(!success);
> > +    ///
> > +    /// // Checks whether cmpxchg failed.
> > +    /// let failure = x.cmpxchg(52, 64, Relaxed).is_err();
> > +    /// # assert!(failure);
> > +    ///
> > +    /// // Uses the old value if failed, probably re-try cmpxchg.
> > +    /// match x.cmpxchg(52, 64, Relaxed) {
> > +    ///     Ok(_) => { },
> > +    ///     Err(old) => {
> > +    ///         // do something with `old`.
> > +    ///         # assert_eq!(old, 42);
> > +    ///     }
> > +    /// }
> > +    ///
> > +    /// // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
> > +    /// let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
> > +    /// # assert_eq!(42, latest);
> > +    /// assert_eq!(64, x.load(Relaxed));
> > +    /// ```
> > +    #[doc(alias(
> > +        "atomic_cmpxchg",
> > +        "atomic64_cmpxchg",
> > +        "atomic_try_cmpxchg",
> > +        "atomic64_try_cmpxchg"
> > +    ))]
> > +    #[inline(always)]
> > +    pub fn cmpxchg<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
> > +        // Note on code generation:
> > +        //
> > +        // try_cmpxchg() is used to implement cmpxchg(), and if the helper functions are inlined,
> > +        // the compiler is able to figure out that branch is not needed if the users don't care
> > +        // about whether the operation succeeds or not. One exception is on x86, due to commit
> > +        // 44fe84459faf ("locking/atomic: Fix atomic_try_cmpxchg() semantics"), the
> > +        // atomic_try_cmpxchg() on x86 has a branch even if the caller doesn't care about the
> > +        // success of cmpxchg and only wants to use the old value. For example, for code like:
> > +        //
> > +        //     let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
> > +        //
> > +        // It will still generate code:
> > +        //
> > +        //     movl    $0x40, %ecx
> > +        //     movl    $0x34, %eax
> > +        //     lock
> > +        //     cmpxchgl        %ecx, 0x4(%rsp)
> > +        //     jne     1f
> > +        //     2:
> > +        //     ...
> > +        //     1:  movl    %eax, %ecx
> > +        //     jmp 2b
> > +        //
> > +        // This might be "fixed" by introducing a try_cmpxchg_exclusive() that knows the "*old"
> > +        // location in the C function is always safe to write.
> > +        if self.try_cmpxchg(&mut old, new, o) {
> > +            Ok(old)
> > +        } else {
> > +            Err(old)
> > +        }
> > +    }
> > +
> > +    /// Atomic compare and exchange and returns whether the operation succeeds.
> > +    ///
> > +    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg()`].
> > +    ///
> > +    /// Returns `true` means the cmpxchg succeeds otherwise returns `false` with `old` updated to
> > +    /// the value of the atomic variable when cmpxchg was happening.
> > +    #[inline(always)]
> > +    fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
> > +        let old = (old as *mut T).cast::<T::Repr>();
> > +        let new = T::into_repr(new);
> > +        let a = self.0.get().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_try_cmpchg*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllowAtomic`,
> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        //   - `old` is a valid pointer to write because it comes from a mutable reference.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        unsafe {
> > +            match Ordering::TYPE {
> > +                OrderingType::Full => T::Repr::atomic_try_cmpxchg(a, old, new),
> > +                OrderingType::Acquire => T::Repr::atomic_try_cmpxchg_acquire(a, old, new),
> > +                OrderingType::Release => T::Repr::atomic_try_cmpxchg_release(a, old, new),
> > +                OrderingType::Relaxed => T::Repr::atomic_try_cmpxchg_relaxed(a, old, new),
> > +            }
> > +        }
> 
> Again this function is only using `T::into_repr`, bypassing
> `T::from_repr` and just use pointer casting.
> 
> BTW, any reason that this is a separate function, and it couldn't just
> be in `cmpxchg` function?
> 

It's a non-public function, I feel it's easier to see that Rust's
cmpxchg() is implemented via a try_cmpxchg() that is a wrapper of
`atomic_try_cmpxchg*()`.

Regards,
Boqun

> 
> > +    }
> > +}
> 
