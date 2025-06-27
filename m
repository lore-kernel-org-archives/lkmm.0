Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2D2E8DFE
	for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036503; cv=none; b=kgDegl4n5PoXcV8GSP/5EtZmIwOxMXF9pMTrzNnProDq5MP5Vy4FIEqwnGABf2Ph9GIOaRd9lu+Y0iwRzXFI/M7nRpihReey3WTP8g7nxvq6awWa6Oqmhwit81dK4c8IY8TXQpLLSQ3YfBT8LgzMSDqQ7oXFM1C9AdrM7UwcUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036503; c=relaxed/simple;
	bh=p75jCws13IGmQ6ZLZbCyysYEERhZf3DLpYFQXnDaFNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLpraj+6GvwqfbI5eY7fXCimalUK1wODByRj1BwsfiU6mwj10gZdgKSO4j3qBq9+y1mCGylPMc6BOvF6VYY+ECo5Z3EVhJFnR1rvYH/T591dxYx1Nb5/46KUjwoYtGVLzzvLkjGJuMY9xd96Rxr60miPFjX+jPlSys1VAuF4gJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms8LbjN6; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms8LbjN6"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748d982e97cso2370131b3a.1
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751036501; x=1751641301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+itwb+jz4GHBi4f8W4jzXfLWeu4y9P+oNAveTQMsuw=;
        b=Ms8LbjN65ETH75Sik4UjEHPvatECa7ZOIx1ObaHWDniw3FvK6isQfsCk1N4h4F5bbn
         UmqFHn9hSEnfLbNNxEnFtLdqLO8ixUef2eIJdtgZ7upLzTQGgI2OGLYYCGAXYTF0fhRd
         xQFFAy3UaxOjUPNiYhRfa2jSPeoxy213W50H6Uph6GjdHvCWjl4quLqNpqqvak1aAome
         oBaPE+eLJ1WrvvbA3aVcJjplFOY9j6qkR7oWWX4WbnaRZ9hiXw4qcj/ffa9UC3qTqpDy
         LXLTebYTQ0FY7tqQEwxNpUkr+HDcPmxJ6ywkztep/tQzOf8zfHdqwoiE8po2RqBtR4MG
         ZwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036501; x=1751641301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+itwb+jz4GHBi4f8W4jzXfLWeu4y9P+oNAveTQMsuw=;
        b=mqeMJAZ7jpd85bqbFXI0CL96UStgsRfhfbjJdflURYDp4HF5cVvaRz8TTSnMjKnHUS
         3U93WxbBtoaxLc8ieraL3Rz/raDtCW/X2TfcotU1+qaKER5Yilaa6jMa2JAFM0qm6APW
         LypLA6ap7DJaXTS4EbLCugH/fPo+3wwAnTt0219TDPLHzQVGrpj3TlBUVOwbQKVH1rIA
         ymOZTj6hLOT7GbGP5EmbzmPCVIICpgv08s5MSdp6A2MEviXPzw9+njIkwQeohMIOWEx2
         Z7hBZk+LHzkqeIdud0ugVRUddkUWlLASa+r9LlJsbK/1xi25uunqyKEXJ97DRHR8qMJG
         6/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVU2DLbQqjGAiz2g1FtsPqQFcmVVJIAZH/lpKnJd4ByP71ExFwt9Ebrle38i03kFQ0YMu7y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz79PgZLItjgWprbRNQ59b+lOrrPz216mj4RYtC1X/8fQ3g6zDN
	Tb/xtg6KJ5ljmBIk/hiENrQjEYQ1MrCwZlTMZhL/4YXeIShJt4YBeplIOkoAUg==
X-Gm-Gg: ASbGncszVypSnEW0/UJKiytyaokQ1oNPuF+dlUHn32W1wLSLwUarcqSw2ceu2IBLMKs
	vqTGK9toKqXmtsZPxPVNjCRGFqEcrsplIlPCqUg5xbqxuGAUPPHoNCuB65BeLzdIbyw34WDcUL9
	g7dRyKZTr+OdSHUpmRrZ1QqKc2yIwyOmxyUTrpstKgkF1P4FogJgabuGkmUOu0MHwVQkxJpRRSS
	MvNheiT9shLSfJn6iesRhz+7UJNX6TEi2oRnBmu9Hxpcg4AB2l/lLH53+nfIzmy69XtuC1rMQaK
	SZqfglQQKIEOfQy2uhhRF+gUJCIJbTDDXaRzXvo/NyTE0i2IZK6qQrQEteVNYyVOsWyzvu3DyUc
	YoRmNn0k8niAW0pNSlQv7NkYggMwFmmAUyaJP6cHq5/mJwNswcCaj
