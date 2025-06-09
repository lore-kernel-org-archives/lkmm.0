Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337222B8DB
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509209; cv=none; b=WzKvStWmmd3fANJDm6sOTHZwtYI/+2J4d0QwtcHZxQw4UT/F7I3dUowQV5rELv4/2tveZZwTsf9Sc/t5oEpML1NepCGeS8WDMInMO3GzemcikoMmpsG3+rTLc/MuNZOPI0/j2PKtjzOHAzbeYoIaijefRq7JPFrlxvcaBs49FsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509209; c=relaxed/simple;
	bh=Anqrl5cWjcAsA5b2G9jSaTOPpHxzWAGMmgi9KYl1kyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luZD7iGML5UvGQFjW7HUlz2SCKt209+pw0DgapUbtXE7IqZEwk9YwxPn7xz+Npkmpjwi6P0n1ZvIjhnJE+cMzr/LhPQjXR5oonkv3pPGPSQbJQD1tdX0fRbr05k2kkR9JTpxgYmfPpoWRT6rLwfOoYXnUo4bAo1R1FWZUvbXsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlPFJqlU; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlPFJqlU"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8a70fe146so92811396d6.0
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509206; x=1750114006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aVh/Q3YvKlU1Rq5I19BJ7b1z8f+dcy4cBENHfBypeho=;
        b=QlPFJqlUDsZuuh3GewDjfjBgKzLfNeb/03gqQLxGhcPCmaa4sXwqQuQi8RsO5c52Sa
         uVTbbcVg1PSILmJgplcGxlhERmp8tMgm7lGOzdzmQl9l6ggq5teUs8J3UHghjUY00zF8
         CN4ZS+32ftc5bSVaq1k2GFiXZjpc60C8d1b6KYbEcTo8aBtbc5TJEfNGR1k4PtyN9RYT
         gmJu1D2A/W1OlsZX+9sITImhM7bUTnkLLS9g+38wBujbH98AABRMP4WWPt4B+cE1OWLa
         DwCRRarsiMk0Cw5pQCKY7teQtdlQHsw4jBFrUFtNvx48Mhj7iupKXMNnCb30eOFz9KGD
         R6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509206; x=1750114006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVh/Q3YvKlU1Rq5I19BJ7b1z8f+dcy4cBENHfBypeho=;
        b=oCk3JPRuUQVYJpBmTrntBI0oNrfy8SxGNdwQc7V7wiuShCvxXd/LN3fHuOG7aMXR+1
         ZTclvo7k4JFu0LlPEAhPf7EUXXfjEuKWSCczh5VVsCLEJTGIl6634Rp+aAoRQauzuyQ7
         /QIoS0LtqOyRAToitBvTE6NEiFuLbTCqAeFo9wnh6SCwraeY4GkAEokIkztOT0VYmfvQ
         yyH94Vqm66igIGpHIpc6n8UuOBXm3pATh3k/UuwcDQNo/PygmEng1InNymRCnL5hm5zm
         vufILUWe0/vKYC4lx8MMs0gKOb0LnZ3omgQaNIx+09ygWTItC96bgzcWA4gXBCW0arUx
         tRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHkYMUyuPFw7tiCo+kJuVKk4Qav/++Lw3PsJn9JdG35z/22ODFf/q7RoMN+XCZsQyqnFz6@lists.linux.dev
X-Gm-Message-State: AOJu0YyyNIoN9f9EpIECXiXQW9glvOz3+8yzNssYLDzAnkrtRcrl3qmX
	wot16m+rmyGZkS8RhAWB+Gz62RGhZfPw9u8zFDq8nNHn49u59gG04MI3
X-Gm-Gg: ASbGncsvcr7HCotcdgAyst8Cnp1OMcOeRgVYPsNWBtCwNHijrZFSXGUYSL+OyA1XhVJ
	PTJ6toJpAcPS+Voo+UaUSuUej0kB32R3VpmqF7TKG7x+AZCwgn5VueApir8HExzKaxJBSZkk4XC
	wyUmYf7hZsLS/4ZwkxwJu/mh6BSf8Vt4OUSPc7CqLr8wRVKlga4rUxsl1Y+2JmnghU+38ygnDNG
	PiGM0hsnPouCtUxGh45kuBvmHEF/y084Yd+yxe3X5uohQ1z6Hq9Wwo5V6t34VsCaL4Py9Rd4aIz
	74FYE3kutyWp4jwCYbQX///P0IgptoCjxZuDnVN30WML0Nfm60k0FPEvF3xpRa5pW61ZgLJPy+5
	zIYzpUVPHNzDZnTZWNUqF4RslIswvRVzprs35m6/d9vZDnEBZQqJo
