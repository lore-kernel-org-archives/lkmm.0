Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85860226CE8
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509201; cv=none; b=slsz5JU+7gQDs/fdGfXY1HS+o7MIge8p0GcOpiTglAQtBIiCB2AEMiFxnmJhYRMoKRf+OkyDBeYuxyqWO48vh3BLTpwMXVoK4L9tDX2pgTpMTSOVEkA/xXS/bDhJOwAsX1MjRxIuCnDLbQTMNHZG4oGIxA7EW7nt0SJJ2V0lDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509201; c=relaxed/simple;
	bh=1Kqi2YDsf3sM7uhM+P4TroSNnv4xFt1rwiunRKerjdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JDNzVAO6AJ0mIVvy0TwYEUsMFJ+lTqypzVdW9UCUsTLy487mjzqRMYTLu4Yzc4upESwrRC4gpfD1UwjtAnu93l20gv0EL24asvX7kwwfXluABIDrI6rOWS++tWvA02uyTT5qhoEX7RH0JbRQzHP1Z7PkZixGnTE/SghbdZxuZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHnNhu1w; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHnNhu1w"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0ad744811so33801286d6.1
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509198; x=1750113998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wbnaYQheKaUQhhvZ2OiIVS2CsqlLbAVGNW2lrhmtrNI=;
        b=DHnNhu1wbNipx/JWIMQEvmd61Ky3YTgutlirNc9jidpqzqnrNozS/hzBpAwXEiY5CH
         dx5A58xtU6JCrjmZWqAfVonijsrFkRAh7B/Kti775wTMaILekV15wZgBqxgJf7DBgH7H
         rh9xO/30Cs58S2X5SeuGjX8Uk3kLTBLeFJL6Z1tvfhmvc8grYyZmNJ7EcCikmdNC8/Rx
         X/By5/gUaJGlYu9nuuyKv9NbgCm49UgSmL7e6MTNSsxAUR1w+MNnBkkEXFde1F7BhawD
         w75EeWUdnpNU1M15U8oOHHlMtoyywIZu0yYDLsUyJbPNLkHB/5rUgNddHJdvRjct9hUy
         Pxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509198; x=1750113998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbnaYQheKaUQhhvZ2OiIVS2CsqlLbAVGNW2lrhmtrNI=;
        b=SOS0LRsQeRGFPIkgWKvCd54ipVeIeCy5GBFP+q6m97hFUggEVcr+NvqLzwvS5EbU7E
         VVi8g2fghTPQYTi7HhJ497+A5k69lE635iK9qPmxuCKiaDlKmGEzmCdrxNETfY8bk6aH
         NPliMibW8Jd+d8H06qGvacPjVyJ4l/Ys+3mxUn2w9lcplpqoQY0mom7TwWcH0kHYN2lW
         Zkoc99NUuhdA4/RYZ7aOIRbR7W1M9SiKZCnHYrhPBpClcPUaULcoRPzRgvf+/ijPAqvN
         oUo90/t3GRKbxNUhkFBGbdheeu6RgmQ4W5f21rHyF06oxA8pcmCVswYXidnSKgUF7Afd
         V2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqRJDjuYuTiINqgfgxr1OpZNi9AXmcQS/vapqUOp57vjuqFmCDkReA8ZnBs7Mpeta75Eh2@lists.linux.dev
X-Gm-Message-State: AOJu0YxBvodaqrEstcsIhG7B32SroWRQUoqFJo2KMn8FXts2hj9tyvpj
	v5feye+JY8pqinvtmHuVQ4ADJ6nOu4aS29aZqdNppjc3xCq/X1UhGU2F
X-Gm-Gg: ASbGncvZSogjC90Ys7wPhEM7tT61ZkvDIQL+Y2NPKvwyM+BnzQU4OtzuwEAW2B0RWmf
	zUviX1TtA/0zQ0bcMNjkXu0FI5Z/mBqJN0+ak/6bvs0nebdFWetHikxbJ97cxSUYYtdyl+4jgP0
	8y20BDbbBkaWt/ty0JXNZOkkTdQXuxBYc68ZNak1pEkEmxHke4HxiU9BDQcsx9N8S/KL4GG2+s0
	QYkcPCB8Z5yPolcOBGJT/f1x9hVPlK1+QP127V/Hg2Y/7JzCcB1KeBOUWHwY5fzv94FwURSnxBG
	iXCKsVUH99+sZKKH+dB9Wy8uhEBbP50up8zMPX5rBLqmYlmxSlEQlfSI+C4QW12IH3Sq2S9XPKh
	gU2QmQvAYcjzzUquk9y1Q6mH784Il4WOj782gDAEFvFz08kNNa9FCSdYFS2yByPc=
