Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A68E21B9F0
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471433; cv=none; b=Ig5w8w9bNNXag3jy5FjpDWqfM772to5+gI2T6RDtNNXFnh/kmbOuMK/a08df3rpxqiUVZOOEaHMeK6p4FkJXJxFDklbp+6+7Fn1VIr0nH9RbZf/KioNXnpsDeGXlQqlJK43a8epToc2gwzjBb+mvaD6eBURnxh7ND9ghmZ2Cv74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471433; c=relaxed/simple;
	bh=xlWvdx4K4cpu4DCrpHnXsezY642w8KKmsqGNrNT6ghQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tIes9O/Z6sMwjEsnEfwMxYgPtPLHIiI6oV3GU/YyLux3VE6a35gu3mik+bL0JGjTZtISp4p70jiK0d/rvIFuo5ZA4Ve2kUeMjNG2ZYjKnqXQTUa+oQygg7ejQohc6KLApg6u6UR0cymMZC+lqUG/Iod+0DQvSiTSpmTL83dKTTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBrfIs+O; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBrfIs+O"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d20f79a00dso535211385a.0
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471431; x=1753076231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y3PTADJROK8RUselFZejqtVBUTIPbEacB2CE9Mn3j20=;
        b=CBrfIs+O7YZkqO/FdOPeMhh8r9psCikLyjkZ21WpsT/VTftB3Y7FTklMYYyxZZY5yO
         9/UNVTbtdD0cjNXVm3LW2N80WL0BFF/nqcaXEJ7brxeKYRu0RWIUZx54RnI6urkQF/0H
         scScS62QFjp8AyjkObeoUN5k8Bf5AiuFTwnFT0rIqMhuuDj6gWcSwfnoyNUeqqt8GWGs
         8VFoeBe7swx1hjNqzwD0upYYVdlGx+/GyDTE5hMKBwLjqPSbUyRChTpzlJJ6riCDkpUz
         7OpQjydWIpKpWehFt4VRSwwJk8SsypFE/u56ZHZRXLvEfy6Fd6174M9GP+QUdRA9rWeC
         MbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471431; x=1753076231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3PTADJROK8RUselFZejqtVBUTIPbEacB2CE9Mn3j20=;
        b=HRRkHOHHVLAaGzw1ZR3amwUtVD8fIaOf6EbHXv6mf+w8MX6YBc5A9+bwF3UYR6cQcu
         4wQOtQaTBYwy3cAXS8pYGYrRdbGbYxX2HM0XzTNv9P3HMj2zDVJc1xeTxJx2amrdRq9o
         TzWUrWTGMiaOA4fXMwWsZE9NcAxXIihtztRg6wPE15wJ2zNwRF7Pcc5wBmAtDzPCD18U
         NHm5trOOlFrIpmLNnFXwVgPJgbkrGwYrhiRPfal72o9kEBmJ6V3XmBd5yU6d9U2k0y4j
         7qemLyD4g9SO23feHaoRG4EzY0M2Y+JIHChg1tiapuslWFJiUzMOjb84dboQwBcrN/Vm
         0U8w==
X-Forwarded-Encrypted: i=1; AJvYcCVCxfa91oUWGWG5YamgpqG53tG6KN2jqCIQ9K+gX9OpNRwPO9vHLwdnfh3TF4txXTMhe/Ip@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy+erX6bU+89qWIB8O6CvbRqrAqETvVgz6TL/AFTwRKxNxm/cN
	jqDqCobR+kf+Z/fu+VMyj4Nb9yLQDrOjn5oLvBCrTygNlx4wWrevPR9C
X-Gm-Gg: ASbGncvLFafob2I9CLrAzFYSouQwv/q98h8nj3SBOu12fE7qxNWb2mB3ieiAMhgRFHM
	NHuCRTl5HMMDBIslaAeDO5+BPoPeC1wyPjxTNWdNhvJ79+bDW9E19Pz6IY2o8BzOIWCrfSR3n2F
	qFnLu0xgtaHSN8kjZvbmnDlV4fBQmePjsKVI1UityNKBHuK+Y3c16e8aO9Xu0zlagNNRHEnB9LM
	cdmKOVOb7a5++YASHtkWkDH+AS3zlC0lpRNMi3ZqvDuTVnpeCJw1/xBAbAbTPHuBCo8VKJGkXgu
	JsIfQFoGB8pOU+Ji4LtABbt3X7BNrB+vVnumkJJgE5j1n2zX74Lw4mVSGR5xv2JuLkE0p+HACM5
	wUXAbBfp0UMXO1FmPltYIQZeoijMlhZPtlTNqxg0MakXeqzxOafnfD7M+UKNMx9GMABuknNQDom
	Chg9x03gTYNXVBx/bdHcRDoPY=
X-Google-Smtp-Source: AGHT+IEAuOUBLVlPtb7IgisS84aKVc2oQXRMxeGYtZS4sxdj+N8tflO03IXpyxI9gp7jwAgezZk3zg==
X-Received: by 2002:a05:620a:1b98:b0:7e0:6402:bece with SMTP id af79cd13be357-7e06402c8c7mr1133157585a.38.1752471430660;
        Sun, 13 Jul 2025 22:37:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0fa32asm473931685a.48.2025.07.13.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:10 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F137F40066;
	Mon, 14 Jul 2025 01:37:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 14 Jul 2025 01:37:09 -0400
X-ME-Sender: <xms:hZd0aKmy7dSKX9Bf4S0UoL4OkTbutzlAfZBkxaKQ0TL67AHG9iy-oQ>
    <xme:hZd0aDVRVsNfjTF3INsmJRsuxED4tJ48aeG7GdzVUlUEjYgiVFcJd2a6Rf1ElRTg7
    QrB2TFqb4U8OfJuVA>
X-ME-Received: <xmr:hZd0aNOQoc-GSUTdfrWLpg78eu0AxYpQ6DOKr_IiDcCHlVR78Bght7OFaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhi
    nhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhish
    htshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhm
X-ME-Proxy: <xmx:hZd0aOHlXbAfEpF5CrbofI1C2TIksLwQ59ATyO3zL2XPMCRNTOFM8w>
    <xmx:hZd0aG1e5jWhacGtzgSMBNoBIPaGfYA-56r22C4zl6reVP08XWYKhg>
    <xmx:hZd0aOM4DAipL3nFazGikrghybAm-RTN1Ym05CsX4lHhE8hdG04Yog>
    <xmx:hZd0aGI0RQNsiWTX-r771cSm4qS1Da5Qds9oJBUCoMolHcKnlGkhXw>
    <xmx:hZd0aPY6jdUG6I9pu_duJRT-W7L3pgU2RyMFK6P01zZRYH6Wary6wyBj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:08 -0400 (EDT)
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
Subject: [PATCH v7 3/9] rust: sync: atomic: Add ordering annotation types
Date: Sun, 13 Jul 2025 22:36:50 -0700
Message-Id: <20250714053656.66712-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250714053656.66712-1-boqun.feng@gmail.com>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
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
Benno, please take a good and if you want to provide your Reviewed-by
for this one. I didn't apply your Reviewed-by because I used
`ordering::Any` instead of `AnyOrdering`, I think you're Ok with it [1],
but I could be wrong. Thanks!

[1]: https://lore.kernel.org/rust-for-linux/DB8M91D7KIT4.14W69YK7108ND@kernel.org/


 rust/kernel/sync/atomic.rs          |   3 +
 rust/kernel/sync/atomic/ordering.rs | 109 ++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/ordering.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index c9c7c3617dd5..e80ac049f36b 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -17,3 +17,6 @@
 //! [`LKMM`]: srctree/tools/memory-model/
 
 pub mod ops;
+pub mod ordering;
+
+pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
new file mode 100644
index 000000000000..aea0a2bbb1b9
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,109 @@
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
+pub trait Any: internal::Sealed {
+    /// Describes the exact memory ordering.
+    const TYPE: OrderingType;
+}
+
+impl Any for Relaxed {
+    const TYPE: OrderingType = OrderingType::Relaxed;
+}
+
+impl Any for Acquire {
+    const TYPE: OrderingType = OrderingType::Acquire;
+}
+
+impl Any for Release {
+    const TYPE: OrderingType = OrderingType::Release;
+}
+
+impl Any for Full {
+    const TYPE: OrderingType = OrderingType::Full;
+}
+
+/// The trait bound for operations that only support acquire or relaxed ordering.
+pub trait AcquireOrRelaxed: Any {}
+
+impl AcquireOrRelaxed for Acquire {}
+impl AcquireOrRelaxed for Relaxed {}
+
+/// The trait bound for operations that only support release or relaxed ordering.
+pub trait ReleaseOrRelaxed: Any {}
+
+impl ReleaseOrRelaxed for Release {}
+impl ReleaseOrRelaxed for Relaxed {}
+
+/// The trait bound for operations that only support relaxed ordering.
+pub trait RelaxedOnly: AcquireOrRelaxed + ReleaseOrRelaxed + Any {}
+
+impl RelaxedOnly for Relaxed {}
-- 
2.39.5 (Apple Git-154)

