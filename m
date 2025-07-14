Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058F1FDE39
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752471429; cv=none; b=DA6c9uC7SgS/JHigTatb0Mz2/2Yo4IDi2iSQ0me+3xY5QrsSdvb6/FBrBZGxMJrAjc/Vzbv9GSK009IHJZ+Zyd7ADXXZ9TopNxWaxFqxaI0a1whnflPr0g8z/a3vQIKQsR7Cuaj+XXkjeuMlTwEySkqjUPWjmGSn3w3A+lYW7Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752471429; c=relaxed/simple;
	bh=iHjLJHszEqHq1s5K6JvEHWnJ24watVghUAp7cxDJPos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bc4n9tiEXoRHFDnaWxNG6Jg23pimE+2AxO9ov36Jn0HhKbiokwcA0Wx460vXp/PV/XPk+H419IIG1ElS1W/rzzIYUKAqf5Q7G52nX6krupaaP2hcvE4l7E8CPkNyh37/xbUd8MTzUKKpqbyL0hPASUzKwqPdYqv8s2DYgChbRmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoDuIy+g; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoDuIy+g"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a8244e897fso42425211cf.1
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752471425; x=1753076225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qhcs/TWFlBrU5N46VtyXcCLVqGqYLXRnhyvhBvhsGc=;
        b=hoDuIy+g+3D9dUKjyIOI5wbU5FgXh7gEqZUDhmlPKLBrue9606SaEioFRQeNpquqWU
         H3tA3114R+hItfBa49XqcTCO26sC/T40zEhFGi1rUesqJqFSAhExd2nl4as1GeQSYnnC
         vz4ERllVllGex+K3DM6rkbrqKibySw2Mlo9ZnRUGLgmJMhvgxQWqJ6uzi4kzlePK/rb+
         xA3o7LobVJTVjWwSs8syEUZHipxIyp2LrVHuu61BYrBy00jEJHWVn2xtUBu/088RB8f2
         fD7L8sTmtxVzFb6Lf42alyYGr2D+5AuiH5IpcgRcBDmlDseTMxVKoSHBWRoBI5u9lpz6
         aNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752471425; x=1753076225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Qhcs/TWFlBrU5N46VtyXcCLVqGqYLXRnhyvhBvhsGc=;
        b=PxqVcj3WMjCqyn00WrysidwOJvHpmsRse5mXP2kzhOgaczD/BEu2IRe7zU763QJk5j
         Xjqx1v6V2GpEpIOqT/J7kXfb0zc6va9LxZC5Yo4hI5aRI4200fSJnz4f0zdHwnfAUWz8
         W4cKJMkTnzaD72cta+1u8kotc3ASL9WQVwQnV7wfuPQSCP40hDl+DBneXidZ0NEsYkwQ
         YBFNj/uqrxDgNGBn0doS7X89gNohYCp3DjZ4ZGgm2OJNckeQuv2CWN+NJWHyx89ypuLU
         Bwh/5sJyQuEB00YsD+NqYpXQdJDpmmDk5W2GnIFgAAhq5iW+IR9nsY2rhjOH9gXcXUZr
         WyXw==
X-Forwarded-Encrypted: i=1; AJvYcCVbFXmH8J28OWF3hym/pl7y5cTdf0vxSbvq9wzFlmM7z/Dav/lZUh5K3MI6WJsw0OngNVmP@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJx8td5FdjyDRaGiy/GdKwFuoTDo+XBB2f3vdgDVhttykG6NQ
	WTSeu03lq493X57RygeySf35Ba0STxgDgv+dqZ+TK9m7iSmOvyPgRvGC
X-Gm-Gg: ASbGncvG359gxGXN8dOnNyMbFb9XaR1sSm5Z3V/RcgJ9/4hbRp3a+LHQjdWgiaoQ/Kw
	2BP1yoCDM+Jvju/LDGtI+cmvhVydla4cP3koUL/qkwqFWfmdcjTkmgVbhSEdvA6hxr0m7z6E3uO
	6SSgGllUoSaP1wmUnXl9PYRPENl93TmEhrya/UijKxcUoO941WPwZBAsx+vk1MrxEB38xQXS8nR
	a1zOpEyFengYna7NQP1s4uQHhiuztPwI4waiUlfqV6tIqDJ7Rj7lIGYYL+O5QpfHIhzygZwNk8b
	bBC/NzZr7uc/iIOKLsuUxuX5odwPzIToT4M+ytIhTSYLGs5py1f0SHOZMNJDhlIxj+0aLaQq2LK
	HBXxBEYWinO35g4riDAaaocI4hlVQzbqyrnqch/IRDUR0ElEyLXswPWu/orNA6/kuJzXk+sb3Db
	P3XIZIUnrCWWTA
