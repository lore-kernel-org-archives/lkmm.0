Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F98260564
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339775; cv=none; b=bYbZOP4p1Zd7K2zcgBi85BpzcFRewzNlYEcCWK0y61r0vlPbGCrodN4DymNNZs9KZQWu8QA6mDv3Jbz6DTFcEAaWxdPja7eXTTHKGk1stWPDM9TGXruszwrMDxVrXQs6ed8EaemYMoBT1/S1Go+Spi5cLxmbMjfYlnpCBQ6tdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339775; c=relaxed/simple;
	bh=k1rycoin016Y5oOCyiCPALghuj+7+2zI7ETOOd/al+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UN6CzcVFZbhwsjJNhorFFGFTQoiCAMalJ07IQ6uPNCj7NsT9jAx/tk0YUGFuVzEkwO6gPLXh9lXx+upfDhPLbBSLTTeZwTL2XtahnKxZsxA+8qdFSMGuZot88X5zjhpcAsG0eAsDq1dgPDuKNP64xLYozMdGtV0HpmhcbByidhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK6Szq3Z; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK6Szq3Z"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d219896edeso95624085a.1
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750339773; x=1750944573; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE6+E3mACThLS+PEtrJkYrlgdi95WFIgFRjgenTQrJQ=;
        b=FK6Szq3Z8aQj+sayunr+Hc+nhnXKipWSM02+9QRhBPsoBWpCcOdLblQ1nq5/nWOxDF
         D2vyh4NMyKWNCaMPIQYBul3a5yoW/iYgxciXVvwnXTXz21bCJ4tgXILzEpj5ublMj1yu
         FAjf6QkSiAyLwZ4hx/jwy853P9FUUmYEHNPDyL2mLZacTeBUVDpzR+5XcLASKtrv0QMX
         hIsncU3NBVaZltoUCctv9IdmqlZAaXGNGrC164G/gArdh9cCw63hfvLTKWbzRXXYzQOL
         zuMLmTtOt8OECH/xfkr5ees87pJ89TLTreMtWl98sMY7v778XFvgt8MgmpnpSkWvwrbf
         0fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339773; x=1750944573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE6+E3mACThLS+PEtrJkYrlgdi95WFIgFRjgenTQrJQ=;
        b=GCErvP4FqqUE+/i1TEoty0TbJC/jm55USbb/YNbYPG1pzJ5oKl3iNq42r1I0Gv1KIS
         riO0B4w00Dpp64ZPxZbzR/MdzXMzpKmFRNaweitHgVb0ghe04am7WWmiZ21hPmrKD49B
         CTJwZcWZUH4Xv+oYJyFIlURI4CgznqPozqxwC9I8ohiAoBB+eFtxq3DZSOMrT+2/Djp4
         GbMnIk+Pc66+qeomiDkRvgj4Wqc4fQA32rHaME6t8cFLpDJEXPSVAhcsCiq9lbShuv16
         PZUH6F2xDP98vmTtDsjY3zn7Nzbw8k9mJQbvheSOTxVNhehSa3o4CKKuK7++nrtdlsH0
         eXqA==
X-Forwarded-Encrypted: i=1; AJvYcCWUYEOfuw+iKOaOzvkfFyfxSQxOq2+y8WgXJkJ9wIlAv9XU3edq3scH8qJoy24+pZwDLFrK@lists.linux.dev
X-Gm-Message-State: AOJu0YzNMs6fN1wWAOfJod6gQwkyakKMhyGonNCctoYrdU/kAIMrT1gQ
	As9yhjHZy3XHFqrTF5AmcSS6wGDv2PLtcKm2oYbF8rI61SozAeNdumDJ
X-Gm-Gg: ASbGncvwVdH9TIrVxne3hopCAXSKpJZdff7XI3SMN2lM0FU2Rx4y4Opqy8/hvHBSBA9
	amzpuowpBGsmjIWyrcAJSOp0CG6Zu5yMk1SJ+7Nl+xwkJKNvviCCGp4j3gpj3kTHGu5ajF1XGHv
	80rw3/fSa3jAQBPfXBL1bkHaHMWm561QHRPMR2j5G+r27attkc8cTMHCIdL0SiAckcGJm1w8a7E
	ozYZLX+dcCDEYMypQq9XvV8ciq7oFQux6hLOXRW7xmB1f0Cmh5l9lY8N+keQpJJzKz9mbFPyTu3
	c7kWNTAUbQIvcZH+TTy5ljFA2ly+UZPu6Liv8RNay9f5lptnicFkJInmkeGu0P3yvOKrRoozPh/
	4rYG9DjR3BY3oEVNbRxFiJFMiQOhTFHL7q83d9ecAgN9EPQ1P1FR4
