Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B161547C9
	for <lkmm@lists.linux.dev>; Sat,  5 Jul 2025 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751729932; cv=none; b=L/hInaq5DnPli7tRgn3mQNjk2aKVHYnwvWnHqGZTPEjMfbIQ8GsD2F+F73nyJjqoD6ST6hFOLLdwOL6rIusjC/xPLtSVnLpU470cfebr0YF2saALiw+i+PBrKGcEgEjKKv7qufc8kLV7J3SJ/4W0VZ9cYDKnSY+lPKqhkt2Uxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751729932; c=relaxed/simple;
	bh=w/4wCIHiOILIKKaO3uWJyM2k8QFdMpFi1NUieOzGBYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmrg88uVtaJ2zXLP722E4n1B4BZQXIUKk63VUwvl4grzJ083GkJkIhKfHalldvauNrEkMz7HHLKx3KgSLDUM71tjRK0Uxd/k0Ej9Hl6oJyvjS+5etQLNH6wip+lekJzxybZIcntyNV+WWJG1/wRPl/lQqcjnXKVRlrUKzP9lvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUUm/z9K; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUUm/z9K"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a43afb04a7so13507751cf.0
        for <lkmm@lists.linux.dev>; Sat, 05 Jul 2025 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751729929; x=1752334729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ/sN9PcRmYb2xZcV5QzwVvcoPQL3EnCzeZjvTEzM18=;
        b=JUUm/z9K0ZWRw4+kJ7d7f5vb2kRmmwXr4woI88MwZKCukObCOvE5+BKHszxMYSOdkL
         WusxhxZJ+i7lMpBpmW0bEMqGvNV5M+LFOZrKHq8zutr//EUKfo1bipfCiRM9eQTsZ/Bf
         uywXum0vA3YJfEX9zfTASOizBIAfKCxCGkd08MHv9BADm9z4A+eLOcxJd8vVQl15eQcj
         h1jygtioyy3UuFEhktZUABXAUE3bSPfpefWOmX9/51Z9SbwgHwFJ0IyVXc4m3E9vMALY
         RFQDaxLOtvGiugaV7rNha9RYFzSHd1Rx4cBvXXNtGHZz2wZxb7bCXRkxVlpBY8SsYC0f
         5RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751729929; x=1752334729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQ/sN9PcRmYb2xZcV5QzwVvcoPQL3EnCzeZjvTEzM18=;
        b=D6Dyd2dS6UZ9QG4hKDqMc/YqUueeWQfIA/SYJOPuOBGzttSStSzu1nvvjtFMl7mOUE
         OsBuQFSbXIWnfhXQENuYMbR7r30fz6sF9uJ0cxecK1dSJFWm6stZgOrZSDLbVpZLL0az
         8brwteaXEECRVaeSuK6EiHmMRwsxFbNSlBm0NlfPnwebxjWIYeKQAtQ5L4M41tZXZ89z
         dr9UY94Mae9JuDZi1KN8YeypTQ2E75gB/OaSQ2n2jitbtyd1z3kGo5aFXFtAB5mDbie1
         94zRqeEtfeQUVDA5I/7DnZv0rMuS6LlQxBfutrJbpHIvdmm/AyTVBRmT5EV5zdNx2Ber
         wSgA==
X-Forwarded-Encrypted: i=1; AJvYcCXDz3CUHKwiCDJ/+vp6gmYj25S3Qr3cqQwEDxkEgaB65kb8Uc8YTOAskK+TAlsKiM5IHIa+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb67Afbrd8n47hs+DHifV4ectG2SD8XePhMMZH8/+rpwYRBnKP
	zvOOUyXyJixFBafaTHiZqqANM4s83dIHNW5I5N4i2iitEuqBY6Osj6ue
X-Gm-Gg: ASbGncvlpGlMv+E64zh5UWC0grbTZNlGC6swffybfNWHfpcvMOviL4wkqbdKm1vpJ36
	dnNG4ewkUfiTpi8yiC6bOvGO7GOe2h1GOHmYJeLT5wKip2JQD1V18hVErnWOAKEkFg7xzHaux84
	36GPWVcezlRQtSZY6fn7ZyaBE6UzVhQbuCdssJ4Pq3r+vmjhfGtoTSsusC6ilD27fvYlrkZAuNh
	C05Pqqqqym3LbZAbEbkPOt3iDq2E2OL5O6Sfvf1EzrooiDwimoT3TzZmr/RqxYic9Yo/9YOQdHQ
	3CLwWN06BydSxr70KbivYfm6xF48PvvRGEdQ3zhwLWiXsnHRjepZjF4gXY6lTxNT8EzMyS2mRLx
	/ih4m3K7h2GvljP6EK6VQHWb7MFqtlZlQ1yQz9F8p6ck2HxtT06R7
X-Google-Smtp-Source: AGHT+IHHL3ASU6E+ZFGjAUSSw8MAtj8MqQKtAXgxglUudRNSb0T3m7GA1wjGTuBfhU+3i1PbN0FVyA==
X-Received: by 2002:ac8:5e4c:0:b0:4a7:1401:95a0 with SMTP id d75a77b69052e-4a9985fb1efmr80488841cf.2.1751729929224;
        Sat, 05 Jul 2025 08:38:49 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a8e1ebsm32428561cf.59.2025.07.05.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:38:48 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1CB3F4006A;
	Sat,  5 Jul 2025 11:38:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 05 Jul 2025 11:38:48 -0400
X-ME-Sender: <xms:B0dpaNimO6K0-B0n5C_YLNI9P_s-iGWW2Lef8H1vDMcvo6SyNP0Tog>
    <xme:B0dpaCA2YhIhPsXfSiVjgZs03X31GWmAkZkZ6AHLGlItDl1KA_htQdKRduUXI61iQ
    BoEx3c_z2TIdY7qxA>
X-ME-Received: <xmr:B0dpaNEjUq210UAEMj0F1QwuBe5DIRTYiHvlOsu7dJEwZQdcwTP10IT4bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:B0dpaCRyth8SKKS8vPob41UvF3jXdic9JSmUREsRFh2Auk4fB1d9vg>
    <xmx:B0dpaKy1rhj1W45y0sJtO6DZFP_TS35g1o3vXj5pN1UC62JxWKQJTg>
    <xmx:B0dpaI5-Ep3QQYm_vwQ8ZPs6rpDc9bKXq7c0UPCbj_tipsdkPZFZhg>
    <xmx:B0dpaPwHGcDlwPB3nLWeEQGy5PwAz9BnR9pGCNVJ10UQj0waolf6Cw>
    <xmx:B0dpaCib1TTHSYgcqGKyvfgP95y_JWQS98B3QWk0b-LDSO0kUtypeLfb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 11:38:47 -0400 (EDT)
Date: Sat, 5 Jul 2025 08:38:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <aGlHBqoqTA2PCXbJ@Mac.home>
References: <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <20250623193019.6c425467.gary@garyguo.net>
 <aFmmYSAyvxotYfo7@tardis.local>
 <aGg4sIORQiG02IoD@Mac.home>
 <DB3KC64NSYK7.31KZXSNO1XOGM@kernel.org>
 <aGhFAlpOZJaLNekS@Mac.home>
 <DB3MQ54N1FLA.3RTNYKTJFDNYY@kernel.org>
 <aGhiEZ4uNzEs4nah@Mac.home>
 <DB3YRHR9RN8Z.29926G08T7KZ0@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3YRHR9RN8Z.29926G08T7KZ0@kernel.org>

