Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689C28137D
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047333; cv=none; b=sblGqTHYbF5c2L+B2QqMHw0K7+7ozCJQ3T/JlThwn0oYS/LU/dc50sC6mXlDcTvFT4h5P9Vc1CGRwAUtGgJFKJVKlF0HBpa8LaTj56F1gY5XK+SoFVo78mo3zyy9bsTeLCe81sHhGjFb+dPIjIswSGIsS5sc0yiXJcuuCcnwClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047333; c=relaxed/simple;
	bh=lwCmmZzK2HnRc/ZHHeIEM0sjRrMvxyYb9pwdb4+oJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6oh8UuLAy0hHQN6u9seMNvgthXR8m2Z9eFLQY5kNznJW0NDr06SxaD7Fh6lakKgDaEypPqUkDAKns05x0YPByngCJ8ozNiiKKj6uLPAelwoJKUof3/RzVIEm9ZkHx8+BaHBEdEg7xYybR9TH1vkOfpsalLIRPKtOP2Deb8d8h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwgmDvvL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwgmDvvL"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-70ddd2e61d9so20897406d6.1
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047329; x=1757652129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=56aEvuw8HZ6ZMouX9lRTh2tr/a537bJJuIrcWGezh3s=;
        b=DwgmDvvLVxJhH3ocFzyFvQs8er2TnpSlEO2F8WENs6YBfc0JowYDiDd1D4ntYHVPT/
         4NX8XPTpLK/9iEEzjGTLCzLHhtyT2D79zGf8qjqeJzeHZPtyGquN0XxtjpfI3ctMr4rc
         HBZCQPhvbKuvgELrznRUC5igqMiFNSnr2siqLLnC6h4CdQWxxQU1ROefSDU8y1DRLoy3
         qHEbejXKh0lzNErBafFJEzFYtxwzdj/SAF5XNho6xXLvwPCFEnra/6AYZBwEzcUruzrq
         c5cuIYo+scvVbu4AdrLF+S7yh43COqDfaaCKmGo0rkMxQ+1OWyB0rvJSSDuCwP3f8lmE
         Ai6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047329; x=1757652129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56aEvuw8HZ6ZMouX9lRTh2tr/a537bJJuIrcWGezh3s=;
        b=xQC0tnK5oqXMr6hMkd3km3i1y0+6buGGNA6oXIl2Rwq7BsEKEhyn7vDsJN/jtL4Ihz
         Y3nUotuFoelj4zYQE886cpgQJ29IzJ71q4e49H09QK510zMC61e1//nHdi/yvrPhOPPa
         YSHhi6eOJzF0Jz4u28f5UetjiDtRIR56wwiXFpl5Iewjb9z6JFsf1bGo7x2bzwl5GIw8
         uszB/zy2WEemQmQK+YQLQMau18+uKh1x83TWjxz2Dz97chdiqCRdTHsUJWMYSIFSIAYH
         yGWtd3rsHC/uH5tSS0AySNVsijBEsOGkqj3IUFliXmWfJlfBuYsgSZeyQ+xWqygQw6nu
         TqDg==
X-Forwarded-Encrypted: i=1; AJvYcCX+pPoYqWveFARBOMsAH55vxPe9vcocK5EFA8dTQNITVhViA1/C5kvwUYcLjDwu7JDT3ytx@lists.linux.dev
X-Gm-Message-State: AOJu0YzqWSof8ICvb1JD8ZQ8XfuCONvk7fJ497OusKqw3lsSdfgDOq9v
	ZwniHxSwGOeqcKboU/Iq5bSYohZVe0eyYUEllwx6iCs1qORps6dD+w/x
