Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E72F3655
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752263511; cv=none; b=qR4hB7HWVd2IoDlmsx/lSB8+dhlSk31mqizhVZfSrtpNjVIV0v067FvX5Q7SdAKBsazbnqWq/RBrmUuD604WZq4mhfj32ehRqi0W8y/v8m16smzHis1SPULGqrp0DWgihZWFRvha3uryrxWd6EfG4OHdl35asaHtb+ZxOCERI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752263511; c=relaxed/simple;
	bh=dGpy3ADwM3rHOkm1xnXgVCqTRurvKQ73fjJdVhSmrfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH6nG5hnzrO0HsxiNRGaxG8D24i+ydRHbBQ3Rx2OwHlsAw3P3xw5hKIGr+j56dUT9QU4h1SYmnLXfZDBVXuFb3wsdjuanhyZtvbKTtmn85CotW5dji+e9MGGk3jDHBpw1TUNvhTubAZxyKh8e5Y6VzUf9mmerQchnyDkJ2oSbQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipbE83vO; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipbE83vO"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a43afb04a7so21107151cf.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752263509; x=1752868309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eIsVVz+Zj4/hQ0nCPWaAmy6Mmh9tpn0xByP7zOmsGA=;
        b=ipbE83vOrJg75dvE5a43eO1uZKQa1SKbwIuo+WDZ0w1WgWATqw1TN7ROAXGeBNpF4w
         H5T3fAQKl91IMJZUUnXcgT2HbOBEfXDG5jvpflNOfe8UFBDvlRnv7467vEacYBq1wjPU
         bc+69hsaqkHHsrDQhQB8idvSoBcAhDZSulcp49DYPk1UyFiObu6QmeI6fTza9lypRRG3
         hELPLyLiEsNTtxrPdQ2TIG+X0F7czzROnnGEJ8pbtVpv25yFn+jm5MdqBQIs4r0xi4sJ
         vPmrwqxKWvYgGVRKOI3tHaWEagFvF437Ruu7BrviSTWn9v/yb5KsbXY2ODstnw/LZ12/
         bf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263509; x=1752868309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eIsVVz+Zj4/hQ0nCPWaAmy6Mmh9tpn0xByP7zOmsGA=;
        b=QpSNfQa+nk0uExNhdWADPLflGu+cyjDsBUCZuuJdGbf0YPqDVhzAqCZ+8NyK0j5qQM
         lp2rOcIjUZQW9MDG8hpyByrTJCrXj2M+ka6JMffQWgwx3CGNHX/GtoKcvpp9VXugUpOu
         6jEB4CxNbnAOcuTmRxnCRRQ2gYrOOkc98X93uGddUg3P3Pkc0+9PpA0ASDXEun9hLUy/
         t1HNBhprSV+WPQmNFSAKkbuRxvg2nJ5cSH7LgOTClNsdez/aGHyPQVrxIwZCkti5UnbQ
         hffbiafgdvz8B3GZSTxcfSQDLlPjDjVRByc8sMCGgGd9XYJJAq9+zlNXEAnVHGt/sOJS
         3rLw==
X-Forwarded-Encrypted: i=1; AJvYcCXGJgy+6tSZ9ogBNpki39NaCYiiBJsPliO2cDm7msn3wjocKqHPxx5vzu21gtcLn17TAcM1@lists.linux.dev
X-Gm-Message-State: AOJu0YwnR5ESHFwHgM93cH2A/BM1R8u3BAho5xYCAoLKE3z6J4F9NvAn
	yRBhWH4i0uZBa9iPKE/tC3hSrf1owj0AuzddkEJ9tarJ0AvVJyXnX1as
X-Gm-Gg: ASbGnct+pNnjGnkmQ7ZWuscgQOjG3uSkRVrVe3hYdv3wAbidpknM3katk+rCtcVE0Mv
	SAc6nFiiKq/INL5lpfYddpSWjGyneYs+EaPFzwwHcB0XZfSGg+Z7z8Ett6MPkNPqkhSNdO5G8dS
	5z2H2OztaJi5rzVXCl/dU4it1bjitAOG3u8ZtrdbHTexC3ER9wGfqRQ9fLSPdaeZ0irmdLuuHR8
	4xXo0UxUs+qzm7WTI305Q5gCJCrJhVCt+TBDiM4gI1KdVSGPriGmgu8ne5NmYPghL5lz5RN8Yry
	0udsyYLpD3/ZlMPzQgFAT8xkaP2T/i3Su1Y7110Hm8ozJrZns6szWcr9IBEScPzsc8whlfx7YXi
	Qt/iZSvCzdiWoyTjUcmskOFIQQ3pD+3H5NpICvGY7ezJjhcJM/GOUZTbwHJ+ktGSws9Tvn6rNaE
	Uhp8xWZUhQKPTX
