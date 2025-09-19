Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117592EC087
	for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274046; cv=none; b=jjv/UUSJ0OQ311cvcfctooueQ8sKMpjxrokRFIWkLTWGfHM2XLfuXLXmq7g634lkH04/ct2EHrnKUSv0cB4PcDRWqXI33EUY4RMr4g8XVDbxDDxApCcIlm7oyy2AXFJW9OxVHJX6QKwkRDOivySdMlhqyyGcvLpm5g1ol2bqiCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274046; c=relaxed/simple;
	bh=pO9xHI/3NTLDS2M7hbjsA2aT/8nvi3Ps8SWXCVjl6ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9k9vKArgNOI+brnziVpNz62wdVCLBoNlgu/SIQorgrvG7lg7S72RVULXsd73r7xC5Z/YOPF3sqTQXlccMzMGc5IiUrPIqkukztKuOq2KvHxQHgYDXUzFs6gX8gMHuFQlPk60yzws2zCAZQq0rrKXbmnk+YDPlIgwWAt3lc7FYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAB1wBeG; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAB1wBeG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b7a40c7fc2so26956451cf.2
        for <lkmm@lists.linux.dev>; Fri, 19 Sep 2025 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758274044; x=1758878844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqbmWWdJDXBgyKwnalFIBvgryIt7TZh4TmAJnnjDHxo=;
        b=cAB1wBeGc3brXqq0WbtcVlMhVA/vrGsCxYuP/RK9Qy0anLTPOp/vNLqRKKqFf1vVOl
         R2RP4vcn27xLhGAxSuXdXqkXsbSLmDjvPxwQ287ltBx6cGgCxtrd5m9ovYIlMDDODHOk
         OBw2SXVc5b0lfxDJxeESdz29VtFGjVua0GIN8iQ+ZACFfyEp8p9xRyfmIJ3vqRAOLfSh
         H1OSrLx305lguKGBJuSy45w6nNvpiFC4blTu1+1mewEyV5KCZnuyVOwxXclizodTLLSg
         K96+nMh4iG2LaBCDS0tM/DqaeZRvo0/wdBDoM5dqByCn1gqQuXqgkJy6bYQkv4N66CVX
         4GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274044; x=1758878844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqbmWWdJDXBgyKwnalFIBvgryIt7TZh4TmAJnnjDHxo=;
        b=lMfH+8Vm4QxhAM2lqzaEVT6I7yF5nVqsCCSsKPm3R2Co1VkNnss+NcaaJZdKLU0AAk
         QwBZbg5q3hOy6fsfJOa+iFfBHembaKI9CTDw5Df1SyCVU74XO0GFRY3tXN30Ap2eRowj
         ehEIp2oJ28BeIUpPH+a0WjUI4EIt8M+3/GZr0DCxGeyfvM6KM+qPzt2YyhZhTwOlwrH9
         R+2/yQ1MPbVaEnpXQVgbS8ac5kiZvq0YiKCngQSwEjqyKKGlOBQk7qDBcBc4ZswCKom0
         cSpOeZ05bAGB4snMyWR7zxccJptxL4Chaw1UburZtIQYgFtgYpYXt7c7JhhsNBdkZeEC
         7UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQiw7vlPrk3orNbBHcRtRzXRNoIk6sqSrQocAOl4nSw5OMmkbK+GEYaGChXVWt0ugrlsoX@lists.linux.dev
X-Gm-Message-State: AOJu0YyT9aWUKsgeWouKh8/20uJY1lJxA7rL4ZhUlaTWiid2tYoActjl
	ku4kq9r3WMUXU+i1Az5U/RO29WbgiTprMXz5xfy9MN73uD4IqihYhYSn
X-Gm-Gg: ASbGncvrKNuju8/BmRiXPTBRjkzMP9hBXP0sdDm1m7RPPDVMzFS2kgdmC3c1QB31jOl
	pH1yfveHrYDCAE+L8rZuzMLuscu636OauCIqH/uTnxTDSU9uFg0QJ/TRzxkqAdlPvlR3wVz7Eo7
	2Xa6VTFAkyDW7mHFitjuKOYgt+rcVHjOqMs0DylzHX8L+rVSNw0BYfwLjU9+HnuU4GTboD+ugbk
	54P0WLVfVxsFdwL/1lupkIsgDFwimUDB4STLpVev4EhpzhoXDfIPqJ3LWikKkmDSy1i8wKaz7Sv
	3ML8Ce9K0QSzaMM9vfPhUOi0w7HjFXRkWmCrElSmz5e3PmdEX2q3dF939h2DNw+RL2jCd0s8NoU
	c00C9U6FLOKFc/NcWPz4dnkHQhDa1itKESxM0WNmjkQmlnFEnCryp08CiWLcQlvQzg8as6sbgce
	GXNrVAukhsRvsLywJq8KMdkfg=
X-Google-Smtp-Source: AGHT+IHZl2gBRa8IPk+yYPfu2t1GBuNovm3HJV6SdeKZiR7k67Eso799bbVcBGWih9MKbRUNcrqhuw==
X-Received: by 2002:ac8:5a0a:0:b0:4b5:dd39:c43e with SMTP id d75a77b69052e-4c073106a4fmr22277991cf.61.1758274043835;
        Fri, 19 Sep 2025 02:27:23 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda943c27bsm26085791cf.40.2025.09.19.02.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:27:23 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 02D66F40066;
	Fri, 19 Sep 2025 05:27:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 19 Sep 2025 05:27:23 -0400
