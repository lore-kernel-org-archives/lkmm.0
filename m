Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00E221DA8
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 03:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752894526; cv=none; b=SsUYjKJOpbMb+P/mdomFxlL9ZERmRXWO5YucEoGqVv9aMdjeuJID6XojMlf39Z0Tcer+ILK+H6cZHj8LvFOpsM7J0gbuqpvdsCCgPSo+ro5m6wEMd7BIJvy/pAwMUDU5Q/Z4oxl9KTkPSqtqzcX8GmmZohrlIF5cdq2txD5cShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752894526; c=relaxed/simple;
	bh=TP3jTUuLChJ7+2IgzREnNWToIcGobJhvfGdbfGdDts4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KdNsq5yVsRTb4mLIKCZlaUScNagt+LgsFc53u6e99rE5sbsoKdTk1XYMvGM4zZf1PaEL8a3WYOq7hEslUxztdYMRMnJwRwXW8nkMXSjGQQgLmnn+eKzh417HcZzJylWc/kn7J+ESPzWnecuhDDEz8ecc4izPrgwX/ku+3qoeckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlOwVDuW; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlOwVDuW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4abc0a296f5so6468521cf.0
        for <lkmm@lists.linux.dev>; Fri, 18 Jul 2025 20:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752894522; x=1753499322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9y3yhhEc6XLO5qpQuSE85PA8k6DmYNYdfRyagczjJ4=;
        b=FlOwVDuWtfV+s7wLB3QShg0hoZ6Rm2in2QnIYSEoZ+Gf0DfVd4+JS1s+ZiCaHng4XE
         WHGnQNPVXEzw3YWeULRga3Gs/Lp1upBJi6I6xpvrKXxzD82Ms++1ttqBmI2fDQYB4XFq
         XY69MtZGArZ+D554s5XQrzT2+PoYaJiAq4rsz7t8ahp+f2RKJFs6FNqKHInMhqSXOQ0B
         8P86nZiZ7fDo7E91s+jTN/DuPDivgnllmtMsIdFAt1iTL0ORD1PJXlfiZua4IBbYgfm6
         rIJY2pDg49i3Wg02w8Pon5RqwqpdWiy3AYW3KSqKRiXWLU2hx5UJ0r/UuA5cUXFZ2qyE
         yhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752894522; x=1753499322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9y3yhhEc6XLO5qpQuSE85PA8k6DmYNYdfRyagczjJ4=;
        b=mMMZMr9ckqpYwM9KeMsjUCrrRlk5kpsV/H4Zb9Y1uG7vGK1e4kvR8fHb12z5aynUTB
         lCj51/vKTIh35nmp/yuzimgs4puokvP+N6tV2ho3UypEGeifVtPKAGzOdztsFQ9KY3u9
         dIq6x54sfdEOexI4N2BD7vDiYv/6yaFSnHhDOem1bfs/WkOpjn6Z+bqad1TRz3YtCOIj
         ix6OPq/jij6Lt0qIyRUetwXzqX724k3jODc04B1SpZY58Jigo04jk3+aHGgtmdVgvdps
         6GowJqLqNvYy5PGVfIc9D2JRrB/ioytIrefNEYNIeIlDbLW/DbgrirRXIkJ8qgs43JP+
         kAog==
X-Forwarded-Encrypted: i=1; AJvYcCXU8tVE2OBu5+cp16vl/Mxmg/6VKy64mHecVLVT+quLWl4FZ7SiwuaR4Hj+Mp6sZSNWuwLn@lists.linux.dev
X-Gm-Message-State: AOJu0YyMp3/9LCZwfYVcxZG02uGZ5S//Z05Iv50jNyOGXXoeP0uLhAwR
	v9pnsU7rLbkkBCT8b47HjA/jJdovRhz9JAJgbuzKLZt7FOr6ArEChN7k
