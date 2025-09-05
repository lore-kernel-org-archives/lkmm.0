Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E632773C1
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047326; cv=none; b=fhNtDJBYRpdXVUAujlWjR01qpuYZm1jmvoH7BsyWM97JtyXSvaUbH6L189/6wJ6MFJMgSwckq8JxCQrU7zWpYCMQmnSh17VZ2PwrLmRsyoogPG36Ll4dCCrv17YIU57dkWg7CRC6+P3bfi5ic4ZhZBG/AZM+bRXq0D0lkTpIFP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047326; c=relaxed/simple;
	bh=cIwCw8ri5yu72PQ+HU7IQjAWQp4V6hhuqnXQUXgcnmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DX3XiQ1xu8GZmOZHmwhphHB3WeTNzeW808MuOS0eEfT4VzIptI2LTpGLNW27Aor3oPzrqxMeimFg4Q304/eBErOo5RcTPI8YKmx2/Kbp3bF0PUKrGJajX+efUqEaeggkKVGqQ9KKo5JirP+QsiAYa1aYcgmjROX0XFmHDKzeqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RB/K6Vep; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RB/K6Vep"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-72238e9f8ffso15138496d6.2
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047323; x=1757652123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGRXCvAdf9rQDwGdmHhB4qan/VLBpVYM9P1wrloCxm8=;
        b=RB/K6VepbeacEoOpO6gp/a60vAQHf0bPs89AOOHDa/IwgH+I6FgA2FLDozvj0cm8Q1
         CtQAGU2fGzwPwW27mDbXr9i2QQ90DyjkkUw6NbyT7drqFg80X/kPwNE33vpUsR1nUH51
         mM6ugyzX97ZTHmHnvcZDTrISltuQlUE5jTuA3Xduv12iMUk7nT2gEqswdpBz0pz+IkHP
         yQT+GL+4N1NRtz5lKxIHF/ZKV8dxL/DUag8oCyL37f5r2whPapZSScbZye/kDOaUzkHQ
         8oDf0dfKkzuKimyQuICDYaVd34fpTeISH6FA4xwb9a+4Fi1+neoOEcJEUOPy+iubEqqN
         Oy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047323; x=1757652123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGRXCvAdf9rQDwGdmHhB4qan/VLBpVYM9P1wrloCxm8=;
        b=iSmCTX3F4hsG04L/QcJppLx9nP71s2qKzDNzjYVCWq9RD/LMRMYZVxMFTNnpeD+qST
         guAc0U64tS9o4zAEB0BoqA4Pt5o6ZkuyO6WG6op1X/U6OtrLdZyyj0pxSntvGCWwoZjT
         +6/JLc+ESazbCbEJ9Cv8bmuVu/cIjzDHaLKPe85Cu3cEJqTfeU7fHokcUse1+QRf75xS
         0SvVqdW3o5vAdw12Awsz2y0vo6ybZRitNqTPyOebkycfvoWk4ZfaPN4E56S9vl459MEH
         Mxm5CyxU6W2YxYkDjMlaYo5Ovb7oV4LzyvIzDxG+tlMIRy4wnrGS4gAiBD4F942Jz0Ik
         dZPw==
X-Forwarded-Encrypted: i=1; AJvYcCXKhRjebORqQg05fi1z1OdJbx3hwT+CcmM73yiy6wJ6d1Zys5EWFZNXuHDc4+K6glSGFQti@lists.linux.dev
X-Gm-Message-State: AOJu0YwsGC4GsGhDI3vMRjvzycOkHh8nVsLk9APePhvM4+AN/zLUvye+
	LraiOHfaYTEW4IcH7UWOBqtSLVL0S8LJXdH6D/ONiC3B8ZTICUdzofzx
X-Gm-Gg: ASbGncvNr7dhWV2gEEJdZPbMzFScFCYX52+M1Uwma47wG7IXnoRruTaa4WYBDR604ch
	UxtVVqYJq1+A7miuoo2G8ZDFIHPIjiSlR/UbfYRG76lXriPuRgL4fSdBizsfLSFMp782V6R8dBi
	C6IAsg0VNUlASIv8Gks5aB/lx+VL6K4SjGWEAgpu1wGkn8s89YNQD4YJo7lYJq97leUTE6H9v/N
	KakSfzKDsH2V6RrtEAPcCN61nlrMaSCjMgMzn+PFgO3AgGPUrjdpYzD4hlvdgAAF+QefV7/V5MB
	ZfU2rolzKK/b+R5GL2lNumZpMsuhPLB1bAkMdDGkIZOLUZH9kz+CBRgiy1Ul6gwOEbGpJLgJL5a
	GugYbfbS63uoN7lf8dmmvrwxz2y+D5OO+BmIdKsGU3SklVm8XNWyHqaLBfPn6+muBDpXbx2yDOW
	iIJga/P42gEiCQbXbygMCfuTM=
X-Google-Smtp-Source: AGHT+IHeGa/hifMiPYeAI3f5yPt/m/6tT3nOmmo9PQP22OrVz0iXxYDTUnjYb/5mNd+7VqNF/FpgJw==
X-Received: by 2002:a05:6214:2282:b0:710:9749:aeb8 with SMTP id 6a1803df08f44-7109749b4b8mr204940256d6.14.1757047323400;
        Thu, 04 Sep 2025 21:42:03 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b4665fcbsm58231246d6.37.2025.09.04.21.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:03 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D79AF40066;
	Fri,  5 Sep 2025 00:42:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 05 Sep 2025 00:42:02 -0400
X-ME-Sender: <xms:Gmq6aGenpJ8Mhwj7VxJqwjCUMBiJv5Ia5j7k0Upg9pejOzj-UBIj5w>
    <xme:Gmq6aN63iZU88Ss0bazI1YtXhSKZJyFAdOTgWbUQkjKZhNWgOcALiAfFSJI0SkMUG
    vIEypeqLWKNXTpPKA>
X-ME-Received: <xmr:Gmq6aJSn775DA1rsHIrnFYyRmzTczUMHMrQzx3hyI6C_IlmIAIUgqs0HQ1N6zKF5I8uF9TqnojXHRdI4ViJkZkyn-SR_opKJ>
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
X-ME-Proxy: <xmx:Gmq6aAcLdew77S6MnTrqXZGh0vN-gluanLUCvUE6mIdX1oxxWKsoaA>
    <xmx:Gmq6aJSSjdKy4w_l8uCUNMnUTlNKKVjvs64hkxB95-SyVY7oD7Zrvw>
    <xmx:Gmq6aJOCMlpYhdlrOqkeIakYoWq6hlwb-H_Am6jliAxqEetlgSk6Sg>
    <xmx:Gmq6aMVeZGwPC2SwbuzWe9CDgmRRGg58Ut3Flsl3KYsPdC8ThEttlw>
    <xmx:Gmq6aJZlNwastp4sma6krpJBzfBIEjGFJLmy-6b8SXNDlK_6y1wVJdT_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:01 -0400 (EDT)
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
Subject: [PATCH 07/14] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Thu,  4 Sep 2025 21:41:34 -0700
Message-ID: <20250905044141.77868-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Unit tests are added including Atomic<i32> and Atomic<i64>.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250719030827.61357-8-boqun.feng@gmail.com/
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
2.51.0

