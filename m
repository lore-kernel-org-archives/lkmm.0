Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAA226D14
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471440; cv=none; b=gSMszi4hBWOco88hvHtnbbXEZeEeD+WzOIOzZFpt45PfbVPx+VuMw9M4y3UvsfBquxCBxR5D1SE4k/up1mzuNKBFSb9KZgMS3Go+fkPIj6mfX9JKTIW4Eu8d4N2dKc8o5jAf4vpDpFhlmWpvk8cEzZeFOvUCAGmfZ9v+OHCYRHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471440; c=relaxed/simple;
	bh=2Y2Wya5dyH5eO2lH59db9rc2Hj7wst5vUMcXtoDrUgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l6fx6FBI0cyYiyMoP821cn4yAjPFbtHnLQdNq0JnPBwYPtGneCLWAGgf1+jiHGHZapECX/j0m1/Ju9Qeyu1OIxmkIhH7oRRnlyMCkLZGd6lorUZOHFfkL8Lile2HigJT6qfqPOaMTFFH7ZoSToWXZxTiXU8Wd/JanxIw51ny7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXrkJZa3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXrkJZa3"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so41571696d6.1
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471438; x=1753076238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PNsb1w68dGNOSxkM6AOd5CDMWTKk35ep0cbt9dftdl0=;
        b=cXrkJZa3Ce10r5sb278C4GnWywNkrDZtr6sSxKaZyfPM3LQpbXM4c6slDOQ3WDvuUi
         awoV6nCMUJLLjXEjnmzcBg0d4QeIWv3wUjUYb14mfhXzQb1T2TAO0gxxkM6RhJuuOMU2
         bpG7Suku/3vjaOM6FOA82s/URPDFi/Km532jqayuDi3/3IkvGNtAasTiB3PnbS/E9oZb
         4czXb0TzfBDoqSp668hHvPhH57l80LS33Jifl57PmRHPnJIv33pWxeYGQWnWocZmVkms
         4F6CYIA5BqnpykDJB53K8Ly6cDgICgE1KxDYu/8P0Hik0pyU8dHoRMmR9qHKnjAM9Qb8
         12UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471438; x=1753076238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNsb1w68dGNOSxkM6AOd5CDMWTKk35ep0cbt9dftdl0=;
        b=riugi4kQ4NiTMOcpCrFSwwOr73+yrYBiiZ+Aoy9xBRMY51IAxlGEZva3Esre+pbQ0m
         LMz1EoACFGuVgRSPwi+5N9vlcXWSNxrnGaq3Vt2TomF/MJBvx6QeZ5Kpct7+uoYuM6b9
         tsUgFFU+g1O6EiuPONav11luSvKvXeLb27t7Lkdh5V7d58O9vFBt+50OUlPjAwHUEByq
         w7Xrvm5CUrPUQicj9l35Hwvnw9afx7GORlqxtzf5u7/h6BPpHdnC5DPSCItO3NAmrfm5
         +kPpvBoZEHXtz0nmJ93XhZoUWAM4ZXLtjA9KKrDRxXpam5XhQzveMZhBecJYPfuMhY59
         SgIg==
X-Forwarded-Encrypted: i=1; AJvYcCW6d07keX034hLs6OTMTZc7Jl4yNUAeg263LfcQFORX92FeP98aWJW39xJHNGPD6NghxC1/@lists.linux.dev
X-Gm-Message-State: AOJu0YwrZxCIPwHBdI4UARM0qnineL5yp32bMqx1fZ9kdxbTaqrvaAkD
	F0H3YrgTnqpLWmwtrx5NBsiNWaMGtIT2o4pE+Itcx21XJyYN5DGLnAhs