X-Gm-Gg: ASbGncvtc7muSX/0ZFGCRxG0UgxrNxxJMgCFvOtkXbdgsa8f8v3Ze9pnEwuo5qz2srS
	FrL1MriJciw72YMs/Q5gzjg10jSGEwwzVmszIPdsM72LbojknUj6fC/qZ6Iq2CM37rkxmZcyXi5
	jeixCX3vc56QCoWPyVRgfm0AozzC6eIsf9dRASQdASVx1jdnXBFe5tbbs42JcbBZD3LYlBq+OzX
	z5C641Lwm0QZa8BnMRY4FnNklQsFRR4QkCFdhW+QPysR2kDB4ASW/Ya/NPpVkunT4XEUMypNH1S
	bEDtB00cvOpBi6UT9kjWEG6u9qgM9Dh2NVyxmFCZb61nWbEOX1t4waMC+TYytx94RVHmBBPMu0I
	sYGoD4C156zwOsqFFC2zX1W5xVTi8DFaJCitBhfkwbL9SH26+12sYyZeDnA3wt6mAM2/QXxIjA/
	a8cxRS/m3/XcH+dNw7AEqUnQI=
X-Google-Smtp-Source: AGHT+IHVSpMSo66zVScyuFD1Z3iW93HSQXyMmz1zQcisit57Dtl8aCUPtP/QpA/hf6MOKs+Kat+dNw==
X-Received: by 2002:ad4:5ce2:0:b0:71a:5b14:3cbe with SMTP id 6a1803df08f44-71a5b143fe4mr202087746d6.27.1757047329019;
        Thu, 04 Sep 2025 21:42:09 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-72925b87571sm23102486d6.6.2025.09.04.21.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:08 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06427F40066;
	Fri,  5 Sep 2025 00:42:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 05 Sep 2025 00:42:08 -0400
X-ME-Sender: <xms:H2q6aO4RnVOgt7aLZf_mx7VB7njQmym3pv9brZeKHBdlqNzgUyDRuA>
    <xme:H2q6aAuEHiIIoZm1nTVDc6QX2TXjMHJKQ2Ptm-dK6H7_vqQDaK-nln04duiwLdXXL
    SGDrwCJkX6xzJpjsA>
X-ME-Received: <xmr:H2q6aOzLldP_d2T09ehX5Hid2W9wJ3xz6ZGNTkdrgfyA0_RWJZuFhFaxeadEUAAo1J7oSRrTt31VU50wzHpKMQ9ymUHU8cTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehieffheeffeegjefftdeggfelvefgffffudegtdffueetjeduleetfedvleekgeen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhe
    dvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdp
    nhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehruh
    hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghp
    thhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlih
    hnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:H2q6aAbgvOyb2St_q-jY5oglfkEyPwojfQrQETNymA_UnHjNkU8rJw>
    <xmx:H2q6aF5u9OGmWTKC_JIX1ThTOtkmbXIJ_CmEypbQ_2yACUznUyCNUw>
    <xmx:H2q6aH4PCVmvlfiQdn7cWhddGjubNVYV4xM7nIwTNj3Nr5l9IlDyhQ>
    <xmx:H2q6aNWTW7Ss6WzzUuQ83X8_pGzCzY8U0mPTpQvNesgxZbJqH7ybHg>
    <xmx:IGq6aD6T6eSl7rH9oUgJLd6MDEkvEBlmQMC-bhXgd-BqHKCg2JIVUjLs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:07 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>,
	Fiona Behrens <me@kloenk.dev>
Subject: [PATCH 10/14] rust: implement `kernel::sync::Refcount`
Date: Thu,  4 Sep 2025 21:41:37 -0700
Message-ID: <20250905044141.77868-11-boqun.feng@gmail.com>
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

From: Gary Guo <gary@garyguo.net>

This is a wrapping layer of `include/linux/refcount.h`. Currently the
kernel refcount has already been used in `Arc`, however it calls into
FFI directly.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Benno Lossin <lossin@kernel.org>
[boqun: Add the missing <> for the link in comment]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250723233312.3304339-2-gary@kernel.org
---
 rust/helpers/refcount.c      | 10 ++++
 rust/kernel/sync.rs          |  2 +
 rust/kernel/sync/refcount.rs | 98 ++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 rust/kernel/sync/refcount.rs

diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d6adbd2e45a1..d175898ad7b8 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -7,11 +7,21 @@ refcount_t rust_helper_REFCOUNT_INIT(int n)
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
+void rust_helper_refcount_set(refcount_t *r, int n)
+{
+	refcount_set(r, n);
+}
+
 void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
