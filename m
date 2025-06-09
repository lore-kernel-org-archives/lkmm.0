Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE0F229B3D
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509205; cv=none; b=WEY5zaN8njCJ5Jr/raV++UFs57l+GZ7QUbb1h3/zuTtPu7tUG6GbEv3W/6siD7fhWpQXOY2eO1R+1MFKlceMN3afBUot7D368lNOPtEuq6Tbx+HpTNrsHG0plDrUJiL/Yv1MuheAdNsNDLdIvvwz3wmW+EJ+9qU5HPslMuYap3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509205; c=relaxed/simple;
	bh=3t90svxWEHL37ohE0fJHFmRBiBXjgm3lFXGoX5OddKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=srSiVJX09EzJbHbMZgSB64ZAU0s+pxqPLdlEm8Bc1NNbuBDaeyoVNQXJbDbPb8Lie17aI3AxW4cGP+IEmsXaWqBvW2Ua3bdZ30gAxTFXpIvT9FaUcJQYFTvCAUnAq+Wbx2+6q+4fCqwZ7sTY3/zhOOoiTSgSulWx4VoncQDwNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHPNjssI; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHPNjssI"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7cadd46eb07so514475585a.3
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509202; x=1750114002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ykfv0JUDwfNHM9Hye+0iZ2AUZ2hpC7+5v9dE8kxQRZU=;
        b=aHPNjssIcnPi93Ma9lpzxydP/es6LrIOsPw+6eWi/slUamiI9g1dCMlq593IgR4Br/
         P/eINwxhaqCC8h3QwVFDDrUw3fmU49b9VI6Q6Rkzt8M7h+IqpyBqZ+gam3KLH+IQvFaq
         gZn/hUA65CLyrWrJNs/aXdcqyrT2oAU7+m3Z2p8pNKhkzePd5R9xlCxYZX/BUTI8PhGr
         hkox/IlWXKtOSMPe6hhUbgyR6o1HoltpaTyeBJ1BBKB35jXhQF14+2/vrxMfQGywkK78
         y16xr1FxaFl9AnHwtxMX53Vs1swUQcDINsjju5TUzdsN5CG2bXv16NI8b336+aeK/dnX
         A9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509202; x=1750114002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ykfv0JUDwfNHM9Hye+0iZ2AUZ2hpC7+5v9dE8kxQRZU=;
        b=NTRtwO4U0uNBinEmjXQj7E5EK/CNxv7alxlBLqj7tKYMTkDibCigAycrDMQjr4XYED
         LaQW2ulr7JgRkrBI8kD0/9nAoe3DRQ/17XyPE2oFAo7BknTKeyH3cMEeNrI+MoDeKxm8
         5x4GI6ArKE+JrNVU8wZ63xpI65fom3/FoBAdhQih1u939PN/bm38Uk8VJwEt+91VEhq+
         lcvqVycVbd5ShSBQoAADWPN1TncvOS1qjh0gw8U268GZBW6cUi35gMJ8hTEOw8dHTpyx
         rprJ3Jxs++ZUUgRNmu9l4jaWtnlpEYjzHVypzOawRjDdnrwFqh/69uAONauDNgO4UCQU
         IWNg==
X-Forwarded-Encrypted: i=1; AJvYcCUWF30kda1jYWjOtZ4lCP/j8sga6Wwi/5FLAYg3iIyU4TJr+2XzgCl2DSlS/JAz+cs3PMHu@lists.linux.dev
X-Gm-Message-State: AOJu0YwOpra40KAe3pES6w/9dXHMxa6KRU/A5JqtQaCGrkkVHsqr3Luq
	nuZAQ502CN5G+ErXL0zuTcglW7jHLcpH21mYdDDp1qLV4OQhA6Y/dd3B
