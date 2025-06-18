Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4912F49E2
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265389; cv=none; b=HO3p1ZYKvgLeGi+pofnNcn0/7ODM6aaPx81ZvfxV6dUIq6R18AKCPhDSH2A4NF/tAnd/tOce31kMgRENz0kay0pPQko70VkCakCCxpAYdskiekyNzpfd33yI4Urp5wzb/0wv/uH9rH3eYzLua90ZbV+JbHOOWA4EXZLl4aymUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265389; c=relaxed/simple;
	bh=1Kqi2YDsf3sM7uhM+P4TroSNnv4xFt1rwiunRKerjdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jHLigSviUa4Klf4orMPEwE89gn0I7mrB+GkI8N6mlWs5gwqBChgMGZs0ysMTaEgDoTSi1h2uxI3cLDoGPgbaIlAenPZEbKx4KsBvpXECf68frB6+BE1CH900jaAIsdVXY6MjCWGNltYCg8WNyhkoj1DPx/DowkqKRDLqrRbqZ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJgUEgOq; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJgUEgOq"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a6f3f88613so70958341cf.1
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265384; x=1750870184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wbnaYQheKaUQhhvZ2OiIVS2CsqlLbAVGNW2lrhmtrNI=;
        b=PJgUEgOqcT2Q1yrVLFkHHH1bxWTbXK2IebrcfVeP34L/96m9cfQpTqfH53cF6Q80Xe
         8TJLUJt55iODW9507iXHaHTYxt4yvEeok21BUelPi5Lq4q3YqI1tdHGifaYvtypF5QQD
         nCg9M4WZVEHlrhmLubdJRvJLeczavbFbhGBydedBJn9/o2cVt240w9RUuRSv4/mkFBhQ
         eGdaNXBrrpCTrMxV8rQbWdxl0IRIrOEe/ZALGAbRAf/Hg3YN6MuxGBJMX6Ja0rq97IIK
         mP9NfKXnXG4xNkK0MvWfGTd4yKZtjyi5I8kk3F3b9xZyemJxY3wIBH4VjMLshhb4iGMO
         ctBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265384; x=1750870184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbnaYQheKaUQhhvZ2OiIVS2CsqlLbAVGNW2lrhmtrNI=;
        b=ZVHTOuuLhyiWrRl7vaqbaa513uIUgD7CS4AAhzvc2pD1aZT5IhG7iQenxH8LWl/52K
         n/0N1SovD4yiKUU4TYfqeU9jreO47O5OeBUM2u3V94nnyY8GrDJBOuq0fcAkbUTUynfC
         lYQOLEOGDjliSmjPO4eUXyR+sJ0UvnSRky5QiEGyBAzaI7NiliGE99q1i6HSn1brtLIP
         vvWydOcn4vFp2DYyLbMuzufCnu5n9IGhNxLLk/JuscZJVNQ/0Yy6SZAreUIjwWpRk1g+
         2dgifDY0vn7nG7w4xPdFqNZljZCyQNZJ2UTgHKaEVYGo5bEdslLYeemkdFrUUbRkep+m
         O+5A==
X-Forwarded-Encrypted: i=1; AJvYcCUhEXIwiThO3svYfL+QxrRzijVTHEoRETu/L8w3JX0FghBEHdGEVXItJqH+l4kdrZvcO5i2@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ1WRwkxeAXYzWbAtgMeFzIQNLjS3lDdRGzbluXSzN4I8rEXD6
	RsbECLgayUc9X/U3DTQhbRzqakn66E4wzxe4FXqc03pvZZUTFcx+xQ0c
X-Gm-Gg: ASbGncvNGqOXv1G+moBV8BV2dM7W0JNToRglYuh9HE/69COlvIc87qnVg0RCVj2TyJv
	2zoVR2+F3/j0sppFyWND2ocL402ydP0pDT8lZK5fF245EsDyeq1tZbOW5V41EWfx53UDrdRJE4u
	wZYzGdQr0DVf9OrI0lspU24XdTnxqebobpm15n6ywG8nuymy4uWrAcrhNckDxjJeI2JvSmpLxDa
	aRRdP19pKqyCFEOzcKy5/Trabt0NFdaaxzRHTcae5KRTwcE2S1EtiBQzMkBkN9fKe/0iwiZybXp
	1vtAre75Egs5HEmI4+FIczWWpmhmhPioVsQMFzgrcPb8hvCzBMUucBlvgJGJ1jP9wTN2XNuG6SN
	JD+JMbpeC9t9lMXbBZTwmKlssmRnuQJaXy1Pma5NRBrWDQmfEqHNUYrWuXURlDhw=
X-Google-Smtp-Source: AGHT+IHMzK/tSg/7anPkWa76F3zWuN1E4JdmV+MOA8xH4htdJIEzNAwYHqKlof3ctb/IB08iMrco7A==
X-Received: by 2002:ac8:5acb:0:b0:4a6:f518:6b19 with SMTP id d75a77b69052e-4a73c5faebemr273615191cf.28.1750265384102;
        Wed, 18 Jun 2025 09:49:44 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2e94desm73624361cf.20.2025.06.18.09.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:43 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 341191200043;
	Wed, 18 Jun 2025 12:49:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 12:49:43 -0400
X-ME-Sender: <xms:J-5SaBVWIcmoQDKcduj0k0rGsh8gat9ueotHTwdfGOiiQc5klosh6g>
    <xme:J-5SaBmh2m8cVi_IuE14x1c6a8YUFBCf59RzF3b9hpHPnE7bNPo-rHdVCIZvTq6SC
    CKMFszAZjnpJyG5tQ>
X-ME-Received: <xmr:J-5SaNZlPzXTLqJY0SVJgS0CoC4iDy3R5e67ryvhZe02IekVKyN8_IE5Tsy9iQ>
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
X-ME-Proxy: <xmx:J-5SaEUMqFv6XQKAetsGYrHpYM_W_kaGBk_3eW7Y9M_3hoVl8KQQ-A>
    <xmx:J-5SaLn7cmPmGtijrPHJr3Pm0QiG-rrBmQhUTKYy-HJbQws2ZpcDpQ>
    <xmx:J-5SaBcAkKMsWlqzEFxiX38slcy6FscBBI0NKpaFjy2GV_eBRMYxrw>
    <xmx:J-5SaFFFNn5xyKOvjGEoG_L9MaJCVXi_AaPrQzDZTaq70KcVXLRoiw>
    <xmx:J-5SaFkWv6z-DqPl0qG4-myejFakJe-rhEDzYgkHuSOHyCIatDDAYynN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:42 -0400 (EDT)
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
Subject: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Date: Wed, 18 Jun 2025 09:49:28 -0700
Message-Id: <20250618164934.19817-5-boqun.feng@gmail.com>
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

