Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D121FF4E
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752894526; cv=none; b=H4wySaB32xS48aSrhAb4ium4lfTP0/9V5KOCUNXug5LL+D1rPVvFSFexVYDIdPbGa4HsxCHO+KjaEoQu4gY2+k3Q7YLtDAdvAOdKEphOblc4MEYCdQWUlu/OAUcpxjo1UN/DN2S3u1c1XA49TPAE2HXiWydWJnLitRmcdBKgqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752894526; c=relaxed/simple;
	bh=rT8/jX4sRu6LTU4WYteSZSqRX1DtiFWLv/jTGTQzhU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kUve9bOjBV1CVSnIgKsqQ+2B6syyk6AXIyh3jtGfQ9J9ebJdiTnWpxTkeu7pzzEAk9qiLNRKiEMkoIPPxpbn4fGZ0Bbo07Wuq+5nCUYFw6TxQaVutOrG95xNlfR++b4Q7FG7Ugw+oufOcQNGVDVubLVBjTuFUEjGpH7j4t5PfEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrtYJM73; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrtYJM73"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab81d0169cso37161631cf.2
        for <lkmm@lists.linux.dev>; Fri, 18 Jul 2025 20:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752894521; x=1753499321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=COdJ3V51vaX1EoPXgut8XfxRVUy1aTIFOkuQTW2lPh8=;
        b=HrtYJM735U+h3E6nDpsCBXtqPrAevaBAsYEv6hNp2bgCidrUP35jw636B1Dx7vx/d2
         o8cisji8jb9ir4BOffS+A10fL7TLIBE9S4ZzEtnms6KdiqR0FmItLTR9aWePXO880Rc/
         rA+1b7g9Ay+Et/ozuA/d0TBPHZ/4YZuOQnT5xd0EdHVz2N5h+HjA1Vp/EHA5EKC0LIL2
         GnUf1yqlgtJ73hadkcLAm9SqAN2yDcPPwacBw/apjurYrZh+nTFHe6wmUA98ygxTG4SR
         Bc2Pr+8jpjH65OPC/I9oR92xJBEnizvo/w3XwqVT1ECb4C9o2uQvYp9LzgKexWihH4dg
         WrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752894521; x=1753499321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COdJ3V51vaX1EoPXgut8XfxRVUy1aTIFOkuQTW2lPh8=;
        b=cjDAoEnem2z/PcyrnTxfsHVaou3S26FlqvCg1dgTNoas3mqQT24nFp9kiUJ5P/VfYW
         NLdETwmqiwZLb5ru8TyObIKMPg22kA3Uv1mwA5iUpvvjh7aOT+zdLgnGlZCXoxZxY3HK
         dWp/SL4qErjiZBEUc4vniSCcuu+uIAplXsXdNFzVWGJOm5fM+BWdnluDOG7ayNdX3hpx
         MpPe0WUiUekc2PoDy3u4AVx0G55BaMwi+5H9GMAr5A47Il4ndsl69ZMOwMgTbkcYUZSk
         V0i7hntrzPasCb6dV3rJUcy83G7k4u2ICj5w7J6pmexmoniWtCyjonOv0zUZ0eGVl+w8
         po8w==
X-Forwarded-Encrypted: i=1; AJvYcCXRBG+MxahkQiZCBiC3MmSauI8hz5FcR4wvc8jhr59RwCO+t+aIOLkahiB3XgyWxcFhyQzC@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ05dBlcEegUClOJ7JC+N5NQ3D9u58Be2f/lnF4MRfQAxrO/RS
	5zzxEvGTTJlmC7VeHWuNKHMWG5GcLV3BFhtL5wV3CndsoqYzwzaVnPGF