X-Gm-Gg: ASbGncsyr6HG9czTUaqskl/y0uE0FKD0F83nVdhS7Vz3ZlYHrd+jz7IiSmlFXk6k9G/
	DW72hvC4F6UmDbhROqzaeBLZVDD/eSLF9x2Of2tIqL06srdNmCdOQHyL869LdkGWDVv4tPlTnIn
	0g2CAcIlLnoYPhtAquU8V15HzMbWU5ZlkZmVJcX+g9DDCqRz4VkViCNeAOy5r6YGmGD+obQ/tR4
	pFEppV/fCSbsSMjNxVp7qd2SgERMjsq6wm8Iie5iQ2I6Oye71R4QvPNzilSLKIy17/XcBtLLQ0D
	Oxmiq8ynnIWKQLCrzNSddMiS214DgO9kMUBH5GWhah/cLSotjJCY9PKyhQ7lB0bqHuQyUpg0UZ7
	92RzGo++xgGyS4tQtBLeZuolbUzItfXsqD7V/py+O1l32pWqfIdaMCGeSZNSH9Th4XLW1XyZ/7u
	4GO8I1unFdSJvM
X-Google-Smtp-Source: AGHT+IEBbGV+Zh9vJlvwZsK9o53Aw2K7X16dnHr4RRkgnzj9zoHHmmsypvxfF5TeSgxDZmCyQDhWYw==
X-Received: by 2002:a05:6214:5405:b0:6fb:51c:395 with SMTP id 6a1803df08f44-704a3aafe67mr165372656d6.41.1752471437928;
        Sun, 13 Jul 2025 22:37:17 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979b4968sm43985616d6.27.2025.07.13.22.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:17 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id DBAD6F40066;
	Mon, 14 Jul 2025 01:37:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 14 Jul 2025 01:37:16 -0400
X-ME-Sender: <xms:jJd0aOU4zXlINNjWD9l_MIAwKixv1tCuTmCYJeNvPn_QJawbuJsxgQ>
    <xme:jJd0aMFgbJCFu7x1U8rMTmDCzUaSVIGgmEvM2MB56DmRXlHJ6wJliZXJGS2B8ljWu
    ZDAnZ10T3ZIjemg_A>
X-ME-Received: <xmr:jJd0aG_3DbHcuyefxf2VXCCi8QlfIfJ-RyHdpHW7HMnVauX2iqKne2YH7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddufecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:jJd0aE2-he8k--0IbLRpfo_91Esw5DHSGScmfTwnbJRIF9mHg2KTvg>
    <xmx:jJd0aGmM3hGqIuaK3bbMF5-yh7bl7FaN0n4gS0Lu_C7BM2Ur0ghvvg>
    <xmx:jJd0aC81WJbvj49Mu7AQXz-iZGiwDvf3GjLqpu7Uj-AClM-or1DI7g>
    <xmx:jJd0aL7oW1ywGEpXeu-K1OZUAVisFWZzVKZQizp5Bc7L_n_nUtYmfg>
    <xmx:jJd0aCKuEjcigkKRkCOi3mvoqCuV4wvkSRYJ7VwWQb1s52coLlqqihgg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:15 -0400 (EDT)
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
Subject: [PATCH v7 7/9] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Sun, 13 Jul 2025 22:36:54 -0700
Message-Id: <20250714053656.66712-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 95 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 54f5b4618337..eb4a47d7e2f3 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -48,3 +48,98 @@ fn rhs_into_delta(rhs: i64) -> i64 {
         rhs
     }
 }
+
+// SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
+// `i32`.
+unsafe impl generic::AllowAtomic for u32 {
+    type Repr = i32;
+}
+
+// SAFETY: The wrapping add result of two `i32`s is a valid `u32`.
+unsafe impl generic::AllowAtomicAdd<u32> for u32 {
+    fn rhs_into_delta(rhs: u32) -> i32 {
+        rhs as i32
+    }
+}
+
+// SAFETY: `u64` and `i64` has the same size and alignment, and `u64` is round-trip transmutable to
+// `i64`.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+}
+
+// SAFETY: The wrapping add result of two `i64`s is a valid `u64`.
+unsafe impl generic::AllowAtomicAdd<u64> for u64 {
+    fn rhs_into_delta(rhs: u64) -> i64 {
+        rhs as i64
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

