Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB05A20458A
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 03:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752894519; cv=none; b=dRYBPbir6e1pP0w/Yx7mWAthKQ7mGDeXnkrGIM5zyUnNC+FmTufFwnYdiQuiT2pmtDBqNzJAT7fBw2J+hCHlxYrMTfaqq1hlv0YeEu8xQAtfQV+wJ+27f+4sDrX7iHBFCeTC2dHVkEwxcUJzHc3k6qcH2k+LdyAHuycI2zqQP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752894519; c=relaxed/simple;
	bh=jQyKjr9CwAXaKqDVpbZv3vSGBq1ahANocB2TiuLUGP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sATLHpMovylXLuAan+tXWWaM8kIJibXuegaq0RUx6IvjzDRFDBi7p7eYqHpg5ahmWwz2T+8yNLoM9gd63KmJDKU6R1BfBDfI6uSd5eKhY3ctuJ0TZ2BOffco6ZA78/th5ilvwwgPO+j44IYmQFMfsq5VnXrMIX7H51gyF9k/pMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1U4vGUw; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1U4vGUw"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e32c5a174cso258094585a.1
        for <lkmm@lists.linux.dev>; Fri, 18 Jul 2025 20:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752894516; x=1753499316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jz/cWpmX/zZ0aq5QmkU5KoOJq1LO/GsCHwA3PME7VdE=;
        b=E1U4vGUwQYhtH+QsM0MB0HqLyeao9pKgDUDTFfjKCHb5iZghcVwQe0VdwRMj1GUeG9
         ys3ISkL5W5BSj0qxhovvioLRKyGPtL2Ev3+jcAva1Ztgon9Dnpzd6czdpThieRWB0s/o
         LC2PaAWoXJ9BfsRKF5RHriSYsYyBoWMJfAaHJrwF9DBBk8XuzPpTrzGe60Mj+zufFACm
         /3pAa0xNsTpyPsP0qc3T14rKNwq4cOEU1a5V9OngbZoLKuRdkvvdlhV6ive0jzMu6P7B
         z5kthT+jqIIH/iU/8EHRTSr1tDPJYguWHiGKl/5vrMrI2MTAa/Rtz+2OLec+vPutf6hq
         +ldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752894516; x=1753499316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jz/cWpmX/zZ0aq5QmkU5KoOJq1LO/GsCHwA3PME7VdE=;
        b=YETtT4ApL8in0b3/ZiMJdRgCbfPu1gkfRzMOlpYcv16HLuVlXZ5qzJHXCuxD5icEiF
         qafZo/s2Fy6KtgjL1y26/JPsQFcASG4TRP0SyrcGYTTq0HoDdbcsvPumJVzBYbX571ky
         VRIiyqmk+kL5HJf6bGMR+8wDrtC2/T6eVIAVfJdw6wHmosRb2h04xCe5xWJxm7+YvD5t
         2CnCIyCs275H5BkWy+CN+1Hm0kVe7bQQPJRJ3MQV0dQWACGLjmkv86QsKs/iqjAdqRIN
         Q3/Qh9LhojLpCDqDfdsohgCyBWdw6ELeVuRflVzkmss7S7qGtapjrJvvVOd2SLgu998P
         9Mzw==
X-Forwarded-Encrypted: i=1; AJvYcCV4AFEziYItLRkG3YSjiy4tTQ0YFr8KZp+v3kc4to2g7dKBiQdDQ+DJKD4blnTL0FCX9kdp@lists.linux.dev
X-Gm-Message-State: AOJu0YwUUY6IA/IFGMYb0DmP3OrTXFJyZnXFNfqLA+WcN94YSD1eJEVf
	ELFrRIfIrxihy/zWTlvVZeP76M2VYX5gOglk2NrOzq98oHBR1rE/m4ol
X-Gm-Gg: ASbGncuBbzZRr2vWOdnwTTozLPcYIOwsDkJbozcqMz7DgMkc/w4ChmAkpUumsamczxa
	qroiot+/Fz+lidCwK7hcRyC+edUzuFDgh+LrHpK4O0ue8pig8U38VpoaeFJEZpOiitC/ehzgvgx
	V/fkuv7ccEW5/1lBeRaOL4t384QwQL0YwmJHuYjjRV82Ta5GVqWjX0FJx/Gj7KxHEOqc5aWx1f8
	zoZwczzjTXFcrYVXPy3rsfW07BUmcVbOMMaQuPw7bgO2RGGLhiMr7Al4ckva5DHQXnG4K/NDUB4
	r5dINqz2S5FtGGctpx7NN9tFVQr9NX3kZIqxvRJdZyY4MtLnDC6/n4KH2cQ14ZHQ7xiF9+4A9rc
	40lnvI9t9B5pCHfqah6MZL+/buP2j4pDKeOQF7HOHbBcFHRS1ysdlILeYGdGtrxWAPsowtCc3+i
	71inEi7Vc5oT3fbOVeYxFhQbA=
