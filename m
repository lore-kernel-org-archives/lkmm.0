Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40A204F9B
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471431; cv=none; b=gz7fZ4mUvaj9IbLLnqBfBAGIWvjCM0w8wo61oITrHNzKKVzkJEzURBSOAYUh208RozE5ibpc+JexOaEn79bdMz7UEOfPSw8cFb6L1lRfB7n9l+zBzS7CnCHPTC7RbKtYBM+emhj28D3Uy/x5MjXNuNwq99D0h0q61js3GsLuijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471431; c=relaxed/simple;
	bh=22djv8E6MRg4uvxlUWiDx6U/LmxxxIyjKjQ4JApsS2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XzfLaJO1JfNvdzTnRhZ2vHh/FgZpjPC9eO6w9r0x9rC9b6spghF3XMRCabAVu70V2v0q8OigRK/7YFAio0pHLaalIYogm/PrDOBfMfqKPpZVovehtglsrzDdD9bob9tQdyEKM+mZgYgca/aXbvttvnKP0bVlY5WSHFrfOPvpsGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iymdxdCE; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iymdxdCE"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e29d5f7672so60500985a.3
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471428; x=1753076228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MROVhjbXAwDJvnFQvYhC8HYg2UDwZTq9JXFvovjW0rc=;
        b=iymdxdCEqoQm7IoGE8V11GyA2wUuJ5iY2ZB3znd2D7gTogo50tXKPpvIrvqLG6mVGY
         mde2l1a6Yz7i5EwRcsXX7vxYCwGBa6b37tI/kDOo7OveCev/E5fSaRlY62Pyp/1tJGUN
         //Ul0RCrbsL30X6Rge+KFZ/mWlcXtDMsn6qAIeJargRRZ43HZZqzELmHNjpiwjJUkKLa
         /3Lml7syAJ9FiIQt0gPtommLdwUXQS8oTcLhXWs9//XMSSeRCl2iEt7DieVe2Xn6p43d
         pt01RCM3P6V4aZRFhVciq5MGgsaOrATHy/jGemeU0UmurQpfFT20VeMaKzgVoZpqKy49
         KV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471428; x=1753076228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MROVhjbXAwDJvnFQvYhC8HYg2UDwZTq9JXFvovjW0rc=;
        b=GCMKNROz1J32t9BVxYqDi4nYhmA/e+qA68IwKw0y48RrmeyF7/dWI5DVzxOhH/GpEq
         fQ2GFd9ztu4q7UXtHV+lFyTk3pZytRAEGCKyqFz1RfHoZpRB63LMUT+z4Bt+GVJgE60h
         rwrc5k8QS9xuww/Iu9mXuNNdBA8pDQV/lvNz3Lb16iwdjyKinVYjBgZhLCU2jxTW/2kK
         CV5AX2yCHvROAgia7McOBfkdeTdHbd1Sy9hi7CJUzcIgOiMcZDoeycHruHyMV0Qal+Kn
         DDlmKiXlTukoVlVe6tTqCiAIUpGE5Cbkwz/+QVGeDqdbkow1TT7Etk6D2zkaWbaAlBrI
         5TxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdRPXwAjZnKIzASSwi4AnHohCqCG4jtgOTemQ4SgDI6bIAfTnEyHFKIAfvDp+DUTxWtfeQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx062vIMBnjQepvmLozSONqWHJmsIAenrlFKz7DhjAXhpdlanku
	hVbzXDr56ImxXO2JwYBzR+HHvVtFQATiT4jy4ILHrXgvk+miqBoVlB/5
