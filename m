Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FF190067
	for <lkmm@lists.linux.dev>; Mon,  9 Jun 2025 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509196; cv=none; b=J/t5JRHfce+RbGIV+BTKWxxk5eMfA4Ut42C3cZO6IdcCzKfrNp3FlcARv7hA5JRCfiofFnrGZY3TjnIEXSuFpuqP/S18QAuKlyrD8bixtdgcpXkUVNkAmh/ZOR3qtNEuEDLAffvMpbO3rWuVSsuzQFB89QKEcazB75XaBaWWnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509196; c=relaxed/simple;
	bh=IEqm1JdCJmQGuOAMdzOGJLauECy2w663mdnt4zkoHAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CNALqzvnLVyIO8kYqVQIMZh2MBsagzc17pOXdo/DvQ5T2oUupQqV3HojHOZtZpcHf9rJ2R4Hbh+97QLgQ8MH57RB4G/Yfu9geu7bKiHjQ+8JUrF3H7nUbP1PYhofpUsbEt/Uj7ZmB1XL5IOrquKiA4GhPTcfV+X2vRIUSkYuGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRNpe3uP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRNpe3uP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so518203085a.1
        for <lkmm@lists.linux.dev>; Mon, 09 Jun 2025 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509193; x=1750113993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V5UGBtq13GxPtnNntFLWLuUNWSuRazB9K2mUu5fyq/A=;
        b=hRNpe3uPM1mPNbgQAlvVCnc69dB+YovHEkwSFYprU7QFXYzmaZB3aq0YGHZlWXoUkf
         KJihouY6QMEbjmi5uqtKZC0/zs15uDllYzdimfHX5l/L94ryaXfjNYnqqDLX7+gqJ2Fx
         DdRuM99m31KhTku8OfNEPN2tVJ94VsC/ogtTFrPDZ+VkDcEq/F8yLAv9HcxyWkp1CWKX
         g1TzcNST3b6CAg5ewQZd+pkYVjLuj1VWcJQKm3k6PtO+NRGEFWDVNbAH46xrtg304PtE
         s3uoz7/zXzH/ysu8FJdl9WmoqwJHrIh6iIksiunjcALgPHnQ9dMrGB9ozJAEq9S671Vx
         jkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509193; x=1750113993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5UGBtq13GxPtnNntFLWLuUNWSuRazB9K2mUu5fyq/A=;
        b=Eu8cwdZvV3CKGsWSwB9CgVfeRy4lrq1Qr15Qr8BhmJvSVa3jZ16Gy6evK4xR/YeyYF
         esNxjiWAny8BfeZxulQP/xlTYM+ctKugqLGvA0h0NPhX5YUaM+jkmDxx2h9ieSmPJ9v0
         DtZP4XrBQd4wL3to9IrFd/0inrqLgIopBcknlgBXx70eQyM+caReWV97sfu3pfikZEXL
         a5qD0CAdRGDl+Cf//kPn46Zt1Ug6rdA3j/grDFjg4P9DXXhfsLMVSMywWjZW73CL7Nda
         Qp347yFDB1EvmzoE9oAkQZ/VaJwU+5DbegX9Z1aAMxd1BlXp6Ikd9lHKyWJ01lloTEX7
         IKLg==
X-Forwarded-Encrypted: i=1; AJvYcCXBQmpIfv9hnzVPaObCUe2mrmBaCIVjlyi29Ors4lWqAYvmFXj+h/6QJmeMlTnSwjA7tivl@lists.linux.dev
X-Gm-Message-State: AOJu0YwJiXY7vCVHdCFif9YCJV8pZRvV7uSGENtmcejPRAZxGM3D0x+Y
	T4RIc8hVR12HPyU2xpkqNDL9XSNB59tZHlVjjctpJEcCz7tTn46s2gtF
X-Gm-Gg: ASbGncuOrqCsou6e7gDx1ttbixB/Y+LhwWeWHU/bakd9Eq0WTn48e09pLaijl5LB3OU
	zsWoBxDd3yjx9lJ6gF16KTk8U6d4J9Il1fjMspKEUXlkunMH5hmffKRbPQoiUhTR74O5eDAzm+8
	DN+7qsqrg/M08SG3LOM+7ZU1wnisLqp3A8bR1TAl0GGwEguO5FdOnxVKnh+FyG5lfzsS1or4Opg
	To3eUQbj6k9vKmjaaI4QuEddL+IPi6Ufk7V0BIwYMzvySbqL94cRTdZN7jnCfI7Pdy+cL6rDvJV
	+9RkXCjWie529mhE879I2L2BC2Z/74HpwFVKk5CqBB4svCoQQQ4IpQfcw6iRFEK3fKmI6I4hNH5
	Lo2A9X60HFFFqHIqx2SqIMtkGEN7jwc3t2ii/i+87c8YZCZUpW23A
