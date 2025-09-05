Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E71274676
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047323; cv=none; b=YFSayNhfXEXsQLCr4ZB+0I5s1u5isrh1hKO0v6n+eVG/skA763AW9ohLVC2xpkwEZY4yD84sNLCmx4eV5YwvlZKHj5qAzGJvL6ksdIxmGnaXiVsdLSjtzltDxqxJzDSpYOiTnJZzoLZ4YCmobVJXhUKQpNI17CxsKZaHmZkC5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047323; c=relaxed/simple;
	bh=IBH/7c5OA81vIf94Rb3y1vACEExY487/hrGhaotRakk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCZHdqUUtUlpWQ3O/qDHCWiLeUlsxQxvwNJy/Nrda3dzuaCCb3/BUwtb5xwk4rcLT3ZRZ5csIkMitGz1TVicX6P7kL4gZLXJV+o9BFEqPNMqZ/jnrhfLJSNb4BZhDY+/CXtiP7LycifNdD6ysfBAaWIJsliYX+q4sIzx9gzq/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5pT8mwL; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5pT8mwL"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-811dc3fdc11so3298985a.2
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047320; x=1757652120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxj5+q/wi1EEIV3uflNsmKGakJkrGos7VyNN4PUIgkc=;
        b=L5pT8mwL1zn2PlcEwq7K0lIiQuwcuGZv5TTugsjhlWgHAG/BeWd0AlKcddFct301qq
         U008J0fWomBuyEtLX2eqwidK1bEBcXKU+KTbppXZFVagcH+EzMEXNDp6ui3CrzZB7Frs
         muNU8GT0eKvaG78Pl+8emnlVM8K6jSqHNU8Ok+M3cm8yF0sNItGE4YvAdsWyRnDB9VGp
         cA53z+dgoigv/KthA+bR6kcdyiyv65d0lqoUlr1zQggxi520xPplcEdpw94R+F6CfZcE
         gJ4TzRoL+gFgCb2jym9oAGQcQaseegEQvSAZhrA0JL3x967NOnCti3KXv7IaTGv/JxEd
         88XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047320; x=1757652120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxj5+q/wi1EEIV3uflNsmKGakJkrGos7VyNN4PUIgkc=;
        b=YsIKJuxqgO14jgpEoO08ZNqYCpXXmRcNsYrHDQHy/Rg05wgH3CWQbFRHBv7b2MidxC
         p6O2Gw3zy7zPxyUr3GEpHQUNKGHisesStUTV6+aS0kD8BvgFRXoeFi1WxDVRBzJr5k9R
         gdMdsptDj8bn2ivNHrxeqXF+XzY60l1hV53oir1WrU+pvL1li3sfZbY0VTwz9Xp8JDHB
         U/qzEkeLXVzFxBFhUcQCNe4oWVqV8GEwL7gKlXi+lgXYXeWOiDkz/JvNcEXerbgarOCG
         n99aie27sR8tBFDz+ZsYawgSEWDlqcRP1nR1oGGf5MUApGsMW6RSzp8DtAFCu1MJzApl
         gK+g==
X-Forwarded-Encrypted: i=1; AJvYcCWU4DmKozJoShaJzl63QanCZpxzEdASnk1kodsbP7hJWsAJy84PpSvMo/jMeQHCzjGaVtEC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3StNXeQfCRieHjwwtY3aQCjAhOP+6wAeUGW2/Z1iuMDd6C4Kw
	BWzQJ8o4W7PDWGH6xFooUquQyar0xN0N+676DER+OVVaLmrHQt0qES+f
X-Gm-Gg: ASbGncuhYKkNOod2JVVuyzO4qVSTDDvad4f4XWPVzS19kHliBijeUbpc0r/78nQSfr7
	4vxZcYg00HiwYyIX+3OLxmCEQ29S5dmJQzDzWy3XVFH8fvShdL1WOD0au3LOk+HyyznfwXVHazu
	3GdE+0HeexHyTXNzcCUDGcy/t8rz23te67oG15Kdkux7G9y0QcW9XEYqVapCF7mTkrlbR28O2Nr
	HF1m5OwrdMgOK1AiI8lPo5NRkDrHIFswQ1W+STGAYbnH7yCy66koyXw3EQd0NiEc+7YwztRW+1C
	Dei3AJok+Ju3X1T0VGQNuILSFPf9fHQLLcLzqLERqfYDc3UXMY9dXSqSYc1h0ywHRyJ0KW6ySIR
	IbnqeFT5cC4v/QOGHrZaOssZK/uLGOEGubxvs0ncDgn4reHcjTu6VpLIbtsj8i23yHRiScBngzK
	3f5MZ4Rg4T2HMMNP4ywiv/prY=
