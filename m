Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC85226CE8
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509205; cv=none; b=QwG9N27JDj/CKEDsCik+SGJbP8tQY6HyL2VmRXXuFmzszrQB+X6bdeTHTHRNJZRhjFIYpns0msMXKXfo5a5hFUh3O8uM+s3ySu2KMqsykfAqUojW8VuRym94Kv1zUSahQMxvq3D6PkunRJPKsH9kUPminp8Y+PtTLOeWqS2vpc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509205; c=relaxed/simple;
	bh=xsHACheX02cEYcLip88x4wtB948B0xWNzAMevS8qR2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DuJufwVR3M1GfFTK8IfgGaCwwrNQ7wxt7gSz+vGddh3SsAxF4pUDPAJ2EvaXnFzwvvPx/zFNUBhkaoConn/VNJjjmSOPLa3VHf6a7v12ZEIkGgcw35Ugb7+WHrPRnnW4R3TSiO1w4XVSpBdZid9njPZarsF8Qhc17KmU8GiGNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQYFYRto; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQYFYRto"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fb01566184so39606816d6.1
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509201; x=1750114001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AbuO++RMiLBujeQcBYpEohvl/WMGSiraH57rxKvmSTw=;
        b=aQYFYRto7KZDmQO/XJYZmRGm6j64ipiMPfm/XS+5m2EMLyL00XuBgkgpbJ+MlYJi2Y
         vE0xiBXildafy9PXsIjmPW6G9zO8qicSaYOUB+Z/6Ift3TpFDUOFO74K+S7fTurZ8azS
         N3QdP2yAz+L04s6Q7E6VJvZZiLsjIOyC6R0K59ass+C2jw/ki2vJ63xi8Wk07WEptSpm
         TGuTXcdt6vKiMVhuug2IkX9ih2A1sQ0vf0v9wZ4DMTkYa+E6b8tHMLGsYCNfvSkbGeNc
         Upt77GDS0hbATmMPPPWPSo8d9BSKR+Kqrp5jKhsfcdzIFUj7TYgaSOM9IhRXo4/q7G3U
         xnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509201; x=1750114001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbuO++RMiLBujeQcBYpEohvl/WMGSiraH57rxKvmSTw=;
        b=ZUcUCX8sfsR1S4dHv3JmlrG0GZ/nXbR2VybvN5xXYYSs+05cMfAfJLJQWlsp4VNoyK
         Fx2hLYFREO8k/pMmR5mHDXibtgM+IMrmrQxmlr/IIt5EoQNsDyhvEZBqRND0KH3i5US7
         QPmygWZNyuHDCcYzkp5nbRGd8cEeu4tC/zx6qmr6GTqY5P8S3uSBUVkjf9G/MTrhycLP
         FyBzP+gnlcGTPc+YssylgVNt3aaDdhs751gHdiosnAmU2QHhyW7a4pNroNMlgr70/Bpl
         8Mo0PB7fBJMd5u5tZ4x3SerlhUhc/k8m7pin36yDrFktCi9k4pXaG6GIWrUpnbsc1hTS
         07mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/QSjuwQUbXy3Qhx8bznc9kxMjQz/x4+E8S/N6NmGBxpCwbDoaDwBfvIzBKztgPzgPVnlP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+2VtCetybi5G6wWjJEDcshhVotaz9yjw1yMrnPgwiqcBrNvaB
	TdwdZJjZkuJ1FTYqq7OwNbErnPJn22q9nnnS/5Ldj4EHvyWpgaBAxx1H
