Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0016E75809
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047314; cv=none; b=sRdx5pC8dahy1X1LahbaM7xE3nPneXgy0mPhnYcLosv1As7oqItRYykAQaK1sadfFYOP2ZTQJcl+lSOPjlNQ+60I6Fa3jG+3OceR0nLF/t9A60BNpesRG27ht8dpbrq6e6jJDuKVgIftE/RhGuTj4E/g4lUE2q3gIAois+vY3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047314; c=relaxed/simple;
	bh=dOujAILrYNLnd6mktzPkLSL1VedSe4cDzRKHdKEYxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPTmgA6o34fF/elMgdZQ3iWN0eRR+URBZZlrbJYy6PoIy4GIQRfLCHnyRWacfD9YqMAE0qAxFzpOQPe7K7E8sCWQ5tmibKmk7yUgH1igwXJ2f/W/6zJ0FO0R7XThuXvMKaPwfMPPb4LNH8BwAmiWgXyaDbLj/dR8Cbv7JhiWlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jusns3at; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jusns3at"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-805a1931a15so179560685a.1
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047312; x=1757652112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pKFnRjrto/8fRt992djHn7ZdYab4e/fUAwuvCl3Wt/c=;
        b=Jusns3atomOfVq0WILeMEllFArr9aa8xluLzu/22jz+wtNzP7mJ4QecQqLNTZGcWiy
         aMVKQ1WGarXc+BI8K9VMZzE7AVfnoBoP37MY/R0gbya7xwmLVrI9U/Lu3aSj60x0qvg2
         VB2MN8rkHsAXnIK0WRZ3pfYFYBsjqk9BGOvfBk4djMKlXlPAhSchM084vEHSD48vvw/z
         2IZ6Nzh8NB9ihYbP2FfdWZ4ZbYjCKTx01iro1qRCCnhIcVlFJqdM1eIodajYOS8nb2uN
         XLC+OH8UN1ZE4BehRffp5/qBnHLlURoI0v800Phwd4jZRt3nSwNMO00G83qY1JvTbKI1
         y/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047312; x=1757652112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKFnRjrto/8fRt992djHn7ZdYab4e/fUAwuvCl3Wt/c=;
        b=I/lrr2abkZwLmYi7zrJO5XbxBTEwb6BI8PxaqT7YEXwcmALuBX6/0P56b6yXjUUd1t
         SXdRcrtcQYXTfwYrberzdahp0ahug7dj+iWuXSPdG9Ihk1hIN3RkF7KnT7VTLv3lMo4c
         MeCNhJTicNZuseomd5FVQkbSjfpQo59+CRCHsYYH2DWRaa1bloR0UxTV03MRYxy9SR8R
         IHA0ZyK9wZhcz6oYBRZ/8Zro46f2khKRM79AkHfrPylR2gz++ftM/4hRPgpx03k3ib+T
         kp5cKbDPedUYRdNOT3mT5yMjuQhwEmA6sCY2dY82zmijFe+zZ8UNWwbDYvbFGAiTE1Ti
         sQig==
X-Forwarded-Encrypted: i=1; AJvYcCXMoJxM5ECX9EgdBEBZGwwOuPJvRTr7vMVCELynhqy1iE+Si/g72x5OaW2JII/cD+fLmjDL@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7oZSwLHeVNNTmS7zjG440wFlw+1jgvduci7la/rQyMdgy1AGb
	58mbQtS75htH0l3C0Ew1wyoPYt/nglK4CeU7edqFuCM5QFjQ1uZQUmLI
X-Gm-Gg: ASbGncsEq32nK4EDctvcDadxpCns8rbFwXCmc79gjH26ncAO9rkwXW2fI8aYx4l05QU
	x2wnsSoQXAVVG/GgBQGDchtYF8E/fqXOQkstqAq4Tnh60sw0uzaEIwVi3f287e9oOOG85PbEuez
	0SVTe3Im5WZOub4sAnlAVZOmk+/t/AH81KFML4uOHBaozW3H1DnY3NSTQns8e4OkD7m0JImnz2p
	WsNsklSS6iuy19GMfh5LkfR8RsHvtcSrXLHiTXgjpFSgQwvR+yWJPmaMpqYiugvbRCbkqiBQz11
	e5iFFKWeiTml19NkO4Igtv6nwfn0SB6/OM960rOuhTrGkhGXv/UXCpKjfTevREAtmEYudOF6YRq
	gHi3UpTEQ1QcvB5FY3nrQww3Z7g53YwIzSOvmBc0D2ZSaxrjKewji29XjiafG/kmbbkniw1ODdM
	ABdMD76G6tHPf/J0UnLFK1b8AmpbwnoMGeeg==
X-Google-Smtp-Source: AGHT+IFyqWonBS5STZmVBihKaHT99VqRyAV/gjzTCE3LtKMX7HrGPwzK4WgWuG2/VBz1rL7DUH3vnA==
X-Received: by 2002:a05:620a:4442:b0:7ee:22e9:4558 with SMTP id af79cd13be357-7ff2b97c4bbmr2712469185a.51.1757047311796;
        Thu, 04 Sep 2025 21:41:51 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aaaa1dbeesm394442685a.33.2025.09.04.21.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:41:51 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BBBFF40066;
	Fri,  5 Sep 2025 00:41:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 05 Sep 2025 00:41:50 -0400
X-ME-Sender: <xms:Dmq6aK4CH2RcLQMivVdMcpqy3qg2ELUhggtz7vRY_yRgQcFBsGlsgA>
    <xme:Dmq6aCRidy3RIZW7kf3IK1fYdJyu8Ird0w5u0aEGSr8OtxFlulJ-YilWV2B6prWnB
    OEk3vhzDu02lP5GSQ>
