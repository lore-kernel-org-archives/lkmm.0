Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005E298CD2
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127265; cv=none; b=gnd6+BoJ3XarAFxO7F7/iAsO+IbitiqbHJfnKeTCTYUseMYCG13VhGdDsF8ddA3FA3/ESZeuRa/qHrZ3AiF1sPF2cmTPBUjmmpBsr0TZzLUNTZH1fNffZLhkMwN3fk6A7Q9rkzxZHEvHoCB7/cRbt2BGW7Bnz6/U8I1SG3lgpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127265; c=relaxed/simple;
	bh=AofuJkxBhjDiz8NtTL9ENppPKcq3Wvnh4vcrq/oOHfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dxvuf7jeCA0GJE/JYBQYLGCHrbxLOEb2qNoU7t+3JMsXT74BaUpipgPbhVR88JtvZx9DYC+myPI4NukLMksA/8LRy+z3LmvaeHEAlnLPyWNn2aVnIp0FmfaUKd0SPe6gIoJGRaTNC93jVUJlSbzp265YZKVF3Faw/n/V8l1dxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VixX4STq; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VixX4STq"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d5d0ea6c8dso47469685a.1
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127262; x=1752732062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/DU6Gd6GsvMpxfhg5e8gpmRBqjJBuHlmTByBwz0k8BE=;
        b=VixX4STqRNUYjMM4lMavv0v6KDo6yXO0uLhkbyRaMR9Ks+H1GGgwrqOJqeVibmSr8Y
         uUsn35eQVwU6w5Y4efMgWf8sctg3FKkCG6wk2vbtaor6MY5TYZD1ludH5C8o+sxRQENH
         u4PKL5v6veZ4rgY7J0tGkPSxar+L+uH5eJs7v9PEKiBOW3JCdgUKu6uXKM9M13CFJyaR
         1XQ9Fu/FKcpi9gGVQBy4WycjutU0JSVKIDCSuUI60R10f9/LaSgJSYd9tCkIWSycWWLa
         S2/AroNwUo+j6t4b41k0scDwguAJYLt62OmIeQDucjxK5eOJXHiKZA4vV3bPg2N81CaD
         ia1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127262; x=1752732062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DU6Gd6GsvMpxfhg5e8gpmRBqjJBuHlmTByBwz0k8BE=;
        b=aZhsWyafXza9fJ1q6eUaIoYzJt0GwV0W1AMtJ2KdXP3Rp6Z++1jzghdECJDh/cTcDq
         8812ljP0OeRYdThBSAlMWZTMSGV6MyE8XcjXcx8NHdjKU0xWxN+AgHYyHptKKXcGZpuK
         cGRrerl6PYQ3k0u0KqMo7Q+ZRFTisogA+9dH6q6HozOOB9BUVQwoAef3m1OhlyAjcUdY
         FEu0lAkdaPzDJgoeppOaMwOQ++4GKSz0HFkZdrWm5AR0nTwYfeFouMzSuWlmcrpTVT1H
         7mmZSCiM6ONEGJyUvauzJYMdgTbUDjyzqg68opkRJu776L6OX5sQYAVkxBu2iaEi7Ojc
         bgpA==
X-Forwarded-Encrypted: i=1; AJvYcCVI2lW5rLS7jerxEP0w81UIo8vKoTgKFr+xggeZVq06pLr0jU/AaqiaGQsECoHRpaV1fLb0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz26pwSEmP8TerVYrTPkcOkYTRODb9jFTZtDTBlhlSmIkPhqE/b
	2wiDmQARVxy7cmpbiAlXnjX6Fyl2Zq/YkGS6Kmwl0qeisZb+/h9qOMLE
X-Gm-Gg: ASbGncuHDiCA8vJM2XDrY/jB2H7jDfweGDxJ/vqb/EC/T+xnrc167nc/TuSqUaGhjMj
	6Yev/ZAvzJKiGBcCidTV9v+OvHbI8WjcyeyOw/9/3l2Z/Xcb253AscslwP8OF3avMj41otZbXNm
	98qbZUpujZSmUJzXiiD87lVwPehzKM53xjonRUOXf50Dix9qcy8+LLGq/ArSLqpZvrhfjDNmutw
	1bv9/WhJXdYL0+7UQq6BV7T8n8pZ+Y/4VyGGY1qinE0y+IEz7mGQcdIaG+hOG5acgW6IlPgFGiW
	8emE0cgYyMCbFfNwqmxIRgijQO/+8iX2AmtPK93IFVY3nt8TH023RYlUMYGSLns+9X75dk3HJ5W
	o5nh/g+vifZqU2UqZoh/YI/nl7Ys799ycGda5Pz+ha0ARiewHrjpD
X-Google-Smtp-Source: AGHT+IFs5ymxGXZTKT0mW5UQCDuMkgRaKeOffj5osmMYN6AhUjxFiddukVJ8qK5/G6K6QWWdCKvJqg==
X-Received: by 2002:a05:620a:1a04:b0:7d4:57c8:af59 with SMTP id af79cd13be357-7dcccbb4d3bmr225348385a.50.1752127262264;
        Wed, 09 Jul 2025 23:01:02 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdbb1dbc5sm62289085a.22.2025.07.09.23.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:01:01 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2D85EF4006C;
	Thu, 10 Jul 2025 02:01:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Jul 2025 02:01:01 -0400
X-ME-Sender: <xms:HVdvaI9cn1_Z_tNbj2LiSKo8N63CF9WOHyphCEhjUO-IYt-BzMSgcg>
    <xme:HVdvaCNMqIOEMkrmp_8DmOZpppN8oKQxEQBYIlGg63CR7uRI4V2xsalgLuq_4ULnB
    gYwrF75PQiLR-jV8g>
X-ME-Received: <xmr:HVdvaCk8YxFVcSLOb0Snv5KASgFy3EqayLM1sDbAkWB0NjJfSLKMG9zxqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
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
X-ME-Proxy: <xmx:HVdvaH8dCzeJffYK2lkrIaxWC3l1UFB409OEcgR1bk3rG7eWRHX4Uw>
    <xmx:HVdvaLMAR3c9Pi5MizGpTEHHzNp80V0pgxJjqUnLG7ETCsddepJGcw>
    <xmx:HVdvaLE0hPyw_Xc2CjUJkKC09XIibhSqusHpn8U3cxarSBKoS25cDA>
    <xmx:HVdvaBh_fqxDHKQciVrNSUzQI5qLcoR1Rn38PVvp9i2OPlH-XTx8mw>
    <xmx:HVdvaHSO2Q_cpvd_ven0Nef96QOJ-qooqZcm3i5Zj5171_teWwyMOelt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:01:00 -0400 (EDT)
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
Subject: [PATCH v6 3/9] rust: sync: atomic: Add ordering annotation types
Date: Wed,  9 Jul 2025 23:00:46 -0700
Message-Id: <20250710060052.11955-4-boqun.feng@gmail.com>
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
 rust/kernel/sync/atomic.rs          |  3 +
 rust/kernel/sync/atomic/ordering.rs | 97 +++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
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
index 000000000000..5fffbaa2fa6d
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,97 @@
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
+//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
+//!     accesses.
+//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb()`).
+//! - [`Relaxed`] provides no ordering except the dependency orderings. Dependency orderings are
+//!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
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