X-Gm-Gg: ASbGnct8LQvgnwI27Z9MIiGjb+wXfYnJxu+VV5Tl9IxH7FEQHb6ayVnDEn3UIMUPXGb
	lk+gKsUWRrlzOFq3Ybu1xucgb+dv+ygwemfUBDLMoRs6J3hrE31GIeTZpx73PjlHlormv8M17oY
	c5DzarGM24V47QKEJwH2pLfI85kLL0/YbzQPydIxUnp+ZOwqDUdOD1bQ5Bkvz8L0p5I9ncqC+gS
	PHSSy7qsMF3Ypt68nemqRB+e6Jt/USLzSj1Ou3cx9jN5QvAOLpAUH7/KDpkC/7cSVRXw1ZIyllv
	o6vQ7xLqYFZLQ4Q5SSuy7IKdCTbluUFzLWyhmLhcXHkNb+CCrdssOr0w4VrAaUAPNvXfvfN3oV2
	nIi/EbxSU10eM21gF7LAShc9+y5s2H0BRDWV+H+Ef7Fa5URaqpz6U
X-Google-Smtp-Source: AGHT+IEDIGSzlCnVFl9GQWNMSfgr9LFPsOTm8gYIWNg0ODq/n1RXj0yeteLcHT3eW2v16F5a/3qa+w==
X-Received: by 2002:a0c:f643:0:b0:6fb:f00:48a9 with SMTP id 6a1803df08f44-6fb0f004bdamr154394836d6.19.1749509200667;
        Mon, 09 Jun 2025 15:46:40 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b3648dsm56955106d6.107.2025.06.09.15.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:40 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id C898F1200043;
	Mon,  9 Jun 2025 18:46:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 09 Jun 2025 18:46:39 -0400
X-ME-Sender: <xms:T2RHaPf2Q9qBHCzUXcmhTrAZYzSCOoEMsHXe991HTGkeJOGts2svjw>
    <xme:T2RHaFMtfCS7wemG2N7YM-fS6tzWQAu2Q8xcZFw3BJuI1wppLTQ5N8mRIWVfkOdCt
    Z3bsaC3i-MdsdYRRQ>
X-ME-Received: <xmr:T2RHaIg2fNMvu2IexrRo-JjlZyd1HF8L9Me4k7JlOwrawsONDnlalfX4HRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:T2RHaA_UJB_kRbTvAljJd_vCprotjmmEgvmEj319_QGyUCPi87qF6w>
    <xmx:T2RHaLuISxUlbySjDNiSV0-UY81nyU3SDEhVy8lUVOHM0cW2AN5LGQ>
    <xmx:T2RHaPHVS6XjmyGjd4cpU8gSyVCrYXbgL26sFawVMoRr3I8Bgzyb3A>
    <xmx:T2RHaCMvSi5hWZjsO0fxM9hg0iA1N0qO5pXI3DanpZYcbihPVs9aww>
    <xmx:T2RHaMNQ5DIo5SNV29T75o7JhbBE958GtQ2Hhv7hpyigg4YMhKG-Wl3k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:39 -0400 (EDT)
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
Subject: [PATCH v4 06/10] rust: sync: atomic: Add the framework of arithmetic operations
Date: Mon,  9 Jun 2025 15:46:11 -0700
Message-Id: <20250609224615.27061-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250609224615.27061-1-boqun.feng@gmail.com>
References: <20250609224615.27061-1-boqun.feng@gmail.com>
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
 rust/kernel/sync/atomic/generic.rs | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 39a9e208e767..f0bc831e8079 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -3,6 +3,7 @@
 //! Generic atomic primitives.
 
 use super::ops::*;
+use super::ordering;
 use super::ordering::*;
 use crate::types::Opaque;
 
@@ -57,6 +58,23 @@ fn from_repr(repr: Self::Repr) -> Self {
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
@@ -410,3 +428,87 @@ fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
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
+            match Ordering::ORDER {
+                ordering::OrderingDesc::Full => T::Repr::atomic_fetch_add(a, v),
+                ordering::OrderingDesc::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                ordering::OrderingDesc::Release => T::Repr::atomic_fetch_add_release(a, v),
+                ordering::OrderingDesc::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+}
-- 
2.39.5 (Apple Git-154)

