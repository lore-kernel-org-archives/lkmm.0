Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9F1DEFDD
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503438; cv=none; b=TI+Ayjlw31N4QD4a84zFOqwyhEh6l0UwGrF0l6rJtWxeyel+VZcFd5SzuttVVNor5Mop51twfDC+vAAzSViMTElC60eH3ynNeHSoZ2mC0j65DtZ4hpGHgc9HsxDp5M2YSuLNCZjKq2gMA1/p3FJwz2ZaaezxF0Zl/lfg1hsohMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503438; c=relaxed/simple;
	bh=sFtKmdPe3yM1e81VjhNJm4orvucz96RczzN9REg2yBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pu+CLHgAzvRSWSC+sAHT0OOTIO+3MACT4sCEKE7jEeMLQTwVUBODnjek38jgDn2SYcO7qLQN6vrWtVrl6eEo/FRblpar4zQ+jobiTXObfr9MhRwFd88rCRCcF0XUJYFifodt5MROIQ3uWqiIuQJ5w2o8OQYLNvkSdMakzRSsaNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1fPjisN; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1fPjisN"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d7f2600c17so680373685a.0
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752503435; x=1753108235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Rc1Y+pmzpiPQHIuTeXg8gdbq5HQwcIQr312n6KM6r8=;
        b=B1fPjisN94r2TIQvkppb1ROgeoH5G7xIr76fG56XubjvF5YVM4AJciG8HnW2TZX9p1
         /Y2S5nROMgTDikOs2BShWBz6jQgb06ANW79RKJ7xNozEXPVw3a3i+jg0Pg7MI9H322KP
         OxFsqpj0DDIIKIHu47coMFeGcX9alFeMNXAbBop3ZOu9BXZSdrZOFPmjyZwg/RZqF/Pz
         K65YdNNhfxHXRCOdYECKr515qsevWs5+b2IpwaF+68T+F/RKt1fF4NkYDDQtLhKit80x
         xdgp4BPnosJ1LP2BQryTEWTiqYLyZVxeOebCK3PJr14x3GxfgPePo9QXhaI8YibymIty
         8z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503435; x=1753108235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Rc1Y+pmzpiPQHIuTeXg8gdbq5HQwcIQr312n6KM6r8=;
        b=rQdKEvvbQGjzyCE+uYmqFXD3B/xErzqoyJSV0eqKFrMvN/szfUDIS+kbT9ZRBQjx0J
         TpsFNoesSjfxeF5ujD1/qUEQ1TAlxj4xtzGRxTGyMLmBEA+U5dPrR/I5I5PzvotgS27Y
         egVPcS/I9L8Q3u8nml1UIRKtXD9ha0iML8N6xzF2W9srt1TvlNg5NgUnPwIFDmPJptit
         lPNcmE9rVMopRevClgwn5kthpo04RCag2ltnJYHwuR+Ddtw0vbiMTNRHCNkVgMrv3/bM
         IXMsf3m5rf4DnQzRyWhBwhsxluqfp5gJfm9mAHoMIToILcDh5CH1AOgHLlZdIJS/vzND
         4YZw==
X-Forwarded-Encrypted: i=1; AJvYcCUyLuaJUvHWjCOmpMmyqC5mZ8dN7dGe3i6Vl874tSwuRnprIXTVdzL2b73JaW7dhwSyFSln@lists.linux.dev
X-Gm-Message-State: AOJu0YzetpkGAAQntuqGZ51kkCZ2GvenuCfZFUn04IPIHeqwIcsrDr3Z
	2QGIEkLPnnETSwa9s2rAX+uOlk7SQ4FTJPCVcAtGUqzEA3iRLVMHAfUJ
X-Gm-Gg: ASbGncswnYLQOhHb8pQaLKENazyYrP+gQwe1JWUjRfdjyC1vWA2KhZkHuBeu4za9s02
	MztFOoxku/c+PfYbJrYDyYo22tJ+P7hLBt3yV4RaFYbiCUs9KzR3ux0YcAKXr4YXkOaY68YxZMe
	z01Qbzz3D+XpltA9/tfx9xC0fGUwJwAoDO1f7+SWS+5k8oLoAuA2MD1DaJ4YVHfJQACEvVwSSxW
	rixxuoFh+F1XG4ZsWXBTVUYK2qOXI08u4U2mOotyNJLEhMrXyPKXQ8DfgQkaipdPFXEjkctGcOD
	a9CkWaSsFxWMx/Si1HEQIMi4s16DBiFmh/L+vQsRMaqFYsmz4gN3L0nwbx/C0Mleeq4pv5/b6yC
	H9xRFlWIBtRIsak0qO7U89mfxmzA6MCILZG6LitBNx5bgvXHl4sdy3unawcOzIgv65FuvEIRpQ1
	o+LZKmuEdq5vB9