X-Gm-Gg: ASbGnctdDuYsOKLawFYAeV71wWvgNfRYMorhjKy82hNU1gebHFvpkk4L18Y1mZ02zgn
	wRuuiswC1G/uNg6xzjlo1BBQvnMs01kDrA2z+GKCfikdBmzVO5ZZAkXG4AWiTQiH0bBdAbR1MMj
	oZszeS7qy0jwbhPlmt6h56gyzWLS/fp2zo6hEX0e2BCRcZcjnbbBAeeolfJfpBT0qQdqPPMOAPa
	T9Z/ydum7+P1VpwZEKbZElYuxdwukVXOP2VTHOLHi0b9IhdiHuOavBsh0rj0HSl5TlNy6m2hvFB
	cTIWNe9zA8OBPqxwjKaJST8gmHY1a1gLITWw95H3h0XuTlFHow8XE5XJ9tuSeN6K44cqP5axyBQ
	5uKjQTrf8sDKTpMKNbVlwA58QOJGGIgKCgX8N6ShYFWJmtn98ZklpAbEkW2n/N20vvgySksbSHg
	9vKlVOl6bZw/k4MErgZf3Mhx0=
X-Google-Smtp-Source: AGHT+IEkVdjbfr5P+zUooTumLYMu1V6g2Av8CBL01ZTkirc8lOzIIL/2TISrhK6wped1NkU4/oiqAg==
X-Received: by 2002:a05:6214:f04:b0:702:d60b:c037 with SMTP id 6a1803df08f44-704f6b08b25mr175496856d6.29.1752894522411;
        Fri, 18 Jul 2025 20:08:42 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b90616asm14661536d6.35.2025.07.18.20.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 20:08:42 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7BECEF40066;
	Fri, 18 Jul 2025 23:08:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 18 Jul 2025 23:08:41 -0400
X-ME-Sender: <xms:OQx7aILMwMtMBwZfawLWn21L9Q4iCCHhtUiLtp4hVy4maQXA6QCnbQ>
    <xme:OQx7aJw-u4CPkpGP_tD7eISVwqiE2JAb4a9rVciISW-QCohrgQ-aRPHtF9Zopl5ZP
    flII0AIBWCXRJUPAw>
X-ME-Received: <xmr:OQx7aHZ6u62OpbFyapODk-HMIEiArem_4dpm3gxROFWosBOBKf-uS1qcqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeihedvvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:OQx7aN5_mFlsg9FP70C1IbZnt56Zn2rXKt55yLcq_IXJTFurN2pW1g>
    <xmx:OQx7aAD8GxeXotTuxOZvKCSrYf93UlIMmUWdfAMAjqjKdWnyDK0cow>
    <xmx:OQx7aLtVA5viUrQQrt567xdXwNCS1C0Cubqb-OcigyiXR7g3_sdWIQ>
    <xmx:OQx7aNtjgy96cSrW5A2jvhuXvfKE3-ga8mAf8xuEPXknPFJ48qmMhA>
    <xmx:OQx7aHqZr3vKXsx3JKD8KiUltSTzxaUx7mw2Laj92QMPV6ZtD_-zjUh_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 23:08:40 -0400 (EDT)
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
Subject: [PATCH v8 7/9] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Fri, 18 Jul 2025 20:08:25 -0700
Message-Id: <20250719030827.61357-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 95 ++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index a6e5883be7cb..d0875812f6ad 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -27,3 +27,98 @@ fn rhs_into_delta(rhs: i64) -> i64 {
         rhs
     }
 }
+
+// SAFETY: `u32` and `i32` has the same size and alignment, and `u32` is round-trip transmutable to
+// `i32`.
+unsafe impl super::AtomicType for u32 {
+    type Repr = i32;
+}
+
+// SAFETY: The wrapping add result of two `i32`s is a valid `u32`.
+unsafe impl super::AtomicAdd<u32> for u32 {
+    fn rhs_into_delta(rhs: u32) -> i32 {
+        rhs as i32
+    }
+}
+
+// SAFETY: `u64` and `i64` has the same size and alignment, and `u64` is round-trip transmutable to
+// `i64`.
+unsafe impl super::AtomicType for u64 {
+    type Repr = i64;
+}
+
+// SAFETY: The wrapping add result of two `i64`s is a valid `u64`.
+unsafe impl super::AtomicAdd<u64> for u64 {
+    fn rhs_into_delta(rhs: u64) -> i64 {
+        rhs as i64
+    }
+}
+
+use crate::macros::kunit_tests;
+
+#[kunit_tests(rust_atomics)]
+mod tests {
+    use super::super::*;
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