X-Google-Smtp-Source: AGHT+IF3tXjsv0NP1N23DDeneCQkdrWgKL/MPGv7InQgBygYMkNbv7i+EmSvLDTCb6WWlgEkWyVKSg==
X-Received: by 2002:a05:620a:8808:b0:7d4:4a26:4065 with SMTP id af79cd13be357-7e34d9f76a8mr1357946185a.58.1752894515467;
        Fri, 18 Jul 2025 20:08:35 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356cb6b0csm157109185a.104.2025.07.18.20.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 20:08:35 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 761EBF40066;
	Fri, 18 Jul 2025 23:08:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 18 Jul 2025 23:08:34 -0400
X-ME-Sender: <xms:Mgx7aDe5j5zucMAf5zELMme2rJwJDgWLuC-IxvT31o8RO8oIcBsW4g>
    <xme:Mgx7aKuvHoRLg39YziHDwzprzm-VkVUR25Ud4PmQ_j0wkdH-n7Nxoo1flzp0pbQav
    achX-jJJppIo2hNIg>
X-ME-Received: <xmr:Mgx7aBHNl1IkzLm36ZlLchXO44CwYfaT0a6VB2oKBmjbvcWczEf4Vjw2GQ>
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
X-ME-Proxy: <xmx:Mgx7aEdAffpm0kZnS6AxzjT-znKtvPpZPKZCO-yCwDnw9HHZjMTuqw>
    <xmx:Mgx7aNt_f7raWz5lUiazCD4ZkTFFsjL8nU2bzAHvu_b9zxCROGWxUg>
    <xmx:Mgx7aLlIsEZwy26gAn5NRxenZNlPtPwujXsJA47D65ai_QIlj7V-aQ>
    <xmx:Mgx7aIA2okIVkoJ8MamMsh5c0oY689RN240D0qNlEVO5DPtt3PbTRw>
    <xmx:Mgx7aLwVtldpWeiOC8yeOCWSYItR5qwBsIay8bHTn0LzhQfMzzByOO6P>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 23:08:33 -0400 (EDT)
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
Subject: [PATCH v8 2/9] rust: sync: Add basic atomic operation mapping framework
Date: Fri, 18 Jul 2025 20:08:20 -0700
Message-Id: <20250719030827.61357-3-boqun.feng@gmail.com>
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

Preparation for generic atomic implementation. To unify the
implementation of a generic method over `i32` and `i64`, the C side
atomic methods need to be grouped so that in a generic method, they can
be referred as <type>::<method>, otherwise their parameters and return
value are different between `i32` and `i64`, which would require using
`transmute()` to unify the type into a `T`.

Introduce `AtomicImpl` to represent a basic type in Rust that has the
direct mapping to an atomic implementation from C. Use a sealed trait to
restrict `AtomicImpl` to only support `i32` and `i64` for now.

Further, different methods are put into different `*Ops` trait groups,
and this is for the future when smaller types like `i8`/`i16` are
supported but only with a limited set of API (e.g. only set(), load(),
xchg() and cmpxchg(), no add() or sub() etc).

While the atomic mod is introduced, documentation is also added for
memory models and data races.

Also bump my role to the maintainer of ATOMIC INFRASTRUCTURE to reflect
my responsibility on the Rust atomic mod.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 MAINTAINERS                         |   4 +-
 rust/kernel/sync.rs                 |   1 +
 rust/kernel/sync/atomic.rs          |  22 +++
 rust/kernel/sync/atomic/internal.rs | 265 ++++++++++++++++++++++++++++
 4 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/internal.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b8..5eef524975ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3894,7 +3894,7 @@ F:	drivers/input/touchscreen/atmel_mxt_ts.c
 ATOMIC INFRASTRUCTURE
 M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
-R:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun.feng@gmail.com>
 R:	Mark Rutland <mark.rutland@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
@@ -3903,6 +3903,8 @@ F:	arch/*/include/asm/atomic*.h
 F:	include/*/atomic*.h
 F:	include/linux/refcount.h
 F:	scripts/atomic/
+F:	rust/kernel/sync/atomic.rs
+F:	rust/kernel/sync/atomic/
 
 ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
 M:	Bradley Grove <linuxdrivers@attotech.com>
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 36a719015583..b620027e0641 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -10,6 +10,7 @@
 use pin_init;
 
 mod arc;
