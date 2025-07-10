Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603772D1931
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127274; cv=none; b=RCss+4aPrAf4gn0Le6x2ID71L1TruxE833p2ZbloIPkze6OkLBiPApuj6UG1MFZgUYUcg3XwCwt10zQ9b8dCBpfPSIsXmNJnjMQoL07lLZ9bqzsJhCpSz7ICHI3p248IQKjYh2OXaGW640CQgZWDAb/8ME2y3bL26qu3ssQrET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127274; c=relaxed/simple;
	bh=I5bn5qP7xSOtXY8A079H4Bc+7+COegZ1IBZqWTzUO1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B1byekw8DgQGIFkoZCWjBkvc6czs+LzegkmJBPIFReZqpYzVg9RYIMnUYimyZBknFXaVyv81JW8SW/UXfPDsU44s4L31rgV7QhKaLTGqkzDDDIBc/CD9Dra7FD/FJjhhu18J1K+8xXCUdlEtTg/5GcVZ+gcDtHQwMPLhzN5VJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2U7H06D; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2U7H06D"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fad79433bbso6568156d6.0
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127271; x=1752732071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Ob5dAYv6h4uYB8Uy4Mcs5XI6WfB0FBUZ85NYAMmg8E=;
        b=f2U7H06DgSjx94IqwxZFuN0+wdfaCxvYyzZ4GTn8VngPXfC30PqNDJB2kxcYrsc1AN
         CTFHkg7y1MdlzCijTBD6DWWnuZfDzS6C+nzszJVk+J5TNDtOmlLR101o8AdjlH0d0/4i
         00eJEcPT2FEa9KBIkdcgrk2G+jpNVxGZYs9/SI9Wi7KNL78pcNrN+5dHurhr/yYg18CN
         M418z1atdFEiJEBXDXOSOnarfvFppR2jSK4sY/HhddjuLd9AK2d/jdLqkoQ3FFvn/VDw
         dp1ZQis5RXrrJ5FFruUlugJmOPeYQ0arUkl0+cj9XI31dOB9nuBRLEkQtavCEavaFAWS
         Yiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127271; x=1752732071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ob5dAYv6h4uYB8Uy4Mcs5XI6WfB0FBUZ85NYAMmg8E=;
        b=t3dUTRiwEOrjinWyQgv7B8A/U3Jlr+9nMiZV2RBzfZkte2xPTiDG3q82ihSv6qFKlL
         PLGGvpy+nuiM4dkbxNWL0fn03hyfjdt9zMrYmLC2t/PUFATAa5BtK+DL20Dk23f2QTO9
         WaMndhfvOl0UzfK9T8etR+vu07dKAsKexj+xiGrz3E9ucqAwrIUU3llV+vRz8TMIPDdZ
         RCgG0PRRbyQn9PYbjc/W2aG0/qvr5NmM/IEcDqA5ynZhcGJ9jAl4X9j1mZIcGahAu1/G
         vID9JJDnl1WtyyP0CeXuyVVfWU/Vtu6X3hcDMK6njgO/O3NAu8fXcevVsMjo8WYi8cV4
         UDKw==
X-Forwarded-Encrypted: i=1; AJvYcCVKAORTbEu3zkc7vuPdjS0ifwA3Dtuf5+67ScPINuAGwNFT+P0EbdocGo2z60m+cvozeYGB@lists.linux.dev
X-Gm-Message-State: AOJu0YyvDO7s/Rul491ngV5A1apdfQq/dtSBUY4bQQEszMElFl6LQLr3
	l/vzLhfnCEg3HoFpUBSexyxoTT5WX8cBvENvntinxClnqFae/NrzzHjP
X-Gm-Gg: ASbGncsn7zQQFatHcPahGyXIY6jR9ngV4EL2/+X1pnyxC1Mj1e7FJY6r4EP4xRHa0Ud
	97l05Kuub1Ppf+V+9bro51pM8lBP13lraKbXb9njj4sTv9CNqj5BG6Ds7l+9H65ETSlwgM6Axgs
	6YYILqYx1PGAAnkpRnkXctI6sc3swdPKONbOZVlBwZgnQcjHMK2M6Z5pDP6neeET9POHF8armvk
	WDLWna5xUDbgOx/cmX+OE0psXmL0Xu9Y5J+QNyvLpbiPub5VDAONgkPAfYLTWrZdywGNwzlXJgz
	hqFmxr1P+mPoaHY7uVLtfcxAKBeC6lRoFoLUJuj6kURzRg8UliYLk5GlUw5bBcZcFPIA9eCLIwg
	aJN0IKm2Q1XFDLQaIrXlYKahIV8nVNZ/mbGYlDuoVpR5eoxqW3SHF
