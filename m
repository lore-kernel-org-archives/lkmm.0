Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8E22A811
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509206; cv=none; b=rlbxRnFjc0YmJz4JmELPUSDp4yu0AKieFUGMshInU/HD4Kazz/V18jbniv/5sXD0lgxrqE/ALR+stWItqU/yfTX2ywwafoP4iV0OHp+IerlTKFZ5YCvwYg/Bff3X1nwqtLdJHDqnYQP4h2En5xgNF7V0LncUTc23EtbnW9Rw59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509206; c=relaxed/simple;
	bh=oFjgr6Gty0sYPZz6lkCRj5C7HTiuBJmRhc3BPpW6Gio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yq6qEgYJbIdwMJdmaoCQfP0HxD1XS/kmupwnYw74lUy0bofunrOUSr7bMWATaLopyyJWV1nc8XV38LEHRyaDw8iS0YCzCfKerroVpQ2RVSEf6T0CpJv1HIOFR8Bw+P5avGvnNPfoJFBucXgchEgag6yS8GJWp8IyqKBTURulsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5w23tdn; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5w23tdn"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a43e277198so39940201cf.1
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509204; x=1750114004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0VUmlWceKq0MhGDhxaelm4U0vrjMGoaihx4g6jot+hI=;
        b=P5w23tdnceNkHBEwRXHcZ50/A2hyZjwlo1KKmDMJL/qL/PM8uleG9hkVlCS3jO5tKO
         27w0SgxR3Ta194JzCoQK5e8oXQ8QvAL363/Mb7HkCS7GJN7M6CA7sEr4vNYrGN3TneLm
         SSysJkWN/spri1UkLBlSLz9WwFr1jBKc5lKC3HbUmyh8zpOdfdGMuKXWhxBDz2iiyXA5
         mc03i4AkSxr7R1BpDb4Ls+NUy8lnf66t0UgHFkcP50uwTI3Hee/zQo8TLP45z6xmY2u+
         IGqT0mv+EcqSuI61NdH5PHhASxu/WCbEqAmQgpEfdZB7f4HdWXShNSd4voL1fUmq2pqM
         Mvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509204; x=1750114004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VUmlWceKq0MhGDhxaelm4U0vrjMGoaihx4g6jot+hI=;
        b=hlW0udr4BfBpBeyl7AN6R+rwlDnJqWdE33ygJ5uKRe4Q9H9IRMH9ICE6d9509TnRlk
         Wa89T8Zte++wCH65CoCYqDtLrVoDabrwluBRCrnx+MCULU4F2mUbFSMa5MzrXZBIj3/4
         q9lDmSCScIcH8XMKhHTYPDchBzcdKY4E2I2lthRNrJqHKHl+YjwRxNNew2B1eAHlo12y
         /IxJ0eOPG48yAnHShGIJpRBg/BCZyuewpJyW6Cu33KbbxFCgUQotYeNx+AEAIcBMZw19
         BxaMKJHl/DeFpgwKYyl8Pv1kSVbSNtgJ3i4F89Bq7km/pBKG3WOJNmCeBpTBhaksbe+k
         1Dsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJbH9fths4+YVjbJkcPvBZ2Cy/VpEtTghvJHQ7f7cLXqeTlDBQQA3XtALXpNwhLMCenRc5@lists.linux.dev
X-Gm-Message-State: AOJu0YyjUyGBomPpGcfedCYkKP23BfzT4mcC5agf7i9KUy3hnvlnxAbo
	T5zVTLzeHI8uhbZzwpJ8DPj6PdmKbR0VmzgF+M9fV7UVhhx/jKuJNTJM
