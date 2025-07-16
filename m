Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39742F4A09
	for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680909; cv=none; b=PNmpEgy7JR3sKri+wDKegYL2eX16pSAgWg1zZhD5JN0Usbq8+4/bNOza6aaim8PnpOEyLwGNLMp//FCL6sj9esbpKF9Bs3HLJSwzTMkv1CXDN/m0D6Xvz+b/XtsXAymosE1wGYJxNwCxQwDrjoka4GBSl97iNPsItpckJ8daZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680909; c=relaxed/simple;
	bh=9QObaE15aA2HF9A4bZEW1whQFC6WEn59Tf4pkxZV2O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAaogjIHeSWRnlov3imTDHTJGm78WdPNuFVcHwFodadayo8Tnl75L0b0Sv4d2oFE8NQy5PIk0HRVjsaa1pFODU5CcMutuS+UUyCJtTaHwf2BDIflmdHTQ8u5q1sbKcFIwDpTd8J7YEf2ZxV82IHtMbxFLbe/ETLOZWIzANqNLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnU6FTGy; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnU6FTGy"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab644b8dc1so307151cf.1
        for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680906; x=1753285706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HO8xWa8N6E+EadbzyVIIdblu5LfP5/dbhHokIsV+v4=;
        b=bnU6FTGyXu03kdTMGUAUNGVbr3GBMNuwb0kaT9DCZZ1wOAh+Sc2piu27nC1WKUAEmo
         VjXdnZpR+xpU4YxqmSLI3w8jbDqIj3bkebl0Xx6e+TxJDuSEN3qs7f7vRf2XyLnxvke8
         lpURgSq0gVy1zzU79T1Z5sOrtq5OVbnzKHxqvJ/I5+D4z9KzBkhIdlRKmOrffk/uZsv0
         E5fkrob8ZUxFsCPj79K+vwzDoV/N+pdfOc0SK/SZgiO1JzdcJruukLJy/OuttcslCfDo
         +ThSgL1GMSIotdi8ZWYhgl06MUqPhnNqG0+QVue1XsPMDMzIfHasW5Yo/eFNQhm/wOtF
         nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680906; x=1753285706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HO8xWa8N6E+EadbzyVIIdblu5LfP5/dbhHokIsV+v4=;
        b=NfTSKc2CeTRrWERcek281UgCkBQTxFTKRY84d6BOo3aZr4xE4r74m/kTQJsBhDHXEs
         Wu3JxzzlHA3s8Aa6tsI+Gn3AnEDoi4Wa2UMc0B4FCCp6xNqtUndnF6lPSbdxNGfY2Flc
         xppbN7x0ccJs+4wT63wISUKziNELzTKfxm/AaPqbsY897pYAzDxtvfxjDG5KaQWzTMaM
         GbWHMfTitjbZdyxKqHM10XpxQPzj7B7cm1vejjlGK6UOCGbbhHSXPIELVMxeakV+fLPp
         AaJ2WuzL1KgEpFL7GHiFSGngTDx41oPXEL3ytUwpsLquUG0s9lMGBAi0EKehUm6KNMnr
         rk3g==
X-Forwarded-Encrypted: i=1; AJvYcCVIYkS8wLJ9NxGh70RaoRaK80RHefXOk9dHni7z0ncbqAaywzfvmWSaiXi3+Q9h1lmhcKsu@lists.linux.dev
X-Gm-Message-State: AOJu0YymOJZwHwnq0xUqA4R/Yl6ucJNrMYefOacYDXUGKVyOHeJ/GWs1
	yeTXp43tjQV8gNJtWXIeSwBl+xGsPEuyLv10TkQY+nhgF5xM+RyCU0rq
X-Gm-Gg: ASbGncthCGcdNkH+tK24epk5YlULijZynVLzz1VgRDH7gYPbue5iqsf6NQx5pGU1aba
	GxIb65T1zXGbP7IOheksdiDrUj6l5d1QgYOkUN68lIQpGSA7KNffgJ5sZHw9Xa0GaZO7dpxORPl
	5AfuG21fQd8LzDpYgw7UQuxOojgWVIFEwhg4Ppq8pnQj2naOvTvd0VJ3i6RMbXafnH3eDbkRSCV
	mzqDFMgP+Y+oCTdwR40knwbYeVPhndmguDoWUZ/KCy7yb4DRbsKe43oaORUWSlttH8eouws4HQf
	6NnT5XBJFkvYYlYh6T8fQ3Oap0EvsLLfrmu5cZDMVllCD26IAEZr1KCTXSlRTVOrC2SAEFHbk9i
	PNErnJSJuVh8Fx+p9saeOz7FgNcJSy292j7a/DbPRxXNUbm3O9yVJnW2DuE0tdt4fZQrv6Cfw5C
	yaHuEuFNOkNgu4
