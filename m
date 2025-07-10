Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED512C159C
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127272; cv=none; b=fY7XVhbO/RYMy2rl5XahDYOTuJVKC/FLt3N4sTWVyolPXfz3EXPD5BFuS8yaKL/Si/7r4zrOQGyMctJjIcxb/0sxdH49ov10xogVSrURndvUeAFlzx3Octio6tpUp+fUa7kLPeOLnEc75QVfh4tQFLgvPmABi6TUnlYcFWdxkNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127272; c=relaxed/simple;
	bh=Hfyk+YB11j3QGic3cuIdSw0oHyEEnTvIKxG+qiLIAyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KfHcWT/vjG3AN9RxYdqYVuGSElTjf5+c9SyXEkZ1/fbbiEvAbDSgMGAMLzHr8kP/UuZ1whE9L5w1hVFPhFpS3+SAWJ82NqZxGn4a7ABIbpQ4oB6aUwpWGL/crzFZRFOx5kQATm546ZgoLp+Vb6/SeAbPN080byPkZydunRrCOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bk8iFB/T; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bk8iFB/T"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a6f3f88613so6105691cf.1
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127268; x=1752732068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qCTul36LoYeO61iHyu+jO7qVkK0zfTJ8jaG4JYpY7YY=;
        b=Bk8iFB/TMKEEyByhig44Ws71TiFQq8Su9BBGQesA20VTPFjK34fcO35SGYVvyW+sRP
         BuNQmJWSinO2hpK5JwUB+tcCC9HOJN+b3PVZ5AQ7dCluzdk0BxnuF7WKnsnWf0qcfBKg
         jBGyAo+JhdOJFTM02T6WxNa2BpJTgUY4sDHvDq20EvUPAbHUFnSrgJTZUxuyqsbrG1C2
         xThLvN5VPN9iYyhyB0JF0F60gsAPuA1KRkPsbv7GsESu6tiXxY+tOLq7MJ80PFg1SI4U
         W4DYUg2qpibUw9HFe4ZQDqRGIpVXRpCdd/YraGZsTIkwF3Tsq715n9bM26+3UcJNXXB7
         ERxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127268; x=1752732068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCTul36LoYeO61iHyu+jO7qVkK0zfTJ8jaG4JYpY7YY=;
        b=CJTDBWsnf+eAIOUSnLPCf40CAJS7Ca3qZAOryulhzwrleS1iWNfpe4Gh+frKtMS565
         yG23/aFhqTs1ffAUOK6rL3qbNnHa8KVE4s45TQeEJT6jAd99PbL+kwzzHCZLnlJeofMI
         L8CJACrFR487fim7/vFbm/fN1ZDsmWgaRY5oXOFUomlYO2vTiiHdbZGVjETx7r8PfqSV
         H3H02DrD+8LTa85nJX7NKnqCoJrqnFWE9/ejvacDVxnZilTgOQSzm8E2znvUpeVQQBLx
         79jE2WK9R8DvaXzFUNR8m9+pumi4PVqL5a9pyBXeQGEq6pqmgFVw6l6c1GBx3bbdZtua
         aVkA==
X-Forwarded-Encrypted: i=1; AJvYcCWpEziPQ/eHlFVPpLZZj5XMB8CV94EMgyrD45+yHGf5TwvA7ZdIYLS7nlXZNzqdcjH0c9Bx@lists.linux.dev
X-Gm-Message-State: AOJu0YyIr2tL430F6lrs3xHt08QCmGg1ijMiVlPxGet1OXyZja8BVXuB
	Xy8xd+tzWkZIzyNWaEaAxED96cihkl/V6JcHRzsiWBPlDWs1I3eVhwH9