X-Google-Smtp-Source: AGHT+IFKmZc4uZKTRgB9qy2DhejDBav+d+rC2VvVWbo4Zor+AO0lz6l84VGTdQx0ZU8UB0k4mKuGww==
X-Received: by 2002:a05:620a:2988:b0:802:d9eb:fbb4 with SMTP id af79cd13be357-802d9ebfdedmr2096784585a.10.1757047320406;
        Thu, 04 Sep 2025 21:42:00 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa6e4c981sm411623185a.21.2025.09.04.21.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:00 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 90CBEF40066;
	Fri,  5 Sep 2025 00:41:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 05 Sep 2025 00:41:59 -0400
X-ME-Sender: <xms:F2q6aC_m7Yv6gQziLdlm-MNp-qC5Q18_BGbHtV8NbS0uKKJH7qaaLw>
    <xme:F2q6aAYjgU8nqlEMijcWws-UVPKBeinwRsk0VXJgIGv1sx6k-VgPhndGXNlawfhIh
    T7LUQp1Dg3UASkfbw>
X-ME-Received: <xmr:F2q6aJw3brBdNI_EJCxbruz-rcIk8Y85UlrR_dfTyMhoQm10rZp_x4HjrgDyvtbA3lFMvsHjMZCsLOjeTfluWK2vrpofTufU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfehieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepudenuc
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
X-ME-Proxy: <xmx:F2q6aG-OHyx__s3ZfSnjxN8OMJuL-Zk4l9Vid3Cmd8XZv9e-l86UMQ>
    <xmx:F2q6aNz1FnR1cUE69PKph3VbEJnbnvym0VRpqMNZTtYjZLp9nqgw7g>
    <xmx:F2q6aDt4RIfYJnYCktIaeCIpGwIgpVNvyDqIk-pJVtAjMdMv16ldUg>
    <xmx:F2q6aE3nnuanjy5kQkHrcTCkJ_yhdwWg9gMVvmM_KNy5guQgKRe2tg>
    <xmx:F2q6aH63LXUc1MOSWa_ZH0oCZL8IBnoSga792tTlcRoAU5BB1LokhcXr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:41:59 -0400 (EDT)
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
Subject: [PATCH 05/14] rust: sync: atomic: Add atomic {cmp,}xchg operations
Date: Thu,  4 Sep 2025 21:41:32 -0700
Message-ID: <20250905044141.77868-6-boqun.feng@gmail.com>
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

xchg() and cmpxchg() are basic operations on atomic. Provide these based
on C APIs.

Note that cmpxchg() use the similar function signature as
compare_exchange() in Rust std: returning a `Result`, `Ok(old)` means
the operation succeeds and `Err(old)` means the operation fails.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250719030827.61357-6-boqun.feng@gmail.com/
---
 rust/kernel/sync/atomic.rs | 168 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 167 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index ea5782b6ee95..4c32d12dc61e 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -25,7 +25,7 @@
 pub use ordering::{Acquire, Full, Relaxed, Release};
 
 use crate::build_error;
-use internal::{AtomicBasicOps, AtomicRepr};
+use internal::{AtomicBasicOps, AtomicExchangeOps, AtomicRepr};
 use ordering::OrderingType;
 
 /// A memory location which can be safely modified from multiple execution contexts.
@@ -293,3 +293,169 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
         }
     }
 }