X-Google-Smtp-Source: AGHT+IFjF9Q+ILRFfbLq9/A+BNVpPwLxZ8g+g9WrQt/SnctUC6LOM/izS0XuFctOsoedPo+l5Ys6qQ==
X-Received: by 2002:a05:622a:653:b0:494:7ca0:2ff with SMTP id d75a77b69052e-4aa35dc5b8dmr60315151cf.15.1752263508891;
        Fri, 11 Jul 2025 12:51:48 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm24203831cf.73.2025.07.11.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:51:48 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54965F40066;
	Fri, 11 Jul 2025 15:51:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 11 Jul 2025 15:51:47 -0400
X-ME-Sender: <xms:U2txaCjpbyh1P3LJlAM4CdYX7gsj8z_BYPA5mfzFEch79Msb8Xq0Yw>
    <xme:U2txaEif0a0SeBtVpS0Cq3PuKMOVQ88cAbb4IUXzscvH_lK_qTaC4eSPSB3Ry01mE
    6BbsZC3arkxmSs6gA>
X-ME-Received: <xmr:U2txaOrgyuEaNq_IGIw_2Tvsy9UbJNf_V21iasjuqGUYFVPmKyTMujIgFcTwN8nUoYoG7IzBWC7d_wqKzajDFvUM0VU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggedvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:U2txaKypHVG1UC1eHp9JmKWHu9y2DgbrKBIlzihHPI2DwYPj2qt1nQ>
    <xmx:U2txaNwdmXpZUsveFcnnxiSdr7zWGDm-sNCVhgp1q96IxBsKQvqXZQ>
    <xmx:U2txaCZ1eZwo9r3-lY1Q388f_V9t83KaTr_Mo3fc7HnSn6ttttclOg>
    <xmx:U2txaOkOsAEFrzrqVuSBzRIx-rxS4EVB5_TORlPsNUGJc9vuKlIwHw>
    <xmx:U2txaHGQ1a9slMntFQA51w6TZFVdijZZgEpx9Y1_ReW0KUolvqJFnhw8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 15:51:46 -0400 (EDT)
Date: Fri, 11 Jul 2025 12:51:45 -0700
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
Message-ID: <aHFrUa3VWaKTe0xr@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-7-boqun.feng@gmail.com>
 <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>
 <aHEiE0OoA3w1FmCp@Mac.home>
 <DB9GDOR3AY9B.21YFXYHE4F0MP@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9GDOR3AY9B.21YFXYHE4F0MP@kernel.org>

On Fri, Jul 11, 2025 at 08:55:42PM +0200, Benno Lossin wrote:
[...]
> >> The generic allows you to implement it multiple times with different
> >> meanings, for example:
> >> 
> >>     pub struct Nanos(u64);
> >>     pub struct Micros(u64);
> >>     pub struct Millis(u64);
> >> 
> >>     impl AllowAtomic for Nanos {
> >>         type Repr = i64;
> 
> By the way, I find this a bit unfortunate... I think it would be nice to
> be able to use `u64` and `u32` as reprs too.
> 

I don't think that's necessary, because actually a MaybeUninit<i32> and 
MaybeUninit<i64> would cover all the cases, and even with `u64` and
`u32` being reprs, you still need to trasmute somewhere for non integer
types. But I'm also open to support them, let's discuss this later
separately ;-)

