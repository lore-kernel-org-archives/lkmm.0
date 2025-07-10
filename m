Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2C2882B9
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127273; cv=none; b=YOd9d2hiKqZ9xKkGG9NZPEQdHpg08RYuEoSvF9OWoKxubLVVSer++frhSvt/wo7673glXiYPB1dHpVsNcTOMPWll2xQ43J4UmapgjXr+Dd8IID/ltf9VjetxY07Sor6B0qI52bR7RY2dH8Par0F7cLcIdt3ZQnGjnL/tXyELxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127273; c=relaxed/simple;
	bh=ozeoBnOqwbQq17fV9bnwWSOJc5c/pE7wVstv10Q3mtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T3MUmC9ky4bqtyIQrLGSrp8tmnrMSY5BeOQMhOTagJBhviPzAHcwVDUX/ny28VtvQd4mKIMUWl2SY9DtTp8adP1ucsBPyf7ECgy5azaV2zzntVtwxULjpACGFKtrdEGiAw5Qkm2bOAxC5yKcJUlAqWKOHVtN+kF7c0ibtd7A/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O54Y+ntF; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O54Y+ntF"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d5e18860aeso36087985a.0
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127270; x=1752732070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gZcVZieU5Z+uvN44hThFdBaHpSKgklWNBMovXp1yeb4=;
        b=O54Y+ntFFl3RhQLDi5NVACW8JIf42u9El6CJ0EBDyamM6kEOCTWuiBpqOhXUodLHJO
         hCS7qAFqcQupKtXyUb4nT9TIF57roDWdo5iTV+wBzCCXU6vUkjdqDVLxlGQQP8LQK/pG
         KFqjoic0ivG1PypTcNwJjpKSMXhSIhmKpZQ28WYhHP83+Eq0OuK5Gyi0IAWlJL4gVmys
         bAWYxE3tpsCxrs/oLbJQA+WEdp+fiOXyPQfjhxhsTOVkrmspKNsqEuCRkONCRGboEdPB
         4+3vw/sdxWAdVKwERuok5AnS9XajfEVsgkk8qlRubn2V+SxMVFv1WgDvTpgBu/CILSdE
         cLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127270; x=1752732070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZcVZieU5Z+uvN44hThFdBaHpSKgklWNBMovXp1yeb4=;
        b=IIuetA0PionftWdIzYl9us4Df2/WQ2Ja01Z1USPqHnfE/ZzdEwQkfnfZocnikZY61v
         Sga9ezOHjdF3zu2oowYrleG9oW6qF9LXPexaxAWrB3rc4mG0y8hkZqM9kr25S8BCQO7o
         HO63yTJzu8/pM6OSeADy+9Fy2KayTZkxUSE1vcDqnaXaOp3V/IXdjbGtCQlnnvQgEKUW
         xo3TzUWheD7B2SDFxVltTMBGsm31SJax6EsvWdqPxFkmn8LrX4Bb9WJ8CF3LkYgOw+Cm
         q+7tzKsLknUkCcMov/ZgnjKXoc74wShIa7+vzNuDgYXyiocO0PZ9KXGFff6FBSzFRyeZ
         sD/w==
X-Forwarded-Encrypted: i=1; AJvYcCWV7x+kg2X4HICtcjwB0QEvVF0vIyISgcA4/y6Sn06lkxGPgerc2lQdsTeocHVZbB9W4Ujz@lists.linux.dev
X-Gm-Message-State: AOJu0YzitmQrxA4QBM42qSPAQcgjz01kpQJ3YSexeXXMqC1oO7XMdYJ0
	H2YvBk3aLmjPGEbkYsSDyXtEl36AgJUbIV64EOif4cQ/CE7ikkW8Uynh
