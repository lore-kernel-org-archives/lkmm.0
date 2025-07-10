Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33BB296173
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752127263; cv=none; b=nZTHDZU51goncoqDb41/1Qk2blzUKEibCcOjpSIWGHeBS00NT6JIDE5yyZRljRMbEA2rgKl+DZ5hfgu9gdNpZgT6zR7wZPOre72AfkC+uIB0/1q3J0J+0scQT8PRx0BKebBdVwzmJ9zgM7aqccpriQjU7s6xml+fnVCO3M9OCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752127263; c=relaxed/simple;
	bh=clBkOKdOt3OPliSRUnnc9ikSUOgMniGHVGWMvtSIp5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z1R4ZXlQ0BcgvI1vIoZaF63pAxl13QNOxSy7O+F7jzgeyqzfBONzPAzBJ/lhDsbAz3hEPeJIMsssMb7siwGPe6ZrjL3Lkh5iE+Zu++IRxy5P8vmu2z2WOLKiRxno62QV+rRMLGjrBsIy+Iy78o9mLcqes+FgOoZ1n/KFxmTe8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRx3LRBK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRx3LRBK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a52d82adcaso9346691cf.0
        for <lkmm@lists.linux.dev>; Wed, 09 Jul 2025 23:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752127258; x=1752732058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4dkxON11nGIA5NYLSI97c5y67hFYtsqVKB22BPIBIMA=;
        b=dRx3LRBK0zCnIc5+nOBlBS4/DTuxrHvo+eB4cB3LH6FvSwzLCHdq2EeuPgqsjbUgeP
         hOGWcyQfI7wKL+LL+QLcE/Yn6586QCX0tNQXm0xZfaTa0b9nRtA2EinH4+9CLhToVmaI
         YtptpRB3gvb5mWuAWwX4QvW7/UHLtqtIqXtuVrkPjfUvFz47O9ZKYxxb+US5s95JPRAd
         TS1usGzbuvzUg9StEyYy7OkjWniRvW8lmZKI0VFi1k8QcNKI2ZYqq8xRv15i7xQ1vTxQ
         OY7kmfWiogKFLysNEnDlK/cZcDoQjka90ivNucYaQ0Ax5iduJ0ec3aFt47xbbbuCLee6
         RQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752127258; x=1752732058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dkxON11nGIA5NYLSI97c5y67hFYtsqVKB22BPIBIMA=;
        b=WwM0+PQ5CzjT/hNBLpkcibHfcMEEv/QVZwpVIbGChGdPVomiHuItwopf6b4egW1BaC
         UhsMbHFB1pHIo2MHrnQhwe9zrB9urQIhNwydsmQCt/Dh7H1+UJJO2vjffyou1w5fMZLr
         ZHgI6BTZ+0z3JuMl8TrBIEiWJBiFTD6ONXJTHnK6A66Lajo9b4/wEtU1tqjV5m4MeYsV
         q4Tv13Uh+HEQWypIYSEIOIhrelnOit/Q69KTaI3zGc9o5dSptNjuN4NYfaGXfPoGG1EO
         NDrtSGF6aVj8kQ3zGti5Ke+9OapyVuDKZIEHncm1VUL589Nibc40JR9HuJV96CxqwS3b
         0YVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlxjqmYl4RqNbKjZs5u2pL5vLV+dA+Eoiqzus7cM+MIwApT9Crq9A8SMxW53HdNQp4ooxe@lists.linux.dev
X-Gm-Message-State: AOJu0YyajZhQa0l9gAvEqNUZ/oHnhR6MfZvivr3Xc9jLXENdUgT2JBNG
	FyBmdrs99FvXqt8ALB+lfHgFq2s8kHrsKe6MKwEp2oU3aYWpnk+VoHIg
X-Gm-Gg: ASbGncuOaUvCKMrUFd/GwBOZvW+rVKJMaZmT6oKESv9R+eEf/AwwaPpwjzL3BCOExJN
	ckqo/23Z+4nfFFtA0EUiP+yopSa6XddtV7zVVws5loJSKu9RsEVBzSOHh6Yr0yzvIi3fom+S+Qj
	ET1FwyPwMF/DxVhbVjLxJ5L4WkOPLr68pRXf6KqAeOZw43NetHlBrAW8AkySS9lPgdGe5m3GrKo
	MsxumDvBB5KqLvA0x0voPN5y6EuhZB8DOd+jLkXW+qBZOZuHhnghgfRG1kJrq3RhOBLCc1HpCek
	wtfzPDdxWCFCiQXJkDBJhZFCS6UTuA+/DHMEjNyrv2XEklOnEHVKyqsxpBvlJuRvyqz7hP02WQP
	VQy+Gq5JAk1byiP6nbd27qoz3cRneIZtLLUxuTJlYb4yIg4pbskup
X-Google-Smtp-Source: AGHT+IEk0zas89MOBG4S4eZCmPaCtlBUN7QCZh+Pr6ROSTJbtHRJobeIQcYI59LjAeJh/0WNTD+zIA==
X-Received: by 2002:ac8:7c55:0:b0:494:7e91:eb4d with SMTP id d75a77b69052e-4a9ec85346cmr14881931cf.51.1752127257573;
        Wed, 09 Jul 2025 23:00:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc201b0sm5611561cf.14.2025.07.09.23.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:00:57 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 58A87F4006C;
	Thu, 10 Jul 2025 02:00:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 10 Jul 2025 02:00:56 -0400