X-Google-Smtp-Source: AGHT+IFeO40qekGkcTefZighKvWO4HYU8IrbCt2yVdA8YEWYCXGqKt+3KhadXB/eWoKXwgxOz8OwAg==
X-Received: by 2002:a05:622a:15c6:b0:4ab:6b08:9dcf with SMTP id d75a77b69052e-4ab6b08adecmr39762331cf.18.1752471424841;
        Sun, 13 Jul 2025 22:37:04 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edea72cesm46259891cf.57.2025.07.13.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 22:37:04 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 72602F40066;
	Mon, 14 Jul 2025 01:37:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 01:37:03 -0400
X-ME-Sender: <xms:f5d0aCjPacFsm-BANZv_DDyo9gvjDDMxawUM0IlgleB2JGv8_UZ_aw>
    <xme:f5d0aEqDGlebr63DvYmftKY80kDmnfUqoLLP_ALyvzJx9ujsune0Xjf34hIf6GUIR
    uaIhzrp6V3cZGWK9Q>
X-ME-Received: <xmr:f5d0aIwMaMBATMhzxMSC-2ZTfFLFf6PyYzQtD6qXoaTQnoJghw4X0qWI-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehuddufecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:f5d0aDx3mhgp38rjAsVBDunltXZoPEwmJj_nFpgKwm6k9lcv8WvxLQ>
    <xmx:f5d0aAbD2L3zXWRcTxxjWghu7n9AGWfGHtS9OgiVDXG_GqTr3zs6iw>
    <xmx:f5d0aEl3u-EXZatjHjHkLdy5n8SZRcQ4w-Jolbxsp6Rrc9hpJJugaQ>
    <xmx:f5d0aFFB98y6DRXh4nkDMTRnqXHPF1RdCRNyH1Bwn7ci1HiTN9v0uA>
    <xmx:f5d0aLjoxBsB7JNbZVnD77kwXz6j1ia398NmXgxh45aVa-SEc5bV6M2j>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 01:37:02 -0400 (EDT)
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
Subject: [PATCH v7 0/9] LKMM generic atomics in Rust
Date: Sun, 13 Jul 2025 22:36:47 -0700
Message-Id: <20250714053656.66712-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is the v7 of LKMM atomics in Rust, you can find the previous
versions at:

v6: https://lore.kernel.org/rust-for-linux/20250710060052.11955-1-boqun.feng@gmail.com/
v5: https://lore.kernel.org/rust-for-linux/20250618164934.19817-1-boqun.feng@gmail.com/
v4: https://lore.kernel.org/rust-for-linux/20250609224615.27061-1-boqun.feng@gmail.com/
v3: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-1-boqun.feng@gmail.com/
v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun.feng@gmail.com/
v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun.feng@gmail.com/
wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

I think I resolved most of the comments from the last version. I do
really want to see if this can be in v6.17-rc1, please take a look.

Changes since v6:

- Changed the macro format of atomic/ops.rs and improved the safety
  requirements per the suggestion of Benno.
- Used fine-grained trait design like `AllowAtomicAdd` for arithmetic
  operations per the suggestion of Benno.
- Added an `isize_atomic_repr` internal type to reduce the #[cfg(_)]
  usage for implementing Atomic<{i,u}size> per suggestion of Miguel.
- Made barrier functions always inline.
- Documentation and safety comment improvement. Thanks Benno!

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
 rust/kernel/sync/atomic.rs                |  187 ++++
 rust/kernel/sync/atomic/generic.rs        |  573 ++++++++++++
 rust/kernel/sync/atomic/ops.rs            |  265 ++++++
 rust/kernel/sync/atomic/ordering.rs       |  109 +++
 rust/kernel/sync/barrier.rs               |   61 ++
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   67 ++
 12 files changed, 2328 insertions(+), 1 deletion(-)
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

