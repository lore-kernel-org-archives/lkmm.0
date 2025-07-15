Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09091D7E31
	for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752610443; cv=none; b=U9aZSDNxbl8RSM8HeYiLCxZQqMZ9Shi3eFxc8h1+SOymTpOBNekSh43fhcpiJB3XhFQgvFjrFvfpP0V4IAIpVXMGP2+lf1pU8X5XCndIW3xYOBT3dIzLTsStk76rZIfvfSEVqOhtK1k4mORapQbSsYVpXJJVG+eAFhkrJbifKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752610443; c=relaxed/simple;
	bh=tUKIxIa3CaOakXSITwT1h1ZlJa811sXdettoWNZ629U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuaHhCCEYYuKxGsV/PtdhMPuehtLBUqikGDpk53qNlIC9GF7eifw5uammK5PxumH2/tthT/I2b3ZhJFBb7sVmrqh9pcy3TwvY5lxv1A8+w/5teS18kAr5ch91M7gtzj0mJRihbyJMOb3ir9VC1vCdm1u0u3HJrvGs2Npfv9fiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGezbrXA; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGezbrXA"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-701046cfeefso87498076d6.2
        for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752610440; x=1753215240; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7xFafhakUM1HbJhSYPMWQX2H9PQ7AUwvEZGQtQZ7k0=;
        b=MGezbrXAERil9GfVKWQJJMp/Wo4uk1HBQRkK5KNF1juXgJqitAW6ekphGJ5eAGHRYB
         ozaSQu3eASF1jy2xWnnOyj5ttTCWKXFQ5UDqCP5EyVLoaFIPEVhfoOrvdKwrawYrdLvJ
         3SsXORzqcS9nN/wIchs1wx5wxhMQ5X6BwKlM4owc5lTxofGBNUo8/hLgmXIuxKaGDilG
         CGAWK2S1D9wbk/u1P2ejgdGPLY+C3SY2J9dAM/rIrPM7JOGom8QHvetrXpDUivX/dtSG
         D9NPTFSTiYPbufh/8EUve9vLUTBOeBS8fjNhnYkZsmk6cQ5fR8dvkQAcNUsjR4ei3mGy
         MjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752610440; x=1753215240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7xFafhakUM1HbJhSYPMWQX2H9PQ7AUwvEZGQtQZ7k0=;
        b=D+PLWhrLc+pUhsMbsziYXmOaykqfXP9/CwHph+LPWd0cNwkIqg1J39N4FurhdcKrpu
         P+2vuoZKzN40woDMgoR8pCf26VotLsIsG8XCYBBT6M75CRpPuFy98KvPbksIh+QpCLMg
         AvJBUJQuTMDwLUvS04WXzgS5mmFJYQ6YdcUETgDfSxbxA2+xDmYD/Hk/dI7tqAaVJpJr
         YRYEyN9dkWowY6vg9yReXARo8Fs6ZsrxWCdC7L9dydgZ7RCsUYRNtpeYOq1giqwJsZ9t
         jHSNCEk6xGdd43MtXIZgdgy90cduGb2+N+vc7JXdgah1eCntlDjqiYHF/DInlB1v9Ra4
         uMUg==
X-Forwarded-Encrypted: i=1; AJvYcCWWXtOZJuvB3B5aNdYbj3yM2lB9bcH59XycBWgFLBAliA8DGjWGN4/+cEn3NAtPfm5eMKhc@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtbi3IB5RxzFSZIhXZiutbyibvlHoLK+2uYvAEwSXy4XIa/xep
	g6wjLSt8O7Tm3AplVVfVxuKT+UgPlsv6Trgpx9ER8fnnuRCvKdDzdE6i
X-Gm-Gg: ASbGnct+m8Zv/UrePIqOwKmXh5ZcXSK98lUgEzoPGCpekZx0KqZESCn6tw+Ii2dKr3a
	BWybG48/0GE1ebkDwXd8QI+VPW5iCqwUVEuSSIUQ/zJnpM0dZt1BZ/+pUEvaxF3YvUma8DZCXis
	4HHlxu3Z7Mbcdx/gW/MOEI7XuN5dr2rc5TF6oVl2WjS68Zc/Q6JsyYxyGAFD7TUDU6mvv94VMT4
	/2vV7PVi/MWcq8sXaKSU/nxaTC4XEIcDP4Hs9I7kR8RjU9FoQgISewx0Sg5lm67YLzDLuOEd/z1
	+Mr6Pn3RL8kUbgQlQTDcB62evo+AFVfOuzlC2tlvbIIzXAj3475a4jN6mIL4WM9jzNrU3qn2qvQ
	w6fm6yqgBrs3qGhjzXhYFSRPLLjL2Nie8a0sxJCRBWomDlzJ3MWcojRTPFrqsTpowtI5XrtVC3D
	S/d+HNrDoyPvSK+l5ZUwbOMx8=
X-Google-Smtp-Source: AGHT+IHrRn1XRiDw/2DyKdGpKsc5IOMs7BMfn8mm3TPOI8x/zXqt8VKyWJgjpZf3JENfhaBRucNqDQ==
X-Received: by 2002:a05:6214:3108:b0:6f5:38a2:52dd with SMTP id 6a1803df08f44-704f4ae09b3mr14680306d6.31.1752610440141;
        Tue, 15 Jul 2025 13:14:00 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d5bb30sm61431486d6.81.2025.07.15.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:13:59 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id DE456F4006A;
	Tue, 15 Jul 2025 16:13:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 15 Jul 2025 16:13:58 -0400