+void rust_helper_refcount_dec(refcount_t *r)
+{
+	refcount_dec(r);
+}
+
 bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index bf8943c88a89..cf5b638a097d 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -19,6 +19,7 @@
 mod locked_by;
 pub mod poll;
 pub mod rcu;
+mod refcount;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
@@ -27,6 +28,7 @@
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
 pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
 pub use locked_by::LockedBy;
+pub use refcount::Refcount;
 
 /// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
 #[repr(transparent)]
diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
new file mode 100644
index 000000000000..cc1a80ae7ae9
--- /dev/null
+++ b/rust/kernel/sync/refcount.rs
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Atomic reference counting.
+//!
+//! C header: [`include/linux/refcount.h`](srctree/include/linux/refcount.h)
+
+use crate::build_assert;
+use crate::types::Opaque;
+
+/// Atomic reference counter.
+///
+/// This type is conceptually an atomic integer, but provides saturation semantics compared to
+/// normal atomic integers. Values in the negative range when viewed as a signed integer are
+/// saturation (bad) values. For details about the saturation semantics, please refer to top of
+/// [`include/linux/refcount.h`](srctree/include/linux/refcount.h).
+///
+/// Wraps the kernel's C `refcount_t`.
+#[repr(transparent)]
+pub struct Refcount(Opaque<bindings::refcount_t>);
+
+impl Refcount {
+    /// Construct a new [`Refcount`] from an initial value.
+    ///
+    /// The initial value should be non-saturated.
+    #[inline]
+    pub fn new(value: i32) -> Self {
+        build_assert!(value >= 0, "initial value saturated");
+        // SAFETY: There are no safety requirements for this FFI call.
+        Self(Opaque::new(unsafe { bindings::REFCOUNT_INIT(value) }))
+    }
+
+    #[inline]
+    fn as_ptr(&self) -> *mut bindings::refcount_t {
+        self.0.get()
+    }
+
+    /// Set a refcount's value.
+    #[inline]
+    pub fn set(&self, value: i32) {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_set(self.as_ptr(), value) }
+    }
+
+    /// Increment a refcount.
+    ///
+    /// It will saturate if overflows and `WARN`. It will also `WARN` if the refcount is 0, as this
+    /// represents a possible use-after-free condition.
+    ///
+    /// Provides no memory ordering, it is assumed that caller already has a reference on the
+    /// object.
+    #[inline]
+    pub fn inc(&self) {
+        // SAFETY: self is valid.
+        unsafe { bindings::refcount_inc(self.as_ptr()) }
+    }
+
+    /// Decrement a refcount.
+    ///
+    /// It will `WARN` on underflow and fail to decrement when saturated.
+    ///
+    /// Provides release memory ordering, such that prior loads and stores are done
+    /// before.
+    #[inline]
+    pub fn dec(&self) {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec(self.as_ptr()) }
+    }
+
+    /// Decrement a refcount and test if it is 0.
+    ///
+    /// It will `WARN` on underflow and fail to decrement when saturated.
+    ///
+    /// Provides release memory ordering, such that prior loads and stores are done
+    /// before, and provides an acquire ordering on success such that memory deallocation
+    /// must come after.
+    ///
+    /// Returns true if the resulting refcount is 0, false otherwise.
+    ///
+    /// # Notes
+    ///
+    /// A common pattern of using `Refcount` is to free memory when the reference count reaches
+    /// zero. This means that the reference to `Refcount` could become invalid after calling this
+    /// function. This is fine as long as the reference to `Refcount` is no longer used when this
+    /// function returns `false`. It is not necessary to use raw pointers in this scenario, see
+    /// <https://github.com/rust-lang/rust/issues/55005>.
+    #[inline]
+    #[must_use = "use `dec` instead if you do not need to test if it is 0"]
+    pub fn dec_and_test(&self) -> bool {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec_and_test(self.as_ptr()) }
+    }
+}
+
+// SAFETY: `refcount_t` is thread-safe.
+unsafe impl Send for Refcount {}
+
+// SAFETY: `refcount_t` is thread-safe.
+unsafe impl Sync for Refcount {}
-- 
2.51.0