X-Google-Smtp-Source: AGHT+IGa3fuiJGQBl5VvroGyrKE8v3sCrCIlfqBFJQ6TSXAveKNBl+VvLq+HhGmZIn6hke0MEq+U5w==
X-Received: by 2002:a05:6214:5c04:b0:6fa:c054:1628 with SMTP id 6a1803df08f44-7000214ff6amr66337656d6.23.1751036487005;
        Fri, 27 Jun 2025 08:01:27 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ec10sm21489666d6.117.2025.06.27.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:01:26 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id CAEA2F40066;
	Fri, 27 Jun 2025 11:01:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Jun 2025 11:01:25 -0400
X-ME-Sender: <xms:RbJeaJL7GLR_6GaGD9LqY6iVPJ9hK_zpcFJYfZvOc3bHy0Mw8cASlQ>
    <xme:RbJeaFJlNu-advgqNUMGNpURKmNqp2wZtQFswZSgnfaC-MVXr9NJcXHb69tvJXprV
    rXuE49zQGGH8m0hsw>
X-ME-Received: <xmr:RbJeaBsoKTQJ4OadiIv3qNTHQ3G-8rLe_MYWvUSWWqoZUuBFnJQzSH0c3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhu
    shhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    rghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:RbJeaKbBVdecEkq3jKP29OjcOlccAzw3ADhUrNnJw25xmf0xAMy9bg>
    <xmx:RbJeaAZcynBeMGlLkLCRvCdqfdvLUnbHY0VyGndJ7WUI-8-OKaQWTQ>
    <xmx:RbJeaOAuRV913rJhyaZGEncNgDuigTf8232IKDCNv7bOmK9K-TetTw>
    <xmx:RbJeaObGr6FR1WXX2CKgVXhImWtAuEDujxGdBPmQraaMoElGajXJxw>
    <xmx:RbJeaMogQ51XFzRQqk6cKj67223_FRKTCIO1WVF0juchaFJ1tvfuT6cz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 11:01:25 -0400 (EDT)
Date: Fri, 27 Jun 2025 08:01:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <aF6yRIixTPx5YZbA@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <8ISRnKRw28Na4so9GDfdv0gd40nmTGOwD7hFx507xGgJ64p9s8qECsOkboryQH02IQJ4ObvqAwcLUZCKt1QwZQ==@protonmail.internalid>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <8734bm1yxk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734bm1yxk.fsf@kernel.org>

On Thu, Jun 26, 2025 at 02:15:35PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> [...]
> 
> > +
> > +impl<T: AllowAtomic> Atomic<T> {
> > +    /// Creates a new atomic.
> > +    pub const fn new(v: T) -> Self {
> > +        Self(Opaque::new(v))
> > +    }
> > +
> > +    /// Creates a reference to [`Self`] from a pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `ptr` has to be a valid pointer.
> > +    /// - `ptr` has to be valid for both reads and writes for the whole lifetime `'a`.
> > +    /// - For the whole lifetime of '`a`, other accesses to the object cannot cause data races
> > +    ///   (defined by [`LKMM`]) against atomic operations on the returned reference.
> 
> I feel the wording is a bit tangled here. How about something along the
> lines of
> 
>   For the duration of `'a`, all accesses to the object must be atomic.
> 

Well, a non-atomic read vs an atomic read is not a data race (for both
Rust memory model and LKMM), so your proposal is overly restricted.

I can s/the whole lifetime/the duration.

> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
> > +    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
> > +    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
> > +    ///
> > +    /// ```rust
> > +    /// # use kernel::types::Opaque;
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
> > +    ///
> > +    /// // Assume there is a C struct `Foo`.
> > +    /// mod cbindings {
> > +    ///     #[repr(C)]
> > +    ///     pub(crate) struct foo { pub(crate) a: i32, pub(crate) b: i32 }
> > +    /// }
> > +    ///
> > +    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2});
> > +    ///
> > +    /// // struct foo *foo_ptr = ..;
> > +    /// let foo_ptr = tmp.get();
> > +    ///
> > +    /// // SAFETY: `foo_ptr` is a valid pointer, and `.a` is inbound.
> 
> Did you mean to say "in bounds"? Or what is "inbound"?
> 

I think I meant to say "inbounds", fixed.

> > +    /// let foo_a_ptr = unsafe { core::ptr::addr_of_mut!((*foo_ptr).a) };
> 
> This should be `&raw mut` by now, right?
> 

Right.

[...]
> 
> Typo `AllocAtomic`.
> 

All fixed! Thanks!

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