X-Google-Smtp-Source: AGHT+IG0jYJUV5aviMjD5HPm1vyOkmeugKyt/Y/JLGwulOYBKRujCGnV7nb/0X/gOg3ydiOk3qM+4w==
X-Received: by 2002:a05:620a:25d4:b0:7c5:49b7:237c with SMTP id af79cd13be357-7d3c6cdc704mr3070557685a.27.1750339772721;
        Thu, 19 Jun 2025 06:29:32 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaca67sm878292685a.59.2025.06.19.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:29:32 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C48E1200043;
	Thu, 19 Jun 2025 09:29:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 19 Jun 2025 09:29:31 -0400
X-ME-Sender: <xms:uxBUaEqPUZEiRlASJATU1Thqs6yZzEn6bBgVZVqb8R7RM8Va89_nbg>
    <xme:uxBUaKqapLLmIlE2DtBf1RV3k19__mwd5LakfACLIaHc3sho5E-3eDQhjKqIibwoH
    w3tj7xk4SpQydfqtA>
X-ME-Received: <xmr:uxBUaJPuIusecdbUoejcPLwLV3Z46HjV2tfDgmJdBl2-kKEV7NqS3HnjkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdehtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:uxBUaL4Sny6CKfAJbw3TXbpu_xWIczu0NcHpy51Pk3tLtVfw0N4gmQ>
    <xmx:uxBUaD5z_QuETSR3iz-WSduY2Km4GIBr8L7BeOXkyhPGTWrBK2zC1g>
    <xmx:uxBUaLhhglI3TRF6mDD2QS_Xt9n7uSTxJ4QWl6cqXGw2z_jZfPsSkg>
    <xmx:uxBUaN58jF1LvA8Y1S-5vlU9PAus-2S7YH2ForbAzjZ4hx5GdawtuQ>
    <xmx:uxBUaGJrWbYNrwuBbR4-Wo_Um4vBAqtx5rtzP1ZeXRjmQ4Sw0O5kA95q>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 09:29:31 -0400 (EDT)
Date: Thu, 19 Jun 2025 06:29:29 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <aFQQuf44uovVNFCV@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <20250619103155.GD1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619103155.GD1613376@noisy.programming.kicks-ass.net>

On Thu, Jun 19, 2025 at 12:31:55PM +0200, Peter Zijlstra wrote:
> On Wed, Jun 18, 2025 at 09:49:27AM -0700, Boqun Feng wrote:
> 
> > +//! Memory orderings.
> > +//!
> > +//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
> > +//!
> > +//! - [`Acquire`] and [`Release`] are similar to their counterpart in Rust memory model.
> 
> So I've no clue what the Rust memory model states, and I'm assuming
> it is very similar to the C11 model. I have also forgotten what LKMM
> states :/
> 
> Do they all agree on what RELEASE+ACQUIRE makes?
> 

I think the question is irrelevant here, because we are implementing
LKMM atomics in Rust using primitives from C, so no C11/Rust memory
model in the picture for kernel Rust.

But I think they do. I assume you mostly ask whether RELEASE(a) +
ACQUIRE(b) (i.e. release and acquire on different variables) makes a TSO
barrier [1]? We don't make it a TSO barrier in LKMM either (only
unlock(a)+lock(b) is a TSO barrier) and neither does C11/Rust memory
model.

[1]: https://lore.kernel.org/lkml/20211202005053.3131071-1-paulmck@kernel.org/

> > +//! - [`Full`] means "fully-ordered", that is:
> > +//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
> > +//!   - It provides ordering between the annotated operation and all the following memory accesses.
> > +//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
> > +//!     accesses.
> > +//!   - All the orderings are the same strong as a full memory barrier (i.e. `smp_mb()`).
> 
> s/strong/strength/ ?
> 

Fixed locally.

Regards,
Boqun

> > +//! - [`Relaxed`] is similar to the counterpart in Rust memory model, except that dependency
> > +//!   orderings are also honored in [`LKMM`]. Dependency orderings are described in "DEPENDENCY
> > +//!   RELATIONS" in [`LKMM`]'s [`explanation`].
> > +//!
> > +//! [`LKMM`]: srctree/tools/memory-model/
> > +//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
