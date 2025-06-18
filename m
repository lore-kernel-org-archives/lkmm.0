Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374A2F2C5E
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265393; cv=none; b=l67BWF+wn+VTsPT2q7e53juSHn2ZqNDbAPZ3k7bdr5RVW/EJkP4IhPZaSAiLcCC5AOBnF+xKKdRSmCZarxxk2FerriIA0QK1ghLVGaKKv0qYtQL8QaEMqc6Wn1u67QjouJBCjuSFh+9uNI56h9vZA/uqEG2VsjjOs9AxqTjrWNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265393; c=relaxed/simple;
	bh=fere2FiE8wcY7FYKyqup4BtXpG8xUmjDEuEEhDZQYm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IdP9blHBa0SIeMFPRuSksbKxODcYOGWJflV6w9eIsfhcX8MiIyDycS832AJ4Rv17AIOY7uAMmjqZwGI9B1XRwU7/aFEnAspR6w71f89w/cjb6+cuEBwJYFNtWzDK5vqnFwgaxj2PDtGP0XT2ogBp+Q3+YAOcRlnPEKIcXWjhIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTtlA3tc; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTtlA3tc"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5f720c717so110757985a.0
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265390; x=1750870190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IiqenWQWU7iuzOQuKuquY7EpMvEiluNmSmj/bpcg5CQ=;
        b=XTtlA3tcSY9BCDLVf6B1Gssm94Hj1T9Yo/Cw6VN3eATjtURE8uANqBON8XJsfA397N
         VIJL6mbuEWDhQsv61B26DDdZjL3vlQuFeMXbtUIoe8zEYj2ujIwkgxKuhwW3AZp8ycaR
         LUWcR9p0FuEUXi3JlPVDjeSMHib45+rdCWxMl/7RgxlTqVjCURx1+CQ30wKcAmz3b18w
         JjbjxkUWB2oTf8gJuxEAGDFTTbd5NI6tte2XgySROjpVMq6//wcV+5GuoW+P01F0GwGT
         SgLnEl9hjywH/AK5w5gjNdW/1jHFn96mIE4j6MUjyKE6DQrd0H24AnYkjrOuFkROMH0g
         nrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265390; x=1750870190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiqenWQWU7iuzOQuKuquY7EpMvEiluNmSmj/bpcg5CQ=;
        b=KHYFGLj7ZepymQK89SS6SbvOiHqTVzMWLTtW8hbqA0q9Cb1TkuoBlHRhb+mAQHUOYd
         cCEpAaGCSiQeSGjnscvADtZYYRTo2PB9CaVXLJhbKMzp/iSAdH1LGcgZDI1+rocG2kGi
         Yf4xkVdGSK6X1qhbhqOnSnUR7hBcjhPKp3jLCl7x/UcEIskydY3vemm5Fi0qvu1e/aTa
         kSb62AFCarad2xHN0Fy0jtk+Tr6LVHtv5CQX6kaM/11ccv56JfN6YMzveYbt/70akjir
         Fc+KZnvxkgRwf2geHHyNDO1fNPg8g9A+nEBJWeSOkqRAqz+Gm4FIiyeOL74Dmzz4lYMN
         ZlCA==
X-Forwarded-Encrypted: i=1; AJvYcCXjNgMv5hBJbTVSDaC1Yfyma/KYt6Ad0cs85UpaNSmFj13NnBt0Ih4lxa6wThbQ+yYHMfKI@lists.linux.dev
X-Gm-Message-State: AOJu0YxNrtwOa93o8F617ouizOYX8fXbY3IvQ4CPKMdA07k+Ocs2CASn
	F7rGqWC54M+WV8tyXDnrlqSqh/rAdLZioWG5oQAqnm95bRQ0EjxRGLKC
