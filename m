Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0326D4EE
	for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273178; cv=none; b=MJzURiL8Xu+OzS9hF81UmzBzWY3Ipza7c2luwFN8pTG130qTFKpPVIoMWheqqv+1wK6btNlNzayKaVMTpQ6Wouk1FQDXnyqXsLbG9m/BYOjc/T8PWb+KUIbcREEOiD/TTt/4icZgl0wBYPEuvjIGI7f+VCI4gHSF5zCBb+oI4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273178; c=relaxed/simple;
	bh=926HOgz8gxzG0OhowK+NIkyZJmV7LXYWGTd5SEq48FA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eB5UyxbEQ1cBfHfTLBFqolwbnUMyZ8MRTXkHEgsk1S8RLwIStSgjHHJO94r/0FHgzAgdEu0i9xE1kTKrIigoITIHoM6dPRS9Q3zwC64dPgVzrSL2fUBcq/rzS8jayFteg/T1qo+WgvqHDZZwFIys+jQa9aEMCd2IqusDxTbdIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTcQSAn0; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTcQSAn0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b3d3f6360cso18112961cf.0
        for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758273174; x=1758877974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FLP69wPPTyBl3iI6wucn9C3HytX7tdfXjNtYh+fleXw=;
        b=dTcQSAn0yy7QL3Okrm5GNlsULJKzhKGrk4HoCoeGBjhrmXBl/b9Y6PVBsiem/4NAy5
         1IDOII6jvRpK1TxTcg3t05pbC3q0+/twF/OrQ33Pn2857KxnHtAzkgIQkoBVtDRcj5xF
         386pvV41x9LFAR3Lwd/cu9DaU4dGPk2AYpLYInksQK4e8rGCz012N1GIxmjafbGzAI4q
         WzwoZxEMRKZ22sLP6JhU0gkPurzWiy7iAKZM0Iav22/aF4WXrGJun068JPn3pc9fBnT1
         m2m9J2GIFqSCFsOPsZkPihxxOStg5hwE5GZLMGWwzuVaHHufLAq2FojJfIqxfgxODW/v
         BHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758273174; x=1758877974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLP69wPPTyBl3iI6wucn9C3HytX7tdfXjNtYh+fleXw=;
        b=cC+wxcJQly8yCTrXaICJaL2KnYLvbTbYn3zgr+B4hlxazlreiEofC6zvpV55uYozGT
         ApuSRY4sazwQKw7AfAgjeJPJXg+gGAlIqXvxYbxiTEpW7Wr+C31xt2gMFJf5sby5X2YD
         rN0m+P13QXgcEaQr3Y8c24w5HscihF7942z+MVS84i41Crdrkjv8Do8x2vS6ssIS51Rm
         05C36XWcZwyhRWIElVNLLUH+i4aUkgNQZF4BpVxpqoUZZtQBUd7dVjor5XgDjfbZiuKO
         +5CmVEsD7tD03hbOi5eGsNlbzMwb1kPKbyu7w8v9BSjX1/8/sP9fPuhLsTSLoSy790dI
         XYcA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxaM1ljtBR9qntrtr7yk9uAAnrpFP2mqDLnBBXUCBfF5Ut3CQHrbljY1aE79pwUM2eNZN@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5En4B7B+bUjyqcBqnXiuUbf+d9DCgUNPgPYyEf2ZbElshdCXH
	ZbPxkhpEIjhqNigUWRXA+H4s1nZQau59wUi/gEuH0Ec/O4YuvnTohIap
X-Gm-Gg: ASbGnctihihtShBGM6+DAe/iNIfdy9UshqeQluTqD1Dj/hma+llXXTeysmp0JunA02b
	XY+28+L/L86LxdZ4Az9knYORg7joAsvbWFLNWGmGf0IDLeF2A0bSLTfTbRulDNIxEf5PJvoSg8U
	KIzTGzz+A5w0WcKIjYapkJWdANjzw8SEaooXdpXDHjejwB+hmIO+9zIUoPwJBUoEyqFAggukztn
	SzITGjZdU2MPzenUwQbrWO2bU6C376u4gmXzxgG/EdzM421lAALHiBmJ03N02f0x1LBYqYzi9H8
	C1EizKqkfwzVFj0//2hCHoJ+95/6HVbZjUf0VAbs0JLJu+J52ZGIr2WJMF+VRZOw9BTq52dz2+E
	JmeFFwEIOw3AnFBVvW+GEF3s/zBtfvSt6g2Zj95CyTmhsRRAEP4QbQC1llKV3deqblh7+PpAa1N
	F0a65mQncbaznc
X-Google-Smtp-Source: AGHT+IGKevs+ZRXSIZUcCkojfkPosvm16AJuFo9XOQFQbaodj2jImJQseN3Lbq6/BNffjGONr4LqZw==
X-Received: by 2002:a05:622a:138c:b0:4b4:924c:aecb with SMTP id d75a77b69052e-4c06cbe92d1mr21104121cf.14.1758273173875;
        Fri, 19 Sep 2025 02:12:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda943b56csm26678131cf.39.2025.09.19.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:12:53 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id DACEDF40066;
	Fri, 19 Sep 2025 05:12:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 19 Sep 2025 05:12:52 -0400
