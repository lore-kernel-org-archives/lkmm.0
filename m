Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DBC2253F8
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509200; cv=none; b=eERqM1JRNdDZjpaX+UyD5zf13t+VsK5uDv8Tq60GAkBBVZkeS35TRHMsv9WhrnMeKXTja1HWB1k/YkmbwJxezq654kZqvz46D7IOR/PmwmwuSZ7G57BTQM9FKPsfXvPzU7BUwgDuM7MBZs43XPlQY5jrNN8TZzuFCZKhDLwSXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509200; c=relaxed/simple;
	bh=0bInjRe6WsElsR76wx5HxxQl5ek7EdEBeQSHoOJJMSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Eq27GMFx3e17vcpoKAGSAqzzWcUzCOFp2cX5cXzEnP3LgMzdWMl0BsX+QfqN82E3YrXuwStbqTfgqO81DjTzcuDV+i/RyL1gkcYcyZDb+oe56e7MwyaAM6x9zaxahjULXa5bvxiruFATdmBPB/a28f9W4w8GtCp8X7Wl5UQEUg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLjcYYQH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLjcYYQH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0976776dcso454869485a.2
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509197; x=1750113997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iocCkfb+nHX+01sle1IC4FFymsCULZeQmkzsDFnCdV8=;
        b=nLjcYYQHU8ufqorDtCpZiuWdYqpjq2OEh7e82dbTEgNDcGeQHmJX9FESyOVW1N+M/5
         P0EFWSkcTK3Qm45YdJVouusgRXq3gcCB/ZZVmGqDZM2nYakD8UymCizoYVl3skhrLTKw
         B4RYK1z4XjcCc8/b4g2MeCdIL7nsaAOfUSzdw1n4/lbWB2uSWpPwjdC2VhfZalx+zQx9
         aYPwqtp09gSkOnXyiD81Q+MxHy/geexpWGA8WvFa+laQtcSHLrhLywSZepfnvsa90Ngu
         qb1R1ly3FdoHTYbF2TEYhtU0zuu7s0Z9kWBYbXTfDsfHp/aiehRNfdIqXPxyswIC3mGL
         Ysag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509197; x=1750113997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iocCkfb+nHX+01sle1IC4FFymsCULZeQmkzsDFnCdV8=;
        b=N8s7QyOX1tuLPOJ/6qzJtTWGChf5NDvPoBA9OWhHGTUjXJ6Kc7PrczL6XyQ0wExkmT
         HIclTILd79QKGuB1fRWIOchUGU6wZEdq2VbbSdBMcqo5QBC1FRKFRPH+tYtabH3slnc/
         9QAQaGN6voP5pEo/iKqwQNrdE97/mGTvYItDhnf/6Oj93QajILHOXe1mqn+80LNTBsIN
         sXbqhggbMkqKAZncdQFSc/6q2V0uWDnRjCEHNM7qbnpI++2JekDKc3/+NqqkCzIAyDar
         +0pfTDHE4nO2pPtRsDs3hNbyRLAKDNlJp3pegEeDyXxNSfpKO+XO4fp1rsNFtDqBIM5N
         Ggww==
X-Forwarded-Encrypted: i=1; AJvYcCXzBkB3dE+T9+XN0V6uyZDSNyb0LnIJk55llOyGnHMAmXv9tHfKs6w2FSfRCkFfVdJZXuV+@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+hJ7WaqSL5+kfM5JP7qqAsY6ARwbFKZIFptIYdPcNhzWkc0JC
	fsoF5P157BRrCDrwtmuV0GHeF9EiD+GLi/HF08ZLg14Z773CXBTT4sJR