X-Google-Smtp-Source: AGHT+IFumn8OwjYXPgXZ16qqTX9xz1gY58UxpowoDVxCsQHRJ60EJ7bd/NwPv4mxtLSYcvshs3G6lQ==
X-Received: by 2002:a05:6214:268f:b0:6fa:c46c:6f9e with SMTP id 6a1803df08f44-6fb08fd9af0mr224426906d6.5.1749509206360;
        Mon, 09 Jun 2025 15:46:46 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab8479sm57902056d6.20.2025.06.09.15.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:45 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 657911200043;
	Mon,  9 Jun 2025 18:46:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 09 Jun 2025 18:46:45 -0400
X-ME-Sender: <xms:VWRHaGfeuqfaTsfEhV_LpIrhNyhzWKIiN45quFjZGSHxgsoEeOokVA>
    <xme:VWRHaANYS-9EPbydHD-sjzoKVt34TxIx4xdw3zOl4XRap0KOk_5WipJtbwYlkDWYH
    PIlE5V6JBHphOOr-w>
X-ME-Received: <xmr:VWRHaHiDS0jJsZHUtb43CKAzQVGBTatYnWPpWIa-Rzo0us8VKnuSJGYk2OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
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
X-ME-Proxy: <xmx:VWRHaD82yCfh5OywHAYF_VLdNfBB6XPS_yuSEXXKrign0aaeMeYFIA>
    <xmx:VWRHaCt3U7HVb8WCTNR2JVSZ6u-hf5HicdNfWEzX2o84sGmcxpFGKQ>
    <xmx:VWRHaKH7JCT23_b6qRlIcAnwlIu9UaEazUyWv6Ujxa6ldBf8VF2IzQ>
    <xmx:VWRHaBNb26YqM8H4lX32N5KlrCzPiH_P0sfa4azgTtdYAGvFLEZ3SA>
    <xmx:VWRHaPOlbZcKXJKD4ln61UjpxP5bWNkTnJjEIqs6iMkaUXzysTAYSpwm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:44 -0400 (EDT)
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
Subject: [PATCH v4 10/10] rust: sync: Add memory barriers
Date: Mon,  9 Jun 2025 15:46:15 -0700
Message-Id: <20250609224615.27061-11-boqun.feng@gmail.com>
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

Memory barriers are building blocks for concurrent code, hence provide
a minimal set of them.

The compiler barrier, barrier(), is implemented in inline asm instead of
using core::sync::atomic::compiler_fence() because memory models are
different: kernel's atomics are implemented in inline asm therefore the
compiler barrier should be implemented in inline asm as well. Also it's
currently only public to the kernel crate until there's a reasonable
driver usage.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/barrier.c      | 18 ++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 67 +++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/barrier.rs

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
new file mode 100644
index 000000000000..cdf28ce8e511
--- /dev/null
+++ b/rust/helpers/barrier.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+void rust_helper_smp_mb(void)
+{
+	smp_mb();
+}
+
+void rust_helper_smp_wmb(void)
+{
+	smp_wmb();
+}
+
+void rust_helper_smp_rmb(void)
+{
+	smp_rmb();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0e7e7b388062..928eca7fbbb4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -9,6 +9,7 @@
 
 #include "atomic.c"
 #include "auxiliary.c"
+#include "barrier.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index b620027e0641..c7c0e552bafe 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -11,6 +11,7 @@
 
 mod arc;
 pub mod atomic;
+pub mod barrier;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
new file mode 100644
index 000000000000..36a5c70e6716
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory barriers.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions of
+//! semantics can be found at [`LKMM`].
+//!
+//! [`LKMM`]: srctree/tools/memory-mode/
+
+/// A compiler barrier.
+///
+/// An explicic compiler barrier function that prevents the compiler from moving the memory
+/// accesses either side of it to the other side.
+pub(crate) fn barrier() {
+    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
+    // it suffices as a compiler barrier.
+    //
+    // SAFETY: An empty asm block should be safe.
+    unsafe {
+        core::arch::asm!("");
+    }
+}
+
+/// A full memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory accesses
+/// either side of it to the other side.
+pub fn smp_mb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe {
+            bindings::smp_mb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A write-write memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory write
+/// accesses either side of it to the other side.
+pub fn smp_wmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_wmb()` is safe to call.
+        unsafe {
+            bindings::smp_wmb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A read-read memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory read
+/// accesses either side of it to the other side.
+pub fn smp_rmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe {
+            bindings::smp_rmb();
+        }
+    } else {
+        barrier();
+    }
+}
-- 
2.39.5 (Apple Git-154)