+
+impl<T: AtomicType> Atomic<T>
+where
+    T::Repr: AtomicExchangeOps,
+{
+    /// Atomic exchange.
+    ///
+    /// Atomically updates `*self` to `v` and returns the old value of `*self`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.xchg(52, Acquire));
+    /// assert_eq!(52, x.load(Relaxed));
+    /// ```
+    #[doc(alias("atomic_xchg", "atomic64_xchg", "swap"))]
+    #[inline(always)]
+    pub fn xchg<Ordering: ordering::Ordering>(&self, v: T, _: Ordering) -> T {
+        let v = into_repr(v);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_xchg*()` because `v` is transmutable to
+        // `T`.
+        let ret = {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_xchg(&self.0, v),
+                OrderingType::Acquire => T::Repr::atomic_xchg_acquire(&self.0, v),
+                OrderingType::Release => T::Repr::atomic_xchg_release(&self.0, v),
+                OrderingType::Relaxed => T::Repr::atomic_xchg_relaxed(&self.0, v),
+            }
+        };
+
+        // SAFETY: `ret` comes from reading `*self`, which is a valid `T` per type invariants.
+        unsafe { from_repr(ret) }
+    }
+
+    /// Atomic compare and exchange.
+    ///
+    /// If `*self` == `old`, atomically updates `*self` to `new`. Otherwise, `*self` is not
+    /// modified.
+    ///
+    /// Compare: The comparison is done via the byte level comparison between `*self` and `old`.
+    ///
+    /// Ordering: When succeeds, provides the corresponding ordering as the `Ordering` type
+    /// parameter indicates, and a failed one doesn't provide any ordering, the load part of a
+    /// failed cmpxchg is a [`Relaxed`] load.
+    ///
+    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
+    /// otherwise returns `Err(value)`, and `value` is the current value of `*self`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// // Checks whether cmpxchg succeeded.
+    /// let success = x.cmpxchg(52, 64, Relaxed).is_ok();
+    /// # assert!(!success);
+    ///
+    /// // Checks whether cmpxchg failed.
+    /// let failure = x.cmpxchg(52, 64, Relaxed).is_err();
+    /// # assert!(failure);
+    ///
+    /// // Uses the old value if failed, probably re-try cmpxchg.
+    /// match x.cmpxchg(52, 64, Relaxed) {
+    ///     Ok(_) => { },
+    ///     Err(old) => {
+    ///         // do something with `old`.
+    ///         # assert_eq!(old, 42);
+    ///     }
+    /// }
+    ///
+    /// // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
+    /// let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
+    /// # assert_eq!(42, latest);
+    /// assert_eq!(64, x.load(Relaxed));
+    /// ```
+    ///
+    /// [`Relaxed`]: ordering::Relaxed
+    #[doc(alias(
+        "atomic_cmpxchg",
+        "atomic64_cmpxchg",
+        "atomic_try_cmpxchg",
+        "atomic64_try_cmpxchg",
+        "compare_exchange"
+    ))]
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: ordering::Ordering>(
+        &self,
+        mut old: T,
+        new: T,
+        o: Ordering,
+    ) -> Result<T, T> {
+        // Note on code generation:
+        //
+        // try_cmpxchg() is used to implement cmpxchg(), and if the helper functions are inlined,
+        // the compiler is able to figure out that branch is not needed if the users don't care
+        // about whether the operation succeeds or not. One exception is on x86, due to commit
+        // 44fe84459faf ("locking/atomic: Fix atomic_try_cmpxchg() semantics"), the
+        // atomic_try_cmpxchg() on x86 has a branch even if the caller doesn't care about the
+        // success of cmpxchg and only wants to use the old value. For example, for code like:
+        //
+        //     let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
+        //
+        // It will still generate code:
+        //
+        //     movl    $0x40, %ecx
+        //     movl    $0x34, %eax
+        //     lock
+        //     cmpxchgl        %ecx, 0x4(%rsp)
+        //     jne     1f
+        //     2:
+        //     ...
+        //     1:  movl    %eax, %ecx
+        //     jmp 2b
+        //
+        // This might be "fixed" by introducing a try_cmpxchg_exclusive() that knows the "*old"
+        // location in the C function is always safe to write.
+        if self.try_cmpxchg(&mut old, new, o) {
+            Ok(old)
+        } else {
+            Err(old)
+        }
+    }
+
+    /// Atomic compare and exchange and returns whether the operation succeeds.
+    ///
+    /// If `*self` == `old`, atomically updates `*self` to `new`. Otherwise, `*self` is not
+    /// modified, `*old` is updated to the current value of `*self`.
+    ///
+    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg()`].
+    ///
+    /// Returns `true` means the cmpxchg succeeds otherwise returns `false`.
+    #[inline(always)]
+    fn try_cmpxchg<Ordering: ordering::Ordering>(&self, old: &mut T, new: T, _: Ordering) -> bool {
+        let mut tmp = into_repr(*old);
+        let new = into_repr(new);
+
+        // INVARIANT: `self.0` is a valid `T` after `atomic_try_cmpxchg*()` because `new` is
+        // transmutable to `T`.
+        let ret = {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_try_cmpxchg(&self.0, &mut tmp, new),
+                OrderingType::Acquire => {
+                    T::Repr::atomic_try_cmpxchg_acquire(&self.0, &mut tmp, new)
+                }
+                OrderingType::Release => {
+                    T::Repr::atomic_try_cmpxchg_release(&self.0, &mut tmp, new)
+                }
+                OrderingType::Relaxed => {
+                    T::Repr::atomic_try_cmpxchg_relaxed(&self.0, &mut tmp, new)
+                }
+            }
+        };
+
+        // SAFETY: `tmp` comes from reading `*self`, which is a valid `T` per type invariants.
+        *old = unsafe { from_repr(tmp) };
+
+        ret
+    }
+}
-- 
2.51.0

