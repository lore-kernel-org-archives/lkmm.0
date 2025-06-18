Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CE52F3C24
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265385; cv=none; b=pGNY8UI24ko8FLrcFEXfsraHsyiDkZmYdflKvsTwi3rJdnwEemrQ26YRA+mOgw0tej41JRrWc11G3FadmrPMtmluuUPfZXvHb3h+9OuJZVcEt0QL+DVWOmxH5/2TATq5dtA+9PwdDx4hInhFlwLQUHe2eTpccxYO3194qhng1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265385; c=relaxed/simple;
	bh=M1OMjv22fj+u6grhVnfc0b8X9uE9mcPUgP7UW4eovbM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c0BrFhfoyb//oaxSmM5mSVImVStXNl7QR8texG+H9YwhBNPuMKO4bVUPmK/tTFvGfE8YhmTfb2ThVeKPhnqCsB8eZYkSZuOzZHYyjrbRLdok8vY1t567nxwRsR6xx1VDchMetgeCGGULoulN81Nkf+BNZsMLvBpMCuKM4w9nRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HohZgVkm; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HohZgVkm"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fad79433bbso75282616d6.0
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265383; x=1750870183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=etVYqiCm1fjHGt42+uzJ+bwpTeWEzpsqqf0LF/x0Vak=;
        b=HohZgVkmmx2QAmu/vFBJnYI5ubl7/m6HShlbAq1YAY904A9VPaqWnwtYsUUamC8jYI
         Icja9TaeR+MqANknWVBU2xYIw1hkhaeanX2UG3yMIife3+1X1Bt0dnANH+97hySqS6MD
         6ysKAG0NlVBdBneohglj1CPzt5CWH5r+3idVYFjLEINUL3OxUH1u5+OztAvduttzw+jg
         Y9WYvT4IQrKJBb5wJkj9uX1/cScHR5nZ4Eifm3r/5kc692EWYwWlJbnqYMZn8zrWTLib
         HfV+C5V63K2VLTab5itwAo/nGOfZH7VJxfwMWy70QZqbPYmgz1HltfI6R++p7iezlxJs
         Qx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265383; x=1750870183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etVYqiCm1fjHGt42+uzJ+bwpTeWEzpsqqf0LF/x0Vak=;
        b=sRRLHXSPDGKWICx+T1TGKZ2e+osUbRQMHzs7BQhmLFB7Yl1KLieOL1PCwnj6+THpwl
         wtRZMlo0bNrf7NmJR8qwfbxdI2Vqs/pca7GLbMY4StDbV8tTTXQPx6+sWJb6MxXOLkzM
         GlAXGegc5vl7jh41Vo/3gUJl5BBZjTQZAQXfkuh49UV43PgEybd84a88mUwVuhdYQ4ev
         J9m7RqNgxcE5onRA8l0w+5CmWKK1WZym4P4W9wgqabSjhymLKcfij5inxn1Eu/2eaDcN
         1J7Z0/dqepGTVBC/ncgYQaahFPxr+h+ieeEYTPzhrkWFq8gHv6WPQTykq9V8NXjVZXdG
         K4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjPGHdM15T9grgDaNOHCAfQweHVg26sCjk7DYfgljfAiXpr3l2cmWa+uVGYnpks5BeIZAB@lists.linux.dev
X-Gm-Message-State: AOJu0YxTxCzR2ZWwIT+EpfdjWh14+qcvY3WtubbqMq9sgnNGAiThPJ82
	oaUH3bAGlOk0yAdD2T7tTyZfFVUygkg0pdLqG//U3JrKvPfCQB51Qpme
X-Gm-Gg: ASbGnctJbaoIzS8gsWZFqD4jcX9As+V6AdGkdblNezXSSPtwnqBY54k0yXW3wAuD5VH
	Mzr6xThZFulEGKZ8P9HHVixR8dIBuDZHNXel5siW18qlbw7LIWAk89rDddmQS1UvR8gbZK5vi/o
	7XNoRAhMwqUqOd3yJ/+Tcx7mXLYI+9eLMVtLvvz1igsxvhoPHZQXAa1sYthcH51l/GOoailllfe
	rqKClq/vIobHmJz8e3vCTCvx4okoJCFSuo3aVrkULMx2/LmXaDnhA+Wip0jngWpa/7z//RDAHeu
	/QfJOO8cu7W/bpSE3zr0gRw+GJNLFWi1pyRT0wAF7R7gp3tMPobBDUDgPAKCJsRe29mWXlq/I6c
	qZufQSYvjc8L1j8nqmqCojhdkI6q6VQnIw43X48C95lRbhdr6jba8
X-Google-Smtp-Source: AGHT+IFQqzW7wOfbqXab4kMODpMgkW6utkQ+Kr95/gp03dKp6mt/gZWwxLm0eqs9K7w2/oYN7eTQPg==
X-Received: by 2002:a05:6214:d02:b0:6fa:ce35:1ab4 with SMTP id 6a1803df08f44-6fb477360a6mr260669576d6.5.1750265382704;
        Wed, 18 Jun 2025 09:49:42 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c42bd9sm75065116d6.84.2025.06.18.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:42 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id CB13E1200043;
	Wed, 18 Jun 2025 12:49:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 12:49:41 -0400
X-ME-Sender: <xms:Je5SaL5Ime4tTzAPCn11UHjf1yEfyTIZpPKZHguIBvFofayRAz0Jlw>
    <xme:Je5SaA7JvGny9KQxB5fqlv5wziMKcn7jRS3MXLo4b-1rSqYb5auECtLbATi8ZGQ4x
    yUTHWG7xbXUdiKs7w>