X-Google-Smtp-Source: AGHT+IHBnCkbkHcfWeZMyZZz/YOPnOdee30pCHkZOcxDxSemJI0bQD9ig/IPq89o8eZkA2Xn9bn7Ew==
X-Received: by 2002:a05:622a:5591:b0:4aa:df14:983f with SMTP id d75a77b69052e-4ab93df38bbmr41572161cf.51.1752680906378;
        Wed, 16 Jul 2025 08:48:26 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab5b9a1949sm43793561cf.55.2025.07.16.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:26 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 50CBBF40066;
	Wed, 16 Jul 2025 11:48:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 16 Jul 2025 11:48:25 -0400
X-ME-Sender: <xms:ycl3aOD1J4fjv5aIUx2IPox0q1oe7YiNy7M5hfMqhZlITw4n69kISA>
    <xme:ycl3aKBZPKfWsPSs-xAmeuEUsU4YDO8pOGedMKo-7dQ_HPxfWuFDIKvxSgpdLpXrY
    gXlPQRA1mhob3lXag>
X-ME-Received: <xmr:ycl3aGJIxxAt1ztjrTEeSLAoswXBPsFjluzSfmJiRyt-hRkPGzXgyps3Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehkedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomh
X-ME-Proxy: <xmx:ycl3aMSHK4pnfJZA2eRBtaw6SDJ44Pqw9ItMoXndaEiS5eYcvmTJNw>
    <xmx:ycl3aBQ-KsnX3u3tR70z8V2gZ-ZnkdimOlnZWkHrBQQTK46PUO_gJA>
    <xmx:ycl3aP581rbjIAC1WVX49CvoU9FPX_PX-c2B0lCJ9ueP5_x-PO7DMg>
    <xmx:ycl3aOF1eFtbg7claoiZP746xzSYGjCTQq7CuoLE-yTnb4QKx6qDqg>
    <xmx:ycl3aAk4TPOJzM59lpdV-8GfFKwUCmibcTxfstvyT5RabH4QYFRim3gn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jul 2025 11:48:24 -0400 (EDT)
Date: Wed, 16 Jul 2025 08:48:23 -0700
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
Message-ID: <aHfJx5_kMcULUd7t@Mac.home>
References: <20250714053656.66712-7-boqun.feng@gmail.com>
 <DBCL7YUSRMXR.22SMO1P7D5G60@kernel.org>
 <aHZYt3Csy29GF2HM@Mac.home>
 <DBCQUAA42DHH.23BNUVOKS38UI@kernel.org>
 <aHZ-HP1ErzlERfpI@Mac.home>
 <DBCUJ4RNRNHP.W4QH5QM3TBHU@kernel.org>
 <aHa2he81nBDgvA5u@tardis-2.local>
 <DBDENRP6Z2L7.1BU1I3ZTJ21ZY@kernel.org>
 <aHezbbzk0FyBW9jS@Mac.home>
 <DBDL9KI7VNO2.1QZBWS222KQGP@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBDL9KI7VNO2.1QZBWS222KQGP@kernel.org>

On Wed, Jul 16, 2025 at 05:36:05PM +0200, Benno Lossin wrote:
[..]
> >
> > I have a better solution:
> >
> > in ops.rs
> >
> >     pub struct AtomicRepr<T: AtomicImpl>(UnsafeCell<T>)
> >
> >     impl AtomicArithmeticOps for i32 {
> >         // a *safe* function
> >         fn atomic_add(a: &AtomicRepr, v: i32) {
> > 	    ...
> > 	}
> >     }
> >
> > in generic.rs
> >
> >     pub struct Atomic<T>(AtoimcRepr<T::Repr>);
> >
> >     impl<T: AtomicAdd> Atomic<T> {
> >         fn add(&self, v: .., ...) {
> > 	    T::Repr::atomic_add(&self.0, ...);
> > 	}
> >     }
> >
> > see:
> >
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-atomic-impl
> 
> Hmm what does the additional indirection give you?
> 

What additional indirection you mean? You cannot make atomic_add() safe
with only `UnsafeCell<T::Repr>`.

Regards,
Boqun

> Otherwise this looks like the `T::Repr` approach that I detailed above,
> so I like it :)
> 
> ---
> Cheers,
> Benno