X-ME-Sender: <xms:hrZ2aOQguYBXCYizaoVh_Mdfktc64JY-qla5uQzihAIcsmn4VJuo4g>
    <xme:hrZ2aFRCYXZF_m5gyZBUzl32IIprvgIHmZOKsvsJS07eMn4NG_1kBOHPpfrpqawyK
    r-bQz9oT5e12j35cg>
X-ME-Received: <xmr:hrZ2aAYVgAoIF8GfhOOgZ1tIlsNhzL7Q5PTPwzqhKpVxgvO9q12jqzu7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehheejiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:hrZ2aJgB5sSi041ryIYq-gU1d_POGyWNLM_6wC6wHezuv96sf4OD-Q>
    <xmx:hrZ2aFiVdHs4FKDuQO2lB7M6xJnVVjWgfcDUKUiyL67hbnrQDrfDKw>
    <xmx:hrZ2aPK8lNUOlcQNfk6yu80aGvui298V_azJ5IUmFGxRjDnWFpagIQ>
    <xmx:hrZ2aMXo3uwPapl6ZtLUT263SCHYrwnRdSMK-aYwOdXEMLJTGX2BoA>
    <xmx:hrZ2aB37U4kCta5eSQqRGpgMmr28HUYMGgU0WMHea8rCWctUAMCGcXld>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 16:13:58 -0400 (EDT)
Date: Tue, 15 Jul 2025 13:13:57 -0700
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
Subject: Re: [PATCH v7 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHa2he81nBDgvA5u@tardis-2.local>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-7-boqun.feng@gmail.com>
 <DBCL7YUSRMXR.22SMO1P7D5G60@kernel.org>
 <aHZYt3Csy29GF2HM@Mac.home>
 <DBCQUAA42DHH.23BNUVOKS38UI@kernel.org>
 <aHZ-HP1ErzlERfpI@Mac.home>
 <DBCUJ4RNRNHP.W4QH5QM3TBHU@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBCUJ4RNRNHP.W4QH5QM3TBHU@kernel.org>

On Tue, Jul 15, 2025 at 08:39:04PM +0200, Benno Lossin wrote:
[...]
> >> > Hmm.. the CAST comment should explain why a pointer of `T` can be a
> >> > valid pointer of `T::Repr` because the atomic_add() below is going to
> >> > read through the pointer and write value back. The comment starting with
> >> > "`*self`" explains the value written is a valid `T`, therefore
> >> > conceptually atomic_add() below writes a valid `T` in form of `T::Repr`
> >> > into `a`.
> >> 
> >> I see, my interpretation was that if we put it on the cast, then the
> >> operation that `atomic_add` does also is valid.
> >> 
> >> But I think this comment should either be part of the `CAST` or the
> >> `SAFETY` comment. Going by your interpretation, it would make more sense
> >> in the SAFETY one, since there you justify that you're actually writing
> >> a value of type `T`.
> >> 
> >
> > Hmm.. you're probably right. There are two safety things about
> > atomic_add():
> >
> > - Whether calling it is safe
> > - Whether the operation on `a` (a pointer to `T` essentially) is safe.
> 
> Well part of calling `T::Repr::atomic_add` is that the pointer is valid.

Here by saying "calling `T::Repr::atomic_add`", I think you mean the
whole operation, so yeah, we have to consider the validy for `T` of the
result. But what I'm trying to do is reasoning this in 2 steps:

First, let's treat it as an `atomic_add(*mut i32, i32)`, then as long as
we provide a valid `*mut i32`, it's safe to call. 

And second assume we call it with a valid pointer to `T::Repr`, and a
delta from `rhs_into_delta()`, then per the safety guarantee of
`AllowAtomicAdd`, the value written at the pointer is a valid `T`.

Based on these, we can prove the whole operation is safe for the given
input.

> But it actually isn't valid for all operations, only for the specific
> one you have here. If we want to be 100% correct, we actually need to
> change the safety comment of `atomic_add` to say that it only requires
> the result of `*a + v` to be writable... But that is most likely very
> annoying... (note that we also have this issue for `store`)
> 
> I'm not too sure on what the right way to do this is. The formal answer
> is to "just do it right", but then safety comments really just devolve
> into formally proving the correctness of the program. I think -- for now
> at least :) -- that we shouldn't do this here & now (since we also have
> a lot of other code that isn't using normal good safety comments, let
> alone formally correct ones).
> 
> > How about the following:
> >
> >         let v = T::rhs_into_delta(v);
> >         // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is a valid
> >         // pointer of `T::Repr` for reads and valid for writes of values transmutable to `T`.
> >         let a = self.as_ptr().cast::<T::Repr>();
> >
> >         // `*self` remains valid after `atomic_add()` because of the safety requirement of
> >         // `AllowAtomicAdd`.
> >         //
> >         // SAFETY:
> >         // - For calling `atomic_add()`:
> >         //   - `a` is aligned to `align_of::<T::Repr>()` because of the safety requirement of
> >         //   `AllowAtomic` and the guarantee of `Atomic::as_ptr()`.
> >         //   - `a` is a valid pointer per the CAST justification above.
> >         // - For accessing `*a`: the value written is transmutable to `T`
> >         //   due to the safety requirement of `AllowAtomicAdd`.
> >         unsafe { T::Repr::atomic_add(a, v) };
> 
> That looks fine for now. But isn't this duplicating the sentence
> starting with `*self`?

Oh sorry, I meant to remove the sentence starting with `*self`. :(

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
