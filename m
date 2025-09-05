Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1853E274FEB
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047324; cv=none; b=kzL0TT0eqETGm7kSsQCqWss0OVXIod6otrKS8Aofiy4m/mk/IqCcfV9QB1yqZz/9p+ht7Fp2ACjnZJRsh/RGhT61rMWl5m9KuAlxc+lVfgEBG2XV5HL+zORcRsgueJDgLf+EN/iRNE7NHVgQisDLK19ws81vLCstOLRQCa5sR10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047324; c=relaxed/simple;
	bh=zQamHJdlclfzJCS5fnsSE/oxkQRLFtzVSNOcmgKUm2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/PShAHDFe/t9eUqeTolKAbBoq1xKwpZyzfhypELsSuVkYtJP07mubnHl/RLedfwtoWIVUcIaITZePor52JSbDa5mytuamJJB6vE1zK8CK+kmuVCJ6C1asJRuCJpL7gAILBKrMlSHCd3OOLpAf8eXIEPghoZrOCmPUl+cjHynH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWhtAee8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWhtAee8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70ba7aa131fso19966756d6.2
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047322; x=1757652122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9pUt6QL6shWxQnZqi47vRRgHRJwQTTOipX1hhULcvIA=;
        b=eWhtAee8xHASnKkGUmvnWTFCrAxuQr6t1vPE75k+Y1wO5R4D1tGiK1xYsKVfRZ03Cw
         nQNf+LZL5UlL88VKZSmhVh7pE5WvdKkxaxjrGz1krM7h3SG6XJyVzH8vYjK2roLEsi+G
         B6q6OCkt8CRKWRvsRxqJD38xdX4va3YMyDPIF4TNhXQdrUKBj6W1DkSiUKzjkKW/Cr/J
         lZCkY2pDLzLHfzV3B5m4NBY7tkfWKCXBA3zSVVTLLaqMO32ZmE89vi69Eq/ykLK9ciuq
         JbkvKAB63GJTzdZCpc46SMS4NMe/4tctTwYBUPISMYvtD2+3hn3jiRqn4oIApNsq11Go
         M61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047322; x=1757652122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pUt6QL6shWxQnZqi47vRRgHRJwQTTOipX1hhULcvIA=;
        b=TwIGeLAiqtF48OQBRs6+g8LD+jzKHhDg6XXH8udZPJtPxY8iyEAf3FsXeyVudlqT7A
         w6e8iIeHN1Chb0ptPWtgEb1c7KtvBeSzNby/5VkUq7/8oMfPqRDM65zSTM3CFxC8IgAp
         760w1KrU5Np5oZnF5PXML3zXcqejgsaUQkuM0mOmMNG+EZaU2vSLu8nlxkMZKCvLTquL
         Z3G40uUQrNTE/MT3Eksg7rfvT6wlPNANyjUfOFRd3UbQgqR77xHk+tGU0ufkkUTHhFXC
         mk5cWoacaBWfq8w72rd54GX2waxkCu0U2tpOt1T+L9DwKcaclVDqSGM9W6XEDi6yL+SI
         NLpA==
X-Forwarded-Encrypted: i=1; AJvYcCX9EkikamvKRj21LUqdVk+3Tq8fAPPoju7spbT0g02Be2EsNLunyTD8XhZzxnr4SCGvHE2u@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7F9ZufQ9eD9hGgBqkzwQqzq+h+3vg2N9UlJElmS7Yo8xPSaTZ
	FFjsY7VaEl1C+2rDv2WPudt7lZwIUMnAtYdX33sG3hzEz7rYOxIhOOMM
