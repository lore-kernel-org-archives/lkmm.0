Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC518DF6E
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752261969; cv=none; b=kek8IfhNb9KY0MROrExKSPqGkneIhMPxueAwaH6itBzcC4O2FT5CZ9mI5wuMp7nOMPpLP0e6P3Mk4GLaK9gUFnUf9mDHs9grM5EhbqkwUbN/SYKTebW0wuH1ANME7pAA/oHDBx3gzXZXOOicZS1tkRxS+kkBLVmAdrbAKgMfI2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752261969; c=relaxed/simple;
	bh=Nj2/9SXax7e+BLCGe4rwQQy+Qk8F42MdceTDjpf/rDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6U5WeMIcRtYwTZZRrGqBrSG1vFdqActbJGWpJsnz3eyueEButMJpX0VK280b6B/LKWZ1iTd7Njk5WedyLnu+Z3Bf2qS0LLPUtLLOzS2PNYgLYmu0/QsQpPuadtc5ru5auP1k8uZ+EFOX/HZHwZMwnroaoAnSfX1SjkWpvKnSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSKO2Lbz; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSKO2Lbz"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7dfff5327fbso99072185a.1
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752261966; x=1752866766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwfSF5Ou0Fh5wm9fluMBnRsZ0sojeKWafBTdf2xAt2w=;
        b=MSKO2LbziZAzqemaNBWUAVt/u99MpbINQm1QW2eM35/bVGgIK+GMOn30VPMhkVmEwn
         OjoIeWdHnx4X/KB4AQBgodycFWcut0zEICjB6Ho/9H4L2PWqyzJ19mNsIJLipDsrdUIG
         AWignpsTFnwgZOaZkYo7lwrxWXqXdxFGs7j+vjTLHUu2a8OOc3OCkm50FixwmvyAXJD2
         Ph8+URznBohEdp43RDEKBMD3g5p1MWro+NIeNbS0ZucX94pyY1YUEiEby7BBWqDE9Q5m
         HvfRIWr2i8qmhCvbFEvtoFFeDYRYrRFpSzNOf9UV0vjBBsnRavw4MNkl9YIH6d65+0MS
         TSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752261966; x=1752866766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwfSF5Ou0Fh5wm9fluMBnRsZ0sojeKWafBTdf2xAt2w=;
        b=qXwOLxQEeZi51HsUvbeA5LWul7x7I0A2DlevZZfKFgOKh5VRb8uMnEgXftgY6DeJve
         ufoW3a/Mst4SxcalYDfs9zR7N/IJ77aJb81Lz297azbcEnbKTxksEdi0L2eCRGzaF4Tx
         fwqwA97CZeFwDjXVEBB2xeXspjRN6o5NNmt+HTZLCmpQ2e3dSYse3aJ5iQ7OL5Gx0nA2
         PBga2eLlIxFiC5TFzK0DaNXBTEfzj+fb6kY39kP2CwksiuGKZ1/e+XYPiVEPfn2SMefw
         HxwYY8nP0O1M0Ix6gviN6CsYdSSTtAta2DgFRjznGYRaxUYC9JaFDKjokf6VYI5uI/MG
         1DRw==
X-Forwarded-Encrypted: i=1; AJvYcCVAW++vZu5JQp42MD+3seorYBpWBIRl1Id0bRO2Hasoi0CK9PZz9y+tUCV0KMspWlvW5G0Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwePM+LRW4oWWImqfd0vIHf6Ttklq+qrrFUxpWyU0cPHmZNr+qG
	A9va8fIQnloNLeboWQlTmqY/oqGX3v+vQrMc4SWnqnxhVaf7TqipMtiK
X-Gm-Gg: ASbGncs8FZeQTMUZ6Q1wmWZ8BrX4Zf8UMo+NB+obuWIuEHGbw0u5/bI1yQ+2rx30DTv
	TqNFF9gvV0VBqD4TBx4+hDM5SZRR1nSUe2yfvFdRCe7o15d/prx33KWOFjr+4qIeZ5Vm5xehWB0
	vnhFpY8l7QBnEwsTGf8pwIuaB3WPus55ENgX9AE5nQiAP0sMtPTOK1Ix+uLaJKaAnmXbGsR1SPY
	D8Jl/m9U7lDChKxV+dlOhgJf1BFPwSm2ePKLccqISuzI/Yg03sBkx+sccBSs8qmDme+84HeG+Qk
	DlxKwUzUMfHxgO6rd0gMeYxOWtySgjhaBZs35icEBsEXrq7uhqq35kkzZP2jUp87A9jyv0+T3AU
	Kv49qlLroAoIOTxyVXdcy8EfWZjeA0PSQiJO/a+wYISNWLb5/37q+fEeFda9TBbMs5EYb/25+er
	9bO6Djf8ErzI1k
