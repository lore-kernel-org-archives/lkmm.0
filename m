Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273920B80D
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 03:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752894520; cv=none; b=hFBlbC50gyPieneCpf707iFZm8bi4sDBqKXEEzgdWrHdTy9kzE9Fg1DTsdMFQH02keiNqR6xJYgW3gXjhkC2mjjRYHx9cJpeUEDwZhi7nRPL1bpkkozaFebSMPiX6pkqNfn5p+sJHge2JhUSPkB442sK+AnnabnlKX8SpBOsGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752894520; c=relaxed/simple;
	bh=gpySuT8I7+X9pczz/mskf/PsJB/pdom+HIWfSnuPxII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFZnvWEXjcjovJuzrowA6b1rZpa013TYuSvUhTuGgk77aMmTFbWbnsdcC860kxsvvyNKzw16AEj8c3V/ktQPGcKSkET0dLi8eqSl5nUnpaxFaelqYz1T668Yk8S0GDnKZMTxWxiYAtHKUUczbSjfQsVVsSB80UQ1s+gdoZ40efQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUUtoshC; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUUtoshC"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4aba19f4398so36192551cf.1
        for <lkmm@lists.linux.dev>; Fri, 18 Jul 2025 20:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752894517; x=1753499317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kVsshkU23k6tDEb3Czqo3gMlPOvW9sRvdxme9Qv0Uto=;
        b=VUUtoshCmhUIBocr5jil/6zrRr65wnkhTYNbPjREHbAOi+AtcZj1UiBGIq++blVBoD
         RXv/1C/3SoXo7N4/HvNj15iiI1msem3X3Ijm1rbvcuViysDBXOVNmTP2BWkPZZqlYSYb
         f38kPgQDMWCu6tdXA9Wa+hKtNqAb9N2kkniljNVbgqZBDSOqsLT9YJtDUlucTTXVWLRR
         SZ0eqIwzSr5jx5AvRur40QURush7whYe9ege63ySj0NhjMllqMoSlNhfeNr13PhE0nTu
         BnmMtfTuV/+bLWuKlbBcqnYLucHBJyTNB89DkegE8n3ed3iaTdXvfODAEio/V+OOC19/
         om3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752894517; x=1753499317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVsshkU23k6tDEb3Czqo3gMlPOvW9sRvdxme9Qv0Uto=;
        b=hvPsYTbaOPN61xHhVeU4PvyrVwRfQ/UbNQmb31U3yI7JQuxTgePJItN1u0bXAdG3VU
         GjkvZo7MnZ+WBPgC1B8SLeglDdhQW0fozyFJtuOMYJfTR0k3xJahBQ2PSOrPQVjZRdrH
         O7a+ZlE/J0YXtC4A95bTiOrnJGuOcxn28sWwANC166ajTy2PGbvf54xS4URP216IuUSy
         L9vo2HHklBjPfZwYKrwzJAmlHVoR7EalCOvlFHIi9b6Mp7egHNl8r8h9SwyO5mU182gx
         WsPnCHyV7BPw0XuxOsfWL4wdptZkTaRKAcwVIjITIPWHyHfM6haGe+rpQ0Oi3lfrhNQj
         NnPw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSM1FboIWRe0JlSvVjG2sKlbEozpHFlBUHr+MIloVrwYH9yLMislnfAiCsEoSHDaVUSXr@lists.linux.dev
X-Gm-Message-State: AOJu0YwzxAo/dyZOS8cZFbgKHiMe/egBagYKJrEtDa02q7JdRU17rJJk
	s4rpoNwbhuxdVUJLCP0l/aRpWl+4ycd5syArlMJlmlnFpNTswjIQyWt8
X-Gm-Gg: ASbGncsDofeNVm+kzU7ZSI8QSA9pHFVBGHXuXekyhZb5nW7yEaDTgSj+3LWS5VpZAQA
	FM7Ft9U0DuIt/PumaoakOfgn8BXEeijuHjYtJzI/Lg8ejXGMndEiV9IpfMmwtbQCasFaDdM0jTT
	F5obTE23vqzj0sVBRrOECPLx6JIMX8Qo6yFUrALOOsXDYgvOT7XYe4EaMb1VlY9Xe8cTPqFZMZa
	FRBARk1z91RIWiu0pwnm4kW3sMzcQrK0IyuGjH/NSaLc1/wzh/0uMUlKP5nuookxGzCtK4FaoOm
	PZ6IlJ0XzNtZ5tpHRjggoKIvaytweAzvOoeckcK30E/1SDf7TTT8D/juphioHhV2ArFuL4k/ZEN
	NJX8lsMXQXDJxj28rNvDEYUB5Tn86b94ZDbU7TngkkSENTNTEVszzyoy7wlImdkBStRA5M9rsfl
	lhJ5BiUKlDygZgnjpaFHO09XU=
X-Google-Smtp-Source: AGHT+IFxNfGmv7pB7ZXB96wltCgGECR2DxQrAs7z/fp22mL0wFYhHuOhrg1I6aWOLimXAM/BRsSHvA==
X-Received: by 2002:a05:6214:529a:b0:706:c5f3:1da0 with SMTP id 6a1803df08f44-706c5f32e0emr14546356d6.36.1752894516948;
        Fri, 18 Jul 2025 20:08:36 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b02dsm14281326d6.63.2025.07.18.20.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 20:08:36 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id D5F88F40066;
	Fri, 18 Jul 2025 23:08:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 18 Jul 2025 23:08:35 -0400
