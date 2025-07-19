Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D22248B3
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752894529; cv=none; b=FEZow84Q+6fWCVfbBCjL+/MunOmoqVWnzwHMxrQZ0V2f0oBNYB+99sa18QwsPsaMtkUO8hzyGzlFvi+WEYWC9OAq2ASZ5bQxlDtgN89bUaqfG1TuxRCq4OyxRqy4+ufzd+gfh65B5Jy8lbJR+a41jnuWBFhtPiXm6QBZxBVZomI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752894529; c=relaxed/simple;
	bh=9J8UzkIID/XiEhOWXJ9BC39wu1fLwBzVqB38wRzp7CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I890fa8L3wh+pAGmT8qMguaGY++tMNY/znL84/vrIawfex8Ig+2J7mjz9sNEP66Fe0w96nIb8ANleCNgqf0yrUjZnDXv6qjKveJ7v6zCAZsINKCObcGyHpj9Y2uHoiJzx2VThiOMQY1RDi5c/GMfxH0NOrLwfn8S2CfQFlZuTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OacQDXmt; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OacQDXmt"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e2c920058fso365932885a.0
        for <lkmm@lists.linux.dev>; Fri, 18 Jul 2025 20:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752894524; x=1753499324; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRV31OgwoLIyVdat05xKwhcifuZryi7XwOha7Q+Eics=;
        b=OacQDXmtFEHrftla+eKx3i0hNDYagc+jr/47I7Zz3BZWFNikRa/iq5JPyfv8fGcVYQ
         4Aq22oEOFL/xS7M27xGu1yMZobiYEbjEfwsWQR0rCwBhsw8pbZnxG9o5G0jzdYx9VxEA
         PV0Qe8oeOWtoCMqh1vr80c/e7N9xcKgIsxc/jlOoE8zJLE+Pp70NTWdGWIalenN7YBKq
         zu1bE+1CkCisWhrcZdOtLCDDvWUYMTQ41YlCFV+v234mEdxphNdwK+RPJ7mi2Y2Rq7+L
         aUz+4umeSSSwSQySCyKLGN0FApAlZThxssMyxNzUvIWq/nhTbakfB2aoDDpotZ+mXZ0/
         QaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752894524; x=1753499324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRV31OgwoLIyVdat05xKwhcifuZryi7XwOha7Q+Eics=;
        b=okloRFcG3pY1c3ODI7GoI2TPvhWNvtmo74Xr8Zr5t6s/HRe/YNOJ5HFb5XTd0rOgFQ
         ZxF5K4pas6IxnteDJ/1KuSIFjnIiiJsRbFxvpCn0ffMgy49JsKiqJ0xTICrCTJwJyHZ0
         FIq5+oh14NP4y5Azg3EK0fcDdVHDUzZ8k+sl0xUjN2lpcoRCExu7h3H8xbSdXBhplw0g
         q+Csn6X7A3XNwR/QjaHrGjlDOyRQo2Ywl2O+TuS668XxN/JxAb4WfoqLhEdzSAoc5j/Y
         jogoNkB6qK7txnXURj5PzGChttuz2HWxvq+prynKhPXcLjsVWrRQTJ+0tkKQ2L0675pc
         h8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVC1yWjB5rM+jG9NVDvLFJvm2pAIGnkJEW6kO1VxGDAl3wDt8USxoiwK2oWmEejAZ75uJEQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4YxG0XT9l++xlS6j0o9CTE3g/UK9VAGsFaOgErtsqqOaEqFe2
	xj6HLW5BwhHyu0z4k3iDEuUnkFhwpRnG59Fh4c8Cht2reP1AT5ICRUo4
X-Gm-Gg: ASbGncuK/H68KsacJlqk2cY9ZI/hRaEM0kdbBv5hHPGkzqLuQDRWu0n4++PqCQOIE/V
	KCh8Qi68bBzquq+e15CKwP2mXfd9F594uBfvOaGSHTv9ABs3i/O3oiKPPKHxPopXpouGOQ9ca4c
	nkZL+xIF+Y2Kx44JYC/76q4oeQ5GXdHyIuRV73qUB8Era5mJkAWyCQc83ITb3lMYf/yE4be6NEC
	nIi4zcKYDQAbSWebGxinv6M3CiHbPytpwRMjrrDDhtwj71POE2sOllduBCehwOCBy2Wcd5TdtbU
	xAlGcuPt02fGblYuzjtpm1KvCtZxduP1pY0mz40ru6h1bMByaA1csCGEPulWROnh+kEZjbsgjA8
	xcIqQHWApHsodB3rSVUrOyNr6BurZQbI/lyQSEv5hcOWGqoiswz3zg0s/Ue5+aN0kZSD2Va9t2w
	IpizMcKVFlb5Qy/FUwCvuMWlY=
