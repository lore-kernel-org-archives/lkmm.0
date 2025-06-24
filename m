Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35AC2E2F07
	for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 16:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782927; cv=none; b=k2mnRAkyvxe5oN+IkGVO6oqpaQfv81TS9wjgObgW/nK9EmpYqouM0OMEVSJJtLnu2etuir+oh/F3X0DmtNDonS+71x5lQT/YF2P8ZpNEv3JdQTvbPviARo/9J6W9rcsRONVS+9ctbW+TqiqZxwkH4XI3I9fiSiKEjM/GGnfoK3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782927; c=relaxed/simple;
	bh=LjV6uqFkDZ7WeWyzUybyEtVZAFyO4GSfRKdGE3HZLG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X//VV2kfzYNUCnNFe1dWqykBWOYMnBJWXDciEeJeXsNCD1HVj2UGSi4JuIQL2YBh1DUupF3PkrRCEODwqzWB9O80QZOd8/O68MY/9+PdYE/gAS2SheMNjoPcviIv9YRBorTBtZ48xPA0mO3XpCrFx/BmbicnepH+UDPE+lX+w5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiqsjxBY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiqsjxBY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso65233406d6.1
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782924; x=1751387724; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QNqquuevQzO214EF0t3CB2Yl6DSj/hm7kyzxr3XDUE=;
        b=FiqsjxBYxrZBY5wMUiU9IfvzzuQBzlzz6k9N8q1IHi6q/X3+Z9WeOMnlGcdbaWKI1m
         AiJLSNbc08YgQtaBZDODtTQEhGnzTypGLYvurH4cZ9h0rrJKQ7bMs6Vf/VbGPXT0MSjt
         XHaRKgPq+G4rDSVZxwrRYtWDxnXmQEc4jmCA7pBYwAlkHMEySvIfTLkszLIVn714DjJb
         LSzeiy5BNRGy9nyaU0JN1LIe3DZBcV3hFYva3dxFAWpHBTPgI0tYJrFw5JBLw+9HbPy8
         vyAkxh//YV/o+iBwBZDBcBw7tQrJONAbsglRyjoGiFO3BSpUDeuj+mSYY+/pLAgIxM50
         cxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782924; x=1751387724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QNqquuevQzO214EF0t3CB2Yl6DSj/hm7kyzxr3XDUE=;
        b=qjEBtD5o5rTqOPYQYxL70lbus6iFt+SCRopviVoodgeynZfwZawJ/QQSAn3+xwAKn9
         3QmqXLzeXN1IiZIYZZQVWHLsqEP09RGepgkn9SQ1nDPLHdhnRWXjQKttxYLRNw2lCkxu
         wEf6BHOe11GJCPRN2VXoCcDMKNx6oq3mvI9RS5L4wMmKXHFql0JqALxMExTG+grs/fby
         wk73vKCTfJYN4tydwXvdynx2KZqwpBwIKojQFNNeEiZYtasPqTCOuMVDrqhJgvJi1/y1
         Jg42iqRYToYqs7ARdYzCakT0vFRUI4Yu1sGBnKDBQnWNCCRPkLs1mhLAUEAgOQLIQGRM
         m+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGN1m/uabJ3xmm4m7jeT/8Izbeb7SpGGSejmQNdhjK5qdTL1xecEqMznIJrGvMnPzoH4Kw@lists.linux.dev
X-Gm-Message-State: AOJu0YzHxcqyykYu/CT1uJ7XpsLUROi+pEyGzRyMC/CEXTAEfTW4Lh/Z
	geBNte75DOZ/oo5QtaITbE/NulzbUrn4zwcdjupaHC3Q5qc5woCOGoRb
X-Gm-Gg: ASbGncu7dO4Q7BQskU3uTOo8X/C6/SZYLGf7qpG2jzafX+Yq1z9bv8mfdRcRs+1CuXw
	krD4qUJ5ArI+VxIFad8aos3XCLmQ9y+NT42EXRzMQCXF8P8IIjscixCdTwoXJRP5xEza/4vEokf
	ZicCKoyEZLkNJE8ikoIgtjnY1pmRpxG18tURxAu6hxj9Dgp+a+juW7KDPjqXMHUl5vChfrIyusF
	zpmnPYKEcwjpdHr6NxteVdd5joM/1IStoVQ6dMyN1LMum6Tfriiokrn0mPhu32gd4umpAr7dC7V
	8yyda6+Hhg0+4HvCiyQ+16Tmq3j0czC5vAoiRK6Wwsjfq/DQ9//uIGcM/k1PxC8wErmAm9/gcPA
	ewbYEe4VwH+4XakUgr9WzsAsdfNVod0IeE8fC2zIb0PUK5jsEJEWaBxzGoR2qt4o=