X-Google-Smtp-Source: AGHT+IENOpjPB1yljzfiMwwSApPRUkLli1+qtSLEn+wxBrXU5IyRAiAyOKuFF67UnXoHNcSDCEwJLg==
X-Received: by 2002:a05:620a:4405:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d39d8a98c1mr206503185a.9.1749509192780;
        Mon, 09 Jun 2025 15:46:32 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d250f64b80sm600930285a.23.2025.06.09.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:46:32 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9CB111200043;
	Mon,  9 Jun 2025 18:46:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 09 Jun 2025 18:46:31 -0400
X-ME-Sender: <xms:R2RHaDFX-ayTKY_XEAtPlRZLaUJcmcTzMNqXxYt5tMIOMw2ZbL2Qhw>
    <xme:R2RHaAVCotEba3hJ6wiE7eELRHOlN9cNpkq0idcja6IhRYZ5l-G79l5j5_Y7grJlA
    AmDgu-D6WnfWHcCSA>
X-ME-Received: <xmr:R2RHaFLyYjOrAK9AajBPQlvBK38jrTtlHgECn4abbmDU9j_ozl9mBvgLZI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeggeeukeeghfevudektdevjeehhfekffevueefudei
    vdelteeltdekheejgfeiveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhu
    gidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
    lhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhn
    fegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:R2RHaBFFUoumlD9FVwR97VsnRb_VGE5ZjMU2O_H7o1alcLDtmh6-Tw>
    <xmx:R2RHaJVyBOKURSgIPW_MM4HpqdtbuOrjj2f8vRhRXqQz_Bz6n5bsfQ>
    <xmx:R2RHaMNDGZOUKtvkKEOaibtuuXJlhTBJb_R3RMYe2Rna5oYj4Dvm_A>
    <xmx:R2RHaI2dBFkwHzWUnlTwZ93d9ieuVEvXRJI2eOsDr0qkFL8cJraYOA>
    <xmx:R2RHaOWPMJkRRQo2mlVml8cuv0Ggdgy91zrVbjFfdtJApm9qDyX-HE-k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 18:46:31 -0400 (EDT)
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
Subject: [PATCH v4 00/10] LKMM generic atomics in Rust 
Date: Mon,  9 Jun 2025 15:46:05 -0700
Message-Id: <20250609224615.27061-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v4 for LKMM atomics in Rust, you can find the previous versions:

v3: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-1-boqun.feng@gmail.com/
v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/
v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

The reason of providing our own LKMM atomics is because memory model
wise Rust native memory model is not guaranteed to work with LKMM and
having only one memory model throughout the kernel is always better for
reasoning.


I haven't gotten any review from last version but I got a few feedbacks
during Rust-for-Linux weekly meeting. I trimmed two more patches to make
the current series easier to review, the current version includes:

* Generic atomic support of i32, i64, u32, u64, isize and usize on:
  * load() and store()
  * xchg() and cmpxchg()
  * add() and fetch_add()

* Atomic pointer support on:
  * load() and store()
  * xchg() and cmpxchg()

* Barrier and ordering support.

Any missing functionality can of course be added in a later patch. There
are some use cases based on these API can be found at:

	git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-dev

for example, RCU protected pointers and AtomicFlag.

I think the current version is ready to merge (modulo some documentation
improvement), and I would like to postpone small implementation
improvement because we are seeing growing usages of atomics in Rust
side. It's better to merge the API first so that we can clean up and
help new users.

But I do have one question about how to route the patch, basically I
have three options:

* via tip, I can send a pull request to Ingo at -rc4 or -rc5.

* via rust-next, I can send a pull request to Miguel at -rc4 or -rc5.

* via my own tree or atomic (Peter if you remember, we do have an atomic
  group in kernel.org and I can create a shared tree under that group),
  I can send a pull request to Linus for 6.17 merge window.

Please advise.

Regards,
Boqun

Boqun Feng (10):
  rust: Introduce atomic API helpers
  rust: sync: Add basic atomic operation mapping framework
  rust: sync: atomic: Add ordering annotation types
  rust: sync: atomic: Add generic atomics
  rust: sync: atomic: Add atomic {cmp,}xchg operations
  rust: sync: atomic: Add the framework of arithmetic operations
  rust: sync: atomic: Add Atomic<u{32,64}>
  rust: sync: atomic: Add Atomic<{usize,isize}>
  rust: sync: atomic: Add Atomic<*mut T>
  rust: sync: Add memory barriers

 MAINTAINERS                               |    4 +-
 rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
 rust/helpers/barrier.c                    |   18 +
 rust/helpers/helpers.c                    |    2 +
 rust/kernel/sync.rs                       |    2 +
 rust/kernel/sync/atomic.rs                |  176 ++++
 rust/kernel/sync/atomic/generic.rs        |  524 +++++++++++
 rust/kernel/sync/atomic/ops.rs            |  199 ++++
 rust/kernel/sync/atomic/ordering.rs       |   94 ++
 rust/kernel/sync/barrier.rs               |   67 ++
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
 12 files changed, 2189 insertions(+), 1 deletion(-)
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

