Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2483A2F94A0
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265394; cv=none; b=JPp/iYf1wxFvnxGmk6nn19kc3UfFlyloTQ3HqNlSLZ+m06XXahPWhcqUhY0WGsgMvnlBQzhvkTQtZ+ngjvg0gVe1WVjI0dbDO6hj1Qqzheh+39kBNsPf6neMwxrhtlL5SNwec41hR2eOHNLun6cDp/+d3fFbU+H57aRkyyPuib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265394; c=relaxed/simple;
	bh=dvU14r0iEmi4OnkDpLWDsbtGzzO7lc6z0w9QAU4TSno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gTIyLSR/q/CL+4Br4QTrYXSwRQTlFMqRMKyCHiHFA1Bh+TxXF3+o+zMdwK3QHGNHu8/tdGEr0t7IT0hkb66eFFFsJTAuVtrye8Jc2GDcENu88UW5agZhG0LbHh9MMkc3DKVHRCH+WKjpWwCFUG6llM4dEoDInPDtzNlzqpV/ZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ9tBgiU; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ9tBgiU"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cad6a4fae4so1389974185a.2
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265391; x=1750870191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZOCtxk6LFOKknpWbYEkP2m+QB/jgJqyC9svVPxtO+w4=;
        b=nJ9tBgiU/9T2JhAVdsWc8ndbO4ngVGVVHobfKgv15gJR3nwjtlQJpONf+lp56Sb3aG
         jrURp1HbM30gVJ/bA0m9/7jsqvB3zchUcvA0LjMGJxx+WLlwmaqGdiImIJ+bNzdCRSVh
         RvHWqpYi1jGC0SsEyntBdjswCng3s7yEMp2CJ4GWzmqCACGe0RuAfwaKnqpKM8xpuzLW
         HUfwKDeDWr+Gj1jU6DIUuNas2rlKgi6CridC3x9uEKEpjtvdqtasHpqsIyGVq5jfm8LF
         OAhVOBGTbS2DXkfCAo6/noI2V8ZaUTWHhUM6OSYjaAP7s4yGtHpoTzphmW+uN80o5KIA
         KlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265391; x=1750870191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOCtxk6LFOKknpWbYEkP2m+QB/jgJqyC9svVPxtO+w4=;
        b=LB69ueGCB0mv5unzZJo0euIOskjCKOj15aq0K4S6aGGVPTstXZuIbPMzsJv/J+mcsJ
         Tl+BR01Al+RBIrL97wlRMBK2VaMIvyIUPuwc18rtQ0QXiqyz0N289Td5iUlyBvL84fVg
         wbTok9BbCQeECSZzjegic/Ih5T9M1b2LNbJM7KmDEAsD7Zn83trw3NfzAh4EhSZCXw3Z
         2dkjVAj/Vv95YiwPxxw0oOSEv4u55OkAdpVE0LHoJ3jsC1ldJMHHxcnSvAhoPHOm8kNo
         AQ1qSQO4lUuidPFg64ptZ7T5E3JDyruuHayEAKblsxQpJ9f69B6gIWj/W0pVqf8ixJgE
         3uZw==
X-Forwarded-Encrypted: i=1; AJvYcCUSYN0x5u4oAkFtwLSqH5aawko8Jf74eANcOxM9gYkiiKMEGazdqPtutnHZXVgsBYI8EaJJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwpDGe0GWlM1fhrfHJX2en1jBGzMzjwq1nrqx86/Zkgq2M6uSZL
	j7wjXxQDvF0ok3V8RTodmdKsMrXh8CUYHrLyEDqtmBpwyWae2lfwvl8E