X-ME-Received: <xmr:Dmq6aFfanMpWK10Q9fYuZgj_eLa07Ob25VR3H6NhkNB7MtneBHPSEW_f4LniZ-8N__Q1i0ZIPfwKGhInSpycmbGrlMVjyHh1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnhhg
    uceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpe
    eggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehmihhnghhosehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprh
    gtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Dmq6aKS3gqtpEoAiSjsjg7ubkJRs5SidyclsSs4FQvUMYmGYd3_6CQ>
    <xmx:Dmq6aGOqnwSDFgkMYv_dlGLkSv9ZxROm0GJ8aK8dHHHQash7pQI7AQ>
    <xmx:Dmq6aFUyYyITCA5-XznSN78k81VVubQzoPbq7T0UyVzADnasYr61kQ>
    <xmx:Dmq6aObZil66OkSu1lIoeBX0Ntzgs963pGECyJ0GkRFV_uSil3_-RQ>
    <xmx:Dmq6aCscvfIgMPODVmfBCDOit9YehzNOOkuJOCdBOs9u0KuGB-k2w54P>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:41:50 -0400 (EDT)
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
Subject: [GIT PULL] [PATCH 00/14] Rust atomic changes for v6.18
Date: Thu,  4 Sep 2025 21:41:27 -0700
Message-ID: <20250905044141.77868-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Will, Peter and Mark,

I'm sending this pull request containing Rust atomic changes to tip
tree. You can find the technical details below, but most importantly we
got a new reviewer for ATOMIC INFRASTRUCTURE that can help maintaining
the code. Welcome Gary!

Similar to other pull requests of myself to the tip tree, this pull
request is sent in form as patch series as well, in case that I missed
something and changes are needed in some patch.

Thanks!

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-atomic.2025.09.04a

for you to fetch changes up to f9bd1b3774be140762af2fec9c415b4a11746c48:

  MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-01 19:15:53 -0700)

----------------------------------------------------------------
Rust atomic changes for v6.18:

- Add initial support for generic LKMM atomic variables in Rust. This
  ensures Rust and C side are using the same memory model when
  communicating with each other, and would unblock a few more
  fine-grained concurrent core on Rust side.

- Add the wrapper for `refcount_t` in Rust. This avoids using customized
  reference counting solution on Rust side (e.g. in `block::mq`).
-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmi6YvwACgkQSXnow7UH
+rh/kgf+LruO9gn49QAzDE4T7kf9rP/z4ocie8sxMtED5J0vw12PAVa0UERQyB4m
756O0GSFKwESJMjLUifBslkt64k8x8hQ+XHYH/WPe/Rm7Ku4kf1zsTO9Mt0xA5qr
c5OgnLxR3T2L+1x8rEus8lPnExyX0G0b1/H1XjR+rvZAP1enwcLNyGFV3fNfAYNJ
cMpkGCMFM9wc5dpzDx89ttw49I8yuy+Cmf/eTtm1YDWQgzYVEycF8jTkFqYykIax
jMcZC0a1Lqrn1pLbxCZ5UEM9vxJREv46xBW6iKSkH5RWlbLo2gqMJbixYvkLtgBP
AbtrUtsyIx4Rw0nPEZ880Nce/LdhUw==
=Kuix
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Boqun Feng (9):
      rust: Introduce atomic API helpers
      rust: sync: Add basic atomic operation mapping framework
      rust: sync: atomic: Add ordering annotation types
      rust: sync: atomic: Add generic atomics
      rust: sync: atomic: Add atomic {cmp,}xchg operations
      rust: sync: atomic: Add the framework of arithmetic operations
      rust: sync: atomic: Add Atomic<u{32,64}>
      rust: sync: atomic: Add Atomic<{usize,isize}>
      rust: sync: Add memory barriers

Gary Guo (5):
      rust: implement `kernel::sync::Refcount`
      rust: make `Arc::into_unique_or_drop` associated function
      rust: convert `Arc` to use `Refcount`
      rust: block: convert `block::mq` to use `Refcount`
      MAINTAINERS: update atomic infrastructure entry to include Rust

 MAINTAINERS                               |    6 +-
 rust/helpers/atomic.c                     | 1040 +++++++++++++++++++++++++++++
 rust/helpers/barrier.c                    |   18 +
 rust/helpers/helpers.c                    |    2 +
 rust/helpers/refcount.c                   |   10 +
 rust/kernel/block/mq/operations.rs        |    7 +-
 rust/kernel/block/mq/request.rs           |   73 +-
 rust/kernel/sync.rs                       |    4 +
 rust/kernel/sync/arc.rs                   |   55 +-
 rust/kernel/sync/atomic.rs                |  551 +++++++++++++++
 rust/kernel/sync/atomic/internal.rs       |  265 ++++++++
 rust/kernel/sync/atomic/ordering.rs       |  104 +++
 rust/kernel/sync/atomic/predefine.rs      |  169 +++++
 rust/kernel/sync/barrier.rs               |   61 ++
 rust/kernel/sync/refcount.rs              |  113 ++++
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   67 ++
 17 files changed, 2454 insertions(+), 92 deletions(-)
 create mode 100644 rust/helpers/atomic.c
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/internal.rs
 create mode 100644 rust/kernel/sync/atomic/ordering.rs
 create mode 100644 rust/kernel/sync/atomic/predefine.rs
 create mode 100644 rust/kernel/sync/barrier.rs
 create mode 100644 rust/kernel/sync/refcount.rs
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh
