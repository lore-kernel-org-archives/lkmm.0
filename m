Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8D286415
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047334; cv=none; b=Rn+DVAP/POG9WsNKYfaqJquKQnaSvP1nfxGsbcPt1gA8fC5eDE6+s/jEj7O7OWpdgWh9inJQoewjw1/P74ZpYkRRNsGCJrjwivHoTKF2e4dWXf+1IBTK4GM3D+D2vOTZPTwqYdPH9KJmi43iHns27kXSa1psqRrmgOqkmCCnRwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047334; c=relaxed/simple;
	bh=uBI6gyZVc+1Um14s6hPhgg3mBjdJQn5MO+D6KWTyoHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQzX06Wz3j/sYiVHs2VXMpskOWA+xuaLdKWUkcw6ctW1LfAnPimjtqNnil+zaos5D6Vrx69qR/NoG+6+aSrsxa1akNJlJ8hOBymz6nA7IwBTwrQJaKklNQO4pAZmRp7r3CusnxoO7npEQuLC65jdO3fp+vVM975H8RETdiF7OLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlXAfi2l; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlXAfi2l"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b338d7a540so23091761cf.1
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047332; x=1757652132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uFPH1xGlJ9jsNOaI+QEknzlezPIufUhMzq3e7MIAKNo=;
        b=OlXAfi2lcKQJ1VAyS5fwLaL09DRPZilE0BecLry0TDBoPGgDS2VrB0auYJDtqKk7OI
         MT4JEHNMMSD4dL1BTKWSKxr8nOsOwIp4eIbTnCUJUdPKH3mhHhE43rD9KM3oT2Zq/Jso
         aXnefMu9+kL/dwJHTqF8da3EPS3L4fObR1muT8BxSlx8f1xa50d5tRz+YBjsO6SgxWLa
         ZN9VSE47/oTaH/wwyqNgGw7bR2btapDzlZbTuwtPzbo9yGw0gVsoAbqCQDlVluda7mR/
         uEyJYAsajdpJveorqqS9TZt/MnXw+4JGshEGAvWU1HN6DOUdijwvoa6UrC4HxcML69tS
         xRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047332; x=1757652132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFPH1xGlJ9jsNOaI+QEknzlezPIufUhMzq3e7MIAKNo=;
        b=dRBopdw9SS5AziGnZfs85AqhYMEiS5E0lIckUCKYylugnpVz2BZ50XauY1D03C/4dD
         rcW6FhVBfFvcVYG7HQGfMtI8eXY8UdAyy/dPVSTRY8phTek2k3ugZxAOJtESWVarm/Fh
         gOaT3sP3ohGVluyJNrFcjskJJ21+CnXxyyb4KhIesr/WwO6nZVCGOSVHiCrC+lZJvndX
         uhfEvcSYtx2x/CYLlcMgCst79sKb3sRqNiyTfM6WC8k2EDpP1+gK19Y9KYJKdZfK2C0l
         OAz7oHrCGw7ejSfc/qVW+5w/WaXXoQeFdQ91UR16zS7aRKvnyFbXBG0qkb2B557KNsgS
         LgSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXekWk9LXSYKyyqpIvTGlct7iIW8D/1HJYxZhJMUSt/lIk2v4TN0Lwu2GJAV/jX1PGlqMFk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2cof6V8NxO3m7cbmj9bi460qoHb0BWeJhTCyaM6cjvbtCTGwo
	yViGTaMRr7WUDATJC91PvN9igjwEBmdVajDQBHUGyMNWIbYzNbyVowGP
X-Gm-Gg: ASbGncsmPThbadaPI6iPyA5vyAXR86ZAtQXCRFWq+/fr0xQTYh0WhhSim1NNttoYiFO
	kEnTQgdec2ZmYWRtJeAVguc09az2xws3VPJ38quEfHOO9QoDJ0GdznuCXWjNFXx7nLbBvQRZ0U+
	3xWbepXySwPFmJBIT0UIxOmqbjsqemoja8JmFKqa2Aiv3V0Z0129u76tBu6PmwpOpVKrX/wTEwN
	rcuj3aGyhF5bvHcgJFy42BXm2x+5qw4EWwjVSFulLpO1rHyqMBY1pv1zoHcYw8av2hc/b3YB+w7
	Vy+vnXgcjcMbYHQGNFp8bBwSZhruLEvecfTmAUNEI70ocnVmqsGWKI2qUlES1EzViYmbT/RT9Ns
	Kk2UmMfU0C9DJfwcqp71J8EuXvYocDGEnxjAl70yCOU1NZLKvUB7rQ853SSRMF0rCx59AFOsAZs
	GLdfP5GmeG9/5eRzQReUhZLQ4=
