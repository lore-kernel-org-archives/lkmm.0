Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66395283FD8
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047333; cv=none; b=fpK1o382R617T13Iz4q9yt9uA7j4qBgGpcSw9xbCl+AKNM2WgE0CHaXSV7lT2mt8JM4QdMTgBhKLWwj1I+4YxQHU0NRZcOZ9GCp2twQMHJ2f8wPqL9WcjIG15nqmIW4XzQung94PKYiA6iLnuLy28IEpyiUtXTaLrxODkiKsY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047333; c=relaxed/simple;
	bh=XpJx8EmlQYxj2hvieb16p7MhjiUVazjqoJkBANLzcX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4Egf9n45iYGoaOTffUYurVYDUtv8b8VlSPosTjBslTHomK0V2RRjF5S8iEDxbVyG3JVt3juZ8NTYosHDW8tP86EIBHOAh5VZTUpSpVVkcc9XhSRIYgKvh7A7QnDV5IEn/5JZb/AQNRpL/v/wjT6q23W4gdFc/U/y5KR3Migt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfgxOM1i; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfgxOM1i"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e8704e9687so196733385a.1
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047330; x=1757652130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jzkDuJy3hguJhMC9EAEsLKaCQ7lEpDB4B9a9tQf3+vQ=;
        b=AfgxOM1iAdXraW1SYRJ5LKsP/VmR1qw+LhPsOwWMVkEsh58OBY3TbRYHwFdP/o48ER
         Ya9m3horv0J/mq5Rw5OJad72fU6S6+0SH6kb6DnKrhbfqZqQbwceA4J/UiudaoPZR0Zo
         jjWOhlsTIhNSRJE81wMyCtjL1Ij3oANvkKkdAXX2f4xKlT4B9Z2XY4qn/kiHV68iUqxf
         A6e2W5DsJY34yiHsTwaagy621C9ofDg+58IsY5LZTHZiTpZw74TN9abYZhzOZfMPil65
         LbjhFyFLC1MW/1G7iTve9FwIyacTgDlf502o1tJCfgBE561pDdLP8YMJFeOF0mSqjFCe
         lNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047330; x=1757652130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzkDuJy3hguJhMC9EAEsLKaCQ7lEpDB4B9a9tQf3+vQ=;
        b=jM3pAbGBEbBJH5EoPf5/nBoGqd4ykRR8V5DiMqttxD0Hbow0cSSIFu+7klQgXrC19m
         RERHAmUNP26+XTlHPzjjW3acv73IpnY9jQN4CwdsmUaWoY05f6IDHi9dKY6SRG7EM5sF
         jZuz7pAj9C6Q//SFjTXELIpChpV3DO8HHfzloGFsT4baNqU7BnrakxMeftxfFKQbx6kC
         ECy++r3G8n499YwUvpXVoFq0VqV/eDs3oIPv4zOI8ytw3+AV04xWCKTt+kKLooaT4tVM
         VJhoagxnnclqmDfo4h+zXHaUrBM5X3+PZYu65+qlborvMOXfG5FAyTiuiCe9mgOZzq7M
         p8fA==
X-Forwarded-Encrypted: i=1; AJvYcCWqJt87YbUp2/y0MO1UbEfe35kxSHlE3vVIgut4fvZ/9Zip2/SGXf30LPtHFgqHESgL3s55@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrs31iH62Q6bIxuTFjK8XIREn5Ip/40YvRjlvEPSZqmoMIafGv
	ffdT1u9VheAXhMvX6KAsWio/LzN7W6DOeQsFxJKW/51s/zdgC9JiigIe
X-Gm-Gg: ASbGnctXdx4TVeoz7gzsI3+hF2cQhk1ExdCZD2FtNlR92DSzU0ekGYU94hEgSsyjMjp
	g75nFwYJP8VOpEDaxOC16O+s0TzlqWldWHmx1ZtKNDI/M6XM+ksXKJREXJ1FW2d0kSaSyOo5lAB
	XORQOJlXJcR44XOnvC1IlxBFhSZVm/k0TaVaeXfsficj09eLfWWgp571GHaRhvaZ8OGVbI9aaKP
	Qoy7Sr6OsjMjvErDjXX1pZxLrgQrk52ZgAgWIAd4fzrXBMHpzMMOTe4Yfr+R6tE1nXXrHm0bbFX
	SPa2/y6yddUcnMjJkROYpFRgOWEY3PIft8NexbKD0SG/nSeJzkXW4ikORWDztEuE97oFDGqs3/v
	QecW9oRLP9JMxvPfnusZIpBKVuyGRA5M9HV3OIU1WmALxyQfL2+VW2zb6A5ZehPdi5Xuc+QKomV
	BgVFpwVm6JvDc5v9FMDYu6uYUgWi1e7oN1abpj9Dm4TbYL
