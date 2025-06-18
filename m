Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992D2F4A0C
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265391; cv=none; b=qQnu7Ry61/0xa6XTLB4MAzGYNFMG5EYOecaUojysuxQFDQ6+phrhVZYdcNBylT3QCwOD0a69V0DXoBa0yd5Vva9qbjwRfNbi9SGaAGhxg+Ze0zGG0enI0l+V2AuGjYIh7MF/6LFYeSkkDpsfEUzoS3IyfmZ9VqsNC7kcEL1/wUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265391; c=relaxed/simple;
	bh=/xbsQlwVEwP5ylKy/kZdE5AStjYv/8ecIplTxNP+IrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxfREhjBG3BR19fZLzhXr9OoSyS+fmn9xpiVwVwxkoUyLya1+QJe/qx7w0gEk+6qI6DJKR1wVBMCPBI3MhfKG8pdPYe3H7Dj0cyosjoB/7Q42qKRk6kxLuDFvW99+s2e+0O0+zGssSO7hHNUdXK2UFLqZgo6ZPkYYtneoBVwC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ze9Lip1I; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze9Lip1I"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a42cb03673so83647441cf.3
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265387; x=1750870187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=unAsjELoLmXleQcHS9ahtkPNHQOwUCjesMQMuSuNj88=;
        b=Ze9Lip1IGQpuFLerVd8vePxsR7ptn+bJQ6/AKBeukPaM+3NPpwbYZRnpam1KpePj2p
         V5wBqnTkgU62yBdYB/9nWeJJG68ZpB/lNSpJQsfzeT+nSMc6h+M0QkorJ/YxMZxxCWBZ
         KrDOzkoQj2MkpPRoXcq9KZkaBIhCKeo1y/DcXkzAuxkH5ViMfN/RfH+sTktaY/Hc7N9T
         7f8958yLYBFb1PyazEG0O5zqZR/XvcI+xD11GHEQLP9RxcEjjenxjm/AHuE4krn4S/2A
         zBZ4KeQELNViTURi9kYUTEajLWaqv6VyxoLXYsLxgdxWJOG5g3H3rHwXa0iure19w2OO
         1DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265387; x=1750870187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unAsjELoLmXleQcHS9ahtkPNHQOwUCjesMQMuSuNj88=;
        b=QseGSt64Y0QtusaLZb/TinBNxRuRF5+DDnzHgVbWH3zD8y97gj1t8jFD1JV4Mn708L
         l+gX3OkgqPGJmQHac3vfBzE2XXqFiQcjFoexSlPpWJvFiB7s/DjMesCdytMRIPiBitT6
         zH4GuFp8+R6PFREIDgWmBB+DB2AC/fy+SGCWMR5mUrY4BMGgLdMA1tcoA8hwaEjkFMr/
         NloC7/cJgtcewgEetWCW4fuC5ASLp1MUnWpx+by54hE7r/4Dc7l31ECXBSWRaFBkszo7
         ApjsRWrkkglKEk2/dVM83adihL0HntToBBKIizaB+YTtZVuK+7zeCRIaJfOJoPmS4fYJ
         WdrA==
X-Forwarded-Encrypted: i=1; AJvYcCVrSJSO75yy4otqkKrRQPL4FUo0ToM3+/zFxqlcJtXn5scVpEMIP60iTWuY67Es3RP8wNLb@lists.linux.dev
X-Gm-Message-State: AOJu0YwLcoL4SmxLQssC9GEy0o6IonD0ULhIq5zphJxjlfLAFLOCXgqr
	WwAzeYy+HLZ0puJMunAeDpkem7qIZif8A6wFEH6QrNoraUmgfFfTupl5
X-Gm-Gg: ASbGncsXoCpPgFE/koFqEJpPbBwzk/Bt/abtQpKtKw4xAY5RXRnCFaVQYsl+5xgoLk4
	kpKuGaIaEv3w/EZXW5nHE96Gkm1bPtpB7u+cF/NZSqB0PVbQ3fBb2+cvvZp46dhyG1c/pN0UfQF
	13v+134G7OF2aY0FClhzH/TUKzR9+5wyvossDIXPXeRA/CHpfYCTXvE2/b65NoGIMVdzKYTgXJ/
	9aDSvig9GpVbCJBkcDA8P0mf7RSzDlR383VkO325PV/RVJ1krlvrKjb0jO+ZPnloKAcC1ht94BC
	hlgNNU8u1jOPkxb1PSpt+sNJv1x4i8pJLY0wKd7YhGumyc+ozdAeenzz3JNzD/Q9ugds5vWRkPq
	TVsTFzQ4yS/7taDifSWJNTP2HLPD7rbj+32RVdSwseiD+z1gTTCsZ075s0XoJdaY=
