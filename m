Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0124DFF4
	for <lkmm@lists.linux.dev>; Tue, 10 Jun 2025 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581602; cv=none; b=HCHvBrLNh9pKR3ZU55WUL1FFR2MkL2fj2yijNHbmrG4v+9AZQgKQU1kc9VlaN0rdk0BAW4ctbnJKGj9Q5KoUR80O2FzRRu1lDkdRSvticb6RjR35mm1uvcFKW0hPUsmq8xHn8O+Xs7XocGhZfjcu/cazsqK6IH2Tc332v3Yo6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581602; c=relaxed/simple;
	bh=2sYXZ0RhTfN6SLKrFXrz5MrrSIww26BY2I8L1m2I4bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nD3pzm4KJfDdL5yF0wmlsmBZvYJxbaP9p9kPC0oXkzNaxN3bT2iy/UxPE09x1oD3d/1NRC9gB89Tn6SeUJCsO6TbrMP0XNzg1r9swbBJmnmoUMt9gqyiwFm5nJbHSHPaAK9759y5fH54qvEWk3ZjFXaSgrP9flKCw7pMYYZmRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU/QPNq7; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU/QPNq7"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6faf66905adso37047196d6.2
        for <lkmm@lists.linux.dev>; Tue, 10 Jun 2025 11:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749581599; x=1750186399; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W4Rd5KefmDkCudiFgqafP7/SrHNUHS7n6T+k5okKnc=;
        b=cU/QPNq7Ujgl9bl5+djnf2nVS32bB38jqvWt151oL1a6B1AeKspHPPbNMXIMKpcjjg
         C0xczgHIoL3RkWEtKNubQJf5+rLIsLslQ16cR6z1rqRnjVme86v5VfkncE2OLcF1XnUK
         aLWPiYh17H1oPA0mdGVV/52S4jPkzZSnDth37KsRCVmHVnMN/t1HWR6Z/UGa+NC7ESBU
         nTGyM1HRoSDcVMiAFZTW9GhqhvC8U52e9OtkdgKt96lj4CQz3uRXAC3+H2Uhu7w/zpeX
         SGmji3H6yKU/CL7vxWCiRQh73qcwP+AvanNtHOvVxBZN2lUEhwfGS0GjidZSkJ6KP1M+
         YegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581599; x=1750186399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W4Rd5KefmDkCudiFgqafP7/SrHNUHS7n6T+k5okKnc=;
        b=CJWjNhCyadaKzaDRhcUnErDGioFIIUR3QgRZISWeWRk3N1gM0vgWppddGcWKPMvNbe
         4BTa/Qic7MoUrIGCyPg44LjZdU8SEY8E725n2prA9votJAV8Tx5FXX22HLNcCKgciaL2
         9xLLqOktGN5n44wSflsbXKyhmrVf3NY5S8eZaXCEbPART9Rayq4zxFRBk4azDkjm7tqw
         zOH1DHJNFjbBDakeMOJ7ZU4YqbxkTHb1emFODlThHQN6LY2+qy8W8B4ccA0rmvOMxEtP
         oZEl34mzzXj4Z9/6GSrQdMfPR9F5JR4sF+US0n632vm6Nn8nqEGZR7UViRWHs6kdiXAC
         4pvg==
X-Forwarded-Encrypted: i=1; AJvYcCXhj9cFwXlBKHrwtbdC0v5o+2RTYYATDvNdZHsm31uWqs5GUCVRqg1VePCBaMigYuKaqIe/@lists.linux.dev
X-Gm-Message-State: AOJu0YyWNpEPU3nu9uusVBODGArwBH7Lpo5ZX9YfDdUf2lS63zcfhI32
	3GPBtFm/uSWEBrGrbOpA1zfL6XpvdqxK8MYhUSLofk+7B3/bK2GJyDQq