X-Google-Smtp-Source: AGHT+IGMznZ+sLxiMUEFzriffR3VwEqBeHzxYlM0mov9/4ynKatl5Zd+Oc4dqYNZ9Pusf7/Q71DEZw==
X-Received: by 2002:a05:622a:10:b0:4b2:8ac4:ef85 with SMTP id d75a77b69052e-4b31dd3aad9mr245601351cf.84.1757047331768;
        Thu, 04 Sep 2025 21:42:11 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aabf586c5sm413666685a.60.2025.09.04.21.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:11 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id EACD2F40066;
	Fri,  5 Sep 2025 00:42:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 05 Sep 2025 00:42:10 -0400
X-ME-Sender: <xms:Imq6aLI5DTNxOpwSHBxr-j3JdyxCqQY1C5FuLqAxQa0iR8dpNf_2wA>
    <xme:Imq6aH-KSanfVajBcJ8iB_QezqucFwKwb2-UaObCD5GKiEEBNgkchiPBOgNIFa9Jg
    Be8EHmcyt2cDgHvRg>
X-ME-Received: <xmr:Imq6aFDDo5NvNK0Dm27suR6qJT_bnuM8qmrZ7o3EbR8UTrj-buxysLsrg5xhB_RNImD7O-Ai6L0dmZLuFAp9euuPjyl_fzUz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpedtheffuedvfefgleeiiefffffffedvkeehvdfggeduvedvgfektddvfedvueejgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhpthhrrdgrshenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
    hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
    tghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohep
    mhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Imq6aJoNIwfuTeGC-AGxm39EvLrmEz973y2VDBHZABVnL6eSeNeG-w>
    <xmx:Imq6aGLO2EjKPFuxbxRr3Ebf_tEl3zhekhb5NLpma3ZbxDTwcLYynQ>
    <xmx:Imq6aDKJOVJjSPCzuAqCeYnQJNMIZZbFCPH6AHq7xMhWXCls48e2dA>
    <xmx:Imq6aHkdR6UF4HVxD3FZDTfM_9dbKieGF3HTXVE_9tzv-9_2ayxwRg>
    <xmx:Imq6aBKGDDKZnmXtEm6mDn9Trr8GmLlkXcalmN7CGx2_z9n1XN6nIvpp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:10 -0400 (EDT)
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
	Alexandre Courbot <acourbot@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 12/14] rust: convert `Arc` to use `Refcount`
Date: Thu,  4 Sep 2025 21:41:39 -0700
Message-ID: <20250905044141.77868-13-boqun.feng@gmail.com>
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

With `Refcount` type created, `Arc` can use `Refcount` instead of
calling into FFI directly.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250723233312.3304339-4-gary@kernel.org
---
 rust/kernel/sync/arc.rs | 45 +++++++++++++----------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 4ee155b43b2d..9298993ea7d8 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -8,7 +8,7 @@
 //! threads.
 //!
 //! It is different from the standard library's [`Arc`] in a few ways:
-//! 1. It is backed by the kernel's `refcount_t` type.
+//! 1. It is backed by the kernel's [`Refcount`] type.
 //! 2. It does not support weak references, which allows it to be half the size.
 //! 3. It saturates the reference count instead of aborting when it goes over a threshold.
 //! 4. It does not provide a `get_mut` method, so the ref counted object is pinned.