X-Gm-Gg: ASbGnctknd2StJSqAw9RHIB6G4uAQmsxDG0gGT8NSXiYJSdXZQx1lLNFmbrZgR6Nh5D
	4ZZcxnQLOD93FaLCqbXdKiNMRTGrCD/QRUn8k2/n92+iojfxymL6wqsiuFF7Iu+gkZlijwQAY5f
	Nd6o70bN8LZirThggXqEqWkR4J6izzfRiGBJI7X6c3f55GtAHgYc37m08fsy9cdIZMDZEcL4Lny
	bbwb6W0a9llKY4bXqR7xRz5+nXW1ivZ69oWU92jXkb3Ch02hL8l2gIuL/PSePxVO+VanAtcUb4r
	Wmh8WOHknqTGBAgLlgNXpEUpVNieAK5B7fZ66oJkJUFRLreMLhL/j1WoRL9AsGu8f0qKFPwfGJq
	L5yd+Dn2bLQs72I+uf0s19Lq1uZJh8d6RJAwoRjsXNXrQhSEfdYqZ
X-Google-Smtp-Source: AGHT+IFUi/CH1qbuTMavhtVevTlVgWxfuQBtFoEfwJqR6HTbU+n+FxJv1MMM0BL61L4p6Kak/iTk1Q==
X-Received: by 2002:a05:620a:29c9:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7d2298d6f08mr2328173785a.44.1749509202149;
        Mon, 09 Jun 2025 15:46:42 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09aba071sm57749346d6.24.2025.06.09.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:41 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 459101200043;
	Mon,  9 Jun 2025 18:46:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 09 Jun 2025 18:46:41 -0400
X-ME-Sender: <xms:UWRHaGlNxKmD3s9WeTH-uG3XfN8hfANDj7H6wlTEQvsrRSc8jpqGDQ>
    <xme:UWRHaN1n41g_8UlK46Y5jEN6oLciXfno3fIz8tRxpNiuck0TuyHuOZLm7vYQDKxt3
    jkaMtK3wq65-C_kxg>
X-ME-Received: <xmr:UWRHaEofQIWNayLYRE7Jb_1eRZuXsHW0qEzw7biyjeWU_0_JlI1NwnFJc34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:UWRHaKk6haGCIigi3EELRmLFej66hn1_ihcuNAYKuIA1eo2HZAG8Rg>
    <xmx:UWRHaE2UfVbFnVIjfSZs3c3sFcGJXx3bBMRR4gN-DnZG1VnkYVIuMQ>
    <xmx:UWRHaBvvl6TM8sVMF065ZNSZuqm5RTCQXETlZnzU0WsigMPWVY49NQ>
    <xmx:UWRHaAWiBN_Fq0G-qpXZRJgO6br-Rv_ng_zbIlo5p9FCyYjbdDtfhg>
    <xmx:UWRHaP1G1tkUWfB4TMGfsb_HZOYFh2xW4vt0k6P_yt8x5cTiGsC0lbNa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:40 -0400 (EDT)
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
Subject: [PATCH v4 07/10] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Mon,  9 Jun 2025 15:46:12 -0700
Message-Id: <20250609224615.27061-8-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250609224615.27061-1-boqun.feng@gmail.com>
References: <20250609224615.27061-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 83 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index a01e44eec380..9039591b4d46 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,3 +22,86 @@
 
 pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+
+// SAFETY: `u64` and `i64` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
+
+impl generic::AllowAtomicArithmetic for u64 {
+    type Delta = u64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+// SAFETY: `u32` and `i32` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u32 {
+    type Repr = i32;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
+
+impl generic::AllowAtomicArithmetic for u32 {
+    type Delta = u32;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+use crate::macros::kunit_tests;
+
+#[kunit_tests(rust_atomics)]
+mod tests {
+    use super::*;
+
+    // Call $fn($val) with each $type of $val.
+    macro_rules! for_each_type {
+        ($val:literal in [$($type:ty),*] $fn:expr) => {
+            $({
+                let v: $type = $val;
+
+                $fn(v);
+            })*
+        }
+    }
+
+    #[test]
+    fn atomic_basic_tests() {
+        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+            let x = Atomic::new(v);
+
+            assert_eq!(v, x.load(Relaxed));
+        });
+    }
+
+    #[test]
+    fn atomic_arithmetic_tests() {
+        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+            let x = Atomic::new(v);
+
+            assert_eq!(v, x.fetch_add(12, Full));
+            assert_eq!(v + 12, x.load(Relaxed));
+
+            x.add(13, Relaxed);
+
+            assert_eq!(v + 25, x.load(Relaxed));
+        });
+    }
+}
-- 
2.39.5 (Apple Git-154)

