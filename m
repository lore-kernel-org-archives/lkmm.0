Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A890223DCF
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471438; cv=none; b=LN5IWfHOv7MWo1+cg65oX9RFPtH2n7rLOHl8yuoRfbjU41r2bW/Az3tMi3E8zDF3le3hjBkT0pY7lbsjFgZrM8iSEwdLx36mKLfWpgTtsQf6rexWPy6cPhQmiiYPYSUIkH9WTHU4e07b3IqpDk11+4OY7IR1LTv1Nm1N3J0nCHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471438; c=relaxed/simple;
	bh=RdqOL7HUpVhGhmtZOWeFb6/5oGV3e0YDMIsRXjOH6lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V28T2pJsXcYEa+zWHZFAfWYgsNzIg2twBBIsJVV6XVCsmMTQbhQAycfwY0k2u/SoLQ1tpd5LULd8CwDraXhvuaGVP3bAif7oaNeM+ToTZVmUtHa5g1IMrBpl5OnjyY5r29zidWrrkpQ9mb7j+LILTZLWztD+8kBlDxiUfszrH58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbRzXcUT; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbRzXcUT"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ab6e66ea68so5472181cf.1
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471435; x=1753076235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B9wJ4c2U301QOkQuCdVz7fDf/TBtX7Q85JWYXNeFCIg=;
        b=XbRzXcUT1ZunTdd6Z3u6kjyi1OyJGC0BZKvbRmK6vI1oQ8Mc4SenBnSrDwW10Se2f+
         igqjUIYTvQXjtJLqHkix9WnOiaUGRLXy082q35hCabMRclmzAvtZIKcrFbRsO3mWgB4f
         WaFJ/dLnlsSt8owuezYx+gOMADxc5XCaNTZi4SOHoSWfIzuNMdNtgE6yg3sd8a9sFFR9
         x+5bkS7aEcNnGAn0609IqzpCr5EYAvs0ElwZBmIyvx+xElMaMkbuP6PWD1i7r9Q+6yzV
         O5I0KFXukQIhjhS16Vg9bdrKxgPNMs02MuawCR7nx+Q4ZApLBYCRNzBFk89FenHsG8dU
         ksZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471435; x=1753076235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9wJ4c2U301QOkQuCdVz7fDf/TBtX7Q85JWYXNeFCIg=;
        b=GSyqSAs9p2orJJl/lrEh/FqQarPRClOMS2Nlff4jd68hYp5pYr+ROoYrXuBbdHE4Ty
         SUBZo+K8pT0eziuV4DDFcyypOSB1Il62ALK9x/dR1FRG47+aRid2BvMteu37hEJRuSPj
         d+NClsyPya6U1N7kG575KVyePtEE6OpbEiQX0E1cxv3nssB63BfvXaX+GLQ5DPHlD29M
         SYZjBjeZ273t7V1rhWdhLsARCmkoC82vMfs7EqOSftH9AtHTlzUBF7vfkBoQlPXaYa8b
         OuAhwB6IUt9Y85x40f64SkoJ64CwCyWhtoQrL/dyvnu6L6tn0Q1SRTDm4dTOQImkuC+J
         yVmw==
X-Forwarded-Encrypted: i=1; AJvYcCVxK5xRW+rVaMbqE9sVqZ9m/k7jTYAJpi1RncIKjjrdZ9Lt4+HEju8h1iOsqslhR3mrGjbN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4W2+NZj6fv3/mXYky0TahO1z83CTuxW9tDDdekqETQ9JlsmlE
	YE2TMIs1lWhp70c0yG/B8UZRtX4A+l0H0R8HbGJtOxEqSCFE9lDOEsqZ