X-Gm-Gg: ASbGncvPG7vpZnrAGSb05n6kJi6wdD6JrSgO8CeCtlyqv6wEWoMXAfWIwLbAszTEkNR
	sQh0BHv7qhL/mY4ILrnNTDGQ58Ia5tETq/5z1AhdLCGZN64yu1zZ4ESIc+dwCU1CjNVsnC0gfD/
	nZHg7Erp36kTg3RDLGZD4GUo/thd7b21afIOA4PZ7OPTDlov2OZEAEKDE4GScocmTfPkyFQsEQu
	uPIW/lm9+nFMnRhfx151RZseoOlqm1DhH+TZFAdzmIHcPR2tdko3M5IjciwNNBf1cUsX6FALKJq
	JIs805hJDJ1yX+vVvhYDhgbUUMeJCDCBkxRj25Uwb1Xsj1J8SYyB6ss7hH0xWPoyIDVs5zudeXl
	cgAxq3OWkWWD2iTSNPeTzCxkHXJS1/0DoIEzsrCtC2qj5g4fzhXa+Zcfm8xPv3QLf5N/8SVbjQv
	vtXgOhaIZubQIE
X-Google-Smtp-Source: AGHT+IGK9SV++5EVXw2GaSUVUjWD8RHBJtjDLrMZ/mjy/zTXNpasmZhJ4/PiiR/6geKfjEiMm8DAPQ==
X-Received: by 2002:a05:620a:2544:b0:7d3:f17d:10c8 with SMTP id af79cd13be357-7dded1f16b8mr1723186285a.43.1752471427684;
        Sun, 13 Jul 2025 22:37:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm43764106d6.18.2025.07.13.22.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:07 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D7C7F40066;
	Mon, 14 Jul 2025 01:37:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 14 Jul 2025 01:37:06 -0400
X-ME-Sender: <xms:gpd0aEov75l1d4_sfxF_hDA5D6_-o_zA3x9qX8qpd-PulhJ-U4SoCw>
    <xme:gpd0aMIHXX1GHbf4CEFmTODNKegvFLuxUIxlG51KMxTwgGMRuEFlZgvvLT-h5IGE9
    5rbt7RDSfaNd9TGyQ>
X-ME-Received: <xmr:gpd0aNz4e5zPSSe6D7fvRqSSKOoKpVyixEhlvdOFTSbGrnxDYa1DUR0-gA>
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
X-ME-Proxy: <xmx:gpd0aLZHINlFv7lGG5e_BKiCJ1ASgQJc9veb_mpk86VExVHViv-5Dg>
    <xmx:gpd0aB5k6xrOxMyPrqByfhjpXTe2SW9udF-8ZkqYnlZr9r7ZBgX74g>
    <xmx:gpd0aECreMv_pAQLecQotRuKEV6_bSTo0VDJYsrwn6HXUcUN-qc8iA>
    <xmx:gpd0aPtz7bph0yibz_91V3MCE3zPoJiDopbIXTo9A-gj_lyurcy5gA>
    <xmx:gpd0aBvFX4BJi2ooIiN5OStEPP8g4lzDu0IoQVsJ5RYMZfNGBuiAKMxI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:04 -0400 (EDT)
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
Subject: [PATCH v7 1/9] rust: Introduce atomic API helpers
Date: Sun, 13 Jul 2025 22:36:48 -0700
Message-Id: <20250714053656.66712-2-boqun.feng@gmail.com>
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

In order to support LKMM atomics in Rust, add rust_helper_* for atomic
APIs. These helpers ensure the implementation of LKMM atomics in Rust is
the same as in C. This could save the maintenance burden of having two
similar atomic implementations in asm.