X-Google-Smtp-Source: AGHT+IFkVX3zIQ+FXhVhrpQUa+yf0WzQ3i1XCNfjg0amMvG7G3bSmAgM/tJM3TFRmdtKO5Cru+Hzfw==
X-Received: by 2002:ac8:5186:0:b0:494:950c:6dca with SMTP id d75a77b69052e-4a747b5cb07mr187296341cf.23.1750265386911;
        Wed, 18 Jun 2025 09:49:46 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e0026sm73651941cf.61.2025.06.18.09.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:46 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 01DFF1200043;
	Wed, 18 Jun 2025 12:49:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 18 Jun 2025 12:49:46 -0400
X-ME-Sender: <xms:Ke5SaPw3zbsp01HRY2BqVJ8mNURGZRdPU5GyWJ_EaAY0qg1Gls9S6A>
    <xme:Ke5SaHRa88KP-9WMr4smhBWZ73w_juWhZrHPgcTLvV_RX-MYWG-SuDNHCm2Q1Ve2E
    Twd5ElHSMEwF8mzmw>
X-ME-Received: <xmr:Ke5SaJUTMpfDZVSot8yPbucImwBLjFwiGm8X2hNEyp7vFHHEhf_dg8Vcq4-3xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhu
    nhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhm
X-ME-Proxy: <xmx:Ke5SaJigKeYUZLlHvqw82M-pryq1HzRCZdXwSl5jn0poiClgb_15aQ>
    <xmx:Ke5SaBC1ZX5-P8lnN7zqPdxh_7rWacqqdQEcxwsa1cRn2R7XIw29Lg>
    <xmx:Ke5SaCIUoX2M2gJwPus2cv6M6Ob0qiF65s6AZqgxRAlwuk6KFvBy6Q>
    <xmx:Ke5SaACwobMz3Udhgfoln5itMrBVCCHaNZ4fC1Qr14ETbExcYXIuuw>
    <xmx:Ke5SaNy8qAjmVsGmzrDI7VzeR4VQ5kWWsJQHs97J9vFyTrrZ979wTRSH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:45 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Thomas Gleixner" <tglx@linutronix.de>
Subject: [PATCH v5 06/10] rust: sync: atomic: Add the framework of arithmetic operations
Date: Wed, 18 Jun 2025 09:49:30 -0700
Message-Id: <20250618164934.19817-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250618164934.19817-1-boqun.feng@gmail.com>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One important set of atomic operations is the arithmetic operations,
i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
make senses for all the types that `AllowAtomic` to have arithmetic
operations, for example a `Foo(u32)` may not have a reasonable add() or
sub(), plus subword types (`u8` and `u16`) currently don't have
atomic arithmetic operations even on C side and might not have them in
the future in Rust (because they are usually suboptimal on a few
architecures). Therefore add a subtrait of `AllowAtomic` describing
which types have and can do atomic arithemtic operations.

A few things about this `AllowAtomicArithmetic` trait:

* It has an associate type `Delta` instead of using
  `AllowAllowAtomic::Repr` because, a `Bar(u32)` (whose `Repr` is `i32`)
  may not wants an `add(&self, i32)`, but an `add(&self, u32)`.

* `AtomicImpl` types already implement an `AtomicHasArithmeticOps`
  trait, so add blanket implementation for them. In the future, `i8` and
  `i16` may impl `AtomicImpl` but not `AtomicHasArithmeticOps` if
  arithemtic operations are not available.

Only add() and fetch_add() are added. The rest will be added in the
future.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 101 +++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index bcdbeea45dd8..8c5bd90b2619 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -57,6 +57,23 @@ fn from_repr(repr: Self::Repr) -> Self {
     }
 }
 
+/// Atomics that allows arithmetic operations with an integer type.
+pub trait AllowAtomicArithmetic: AllowAtomic {
+    /// The delta types for arithmetic operations.
+    type Delta;
+
+    /// Converts [`Self::Delta`] into the representation of the atomic type.
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr;
+}
+
+impl<T: AtomicImpl + AtomicHasArithmeticOps> AllowAtomicArithmetic for T {
+    type Delta = Self;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d
+    }
+}
+
 impl<T: AllowAtomic> Atomic<T> {
     /// Creates a new atomic.
     pub const fn new(v: T) -> Self {
@@ -410,3 +427,87 @@ fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
         }
     }
 }
+
+impl<T: AllowAtomicArithmetic> Atomic<T>
+where
+    T::Repr: AtomicHasArithmeticOps,
+{
+    /// Atomic add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// x.add(12, Relaxed);
+    ///
+    /// assert_eq!(54, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn add<Ordering: RelaxedOnly>(&self, v: T::Delta, _: Ordering) {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_add() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            T::Repr::atomic_add(a, v);
+        }
+    }
+
+    /// Atomic fetch and add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
+    /// ```
+    #[inline(always)]
+    pub fn fetch_add<Ordering: All>(&self, v: T::Delta, _: Ordering) -> T {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_fetch_add*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_add(a, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                OrderingType::Release => T::Repr::atomic_fetch_add_release(a, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+}
-- 
2.39.5 (Apple Git-154)

