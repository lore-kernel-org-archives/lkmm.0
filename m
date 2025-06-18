Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4ED2F5469
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265391; cv=none; b=K1y9vc1rvfYtsW0xmGRocG/FSCvVVPcbllvMQlos6evqURrgONUOCOcex+UJdRwmsDA1hz9ijhi9mYQd+VI3v3gNQnb4n8AnvEhu3h1sdC9KM8nWvKbOPFG0l3uLzgCuTg0FUW0ZJN1kW0PWbe5mD34e3TQG6jGz0DL4mn/kgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265391; c=relaxed/simple;
	bh=/1u7Gor/8OrPhh8RWM7zBT05ZYt4jbJTlHKK+zHR+1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AWIXBq5iPrBxjlnLQU5Rc5PpR771/MmFXD/b85RToTVGX9iY2WFvAk8RcGuF5rYbFdAtFpN+ZKlIiP/A1aduC18TnHxpbks9Mon+gTJo/fLW+AuT+YFTY7HKyI5dZ58JTDtrNq52unvzMYSCeB6ZE+WQY91XDocT8PWfJNOccJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/Qlgmj5; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/Qlgmj5"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d3e7503333so172536585a.3
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265388; x=1750870188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BjCJHW7K90LFjb9bKN42TOlFgvmqIavct0SBIAGQ15s=;
        b=g/Qlgmj5Lru3ov2FvgkSZXiq/s1WLHBk7xm9LfTB9l5Cbq2SJyEbDeTyZDBYYvpHyD
         IZ7ZEg0BriYr9aavnpRfSvZDcEOzOi3hJXioGz7MvVs6Y6R0ut+RjeHo8rBzbY5ti04C
         KrQ4NCxz7Fjc7xC7EzS2ojXcWnZlphYtDLge1hAxPrYnVhdtXVLEehQpBcYJKFtweFEE
         nFAoz5DtIbrVcI83Z/GwjpIFAat9TS8VNSTxzg5GVl/QLneXXPtYU+YlmWK5x6DqviHE
         6mHaWnRSQOUJM6BW2S0j5n5/2Jmnwfz7cfMPc1VobfhgJo+JGFsFfgPSTR0/IMtWPimL
         EaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265388; x=1750870188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjCJHW7K90LFjb9bKN42TOlFgvmqIavct0SBIAGQ15s=;
        b=hVu6jkIRjoCRV8QaTXwhZno4iBkEZVvwDDjFYlILyUWWWfhySBcST8gDkGyzO8M91b
         ujQqHAS7EOIxwF9roHZUlPoiGoxFkoWOeSIPoYYDhZd/wu3XGEOEjL3FyABjTWq5QPj/
         SnybkJ8ymXwndCQ4pPeXiZTI4hMETKwdhW/d9CtjzoLqyVz+w2TC7Rmm1WlgV+KvIc7w
         6Udrd+uK2cMvSc1OKI/jmmaw/nVM6ev9M7MF+WRIw/VG2UAVGnscyr71yCn+le3CGHmm
         yRsbz+btGr6RDyLbvA9aloZFQRx3iuyUayTiDdp5QLqt08hPmSn5JHfD2PRbU/iGGdq4
         quhg==
X-Forwarded-Encrypted: i=1; AJvYcCVCNVb/OGOGUcZQexnkgLH8fHANmoXLV68htnyNC0/gMjllvT/NC233hEE6aZO0ZcjVnL5H@lists.linux.dev
X-Gm-Message-State: AOJu0YzaqaLaSv6H/Z/gB/Kw5sYui1IQTtXe2luRrDkJhtS1jthMC+LV
	ff4aPF8da3pBAgokNbDrJ+fFFq15osTE8E/VWesGQO3yaXBKvIWci9vF
X-Gm-Gg: ASbGncvJZ+YhFqZDp+Oav5Cw3sDLLXIYXaG8pomPV3SrHxuKels+Un+/zoECVSKkIYw
	IEEqWS8nvFr5cujUyebiVvnMYFbmt94daQt4gpMhwAo+w6boCwK0DkarMj9NPXWhjHN6tRcWsuE
	k7uNh5dOZCN5whZG8siyimkkrbMrDJlyfqaIAIV7J04UoaEIIHo0ELcXCOkeZefxdKXFATm+N+E
	F+eIf15iIMgnF9Vue35X1cuAiZVFcD6j6WnAOP4dCmfaOZGeIEGSei/YhUU1ry/WvPdY3K2FK8x
	gAGxaV9OMfPugu1qG6g/NAfQ7Nzxs4tpmk2texOsKlpL2aMuSfHZzddYbnZQxxb3SxW0OQhJMbn
	gflY9Ld520qnPD+gSwpYVrjTJIQuMbi6XcZ3vI4AVXuAtLGk8A2Ai
X-Google-Smtp-Source: AGHT+IFaLEVg8p8CUnS0SdnehCb3ymzjCbkC0/6SQXVEx3+RzVM1NuRoZXGUVgnreOpmLk9wxUe+yQ==
X-Received: by 2002:a05:620a:bd5:b0:7d3:9012:75c4 with SMTP id af79cd13be357-7d3c6ceedfamr2795072185a.44.1750265388334;
        Wed, 18 Jun 2025 09:49:48 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dc9e7asm789775785a.8.2025.06.18.09.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:48 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6C1C71200043;
	Wed, 18 Jun 2025 12:49:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 12:49:47 -0400
X-ME-Sender: <xms:K-5SaHHfagE5uMFkzulHi-CZL3D-G4hRZP5Jmt9Bsv3rpKIvw0zOCA>
    <xme:K-5SaEXFYuFFFkYBHeLGHlMwvNT2WwZcWEQR7an7b2YXKZmIbOU5Eyth2wEf4Edjh
    s-0pKwJgmHAM-F0Lw>
X-ME-Received: <xmr:K-5SaJJURl1LWMGmYye6UJ4QD1PynSFntCWiCdcb2upAsVua7jUDnbSRaUjAZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:K-5SaFGaaL7WqeaHv4lJozXLvnXRp35_4wWCVoXbfVQw_akxxYZmWA>
    <xmx:K-5SaNU-HsrKsGq8GQ5e_RADd3trif1cTDsLRkPLZkBZ9l7WhGQmoA>
    <xmx:K-5SaAO7ll5Dx_96xCNW69juZcdiQ-_12dVrdfWlZewdxLEv4ck92Q>
    <xmx:K-5SaM3jkyWH6QdYiD7Lt6P415lNVN5US5JGLEQQ01LPghfPTEKP0w>
    <xmx:K-5SaCX5Tq51tBChYcNS7sMOI3R_r5MTC6iTcR-N4zT60YquGs-CGJln>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:46 -0400 (EDT)
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
Subject: [PATCH v5 07/10] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Wed, 18 Jun 2025 09:49:31 -0700
Message-Id: <20250618164934.19817-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 111 +++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index a01e44eec380..965a3db554d9 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,3 +22,114 @@
 
 pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+
+// SAFETY: `u64` and `i64` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+
+    fn into_repr(self) -> Self::Repr {
+        self as Self::Repr
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as Self
+    }
+}
+
+impl generic::AllowAtomicArithmetic for u64 {
+    type Delta = u64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
+// SAFETY: `u32` and `i32` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u32 {
+    type Repr = i32;
+
+    fn into_repr(self) -> Self::Repr {
+        self as Self::Repr
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as Self
+    }
+}
+
+impl generic::AllowAtomicArithmetic for u32 {
+    type Delta = u32;
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