+pub mod atomic;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
new file mode 100644
index 000000000000..b9f2f4780073
--- /dev/null
+++ b/rust/kernel/sync/atomic.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Atomic primitives.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions of
+//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (Consistency) Model is the
+//! only model for Rust code in kernel, and Rust's own atomics should be avoided.
+//!
+//! # Data races
+//!
+//! [`LKMM`] atomics have different rules regarding data races:
+//!
+//! - A normal write from C side is treated as an atomic write if
+//!   CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y.
+//! - Mixed-size atomic accesses don't cause data races.
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+
+#[allow(dead_code, unreachable_pub)]
+mod internal;
+
+pub use internal::AtomicImpl;
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
new file mode 100644
index 000000000000..0d442ef83747
--- /dev/null
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Atomic internal implementations.
+//!
+//! Provides 1:1 mapping to the C atomic operations.
+
+use crate::bindings;
+use crate::macros::paste;
+use core::cell::UnsafeCell;
+
+mod private {
+    /// Sealed trait marker to disable customized impls on atomic implementation traits.
+    pub trait Sealed {}
+}
+
+// `i32` and `i64` are only supported atomic implementations.
+impl private::Sealed for i32 {}
+impl private::Sealed for i64 {}
+
+/// A marker trait for types that implement atomic operations with C side primitives.
+///
+/// This trait is sealed, and only types that have directly mapping to the C side atomics should
+/// impl this:
+///
+/// - `i32` maps to `atomic_t`.
+/// - `i64` maps to `atomic64_t`.
+pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
+    /// The type of the delta in arithmetic or logical operations.
+    ///
+    /// For example, in `atomic_add(ptr, v)`, it's the type of `v`. Usually it's the same type of
+    /// [`Self`], but it may be different for the atomic pointer type.
+    type Delta;
+}
+
+// `atomic_t` implements atomic operations on `i32`.
+impl AtomicImpl for i32 {
+    type Delta = Self;
+}
+
+// `atomic64_t` implements atomic operations on `i64`.
+impl AtomicImpl for i64 {
+    type Delta = Self;
+}
+
+/// Atomic representation.
+#[repr(transparent)]
+pub struct AtomicRepr<T: AtomicImpl>(UnsafeCell<T>);
+
+impl<T: AtomicImpl> AtomicRepr<T> {
+    /// Creates a new atomic representation `T`.
+    pub const fn new(v: T) -> Self {
+        Self(UnsafeCell::new(v))
+    }
+
+    /// Returns a pointer to the underlying `T`.
+    ///
+    /// # Guarantees
+    ///
+    /// The returned pointer is valid and properly aligned (i.e. aligned to [`align_of::<T>()`]).
+    pub const fn as_ptr(&self) -> *mut T {
+        // GUARANTEE: `self.0` is an `UnsafeCell<T>`, therefore the pointer returned by `.get()`
+        // must be valid and properly aligned.
+        self.0.get()
+    }
+}
+
+// This macro generates the function signature with given argument list and return type.
+macro_rules! declare_atomic_method {
+    (
+        $(#[doc=$doc:expr])*
+        $func:ident($($arg:ident : $arg_type:ty),*) $(-> $ret:ty)?
+    ) => {
+        paste!(
+            $(#[doc = $doc])*
+            fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)?;
+        );
+    };
+    (
+        $(#[doc=$doc:expr])*
+        $func:ident [$variant:ident $($rest:ident)*]($($arg_sig:tt)*) $(-> $ret:ty)?
+    ) => {
+        paste!(
+            declare_atomic_method!(
+                $(#[doc = $doc])*
+                [< $func _ $variant >]($($arg_sig)*) $(-> $ret)?
+            );
+        );
+
+        declare_atomic_method!(
+            $(#[doc = $doc])*
+            $func [$($rest)*]($($arg_sig)*) $(-> $ret)?
+        );
+    };
+    (
+        $(#[doc=$doc:expr])*
+        $func:ident []($($arg_sig:tt)*) $(-> $ret:ty)?
+    ) => {
+        declare_atomic_method!(
+            $(#[doc = $doc])*
+            $func($($arg_sig)*) $(-> $ret)?
+        );
+    }
+}
+
+// This macro generates the function implementation with given argument list and return type, and it
+// will replace "call(...)" expression with "$ctype _ $func" to call the real C function.
+macro_rules! impl_atomic_method {
+    (
+        ($ctype:ident) $func:ident($($arg:ident: $arg_type:ty),*) $(-> $ret:ty)? {
+            $unsafe:tt { call($($c_arg:expr),*) }
+        }
+    ) => {
+        paste!(
+            #[inline(always)]
+            fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
+                // TODO: Ideally we want to use the SAFETY comments written at the macro invocation
+                // (e.g. in `declare_and_impl_atomic_methods!()`, however, since SAFETY comments
+                // are just comments, and they are not passed to macros as tokens, therefore we
+                // cannot use them here. One potential improvement is that if we support using
+                // attributes as an alternative for SAFETY comments, then we can use that for macro
+                // generating code.
+                //
+                // SAFETY: specified on macro invocation.
+                $unsafe { bindings::[< $ctype _ $func >]($($c_arg,)*) }
+            }
+        );
+    };
+    (
+        ($ctype:ident) $func:ident[$variant:ident $($rest:ident)*]($($arg_sig:tt)*) $(-> $ret:ty)? {
+            $unsafe:tt { call($($arg:tt)*) }
+        }
+    ) => {
+        paste!(
+            impl_atomic_method!(
+                ($ctype) [< $func _ $variant >]($($arg_sig)*) $( -> $ret)? {
+                    $unsafe { call($($arg)*) }
+            }
+            );
+        );
+        impl_atomic_method!(
+            ($ctype) $func [$($rest)*]($($arg_sig)*) $( -> $ret)? {
+                $unsafe { call($($arg)*) }
+            }
+        );
+    };
+    (
+        ($ctype:ident) $func:ident[]($($arg_sig:tt)*) $( -> $ret:ty)? {
+            $unsafe:tt { call($($arg:tt)*) }
+        }
+    ) => {
+        impl_atomic_method!(
+            ($ctype) $func($($arg_sig)*) $(-> $ret)? {
+                $unsafe { call($($arg)*) }
+            }
+        );
+    }
+}
+
+// Delcares $ops trait with methods and implements the trait for `i32` and `i64`.
+macro_rules! declare_and_impl_atomic_methods {
+    ($(#[$attr:meta])* $pub:vis trait $ops:ident {
+        $(
+            $(#[doc=$doc:expr])*
+            fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
+                $unsafe:tt { bindings::#call($($arg:tt)*) }
+            }
+        )*
+    }) => {
+        $(#[$attr])*
+        $pub trait $ops: AtomicImpl {
+            $(
+                declare_atomic_method!(
+                    $(#[doc=$doc])*
+                    $func[$($variant)*]($($arg_sig)*) $(-> $ret)?
+                );
+            )*
+        }
+
+        impl $ops for i32 {
+            $(
+                impl_atomic_method!(
+                    (atomic) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
+                        $unsafe { call($($arg)*) }
+                    }
+                );
+            )*
+        }
+
+        impl $ops for i64 {
+            $(
+                impl_atomic_method!(
+                    (atomic64) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
+                        $unsafe { call($($arg)*) }
+                    }
+                );
+            )*
+        }
+    }
+}
+
+declare_and_impl_atomic_methods!(
+    /// Basic atomic operations
+    pub trait AtomicBasicOps {
+        /// Atomic read (load).
+        fn read[acquire](a: &AtomicRepr<Self>) -> Self {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(a.as_ptr().cast()) }
+        }
+
+        /// Atomic set (store).
+        fn set[release](a: &AtomicRepr<Self>, v: Self) {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(a.as_ptr().cast(), v) }
+        }
+    }
+);
+
+declare_and_impl_atomic_methods!(
+    /// Exchange and compare-and-exchange atomic operations
+    pub trait AtomicExchangeOps {
+        /// Atomic exchange.
+        ///
+        /// Atomically updates `*a` to `v` and returns the old value.
+        fn xchg[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self) -> Self {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(a.as_ptr().cast(), v) }
+        }
+
+        /// Atomic compare and exchange.
+        ///
+        /// If `*a` == `*old`, atomically updates `*a` to `new`. Otherwise, `*a` is not
+        /// modified, `*old` is updated to the current value of `*a`.
+        ///
+        /// Return `true` if the update of `*a` occured, `false` otherwise.
+        fn try_cmpxchg[acquire, release, relaxed](
+            a: &AtomicRepr<Self>, old: &mut Self, new: Self
+        ) -> bool {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned. `core::ptr::from_mut(old)`
+            // is valid and properly aligned.
+            unsafe { bindings::#call(a.as_ptr().cast(), core::ptr::from_mut(old), new) }
+        }
+    }
+);
+
+declare_and_impl_atomic_methods!(
+    /// Atomic arithmetic operations
+    pub trait AtomicArithmeticOps {
+        /// Atomic add (wrapping).
+        ///
+        /// Atomically updates `*a` to `(*a).wrapping_add(v)`.
+        fn add[](a: &AtomicRepr<Self>, v: Self::Delta) {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
+
+        /// Atomic fetch and add (wrapping).
+        ///
+        /// Atomically updates `*a` to `(*a).wrapping_add(v)`, and returns the value of `*a`
+        /// before the update.
+        fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) -> Self {
+            // SAFETY: `a.as_ptr()` is valid and properly aligned.
+            unsafe { bindings::#call(v, a.as_ptr().cast()) }
+        }
+    }
+);
-- 
2.39.5 (Apple Git-154)