X-Google-Smtp-Source: AGHT+IFONR/ySZBK8HoSEotuOUekxGEATR6mmf+1fK7fYeiJWRLxagoM1Bk8TY20rviQW0g88oVS0w==
X-Received: by 2002:a05:6214:1bc5:b0:6fa:c6ad:1618 with SMTP id 6a1803df08f44-6fb08f61cc0mr255054656d6.27.1749509198330;
        Mon, 09 Jun 2025 15:46:38 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1ce86sm57688286d6.61.2025.06.09.15.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:37 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3F6541200066;
	Mon,  9 Jun 2025 18:46:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 09 Jun 2025 18:46:37 -0400
X-ME-Sender: <xms:TWRHaFv3r0BcQ6j3pzL9cTfF-g5_peL3PYtZpqLepmNduBvKDrfGAQ>
    <xme:TWRHaOcvAt1JcaIeocuV47eth_GysI8EVRFytyCqfAqJLeX0XTfyTcakmRn3BtUNd
    XSer9qNYhwkkWU82w>
X-ME-Received: <xmr:TWRHaIxHTIOxOnj4iKrJosz9Vg6twb1s3ljS98qH2a2AyEqOxQke1_DBCdE>
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
X-ME-Proxy: <xmx:TWRHaMOqtRHFR-L8ukIwNoYqTsF8SKObHdIbL4DJRqcLjB_-nCNMqw>
    <xmx:TWRHaF-rzIPf1Y7eH-6pi2C7YLmtjnO7ogkNb1wRWyFOIllAhfz39A>
    <xmx:TWRHaMXtlt63Qd-rjMVtQ1JRFZLYfZithR9AF4kr8bvIprSjDGQuHA>
    <xmx:TWRHaGfMG9obivANkqs2_nHExS0ylwAg-Gk_efh5WW-x8snUNHbg-w>
    <xmx:TWRHaLdeH6GbWL7DkUpBEOf-NB6y9S7_UUhrcpc7wiof_Bftox6USXnG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:36 -0400 (EDT)
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
Subject: [PATCH v4 04/10] rust: sync: atomic: Add generic atomics
Date: Mon,  9 Jun 2025 15:46:09 -0700
Message-Id: <20250609224615.27061-5-boqun.feng@gmail.com>
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

To provide using LKMM atomics for Rust code, a generic `Atomic<T>` is
added, currently `T` needs to be Send + Copy because these are the
straightforward usages and all basic types support this. The trait
`AllowAtomic` should be only implemented inside atomic mod until the
generic atomic framework is mature enough (unless the implementer is a
`#[repr(transparent)]` new type).

`AtomicImpl` types are automatically `AllowAtomic`, and so far only
basic operations load() and store() are introduced.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         |   2 +
 rust/kernel/sync/atomic/generic.rs | 258 +++++++++++++++++++++++++++++
 2 files changed, 260 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/generic.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9fe5d81fc2a9..a01e44eec380 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -16,7 +16,9 @@
 //!
 //! [`LKMM`]: srctree/tools/memory-mode/
 
+pub mod generic;
 pub mod ops;
 pub mod ordering;
 
+pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
new file mode 100644
index 000000000000..73c26f9cf6b8
--- /dev/null
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic atomic primitives.
+
+use super::ops::*;
+use super::ordering::*;
+use crate::types::Opaque;
+
+/// A generic atomic variable.
+///
+/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to be chosen.
+///
+/// # Invariants
+///
+/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race, this
+/// is guaranteed by the safety requirement of [`Self::from_ptr`] and the extra safety requirement
+/// of the usage on pointers returned by [`Self::as_ptr`].
+#[repr(transparent)]
+pub struct Atomic<T: AllowAtomic>(Opaque<T>);
+
+// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
+unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
+
+/// Atomics that support basic atomic operations.
+///
+/// TODO: Currently the [`AllowAtomic`] types are restricted within basic integer types (and their
+/// transparent new types). In the future, we could extend the scope to more data types when there
+/// is a clear and meaningful usage, but for now, [`AllowAtomic`] should only be implemented inside
+/// atomic mod for the restricted types mentioned above.
+///
+/// # Safety
+///
+/// [`Self`] must have the same size and alignment as [`Self::Repr`].
+pub unsafe trait AllowAtomic: Sized + Send + Copy {
+    /// The backing atomic implementation type.
+    type Repr: AtomicImpl;
+
+    /// Converts into a [`Self::Repr`].
+    fn into_repr(self) -> Self::Repr;
+
+    /// Converts from a [`Self::Repr`].
+    fn from_repr(repr: Self::Repr) -> Self;
+}
+
+// An `AtomicImpl` is automatically an `AllowAtomic`.
+//
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+unsafe impl<T: AtomicImpl> AllowAtomic for T {
+    type Repr = Self;
+
+    fn into_repr(self) -> Self::Repr {
+        self
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr
+    }
+}
+
+impl<T: AllowAtomic> Atomic<T> {
+    /// Creates a new atomic.
+    pub const fn new(v: T) -> Self {
+        Self(Opaque::new(v))
+    }
+
+    /// Creates a reference to [`Self`] from a pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` has to be a valid pointer.
+    /// - `ptr` has to be valid for both reads and writes for the whole lifetime `'a`.
+    /// - For the whole lifetime of '`a`, other accesses to the object cannot cause data races
+    ///   (defined by [`LKMM`]) against atomic operations on the returned reference.
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    ///
+    /// # Examples
+    ///
+    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
+    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
+    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
+    ///
+    /// ```rust
+    /// # use kernel::types::Opaque;
+    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
+    ///
+    /// // Assume there is a C struct `Foo`.
+    /// mod cbindings {
+    ///     #[repr(C)]
+    ///     pub(crate) struct foo { pub(crate) a: i32, pub(crate) b: i32 }
+    /// }
+    ///
+    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2});
+    ///
+    /// // struct foo *foo_ptr = ..;
+    /// let foo_ptr = tmp.get();
+    ///
+    /// // SAFETY: `foo_ptr` is a valid pointer, and `.a` is inbound.
+    /// let foo_a_ptr = unsafe { core::ptr::addr_of_mut!((*foo_ptr).a) };
+    ///
+    /// // a = READ_ONCE(foo_ptr->a);
+    /// //
+    /// // SAFETY: `foo_a_ptr` is a valid pointer for read, and all accesses on it is atomic, so no
+    /// // data race.
+    /// let a = unsafe { Atomic::from_ptr(foo_a_ptr) }.load(Relaxed);
+    /// # assert_eq!(a, 1);
+    ///
+    /// // smp_store_release(&foo_ptr->a, 2);
+    /// //
+    /// // SAFETY: `foo_a_ptr` is a valid pointer for write, and all accesses on it is atomic, so no
+    /// // data race.
+    /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
+    /// ```
+    ///
+    /// However, this should be only used when communicating with C side or manipulating a C struct.
+    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
+    where
+        T: Sync,
+    {
+        // CAST: `T` is transparent to `Atomic<T>`.
+        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
+        // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
+        // guarantees other accesses won't cause data races.
+        unsafe { &*ptr.cast::<Self>() }
+    }
+
+    /// Returns a pointer to the underlying atomic variable.
+    ///
+    /// Extra safety requirement on using the return pointer: the operations done via the pointer
+    /// cannot cause data races defined by [`LKMM`].
+    ///
+    /// [`LKMM`]: srctree/tools/memory-model
+    pub const fn as_ptr(&self) -> *mut T {
+        self.0.get()
+    }
+
+    /// Returns a mutable reference to the underlying atomic variable.
+    ///
+    /// This is safe because the mutable reference of the atomic variable guarantees the exclusive
+    /// access.
+    pub fn get_mut(&mut self) -> &mut T {
+        // SAFETY: `self.as_ptr()` is a valid pointer to `T`, and the object has already been
+        // initialized. `&mut self` guarantees the exclusive access, so it's safe to reborrow
+        // mutably.
+        unsafe { &mut *self.as_ptr() }
+    }
+}
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasBasicOps,
+{
+    /// Loads the value from the atomic variable.
+    ///
+    /// # Examples
+    ///
+    /// Simple usages:
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42i32);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// let x = Atomic::new(42i64);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    /// ```
+    ///
+    /// Customized new types in [`Atomic`]:
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{generic::AllowAtomic, Atomic, Relaxed};
+    ///
+    /// #[derive(Clone, Copy)]
+    /// #[repr(transparent)]
+    /// struct NewType(u32);
+    ///
+    /// // SAFETY: `NewType` is transparent to `u32`, which has the same size and alignment as
+    /// // `i32`.
+    /// unsafe impl AllowAtomic for NewType {
+    ///     type Repr = i32;
+    ///
+    ///     fn into_repr(self) -> Self::Repr {
+    ///         self.0 as i32
+    ///     }
+    ///
+    ///     fn from_repr(repr: Self::Repr) -> Self {
+    ///         NewType(repr as u32)
+    ///     }
+    /// }
+    ///
+    /// let n = Atomic::new(NewType(0));
+    ///
+    /// assert_eq!(0, n.load(Relaxed).0);
+    /// ```
+    #[doc(alias("atomic_read", "atomic64_read"))]
+    #[inline(always)]
+    pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_read*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let v = unsafe {
+            if Ordering::IS_RELAXED {
+                T::Repr::atomic_read(a)
+            } else {
+                T::Repr::atomic_read_acquire(a)
+            }
+        };
+
+        T::from_repr(v)
+    }
+
+    /// Stores a value to the atomic variable.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42i32);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// x.store(43, Relaxed);
+    ///
+    /// assert_eq!(43, x.load(Relaxed));
+    /// ```
+    ///
+    #[doc(alias("atomic_set", "atomic64_set"))]
+    #[inline(always)]
+    pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
+        let v = T::into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_set*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            if Ordering::IS_RELAXED {
+                T::Repr::atomic_set(a, v)
+            } else {
+                T::Repr::atomic_set_release(a, v)
+            }
+        };
+    }
+}
-- 
2.39.5 (Apple Git-154)