X-Google-Smtp-Source: AGHT+IE9w/ELvtmgq0Wl+HmrVt63xyjSLjpZHrqKDNbh9jcyRRGILMKadm6VJspuHyORAx4nst+m1g==
X-Received: by 2002:a05:6214:401c:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-70498081a37mr17837936d6.16.1752127271002;
        Wed, 09 Jul 2025 23:01:11 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979e3146sm5190806d6.41.2025.07.09.23.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:01:10 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0CF3AF4006C;
	Thu, 10 Jul 2025 02:01:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 02:01:10 -0400
X-ME-Sender: <xms:JVdvaHzE3eLtNFnqqgOSyR-_0HVX0FVY6uq89FPeATIXhD4vC9on1A>
    <xme:JVdvaAx6Fcs3jOH9PKJRmYRGeRP8zX6YAQNuuWap2uazKLdYbVQE5vlMnc3OEZcrg
    VobVbYaf698pNDnjA>
X-ME-Received: <xmr:JVdvaF4e6_JbdrHHWFChsrpK712IrAYw8u34bsXZpvKwYG7NwvPKF2pchw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeijecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:JVdvaBAM_tHkV936ixg8oN27pN0tRU3_u74tU3zrPl-dcaCpDmuRsA>
    <xmx:JVdvaHDauF5v9-7JUHWbi1fXRdyhwRP31PbLaidrPGEqOYyPNNA4eQ>
    <xmx:JVdvaCq42XE7sd_WlVUh2CgFMoa0Ju0As5lgI24r-pli7ubIbLG_Jw>
    <xmx:JVdvaJ0vkpfj0aWuJutAIkL1j8h3wt2G3z3xCEhK2HlHUCTu5rA1Nw>
    <xmx:JldvaBU1b-j_Aw8lvArK5Y5r_bh-4dk_3pNgEDJAYnT94DUHYKp0gQ6P>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:01:09 -0400 (EDT)
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
Subject: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Wed,  9 Jul 2025 23:00:52 -0700
Message-Id: <20250710060052.11955-10-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250710060052.11955-1-boqun.feng@gmail.com>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AllowAtomic::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index e676bc7d9275..e1e40757d7b5 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -53,6 +53,26 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
     }
 }
 
+// SAFETY: For 32bit kernel, `isize` has the same size and alignment with `i32` and is round-trip
+// transmutable to it, for 64bit kernel `isize` has the same size and alignment with `i64` and is
+// round-trip transmutable to it.
+unsafe impl generic::AllowAtomic for isize {
+    #[cfg(not(CONFIG_64BIT))]
+    type Repr = i32;
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+}
+
+// SAFETY: `isize` is always sound to transmute back from `i32` or `i64` when their sizes are the
+// same.
+unsafe impl generic::AllowAtomicArithmetic for isize {
+    type Delta = Self;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
 // SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
 // `i32`.
 unsafe impl generic::AllowAtomic for u32 {
@@ -83,6 +103,26 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
     }
 }
 
+// SAFETY: For 32bit kernel, `usize` has the same size and alignment with `i32` and is round-trip
+// transmutable to it, for 64bit kernel `usize` has the same size and alignment with `i64` and is
+// round-trip transmutable to it.
+unsafe impl generic::AllowAtomic for usize {
+    #[cfg(not(CONFIG_64BIT))]
+    type Repr = i32;
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+}
+
+// SAFETY: `usize` is always sound to transmute back from `i32` or `i64` when their sizes are the
+// same.
+unsafe impl generic::AllowAtomicArithmetic for usize {
+    type Delta = Self;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
 use crate::macros::kunit_tests;
 
 #[kunit_tests(rust_atomics)]
@@ -102,7 +142,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
@@ -111,7 +151,7 @@ fn atomic_basic_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -124,7 +164,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -139,7 +179,7 @@ fn atomic_cmpxchg_tests() {
 
     #[test]
     fn atomic_arithmetic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.fetch_add(12, Full));
-- 
2.39.5 (Apple Git-154)

