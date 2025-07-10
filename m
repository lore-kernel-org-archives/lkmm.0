Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32652BF3D3
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127270; cv=none; b=el6CtrLtH+Fbiy2tmZHx35JZ7O7LZ02aDXf/F+Tn6nE2t95TsGlf5l+BgejBNPzlUN9T66C2YjYkL5pWBwQ3pm7zn7XIyh4UisYbEcn3JqXzjSRDLoiiy/7KCXigDypqcrwnICjvF2Y7fb7nqufGtR/ToB7zwYNCy7SgUGSW5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127270; c=relaxed/simple;
	bh=3aDT8xc/mZaqD3R6xW0byPl+1OOqZB7b2MyrXdrjcFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhVOWEt9mx28zeDseFe/3vKZ92yRoz+PQcClC3YMAefnMnzxYSetiDDr/0x7diH5HOfMTfq8PTkOD/NNOGNahB0yG3y3DflzME5HlZR5u8WYha+x57SSc2hxZfUpdP5qsSCSbnrOd8jgK4wBbXLVEd0zGKH4w4syVJQuxDP9KIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRy1nGsw; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRy1nGsw"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d5e18860aeso36086585a.0
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127267; x=1752732067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NVWTVCvJevxqd+qs8pw1lqVsFxJYqEuOxZQt2VZuh4s=;
        b=aRy1nGswCi41dLZ/haD21LzNTL7R5JX2beII7UrcR4m54UvtRhu268dMupOOrGoVWJ
         iC+jKF+ntVgmwsD+45eBzE4q77z75yFb74syR2q3KZZJ7C0/B+FL6K8wAIKme63emAiO
         20Ua0VFFi2lVq7GSHfjoxfBshIvcuLuGQbPVZJwtfhr8t/uAHJbqurVsR7D732MltaC4
         sRg626SEI8VYJzfluwQTKp8dIGoYIRwiLQRQ4YYsRahNTpVjYx/LoN4V8wdOMet9o8gD
         DMsJKPcSuP099Bq9LjCxEg79FRfkDbYEJxcIwl6BiVZ224mBqQ7lSLKAMglbjUiW70mv
         Sv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127267; x=1752732067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVWTVCvJevxqd+qs8pw1lqVsFxJYqEuOxZQt2VZuh4s=;
        b=iInkFFt9I/O1l+gD7wJijbCdKqEZvf/YcTXf1cooXuO74Az5hLFV8QofEUtyw0Pu65
         USDoKqk3xmfGU9lHdJDUDKXHAy5mZKFlSSVGhxZygyeJntnYFIXpbjXGLnAlHf+RYc8u
         tdDO/hc1M/VJkvKODm4ym7tGs/nBprfr1EoFiJGDlUA9WHIJ5XeEOzNsX1Ow9UU0auZm
         +VfxRzuMP+ipJ86FljqLBGIexjQd7UXw12HhHRNOHAV1+hx8DKnexxKheGly7h8mN4K2
         kUwLyQYrHJJdLe9bYxtKsNZ6zekY5uYxGlVEC7z2aWtosQ/hR8jKqe7LVQAbvS21p7Qs
         cw4w==
X-Forwarded-Encrypted: i=1; AJvYcCUSPonVm+XmDnu4h3JAux7TMLIeiyqzKwS6Q9zpYyVoGErxKZSdVEkw0iBSZhx4lVVS8sK3@lists.linux.dev
X-Gm-Message-State: AOJu0YyGqw1jWMFVjz+BteAYuHip/LZsMGGczrsmV6EA3jCxudv0bTcB
	pD1gko6yt6F29yKSCZ0sNubPAl/z7f2mg/DSlXVBS0/9IeM4glioZH+Y
X-Gm-Gg: ASbGnctVKvSUWE/wWBdHMCsDEX+H96IuPaxDsJNg0GYQIa+MRGYk51aG/TIkQBDPa19
	gd+jDWMB7/3A6IITfZkE7ASkZPXkDCtn4ntbI2Xbg2gcCbTgCBPb8Vu13xuQ3nYIX6VvETy05XS
	YFtznv2ylu+qDyiKnhoOvCS8BemqKcH41kYFutiCzTo2ha32bV7TADQHQCGJC/pa6Bin5EDbcAq
	51gyHSfXn8l6WYHsvToqx6/AXeZSI6cXNp3j2qQgHwOMJqBrDD1aRp0Il7ckXcctrh+9Bak2s1t
	qU/VqONWNfuEnTcTx6RWpPaPISdQiohQO94QbKQb0p9HlcinOP/9iEjT/7mtKBb3kKRXNHG5Ixn
	sNQnHuz3tbX0TxhXLrGMGCGdydan5RMHm6bIzIKg0apo9d6NmAXso
X-Google-Smtp-Source: AGHT+IF7AxMRMuyHEY/+wMkbbSv8WJlfegxN+AvN/57DcubPXOhYQzZaON2scCs7KvKMKjAZwGo6Wg==
X-Received: by 2002:a05:6214:29e3:b0:702:bd47:c83b with SMTP id 6a1803df08f44-704982503ffmr15889926d6.45.1752127266602;
        Wed, 09 Jul 2025 23:01:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm5051006d6.73.2025.07.09.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:01:06 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 90EF4F4006C;
	Thu, 10 Jul 2025 02:01:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 10 Jul 2025 02:01:05 -0400