X-Google-Smtp-Source: AGHT+IF0pbXsZLq0snH0wnmLL5ls49lFxGDEqoVsSMvAY9S8YD2h69gdmg5fta+/VfYNmQm3T0yudA==
X-Received: by 2002:a05:620a:a10c:b0:7d4:2868:89ea with SMTP id af79cd13be357-7dde9d4b5c7mr2023428385a.4.1752503435233;
        Mon, 14 Jul 2025 07:30:35 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e32b48255esm101836385a.97.2025.07.14.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:30:34 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 060ABF40069;
	Mon, 14 Jul 2025 10:30:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 14 Jul 2025 10:30:34 -0400
X-ME-Sender: <xms:iRR1aOZzmEGMwvq2uJb8XUtPw9mtTqD7Jih499gVA-lzsHxQBqe0CA>
    <xme:iRR1aC5m43tKLj_ZorwYBPEQGrVvjQplpwchY9k8-wTv2nJZOAZzBIuwnkyZI1hL0
    yabrxYWOh97UXnrFw>
X-ME-Received: <xmr:iRR1aNg0F2haNx-8k9GhJ4P7lnCmBqpfo222zAuDHnTKRqydl_352yz57Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedtvdetvedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgt
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:iRR1aAI6bdb5j9SlrqJR1GEBCp-THjl-WOmFtlN8OZsPKc327nareQ>
    <xmx:iRR1aHrWblwNl_cd-hb--sq-LQY2w0Rk_FmoRlSmnMbW-U2xFxADSA>
    <xmx:iRR1aGwE__1ZTP_dHaNsJNJU5-dyAbl9D_7kS7pmwtkHgK3tHc3N7Q>
    <xmx:iRR1aLfzzk5h2QRjAjFW1hCKTvRmAB1sKfgI-foyi6LnL1BXyKKIWQ>
    <xmx:iRR1aCcQdtkXu3U5pqJyjfBCKvgm73QV-IdmlfGmKCh-2qWURALUR-nM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 10:30:33 -0400 (EDT)
Date: Mon, 14 Jul 2025 07:30:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHUUiIHbJaCltawK@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>
 <aHUSgXW9A6LzjBIS@Mac.home>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHUSgXW9A6LzjBIS@Mac.home>

On Mon, Jul 14, 2025 at 07:21:53AM -0700, Boqun Feng wrote:
> On Mon, Jul 14, 2025 at 12:30:12PM +0200, Benno Lossin wrote:
> > On Mon Jul 14, 2025 at 7:36 AM CEST, Boqun Feng wrote:
> > > To provide using LKMM atomics for Rust code, a generic `Atomic<T>` is
> > > added, currently `T` needs to be Send + Copy because these are the
> > > straightforward usages and all basic types support this.
> > >
> > > Implement `AllowAtomic` for `i32` and `i64`, and so far only basic
> > > operations load() and store() are introduced.
> > >
> > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > > ---
> > >  rust/kernel/sync/atomic.rs         |  14 ++
> > >  rust/kernel/sync/atomic/generic.rs | 285 +++++++++++++++++++++++++++++
> > >  2 files changed, 299 insertions(+)
> > >  create mode 100644 rust/kernel/sync/atomic/generic.rs
> > >
> > > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > > index e80ac049f36b..c5193c1c90fe 100644
> > > --- a/rust/kernel/sync/atomic.rs
> > > +++ b/rust/kernel/sync/atomic.rs
> > > @@ -16,7 +16,21 @@
> > >  //!
> > >  //! [`LKMM`]: srctree/tools/memory-model/
> > >  
> > > +pub mod generic;
> > 
> > Hmm, maybe just re-export the stuff? I don't think there's an advantage
> > to having the generic module be public.
> > 
> 
> If `generic` is not public, then in the kernel::sync::atomic page, it

I meant the rustdoc of `kernel::sync::atomic` page.

Regards,
Boqun

> won't should up, and there is no mentioning of struct `Atomic` either.
> 
> If I made it public and also re-export the `Atomic`, there would be a
> "Re-export" section mentioning all the re-exports, so I will keep
> `generic` unless you have some tricks that I don't know.
> 
> Also I feel it's a bit naturally that `AllowAtomic` and `AllowAtomicAdd`
> stay under `generic` (instead of re-export them at `atomic` mod level)
> because they are about the generic part of `Atomic`, right?
> 
[...]