X-Google-Smtp-Source: AGHT+IHyjjzUNmWjmhlbi3o/iAlT48Spt+HaBYBPfrzRKfoQhkBndr62EEj/V4AfCEqT9BforNYfrQ==
X-Received: by 2002:a05:620a:2f4:b0:7d5:e374:e2bb with SMTP id af79cd13be357-7e35592ffa7mr694036385a.27.1752894524039;
        Fri, 18 Jul 2025 20:08:44 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c4780esm157275585a.55.2025.07.18.20.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 20:08:43 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E1F01F40066;
	Fri, 18 Jul 2025 23:08:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 18 Jul 2025 23:08:42 -0400
X-ME-Sender: <xms:Ogx7aDfA4tJzZly0obynakDeyqGD_0yTpnRhx7CBtrQHi6oNVnJEfw>
    <xme:Ogx7aKuqwrH9yBsGu0GhdAwFYAbSBlCZ5_97s704Zyf9C3jRtBwwcIhaCMNZ5WNbc
    T3IkW3eO7_LqFu2Xg>
X-ME-Received: <xmr:Ogx7aBGs63i8NpuV0-KwfCG-xvtllxlfVktwlpzUC4yFMaS08YWQv3PM6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeihedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
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
X-ME-Proxy: <xmx:Ogx7aEczjTriXADfzaLRZHn3o9hHLJfzFA7cmpcEjnTJI7h0SvPokQ>
    <xmx:Ogx7aNv2m1mLc0ZAqcnTIydGzrfqMfMaM1nBFNJRWsdyFFkaC6OW9A>
    <xmx:Ogx7aLnzuEzgEW3vvW_aJD0ooVFQxUIUNz2plUwit5KU0RpT7gUlfQ>
    <xmx:Ogx7aIAF9UGHmBoFgo-HML_sk6abb3KOMtU7fhohcIk397ZPisSgLQ>
    <xmx:Ogx7aLw48kdIMys3zQ53OR7QV9xtyZuz0YqBzUo3pmd8QAul4fWkz08R>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 23:08:42 -0400 (EDT)
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
Subject: [PATCH v8 8/9] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Fri, 18 Jul 2025 20:08:26 -0700
Message-Id: <20250719030827.61357-9-boqun.feng@gmail.com>
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

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AtomicType::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available. To do so,
an internal type `isize_atomic_repr` is defined, it's `i32` in 32bit
kernel and `i64` in 64bit kernel.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index d0875812f6ad..feba77372bb8 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -2,6 +2,9 @@
 
 //! Pre-defined atomic types
 
+use core::mem::{align_of, size_of};
+use crate::static_assert;
+
 // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i32 {
@@ -28,6 +31,36 @@ fn rhs_into_delta(rhs: i64) -> i64 {
     }
 }
 
+// Defines an internal type that always maps to the integer type which has the same size alignment
+// as `isize` and `usize`, and `isize` and `usize` are always bi-directional transmutable to
+// `isize_atomic_repr`, which also always implements `AtomicImpl`.
+#[allow(non_camel_case_types)]
+#[cfg(not(CONFIG_64BIT))]
+type isize_atomic_repr = i32;
+#[allow(non_camel_case_types)]
+#[cfg(CONFIG_64BIT)]
+type isize_atomic_repr = i64;
+
+// Ensure size and alignment requirements are checked.
+static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
+static_assert!(align_of::<isize>() == align_of::<isize_atomic_repr>());
+static_assert!(size_of::<usize>() == size_of::<isize_atomic_repr>());
+static_assert!(align_of::<usize>() == align_of::<isize_atomic_repr>());
+
+// SAFETY: `isize` has the same size and alignment with `isize_atomic_repr`, and is round-trip
+// transmutable to `isize_atomic_repr`.
+unsafe impl super::AtomicType for isize {
+    type Repr = isize_atomic_repr;
+}
+
+// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `usize`.
+unsafe impl super::AtomicAdd<isize> for isize {
+    fn rhs_into_delta(rhs: isize) -> isize_atomic_repr {
+        rhs as isize_atomic_repr
+    }
+}
+
+
 // SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
 // `i32`.
 unsafe impl super::AtomicType for u32 {
@@ -54,6 +87,19 @@ fn rhs_into_delta(rhs: u64) -> i64 {
     }
 }
 
+// SAFETY: `usize` has the same size and alignment with `isize_atomic_repr`, and is round-trip
+// transmutable to `isize_atomic_repr`.
+unsafe impl super::AtomicType for usize {
+    type Repr = isize_atomic_repr;
+}
+
+// SAFETY: The wrapping add result of two `isize_atomic_repr`s is a valid `usize`.
+unsafe impl super::AtomicAdd<usize> for usize {
+    fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
+        rhs as isize_atomic_repr
+    }
+}
+
 use crate::macros::kunit_tests;
 
 #[kunit_tests(rust_atomics)]
@@ -73,7 +119,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
@@ -82,7 +128,7 @@ fn atomic_basic_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -95,7 +141,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -110,7 +156,7 @@ fn atomic_cmpxchg_tests() {
 
     #[test]
     fn atomic_arithmetic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.fetch_add(12, Full));
-- 
2.39.5 (Apple Git-154)