X-Gm-Gg: ASbGnctfIa6+2nrIfbDDxA3NfotF+qGWfZiGZUICDlp1uRi5WsZ80k696E0U3xgpH1L
	3QA2GQ3q78juplZyh/3pF3q+GaO5aAYF2GJExqM9cUygpySDbPL5zYIKQiwH8zhNfpdofh7bPM1
	SXW9G7O1bC/cRFZwpKyzPWTlXRIs8D4vsbiijiN1PYg8IF0a8iERSsPOedu59d+SL3yrF4EJGIm
	ii0FCRb9C3up+TgbLmYfGQvfAnK2t5NmyvNvD5dWZoohnBKubA/76M22QAgFKsy3M/pTi70CC76
	qJVzYaX3Q37czrz5zG1LZziLZtMEZG/T+dOuzDLMDuNwt0v8RdBU/zXa5laq3s/K6BMJOvJNOQE
	6qY+7vBguz8hU1GvXxXKvzb4LDFalnaVs9QhXUmz1Af7lnMoEyUoD2zTiN9caiSlnR8fV7dZT/w
	ZovzHTlHrI3cNJcEO6DijSi/Q=
X-Google-Smtp-Source: AGHT+IFu86ZzUsajkRJABiWj6gCvEZ057iRVFhb5HsRQuF1AgZ0geiuF4S0KN1FyRQoem/UgY097gg==
X-Received: by 2002:a05:6214:21cd:b0:727:b235:cfa with SMTP id 6a1803df08f44-727b2350e1amr73574316d6.47.1757047321898;
        Thu, 04 Sep 2025 21:42:01 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-728d6f8b338sm25185046d6.0.2025.09.04.21.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:01 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17370F40066;
	Fri,  5 Sep 2025 00:42:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 05 Sep 2025 00:42:01 -0400
X-ME-Sender: <xms:GGq6aE39XDcWJPyMMuct83NZoxEvIgvW3HTFyIO54LSGL1ktAHxYIg>
    <xme:GGq6aMzuOnDX8VIwORyViZgcmFxVg1hiGZjp-kDdnJZDSpijueNC66LLP9DvPRLTo
    H0UX29IKiItBH1_zQ>
X-ME-Received: <xmr:GGq6aOreJRttD0pij9aQKRH2fUrF_Brt9pyh-mRgwjzbevndJWmJwceT7Bw8TLpciJqt7gCKuKD1X7rhM2n96308Jr_L9f3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfehieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
    dprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:GGq6aKXeiXxEJJEH6Ga3AjTxm6rVVi4smcmGt8BSkawJ1w8D95XJuQ>
    <xmx:GWq6aNqgM_uaulBC-dnfqAexD8HsLMIr1_xCYU8U7dwoqKrfLeNZhA>
    <xmx:GWq6aGF6QbbBu4MfPObhWoj_IWsX_0HDt6dHnJpdbwdpk3gIgep5XQ>
    <xmx:GWq6aHv1TieBtvTFiQakWcXjsUNZwY2alij77JsHDWQYhUDx93-Z_Q>
    <xmx:GWq6aBQVSSOUXpHAKQvatQZzvRbfy4TTcmNtLOEw-VIxRLuOjz-uz-ZD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:00 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: "Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	stern@rowland.harvard.edu,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 06/14] rust: sync: atomic: Add the framework of arithmetic operations
Date: Thu,  4 Sep 2025 21:41:33 -0700
Message-ID: <20250905044141.77868-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905044141.77868-1-boqun.feng@gmail.com>
References: <20250905044141.77868-1-boqun.feng@gmail.com>
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
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250719030827.61357-7-boqun.feng@gmail.com/
---
 rust/kernel/sync/atomic.rs           | 94 +++++++++++++++++++++++++++-
 rust/kernel/sync/atomic/predefine.rs | 14 +++++
 2 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4c32d12dc61e..016a6bcaf080 100644
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
@@ -112,6 +111,19 @@ pub unsafe trait AtomicType: Sized + Send + Copy {
     type Repr: AtomicImpl;
 }
 
+/// Types that support atomic add operations.
+///
+/// # Safety
+///
+// TODO: Properly defines `wrapping_add` in the following comment.
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
@@ -459,3 +471,81 @@ fn try_cmpxchg<Ordering: ordering::Ordering>(&self, old: &mut T, new: T, _: Orde
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
2.51.0