X-ME-Sender: <xms:Mwx7aCUn6_aAI8FG_GPla-jukXallcZSchu_2pazekiwJW-5-4u4CQ>
    <xme:Mwx7aAFSON2oSDLG66KHP2d0BmSR9eTFaLVTWRcZq1qKA-g35xRNXot5FJrl5Kom9
    0J1t-L-7HTI8fBg6A>
X-ME-Received: <xmr:Mwx7aK8vo4Xnyz4qYjNGvVLdeDrwT7rumTbPFz5_ybKO8zrV3u-DaQhcyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeihedvvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Mwx7aI0xmN6v2stuo8XB_hYprn3f69vzAvKmFdFvoemG4Ic1x0f-Uw>
    <xmx:Mwx7aKkeRS-cbwvo6XO1jpNn0sFIf0m69sm4WhahJP-Oh0cPlZ3KRg>
    <xmx:Mwx7aG_6aZWAmlY0-aQU8yx0d746FA-ekp9Beq_tUVVbr3myni1U-A>
    <xmx:Mwx7aP5kJEWufb0ZBWxBezJkIHFD5D7pSN02-t6UyPToSgM-2c3a5w>
    <xmx:Mwx7aGIVEX9pLbOB4-b5c1lSLMfrWw-PNidpIqYO5nV9-N__B1q-Lgl2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 23:08:35 -0400 (EDT)
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
Subject: [PATCH v8 3/9] rust: sync: atomic: Add ordering annotation types
Date: Fri, 18 Jul 2025 20:08:21 -0700
Message-Id: <20250719030827.61357-4-boqun.feng@gmail.com>
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
all ordering variants in one method via generic. The `TYPE` associate
const is for generic function to pick up the particular implementation
specified by an ordering annotation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs          |   2 +
 rust/kernel/sync/atomic/ordering.rs | 104 ++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/ordering.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index b9f2f4780073..2302e6d51fe2 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -18,5 +18,7 @@
 
 #[allow(dead_code, unreachable_pub)]
 mod internal;
+pub mod ordering;
 
 pub use internal::AtomicImpl;
+pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
new file mode 100644
index 000000000000..3f103aa8db99
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory orderings.
+//!
+//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
+//!
+//! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
+//!   following memory accesses, and if there is a store part, the store part has the [`Relaxed`]
+//!   ordering.
+//! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
+//!   the annotated operation, and if there is a load part, the load part has the [`Relaxed`]
+//!   ordering.
+//! - [`Full`] means "fully-ordered", that is:
+//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
+//!   - It provides ordering between the annotated operation and all the following memory accesses.
+//!   - It provides ordering between all the preceding memory accesses and all the following memory
+//!     accesses.
+//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb()`).
+//! - [`Relaxed`] provides no ordering except the dependency orderings. Dependency orderings are
+//!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+
+/// The annotation type for relaxed memory ordering, for the description of relaxed memory
+/// ordering, see [module-level documentation].
+///
+/// [module-level documentation]: crate::sync::atomic::ordering
+pub struct Relaxed;
+
+/// The annotation type for acquire memory ordering, for the description of acquire memory
+/// ordering, see [module-level documentation].
+///
+/// [module-level documentation]: crate::sync::atomic::ordering
+pub struct Acquire;
+
+/// The annotation type for release memory ordering, for the description of release memory
+/// ordering, see [module-level documentation].
+///
+/// [module-level documentation]: crate::sync::atomic::ordering
+pub struct Release;
+
+/// The annotation type for fully-ordered memory ordering, for the description fully-ordered memory
+/// ordering, see [module-level documentation].
+///
+/// [module-level documentation]: crate::sync::atomic::ordering
+pub struct Full;
+
+/// Describes the exact memory ordering.
+#[doc(hidden)]
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
+    /// Sealed trait, can be only implemented inside atomic mod.
+    pub trait Sealed {}
+
+    impl Sealed for super::Relaxed {}
+    impl Sealed for super::Acquire {}
+    impl Sealed for super::Release {}
+    impl Sealed for super::Full {}
+}
+
+/// The trait bound for annotating operations that support any ordering.
+pub trait Ordering: internal::Sealed {
+    /// Describes the exact memory ordering.
+    const TYPE: OrderingType;
+}
+
+impl Ordering for Relaxed {
+    const TYPE: OrderingType = OrderingType::Relaxed;
+}
+
+impl Ordering for Acquire {
+    const TYPE: OrderingType = OrderingType::Acquire;
+}
+
+impl Ordering for Release {
+    const TYPE: OrderingType = OrderingType::Release;
+}
+
+impl Ordering for Full {
+    const TYPE: OrderingType = OrderingType::Full;
+}
+
+/// The trait bound for operations that only support acquire or relaxed ordering.
+pub trait AcquireOrRelaxed: Ordering {}
+
+impl AcquireOrRelaxed for Acquire {}
+impl AcquireOrRelaxed for Relaxed {}
+
+/// The trait bound for operations that only support release or relaxed ordering.
+pub trait ReleaseOrRelaxed: Ordering {}
+
+impl ReleaseOrRelaxed for Release {}
+impl ReleaseOrRelaxed for Relaxed {}
-- 
2.39.5 (Apple Git-154)