X-Gm-Gg: ASbGncvlHlVVPkNBAx5hzRBN6AwsL+7taL5IuMQMyWTZDk0ESGdk2AWJKWa6Ax+uqIt
	mkIMWu++swjqvKRme5hAWAE2v83Ain5yRzkH+80e6hiuG5Tu/0iw3C+uBgBRQ9jdWig0zcR1zbn
	w9F1ZV7UpiaTniPkHcTF7YjL3robV64WOWV/fOPVAQUjtLM7du3qCK4H0a0kvgn110/nTI35Oni
	UgtYKKOzi9aRgUncM5YFygW+3bntgdff/jzpc1nuzRTMNnCDklRlcT8X5YiZssj7KGYYzMK2j2Q
	zetKMQhnRVUBZhsroDevCCBEJOICoTp/oQ0YU65SIrb2tQD8qKk3lCYJ9+JbNaK9FLBji0K/zRr
	egpQS7bdbNnddxQz++YB95Xr0sjoQkWo5z3SOoQRgOgsMpg3xmvfj
X-Google-Smtp-Source: AGHT+IGsLUS3refGq1Aq3PCXL9ovqUJvkRe1R09gDL09foqsyUwG3LBkaN8kqM1V9gKlR8s3k/sTCQ==
X-Received: by 2002:a05:6214:b6c:b0:6fa:facf:7b7a with SMTP id 6a1803df08f44-6fb2c38f50fmr8109866d6.42.1749581599368;
        Tue, 10 Jun 2025 11:53:19 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1ce43sm70288386d6.76.2025.06.10.11.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 11:53:19 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 311CC1200043;
	Tue, 10 Jun 2025 14:53:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 10 Jun 2025 14:53:18 -0400
X-ME-Sender: <xms:Hn9IaMlf85k4pFlo_VYlAY_4sw5ROkg9KoPHN32aNpVWj1ZUIQNe6Q>
    <xme:Hn9IaL168BcNnsJ_72SBD7QyVzApEbicmYXCQwaIbn6L5ShSgwn4PTY-s-8qZ8V1v
    AUnNQP3X99op7N-3A>
X-ME-Received: <xmr:Hn9IaKpoRkM7YXAXR6o43uIZRd1eSl6CA6QjV2EmN1Xk3mHkB5W7tTOMMfvFDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgr
    hihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhord
    hnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Hn9IaIm4nhS9sZ5zcKYViVozQGHMpMBk6D14nRjPuARb8VIxeBHZcQ>
    <xmx:Hn9IaK1s74nE5ZxtjnS-LdtmtEacS4sL2a42_40WZNdR8HH6yUXx8w>
    <xmx:Hn9IaPtP94zItOp6ajpj3ELDTm-2mp8ODzHEaRwW6zyNU2joKFXjGQ>
    <xmx:Hn9IaGUhKg87272SdHQxfN8wIOgUpPXx_JwSvOuZMljYXHGa3M3wmQ>
    <xmx:Hn9IaN3CvbaGFAy9h2firCIOZAr4WeWhwcdqesmQ3h3p5tJoeH3aiwrB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jun 2025 14:53:17 -0400 (EDT)
Date: Tue, 10 Jun 2025 11:53:16 -0700
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 03/10] rust: sync: atomic: Add ordering annotation
 types
Message-ID: <aEh_HEwSh2w0Ajkq@tardis.local>
References: <20250609224615.27061-1-boqun.feng@gmail.com>
 <20250609224615.27061-4-boqun.feng@gmail.com>
 <DAIQG9ALK4QC.2P2C2MC4U9YVX@kernel.org>
 <aEhrzxltkdnub_bR@tardis.local>
 <aEhyRhb71dIXzqSu@tardis.local>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEhyRhb71dIXzqSu@tardis.local>

