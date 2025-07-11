Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0F1F583A
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244762; cv=none; b=mQY+88uORKqqO7lktVtajd65RuTFspibOMSAIOdcPVE+zfOJR/xmoef8OkouxviTQC4nwomeu14oNHXIVEsxV8i6+2OIDI1/jTha2N4eRejqJqm1EkHw3islwut6z3x5NwVd+NOVSm+14Vo4mN2/bZ0JrzRujKNEaKOin8y3Df4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244762; c=relaxed/simple;
	bh=M7+e+e1rmKuD/oko475gmT7iuj8HXmG3rZODkspkF08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QV4soe47FAb6eda7GGSvx/BOLPoyqj7XAXAPVzo3TGjN6FuINRqrBVoKPdwtNqsYn/qwEr3hMiDlpTRkHRFox6/UU5M79aHvER2SKT1mviGTyVQ6OcGCrk5PRgtlnLO3uD8VcZxzynsk/QMa+CGn08SiYRvzDpkbfzK9E/tR4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie90f07g; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie90f07g"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a6f3f88613so20536851cf.1
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752244760; x=1752849560; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FafGssQJy1j7DrCNrsdYFCExWgvC1bwETw0T/9WZrW4=;
        b=ie90f07gl/qXLWJYUjxrA5JChaLp5HeEVlGPynq2Etk5S+Dg+CppuLbFaL2NM5HrIl
         TjYYSS9RKIujKeKaDzQfpGN1srEm7jxGxm0Eq9wUCFFzx0sy/FVYRXSqPAjKzvd0IGLI
         yYBPo5GK6sh00uSxKtLV2uvOh+5I/Iv2RniWCTkasY897tsCuHcuWph1MtLlzsBqZt13
         EuLJ/TKP5j/g+CvxPX4Aut7vThRGqYbIw1fNwdrPSEZpbO48NY6ii5/haK77efhYzKSk
         6qBlUgIi0+2mV3ovtzhNpN+Kq+mKGb6PnplmCgdecIgzXPI3Old/83Ob0dxYfkg07U6E
         TQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244760; x=1752849560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FafGssQJy1j7DrCNrsdYFCExWgvC1bwETw0T/9WZrW4=;
        b=Bm5gRY1NyRfEbn8cYhhjTdJ6A0IolZChnSbckduem+oCPhLRxzNuBm9DVmBBaW/CaF
         hBjUGLF6a1wWhn0kBAZeFGlKuM4NODvA4sldXFQNJYVpvNnjd1TlFetSFMXOpql52yQ+
         UYMfKGKxCpW5twtS+hBNLi1eK+jgg785dAajQjuO3FTxbBNEbE/YaY313Xl50VkHa8xC
         rN8iBn6UgN8J4yqNYDMSeYnE2FLXAHF7wOjtfkjO/yJRzWhW6RFa4tk0NoOZf2g2/MYu
         LfEJiB0Ue1iKRC4QDbZc+2D8EPIdQpJznBotTvdJcm9PS/h7eEgOxSIMpBjoJDqlyNjZ
         2BVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEvVsxxrr8OJ5TaCRbHnKGiGv5bZciycgPRztMZHBTrXX5Au2IDGfTC6jZeux5KL9RJvXI@lists.linux.dev
X-Gm-Message-State: AOJu0YxjaF91hrJZHzdjZilT5VhiQtAqFsNsZgcQ87coObBYa7NRvhva
	fpq0kqWRGK8o+Iih/rEfD6ZsF74SCgn2wqBaKnm87LlCGanJitRO9x26
X-Gm-Gg: ASbGncvHNat0kjgOM7H4zZLlsxynOSp5MEhpgZm+h+8mHfJnq5vaLe8s5YX4Iet6iKY
	rYwviVMrSMNsiCCuRCfbbkH38NrzCESfMbtGYxpTMFoxC2bGy0ZeLmfIh1JECW5Ql0pvSnfb9JG
	g/r1CBqqHesVg6F2ap0lJViJFO0Iu+Os6Z7ZzLwIKyAxEftLul0mxk77xYmMObqrgt+CyBznupM
	Yx3KtgwYRfVwFsB2vI9000veiFf2HaWEv2ISSB2rlNYarNkplJ5k0G74QnJxdBJ1KUA0sckavfl
	Y3Ysg+gmVZsYkAhx9ayk8MKj34FoT3NsF73qUacPr6Kkq9UQqwh502XA8uzwwbvQZcnsymdGwoT
	1KCqtEXfjFDXjl6rgq6vjZpgb8GgpJBWrgVvVa4MLRDjKt0r9uE5vR/PUxid1gIcphVbfJPwIoF
	YVk7we1imK/B8C
X-Google-Smtp-Source: AGHT+IG7i69rdabJU4rCgv47216T/BQiZX74rLkmqajWAIdu3sM+sbPVU9v9PkHjIiFax5nwv660QQ==
X-Received: by 2002:ac8:7d0a:0:b0:4a7:14c3:7405 with SMTP id d75a77b69052e-4aa35e677c6mr57233671cf.27.1752244759405;
        Fri, 11 Jul 2025 07:39:19 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9ede76d65sm22250241cf.41.2025.07.11.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:39:18 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD947F4006A;
	Fri, 11 Jul 2025 10:39:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 11 Jul 2025 10:39:17 -0400