X-Gm-Gg: ASbGncvkv+2QMpupVUO95L6i39EzUuUxkSUkY+7VXvPGa8mqSvuor6kwMOuzIU4jubD
	s4SAaIVcPo8ZK3fs41I80KdUlV93GoF03suvwdYccj/I9zPGJIzqWmu/DLYLcxpq38D9+9f3Bi4
	l88mzwonnpzdQjzsdOH9xyEsywL9diB63CAsmNKA/zntoy6HZXq//eBVJbOkAoQXu5O0+emj+zH
	2vsDfaMLAM84WYqP7RQzUMp5WXBFgD0CLC+AbcxyfyQ4ko9DakelSRuPwXBipBiT1KKlq8Llhw6
	uJ0vAAUikPd1elM1Ww4/iGfxAw75+f5tGmdMz447r8dP+4Mpx8VcW/uhji66TV3H4nxeBYGiqbS
	2h7m6IW/J3wykMA5AZPHT6wW2/8Nt1TFOJkMugo6w0++6tIcGeopf
X-Google-Smtp-Source: AGHT+IGtMbe/TFPtiErhwZaMxWZkvFVyH4tNlqSJ3Rbys4ejjuEohtWqE7T+GmnAfqkxFN4yigkK7A==
X-Received: by 2002:a05:620a:1b8f:b0:7d0:996f:9c48 with SMTP id af79cd13be357-7d3c6c04a8cmr2658207685a.9.1750265390952;
        Wed, 18 Jun 2025 09:49:50 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f272a8sm785667285a.115.2025.06.18.09.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:50 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17A1B1200043;
	Wed, 18 Jun 2025 12:49:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 18 Jun 2025 12:49:50 -0400
X-ME-Sender: <xms:Le5SaNGlL0BXeqWamwgO14IJwsXLuBbaX7ByVVp-ycgX77-wVenB8Q>
    <xme:Le5SaCV85YXd5HCy9jx3uea_0oYdHUBxmGhdJBVaeDroOI0OMSxpH05oGZathsQVT
    xAqwyesbxyzrNYsFw>
X-ME-Received: <xmr:Le5SaPJxu6_crYiXgAEMwRk9KfWMGou9tcaP0qhNSUuk59fyrIxRgQLDI7j3HA>
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
X-ME-Proxy: <xmx:Le5SaDFcKmdD23MLk7VvkfkgJxCElpAFgpOZ8B3hPu8Gal2VxFSzMg>
    <xmx:Le5SaDULTbO6iw-pb01ZYFqIAehM9FsdgdfvDXCUm3Acm4JeGumn1A>
    <xmx:Le5SaOP_oVtelCnzsacGqaRz10tckFqlVzYlxAbtYXXNRdr_8W4mfA>
    <xmx:Le5SaC13wcEP0_f-QxcWW-JZq271JH4m1uMSxCGzFnxxBFbLH5DS-g>
    <xmx:Lu5SaAX5njxNFtK3pQHOgHL_EGyhpOdN5ZOrhTLY9Nb-Y2P0FgD0XJIb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:49 -0400 (EDT)
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
Subject: [PATCH v5 09/10] rust: sync: atomic: Add Atomic<*mut T>
Date: Wed, 18 Jun 2025 09:49:33 -0700
Message-Id: <20250618164934.19817-10-boqun.feng@gmail.com>
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

Add atomic support for raw pointer values, similar to `isize` and
`usize`, the representation type is selected based on CONFIG_64BIT.

`*mut T` is not `Send`, however `Atomic<*mut T>` definitely needs to be
a `Sync`, and that's the whole point of atomics: being able to have
multiple shared references in different threads so that they can sync
with each other. As a result, a pointer value will be transferred from
one thread to another via `Atomic<*mut T>`:

	<thread 1>		<thread 2>
	x.store(p1, Relaxed);
				let p = x.load(p1, Relaxed);

This means a raw pointer value (`*mut T`) needs to be able to transfer
across thread boundaries, which is essentially `Send`.

To reflect this in the type system, and based on the fact that pointer
values can be transferred safely (only using them to dereference is
unsafe), as suggested by Alice, extend the `AllowAtomic` trait to
include a customized `Send` semantics, that is: `impl AllowAtomic` has
to be safe to be transferred across thread boundaries.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         | 48 ++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/generic.rs | 16 ++++++++--
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 829511f4d582..70920146935f 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -114,6 +114,22 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d as Self::Repr
     }
 }