On Tue, Jun 10, 2025 at 10:58:30AM -0700, Boqun Feng wrote:
> On Tue, Jun 10, 2025 at 10:30:55AM -0700, Boqun Feng wrote:
> [...]
> > > > +/// Describes the exact memory ordering of an `impl` [`All`].
> > > > +pub enum OrderingDesc {
> > > 
> > > Why not name this `Ordering`?
> > > 
> > 
> > I was trying to avoid having an `Ordering` enum in a `ordering` mod.
> > Also I want to save the name "Ordering" for the generic type parameter
> > of an atomic operation, e.g.
> > 
> >     pub fn xchg<Ordering: ALL>(..)
> > 
> > this enum is more of an internal implementation detail, and users should
> > not use this enum directly, so I would like to avoid potential
> > confusion.
> > 
> > I have played a few sealed trait tricks on my end, but seems I cannot
> > achieve:
> > 
> > 1) `OrderingDesc` is only accessible in the atomic mod.
> > 2) `All` is only impl-able in the atomic mod, while it can be used as a
> > trait bound outside kernel crate.
> > 
> > Maybe there is a trick I'm missing?
> > 
> 
> Something like this seems to work:
> 
>     pub(super) mod private {
>         /// Describes the exact memory ordering of an `impl` [`All`].
>         pub enum Ordering {
>             /// Relaxed ordering.
>             Relaxed,
>             /// Acquire ordering.
>             Acquire,
>             /// Release ordering.
>             Release,
>             /// Fully-ordered.
>             Full,
>         }
>     
>         pub trait HasOrderingDesc {
>             /// Describes the exact memory ordering.
>             const ORDERING: Ordering;
>         }
>     }
> 
>     /// The trait bound for annotating operations that should support all orderings.
>     pub trait All: private::HasOrderingDesc { }
> 
>     impl private::HasOrderingDesc for Relaxed {
>         const ORDERING: private::Ordering = private::Ordering::Relaxed;
>     }
> 
> the trick is to seal the enum and the trait together.
> 
> Regards,
> Boqun
> 
> > > > +    /// Relaxed ordering.
> > > > +    Relaxed,
> > > > +    /// Acquire ordering.
> > > > +    Acquire,
> > > > +    /// Release ordering.
> > > > +    Release,
> > > > +    /// Fully-ordered.
> > > > +    Full,
> > > > +}
> > > > +
> > > > +/// The trait bound for annotating operations that should support all orderings.
> > > > +pub trait All {
> > > > +    /// Describes the exact memory ordering.
> > > > +    const ORDER: OrderingDesc;
> > > 
> > > And then here: `ORDERING`.
> > 

After a second thought, the following is probably what I will go for:

    /// The annotation type for relaxed memory ordering.
    pub struct Relaxed;
    
    /// The annotation type for acquire memory ordering.
    pub struct Acquire;
    
    /// The annotation type for release memory ordering.
    pub struct Release;
    
    /// The annotation type for fully-order memory ordering.
    pub struct Full;

    /// Describes the exact memory ordering.
    pub enum OrderingType {
        /// Relaxed ordering.
        Relaxed,
        /// Acquire ordering.
        Acquire,
        /// Release ordering.
        Release,
        /// Fully-ordered.
        Full,
    }
    
    mod internal {
        /// Unit types for ordering annotation.
        ///
        /// Sealed trait, can be only implemented inside atomic mod.
        pub trait OrderingUnit {
            /// Describes the exact memory ordering.
            const TYPE: super::OrderingType;
        }
    }
    
    impl internal::OrderingUnit for Relaxed {
        const TYPE: OrderingType = OrderingType::Relaxed;
    }
    
    impl internal::OrderingUnit for Acquire {
        const TYPE: OrderingType = OrderingType::Acquire;
    }
    
    impl internal::OrderingUnit for Release {
        const TYPE: OrderingType = OrderingType::Release;
    }
    
    impl internal::OrderingUnit for Full {
        const TYPE: OrderingType = OrderingType::Full;
    }

That is:

1) Rename "OrderingDesc" into "OrderingType", and make it public.
2) Provide a sealed trait (`OrderingUnit`) for all the unit types
   that describe ordering.
3) Instead of "ORDER" or "ORDERING", name the enum constant "TYPE".


An example shows why is probably an xchg() implementation, if I was to
follow the previous naming suggestion, it will be:

    match Ordering::ORDERING {
        <some mode path>::Ordering::Relaxed => atomic_xchg_relaxed(...),
	...
    }

with the current one, it will be:

    match Ordering::TYPE {
        // assume we "use ordering::OrderingType"
        OrderingType::Relaxed => atomic_xchg_relaxed(...),
	...
    }

I think this version is much better.

Regards,
Boqun

> [..]