@@ -18,11 +18,11 @@
 
 use crate::{
     alloc::{AllocError, Flags, KBox},
-    bindings,
     ffi::c_void,
     init::InPlaceInit,
+    sync::Refcount,
     try_init,
-    types::{ForeignOwnable, Opaque},
+    types::ForeignOwnable,
 };
 use core::{
     alloc::Layout,
@@ -145,7 +145,7 @@ pub struct Arc<T: ?Sized> {
 #[pin_data]
 #[repr(C)]
 struct ArcInner<T: ?Sized> {
-    refcount: Opaque<bindings::refcount_t>,
+    refcount: Refcount,
     data: T,
 }
 
@@ -157,7 +157,7 @@ impl<T: ?Sized> ArcInner<T> {
     /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the `Arc` must
     /// not yet have been destroyed.
     unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
-        let refcount_layout = Layout::new::<bindings::refcount_t>();
+        let refcount_layout = Layout::new::<Refcount>();
         // SAFETY: The caller guarantees that the pointer is valid.
         let val_layout = Layout::for_value(unsafe { &*ptr });
         // SAFETY: We're computing the layout of a real struct that existed when compiling this
@@ -229,8 +229,7 @@ impl<T> Arc<T> {
     pub fn new(contents: T, flags: Flags) -> Result<Self, AllocError> {
         // INVARIANT: The refcount is initialised to a non-zero value.
         let value = ArcInner {
-            // SAFETY: There are no safety requirements for this FFI call.
-            refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+            refcount: Refcount::new(1),
             data: contents,
         };
 
@@ -348,18 +347,13 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
         // We will manually manage the refcount in this method, so we disable the destructor.
         let this = ManuallyDrop::new(this);
         // SAFETY: We own a refcount, so the pointer is still valid.
-        let refcount = unsafe { this.ptr.as_ref() }.refcount.get();
+        let refcount = unsafe { &this.ptr.as_ref().refcount };
 
         // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
         // return without further touching the `Arc`. If the refcount reaches zero, then there are
         // no other arcs, and we can create a `UniqueArc`.
-        //
-        // SAFETY: We own a refcount, so the pointer is not dangling.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
-        if is_zero {
-            // SAFETY: We have exclusive access to the arc, so we can perform unsynchronized
-            // accesses to the refcount.
-            unsafe { core::ptr::write(refcount, bindings::REFCOUNT_INIT(1)) };
+        if refcount.dec_and_test() {
+            refcount.set(1);
 
             // INVARIANT: We own the only refcount to this arc, so we may create a `UniqueArc`. We
             // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
@@ -456,14 +450,10 @@ fn borrow(&self) -> &T {
 
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
-        // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
-        // safe to dereference it.
-        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
-
-        // INVARIANT: C `refcount_inc` saturates the refcount, so it cannot overflow to zero.
+        // INVARIANT: `Refcount` saturates the refcount, so it cannot overflow to zero.
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
         // safe to increment the refcount.
-        unsafe { bindings::refcount_inc(refcount) };
+        unsafe { self.ptr.as_ref() }.refcount.inc();
 
         // SAFETY: We just incremented the refcount. This increment is now owned by the new `Arc`.
         unsafe { Self::from_inner(self.ptr) }
@@ -472,16 +462,10 @@ fn clone(&self) -> Self {
 
 impl<T: ?Sized> Drop for Arc<T> {
     fn drop(&mut self) {
-        // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
-        // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
-        // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
-        // freed/invalid memory as long as it is never dereferenced.
-        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
-
         // INVARIANT: If the refcount reaches zero, there are no other instances of `Arc`, and
         // this instance is being dropped, so the broken invariant is not observable.
-        // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
+        // SAFETY: By the type invariant, there is necessarily a reference to the object.
+        let is_zero = unsafe { self.ptr.as_ref() }.refcount.dec_and_test();
         if is_zero {
             // The count reached zero, we must free the memory.
             //
@@ -775,8 +759,7 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
         // INVARIANT: The refcount is initialised to a non-zero value.
         let inner = KBox::try_init::<AllocError>(
             try_init!(ArcInner {
-                // SAFETY: There are no safety requirements for this FFI call.
-                refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+                refcount: Refcount::new(1),
                 data <- pin_init::uninit::<T, AllocError>(),
             }? AllocError),
             flags,
-- 
2.51.0