X-ME-Sender: <xms:-iHNaBkwO3DYEDxSYsXg8wFkKOiIS8phS8s8pRFCBqf9WzNeuByhgQ>
    <xme:-iHNaDb6GxEetX6dNAlw9EPxqB50AXD3wsZ75OvBbtgDzfuTJ5gx8JacHPpX4pW-F
    tmLA_jADSX74pwYZw>
X-ME-Received: <xmr:-iHNaJVqYf7QNLYw9xEdKS7acp1QcHwgpVGSID7A1pbsOIpPMiQp02_oy0kG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-iHNaLCRh_5ubnQ5AoDgj0PURt6J12rk7W6G0Bo51OsW6gcvAsiRuA>
    <xmx:-iHNaAxgkz_me4xLOhAjOgp0OAvyCpeBHOoHYU3EfwtLTYO15C4AdQ>
    <xmx:-iHNaJaheYe0ptx-WRIt8NN0Q3ZCrMN5zvDTgjvwXaPYAHOv_c5D8g>
    <xmx:-iHNaFRoEH3hpRcwqqW1hUCXOTVWu-FXQjuViF7eL4ZDdR5MrIGGMg>
    <xmx:-iHNaEgsdDYXWCGRgV2Rv48KkPQtkdknb_aYAmUHDwUGaL9kUZXGC7of>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:27:21 -0400 (EDT)
Date: Fri, 19 Sep 2025 11:27:14 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	alex.gaynor@gmail.com, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [GIT PULL] [PATCH 0/4] Rust locking changes for v6.18
Message-ID: <aM0h8oMzSnGwP3R4@tardis-2.local>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>

[Fixed Peter's email address...]

On Fri, Sep 19, 2025 at 11:12:37AM +0200, Boqun Feng wrote:
> Hi Peter & Ingo,
> 

Peter, I somehow had a typo in the "To:" field of your email address,
but you should be still Cced correctly, sorry about that :(

Regards,
Boqun

> Please pull this (mostly) Rust locking changes to tip. It's a bit late
> than usual because I was at Kangrejos conference this week, however the
> changes are relatively small and simple, so I think it's Ok for v6.18.
> I also try using "git notes" for submission links as Thomas suggests,
> let see how it goes ;-)
> 
> The following changes since commit 17d9f8eaa87d40a2ff66598875a43363e37a909b:
> 
>   MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-15 09:38:36 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-locking.2025.09.19a
> 
> for you to fetch changes up to 9622209360c25d78a81048a9db72f1efef7fbc58:
> 
>   rust: lock: Add a Pin<&mut T> accessor (2025-09-15 22:28:35 -0400)
> 
> Regards,
> Boqun
> 
> ----------------------------------------------------------------
> Locking changes for v6.18:
> 
> - Fix a data-race in do_raw_write_lock reported by KCSAN
> 
> Rust locking changes for v6.18
> 
> - Make `data` in `Lock` structurally pinned.
> 
>   Previously the `data` field of a `Lock<T>` is not structurally pinned,
>   and it's impossible to initialize the `data` field with a
>   pin-initializer, hence e.g. a `Lock<T>` where T is a pin-initialized
>   type is not supported. This encourages workarounds like
>   `Lock<Pin<KBox<T>>`, which is more complicated and less efficient.
>   Therefore make the `data` field in `Lock` structurally pinned to
>   support pin-initialized types in a `Lock<T>`.
> 
>   Since the `data` field is structurally pinned, make `Guard<T, ...>`
>   only `DerefMut` is T is Unpin, otherwise `Guard::as_mut()` is added to
>   provide a `Pin<&mut T>`. This is different than normal Rust standand
>   library locks.
> -----BEGIN PGP SIGNATURE-----
> 
> iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmjNGoEACgkQSXnow7UH
> +riU8ggAnRUTBam8NTmHJpZfVbbNSfx1ndaARxd9Wb/MLEh8OHYKbVRPJwvWGge+
> dafO0VYULku7ho1SeIlLXp4Bbjy3YC6o/J6xOpr9xMmysUky7RHi+Ys0y9gKaSmW
> daPurQEOS8TBUWu5yVxNAfWoRgPEiPULovbzgANKKAV7QsljyoEg7mQCPxLftPze
> Hr22HxU+lr6SDH5Efc8ihGqXJAvwunk+0mkJymZbjWo3ZF3cuhXlTMcIlu1SK14a
> R1VQu5UoX8S5y0T0gkJ84UJ11e0wrSZyT0EqmHWSpVBnyGgWk8H1u284hDiGG2iG
> FvwoSQ9iVuxLhxjhPUSOjq30DzmFfg==
> =MZj4
> -----END PGP SIGNATURE-----
> 
> ----------------------------------------------------------------
> Alexander Sverdlin (1):
>       locking/spinlock/debug: Fix data-race in do_raw_write_lock
> 
> Daniel Almeida (3):
>       rust: lock: guard: Add T: Unpin bound to DerefMut
>       rust: lock: Pin the inner data
>       rust: lock: Add a Pin<&mut T> accessor
> 
>  kernel/locking/spinlock_debug.c |  4 ++--
>  rust/kernel/sync/lock.rs        | 41 +++++++++++++++++++++++++++++++++++++----
>  rust/kernel/sync/lock/global.rs |  5 ++++-
>  3 files changed, 43 insertions(+), 7 deletions(-)