X-ME-Sender: <xms:GFdvaKj-HoCkhDVpCKIv6t4kDdrR23Y7gUz1c9P5NYxFZ_CudURyCQ>
    <xme:GFdvaMjGriLVVArgyY8EpZlqguxdESxVQmFoBDvlLWtUI-vUXKUog-dkswr5MuWIC
    yNlU3BhDtFSk_Pd0A>
X-ME-Received: <xmr:GFdvaGqycb-fBnUpoQUQJ-tw48iKp-zYzbX7HlOS2CDlhSNwE0i7YP119Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhu
    giesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
    hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:GFdvaCzdXbM5uJkcGYM_EKoUBhcK6m64V49ohJLpKWMOqk3Pz_gUFQ>
    <xmx:GFdvaFwLNHjqZCG7vTNDMSqoUIRr7ChOC_hKUNu5MiJSQFO5lpKmVw>
    <xmx:GFdvaKaU0bpodEj2bR4fbWfGGWxzl5OuZHEsZK4rloOAqJcMl4UXjA>
    <xmx:GFdvaGl4giPw6wG-au7OmvlEsY4FCHK8rkX5o9fwiawnG3WJK6W80w>
    <xmx:GFdvaPF7NWMB1mFzoW8RmnJxkJIzetKaOSGFWzFHKVaXrKLcVN1mOjFr>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 02:00:55 -0400 (EDT)
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
Subject: [PATCH v6 0/9] LKMM generic atomics in Rust
Date: Wed,  9 Jul 2025 23:00:43 -0700
Message-Id: <20250710060052.11955-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the v6 of LKMM atomics in Rust, you can find the previous
versions at:

v5: https://lore.kernel.org/rust-for-linux/20250618164934.19817-1-boqun.feng@gmail.com/
v4: https://lore.kernel.org/rust-for-linux/20250609224615.27061-1-boqun.feng@gmail.com/
v3: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-1-boqun.feng@gmail.com/
v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/
v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

I dropped the support for atomic pointers for now
(Atomic<{isize,usize}> still exists), because further more work is
needed to ensure the implementation could preserve provenance [1]. And
we already other series depending on atomics [2], so it makes sense to
get some basic support in-tree.

Peter & Ingo, I take it that it's OK for me to send a PR to tip later
this week or early next week if things went well? Of course, any
feedback is welcome!

Changes since v5:

* Replace `as` cast with `ptr.cast()` in atomic/ops.rs per the
  suggestion of Andreas.
* Explicitly document `Acquire` and `Release` ordering definition per
  the suggestion of Peter.
* Rename `All` to `Any` for ordering accept traits per the suggestion of
  Andreas.
* Remove unnecessary fields in `AcquireOrRelaxed` and `ReleaseOrRelaxed`
  per the suggestion of Gary.
* Add round-trip transmutability (thanks Benno) as the safety
  requirement of `AllowAtomic` per discussion with Gary and Benno.
* Add doc alias for xchg() and cmpxchg() per the suggestion of Benno.
* Examples and documentation improvement.
* Applied Reviewed-by tags from Alice and Andreas.

[1]: https://lore.kernel.org/rust-for-linux/aGg4sIORQiG02IoD@Mac.home/
[2]: https://lore.kernel.org/rust-for-linux/20250709-module-params-v3-v16-1-4f926bcccb50@kernel.org/

Regards,
Boqun

Boqun Feng (9):
  rust: Introduce atomic API helpers
  rust: sync: Add basic atomic operation mapping framework
  rust: sync: atomic: Add ordering annotation types
  rust: sync: atomic: Add generic atomics
  rust: sync: atomic: Add atomic {cmp,}xchg operations
  rust: sync: atomic: Add the framework of arithmetic operations
  rust: sync: atomic: Add Atomic<u{32,64}>
  rust: sync: Add memory barriers
  rust: sync: atomic: Add Atomic<{usize,isize}>

 MAINTAINERS                               |    4 +-
 rust/helpers/atomic.c                     | 1040 +++++++++++++++++++++
 rust/helpers/barrier.c                    |   18 +
 rust/helpers/helpers.c                    |    2 +
 rust/kernel/sync.rs                       |    2 +
 rust/kernel/sync/atomic.rs                |  193 ++++
 rust/kernel/sync/atomic/generic.rs        |  567 +++++++++++
 rust/kernel/sync/atomic/ops.rs            |  195 ++++
 rust/kernel/sync/atomic/ordering.rs       |   97 ++
 rust/kernel/sync/barrier.rs               |   65 ++
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   67 ++
 12 files changed, 2250 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/atomic.c
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/generic.rs
 create mode 100644 rust/kernel/sync/atomic/ops.rs
 create mode 100644 rust/kernel/sync/atomic/ordering.rs
 create mode 100644 rust/kernel/sync/barrier.rs
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

-- 
2.39.5 (Apple Git-154)

