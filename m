Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30672EFDBE
	for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273192; cv=none; b=IGsgRJGA+L9a061je2W/DiQwyz5JHm6HMJ4wHVuLR0vsgh9sDFnudMGaSE1JfFzN4UrHjXeybSsali35mGxVcCvlnZ+x70pByIat73C6OzDyaeTj15W4jEn+QcOCxBMuC1GtyvhAGiANvdWUoysmqxjy0FMiHvxlf0vuWI4dYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273192; c=relaxed/simple;
	bh=Lzovmfm5FiaEorEh9d/YkmbdKQ4FW9Q9fpLfGCU4K1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvkHc5OARgQcQvhfIGUm4bIxupBXQvmJEUl1LNrmc8KT+9qyIwMTee6/hpzxHZiMwlMN3hZOIXf1wJJIbDUnh3yv8A4RkRaTjy+qTT3f30k0s4H0UV7HIWFNJDHz6wwUmHtVaevCU2RzF3UuTVcbbclH1Zm+79EK+VOQYq8J4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJNwQaWx; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJNwQaWx"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b61161c32eso28993521cf.3
        for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273187; x=1758877987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kIwF6rXqWhVto9ZPqUAqlWxtbpHvuz3MRQbuOi5HJu4=;
        b=HJNwQaWxqLx/NViL0xwZNfNnN2P388CfQhgEU59hbajZeBdvSfsWv4hKhU4oYKjMeZ
         +eHijHMrHFIokpxcDNiiSyXGVlSpUclziiHudnZza/jDfNl7Oo+l6y6kmc4x99MJ42uT
         px6jILpv8ThSjhYLxrzjR4rP8k6WZdUUG/UUwkUotBBKPVTlbyPafaSHZKoEq4taMoTu
         ECDYRZd2+EryTzw4GIEglmjk79lzcz0hgGRznkkkfoxxUe7pB8t/odAMjK7RlIcTPj+K
         KWSiOKsO06r29D9msMvBlyll/ebcqS1jnKeH2M8teou/qvjMpMH2hE0Hm7N2vRjyGYHo
         fgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273187; x=1758877987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIwF6rXqWhVto9ZPqUAqlWxtbpHvuz3MRQbuOi5HJu4=;
        b=SRyBSpckEX8GK47BybvIVg5v58AWVpkj7qAyVvHJjCj7UUhPyndVkhvbAf5KGROUI4
         NP1A6pDbrHFFtna4Sa2RHnpIAuyr78eRHNgkAC6ACln+wvap466XM519m+t1Z9pjYgzw
         XgpjNuUZIZkrNLeHeyYRSywj8vCRn2aGhlVXWz6GVdaGcZrOG9eyuIl+5PESbl3i4zEv
         bx+kEiF2Db4XOaqUmUnPyh/prGf7Ja+ELQ1+de4YaMMMYyM9cV/Zk16xjfZXbKdIPAzt
         8sY5uZJF6zxgwYjYIdJg4uqXu8qDjgOxhqi6I16ZlknqIakI9ujIm+SpBPsNCjLP4ZQ7
         L6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVoh5LLFQxkjMbzK2zFhBd5hOhDZIMCc7CvhH155aO8QRM9zS3N32dp3y0DqC5XWxsptcyE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8CjmATwvkd1wTvhxFhDSaPrrJNjlJ6fQwXN73KqN8ynAWqpqy
	MHo4g8wu+pBgq+2/QNsjTl4sXQB6r4rRJNi88nNv/YnSRRRllf0IzE7T
X-Gm-Gg: ASbGnctXuWLQxPY4FQPV85HD6MkoHoDjUjFmZceg1MW0o11UKtxCoq/ztCfjWkTJ+p7
	hpYrX46tHVmVKh73rPavB8kC8HA3TQ58Fyiinc7CjoVmU5om1hxIvvdOgBqcqeNeTYjpkgG3knW
	5YZR7a0wVqZDYN1RVfzgSL4cA4AOM/6rb4gwKy6xN2HtHaVCCoXYckWzq9sRojq1E+DisiZxqVT
	1xxOpkZydtBK2fNx8zTM/3zfqV7oU8gkpu9P3V5tn3Jj592/dSBVusyq3PdiCEsnPa9uGHbIZzR
	yxVuhY3VjswIBuWKkHB9HQjOrnUQjYCMn5TA7Al0JwTqON12AZuWbgFsORtySXsTntc9tftZ07S
	cForeoDfm1lQFpUDr8CEQaYDcicgc7HNziSJGpSSrwGmT/BhSYhqY/DixGkv28UGJtVC/p8XrXJ
	NB3pOJDjftjL4B
