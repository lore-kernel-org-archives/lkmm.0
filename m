Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35927A114
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047329; cv=none; b=EHJZprUX8IHKpLGbVPapTBlnpQBYXvKBIxwNH/B5q8Yl6TTILb1hXR9vNArUwCEcWsHTpHZfV0nN40a0OOp4N0EB5irsCOPaAbpRPupzqc2ktvnoOKTxiiF1l8yfK1jsu8Z5tTqF+cPJR27AkCTzOvL1AeyhlJg3WZu5WL9W/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047329; c=relaxed/simple;
	bh=MFj734UHEc4mrv5vGKChrUUgs2IjOTEw9riI8z/uVVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3bU9wqWWjSD1XZ+qYUwToQqXYzwOxxTNxZstauEJuSj8gfI4dRXyLv9YRjxdzrZAnbLv77ccbc5F3zAOWTZ0H4SurwLker2fzfJyZQZJKWkq3BEjyUlCaTaeFkA/msYwLVhgp3WXpAcZ0rKvd8RqEq9DN9D5QOsd7XBHkGHg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnppN/lP; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnppN/lP"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70ba7aa131fso19967576d6.2
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047326; x=1757652126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VMnDnVriN8OAFoEq3t7tKLFn2G8p60n2QFdWgNUyXAc=;
        b=MnppN/lPR9sV/7vEXj2vOe8St/+Az6mGvnV5VTOmjBoLWpUMzEqkGbsBOWHXLgIYVA
         IucYZpY4eGAOL1N6wwukalkiQhIq9F7CVb3BmAuTGsCH70+ZtcZ2YvCiKtbtwCqgQgIq
         0qe9AzhvJZAzjHydKRSKhg5LyubavzL03me2OVwynHHG2WoItgPsEM0rRxaiqbAVjDqR
         fv1DSidrc/XuR5SRxtDqQPFomDPq+1pgOZsJjLcFgu3L+PYx9qPfVVIuxQ3uZyAeMNEp
         lvuzYjA040AIKWqiCoHwEZgWSOdpTAK60P99St+RSlpsniutjw0EEqfPB8yE5sVfa3ui
         P1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047326; x=1757652126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMnDnVriN8OAFoEq3t7tKLFn2G8p60n2QFdWgNUyXAc=;
        b=nBIBzSwK/v3S6FIPNtrO5MRC2i9QX5WGsje9l/DFT1Ml2/79HDu+F4ztBiKcFNrGln
         7tc6zlup9IHWFfxStYwIDP231GdkXjju6JML32lu5V37DgtzMKkr+Xcxzp1v5TG5luTB
         WTjkaW/OK6x449VG0xDbvjKzFi5oHlY1TTWPSZSoSitov7uvezAE4bjL5xLDSjGCg5UR
         bPO5sxrvnNzoO8FW87YgayGmT++8XI6fr94G9OFppdV/735/4PQoQnMewFqcbxN7ENMX
         HqQB8TMy4RTUBGDakHeH0leWA/d6IXB6vChSDbHZFT74GJ5y0rQ3bjaA+r+nsCgOW33Z
         LcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOlFeqq+ojH2Lg3qsD+Vt7Y9n48+LAj86LMOWRViBzQYayUtBeOvgWZubwX1Uh5xpRUDVi@lists.linux.dev
X-Gm-Message-State: AOJu0YzIvCaiA8NcXTWWNZOWnCrw1RNnJ0yM4BZNb8R+Ah3+s1hCujm9
	GV1lLiwgbHANOhsWT8GzBV1/lBKtWyGpv/451bjbxv5DY5kErOoavrF1