X-Gm-Gg: ASbGnctHzvltzc6IEE26I2t3rBVqOqrgbZg3pKEKTkEaNPBarsHeMy7tpAVEHWg4f9i
	cvt0V0skEZp/VgU6Nhu4E4keoZb0CMIf5h7l05kGPEoynYTWRGbJYdS3EgYh9MVuiaWLvmQyKVz
	HvC6nMwXS1XrKwp3/Nw2P9aSybkhXZE5OpZq8g8OKTQB3NfWNna/Kz2PG/WQJe+dc6O+O9lP5RC
	FPguXRSozHZlHoT60APAqEPuIqt7MwjXmMfmqLTDDQUjTKh7zyvlCsjcfvtffQOC3jZYi2URs7C
	gyG/selODl+mGuND5V50Az37V/wiX4EilMG4WkEo8ahuxh7/uFfAatjVdRqsMST+QXvEON8tEdd
	0i2icDI7LnK7nHS5TzxCxONdC/eF1HjfaCFDGX3j8/GyjQR3vh6pm
X-Google-Smtp-Source: AGHT+IFrny/vCbBmkBRC9BnME0hYm/8gTb/V8VUqVO59PYMWA65CHg4iSYOfVJWSz/SsFM5tNpjDew==
X-Received: by 2002:a05:620a:4805:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7d3f1738bbfmr39720585a.27.1750265389701;
        Wed, 18 Jun 2025 09:49:49 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f0b35csm783472585a.102.2025.06.18.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:49 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id B76991200043;
	Wed, 18 Jun 2025 12:49:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 18 Jun 2025 12:49:48 -0400
X-ME-Sender: <xms:LO5SaM2iGSuM1JtSI3i4jCMBCItjR0M9dHU15aXP2R2K3Adyg5htRg>
    <xme:LO5SaHGbIIU22-ZsJqOZIsM8w6D9KtclHL1fIYSeQ-no02ltMCtdHtknXTY0KndXt
    BvBqMa27I_MpQKtoA>
X-ME-Received: <xmr:LO5SaE4NFjyiSK5ZesbsPXHCPMptHpIzgB8ONJljdPncEVBJvXoYOxhm0KJ9VQ>
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
X-ME-Proxy: <xmx:LO5SaF0qI5KJh9zKUzDNvjVsVzvsRP-ljl25pUpL4tXmzSirj9iCsA>
    <xmx:LO5SaPFbCMFqeMrTuuCf2kl5QX8iH9t_IUPIYtpDE2QKlC_CE5b1UA>
    <xmx:LO5SaO9HPPQcTD1lWh4HAB4y4DCWwNZ4ez1cBhBTEfcnNSIEQb6N3w>
    <xmx:LO5SaEnsPCvIjiYEVypGDaYLgp3bi2izhgG5rwZpKrtyCTEvgEM88Q>
    <xmx:LO5SaPH9Nk-WWm3A0qL7lV4jNRIk-KrIDI7NHOZzZeauruuVRBGQ4RfW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:48 -0400 (EDT)
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
Subject: [PATCH v5 08/10] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Wed, 18 Jun 2025 09:49:32 -0700
Message-Id: <20250618164934.19817-9-boqun.feng@gmail.com>
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

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AllowAtomic::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessarity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 58 +++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 965a3db554d9..829511f4d582 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -65,6 +65,56 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
     }
 }
 
+// SAFETY: `usize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for usize {
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
+
+impl generic::AllowAtomicArithmetic for usize {
+    type Delta = usize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
+// SAFETY: `isize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for isize {
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
+
+impl generic::AllowAtomicArithmetic for isize {
+    type Delta = isize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
 use crate::macros::kunit_tests;
 
 #[kunit_tests(rust_atomics)]
@@ -84,7 +134,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
@@ -93,7 +143,7 @@ fn atomic_basic_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -106,7 +156,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -121,7 +171,7 @@ fn atomic_cmpxchg_tests() {
 
     #[test]
     fn atomic_arithmetic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.fetch_add(12, Full));
-- 
2.39.5 (Apple Git-154)