X-Google-Smtp-Source: AGHT+IFMXSRO398LMA96TN5UtmIZck69+1ioD0dofhD06I4QR25Hund9hAN7YflKnxIU9gtTadLy8Q==
X-Received: by 2002:a05:620a:4586:b0:80a:aecb:b33b with SMTP id af79cd13be357-80aaecbb3b0mr1081912085a.55.1757047330267;
        Thu, 04 Sep 2025 21:42:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f7823casm41550161cf.42.2025.09.04.21.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:09 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7AA7EF40066;
	Fri,  5 Sep 2025 00:42:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Sep 2025 00:42:09 -0400
X-ME-Sender: <xms:IWq6aON6ITh9TERlMscmMhJTQsD3hn-Tb2Wll--tuetLXhmymDrViw>
    <xme:IWq6aOT1vrtKC2PWUNQmOk-hxbS-ukgToUH5Pa_nFaNE85xugze6xtpWgd3-eQAvC
    mJtmRY5Hy8jXYu-OQ>
X-ME-Received: <xmr:IWq6aJ6OmIL1K-pDQUfzRAgirokFuFQQEddNHCzCwP13H2RUxgYZTHNIKivvSa6LZahz-7bvJI6pioFD3ho-nf_oYNvKpGgd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpedtheffuedvfefgleeiiefffffffedvkeehvdfggeduvedvgfektddvfedvueejgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhpthhrrdgrshenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
    hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
    tghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohep
    mhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrh
    honhhigidruggvpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:IWq6aBZVetOAdRyQBmhW9nl5sHcvCDKleiQugDlN47zsBJUQFCTe_Q>
    <xmx:IWq6aNab9b0wAzYzTeQ0rXCLf6Boh_LTfEzuOryNW7cz1hgzEpCsDQ>
    <xmx:IWq6aE1lSuQY8DJ4B6e5ZHl-qJfsH8H4NJQIAy3O7q0d8HsDpbliKA>
    <xmx:IWq6aFaTaghor56sGEV84sneU3xpShdCZecbiV-V8kos7WrazFzlgw>
    <xmx:IWq6aJlWQNNnF3ZCU31rtyIlXJc1Bl1l7g_iF65OFlAAFQAc1CjZNlLN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:08 -0400 (EDT)
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
	Alexandre Courbot <acourbot@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 11/14] rust: make `Arc::into_unique_or_drop` associated function
Date: Thu,  4 Sep 2025 21:41:38 -0700
Message-ID: <20250905044141.77868-12-boqun.feng@gmail.com>
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

From: Gary Guo <gary@garyguo.net>

Make `Arc::into_unique_or_drop` to become a mere associated function
instead of a method (i.e. removing the `self` receiver).

It's a general convention for Rust smart pointers to avoid having
methods defined on them, because if the pointee type has a method of the
same name, then it is shadowed. This is normally for avoiding semver
breakage, which isn't an issue for kernel codebase, but it's still
generally a good practice to follow this rule, so that `ptr.foo()` would
always be calling a method on the pointee type.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250723233312.3304339-3-gary@kernel.org
---
 rust/kernel/sync/arc.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 63a66761d0c7..4ee155b43b2d 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -321,7 +321,7 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// use kernel::sync::{Arc, UniqueArc};
     ///
     /// let arc = Arc::new(42, GFP_KERNEL)?;
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should succeed since refcount of `arc` is 1.
     /// assert!(unique_arc.is_some());
@@ -337,18 +337,18 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// let arc = Arc::new(42, GFP_KERNEL)?;
     /// let another = arc.clone();
     ///
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should fail since refcount of `arc` is >1.
     /// assert!(unique_arc.is_none());
     ///
     /// # Ok::<(), Error>(())
     /// ```
-    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
+    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
         // We will manually manage the refcount in this method, so we disable the destructor.
-        let me = ManuallyDrop::new(self);
+        let this = ManuallyDrop::new(this);
         // SAFETY: We own a refcount, so the pointer is still valid.
-        let refcount = unsafe { me.ptr.as_ref() }.refcount.get();
+        let refcount = unsafe { this.ptr.as_ref() }.refcount.get();
 
         // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
         // return without further touching the `Arc`. If the refcount reaches zero, then there are
@@ -365,7 +365,7 @@ pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
             // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
             // their values.
             Some(Pin::from(UniqueArc {
-                inner: ManuallyDrop::into_inner(me),
+                inner: ManuallyDrop::into_inner(this),
             }))
         } else {
             None
-- 
2.51.0

