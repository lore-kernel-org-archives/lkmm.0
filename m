Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6543024DD0C
	for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683540; cv=none; b=BoXkcyntkmxH+rBh6WWa32JQ0aLGThs9yF1aLNTYgDRwB4D78/b3CIJsekiQ/Dt5ThW+1EdbyQokjl/1qAuwSSzvdRhLwvvz0jWts8QxL4qvqERdsfgk9/LAflksBHeurEt79z3OUoOKurTHZF2yMGwCBEeE1GiYVmk9P+xbcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683540; c=relaxed/simple;
	bh=bIx2WdAmPOVDblMLSuk5Qkk4E7uEHXByj5InZmNRK3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mU6l4QkU9zi/8as5hidtqjs2ytFGE7OGpRpFXIwRP1HbNkHddyDrxrqGuYfRdyfl8tiBTdRuqHplWjZEqdKJ826BJv+SiVtCd8KTsgd0i4dg2gUtG1+1J0gzPmzxnDOCnKm3UMaAsbeNynjeeAIzwI6418GVCHjz5SEVR/zrZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eO3BMwDD; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO3BMwDD"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a44b3526e6so52942681cf.0
        for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 05:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750683537; x=1751288337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7BnrfZXUppCK3W+DGgFabRZydx9ntuWQtnKC1BMIsA=;
        b=eO3BMwDD0/d+oYUtA8H0l3ycw0PbD2zVBQ9VPaPe/Q+thiCKlQ40YU9s26alXKBbRm
         feK6oqUi2pDiRBEkRPRRJSJXzQBpOa7nBmLsxjqCOmkACSL/r9gSVTpJTT2mO27YWjXm
         r5fDYabsFhelACAsc4EO9KtDUVS7OuQhnHRoSh8vaqonIBzJw7qKH0RXVLtX9RcRAUxA
         071Uxb/2aK1UB6+IyMDCDbKps3y5J+EHLs5vpzYWcjwqRcXhgYeulIVjzeNCEpkaANXY
         rZCXfA4WBtcL0x6VKK7Lqj74sA/zagwRvou/f9GZ8ldP4NjDGni6B23/Yp3Ghl6cgJ9k
         alTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683537; x=1751288337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7BnrfZXUppCK3W+DGgFabRZydx9ntuWQtnKC1BMIsA=;
        b=owGmioxLLEmIOFsRQ0plT7uoYOOaIpHBnKVITHDIY7Vyw3aZg3AQlv1Em+n+FQ+ZM+
         tlazs1IBDajmDTkRHFMrMzvTVrJEpNmgw/3fp2K2+7CE+7npyGv56vokNrvj1zMmfSaY
         QG9fBGeLCRnzyGclEjQNU8MvHkPZLej7A5K1tdjonNse1gdOUHAzIyeIPPGlegs0jBxC
         xi5nDyTbSRQOXZiK/xPWoQT+i8hdpFr1MSMNgnYXRhmXCEb7bAEOBiX0WzrWlsyvD8hH
         5bvA077KCdC7pWf7/+VRxda28LGMLB7/ujqPmfOdav8ruEqm+yCIEqkXqccmAcKpGip8
         V5sg==
X-Forwarded-Encrypted: i=1; AJvYcCU7E6ywHu5Rv7dLxNbNYY/tog1xTn0fQpM5uTTCabkP9S4I0rcdKOvm+IUIxw0gzIy1FnJo@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/4Vi63pPNZYms2dxRzEUSwp9r6Ttz1J/TPRHCF5E8azEGtxLs
	vnWXZutzJ48hxg2djk08dpggQovJx3IPubQ1qq4oCrK8CCh3IyI/+T8q
X-Gm-Gg: ASbGnct1EJBHSQHYbji0Uv+pvqFiv3RqW1MiHUGWuPMJwqjEgP3xmiWApBlTbBzb6fB
	e0mXnRTA/eygS0B739ks0zgVtMXFtr1d8hkyVgVBCf+rke24Mp92vlj8Ll7JGedsOCas9OtPaOY
	PWtEkFMzcA6FNZR98HWAfmtw9zOF90W7TJWcPfLeX1j4U0XqREox9ZHJRJdMRUKGX63tHfL8+8j
	prXYS8UR2b/4UYiwpygX3od2EzQ5N8HCJeG7IA9N5IHxVmaVmxZsocMHff4di1nIDB0GKEi7sNh
	t/i3HFuHulbRf9LXGVVKTvUlQefxbb2C1ic3SgtsPNamSPH8kEAmLRI8xnA1pP2gv1jQFGX8w9W
	+VAVlCh/ZHaQYarLV+q8UO1lp01ioF53BQdv15RQNpm5DFoKEiA5y