X-Gm-Gg: ASbGncvoeCv22jWwVxxq8FDLLGyJmpjDfFWwjGR7/UaCGeq4SBeD/NJ5+fUsc8Vafpt
	86Yy0rz2+zrR+kaW62Gh3oNwxcuRkNYTERdH0wik+Pl87Fb3xoPG6508DzEdH6a0nOs9GfW6m2m
	Yy7OKFOqfH+CWDB99TxgMzH8AiPi1yETGFpHw7j/yILF2W+AgqRyL2iyjV1+lUDbU0XAgZ+kzBs
	9Je2h4yWxLDZh1nJOdRAjAZ78WDZJa+ZXim04ZF3FIYkwlaA1VGV8cT+hAN46GIZaFvpFHr3bRl
	cYpz9cgXGopLVNtZvPra7DrU2z69TO1GpiaNm3M7kK+rHbNqL6X7YLWXApkH8aG2ovoObkk1A4+
	wGdut7/JCutkzZClRQE+rN6ggVc23EjutL7HYOK0HvnQ9oZ+VgYtIaGbUsdVNcR5OoUN3MtHvNn
	kTcD4zSySE++TdkT1kDZa9X6A=
X-Google-Smtp-Source: AGHT+IHCBuOpr0SfTTkjVmMnXUqgVAxXWB+r+qSXNqH0RjbQYzPVXuRtk2OZeOKwIh5pkAUtU9SfvA==
X-Received: by 2002:a05:622a:1898:b0:4ab:3b66:55dd with SMTP id d75a77b69052e-4ab90a22088mr214094271cf.17.1752894521123;
        Fri, 18 Jul 2025 20:08:41 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4aecf6dsm15080441cf.47.2025.07.18.20.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 20:08:40 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11D8BF40066;
	Fri, 18 Jul 2025 23:08:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 18 Jul 2025 23:08:40 -0400
X-ME-Sender: <xms:Nwx7aLwifqofOdl2tSnbvfRLTvtLM3Z_Vqg0rX7NFWNmgClA_UloIA>
    <xme:Nwx7aEwbC0K_93TgOcKFhHSDEPWJUKAVaSyHBPLZ_4aHiTLvKnBZPgxiRDDbKmXyD
    D1JEly5weyMoFTXqg>
X-ME-Received: <xmr:Nwx7aJ5GYG-moGcUxDqKPEgy3yV4yaHbLZXnSgNrDMFBXOWcf6rS8OkXaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeihedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:Nwx7aFCvCa1vzLFBLMO7qNsAbSsHwCmKnqR8f8EE3Tvr6vN2KRO2Hg>
    <xmx:Nwx7aLDcWBa89o4RKqWn6d1vWemajcagohhdI4AB_jQCqt7IAwvPaQ>
    <xmx:Nwx7aGotAPaTgEddDgK9Tqc5cZs4gtuOTddf7rojpCgtZPiYj3TzxQ>
    <xmx:Nwx7aN2bSQAsFX77uTPBy9FkGe1jia_-MmqFCH0Vbib6zM3UEz31gg>
    <xmx:OAx7aFXMyZRUGfuAUUt-Xaum8fTZWKbnHQ2TYMoVnY8d8JA2CQAchwMq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 23:08:39 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org
Cc: "Miguel Ojeda" <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>,
	"Boqun Feng" <boqun.feng@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Wedson Almeida Filho" <wedsonaf@gmail.com>,
	"Viresh Kumar" <viresh.kumar@linaro.org>,
	"Lyude Paul" <lyude@redhat.com>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Mitchell Levy" <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Linus Torvalds" <torvalds@linux-foundation.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Alan Stern" <stern@rowland.harvard.edu>
Subject: [PATCH v8 6/9] rust: sync: atomic: Add the framework of arithmetic operations
Date: Fri, 18 Jul 2025 20:08:24 -0700
Message-Id: <20250719030827.61357-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250719030827.61357-1-boqun.feng@gmail.com>
References: <20250719030827.61357-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One important set of atomic operations is the arithmetic operations,
i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
make senses for all the types that `AtomicType` to have arithmetic
operations, for example a `Foo(u32)` may not have a reasonable add() or
sub(), plus subword types (`u8` and `u16`) currently don't have
atomic arithmetic operations even on C side and might not have them in
the future in Rust (because they are usually suboptimal on a few
architecures). Therefore the plan is to add a few subtraits of
`AtomicType` describing which types have and can do atomic arithemtic
operations.

