Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5182F25E0
	for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273192; cv=none; b=dyDmTPvnzDI78f7aqQ2UX2xWgPADdxP9mc9pf4pvSl2CAR3ukSR6BXtGAwtF6AX/6583HrggtO0JvnyLDLC+q+6nqt7hMyXhid0SxI6CuptiFaA2eud6PpyY90PQtI4Ar9km4tU07JCx25K0mKzTIJACW/MHgFzk2aF4kUmjBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273192; c=relaxed/simple;
	bh=6iII7fOYlyuZ8eQyG3nIT1ClvaKOibtuYRtJwPDwqjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uW7ayLwKcwchJzVJ4VeMgoDmkhLia9Nk7BEavEYWw+cEW+FTjYObtxTVQd5LrBsCPs9lCe39VyehX7bWqynxohWGYqCHR+PxSCSS7g7/2kyK/1q0QN8UvzjQvphuuEJ7Ae/cpWtRDQ3Vhht7bXV/JOHAZ7C5Td9I537rdb0wfPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht0OuqQQ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht0OuqQQ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-77dd76f6964so29155296d6.1
        for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 02:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273190; x=1758877990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tz+hRdDjBJIiUvT5QMJv4FOcC6A5SLAQN/E0smv/a6w=;
        b=Ht0OuqQQ69J1n5J/MFcJmfpNLlkQDXeITXkyx3BhYrNTDj/o9DSHmIx2reGBxxNfyk
         55CALURei5ryzr/zsa31BG8h2ibW4bCOcAZTBgADusSih4o8NzfvNU7afFS/8x93e5Vs
         /2QiyjVgVR90HnVbCectgfb5JWsOg/VwGxNdMRR8AHCjeoMC16J/YxVMZ+yP1ZPNeu2K
         rX4dv9fAXZsxDns5X/mWSwCyxdouFx7EzQWaLemASBbFfRqT+hcKjkgPLT8ZBtB0cipk
         jTCQh/s9XqBETkW+dQjg4tEXtRA7mmuTNm+4g3JAxh3wB8rhWwS1/lpsWrAZtyBoP0cr
         HhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273190; x=1758877990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tz+hRdDjBJIiUvT5QMJv4FOcC6A5SLAQN/E0smv/a6w=;
        b=xRAAn2RzIYLZ9yF9HPyKG62JYPWjOOH/BABfwYaiccNOtfi9GXdhD5rqxEx1FAvUVV
         aruP5u3yygfJFY0yf9jxV4GRKKCWUkh+ujf8ZNtspUgE2QjR7PBIxEwkZylmsCcenpOJ
         y/+2snMWs9JehmOlnUKAWgSNB4+VnNWe/+SklBurv6cOyzy6FGi3hR5WCUJgor20y5eD
         DW57vXIg8rCe1hG3i0kIM2AMR0yQNgCUQh8l9U6X5P9I7NrMfFpKlo7mUuRQNvyQRPWO
         9y+ZcBEIkuioRWLuc0wScqx3I4o0Tt+BSjwRtmjXWLjIX4yLJvqNJru+1ibNb9KWwdx+
         9oPA==
X-Forwarded-Encrypted: i=1; AJvYcCVWOAkLS+9YKuDHanHLgJ1i5EzXi+cyg9p2VGFoosFyoiOMJdR9rZzJCESlucA67L1vAefI@lists.linux.dev
X-Gm-Message-State: AOJu0YzpYb9BWDLxOydUG6q+PTlzL15XadFLFpePO/OMoxdHdKQvgBcb
	rZz48fEzTMQxspMUlCe0U4rSi+ywujiLnmhf5MuLXgddUrYpWEcno6/r
X-Gm-Gg: ASbGncvuihlctqAtAzZDFd61YAOd03QG+snJud+lVtbJj2MB/JUQb0AMk4bS/uEBU++
	zBpZsAWmgplb2dsDsnAVYhr+JWRc0CP/mbskbcrSJ9tDPOMzNwqYsKKOMZFP9imzQ3mQcF3kruC
	dcnAgiqhdUtj03xPqE9hoBnegnAhJCCn68AG+wqIr6HEYLXA2JQUot9Gi68lA7Y9bv6ragPgaiM
	CkE7mdCAdhB8TcPYg0vmozkKKs/zcHYBEuvQ9pgvcs8vWMPrRstkygokgF+BeDLW+LfiPlMAiEG
	Erqn4DXFUt0zzDOHxVa6DKkfQIztc9QD+qiTIax9JwCuexXVOR1vwpu25JNySpi2YrU6R4ARI9c
	7Zd5WISKG4OZYoOyIMjVeIit1HgjyEGuzn9PGncgnywotikK8X+6q7+JZG8prTgww+sf0OP9mRY
	X5VyXu0NuNiT0q
