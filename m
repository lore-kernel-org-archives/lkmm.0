Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BB28DB58
	for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296368; cv=none; b=FP0/v4monNEjpSHOHjdq6gn2/Yd4kb5T8Rv2eBNXCHuQUcxvzvwDm+41hJn3uza0CPSAppNgDtE4wYXOBloVKePALny01Z7X07b8dFkVpfXHMgbvq05LV92NG9+k+RbjZYbe2Q86ZXvoGYNz5vT/GvS3cbZ5bV3PZTbBOZffE+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296368; c=relaxed/simple;
	bh=DRVwtCNqcIY5zcQdsRZsM0qpmQoaT3TR9n/N8B5xSRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eppKtk7nmBBABkd9woBjFQOwQXiC+BqtlcdNNZgP0Z/SZxqbQ2pb1ph6U4uO+26iAKUHI7QSy/l/1vRSsFIWpyyVYdaTjSOcMWwXLP1VtNLyW49VKIJM7RJ0yGEUW7lTJLR//TCawXDgQQorVN7m455/g5D04mSw9KK4E/Vz4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrpEU45t; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrpEU45t"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a44b0ed780so28144961cf.3
        for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751296365; x=1751901165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaOLegHrcn1eXx3UWYOL64GB4OGC7u3vLrNV/6rSYsM=;
        b=NrpEU45tvOkCdrghCjlfRyqfrsnHvtVYo8RcBrztyin9PAk6WldEmIW/UBBSFvTXnU
         Wzz35r86f6sinvGcwUi21kjRPoPMp0gWqTh50OiD1OVN8yLfAtWvXA+osKo6OOAuUfTN
         SIsykYpqLp50ipRjXDIZARgh91LTwjNXO5Qs0kEkw/gO2bMb0vdItQc17tWhs7oymPMN
         O3NUhKlJVfsWXAGJoVcPkQlQDO0adB9jl7m0qmX+HaW2l4Lmh7l62fK1HifvBefGNzZx
         gAmSXwE8OM/YJlOQd06KtBgVYbtjgKk+OxQvnYWZvYjUhsMvVgM5JC3yfYodkDMz/+E7
         z2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296365; x=1751901165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaOLegHrcn1eXx3UWYOL64GB4OGC7u3vLrNV/6rSYsM=;
        b=oBlyos30mMvuCFXDdpcdby/MYylbCVGIcYIjL7jS5KgWSZdDQcIP08QyNFBnCUp+r5
         M7ZpAL3fWbeAhNqv5dOw/VhsGQbEaBQFUHRXHfDQkbY7EGYCiapPIQGbqR2bcky6Dt44
         VLAZUeqsyv80Bdq+0NfU3oQXWtXWL63uey9NJUlLp7ZSadzuSwZ5NiQz/yWwhQwCFFJH
         kAnBJbKjLvdKFj580gqKkJj2zYKhP9dCL4Z5bRqXbEjdCovTIyRl/QI9rfOVLepeDqYM
         izTIX2rbip8j7uyavWeNLQCSP1qprRKrBM1TAILKtA5XIfMprAttH44ybclVXD2hpmO+
         IBcA==
X-Forwarded-Encrypted: i=1; AJvYcCUs1p+gZsxlx67kegyZ8y9q61zGuEmcpW3Jyg1MijXNSjCSSX8meQN/Uzre76yVcr38j2fr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyw7oaGuB1PCgA+yLbRJtMttKC4/GLA58009v8aWpCvXmj0eZd
	rZbUpIFyUVMcDFKM6eLyTkrjZkZ5J+h5tD56xA4ld4BnD/N5Qzkhoq5O
X-Gm-Gg: ASbGncvTZGQO2/Wws4+7z31FZfNkGO6XDAld6COEQf+9QseFrs2BwYyGY0YMzd6aDgr
	CNPMA9H47ZwD/P6TMQtaKUR6p6rtGBsP3ipEeVT/sE8JPt911JpNLT0etbHVL7LTX5XwwxsZ79x
	eofVRSEKmX6wxTtv1UCyqetnCKnHgLpamDrPz29tdD2DhG7H0cFKrAcoh4tz+zDpiZdhAgoDEFP
	zCyqzJeFfMIyvfuT0R1WDdF/+SvvzYKfV3aFDjw40oAGdCcGMRxPxt5RqsVtP8f5oKnDWd9XnTr
	1sFsenmZ76gNNH8LIp+F56G/kUy+dlxMn4fwb0wK2zbUgd9Kt7GU4AmMPaEo/xRZ+31Vl+h+mn/
	+ddt1+yaV2IHs5XqLCAFg0eJHm99v4/ayVCC1dVezR8SlhLh38G17
X-Google-Smtp-Source: AGHT+IF4/b5ksWqDbDU0roRQ3BW5PvN7+2E2foS0GiY85GNlwFSrjehK8SMdetGdO5NFItvx9tP16g==
X-Received: by 2002:a05:622a:111:b0:4a4:3a4e:b77c with SMTP id d75a77b69052e-4a7fca0781emr217381661cf.17.1751296365175;
        Mon, 30 Jun 2025 08:12:45 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5ad3c6sm59909241cf.78.2025.06.30.08.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:12:44 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C0151F4006A;
	Mon, 30 Jun 2025 11:12:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 30 Jun 2025 11:12:43 -0400