One trait `AtomicAdd` is added, and only add() and fetch_add() are
added. The rest will be added in the future.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs           | 93 +++++++++++++++++++++++++++-
 rust/kernel/sync/atomic/predefine.rs | 14 +++++
 2 files changed, 105 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 793134aeaac1..e3a30b6aaee4 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -16,7 +16,6 @@
 //!
 //! [`LKMM`]: srctree/tools/memory-model/
 
-#[allow(dead_code, unreachable_pub)]
 mod internal;
 pub mod ordering;
 mod predefine;
@@ -25,7 +24,7 @@
 pub use ordering::{Acquire, Full, Relaxed, Release};
 
 use crate::build_error;
-use internal::{AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
+use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
 use ordering::OrderingType;
 
 /// A memory location which can be safely modified from multiple execution contexts.
@@ -115,6 +114,18 @@ pub unsafe trait AtomicType: Sized + Send + Copy {
     type Repr: AtomicImpl;
 }
 
+/// Types that support atomic add operations.
+///
+/// # Safety
+///
+/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
+/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
+/// yield a value with a bit pattern also valid for `Self`.
+pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
+    /// Converts `Rhs` into the `Delta` type of the atomic implementation.
+    fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
+}
+
 #[inline(always)]
 const fn into_repr<T: AtomicType>(v: T) -> T::Repr {
     // SAFETY: Per the safety requirement of `AtomicType`, `T` is round-trip transmutable to
@@ -462,3 +473,81 @@ fn try_cmpxchg<Ordering: ordering::Ordering>(&self, old: &mut T, new: T, _: Orde
         ret
     }
 }
+
+impl<T: AtomicType> Atomic<T>
+where
+    T::Repr: AtomicArithmeticOps,
+{
+    /// Atomic add.
+    ///
+    /// Atomically updates `*self` to `(*self).wrapping_add(v)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
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
+    pub fn add<Rhs>(&self, v: Rhs, _: ordering::Relaxed)
+    where
+        T: AtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_add()` due to safety requirement of
+        // `AtomicAdd`.
+        T::Repr::atomic_add(&self.0, v);
+    }
+
+    /// Atomic fetch and add.
+    ///
+    /// Atomically updates `*self` to `(*self).wrapping_add(v)`, and returns the value of `*self`
+    /// before the update.
+    ///
+    /// # Examples
+    ///
+    /// ```
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
+    pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T
+    where
+        T: AtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_fetch_add*()` due to safety requirement
+        // of `AtomicAdd`.
+        let ret = {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_add(&self.0, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_add_acquire(&self.0, v),
+                OrderingType::Release => T::Repr::atomic_fetch_add_release(&self.0, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_add_relaxed(&self.0, v),
+            }
+        };
+
+        // SAFETY: `ret` comes from reading `self.0`, which is a valid `T` per type invariants.
+        unsafe { from_repr(ret) }
+    }
+}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 33356deee952..a6e5883be7cb 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -8,8 +8,22 @@ unsafe impl super::AtomicType for i32 {
     type Repr = i32;
 }
 
+// SAFETY: The wrapping add result of two `i32`s is a valid `i32`.
+unsafe impl super::AtomicAdd<i32> for i32 {
+    fn rhs_into_delta(rhs: i32) -> i32 {
+        rhs
+    }
+}
+
 // SAFETY: `i64` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i64 {
     type Repr = i64;
 }
+
+// SAFETY: The wrapping add result of two `i64`s is a valid `i64`.
+unsafe impl super::AtomicAdd<i64> for i64 {
+    fn rhs_into_delta(rhs: i64) -> i64 {
+        rhs
+    }
+}
-- 
2.39.5 (Apple Git-154)

