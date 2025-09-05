Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F03A27E066
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047330; cv=none; b=pgzDmV4mLcObDzlXtxgS+2hr+1NF5U/Mf7w6lD8URLQa8CNKAUG0HkcsI1U0XQYn3tYG7d6QewvF6wkEF5BpnJaQf79gIfARGY+pcUqX2P8EyqvMLUBbggR8TacOb2nhBp/KKeT8t00fl3mhzvSbupmInA1rdhTRsc8Yzp3pFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047330; c=relaxed/simple;
	bh=MjjRLGXaXKWnDN3Y+iZ9hxKqosHun5TiO6t6DTgkt9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONFKqjdIWaZ16gbEIvwbYVQO+gWkCVXlEQwhrq7hONerXn07JIfRALxxPhJwoCQ/qQ4a6M5KWypCKqXPWJTpPph//HjhYdEGhIGIy+L8K/eVWDBv8mz9ihgmAkzvJeZU793Tn5aPwldwLTBw7TxmAvctHBPG/guRtmzLNrT8bWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4AtnqE+; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4AtnqE+"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7220d7dea27so14298336d6.1
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047327; x=1757652127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z62qnMU5mjIwTXCgyuKsR71Jw7Lr+dHd+ICuGmGo6xE=;
        b=A4AtnqE+pbKxym7LATBhASi2+e3bOwxc7a6wQBIQmTZXP3fmS/zmH/iX+FBPXdLcXa
         rIZh7zTWTkF8SbuYbmNPqq+TC3XifVfdETB1XK6flT3AGetWPQO6mJkGpmxPgVi0/OSm
         KNe3Uscpbqbd0hcF1QjU0M7BSI3toLgraA7ejzzetODkGPiAZPdVYJQIE6rruxdOk4ZE
         1XJ+0i8U4mQ9WBbR5yLrYNtmXtD8fLGUsFJ+DXs1saGJqUTH1Ua4edhK3XyfxsxrvX7K
         KMJafUB3OOg/fSwV//MCYYubSO9pfJ6sKcEUwxuYaABlu/Ww4zXuFn22hBLWoxI65Buy
         PzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047327; x=1757652127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z62qnMU5mjIwTXCgyuKsR71Jw7Lr+dHd+ICuGmGo6xE=;
        b=UbRXUVYHjp4f/Etoxaj6kPW3V9huZQh+6AJR2KUX9IwuG8PqcANRT5hbSaVYwBjeck
         xtHNPpoeUeauaqELNUSysphwv/8r8J47El+GvdvccU9Hb3kYL7TEJSPhMbR0J0ixgLVf
         A2hTeo41fyzvSJ9SBcPNuvGb39tq3RKsR4Er6yYbOZ/4Pm3xyKCwwPUJj3TyYWM1vk+q
         bRD8UVDJvarn9uM7C75UxyrMjFW557gIrBAulGZrIJ0QdF8d3DLWEhtn6TYaCtVvNy0U
         rAD7DPcoflHicgNAKeSgx2c6zRznZfq/UigUUy6iUpj4ygjUzWczaHkq6w9yzbe6yKzv
         CqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRGaO8wHflz0d231y1w55Is9pbBjcE3XnL02jxE9X8qC6j2SncPEBCERyhdsPgrsxAby60@lists.linux.dev
X-Gm-Message-State: AOJu0YwlXCNdgSKwgKZQxxkg6faCpgs6719Jau9S+yEBRKwSrQ9TZ9EU
	v/K8/vuOszq7UJMC0SuRd71CWs/DmhtJwaqsa010bRbHTY1MY4CiEuQs
X-Gm-Gg: ASbGncueWKYkaeXWdEn9oXetN3zAOpfadjfaNjbSVwQzF5mN+XGAIdzPIOIHH2VZmIl
	n/vSVu7RlFXFUAoB7ixyKPuhJ3RF+ebPqrBsSvc3YBQL4GX/6FwR0kkSP/1V+PxuToSTik9roAV
	/gF1YxXTOY8LwkXImdh+ki2Sze53Qru6/l0hBd4+JOLlbS7ZsEoAWhJVmcfaWuPfpEiBnvhNcQT
	nPXyeue7VVijnAWuqYlwBJRcEm9mDt/5AkBuHxcrRoWMb7hdwjBhPv0mHzajHlp0GJcbPY1IUsi
	D992EEi186UL1K3vu5YBOvIBlSWZZzYUp9fDt/JxG+HxMJX+EcXsGYTsfrxWjfrUnumnNZZE9tV
	pkNqR76zOMpdUnqKpEnFzE33rpAgafl/BRoGW6cgsXvBdfqhEkeVJn83nvUeBSITYO0GJinmFE1
	w/11HGeaehnMSxXFQkk2LnT78=