X-Gm-Gg: ASbGncueqHRuEz7x016RZxSWz/O5j1LsM134X7Acn6ZQrutvTxRf4dKcw8UVvxFL4TS
	5dDQ8aEvTeX/v+usyYI+oHAKDDNFLOiRlVH6l9+gn9P6nfZAarFBgCvUFJUItbscUWR1ADzctYY
	RQ9GbBjQ3YqOsDGVTMNgJ8aBJAagNUF8kf1OOyzVMRm/KoZhwCwJNx9reS4HsgUo6fEllkCGgul
	LSsw7hWUSwuI/POhUvPxo7k1gpHVM3sDnqSwIu3//WE9cDGk6tT8foIV/P1dsCVhTybdnQOW05J
	I4+oPWx76aFcOaij39QGRMq3PZbw/aj750lK5OotFU1cYQDm7BdMrqbbtECb7Aaw5CbLhcFZ20D
	7/4iLe8Gb3i9aAAydFvtg+UJsrS4QANfjNHjqZJ79wcEqqeMZXHQ7
X-Google-Smtp-Source: AGHT+IHUvGILmPxevlLiDdE4/5niU9zwzNHdixZ1E6LRUj9Z/4mSR8N5VsZ6oCwXtJouTe5pBCngUg==
X-Received: by 2002:a05:622a:588c:b0:4a4:4202:e77e with SMTP id d75a77b69052e-4a5b9a0528cmr245207171cf.6.1749509203935;
        Mon, 09 Jun 2025 15:46:43 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a611150018sm62230961cf.8.2025.06.09.15.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:43 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 957041200043;
	Mon,  9 Jun 2025 18:46:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 09 Jun 2025 18:46:42 -0400
X-ME-Sender: <xms:UmRHaJTyc7qbO-HEt2gzY8TYPSPz9Z7ylZuu7hTjqkNTJ-wHCd5-sA>
    <xme:UmRHaCxdtc-Zh5pK0UM7v31k6t61-u9VHalsdDHmhLZMzYwUG4fGjwEaVTEj22VLs
    k53ewAO0AdTNR0rXg>
X-ME-Received: <xmr:UmRHaO2L3mWf0ki31mn_pDNrU1-QFP3sV08oJtLckMyDIZKIwf9Qwrjh-X4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:UmRHaBDu1xrx37xMclGV5uwtH8bP1utCzAWGf7orMuXtfJhV4j-Jfg>
    <xmx:UmRHaCiB1gAN4snSQfplw4LPLhzds5deU4cgdBH3plIxnNETzp05-Q>
    <xmx:UmRHaFqKJVVM50ANxjRxT4b29pitt1ECkFhnDNaBzPEYOsoPSqHBcw>
    <xmx:UmRHaNhV3gSBlC4MCcank84CoPjqSWVYqpcR0XKAtH1KM3b8LwYZyA>
    <xmx:UmRHaNRpm097rN5_rK3gZa8gQzMep9b5VDDzV8NJDQfB3Ziw2sSyt4Nd>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:42 -0400 (EDT)
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
Subject: [PATCH v4 08/10] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Mon,  9 Jun 2025 15:46:13 -0700
Message-Id: <20250609224615.27061-9-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250609224615.27061-1-boqun.feng@gmail.com>
References: <20250609224615.27061-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AllowAtomic::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessarity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 54 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9039591b4d46..e36431f0b42c 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -65,6 +65,56 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
     }
 }
 
+// SAFETY: `usize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for usize {
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+    #[cfg(not(CONFIG_64BIT))]
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
+impl generic::AllowAtomicArithmetic for usize {
+    type Delta = usize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
+// SAFETY: `isize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for isize {
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+    #[cfg(not(CONFIG_64BIT))]
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
+impl generic::AllowAtomicArithmetic for isize {
+    type Delta = isize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as Self::Repr
+    }
+}
+
 use crate::macros::kunit_tests;
 
 #[kunit_tests(rust_atomics)]
@@ -84,7 +134,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
@@ -93,7 +143,7 @@ fn atomic_basic_tests() {
 
     #[test]
     fn atomic_arithmetic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64] |v| {
+        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.fetch_add(12, Full));
-- 
2.39.5 (Apple Git-154)

