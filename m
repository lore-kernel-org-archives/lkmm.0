Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240E72E763E
	for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035497; cv=none; b=sn+jY9dZya+qS8bt0/4JcSyF+22rzu5fb4RR+XlJgghHamXzdFjwFVU+bQvp+DCpyluieJfJIkiAdBtkyYw68u0J37qPzhBlD9qGobhbUhXQBDEaNEfY4bo2odphbM1Y8lnFS5fBVlOhv44uJqs8214RgC1I64FvaNhc8aU/iO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035497; c=relaxed/simple;
	bh=wB2dQL35c8imjz8aUYEkv+Kk0qxUmqHONiTsdy+0DVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anCiWA5x5/ogKkma1SWul/8W7iit5IXeLUUAaezuFoa2Gtycj+24qfeyyQpTJno4B6lTlm5yYpYLwhFDvRAtxvLdDaf3im3B7Dymboh2h/Q4ilgD3/M8Lzm24kCSeeuLubR6FKDm5f6C698v2djKwo5ncLBnM/2DWLD8XPu87Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9OXclMF; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9OXclMF"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafdd322d3so26987656d6.3
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035495; x=1751640295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuWs3j1x7+EnEWhudL7zxC8HxyHZbbIVHszRV1zTF6s=;
        b=k9OXclMFnRTPRGryLPXwsyAN+FwGbP3gs51B7K1SFqt+sf+9QYUBoTRhQ6DhSczcnd
         wRACdcsvN+vkhLM3ABAsxZ7gjaWliM9eblLLh31s2dCPUwhrnIjOGwUjpm/pNfMHlk9K
         EG+Mqs/sK5TO/rjHZKxk7VFI5V3e21pLV0CnlnapEIMoFE8JChAQZaUP3NgcyQTSa/+C
         jU22cYysg4elwnN8DyF3bgu5iII3NWSta1rfuXCZ7MzxwXKfs6RPNpWK0IfxA/w5gGQ0
         61pJj2NmQLsJdHg2VTMaHpnNq3EmCzSQE01kuLkgYhRzHanw0fB6Js2G4j9ZgZ5DDGpa
         FS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035495; x=1751640295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuWs3j1x7+EnEWhudL7zxC8HxyHZbbIVHszRV1zTF6s=;
        b=ECOuMYVYj40ktZbkj8Bzl50FqIkgUPvvmZQ/6NPk9CaRuwv+klW7rluEYkAWRk2K5y
         Qr1Ik2fOrtE9lB6tPpRCtiGa4XIevcsdHocnFprrdG0GjI3Y5ZyrQYqwEc/P/DgwfUOo
         JqB1T08zVPkSsNfm83ilUBO/t32OJgsFfjfuOOSGBfAyaRvNo7TO8c9J7VO6bLf0KWA1
         S/STpzTK3Bp0A+o/63Cu4xpNwMTtxEcE3oY5iIDi0j9J6QHhJX8dFOQJEcMqcLNf/Xq8
         DQAtrDFovFoq+a5oRhc9z/I4N+8Cjs5AjJzYnZefyuM13acEzNFVuLFrufjT0MAPSYSv
         KcPw==
X-Forwarded-Encrypted: i=1; AJvYcCWlE9nv/CpVD1gYeVwwIJ8mEGaRuU6R1IW6iqza9iZeTVNjxVvROnTbI8jP26WzM5Ta4nTl@lists.linux.dev
X-Gm-Message-State: AOJu0YzOp/gFQ3c5CBwXMJETwnHXeN4PO794V0dwL8M9fAxnW/4CgS/S
	z/aTjpOw+x/UZywrZ7uAyacDFwDvcIvgVVessgNVbYmY+LVr/8MRc4PV
X-Gm-Gg: ASbGncshkzQ5bpfv/WBkBex8ycwOHX3csZobmPta407NXYS1qLIarWu9kE1T3bODtP2
	wCKXG3de5tSD+Xuu6t9QJ26bVg9c5Eb5BiKGcESaYcGIOspxmuREYZPq73O7TeD0vtZ2V6bj9qV
	FbEj07seAcf/fwYdsF/2uDaTiT8k9ZdjY6Pv9rgY+X14oGPCo5oBYhhRHeIi/QCwnBxFTxsxAIr
	y3F9cmwCTdHNGsFeDRn/PUk3ccQkKe6nuMlaFO/cLwmfjNWWknuS0CdroLnL0fmRzxwVOJDidTA
	v8v4DccBFbhaRT1cUqrDhirAtKF5yAnX14mPgqoVB0eAOdbITqxts1rGU+7psDHiAppLsuJC7/s
	RFSka2wBtkXWfo74QZDNyNdIx1+d6fzLRMqhUR3z/xRD3eAksx5Vt