On Sat, Jul 05, 2025 at 10:04:04AM +0200, Benno Lossin wrote:
[...]
> >> >
> >> > Basically, what I'm trying to prove is that we can have a provenance-
> >> > preserved Atomic<*mut T> implementation based on the C atomics. Either
> >> > that is true, or we should write our own atomic pointer implementation.
> >> 
> >> That much I remembered :) But since you were going into the specifics
> >> above, I think we should try to be correct. But maybe natural language
> >> is the wrong medium for that, just write the rust code and we'll see...
> >> 
> >
> > I don't thinking writing rust code can help us here other than duplicate
> > my reasoning above, so like:
> >
> >     ipml *mut() {
> >         pub fn xchg(ptr: *mut *mut (), new: *mut ()) -> *mut () {
> > 	    // SAFTEY: ..

Note: provenance preserving is not about the safety of Atomic<*mut T>
implementation, even if we don't preserve the provenance, calling
`Atomic<*mut T>` function won't cause UB, it's just that any pointer you
get from `Atomic<*mut T>` is a pointer without provenance.

So what I meant in this example is all the safey comment is above and 
the rest is not a safe comment.

Hope it's clear.

> > 	    // `atomic_long_xchg()` is implemented as asm(), so it can
> > 	    // be treated as a normal pointer swap() hence preserve the
> > 	    // provenance.
> 
> Oh I think Gary was talking specifically about Rust's `asm!`. I don't
> know if C asm is going to play the same way... (inside LLVM they
> probably are the same thing, but in the abstract machine?)
> 

You need to understand why Rust abstract machine model `asm!()` in
that way: Rust abstract machine cannot see through `asm!()`, so it has
to assume that `asm!() block can do anything that some equivalent Rust
code does. Further more, this "can do anything that some equivalent Rust
code does" is only one way to reason, the core part about this is Rust
will be very conservative when using the `asm!()` result for
optimization.

It should apply to C asm!() as well because LLVM cannot know see through
the asm block either. And based on the spirit, it might apply to any C
code as well, because it's outside Rust abstract machine. But if you
don't agree the reasoning, then we just cannot implement Atomic<*mut T>
with the existing C API.

> > 	    unsafe { atomic_long_xchg(ptr.cast::<atomic_long_t>(), new as ffi:c_long) }
> > 	}
> >
> >         pub fn cmpxchg(ptr: *mut *mut (), old: *mut (), new: *mut ()) -> *mut () {
> > 	    // SAFTEY: ..
> > 	    // `atomic_long_xchg()` is implemented as asm(), so it can
> > 	    // be treated as a normal pointer compare_exchange() hence preserve the
> > 	    // provenance.
> > 	    unsafe { atomic_long_cmpxchg(ptr.cast::<atomic_long_t>(), old as ffi::c_long, new as ffi:c_long) }
> > 	}
> >
> > 	<do it for a lot of functions>
> >     }
> >
> > So I don't think that approach is worth doing. Again the provenance
> > preserving is a global property, either we have it as whole or we don't
> > have it, and adding precise comment of each function call won't change
> > the result. I don't see much difference between reasoning about a set of
> > functions vs. reasoning one function by one function with the same
> > reasoning.
> >
> > If we have a reason to believe that C atomic doesn't support this we
> > just need to move to our own implementation. I know you (and probably
> > Gary) may feel the reasoning about provenance preserving a bit handwavy,
> 
> YES :)
> 
> > but this is probably the best we can get, and it's technically better
> 
> I think we can at improve the safety docs situation.
> 

Once again, it's not about the safety of Atomic<*mut T> implementation.

> > than using Rust native atomics, because that's just UB and no one would
> > help you.
> 
> I'm not arguing using those :)
> 
> > (I made a copy-pasta on purpose above, just to make another point why
> > writing each function out is not worth)
> 
> Yeah that's true, but at the moment that safety comment is on the `impl`
> block? I don't think that's the right place...
> 

Feel free to send any patch that improves this in your opinion ;-)

Regards,
Boqun

> ---
> Cheers,
> Benno