X-ME-Received: <xmr:Je5SaCeHTBYmrIPPPxF7GLAVmpuc-yZRhFThJAHWz45DYjlqa8d-kot52_a3Fw>
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
X-ME-Proxy: <xmx:Je5SaMIB2u5KdsX_61c6WlxEbFUaYZXCPOwDEUYvHVV3Q4tJcrRt9g>
    <xmx:Je5SaPLPgqfeSA89Yp3OyCLHbvL65jsEZpqtSBfc-0a2R4kSjI5wTA>
    <xmx:Je5SaFyShOkeSYqGXpII8i1pORNDHu_6uWPFswCk-_7mV2e23wo23w>
    <xmx:Je5SaLKKXrCXi-jDzmWdeFaxSvR0zjAfLooBiSdJ6NXl1BI4FL9m2A>
    <xmx:Je5SaKbGpUkJXQbc2tONUBwLBJNBYen9WJGhjdCUFempxjduG6QA1m-r>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:41 -0400 (EDT)
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
Subject: [PATCH v5 03/10] rust: sync: atomic: Add ordering annotation types
Date: Wed, 18 Jun 2025 09:49:27 -0700
Message-Id: <20250618164934.19817-4-boqun.feng@gmail.com>
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

Preparation for atomic primitives. Instead of a suffix like _acquire, a
method parameter along with the corresponding generic parameter will be
used to specify the ordering of an atomic operations. For example,
atomic load() can be defined as:

	impl<T: ...> Atomic<T> {
	    pub fn load<O: AcquireOrRelaxed>(&self, _o: O) -> T { ... }
	}

and acquire users would do:

	let r = x.load(Acquire);

relaxed users:

	let r = x.load(Relaxed);

doing the following:

	let r = x.load(Release);

will cause a compiler error.

Compared to suffixes, it's easier to tell what ordering variants an
operation has, and it also make it easier to unify the implementation of
all ordering variants in one method via generic. The `IS_RELAXED` and
`TYPE` associate consts are for generic function to pick up the
particular implementation specified by an ordering annotation.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs          |   3 +
 rust/kernel/sync/atomic/ordering.rs | 106 ++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/ordering.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 65e41dba97b7..9fe5d81fc2a9 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -17,3 +17,6 @@
 //! [`LKMM`]: srctree/tools/memory-mode/
 
 pub mod ops;
+pub mod ordering;
+
+pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
new file mode 100644
index 000000000000..96757574ed7d
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory orderings.
+//!
+//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
+//!
+//! - [`Acquire`] and [`Release`] are similar to their counterpart in Rust memory model.
+//! - [`Full`] means "fully-ordered", that is:
+//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
+//!   - It provides ordering between the annotated operation and all the following memory accesses.
+//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
+//!     accesses.
+//!   - All the orderings are the same strong as a full memory barrier (i.e. `smp_mb()`).
+//! - [`Relaxed`] is similar to the counterpart in Rust memory model, except that dependency
+//!   orderings are also honored in [`LKMM`]. Dependency orderings are described in "DEPENDENCY
+//!   RELATIONS" in [`LKMM`]'s [`explanation`].
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+
+/// The annotation type for relaxed memory ordering.
+pub struct Relaxed;
+
+/// The annotation type for acquire memory ordering.
+pub struct Acquire;
+
+/// The annotation type for release memory ordering.
+pub struct Release;
+
+/// The annotation type for fully-order memory ordering.
+pub struct Full;
+
+/// Describes the exact memory ordering.
+pub enum OrderingType {
+    /// Relaxed ordering.
+    Relaxed,
+    /// Acquire ordering.
+    Acquire,
+    /// Release ordering.
+    Release,
+    /// Fully-ordered.
+    Full,
+}
+
+mod internal {
+    /// Unit types for ordering annotation.
+    ///
+    /// Sealed trait, can be only implemented inside atomic mod.
+    pub trait OrderingUnit {
+        /// Describes the exact memory ordering.
+        const TYPE: super::OrderingType;
+    }
+}
+
+impl internal::OrderingUnit for Relaxed {
+    const TYPE: OrderingType = OrderingType::Relaxed;
+}
+
+impl internal::OrderingUnit for Acquire {
+    const TYPE: OrderingType = OrderingType::Acquire;
+}
+
+impl internal::OrderingUnit for Release {
+    const TYPE: OrderingType = OrderingType::Release;
+}
+
+impl internal::OrderingUnit for Full {
+    const TYPE: OrderingType = OrderingType::Full;
+}
+
+/// The trait bound for annotating operations that should support all orderings.
+pub trait All: internal::OrderingUnit {}
+
+impl All for Relaxed {}
+impl All for Acquire {}
+impl All for Release {}
+impl All for Full {}
+
+/// The trait bound for operations that only support acquire or relaxed ordering.
+pub trait AcquireOrRelaxed: All {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl AcquireOrRelaxed for Acquire {}
+
+impl AcquireOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// The trait bound for operations that only support release or relaxed ordering.
+pub trait ReleaseOrRelaxed: All {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl ReleaseOrRelaxed for Release {}
+
+impl ReleaseOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// The trait bound for operations that only support relaxed ordering.
+pub trait RelaxedOnly: AcquireOrRelaxed + ReleaseOrRelaxed + All {}
+
+impl RelaxedOnly for Relaxed {}
-- 
2.39.5 (Apple Git-154)