X-Google-Smtp-Source: AGHT+IEUuwUXgo2OeUL457R+n35acysC8d/++BJCeB5mNVOencHsLALChCWLXr3tQwUpPpTD/emPDg==
X-Received: by 2002:ad4:576c:0:b0:6e8:f4d3:e8a5 with SMTP id 6a1803df08f44-6ffffd79be6mr64502026d6.15.1751035495022;
        Fri, 27 Jun 2025 07:44:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771acfe6sm21357226d6.31.2025.06.27.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:44:54 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C03ECF40066;
	Fri, 27 Jun 2025 10:44:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Jun 2025 10:44:53 -0400
X-ME-Sender: <xms:Za5eaAVF4SuboNZjcMJ9rdBGSPX_5cHdfbiSeicrA3wqcG_W8L2IAw>
    <xme:Za5eaEn9flFN2ZT8DQEQqF1C53qbDpuaABIgKYNSE5mgtcrnsB9vEeoZlEhW8cq8q
    eidtsjfn5p5_nX9ng>
X-ME-Received: <xmr:Za5eaEbGTY-KHkU-PX2sPFB734tKCambWcvaUzeYKrINnfuiTR94fG8Zwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhu
    shhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    rghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:Za5eaPW7q6Vm8vQlEADyJOfkpYnVLCxMpNksemrPxOzEGJE7uM8k9w>
    <xmx:Za5eaKnpHM2jAJxSluf5PfN1C7hDNUk8A5i_tdNqVLgC8JFW7gZ_Gg>
    <xmx:Za5eaEfv78VoW3DYO3PFYqvODKwkYh3DRXA0sLBdtlnUrlaFln7CKg>
    <xmx:Za5eaME8NHJKzekGkjLzGCIinLX4t9iLWofJN-_c_ZSS35kE1zIzmg>
    <xmx:Za5eaAkRcPceVK611x3G6DFFFJs7q4BQ7s4NZYWOlLOqe9Lg3JK1QeRH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 10:44:53 -0400 (EDT)
Date: Fri, 27 Jun 2025 07:44:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v5 03/10] rust: sync: atomic: Add ordering annotation
 types
Message-ID: <aF6uZLX1zr2MP6Ne@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <W3facY85E7FjV5y6_67OMqPUz1-Vubr8TpYgFCgXNl8GMh1oM6_bF9V94Kl_oZsdyCQSrxm5WExUmztE3pJ_BQ==@protonmail.internalid>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <87wm8yznkt.fsf@kernel.org>
 <aF6sBmgTmdM5ZoB3@Mac.home>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6sBmgTmdM5ZoB3@Mac.home>

On Fri, Jun 27, 2025 at 07:34:46AM -0700, Boqun Feng wrote:
> On Thu, Jun 26, 2025 at 02:36:50PM +0200, Andreas Hindborg wrote:
> [...]
> > > +/// The trait bound for annotating operations that should support all orderings.
> > > +pub trait All: internal::OrderingUnit {}
> > 
> > I think I would prefer `Any` rather than `All` here. Because it is "any
> > of", not "all of them at once".
> > 
> 
> Good idea! Changed. Thanks!
> 

And I realized I can unify `Any` with `OrderingUnit`, here is the what I
have now:

mod internal {
    /// Sealed trait, can be only implemented inside atomic mod.
    pub trait Sealed {}

    impl Sealed for super::Relaxed {}
    impl Sealed for super::Acquire {}
    impl Sealed for super::Release {}
    impl Sealed for super::Full {}
}

/// The trait bound for annotating operations that support any ordering.
pub trait Any: internal::Sealed {
    /// Describes the exact memory ordering.
    const TYPE: OrderingType;
}

impl Any for Relaxed {
    const TYPE: OrderingType = OrderingType::Relaxed;
}

impl Any for Acquire {
    const TYPE: OrderingType = OrderingType::Acquire;
}

impl Any for Release {
    const TYPE: OrderingType = OrderingType::Release;
}

impl Any for Full {
    const TYPE: OrderingType = OrderingType::Full;
}

Better than what I had before, thanks!

Regards,
Boqun