X-ME-Sender: <xms:lB7NaLq6Q3BjTxYC98o5ZGegSeBTkoELuIR3M6ozx8fjAJ5SwVwnbQ>
    <xme:lB7NaMOmtyt1fg3YROSJNapsU2R0xubuSjbC0ZAwPHJcNVcIUjyrI9B0j-c_V2bFE
    JA8HJ_Br96LsXyt0g>
X-ME-Received: <xmr:lB7NaJ6QrIeFN6HdzX30bo1_E78QWnYwRNPnhqd1UmEc97jKOaf4mEWida1p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesnhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprhhushhtqdhfoh
    hrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmh
    hmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:lB7NaIXZ_tVBUerGN90gG6-mwnFgkkiWK8yG7vb2EoJxfOj7-uymhQ>
    <xmx:lB7NaL1TQhYIAcCcKtk3nIW89jbnmpPdDus_nzVb5YSotIynaVDhDg>
    <xmx:lB7NaPNpFET8Qrs0C01ivQ3LAIce3VU9DKSc6Q5GAF9nbmelKllxXA>
    <xmx:lB7NaO1FtzYHP-KnTMzpfgbLngFU-A_CXDpdE9iYudp6Z6hp4QZ0Qg>
    <xmx:lB7NaG38oyQWmdR888zLmRgPNXjWHsh09GSBvT9f3omNOboFwgqU63DE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:12:51 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL] [PATCH 0/4] Rust locking changes for v6.18
Date: Fri, 19 Sep 2025 11:12:37 +0200
Message-ID: <20250919091241.32138-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter & Ingo,

Please pull this (mostly) Rust locking changes to tip. It's a bit late
than usual because I was at Kangrejos conference this week, however the
changes are relatively small and simple, so I think it's Ok for v6.18.
I also try using "git notes" for submission links as Thomas suggests,
let see how it goes ;-)

The following changes since commit 17d9f8eaa87d40a2ff66598875a43363e37a909b:

  MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-15 09:38:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-locking.2025.09.19a

for you to fetch changes up to 9622209360c25d78a81048a9db72f1efef7fbc58:

  rust: lock: Add a Pin<&mut T> accessor (2025-09-15 22:28:35 -0400)

Regards,
Boqun

----------------------------------------------------------------
Locking changes for v6.18:

- Fix a data-race in do_raw_write_lock reported by KCSAN

Rust locking changes for v6.18

- Make `data` in `Lock` structurally pinned.

  Previously the `data` field of a `Lock<T>` is not structurally pinned,
  and it's impossible to initialize the `data` field with a
  pin-initializer, hence e.g. a `Lock<T>` where T is a pin-initialized
  type is not supported. This encourages workarounds like
  `Lock<Pin<KBox<T>>`, which is more complicated and less efficient.
  Therefore make the `data` field in `Lock` structurally pinned to
  support pin-initialized types in a `Lock<T>`.

  Since the `data` field is structurally pinned, make `Guard<T, ...>`
  only `DerefMut` is T is Unpin, otherwise `Guard::as_mut()` is added to
  provide a `Pin<&mut T>`. This is different than normal Rust standand
  library locks.
-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmjNGoEACgkQSXnow7UH
+riU8ggAnRUTBam8NTmHJpZfVbbNSfx1ndaARxd9Wb/MLEh8OHYKbVRPJwvWGge+
dafO0VYULku7ho1SeIlLXp4Bbjy3YC6o/J6xOpr9xMmysUky7RHi+Ys0y9gKaSmW
daPurQEOS8TBUWu5yVxNAfWoRgPEiPULovbzgANKKAV7QsljyoEg7mQCPxLftPze
Hr22HxU+lr6SDH5Efc8ihGqXJAvwunk+0mkJymZbjWo3ZF3cuhXlTMcIlu1SK14a
R1VQu5UoX8S5y0T0gkJ84UJ11e0wrSZyT0EqmHWSpVBnyGgWk8H1u284hDiGG2iG
FvwoSQ9iVuxLhxjhPUSOjq30DzmFfg==
=MZj4
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Alexander Sverdlin (1):
      locking/spinlock/debug: Fix data-race in do_raw_write_lock

Daniel Almeida (3):
      rust: lock: guard: Add T: Unpin bound to DerefMut
      rust: lock: Pin the inner data
      rust: lock: Add a Pin<&mut T> accessor

 kernel/locking/spinlock_debug.c |  4 ++--
 rust/kernel/sync/lock.rs        | 41 +++++++++++++++++++++++++++++++++++++----
 rust/kernel/sync/lock/global.rs |  5 ++++-
 3 files changed, 43 insertions(+), 7 deletions(-)