X-ME-Sender: <xms:IVdvaGij1Fj8tPCa9hGmGpNGbp2wdKj7WKCc-djv0JZlfFAXS4bpaA>
    <xme:IVdvaIpiSPUxGpTkDggFEqYhaNln1s1In5s3gSb69wiUPw4DN5K6EWDRT-8jnrRSG
    yFPjKPJz8HJwOZxJA>
X-ME-Received: <xmr:IVdvaMyag58jHxjysE5i7iP0t8RX04L1MaFOmdA5zymNcUCoJ5eb0VPVbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeijecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:IVdvaHyII3wAj6vMipXysvd9Hljyq5KD7oJt-e_R8EeZiDNCfSAY3w>
    <xmx:IVdvaEabtKvhojTR0DoDYzHFqYWN_H75usL87egsTEt685cL8q3-Pw>
    <xmx:IVdvaIkKoIciytdSc4KvOdTTUuUyK2LbLP_KIfEb92slokP843zpeg>
    <xmx:IVdvaJFzlQqjSDZj2c9Iyjc7-szx4n0s-vSCbP3oK70v2OrGhLLhQg>
    <xmx:IVdvaPjNRUxfR9oTLCdt_jrtcB_8T-wfb7PDK2nh5NX4Q6sM29CDpAwJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:01:04 -0400 (EDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 6/9] rust: sync: atomic: Add the framework of arithmetic operations
Date: Wed,  9 Jul 2025 23:00:49 -0700
Message-Id: <20250710060052.11955-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250710060052.11955-1-boqun.feng@gmail.com>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
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

Trait `AllowAtomicArithmetic` has an associate type `Delta` instead of
using `AllowAllowAtomic::Repr` because, a `Bar(u32)` (whose `Repr` is
`i32`) may not wants an `add(&self, i32)`, but an `add(&self, u32)`.

Only add() and fetch_add() are added. The rest will be added in the
future.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         |  18 +++++
 rust/kernel/sync/atomic/generic.rs | 108 +++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index c5193c1c90fe..26f66cccd4e0 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -29,8 +29,26 @@ unsafe impl generic::AllowAtomic for i32 {
     type Repr = i32;
 }
 
+// SAFETY: `i32` is always sound to transmute back to itself.
+unsafe impl generic::AllowAtomicArithmetic for i32 {
+    type Delta = i32;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d
+    }
+}
+
 // SAFETY: `i64` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl generic::AllowAtomic for i64 {
     type Repr = i64;
 }
+
+// SAFETY: `i64` is always sound to transmute back to itself.
+unsafe impl generic::AllowAtomicArithmetic for i64 {
+    type Delta = i64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d
+    }
+}
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 1beb802843ee..412a2c811c3d 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -111,6 +111,20 @@ const fn into_repr<T: AllowAtomic>(v: T) -> T::Repr {
     unsafe { core::mem::transmute_copy(&r) }
 }
 
+/// Atomics that allows arithmetic operations with an integer type.
+///
+/// # Safety
+///
+/// Implementers must guarantee [`Self::Repr`] can always soundly [`transmute()`] to [`Self`] after
+/// arithmetic operations.
+pub unsafe trait AllowAtomicArithmetic: AllowAtomic {
+    /// The delta types for arithmetic operations.
+    type Delta;
+
+    /// Converts [`Self::Delta`] into the representation of the atomic type.
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr;
+}
+
 impl<T: AllowAtomic> Atomic<T> {
     /// Creates a new atomic.
     pub const fn new(v: T) -> Self {
@@ -457,3 +471,97 @@ fn try_cmpxchg<Ordering: Any>(&self, old: &mut T, new: T, _: Ordering) -> bool {
         ret
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
+        // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is also a
+        // valid pointer of `T::Repr`.
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_add() function:
+        //   - `a` is a valid pointer for the function per the CAST justification above.
+        //   - Per the type guarantees, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr()`:
+        //   - Atomic operations are used here.
+        // - For the bit validity of `Atomic<T>`:
+        //   - `T: AllowAtomicArithmetic` guarantees the arithmetic operation result is sound to
+        //     stored in an `Atomic<T>`.
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
+    pub fn fetch_add<Ordering: Any>(&self, v: T::Delta, _: Ordering) -> T {
+        let v = T::delta_into_repr(v);
+        // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is also a
+        // valid pointer of `T::Repr`.
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_fetch_add*() function:
+        //   - `a` is a valid pointer for the function per the CAST justification above.
+        //   - Per the type guarantees, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr()`:
+        //   - Atomic operations are used here.
+        // - For the bit validity of `Atomic<T>`:
+        //   - `T: AllowAtomicArithmetic` guarantees the arithmetic operation result is sound to
+        //     stored in an `Atomic<T>`.
+        let ret = unsafe {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_add(a, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                OrderingType::Release => T::Repr::atomic_fetch_add_release(a, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        // SAFETY: Per safety requirement of `AllowAtomicArithmetic`, `ret` is a valid bit pattern
+        // of `T`.
+        unsafe { from_repr(ret) }
+    }
+}
-- 
2.39.5 (Apple Git-154)

