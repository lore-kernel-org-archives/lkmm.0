Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC322D9F3
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471443; cv=none; b=qmFFTRG8XIgrSMXSCIXeS1Wa5b6OvEqSOT1APB3K/dmgCVRwkiJeGoEF1Srx6j39gbzG8TZNRUsBkyRvaxx6i34g0VrFGpD/s418W8ynhAys9N8TihjUvttgTZiTOpEBfxbO+DZ2U6hPJpc3bPRfQk7kJ3nOGfxXmXRBRzabK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471443; c=relaxed/simple;
	bh=WCT6z5PFKds5elqtScAZ0FqkB10N0S9kF8SYI2tCpwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KCkkYIl86+dUSK0n9OGA3NGqOzJHhVDfwc752aoBqlz4KuzUaj4xHxS52ZdgZiC/3L+BOw+FWwfpNH/iI/VdXWgbjxRRdR8Slcg2kBdOZMR0Frk84Cks31gFKpUp1gfP2/zSgaAMgADwlaR0ZZT3E8HibwjrU4m+5wuwygYjUkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQm3cwPl; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQm3cwPl"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d3dd14a7edso569735685a.2
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471441; x=1753076241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xbxFvcQp2SKKo4g3N8pGlZT4YowYhGke/9HCeglF0aQ=;
        b=ZQm3cwPlZ0SQzVOEW0HlgIdZRiZTCbcLhFxAApINvqydelFoFjWWUZL5gLbiz3dVlX
         r3hzBxWYTyEaigwMTqK2wJ01Y4QPXjngCRZS7Jhujl97BgBfgpuJ+jHTVlgyb0k/qWPq
         7y+koELj7+qeSPzYW8+nhz42QvE5n1xTqA/XuaOwsp0YyrrQl+MhfGwYPJDXJ1lnmLTB
         Aak+YQtkUi/PTFsgNRu8zeaffNOVnL1WEFtG75HxME49bEg9VJ3tFvF3oPtPqfWWIGMD
         LxzQGrSubKY3Sn3d5lp1BAxHtC4h04cEVikY5VNMrnAfivyuva/EAMkrD6DjtcPDPAnR
         AmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471441; x=1753076241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbxFvcQp2SKKo4g3N8pGlZT4YowYhGke/9HCeglF0aQ=;
        b=bbLp4NsBLwi7jxQXi8aZ54T3PyaXwYDLNOr49GiHGOaDM3VIAcc+Tt6afSJlznHbQJ
         93LuxOirx8zqmOIX6apSwOb9lacrGjtWb443xMDBrQYZDmjma5CRSEjCXeVkFBHVJwD9
         Uf+A/zP0S454wi3fkfh7yHuGtQV8xPkZH5y4F01dB9+quCS1aS5Bx8N2pldPn4W8lz7h
         Hm8GBxpGe8kP+vJy31teiGjXFqNtyPKnrH7dbVWpUXN6NsTCU/8HE4uTZQ1K02ic1Ts+
         upCOsmpCRMXDpNaTSdtK6Fd2kq+XesumOplhWczIHs5k6WsD1z9z+Pjr46Q7d2cZa/+2
         FrXw==
X-Forwarded-Encrypted: i=1; AJvYcCWY0Eb9R+V02Te5q93j01nQhAU6iq6P92X9Qx4i9xx48GhnvmLatOkUAOgHVUoX3zy7tgqB@lists.linux.dev
X-Gm-Message-State: AOJu0YzxVVnvScyWdqQ+kVYqQ763pAmfZs0qn36xr0mxZGXo5SFRYDpo
	xAGgRooTiBmsr/j98e5Wed4b5axBd7RQVXB0NvkvakCZ3iQsuPJRJDec
X-Gm-Gg: ASbGncuo1PGvLRweFqAoa3mbml4V1MzhyWSSJupBKbglm8wVVwNfDTLIr6qFnTPVvz6
	/yRc9mh8OI8PqmZsnpnNCNtDhJua0ec+nmql8pnfzEVocrtuA57xpjG2JgakITbKPygKp8KX1wy
	fbiXUCX/TfUF9aU+AHX5le+EZSzcCbCKYeFSk7kC1LSKFCneV3+CpBEctlQyLbV8NmhWUB6OwZg
	3ONq3e4oLi83px0zqNIhvUfWSm5q03cFBdoPwgnuR2xnFPrjh4VDJkcIf3IsrS13D7+IA3RAdH/
	qPK9FUT4gXvPpbAxvotQwZK2sB8aQU5QGACwbHIvun3kUauc8zplpQPaokndoriRpH0A0Y5KdcC
	SbbIg/6vtS2Mm3rupzi9Ybvgk3BDdOWEdQIqWBQtvc63UrWTrHzoZrcTWkp8eGaVe3cdwtC1Wxn
	aC81vpVb2YYLwZ
X-Google-Smtp-Source: AGHT+IHVTAeaiCrtUcuB/dKAJJixW/vao1xVy21/YuOpjp76n21BwqPdOJotV90WaKdr9UDu6Zfe2Q==
X-Received: by 2002:a05:620a:2b8a:b0:7e1:5efc:704 with SMTP id af79cd13be357-7e15efc0b3bmr906203085a.24.1752471440771;
        Sun, 13 Jul 2025 22:37:20 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e26996873esm111990585a.64.2025.07.13.22.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:20 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BEBCEF40066;
	Mon, 14 Jul 2025 01:37:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 14 Jul 2025 01:37:19 -0400
X-ME-Sender: <xms:j5d0aIV8DPTRkLnFo6VFyJIHKGaveBiXl80LpzWT3439GkswlCq-uQ>
    <xme:j5d0aOPh24XvbrHGQmmIFoLFfnH8hqWiOllau5oy3hGaSVEs2P0Acr3LUTDgd-bpN
    9tf0t6Arl6bv6T3ZQ>
X-ME-Received: <xmr:j5d0aLHJxkb3Be4Gljq2HIpRf4xs7tLFG5zTxGBvSeSIvabu030P2TfwDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddufecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:j5d0aP09_ODYZdaY2UfM3Wc9Qx51ZiI2ETPOekV-Fln-hwNepw-3lw>
    <xmx:j5d0aDPJ93_eN_U0vt4v9U98SEkxENY_DavPpwkHCoAY9lkbZ9oYuQ>
    <xmx:j5d0aHKG-R92hezUNW-SBB6-shrEjlOwXvlpH3qoQtkbt5YxFkeXbA>
    <xmx:j5d0aMaLzpaUDVt-qgY3xz8cCpNIiOcVx-TB-3jjtGuZhnsa76FNGw>
    <xmx:j5d0aIm6MJPiAgya4JrGBcjIkXhkvODXgnZ_3J7wCaWa_Idv13GBcEU2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:17 -0400 (EDT)
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
Subject: [PATCH v7 8/9] rust: sync: Add memory barriers
Date: Sun, 13 Jul 2025 22:36:55 -0700
Message-Id: <20250714053656.66712-9-boqun.feng@gmail.com>
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
2.39.5 (Apple Git-154)