X-Google-Smtp-Source: AGHT+IGADpUlc4d6GuGOP+3nLljBkz9sqj/QHSoZhghqe3A6PffXI/lWFd81SOfDZ9Hd2vishRWIPA==
X-Received: by 2002:ac8:5dd1:0:b0:4b4:96a8:f79c with SMTP id d75a77b69052e-4c073c99e35mr31025171cf.79.1758273186690;
        Fri, 19 Sep 2025 02:13:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda2c6d0c5sm26674071cf.21.2025.09.19.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:13:06 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DBC8AF40066;
	Fri, 19 Sep 2025 05:13:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 19 Sep 2025 05:13:05 -0400
X-ME-Sender: <xms:oR7NaJMN8NIqYmxob3emmAK2QMQoXI8w0UgL_7fSePTA3eCwKW1RkQ>
    <xme:oR7NaBsiOK2_J3CiVO3uKdiLh9b728UehfAyglLpUQvo5f7A2EC1cF1VtJY59qJ7y
    7J9cFT8rHp0tSYcBg>
X-ME-Received: <xmr:oR7NaGUWcuZ9Fiy3wXwYhsNRVQowuvaqTIphspswsW-n7wztpQZIgg6C6zej>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnheptedtteegjeefffeileevheeguddvleekfeeigfevgffhfeetieekgfffhfeiledv
    necuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhlohgtkh
    druggrthgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghe
    dtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhes
    fhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepphgvthgvrhiisehnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuth
    hrohhnihigrdguvgdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhonhhgmhgr
    nhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:oR7NaAQu4uJyjW7e7z1Oj2ucAAiRAfL6szDlmSejkVLIWYH6jMqy8w>
    <xmx:oR7NaMIZyAaQOOwbbEN6uiT1dXxQ6TGlNt9WJMXFo00Y4WwrXscIqw>
    <xmx:oR7NaJ38miBjo4tiIWVqaTyO9madhc_aUBbrT8L5538tgPpb9Kuc7g>
    <xmx:oR7NaHIzCujDbDjjLbzXT_1WPIgnO_P51Oe8571E7o1EQg2miLHeCA>
    <xmx:oR7NaBl1ckk6cKCh5DTnvEXjyJ23FYv3bbqfDhl7VL3UWzpt5fzE6UO6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:13:04 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@nfradead.org>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	"Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 2/4] rust: lock: guard: Add T: Unpin bound to DerefMut
Date: Fri, 19 Sep 2025 11:12:39 +0200
Message-ID: <20250919091241.32138-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Almeida <daniel.almeida@collabora.com>

A core property of pinned types is not handing a mutable reference to
the inner data in safe code, as this trivially allows that data to be
moved.

Enforce this condition by adding a bound on lock::Guard's DerefMut
implementation, so that it's only implemented for pinning-agnostic
types.

Link: https://github.com/Rust-for-Linux/linux/issues/1181
Suggested-by: Benno Lossin <lossin@kernel.org>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---

Notes:
    SubmissionLink: https://lore.kernel.org/all/20250828-lock-t-when-t-is-pinned-v2-1-b067c4b93fd6@collabora.com/

 rust/kernel/sync/lock.rs        | 5 ++++-
 rust/kernel/sync/lock/global.rs | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 27202beef90c..b482f34bf0ce 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -251,7 +251,10 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<T: ?Sized, B: Backend> core::ops::DerefMut for Guard<'_, T, B> {
+impl<T: ?Sized, B: Backend> core::ops::DerefMut for Guard<'_, T, B>
+where
+    T: Unpin,
+{
     fn deref_mut(&mut self) -> &mut Self::Target {
         // SAFETY: The caller owns the lock, so it is safe to deref the protected data.
         unsafe { &mut *self.lock.data.get() }
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index d65f94b5caf2..38b448032799 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -106,7 +106,10 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
-impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B> {
+impl<B: GlobalLockBackend> core::ops::DerefMut for GlobalGuard<B>
+where
+    B::Item: Unpin,
+{
     fn deref_mut(&mut self) -> &mut Self::Target {
         &mut self.inner
     }
-- 
2.51.0