X-Gm-Gg: ASbGncuJtbQ6pn4O90TpeOAAiT5y7I30VZRccCO3wA+7n7Q5NzCkBenhfYiiv/GXTc3
	0TSHBd+fqq7AOJd6NVhhvQRNFB5S8FYkwyGdScmzLSwbTp3YrmlyaSPOUAUBnSRT1cyA3pnnYiH
	kYGlD3MxnnzW9vzgHnJKe7nFd+p4SV5stnGxlR/wD4p4Y/rq/BZk7D2/h6h+Jy+mSRqXOJhuxye
	KnpoIXusmq+PmbqSBJx7iM7gV+Y/OZkgXkctLuu3ZWPQWs/RpXeZPpq+f3n+9WpIPbbS0kxxv2H
	ZB4LJ7OiOMrpAGqM4H6b1HfumG0vhgSL3SWHgR1zgEhMA+vtAz/ECibQd1O7suoZg6ioAftkI/u
	Si62bDUe6foSckVrndyOJYeWazOBXHPSPo7Wq8PDVOrkR801oXZJTqUmYFeLcnfM=
X-Google-Smtp-Source: AGHT+IFntFkNxx24CgiS118e5vZlr/FBZTsgX2Ln2DccFMO21mlALdHdkwVTMB4EKfRtDA/OFpbY0Q==
X-Received: by 2002:a05:620a:3726:b0:7ca:cd71:2bf8 with SMTP id af79cd13be357-7d2299339d3mr2562207085a.54.1749509197486;
        Mon, 09 Jun 2025 15:46:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a536b91sm597967385a.32.2025.06.09.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:36 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id E3EF91200043;
	Mon,  9 Jun 2025 18:46:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 09 Jun 2025 18:46:35 -0400
X-ME-Sender: <xms:S2RHaAv4npj3y2FfDkQ2-4j-c583mzRTVC4hdJym7aju215mluA2Pg>
    <xme:S2RHaNeao0rodrRNcspFdp3ejoNu7TgIsDeOMOcpupvOJfG30CslTo6uz6yFg6M2Y
    wlUO925ttmK3l7Nwg>
X-ME-Received: <xmr:S2RHaLxvWuykGoodmNf8XcD5GfMd3UC9rEoY5k-5ARsyEsm6AXY93dKV6Yw>
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
X-ME-Proxy: <xmx:S2RHaDPnFzGKrMPBb5Mf83MOmBIWfccBL8BilGJBcrz2bL5-s2lw6w>
    <xmx:S2RHaA8HLfqGS4fAFwI1Qvgf7caRQ9pxY-JiNce966ZpBCmWFqbVyA>
    <xmx:S2RHaLUXPv5c5CSdbGU6IIwYyntsBB4xCRLYBKmQWGtUETwdZFEgDQ>
    <xmx:S2RHaJdHNk1oUhcQ-zyTfLUtwJAaUnHHJzHkR3ygaW88v3wKJhaQZg>
    <xmx:S2RHaCfyUp5ArtuwvccjxU0RhZjl77WM2tI8mdIV-mIOBBaT6ZeS5EZ4>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:35 -0400 (EDT)
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
Subject: [PATCH v4 03/10] rust: sync: atomic: Add ordering annotation types
Date: Mon,  9 Jun 2025 15:46:08 -0700
Message-Id: <20250609224615.27061-4-boqun.feng@gmail.com>
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
`ORDER` associate consts are for generic function to pick up the
particular implementation specified by an ordering annotation.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs          |  3 +
 rust/kernel/sync/atomic/ordering.rs | 94 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
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
index 000000000000..14cda8c5d1b1
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,94 @@
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
+/// The trait bound for operations that only support relaxed ordering.
+pub trait RelaxedOnly: AcquireOrRelaxed + ReleaseOrRelaxed + All {}
+
+impl RelaxedOnly for Relaxed {}
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
+/// Describes the exact memory ordering of an `impl` [`All`].
+pub enum OrderingDesc {
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
+/// The trait bound for annotating operations that should support all orderings.
+pub trait All {
+    /// Describes the exact memory ordering.
+    const ORDER: OrderingDesc;
+}
+
+impl All for Relaxed {
+    const ORDER: OrderingDesc = OrderingDesc::Relaxed;
+}
+
+impl All for Acquire {
+    const ORDER: OrderingDesc = OrderingDesc::Acquire;
+}
+
+impl All for Release {
+    const ORDER: OrderingDesc = OrderingDesc::Release;
+}
+
+impl All for Full {
+    const ORDER: OrderingDesc = OrderingDesc::Full;
+}
-- 
2.39.5 (Apple Git-154)