X-Gm-Gg: ASbGncsZBLrijl7fX7yCi2oOKLsHYAvIaOTnNsw9YfNzBkv1o5SAga3sX6pcSgLSQ6V
	JH5YKkSTmHu819JcLETOrcKkxEfCcCzSr+9ordceHeTRsGV0kt5qjPW1gElHUYhuw44mX2iesD3
	ms11gatYiOpWdJzNn2bHA1JZCq+4QN1UvarFRvLnKz7SFs0XOLFFJD73DHJ6kz0TPaVogDxKip4
	HxMNkhh8I/V26gfzICP1R6zz0lLjNFJ+CK+jl90xQrQ8ZHYn6AlCrzuRfqK3hMQcne+27xVwUYU
	/DOKf7UiY1QeUjlRWF+VQXM3LsgCSLH96erWS5QHoEktZ/eezuqGQwpx/5ADfTwVj2Y4v9kbu2O
	rM7O76/DLELOTFyiWiCa3EUNViovuz3xP+qlUEz8WWWMwX2STYfCc
X-Google-Smtp-Source: AGHT+IHdAf4ekh0wIYWPLlJGBcN1jwPbal29cw38Chcz4Tlb7KgoYWolNrVn3J5kyGDUbF7TWRRYFw==
X-Received: by 2002:a05:622a:992:b0:4a3:4d46:c2a6 with SMTP id d75a77b69052e-4a9ec719caemr18734411cf.7.1752127268127;
        Wed, 09 Jul 2025 23:01:08 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc5b4bdsm5620471cf.25.2025.07.09.23.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:01:07 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0E303F4006C;
	Thu, 10 Jul 2025 02:01:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Jul 2025 02:01:07 -0400
X-ME-Sender: <xms:IldvaFu7MugQ73StMcjwvD60JveFkiZNTCPfFSjL-8bSXuQgs_9LTw>
    <xme:IldvaP_wol0HaZ-BcOnRnawuedKq9sPCf4w20rHrep7kUSqh4CRWh_BTuvH8TAlis
    2htvyCXgENOc48-Eg>
X-ME-Received: <xmr:IldvaNUVCdTdwAukqBG0xh-i460GwUCul7CM-W_6eFXUQBYJJtIju7Vhtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
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
X-ME-Proxy: <xmx:IldvaLtTyeuTujEOtvRArZ7LDwc82Y9K9ms0IaOpXhL9kJ865Z4tPA>
    <xmx:IldvaD8ATli688QEl01RCZjbMeuCe6F-2DLLTHmrjP1S-wMXUso20A>
    <xmx:IldvaE3LJhPtkNBupYGSJmzS4oTtjnfCec4pbqnDcmGAAtZS-MpOsA>
    <xmx:IldvaITH2IIBu9wh3C-gu8Q_eIJ2wI1NvXIpd8SaT9zPOkWSKVJJDw>
    <xmx:I1dvaHBs69z86RoaY3j1GNV_3RBQjGZ0JHDJ_L_BmKsW_PCZj2WKwfU1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:01:06 -0400 (EDT)
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
Subject: [PATCH v6 7/9] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Wed,  9 Jul 2025 23:00:50 -0700
Message-Id: <20250710060052.11955-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 99 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 26f66cccd4e0..e676bc7d9275 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -52,3 +52,102 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d
     }
 }
+
+// SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
+// `i32`.
+unsafe impl generic::AllowAtomic for u32 {
+    type Repr = i32;
+}
+
+// SAFETY: `i32` is always sound to transmute back to `u32`.
+unsafe impl generic::AllowAtomicArithmetic for u32 {
+    type Delta = u32;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
+// SAFETY: `u64` and `i64` has the same size and alignment, and `u64` is round-trip transmutable to
+// `i64`.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+}
+
+// SAFETY: `i64` is always sound to transmute back to `u64`.
+unsafe impl generic::AllowAtomicArithmetic for u64 {
+    type Delta = u64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
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
+    fn atomic_xchg_tests() {
+        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+            let x = Atomic::new(v);
+
+            let old = v;
+            let new = v + 1;
+
+            assert_eq!(old, x.xchg(new, Full));
+            assert_eq!(new, x.load(Relaxed));
+        });
+    }
+
+    #[test]
+    fn atomic_cmpxchg_tests() {
+        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+            let x = Atomic::new(v);
+
+            let old = v;
+            let new = v + 1;
+
+            assert_eq!(Err(old), x.cmpxchg(new, new, Full));
+            assert_eq!(old, x.load(Relaxed));
+            assert_eq!(Ok(old), x.cmpxchg(old, new, Relaxed));
+            assert_eq!(new, x.load(Relaxed));
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