X-Google-Smtp-Source: AGHT+IEPMlsFrV06xtIotQuWrty2uBXXPCKpsgJkwOxW5ihx34pxGRbrnlY3mm+GvFIAEGYs+rloYg==
X-Received: by 2002:a05:6214:20c4:b0:6fa:cdc9:8afa with SMTP id 6a1803df08f44-6fd0a50af00mr284466746d6.17.1750782924419;
        Tue, 24 Jun 2025 09:35:24 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0954430dsm58565536d6.65.2025.06.24.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:35:24 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5D63D120006A;
	Tue, 24 Jun 2025 12:35:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 24 Jun 2025 12:35:23 -0400
X-ME-Sender: <xms:y9NaaOjA-JnUE8R0_6UFw33RJauVdhVzIfbHzE2yMSdpGvuYjVdm6w>
    <xme:y9NaaPCuEFpGDLx71ItSOxUXlBYSaz8VjvkSMlHpy8m-VkcAyfl7dXTvHQEtMUq7u
    h1-jSoyEtKoiHZSHg>
X-ME-Received: <xmr:y9NaaGF05rK9iRfoFHdreuq9f0NsfObOes-lzSyr9oD4ET5jRZcmQ3moJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdefkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:y9NaaHQf_uRax2x0Xhu1rzQgl4Kolr71lvGkDvqzPlai7wN9K06e1g>
    <xmx:y9NaaLxgqaMZ_S0VZZKkoxYRRzs9ADvECjlCrhaN8vInW0xI2eI0FA>
    <xmx:y9NaaF60PZIgYbS5s1acOYfINQtagIA8ZAkUMjjo4BOQzRIwWLW0YQ>
    <xmx:y9NaaIzRl_HuMXe8Tq5E4pVBz_gVSFH53EUbIvhcIR7yLs66nYSNkg>
    <xmx:y9NaaHjNqOH6cY_twN0wO59ZxG7DFG5c5NhxTK41Ce42jTCmJkqNSr5g>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 12:35:22 -0400 (EDT)
Date: Tue, 24 Jun 2025 09:35:21 -0700
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
Message-ID: <aFrTyXcFVOjWa2o-@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <20250623193019.6c425467.gary@garyguo.net>
 <aFmmYSAyvxotYfo7@tardis.local>
 <DAUAW2Y0HYLY.3CDC9ZW0BUKI4@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAUAW2Y0HYLY.3CDC9ZW0BUKI4@kernel.org>

On Tue, Jun 24, 2025 at 01:27:38AM +0200, Benno Lossin wrote:
> On Mon Jun 23, 2025 at 9:09 PM CEST, Boqun Feng wrote:
> > On Mon, Jun 23, 2025 at 07:30:19PM +0100, Gary Guo wrote:
> >> cannot just transmute between from pointers to usize (which is its
> >> Repr):
> >> * Transmuting from pointer to usize discards provenance
> >> * Transmuting from usize to pointer gives invalid provenance
> >> 
> >> We want neither behaviour, so we must store `usize` directly and
> >> always call into repr functions.
> >> 
> >
> > If we store `usize`, how can we support the `get_mut()` then? E.g.
> >
> >     static V: i32 = 32;
> >
> >     let mut x = Atomic::new(&V as *const i32 as *mut i32);
> >     // ^ assume we expose_provenance() in new().
> >
> >     let ptr: &mut *mut i32 = x.get_mut(); // which is `&mut self.0.get()`.
> >
> >     let ptr_val = *ptr; // Does `ptr_val` have the proper provenance?
> 
> If `get_mut` transmutes the integer into a pointer, then it will have
> the wrong provenance (it will just have plain invalid provenance).
> 

The key topic Gary and I have been discussing is whether we should
define Atomic<T> as:

(my current implementation)

    pub struct Atomic<T: AllowAtomic>(Opaque<T>);

or

(Gary's suggestion)

    pub struct Atomic<T: AllowAtomic>(Opaque<T::Repr>);

`T::Repr` is guaranteed to be the same size and alignment of `T`, and
per our discussion, it makes sense to further require that `transmute<T,
T::Repr>()` should also be safe (as the safety requirement of
`AllowAtomic`), or we can say `T` bit validity can be preserved by
`T::Repr`: a valid bit combination `T` can be transumated to `T::Repr`,
and if transumated back, it's the same bit combination.

Now as I pointed out, if we use `Opaque<T::Repr>`, then `.get_mut()`
would be unsound for `Atomic<*mut T>`. And Gary's concern is that in
the current implementation, we directly cast a `*mut T` (from
`Opaque::get()`) into a `*mut T::Repr`, and pass it directly into C/asm
atomic primitives. However, I think with the additional safety
requirement above, this shouldn't be a problem: because the C/asm atomic
primitives would just pass the address to an asm block, and that'll be
out of Rust abstract machine, and as long as the C/primitives atomic
primitives are implemented correctly, the bit representation of `T`
remains valid after asm blocks.

So I think the current implementation still works and is better.

Regards,
Boqun

> ---
> Cheers,
> Benno