X-Google-Smtp-Source: AGHT+IEsR6vmJrmL1/mS07dilwjZjcLcZ0cV5rOniLcV8/5upI9i24wgAvLK4fDsKHx4HoJ5HVF+0w==
X-Received: by 2002:a05:6214:d8b:b0:72b:205c:aad5 with SMTP id 6a1803df08f44-72b205cac27mr40375116d6.2.1757047327444;
        Thu, 04 Sep 2025 21:42:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-728a860bdebsm24972856d6.69.2025.09.04.21.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:07 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 918FDF40066;
	Fri,  5 Sep 2025 00:42:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 05 Sep 2025 00:42:06 -0400
X-ME-Sender: <xms:Hmq6aGM3TXyRkjQNs1hi4I9JbqJKWSHJmlQtS-vc2-NTzrZq39nQ1A>
    <xme:Hmq6aCpu-z4ocUeS4JRtkdYNAp29eKw4dUpNhue6bY-eF3_ZyUo21WLgH4RCrl8WZ
    a-fePL0YdUvMjVAYw>
X-ME-Received: <xmr:Hmq6aPCNMgRMwsN07VIhCNePUVdzrENIg45MEZsiXu6vAjrqE9iRC-Jh5ZWV-FiiPT9XdwlVNYG4EXh2ftCwiEvYHwiwm8_G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfehieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
    dprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Hmq6aDPIt6kheJK8BXXjrKrNS7HnZINnsR12DzsE7b-llqVscGvQhA>
    <xmx:Hmq6aFCmfeqtyO1VHV6HDeZL1ENzFkbNTXJzIksOqfAP1h6nW2fP_Q>
    <xmx:Hmq6aJ_RdXa5aD4cjdfLzzHsno8S1686E3WfiCupiIIOaE3f-gt-Ew>
    <xmx:Hmq6aOHOITUODxTFQRD0A3Y1ZYmcTvGJL6Hu3fHuqJxYa-CgN1kS4w>
    <xmx:Hmq6aIJJaVMovLYw6Seyv3FISUjCV6BQa6JJ87fvCu3GPHxX5L4cNadX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:05 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: "Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	stern@rowland.harvard.edu,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 09/14] rust: sync: Add memory barriers
Date: Thu,  4 Sep 2025 21:41:36 -0700
Message-ID: <20250905044141.77868-10-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905044141.77868-1-boqun.feng@gmail.com>
References: <20250905044141.77868-1-boqun.feng@gmail.com>
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
Link: https://lore.kernel.org/all/20250719030827.61357-10-boqun.feng@gmail.com/
---
 rust/helpers/barrier.c      | 18 +++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 61 +++++++++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+)
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
index 7053f9245759..85ad14b81925 100644
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
index 7e962e5429d2..bf8943c88a89 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -12,6 +12,7 @@
 mod arc;
 pub mod aref;
 pub mod atomic;
+pub mod barrier;
 pub mod completion;
 mod condvar;
 pub mod lock;
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
new file mode 100644
index 000000000000..8f2d435fcd94
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,61 @@
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
+#[inline(always)]
+pub(crate) fn barrier() {
+    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
+    // it suffices as a compiler barrier.
+    //
+    // SAFETY: An empty asm block.
+    unsafe { core::arch::asm!("") };
+}
+
+/// A full memory barrier.
+///
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+#[inline(always)]
+pub fn smp_mb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe { bindings::smp_mb() };
+    } else {
+        barrier();
+    }
+}
+
+/// A write-write memory barrier.
+///
+/// A barrier that prevents compiler and CPU from reordering memory write accesses across the
+/// barrier.
+#[inline(always)]
+pub fn smp_wmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_wmb()` is safe to call.
+        unsafe { bindings::smp_wmb() };
+    } else {
+        barrier();
+    }
+}
+
+/// A read-read memory barrier.
+///
+/// A barrier that prevents compiler and CPU from reordering memory read accesses across the
+/// barrier.
+#[inline(always)]
+pub fn smp_rmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe { bindings::smp_rmb() };
+    } else {
+        barrier();
+    }
+}
-- 
2.51.0