X-ME-Sender: <xms:a6liaCOZK0Si2jNcqBsGnZs4J7g8DBX0ow6zTnK5qXW200lQPDNtyw>
    <xme:a6liaA_CXwBuK-Nug70W4vQUX8e8-uTfYYsPJbWIAW7hTVHdcwOrvB5B1iw12OeRU
    S5JM8eOgrgjN45Y0Q>
X-ME-Received: <xmr:a6liaJRyUxCTXh69iIvE08a1VbmysNaO6wW369ymQqmF4WM6W8TwbOm5segJAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphhtth
    hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhush
    htqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrg
    hrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtg
    homhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:a6liaCstzCm5svvpiZfFQnFbON1YbLLhalgqr0R6u8I70KyUsXGyyg>
    <xmx:a6liaKeha2bPZbpRi-DoW4zn5bEeQScHW3BFeBDQFGAvvnMxVMWL2w>
    <xmx:a6liaG166qeo-ic7TvaQy-l2VY6GImnCXSeANjKNxxO-g7eCodqcWQ>
    <xmx:a6liaO-f7f0nkKNV8d6cyc9FDNIe8xjoosmrGuo2FRTej7O7Nr1LHg>
    <xmx:a6liaJ-f4la_XrC1RYPUt7iwkqVkpGecQhrcEAcOPLSLY-egrFsKZWHg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 11:12:42 -0400 (EDT)
Date: Mon, 30 Jun 2025 08:12:42 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <aGKpaoZt5Ab2a7Zj@tardis.local>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <jBAtISwM9LKkR7KuCHEnym75NfGOM4z408pMuDfk4U8VzN8PQuk9JJfBc33Usre3YSjbgtFRj8c0ZNeeQMpZsA==@protonmail.internalid>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <87a55uzlxv.fsf@kernel.org>
 <_pLa3zqu-AHBOnxkEz7l13l9W-OsKBtuXIkjRsIJJy6EnYTrM99E8Yr24pzjqwCAj1_qs_PI-cVxRsBsbgiFdA==@protonmail.internalid>
 <aF9bmpX-i6HVMlaj@Mac.home>
 <878ql9zg90.fsf@kernel.org>
 <1cf36f94-7e70-48eb-a79f-ebde218cd716@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf36f94-7e70-48eb-a79f-ebde218cd716@rowland.harvard.edu>

On Mon, Jun 30, 2025 at 10:51:00AM -0400, Alan Stern wrote:
> On Mon, Jun 30, 2025 at 12:16:27PM +0200, Andreas Hindborg wrote:
> > "Boqun Feng" <boqun.feng@gmail.com> writes:
> > > in atomic/ordering.rs, I think I can extend it to:
> > >
> > > //! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
> > > //!   following memory accesses, and if there is a store part, it has Relaxed ordering.
> > > //! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
> > > //!   the annotated operation, and if there is load part, it has Relaxed ordering
> > >
> > > This aligns with what we usually describe things in tool/memory-model/.
> > 
> > Cool. When you start to go into details of ordering concepts, I feel

Well, avoiding going too much into the details is what I wanted for
those documentation comments ;-)

> > like something is missing though. For example for this sentence:
> > 
> >   [`Release`] provides ordering between all the preceding memory
> >   accesses and the store part of the annotated operation.
> > 
> > I guess this provided ordering is only guaranteed to be observable for
> > threads that read the same location with `Acquire` or stronger ordering?
> > 
> > If we start expanding on the orderings, rather than deferring to LKMM,
> > we should include this info.

I'm not sure I follow you on this one. I'm not trying to expand on
orderings, instead I'm trying to resolve your feedback that my previous
version didn't mention what ordering the unspecific part of a
read-modify-write has (like the store part of an Acquire and load part
of the Release). And to me, they are naturally just Relaxed, but I feel
that given the feedback I got from you, maybe I should explicitly
mention they are Relaxed.

It's simply just making things more explicit and I'm still deferring to
LKMM about the exact meaning of the ordering.

> 
> The problem with the word "ordering" is that it is too general, not 
> specific enough.  You need more context to know exactly what the 
> ordering means.
> 
> For example, ordering store A against store B (which comes later in the 
> code) could mean that the CPU executes A before it executes B.  Or it 
> could mean that a different CPU will see the data from A before it sees 
> the data from B.
> 
> A more explicit description would be helpful.
> 

Except that the explicit description should be in tools/memory-model/
instead of the comments of a function or the Rust atomic module. Like
Documentation/atomic_t.txt vs
tools/memory-model/Documentation/explanation.txt. Because one is for
people to get a quick idea about what these annotations/suffixes mean,
and the other is the more elaborate on their precise meaning. Most of
the cases, people won't need to get the subtilly of the memory model to
write correct code.

Regards,
Boqun

> Alan Stern