Originally-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/atomic.c                     | 1040 +++++++++++++++++++++
 rust/helpers/helpers.c                    |    1 +
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   67 ++
 4 files changed, 1109 insertions(+)
 create mode 100644 rust/helpers/atomic.c
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
new file mode 100644
index 000000000000..cf06b7ef9a1c
--- /dev/null
+++ b/rust/helpers/atomic.c
@@ -0,0 +1,1040 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Generated by scripts/atomic/gen-rust-atomic-helpers.sh
+// DO NOT MODIFY THIS FILE DIRECTLY
+
+/*
+ * This file provides helpers for the various atomic functions for Rust.
+ */
+#ifndef _RUST_ATOMIC_API_H
+#define _RUST_ATOMIC_API_H
+
+#include <linux/atomic.h>
+
+// TODO: Remove this after INLINE_HELPERS support is added.
+#ifndef __rust_helper
+#define __rust_helper
+#endif
+
+__rust_helper int
+rust_helper_atomic_read(const atomic_t *v)
+{
+	return atomic_read(v);
+}
+
+__rust_helper int
+rust_helper_atomic_read_acquire(const atomic_t *v)
+{
+	return atomic_read_acquire(v);
+}
+
+__rust_helper void
+rust_helper_atomic_set(atomic_t *v, int i)
+{
+	atomic_set(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic_set_release(atomic_t *v, int i)
+{
+	atomic_set_release(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic_add(int i, atomic_t *v)
+{
+	atomic_add(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return(int i, atomic_t *v)
+{
+	return atomic_add_return(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_acquire(int i, atomic_t *v)
+{
+	return atomic_add_return_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_release(int i, atomic_t *v)
+{
+	return atomic_add_return_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_relaxed(int i, atomic_t *v)
+{
+	return atomic_add_return_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add(int i, atomic_t *v)
+{
+	return atomic_fetch_add(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_add_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_release(int i, atomic_t *v)
+{
+	return atomic_fetch_add_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_add_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_sub(int i, atomic_t *v)
+{
+	atomic_sub(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return(int i, atomic_t *v)
+{
+	return atomic_sub_return(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_acquire(int i, atomic_t *v)
+{
+	return atomic_sub_return_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_release(int i, atomic_t *v)
+{
+	return atomic_sub_return_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_relaxed(int i, atomic_t *v)
+{
+	return atomic_sub_return_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub(int i, atomic_t *v)
+{
+	return atomic_fetch_sub(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_release(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_inc(atomic_t *v)
+{
+	atomic_inc(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return(atomic_t *v)
+{
+	return atomic_inc_return(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_acquire(atomic_t *v)
+{
+	return atomic_inc_return_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_release(atomic_t *v)
+{
+	return atomic_inc_return_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_relaxed(atomic_t *v)
+{
+	return atomic_inc_return_relaxed(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc(atomic_t *v)
+{
+	return atomic_fetch_inc(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_acquire(atomic_t *v)
+{
+	return atomic_fetch_inc_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_release(atomic_t *v)
+{
+	return atomic_fetch_inc_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_relaxed(atomic_t *v)
+{
+	return atomic_fetch_inc_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic_dec(atomic_t *v)
+{
+	atomic_dec(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return(atomic_t *v)
+{
+	return atomic_dec_return(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_acquire(atomic_t *v)
+{
+	return atomic_dec_return_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_release(atomic_t *v)
+{
+	return atomic_dec_return_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_relaxed(atomic_t *v)
+{
+	return atomic_dec_return_relaxed(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec(atomic_t *v)
+{
+	return atomic_fetch_dec(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_acquire(atomic_t *v)
+{
+	return atomic_fetch_dec_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_release(atomic_t *v)
+{
+	return atomic_fetch_dec_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_relaxed(atomic_t *v)
+{
+	return atomic_fetch_dec_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic_and(int i, atomic_t *v)
+{
+	atomic_and(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and(int i, atomic_t *v)
+{
+	return atomic_fetch_and(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_and_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_release(int i, atomic_t *v)
+{
+	return atomic_fetch_and_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_and_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_andnot(int i, atomic_t *v)
+{
+	atomic_andnot(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_release(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_or(int i, atomic_t *v)
+{
+	atomic_or(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or(int i, atomic_t *v)
+{
+	return atomic_fetch_or(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_or_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_release(int i, atomic_t *v)
+{
+	return atomic_fetch_or_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_or_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_xor(int i, atomic_t *v)
+{
+	atomic_xor(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor(int i, atomic_t *v)
+{
+	return atomic_fetch_xor(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_release(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg(atomic_t *v, int new)
+{
+	return atomic_xchg(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_acquire(atomic_t *v, int new)
+{
+	return atomic_xchg_acquire(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_release(atomic_t *v, int new)
+{
+	return atomic_xchg_release(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_relaxed(atomic_t *v, int new)
+{
+	return atomic_xchg_relaxed(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_release(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_release(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_relaxed(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_release(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_sub_and_test(int i, atomic_t *v)
+{
+	return atomic_sub_and_test(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_dec_and_test(atomic_t *v)
+{
+	return atomic_dec_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_and_test(atomic_t *v)
+{
+	return atomic_inc_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative(int i, atomic_t *v)
+{
+	return atomic_add_negative(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_acquire(int i, atomic_t *v)
+{
+	return atomic_add_negative_acquire(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_release(int i, atomic_t *v)
+{
+	return atomic_add_negative_release(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_relaxed(int i, atomic_t *v)
+{
+	return atomic_add_negative_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_unless(atomic_t *v, int a, int u)
+{
+	return atomic_fetch_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_unless(atomic_t *v, int a, int u)
+{
+	return atomic_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_not_zero(atomic_t *v)
+{
+	return atomic_inc_not_zero(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_unless_negative(atomic_t *v)
+{
+	return atomic_inc_unless_negative(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_dec_unless_positive(atomic_t *v)
+{
+	return atomic_dec_unless_positive(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_if_positive(atomic_t *v)
+{
+	return atomic_dec_if_positive(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_read(const atomic64_t *v)
+{
+	return atomic64_read(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_read_acquire(const atomic64_t *v)
+{
+	return atomic64_read_acquire(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_set(atomic64_t *v, s64 i)
+{
+	atomic64_set(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic64_set_release(atomic64_t *v, s64 i)
+{
+	atomic64_set_release(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic64_add(s64 i, atomic64_t *v)
+{
+	atomic64_add(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_release(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_sub(s64 i, atomic64_t *v)
+{
+	atomic64_sub(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_release(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_inc(atomic64_t *v)
+{
+	atomic64_inc(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return(atomic64_t *v)
+{
+	return atomic64_inc_return(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_acquire(atomic64_t *v)
+{
+	return atomic64_inc_return_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_release(atomic64_t *v)
+{
+	return atomic64_inc_return_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_relaxed(atomic64_t *v)
+{
+	return atomic64_inc_return_relaxed(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc(atomic64_t *v)
+{
+	return atomic64_fetch_inc(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_acquire(atomic64_t *v)
+{
+	return atomic64_fetch_inc_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_release(atomic64_t *v)
+{
+	return atomic64_fetch_inc_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_relaxed(atomic64_t *v)
+{
+	return atomic64_fetch_inc_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_dec(atomic64_t *v)
+{
+	atomic64_dec(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return(atomic64_t *v)
+{
+	return atomic64_dec_return(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_acquire(atomic64_t *v)
+{
+	return atomic64_dec_return_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_release(atomic64_t *v)
+{
+	return atomic64_dec_return_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_relaxed(atomic64_t *v)
+{
+	return atomic64_dec_return_relaxed(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec(atomic64_t *v)
+{
+	return atomic64_fetch_dec(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_acquire(atomic64_t *v)
+{
+	return atomic64_fetch_dec_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_release(atomic64_t *v)
+{
+	return atomic64_fetch_dec_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_relaxed(atomic64_t *v)
+{
+	return atomic64_fetch_dec_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_and(s64 i, atomic64_t *v)
+{
+	atomic64_and(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_andnot(s64 i, atomic64_t *v)
+{
+	atomic64_andnot(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_or(s64 i, atomic64_t *v)
+{
+	atomic64_or(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_xor(s64 i, atomic64_t *v)
+{
+	atomic64_xor(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_acquire(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_acquire(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_release(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_release(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_relaxed(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_relaxed(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_acquire(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_release(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_release(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_release(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_sub_and_test(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_and_test(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_dec_and_test(atomic64_t *v)
+{
+	return atomic64_dec_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_and_test(atomic64_t *v)
+{
+	return atomic64_inc_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_acquire(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_release(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_release(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
+{
+	return atomic64_fetch_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
+{
+	return atomic64_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_not_zero(atomic64_t *v)
+{
+	return atomic64_inc_not_zero(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_unless_negative(atomic64_t *v)
+{
+	return atomic64_inc_unless_negative(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_dec_unless_positive(atomic64_t *v)
+{
+	return atomic64_dec_unless_positive(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_if_positive(atomic64_t *v)
+{
+	return atomic64_dec_if_positive(v);
+}
+
+#endif /* _RUST_ATOMIC_API_H */
+// 615a0e0c98b5973a47fe4fa65e92935051ca00ed
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 16fa9bca5949..83e89f6a68fb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,7 @@
  * Sorted alphabetically.
  */
 
+#include "atomic.c"
 #include "auxiliary.c"
 #include "blk.c"
 #include "bug.c"
diff --git a/scripts/atomic/gen-atomics.sh b/scripts/atomic/gen-atomics.sh
index 5b98a8307693..02508d0d6fe4 100755
--- a/scripts/atomic/gen-atomics.sh
+++ b/scripts/atomic/gen-atomics.sh
@@ -11,6 +11,7 @@ cat <<EOF |
 gen-atomic-instrumented.sh      linux/atomic/atomic-instrumented.h
 gen-atomic-long.sh              linux/atomic/atomic-long.h
 gen-atomic-fallback.sh          linux/atomic/atomic-arch-fallback.h
+gen-rust-atomic-helpers.sh      ../rust/helpers/atomic.c
 EOF
 while read script header args; do
 	/bin/sh ${ATOMICDIR}/${script} ${ATOMICTBL} ${args} > ${LINUXDIR}/include/${header}
diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
new file mode 100755
index 000000000000..45b1e100ed7c
--- /dev/null
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -0,0 +1,67 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+ATOMICDIR=$(dirname $0)
+
+. ${ATOMICDIR}/atomic-tbl.sh
+
+#gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, int, arg...)
+gen_proto_order_variant()
+{
+	local meta="$1"; shift
+	local pfx="$1"; shift
+	local name="$1"; shift
+	local sfx="$1"; shift
+	local order="$1"; shift
+	local atomic="$1"; shift
+	local int="$1"; shift
+
+	local atomicname="${atomic}_${pfx}${name}${sfx}${order}"
+
+	local ret="$(gen_ret_type "${meta}" "${int}")"
+	local params="$(gen_params "${int}" "${atomic}" "$@")"
+	local args="$(gen_args "$@")"
+	local retstmt="$(gen_ret_stmt "${meta}")"
+
+cat <<EOF
+__rust_helper ${ret}
+rust_helper_${atomicname}(${params})
+{
+	${retstmt}${atomicname}(${args});
+}
+
+EOF
+}
+
+cat << EOF
+// SPDX-License-Identifier: GPL-2.0
+
+// Generated by $0
+// DO NOT MODIFY THIS FILE DIRECTLY
+
+/*
+ * This file provides helpers for the various atomic functions for Rust.
+ */
+#ifndef _RUST_ATOMIC_API_H
+#define _RUST_ATOMIC_API_H
+
+#include <linux/atomic.h>
+
+// TODO: Remove this after INLINE_HELPERS support is added.
+#ifndef __rust_helper
+#define __rust_helper
+#endif
+
+EOF
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
+done
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic64" "s64" ${args}
+done
+
+cat <<EOF
+#endif /* _RUST_ATOMIC_API_H */
+EOF
-- 
2.39.5 (Apple Git-154)