X-Gm-Gg: ASbGnculRz4FvdNdcef5XSYl8Gg1SkoHM9nW0NHKsn4K3AOuv2hm4/Ga1B25kuUZBaW
	xYcH9Od8zXPVD6wOpeCcKPSCa08lbu6p1zyMOyLe/cvOxgKtyp+GHlDsZE9+c8Ak0uOf20O8iWt
	/xfMjN76e3++MOHLb+LuEtUk90v9kWVkM+AT3TwKh2BOveMOZQHwz70Me9DnwnFBPmOdXE6kKRD
	IWkuBYNuX3ba5YD+DBhp3B6JomwF/LOQq5ayPe5M8TlZvYn1qRg1neL7+HlkhRBFgnpnqMmGUnE
	iBk/jajsDkajZDGvmngEX1QBcYkXelTlyrZj1sIQjTg6lbvHcKvR5qILtBF6WO15gaAtmiLNNGK
	RvX1x/Lf8mb9R/nmZGdeSk4x0XlKAcdZJKoTxjESkN8dx42aElMXD5b+FE58LV6Q98EBWwbHhqQ
	dkku8lV4OUr1bQI6HXWDkDg9cimdDmVfh5Sg==
X-Google-Smtp-Source: AGHT+IHWGPwGtPYiAZg8AM6Wt/5qiuYqsUpzah7cVw8Saj4YNowV/zqQ65a60VBO+cYV8TS/LkkohQ==
X-Received: by 2002:a05:6214:76b:b0:717:4378:b604 with SMTP id 6a1803df08f44-7174378d2c8mr231227846d6.58.1757047325880;
        Thu, 04 Sep 2025 21:42:05 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b6c07573sm59727786d6.71.2025.09.04.21.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:05 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1A734F40066;
	Fri,  5 Sep 2025 00:42:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 05 Sep 2025 00:42:05 -0400
X-ME-Sender: <xms:HGq6aLi7wTHa5enCTg1s_T9Oonbm2n66DJ9zblGir0w7Xbp4YJJiLA>
    <xme:HGq6aFsk2OQlg4ECP166IoXbm0a_kgG_CcZOjfHogifd3fV9tOli41XxbzR-elOrE
    ijWwMhXxZKu5Hfn1Q>
X-ME-Received: <xmr:HGq6aM0mCGKewZLMvmNnesfVhWXJEBNDoSaxA1mrW8UvTgR14aadO792BGiVGHQvn2wrYb-wfcN6_n-KZwXZkAXOlg-QLTT2>
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
X-ME-Proxy: <xmx:HWq6aExsvBYwCajNrtyP8C1dT0uTul20oI636BE2OsHgi8gvs0SykA>
    <xmx:HWq6aPX68XX4dR3KJuNEU0zxqBIEbj64O1BOSnqgFhr6Gh-WR8V2KA>
    <xmx:HWq6aOAZJnliUPq9QFE8qyOLScJ5TfQ740fcn3Opb6bgVL7fRUlTwA>
    <xmx:HWq6aI74BrU7LtPvuhS_HAJEOqEo4NUoksQmFMri-JoP7DdW4HMLcQ>
    <xmx:HWq6aCt26RxH5PVAdiMYISerVh7No_mRXC7uJJJ9wNBElW7tFbVmW5pd>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:03 -0400 (EDT)
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
Subject: [PATCH 08/14] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Thu,  4 Sep 2025 21:41:35 -0700
Message-ID: <20250905044141.77868-9-boqun.feng@gmail.com>
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
Link: https://lore.kernel.org/all/20250719030827.61357-9-boqun.feng@gmail.com/
---
 rust/kernel/sync/atomic/predefine.rs | 53 +++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index d0875812f6ad..45a17985cda4 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -2,6 +2,9 @@
 
 //! Pre-defined atomic types
 
+use crate::static_assert;
+use core::mem::{align_of, size_of};
+
 // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i32 {
@@ -28,6 +31,35 @@ fn rhs_into_delta(rhs: i64) -> i64 {
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
 // SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
 // `i32`.
 unsafe impl super::AtomicType for u32 {
@@ -54,6 +86,19 @@ fn rhs_into_delta(rhs: u64) -> i64 {
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
@@ -73,7 +118,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
@@ -82,7 +127,7 @@ fn atomic_basic_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -95,7 +140,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -110,7 +155,7 @@ fn atomic_cmpxchg_tests() {
 
     #[test]
     fn atomic_arithmetic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.fetch_add(12, Full));
-- 
2.51.0