X-Google-Smtp-Source: AGHT+IEe54GCWKEIEGuTF82+GhJW28o7mntY39+AcMUpIh0AY0EaceOmMdD3EnQvJES3Xw4UwW2hfg==
X-Received: by 2002:a05:620a:1a2a:b0:7cd:ca60:7bdc with SMTP id af79cd13be357-7ddec83adfdmr874233285a.48.1752261966090;
        Fri, 11 Jul 2025 12:26:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979b48bdsm23045806d6.28.2025.07.11.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:26:05 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id CAABEF40066;
	Fri, 11 Jul 2025 15:26:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 11 Jul 2025 15:26:04 -0400
X-ME-Sender: <xms:TGVxaEr3t-y0z3XbQJS5uzsszc86CQxpphas6KuDseyXVuXOyGTPGQ>
    <xme:TGVxaMIvioDaOOA2igtomooNDMlwuGV8q2LGQbo8SHxVB1Bmuyp_vqXBVq4U20Ec4
    GQMpfZsBLY5iiwdcw>
X-ME-Received: <xmr:TGVxaNwApmjLEjY-H2oQhTCl8aZ9BiXyygvgn9IY9m0TB9uIbV34KgN6CyvLhFPnoChCzFwX7SUzXtgHBxvO99D7h3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeduhecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:TGVxaLavNepknuDm-QvASV8tWdMIZsevdvKaRVxnaEcKLJFeR0BX2Q>
    <xmx:TGVxaB6seHyJc022EtIc6Y1isic1FIUjMOdneqUcH56R8LiXkz6F-g>
    <xmx:TGVxaEBTUKPM-iqLtc-n_fBKjSj91raYcofBFUmbu4mD9Sv2JweqNQ>
    <xmx:TGVxaPv7r0ITUwP3NzMR5WT11V0J5EREL9VJwknJ_eeTgIsSx18KsA>
    <xmx:TGVxaButY3S48qkXy9UX3a6JPI8IckyslmdVOOwu-jkXHFz6nzGBVeUd>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 15:26:04 -0400 (EDT)
Date: Fri, 11 Jul 2025 12:26:03 -0700
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
Subject: Re: [PATCH v6 8/9] rust: sync: Add memory barriers
Message-ID: <aHFlS96FTRgS0dH_@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-9-boqun.feng@gmail.com>
 <DB93NWEAK46D.2YW5P9MSAWVCN@kernel.org>
 <aHESYzVOTCwADqpP@Mac.home>
 <DB9GF0U3JJWL.3FQFMRTBO52C1@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9GF0U3JJWL.3FQFMRTBO52C1@kernel.org>

On Fri, Jul 11, 2025 at 08:57:27PM +0200, Benno Lossin wrote:
> On Fri Jul 11, 2025 at 3:32 PM CEST, Boqun Feng wrote:
> > On Fri, Jul 11, 2025 at 10:57:48AM +0200, Benno Lossin wrote:
> > [...]
> >> > +}
> >> > +
> >> > +/// A full memory barrier.
> >> > +///
> >> > +/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> >> > +pub fn smp_mb() {
> >> > +    if cfg!(CONFIG_SMP) {
> >> > +        // SAFETY: `smp_mb()` is safe to call.
> >> > +        unsafe {
> >> > +            bindings::smp_mb();
> >> 
> >> Does this really work? How does the Rust compiler know this is a memory
> >> barrier?
> >> 
> >
> > - Without INLINE_HELPER, this is an FFI call, it's safe to assume that
> >   Rust compiler would treat it as a compiler barrier and in smp_mb() a
> >   real memory barrier instruction will be executed. 
> >
> > - With INLINE_HELPER, this will be inlined as an asm block with "memory"
> >   as clobber, and LLVM will know it's a compiler memory barrier, and the
> >   real memory barrier instruction guarantees it's a memory barrier at
> >   CPU reordering level as well.
> >
> > Think about this, SpinLock and Mutex need memory barriers for critical
> > section, if this doesn't work, then SpinLock and Mutex don't work
> > either, then we have a bigger problem ;-)
> 
> By "this not working" I meant that he barrier would be too strong :)
> 
> So essentially without INLINE_HELPER, all barriers in this file are the
> same, but with it, we get less strict ones?

Not the same, each barrier function may generate a different hardware
instruction ;-)

I would say for a Rust function (e.g. smp_mb()), the difference between
with and without INLINE_HELPER is:

- with INLINE_HELPER enabled, they behave exactly like a C function
  calling a C smp_mb().

- without INLINE_HELPER enabled, they behave like a C function calling 
  a function that never inlined:

  void outofline_smp_mb(void)
  {
    smp_mb();
  }

  It might be stronger than the "with INLINE_HELPER" case but both are
  correct regarding memory ordering.

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