+// SAFETY: A `*mut T` has the same size and the alignment as `i64` for 64bit and the same as `i32`
+// for 32bit. And it's safe to transfer the ownership of a pointer value to another thread.
+unsafe impl<T> generic::AllowAtomic for *mut T {
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+    #[cfg(not(CONFIG_64BIT))]
+    type Repr = i32;
+
+    fn into_repr(self) -> Self::Repr {
+        self as Self::Repr
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as Self
+    }
+}
 
 use crate::macros::kunit_tests;
 
@@ -139,6 +155,9 @@ fn atomic_basic_tests() {
 
             assert_eq!(v, x.load(Relaxed));
         });
+
+        let x = Atomic::new(core::ptr::null_mut::<i32>());
+        assert!(x.load(Relaxed).is_null());
     }
 
     #[test]
@@ -182,4 +201,33 @@ fn atomic_arithmetic_tests() {
             assert_eq!(v + 25, x.load(Relaxed));
         });
     }
+
+    #[test]
+    fn atomic_ptr_tests() -> crate::error::Result {
+        use crate::alloc::{flags::GFP_KERNEL, KBox};
+        use core::ptr;
+
+        let x = Atomic::new(ptr::null_mut::<i32>());
+
+        assert!(x.load(Relaxed).is_null());
+
+        let new = KBox::new(42, GFP_KERNEL)?;
+        x.store(ptr::from_mut(KBox::leak(new)), Release);
+
+        let ptr = x.load(Relaxed);
+        assert!(!ptr.is_null());
+
+        // SAFETY: `ptr` is a valid pointer from `KBox::leak()` and the address dependency
+        // guarantees observation of the initialization of `KBox`.
+        assert_eq!(42, unsafe { ptr.read_volatile() });
+
+        x.xchg(ptr::null_mut(), Relaxed);
+        assert!(x.load(Relaxed).is_null());
+
+        // SAFETY: `ptr` is a valid pointer from `KBox::leak()` and no one is currently referencing
+        // the pointer, so it's safety to convert the ownership back to a `KBox`.
+        drop(unsafe { KBox::from_raw(ptr) });
+
+        Ok(())
+    }
 }
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 8c5bd90b2619..f496774c1686 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -18,6 +18,10 @@
 #[repr(transparent)]
 pub struct Atomic<T: AllowAtomic>(Opaque<T>);
 
+// SAFETY: `Atomic<T>` is safe to send between execution contexts, because `T` is `AllowAtomic` and
+// `AllowAtomic`'s safety requirement guarantees that.
+unsafe impl<T: AllowAtomic> Send for Atomic<T> {}
+
 // SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
 unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 
@@ -30,8 +34,13 @@ unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 ///
 /// # Safety
 ///
-/// [`Self`] must have the same size and alignment as [`Self::Repr`].
-pub unsafe trait AllowAtomic: Sized + Send + Copy {
+/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
+/// - The implementer must guarantee it's safe to transfer ownership from one execution context to
+///   another, this means it has to be a [`Send`], but because `*mut T` is not [`Send`] and that's
+///   the basic type needs to support atomic operations, so this safety requirement is added to
+///   [`AllowAtomic`] trait. This safety requirement is automatically satisfied if the type is a
+///   [`Send`].
+pub unsafe trait AllowAtomic: Sized + Copy {
     /// The backing atomic implementation type.
     type Repr: AtomicImpl;
 
@@ -44,7 +53,8 @@ pub unsafe trait AllowAtomic: Sized + Send + Copy {
 
 // An `AtomicImpl` is automatically an `AllowAtomic`.
 //
-// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment. And all
+// `AtomicImpl` types are `Send`.
 unsafe impl<T: AtomicImpl> AllowAtomic for T {
     type Repr = Self;
 
-- 
2.39.5 (Apple Git-154)