X-ME-Sender: <xms:FSJxaPomWN0RXF4YL3OPPbNk0-4TlQoNQGmaP654lZ7Idwn7VJTzQw>
    <xme:FSJxaLKd1nVamV4_WdbqpYfSr4_0VTYpxTe7XT6VKNkgc43DjolEdxqbxr7Rrt7l2
    ARAK7-w1A4ez5fieQ>
X-ME-Received: <xmr:FSJxaAxwNv7SF_RvT1nWAFqlll7HRqzPfNP-R07dV0pqXoODAfgXJl-LjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
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
X-ME-Proxy: <xmx:FSJxaCYn2nwj2LJUfEy6CFRGqD1Qo_cViDz7slCYE6CuQ2MG9CtNpA>
    <xmx:FSJxaM4mDusLEsrKkZR-mRnhkzgCanL2F9Jl9fI25Nyn0aHBPio_lA>
    <xmx:FSJxaDCwb78MsA66_pNzY4yDY416kLdfNaa930Zc92wuL-nDDOaL_g>
    <xmx:FSJxaCsuyjaSIP9EQO5e7j13oI_1UvTszZZWSodCFwSoLKhZmWmE5w>
    <xmx:FSJxaIsr4tClwP__41Ow6u40S9uL87BCRUxIW8zIVtKuchr3DA606lEB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 10:39:17 -0400 (EDT)
Date: Fri, 11 Jul 2025 07:39:15 -0700
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
Subject: Re: [PATCH v6 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHEiE0OoA3w1FmCp@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-7-boqun.feng@gmail.com>
 <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>

On Fri, Jul 11, 2025 at 10:53:45AM +0200, Benno Lossin wrote:
> On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> > One important set of atomic operations is the arithmetic operations,
> > i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
> > make senses for all the types that `AllowAtomic` to have arithmetic
> > operations, for example a `Foo(u32)` may not have a reasonable add() or
> > sub(), plus subword types (`u8` and `u16`) currently don't have
> > atomic arithmetic operations even on C side and might not have them in
> > the future in Rust (because they are usually suboptimal on a few
> > architecures). Therefore add a subtrait of `AllowAtomic` describing
> > which types have and can do atomic arithemtic operations.
> >
> > Trait `AllowAtomicArithmetic` has an associate type `Delta` instead of
> > using `AllowAllowAtomic::Repr` because, a `Bar(u32)` (whose `Repr` is
> > `i32`) may not wants an `add(&self, i32)`, but an `add(&self, u32)`.
> >
> > Only add() and fetch_add() are added. The rest will be added in the
> > future.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/kernel/sync/atomic.rs         |  18 +++++
> >  rust/kernel/sync/atomic/generic.rs | 108 +++++++++++++++++++++++++++++
> >  2 files changed, 126 insertions(+)
> 
> I think it's better to name this trait `AtomicAdd` and make it generic:
> 
>     pub unsafe trait AtomicAdd<Rhs = Self>: AllowAtomic {
>         fn rhs_into_repr(rhs: Rhs) -> Self::Repr;
>     }
> 
> `sub` and `fetch_sub` can be added using a similar trait.
> 

Seems a good idea, I will see what I can do. Thanks!

> The generic allows you to implement it multiple times with different
> meanings, for example:
> 
>     pub struct Nanos(u64);
>     pub struct Micros(u64);
>     pub struct Millis(u64);
> 
>     impl AllowAtomic for Nanos {
>         type Repr = i64;
>     }
> 
>     impl AtomicAdd<Millis> for Nanos {
>         fn rhs_into_repr(rhs: Millis) -> i64 {
>             transmute(rhs.0 * 1000_000)

We probably want to use `as` in real code?

>         }
>     }
> 
>     impl AtomicAdd<Micros> for Nanos {
>         fn rhs_into_repr(rhs: Micros) -> i64 {
>             transmute(rhs.0 * 1000)
>         }
>     }
> 
>     impl AtomicAdd<Nanos> for Nanos {
>         fn rhs_into_repr(rhs: Nanos) -> i64 {
>             transmute(rhs.0)
>         }
>     }
> 
> For the safety requirement on the `AtomicAdd` trait, we might just
> require bi-directional transmutability... Or can you imagine a case
> where that is not guaranteed, but a weaker form is?

I have a case that I don't think it's that useful, but it's similar to
the `Micros` and `Millis` above, an `Even<T>` where `Even<i32>` is a
`i32` but it's always an even number ;-) So transmute<i32, Even<i32>>()
is not always sound. Maybe we could add a "TODO" in the safety section
of `AtomicAdd`, and revisit this later? Like:

/// (in # Safety)
/// TODO: The safety requirement may be tightened to bi-directional
/// transmutability. 

And maybe also add the `Even` example there?

Thoughts?

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
