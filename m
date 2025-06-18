Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B422F49FC
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265390; cv=none; b=LqZVBkJRBHeiWS9kN7cGBaOcp3ZnNVq+gL8GH9cZJhP0wP7FlGm5UoSoY1HuCNh8LrqkctAOZre2eaadfkqRgAGxxBDUFN2qcL+KNoZ2DOhvQTYP77qUfBuQL8Je9d5V4X5dkr3Q3TbRCgoU1nIaMvdM82gRqH4AVVOu9rafvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265390; c=relaxed/simple;
	bh=/HcW3eZAjE++VugN9ilKE1n8C1cr+cpOFqBk7hSOwts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mu5HrmeegEukceLC8mLllFf5xWxh0zRaT+nhCWlqV6ENVdln4n7vgYTbpXK/BYoSGckkpCIS/eVDL8CvNFcAo3eBnc4R0MpndRQG+T+xe50929kDkdzJy6nNSZufzXg5XpHFq0UVImkNRPyQorNN1cX2ELcJFOJZdSznY4iZ69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkiLWaa4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkiLWaa4"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d38cfa9773so751381985a.2
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265385; x=1750870185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ENRbZ3eGBDLlJvyZh4O0swl7RFRKz4H+todkYakjL80=;
        b=hkiLWaa4G+5h1EkDmQVGWREBhERmXq7MXEZSTJcsSkByoytrz1/OVz9oqIHk6KxCVW
         jawm4wf1VG7q0eQqGzI7leCtNtrHAwCCbKTdSgyWfZDp4E59a4EdYm+tCPrNm7dfgnuD
         roRSIfq4gAHKS6pn7MAbVdkSKp4XRvl3J4v7stpJvCcof7aCag2fWEMJADsEpwC12p7a
         oVbSMJilkMeLLXGLlHOS0LH27rT+gOOWuORtEMoD3jTRTausa+QLqUObP0omVVr8dEZ0
         Jkmc0NGkFBU6qF57iw+IeMdXvMx+vTPyy0gxEClYXmi1rjYm7/6ja7JEfsa99Wtv1dnn
         6rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265385; x=1750870185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENRbZ3eGBDLlJvyZh4O0swl7RFRKz4H+todkYakjL80=;
        b=owaNelvgjrcSw9ZwbhQdIfsyvX8IoPrjfO01WWiqbOGbkcifVSZKa9j1j2tFCwhlFg
         +Hlccrvo3Y+IfFC1K0NWnAq7c34x45L2hh5vs5UW9Fp699c+i7xHbZU+DQx6afK46pNi
         JsFQCoLE8wNbUyemwXHcIZbht4g1kUrUzFvBumHODvLCOSdSlZrGo5rkqhwrb+h3XAAV
         t/ESwO61kG3fPMiSZQkvNttvLQAVQgO3PJKuR3JTZgEnjZgNYPjNaZiVx7DncTkcVlkD
         H3uHfBBo8u5VkRz86Uk9T4xlHrChE/P1GBiTQyqBVPgUSxb359MALjyAEbVA5/g4YJG2
         DbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+xAcYYZpyHwLBUC9wKncK2IHsF98DmSB9kbhl9fMCrScdOjBRn/+N7ea/CnEZY74TnJQ0@lists.linux.dev
X-Gm-Message-State: AOJu0YwrFOybZVhiUwvp4UIIRTfyhcnw/wD6esgxdLlZLIqjsFHI3n3e
	ioeblinq/DRYC0duRdQ7H/G5Eg+Hu/omyNzgTcPBIDZdjsWdq3uzywg0
X-Gm-Gg: ASbGncu3N5SaF8aWN40w2qnNdTLc3uQhQ5e4SMbY8AjglnT4aynksZt+QkI7UmqUotP
	uRkiY+PCWlQnCw/wsqaC89pi+ZHIJ5PEuaX8H5QTdOmveN4IYlkFnM9BdUd9AjGA9SdA/WN0yf2
	i+9xgA/lAC2jEXE4HXo6AD2jJ1CnfRUYHc1dqGTraaPS/+EZJfVXxwntFI+gDWbhm7sw3AJl458
	7hdrD/Mx/2P1A8jiwqscOjAGh+qhuSQ6kDPHVFuaMbagKhht0EMvBhzXr6aliO5sDND5qjseZvI
	5Mx39wNABHyTKL1kWICFG9CkLeXPEHI3BTnvtm3qAgHf0oEppBz0MRLqjxR35XgM6WtCzjw/e+X
	WSJmIOgDeeBm838wv3dRJcUhFmnXs7tzE1lMWfIoNezkI9IzbDg6h