X-Gm-Gg: ASbGncsysG5pvFUGIKAUVvcx0Znusk/Zj9YRCfaaliXfzXl1ONnVVxH2EGyjGRAH7Yr
	5BiPzjBNG1DagW764tdMEMYtCiluGntxjPEWDbDfU40iI17G5DkV5A3r7eCwfo5AzmTQ5VuC9Dp
	+p/w+FY96Z8Wrug29ONA0iHcwhDW3HkRMhF/bxVCJtprZdOe0IC9/9iHOQ+pnMSwsWsFoe5PsbL
	WEjvZ5J7+NksCmrJUYYGecC/66MPvEbfrkdwYDDsr346JIxHW3JPPvHqUfKxQ8vjxnDj9D7G/X5
	w1JmoGzulW4IyYU9Et62rkU5gPpaJcMsTnr/RQfL0L5HL0K36CdEGr+mipygW7Bi85YKywlQf0a
	35mfnPhwTvc7zKSmcUOcD5V9QpoGx1yM9Y4k6tZ3zCz23OGeqh5KbZNC4rb0aZcAi9bSfREx3Ni
	49C0SRFeh3DIHNnmRUWtoXiS4=
X-Google-Smtp-Source: AGHT+IG5facqxAvDpAAJ11zvnFYDqew6+xXMuG4BL4VHcOgrov9P1XQMep/v3/xqYQo80hELve2k3A==
X-Received: by 2002:ac8:5dc6:0:b0:4ab:6b08:9db8 with SMTP id d75a77b69052e-4ab6b08ad01mr53376821cf.11.1752471435261;
        Sun, 13 Jul 2025 22:37:15 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edea72cesm46260791cf.57.2025.07.13.22.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:14 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A4A0F40066;
	Mon, 14 Jul 2025 01:37:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 14 Jul 2025 01:37:14 -0400
X-ME-Sender: <xms:ipd0aFJZ0f1phYwPvM1z2SU8GAQyYu5EwAIgSJV0fSxJ8519UJavzw>
    <xme:ipd0aCodzOVhD1V873rLbIGjbl_E4G0ffGTQy8ox_en9v8hIg_ceqI__meMzBq8Me
    zAdyr8gRW3YUf0NIg>
X-ME-Received: <xmr:ipd0aCSG48zlzn5YZ-uU9vEZfit0s74H15NZQAmZc4iusSyuFHznzU0B7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddufecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:ipd0aF4fhixMlSUF9l5bLOk7-1sAGBsQUmlvcvHGwsVl4CbkL-CVbw>
    <xmx:ipd0aKYm6Zv51tbq40qss7AnYHKOwEUOcvMB0ECMbN2Ig3GIj80PWA>
    <xmx:ipd0aCivqvk7IvivIcnxGtfgOcnD5VCRhqhDIxrU9wO1MpOoK9Ix9g>
    <xmx:ipd0aMONmx_L6t8ttHDoEMrwk6jQKOQX9j7MtGoKhZ5RyA8W0FLtXQ>
    <xmx:ipd0aENvCv6Evu05kWQDk2cceuBYi79RUubca_k5NFeYISWMzqKRtlY9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:13 -0400 (EDT)
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
Subject: [PATCH v7 6/9] rust: sync: atomic: Add the framework of arithmetic operations
Date: Sun, 13 Jul 2025 22:36:53 -0700
Message-Id: <20250714053656.66712-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250714053656.66712-1-boqun.feng@gmail.com>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
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
architecures). Therefore the plan is to add a few subtraits of
`AllowAtomic` describing which types have and can do atomic arithemtic
operations.

One trait `AllowAtomicAdd` is added, and only add() and fetch_add() are
added. The rest will be added in the future.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         |  14 ++++
 rust/kernel/sync/atomic/generic.rs | 111 ++++++++++++++++++++++++++++-
 2 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index c5193c1c90fe..54f5b4618337 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -29,8 +29,22 @@ unsafe impl generic::AllowAtomic for i32 {
     type Repr = i32;
 }
 