X-Google-Smtp-Source: AGHT+IHHpceuQMDX3s08dH+I60+8Y/olG0WoREu2K0xLbFElDa5Cj6N0qGgsK1aGGLuy4snmHBUPAQ==
X-Received: by 2002:a05:622a:1b8f:b0:4a6:f492:674f with SMTP id d75a77b69052e-4a77a2826bdmr217753131cf.41.1750683537021;
        Mon, 23 Jun 2025 05:58:57 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a77a08bbd4sm38185161cf.80.2025.06.23.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:58:56 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A3E5120006B;
	Mon, 23 Jun 2025 08:58:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Jun 2025 08:58:55 -0400
X-ME-Sender: <xms:j09ZaDR7rP2s1-aixSoNx-JAto8phVBmgVZQ81_V7th1ezB22xU1zQ>
    <xme:j09ZaExJB-3-7Ry5p0iPhnvunHyVemKyVtLfwpyQUTf_ZfTeDrgV_g7F-iDzuKCJ8
    aJnGD6fn-TGCNljkA>
X-ME-Received: <xmr:j09ZaI3VZOlsORZNX9FmcEkQwRSoh0xykOfRGalPNnEyrtlhMUzGAjSUaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedtkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:j09ZaDAHq2B7GuF8SX9tP2abddlVW81d4VIvzd5ytkon1hJ0FXXKcA>
    <xmx:j09ZaMjzyk3in0kPaJvh5WYBiNc6utKKKV0OljYzm34QrIBze1mlyg>
    <xmx:j09ZaHoYtiO0kPRaCj6TvwOWpmo8lhe6kRKxY9Tinzf2oIr2lBZ7qQ>
    <xmx:j09ZaHiZm50kexbkzkR5fg9LcuKBjhtDuBLgDG1q_XvuqBkCs8xqcA>
    <xmx:j09ZaPT0cno9utuAnw99eGTRARPMjW320qJwtSdeg8s2eDRFyEIxoAGT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 08:58:55 -0400 (EDT)
Date: Mon, 23 Jun 2025 05:58:54 -0700
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
Message-ID: <aFlPjnDDoS8l_9co@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <DATW5HJ259PB.1289VEJEUBT2Z@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DATW5HJ259PB.1289VEJEUBT2Z@kernel.org>

On Mon, Jun 23, 2025 at 01:54:38PM +0200, Benno Lossin wrote:
> On Mon Jun 23, 2025 at 7:19 AM CEST, Boqun Feng wrote:
> > On Sat, Jun 21, 2025 at 12:32:12PM +0100, Gary Guo wrote:
> >> Note tha the transparent new types restriction on `AllowAtomic` is not
> >> sufficient for this, as I can define
> >> 
> >
> > Nice catch! I do agree we should disallow `MyWeirdI32`, and I also agree
> > that we should put transmutability as safety requirement for
> > `AllowAtomic`. However, I would suggest we still keep
> > `into_repr`/`from_repr`, and require the implementation to make them
> > provide the same results as transmute(), as a correctness precondition
> > (instead of a safety precondition), in other words, you can still write
> > a `MyWeirdI32`, and it won't cause safety issues, but it'll be
> > incorrect.
> 
> Hmm I don't like keeping the function when we add the transmute
> requirement.
> 
> > The reason why I think we should keep `into_repr`/`from_repr` but add
> > a correctness precondition is that they are easily to implement as safe
> > code for basic types, so it'll be better than a transmute() call. Also
> > considering `Atomic<*mut T>`, would transmuting between integers and
> > pointers act the same as expose_provenance() and
> > from_exposed_provenance()?
> 
> Hmmm, this is indeed a problem for pointers. I guess we do need the
> functions...
> 
> But this also prevents us from adding the transmute requirement, as it
> doesn't hold for pointers. Maybe we need to add the requirement that

The requirement is "transumability", which requires any valid binary
representation of `T` must be a valid binary representation of
`T::Repr`, and we need it regardless whether we use `transumate()` or
not in the implementation. Because for the current implementation,
`from_ptr()` and any atomics may read a value from `Atomic::new()` needs
this. Even if we change the implementation to `Opaque<T::Repr>`, we
still need it for `get_mut()`

> `into_repr`/`from_repr` preserve the binary representation?

We need this too, but just maybe not for safety reasons. Besides, the
precondition that we can say `into_repr`/`from_repr` can preserve binary
representation is the transmutability requirement.

Regards,
Boqun

> 
> ---
> Cheers,
> Benno