X-Google-Smtp-Source: AGHT+IGC1AEyixCKYVuCrByoXCVkH0MBctNVPqJOz7FMrF9Sg12FGAUf/jdhG0AMuNCF9tEpZCrcpQ==
X-Received: by 2002:a05:620a:63c8:b0:7d3:9025:5db7 with SMTP id af79cd13be357-7d3c6c1e568mr2487575585a.20.1750265385507;
        Wed, 18 Jun 2025 09:49:45 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e28623sm784699285a.51.2025.06.18.09.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:49:45 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 95B261200043;
	Wed, 18 Jun 2025 12:49:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 18 Jun 2025 12:49:44 -0400
X-ME-Sender: <xms:KO5SaJutRO1BMWucqsHvsc5lgBXoYiJCBqZ-cBjBeXex6ZjrndJEIw>
    <xme:KO5SaCdJEXdeWRI6cUgr_kd1Kir4wlC5MAtfTK-QFZFDW4_PrYk20zRa1BP3QGMfy
    gyFjWYjhCs5L5-U1w>
X-ME-Received: <xmr:KO5SaMyHaXMIBDtIzDtkOqKhbQq_rDh2SPLdTqGzylpDwpgLuiJCP9LSIrzS6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefudeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:KO5SaAOG41Dt1WwLY6isNcW1Zid6oX6WB6XQKY2L26DvFIaJ_-gs6Q>
    <xmx:KO5SaJ-FTjzwHknR3I4n5OPq39a2WpXU3Jx2_q48JWeL7hzJt1g3rg>
    <xmx:KO5SaAVb9srMuo1WE0_tzXP4Htiv0oSTeTXW9VXZ1a6-IVFqn_jg5g>
    <xmx:KO5SaKfQ5HEP1xPtcg3HT_O32PFmUvvjGVSRK0dLFwWhtHAbI1wZAw>
    <xmx:KO5SaPeth0ZBKaYnbZzfAOfTbFjYfNd-wcw-b78yuWhV_ORIkff8EjvK>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 12:49:43 -0400 (EDT)
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
Subject: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg operations
Date: Wed, 18 Jun 2025 09:49:29 -0700
Message-Id: <20250618164934.19817-6-boqun.feng@gmail.com>
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

xchg() and cmpxchg() are basic operations on atomic. Provide these based
on C APIs.

Note that cmpxchg() use the similar function signature as
compare_exchange() in Rust std: returning a `Result`, `Ok(old)` means
the operation succeeds and `Err(old)` means the operation fails.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 154 +++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 73c26f9cf6b8..bcdbeea45dd8 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -256,3 +256,157 @@ pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
         };
     }
 }
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasXchgOps,
+{
+    /// Atomic exchange.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.xchg(52, Acquire));
+    /// assert_eq!(52, x.load(Relaxed));
+    /// ```
+    #[doc(alias("atomic_xchg", "atomic64_xchg"))]
+    #[inline(always)]
+    pub fn xchg<Ordering: All>(&self, v: T, _: Ordering) -> T {
+        let v = T::into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_xchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_xchg(a, v),
+                OrderingType::Acquire => T::Repr::atomic_xchg_acquire(a, v),
+                OrderingType::Release => T::Repr::atomic_xchg_release(a, v),
+                OrderingType::Relaxed => T::Repr::atomic_xchg_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+
+    /// Atomic compare and exchange.
+    ///
+    /// Compare: The comparison is done via the byte level comparison between the atomic variables
+    /// with the `old` value.
+    ///
+    /// Ordering: When succeeds, provides the corresponding ordering as the `Ordering` type
+    /// parameter indicates, and a failed one doesn't provide any ordering, the read part of a
+    /// failed cmpxchg should be treated as a relaxed read.
+    ///
+    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
+    /// otherwise returns `Err(value)`, and `value` is the value of the atomic variable when
+    /// cmpxchg was happening.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
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
+    #[doc(alias(
+        "atomic_cmpxchg",
+        "atomic64_cmpxchg",
+        "atomic_try_cmpxchg",
+        "atomic64_try_cmpxchg"
+    ))]
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
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
+    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg()`].
+    ///
+    /// Returns `true` means the cmpxchg succeeds otherwise returns `false` with `old` updated to
+    /// the value of the atomic variable when cmpxchg was happening.
+    #[inline(always)]
+    fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
+        let old = (old as *mut T).cast::<T::Repr>();
+        let new = T::into_repr(new);
+        let a = self.0.get().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_try_cmpchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllowAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        //   - `old` is a valid pointer to write because it comes from a mutable reference.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            match Ordering::TYPE {
+                OrderingType::Full => T::Repr::atomic_try_cmpxchg(a, old, new),
+                OrderingType::Acquire => T::Repr::atomic_try_cmpxchg_acquire(a, old, new),
+                OrderingType::Release => T::Repr::atomic_try_cmpxchg_release(a, old, new),
+                OrderingType::Relaxed => T::Repr::atomic_try_cmpxchg_relaxed(a, old, new),
+            }
+        }
+    }
+}
-- 
2.39.5 (Apple Git-154)