+// SAFETY: The wrapping add result of two `i32`s is a valid `i32`.
+unsafe impl generic::AllowAtomicAdd<i32> for i32 {
+    fn rhs_into_delta(rhs: i32) -> i32 {
+        rhs
+    }
+}
+
 // SAFETY: `i64` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl generic::AllowAtomic for i64 {
     type Repr = i64;
 }
+
+// SAFETY: The wrapping add result of two `i64`s is a valid `i64`.
+unsafe impl generic::AllowAtomicAdd<i64> for i64 {
+    fn rhs_into_delta(rhs: i64) -> i64 {
+        rhs
+    }
+}
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 4e45d594d8ef..9e2394017202 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -2,7 +2,7 @@
 
 //! Generic atomic primitives.
 
-use super::ops::{AtomicHasBasicOps, AtomicHasXchgOps, AtomicImpl};
+use super::ops::{AtomicHasArithmeticOps, AtomicHasBasicOps, AtomicHasXchgOps, AtomicImpl};
 use super::{ordering, ordering::OrderingType};
 use crate::build_error;
 use core::cell::UnsafeCell;
@@ -104,6 +104,18 @@ const fn into_repr<T: AllowAtomic>(v: T) -> T::Repr {
     unsafe { core::mem::transmute_copy(&r) }
 }
 
+/// Types that support atomic add operations.
+///
+/// # Safety
+///
+/// Wrapping adding any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
+/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
+/// yield a value with a bit pattern also valid for `Self`.
+pub unsafe trait AllowAtomicAdd<Rhs = Self>: AllowAtomic {
+    /// Converts `Rhs` into the `Delta` type of the atomic implementation.
+    fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
+}
+
 impl<T: AllowAtomic> Atomic<T> {
     /// Creates a new atomic `T`.
     pub const fn new(v: T) -> Self {
@@ -462,3 +474,100 @@ fn try_cmpxchg<Ordering: ordering::Any>(&self, old: &mut T, new: T, _: Ordering)
         ret
     }
 }
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasArithmeticOps,
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
+    pub fn add<Rhs, Ordering: ordering::RelaxedOnly>(&self, v: Rhs, _: Ordering)
+    where
+        T: AllowAtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+        // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is a valid
+        // pointer of `T::Repr` for reads and valid for writes of values transmutable to `T`.
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // `*self` remains valid after `atomic_add()` because of the safety requirement of
+        // `AllowAtomicAdd`.
+        //
+        // SAFETY:
+        // - `a` is aligned to `align_of::<T::Repr>()` because of the safety requirement of
+        //   `AllowAtomic` and the guarantee of `Atomic::as_ptr()`.
+        // - `a` is a valid pointer per the CAST justification above.
+        unsafe {
+            T::Repr::atomic_add(a, v);
+        }
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
+    pub fn fetch_add<Rhs, Ordering: ordering::Any>(&self, v: Rhs, _: Ordering) -> T
+    where
+        T: AllowAtomicAdd<Rhs>,
+    {
+        let v = T::rhs_into_delta(v);
+        // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is a valid
+        // pointer of `T::Repr` for reads and valid for writes of values transmutable to `T`.
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // `*self` remains valid after `atomic_fetch_add*()` because of the safety requirement of
+        // `AllowAtomicAdd`.
+        //
+        // SAFETY:
+        // - `a` is aligned to `align_of::<T::Repr>()` because of the safety requirement of
+        //   `AllowAtomic` and the guarantee of `Atomic::as_ptr()`.
+        // - `a` is a valid pointer per the CAST justification above.
+        let ret = unsafe {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_fetch_add(a, v),
+                OrderingType::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                OrderingType::Release => T::Repr::atomic_fetch_add_release(a, v),
+                OrderingType::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        // SAFETY: `ret` comes from reading `a` which was derived from `self.as_ptr()` which points
+        // at a valid `T`.
+        unsafe { from_repr(ret) }
+    }
+}
-- 
2.39.5 (Apple Git-154)