X-Gm-Gg: ASbGncuhFTKM2L7yKN/mSyRN7RMgVbdvUAatMUx/EQJXsU1DBKCJ6A4imZx1g/9Tcm0
	coTWy+KXumSUS45qZVlZK1UiUZRF0f6EeuPWdPRsI2+6mhItj5sHa3l2KqAMsjVKZ6jhXeoSe5h
	3KT9mXYlxNx+cajCl7h7KuAQs0ijr7tY4NpvVAZHt96fe8MMsAiPKm2c3ekQsXlVRrxV5CUhbu9
	UUXnV4hcdbhaTbbRB86nw5nNY6LOfbriTA5wQmABYDxTMuP7nMt+2aDd1VZrpzqf7m1lqi7pfzl
	hMPqbnn3dMBZJeH3bGtihL1RVzojzlgv4H3sBPf62biczylP9miDj6xLH7cprqXc9CyvzdxAPvV
	Tqhxafh5AuJr04JWdKCrcnSI53LzzQd+icTjAoYX9dKwzsj4n5I62mO9DfARmjqU=
X-Google-Smtp-Source: AGHT+IGcYnLsbKloZsHICdUNilWsHX+3z30OZqCHiQbTiaU+c2oJUDnyuAP2Fw5NufpnpZLid0bQoQ==
X-Received: by 2002:a05:620a:8908:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7dccc583ad0mr193807685a.39.1752127269531;
        Wed, 09 Jul 2025 23:01:09 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979e45c5sm5242826d6.51.2025.07.09.23.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:01:09 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8EBE7F4006C;
	Thu, 10 Jul 2025 02:01:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 10 Jul 2025 02:01:08 -0400
X-ME-Sender: <xms:JFdvaGdgutNEpG4hISTf6ZxpVjDn-PH2BCghzzpmiR-v1T3Uer1pyA>
    <xme:JFdvaB31-g3Bj8mCC_Gg0PSwrXb8wJBJf2mQJNVZ47lLMEctLUxlapSMB7X3SjuLt
    -cx5LfSa3TyTZgVmQ>
X-ME-Received: <xmr:JFdvaGMVwCwV7AH_TGrUDbm7YE2hMKwwRKjMGL_UDE4LGWhQMNwdmHmNVA>
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
X-ME-Proxy: <xmx:JFdvaMdkO-ruv15iq9w7-N3iLVCnmOayG7lzMKWa2CWdLeF7G3NKzA>
    <xmx:JFdvaDXJ7BqHF8g8a_hCSqccca-4t7AQc7zhkiKYXVE9YrU8NRcqdA>
    <xmx:JFdvaExTJPbh7m5-wcTMxBJFfxn8Ohg2es8fyxlsAZbPusJvpTJ3NA>
    <xmx:JFdvaJigCyDKh8TIWzroSVPGxUlblRRnQyYQq-0SvV2EdL1iq_LC2g>
    <xmx:JFdvaPNDfzB6gEzNUtVmWRCZyqyjYBcXzZthILaWYGJ4k4BgMzULZr5F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:01:07 -0400 (EDT)
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
Subject: [PATCH v6 8/9] rust: sync: Add memory barriers
Date: Wed,  9 Jul 2025 23:00:51 -0700
Message-Id: <20250710060052.11955-9-boqun.feng@gmail.com>
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

Memory barriers are building blocks for concurrent code, hence provide
a minimal set of them.

The compiler barrier, barrier(), is implemented in inline asm instead of
using core::sync::atomic::compiler_fence() because memory models are
different: kernel's atomics are implemented in inline asm therefore the
compiler barrier should be implemented in inline asm as well. Also it's
currently only public to the kernel crate until there's a reasonable
driver usage.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/barrier.c      | 18 ++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 65 +++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
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
index 83e89f6a68fb..8ddfc8f84e87 100644
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
index 000000000000..df4015221503
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory barriers.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions
+//! of semantics can be found at [`LKMM`].
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+
+/// A compiler barrier.
+///
+/// A barrier that prevents compiler from reordering memory accesses across the barrier.
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
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
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
+/// A barrier that prevents compiler and CPU from reordering memory write accesses across the
+/// barrier.
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
+/// A barrier that prevents compiler and CPU from reordering memory read accesses across the
+/// barrier.
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