> Maybe we can add an additional trait `AtomicRepr` that gets implemented
> by all integer types and then we can use that in the `Repr` instead.
> 
> This should definitely be a future patch series though.
> 
> >>     }
> >> 
> >>     impl AtomicAdd<Millis> for Nanos {
> >>         fn rhs_into_repr(rhs: Millis) -> i64 {
> >>             transmute(rhs.0 * 1000_000)
> >
> > We probably want to use `as` in real code?
> 
> I thought that `as` would panic on over/underflow... But it doesn't and
> indeed just converts between the two same-sized types.
> 
> By the way, should we ask for `Repr` to always be of the same size as
> `Self` when implementing `AllowAtomic`?
> 
> That might already be implied from the round-trip transmutability:
> * `Self` can't have a smaller size, because transmuting `Self` into
>   `Repr` would result in uninit bytes.
> * `Repr` can't have a smaller size, because then transmuting a `Repr`
>   (that was once a `Self`) back into `Self` will result in uninit bytes
> 
> We probably should mention this in the docs somewhere?
> 

We have it already as the first safety requirement of `AllowAtomic`:

/// # Safety
///
/// - [`Self`] must have the same size and alignment as [`Self::Repr`].

Actually at the beginning, I missed the round-trip transmutablity
(thanks to you and Gary for bring that up), that's only safe requirement
I thought I needed ;-)

> >>         }
> >>     }
> >> 
> >>     impl AtomicAdd<Micros> for Nanos {
> >>         fn rhs_into_repr(rhs: Micros) -> i64 {
> >>             transmute(rhs.0 * 1000)
> >>         }
> >>     }
> >> 
> >>     impl AtomicAdd<Nanos> for Nanos {
> >>         fn rhs_into_repr(rhs: Nanos) -> i64 {
> >>             transmute(rhs.0)
> >>         }
> >>     }
> >> 
> >> For the safety requirement on the `AtomicAdd` trait, we might just
> >> require bi-directional transmutability... Or can you imagine a case
> >> where that is not guaranteed, but a weaker form is?
> >
> > I have a case that I don't think it's that useful, but it's similar to
> > the `Micros` and `Millis` above, an `Even<T>` where `Even<i32>` is a
> > `i32` but it's always an even number ;-) So transmute<i32, Even<i32>>()
> > is not always sound. Maybe we could add a "TODO" in the safety section
> > of `AtomicAdd`, and revisit this later? Like:
> >
> > /// (in # Safety)
> > /// TODO: The safety requirement may be tightened to bi-directional
> > /// transmutability. 
> >
> > And maybe also add the `Even` example there?
> 
> Ahh that's interesting... I don't think the comment in the tightening
> direction makes sense, either we start out with bi-directional
> transmutability, or we don't do it at all.
> 
> I think an `Even` example is motivation enough to have it. So let's not
> tighten it. But I think we should improve the safety requirement:
> 
>     /// The valid bit patterns of `Self` must be a superset of the bit patterns reachable through
>     /// addition on any values of type [`Self::Repr`] obtained by transmuting values of type `Self`.
> 
> or
>     
>     /// Adding any two values of type [`Self::Repr`] obtained through transmuting values of type `Self`
>     /// must yield a value with a bit pattern also valid for `Self`.
> 
> I feel like the second one sounds better.
> 

Me too! Let's use it then. Combining with your `AtomicAdd<Rhs>`
proposal:

    /// # Safety
    ///
    /// Adding any:
    /// - one being the value of [`Self::Repr`] obtained through transmuting value of type `Self`,
    /// - the other being the value of [`Self::Delta`] obtained through conversion of `rhs_into_delta()`,
    /// must yield a value with a bit pattern also valid for `Self`.
    pub unsafe trait AtomicAdd<Rhs>: AllowAtomic {
        type Delta = Self::Repr;
        fn rhs_into_delta(rhs: Rhs) -> Delta;
    }

Note that I have to provide a `Delta` (or better named as `ReprDelta`?)
because of when pointer support is added, atomic addition is between
a `*mut ()` and a `isize`, not two `*mut()`.

> Also is overflowing an atomic variable UB in LKMM? Because if it is,

No, all atomic arithmetic operations are wrapping, I did add a comment
in Atomic::add() and Atomic::fetch_add() saying that. This also aligns
with Rust std atomic behaviors.

> then `struct MultipleOf<const M: u64>(u64)` is also something that would
> be supported. Otherwise only powers of two would be supported.

Yeah, seems we can only support PowerOfTwo<integer>.

(but technically you can detect overflow for those value-returning
atomics, but let's think about that later if there is a user)

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