X-Google-Smtp-Source: AGHT+IGHdHKieKTrB7753iPEOZIDAZM2fgg6Vs6HuQORCmBrQ4D7MJr31cHmfl/qBr2eF2H/N1qLqg==
X-Received: by 2002:a05:6214:20ce:b0:783:f54f:418a with SMTP id 6a1803df08f44-798bc7bf0damr31065416d6.15.1758273190002;
        Fri, 19 Sep 2025 02:13:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793533ac961sm25881696d6.50.2025.09.19.02.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:13:09 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 23359F40067;
	Fri, 19 Sep 2025 05:13:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 19 Sep 2025 05:13:09 -0400
X-ME-Sender: <xms:pR7NaJ9vvqlPSPZVQI4woMsaoR7l4rW-L2WFWW2oKRT_0My_lUHWqg>
    <xme:pR7NaDepPlq-HU1FNcfjpUctnlMpvU7OmDVRaeMe5omY9E98kexaEi-AyMjLZQ_Sg
    8fvcoz4yUPJCLbyOA>
X-ME-Received: <xmr:pR7NaFHFbEUxVE7i4IHtSN72OsT9p9FTH9VodAeRJUI4pMCTiUfMOYFFsZYC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepkeetteejgeduieekudejfedvvddtiefgieffffeljeefieehiefffedvfeffgfet
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepph
    gvthgvrhiisehnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphht
    thhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgt
    ohhm
X-ME-Proxy: <xmx:pR7NaICwVnZDWc0eKAy4CfK5fVJSdQoWW5WJojmvifpQ0K0kgXtQEQ>
    <xmx:pR7NaI4Q707xbhl04XCPj-_X3SuuRVViDg6xu3ceu0Fg0kn7riUMvA>
    <xmx:pR7NaHlZ_UZaZVEqKl1e-IJOSCEJXE4KdkRB59LKAnJFAswiagiYvQ>
    <xmx:pR7NaB5lKQJ0fX7J8gPH2OoF77NZM-7fFOvSZT_UbJN2frfsnFR6HA>
    <xmx:pR7NaFUj62H3yUKLNnqHZ-r3cqK3kssWrjY2HwjGtH8Zcb7aK6DvEkF6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:13:08 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@nfradead.org>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	"Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 3/4] rust: lock: Pin the inner data
Date: Fri, 19 Sep 2025 11:12:40 +0200
Message-ID: <20250919091241.32138-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Almeida <daniel.almeida@collabora.com>

In preparation to support Lock<T> where T is pinned, the first thing
that needs to be done is to structurally pin the 'data' member. This
switches the 't' parameter in Lock<T>::new() to take in an impl
PinInit<T> instead of a plain T. This in turn uses the blanket
implementation "impl PinInit<T> for T".

Subsequent patches will touch on Guard<T>.

Link: https://github.com/Rust-for-Linux/linux/issues/1181
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---

Notes:
    SubmissionLink: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-2-b067c4b93fd6@collabora.com/

 rust/kernel/sync/lock.rs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index b482f34bf0ce..9242790d15db 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -11,7 +11,7 @@
     types::{NotThreadSafe, Opaque, ScopeGuard},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
-use pin_init::{pin_data, pin_init, PinInit};
+use pin_init::{pin_data, pin_init, PinInit, Wrapper};
 
 pub mod mutex;
 pub mod spinlock;
@@ -115,6 +115,7 @@ pub struct Lock<T: ?Sized, B: Backend> {
     _pin: PhantomPinned,
 
     /// The data protected by the lock.
+    #[pin]
     pub(crate) data: UnsafeCell<T>,
 }
 
@@ -127,9 +128,13 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
 
 impl<T, B: Backend> Lock<T, B> {
     /// Constructs a new lock initialiser.
-    pub fn new(t: T, name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
+    pub fn new(
+        t: impl PinInit<T>,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+    ) -> impl PinInit<Self> {
         pin_init!(Self {
-            data: UnsafeCell::new(t),
+            data <- UnsafeCell::pin_init(t),
             _pin: PhantomPinned,
             // SAFETY: `slot` is valid while the closure is called and both `name` and `key` have
             // static lifetimes so they live indefinitely.
-- 
2.51.0

