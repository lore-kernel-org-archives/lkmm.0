Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46F1362
	for <lkmm@lists.linux.dev>; Fri, 19 Jul 2024 22:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721427089; cv=none; b=no4aAzlEoRrm6IwNTUpQ0srnh06NMCNcbEfHZZtgokn8Cs4U8UGA3n7JcVmBrtw/B6Yfdp+m/DvvRVzCbTGFa8As5e615QU+7sPB8pVBOU0VgIRgodb3HS7JvmLBaM0T6eY0hDXfhbaPQ8fO/DdLs+WVjljYvFduWzpiQR1fnCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721427089; c=relaxed/simple;
	bh=Df5z69t5rqrcj737YIlolgTEgSamCOwnn/GgviPWEP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXJvSIuknZAZYTg0/DIyI43uQE3PLGD5h+/YCZhFiZDfMGkvMRZRRmRGzg1ELelU+TWZxBZt18HloiZ7OVhkjCxnRp4g3v32SFgCuiWK9SFN3PN4aS4ptTAbd9MArm9p3lpXKcfdJppeUJZ3eK05wtvhjD7j4MJG5jhDMkJxTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phd3b9vd; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phd3b9vd"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-447e2d719afso14540951cf.0
        for <lkmm@lists.linux.dev>; Fri, 19 Jul 2024 15:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721427085; x=1722031885; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is7AE/oz5HH85AcIf3p3it/BmyM/HCEmpoggDJba/ko=;
        b=Phd3b9vdpARrONAYjJEKugcgUG7x9RNR7Cbpzr6/9w/TTKXzEWhhuXohgqSOKGuPBt
         X8UjbjhZRsHvde6ELcfAzep+iwNVyO7GlScKaE/kJwQ8xyUI5ZpCwoHovoWLnmTNd9Nx
         mQcLB7YsLI9MzZ/TefoySJb5gv8fc1JGKxTrOBKrDWQVqmrnmQOwInqBUeXykyAF374C
         iQSag9WLgpmvNi56Z3Fd5XdAQMvLNB06goPzPI7Ohv3BXKWqzwE5w1AyvGxp9sbSbknP
         vMErskeOn2pmAY/MoL6Y+YJauHZ7S9CCKNKq7f3VYCEL0UV5WjNqAPIPv8BC5cEwuwhb
         SqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721427085; x=1722031885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is7AE/oz5HH85AcIf3p3it/BmyM/HCEmpoggDJba/ko=;
        b=pS1tkTM/qyHrSXdHMM+k7hBmvOe59ioLnwEWLW1ChJBB5odftY72pVnOWa1BYOMUKi
         P0m0TuyR6CEE50cMF/oW2A9KzjELb87Z1MmmF3akIiJNjVFEMtccT23e0553eSMZuuVW
         1/RlrVIJNsYKp0RrJKcQ7QsAmE5yo6ajeBL6cErDKBZCx9nxbmhyUKTwaPGUXW3eooO5
         A09Gq3f8E6gaaJGNQXdmGzG8OEoqK97bFnqKhMXOGJN5fzPTw11doetVKdSNvkNlHWzB
         NnlPwIriaLD+WXSW3/KRqVUOVCS5ni7RACU2UX6q2l8n1fWSvHOKqMYhQ5e3fT/HmyUI
         /7cw==
X-Forwarded-Encrypted: i=1; AJvYcCXd67wPy/tCSSW+GOQV9f6BXClpSAXe+stQIPigIwaz5ReVsm4hG5RQfzWzllK9w4PPkTfjmS55rxnv4qqVyjfEewazIA==
X-Gm-Message-State: AOJu0Yz+G11oVzf++vQRDdYwACMEpWwBLPDGW2OoilZ5X2G3r6HMExZG
	2nVjvZuPd72Gw8V7OSebv3/2b3newhmbiSun+jpFDbq5XaiiyUGe
X-Google-Smtp-Source: AGHT+IHUcxuwiKpvCkVk5Jy8Gp70QUTxnNKLP/kmtEVjpXE4cl0szvzqjLm2RWE2Q32A21Em53sp4w==
X-Received: by 2002:a05:622a:18a8:b0:447:e6f9:f61c with SMTP id d75a77b69052e-44f96afa31emr105219371cf.22.1721427085240;
        Fri, 19 Jul 2024 15:11:25 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7acb0972csm12042136d6.136.2024.07.19.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 15:11:24 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 7CAEB1200079;
	Fri, 19 Jul 2024 18:11:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 19 Jul 2024 18:11:21 -0400
X-ME-Sender: <xms:ieSaZnQCbGGbtItZ8FvLbiIs2qZHpF6NNeHw5gnGpGJUXkR1uojXSA>
    <xme:ieSaZoxfF6ieoDK-3JTe9rFOiuCEgcMvBe5W7LCTkhgHkCzyZVWZcvhtg3-RRduVr
    Bk-akCBvXRGGv1ZqQ>
X-ME-Received: <xmr:ieSaZs3OOwZCaLOdlAxkOVpxq5Kmgfby9MBr7g4L-Zcr5bR4E78jUXtAsfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedvgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepleehtdeugfejkefgvedvkedvjedtudffgffhuddugeffkedutdfffeegteel
    leffnecuffhomhgrihhnpeiiuhhlihhptghhrghtrdgtohhmpdhgihhthhhusgdrtghomh
    dprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlh
    hithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehg
    mhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:ieSaZnCnIhMgbyy9hZw7Zvui2ox5C2gj4hc9kZJFdYe5Z7OPby3AZw>
    <xmx:ieSaZgivs_-tAWwglp8iGrQP7ViSiFtW25pT0eaEedVHqiHG4RWReA>
    <xmx:ieSaZrpSCRvGokcjj4lqvBR4ICVYklnc7vSboJpJ-8CGuwLMnDEtYA>
    <xmx:ieSaZrjmYOXfC36BFs_Ds9pyv1XZkjxjatS_nFYz79Bf2bUHE9OZiA>
    <xmx:ieSaZjRZ3AMN5at-7tyOjDf1z0yhCcgAfLBfsYoYQA0kWxz7u9JSf2qT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jul 2024 18:11:20 -0400 (EDT)
Date: Fri, 19 Jul 2024 15:11:11 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev
Subject: Re: [RFC PATCH 1/5] doc: rust: create safety standard
Message-ID: <Zprkf4FrBXgYmtgg@boqun-archlinux>
References: <20240717221133.459589-1-benno.lossin@proton.me>
 <20240717221133.459589-2-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717221133.459589-2-benno.lossin@proton.me>

Hi Benno,

On Wed, Jul 17, 2024 at 10:12:29PM +0000, Benno Lossin wrote:
[...]
> @@ -0,0 +1,246 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. highlight:: rust
> +
> +====================
> +Rust Safety Standard
> +====================
> +
> +Safe Rust code cannot have memory related bugs. This is a guarantee by the Rust compiler. Of course
> +it is not without caveats: no compiler bugs, no bugs in the specification etc. But the possibly most
> +important caveat is that of ``unsafe`` code. ``unsafe`` code needs to follow certain rules in order
> +for safe code to enjoy the no-memory-bugs privilege. A simple example of such a rule is that
> +references must be valid for the duration of their lifetime. If any rule is violated, it can lead
> +to undefined behavior even in safe code! The term undefined behavior in Rust has a lot stricter
> +meaning than in C or C++: UB in Rust is totally forbidden. In C one might rely on the compiler
> +implementation to ensure correct code generation, but that is not the case for Rust. You can read

I don't disagree with your intention here (i.e. we should seek for
UB-free program), however, during the discussion on memory model, I got
response like in [1]:

	... they are technically wrong (violating the C standard), but
	practically well-tested. (and then above I added that there's
	good reasons for why they don't go wrong: volatile compilation
	strategies and reordering constraints relating volatile, inline
	asm, and non-atomics make it so that this almost 'has to' work,
	I think.)

which suggests that we should rely on the compiler implementation to
ensure the "correct" code generation.

Basically, since LKMM relies on a few things that C standard dosen't
say, e.g. votatile accesses on certain types are atomic, behaviors of
asm blocks, dependencies. Let alone we have data_race() where for
example, the diagnostic code accesses the shared variable out of the
core synchronization design.

All of the above is difficult to implement purely UB-free in Rust IIUC.
Of course you could argue the ideal way is to teach Rust how to model
these useful operations/patterns as non-UBs, but that's a relatively
high task:

	Or do we want to go well beyond what happens in C, and actually
	define a memory model that both has the performance
	characteristics required by Linux, and can be defined precisely
	as a language-level graph-based (or ideally operational)
	concurrency memory model? This is a monumental task and a large
	open problem, and should not be on the list of blocking issues
	for anything that needs to get done in the next 5 years. ;)

from Ralf [2].

Again, I don't want to rely on compiler's behaviors on UBs, it's just
the langauge is not ready for some jobs and programmers have to be
"creative".

Regards,
Boqun

[1]: https://rust-lang.zulipchat.com/#narrow/stream/136281-t-opsem/topic/.E2.9C.94.20Rust.20and.20the.20Linux.20Kernel.20Memory.20Model/near/422193212	
[2]: https://github.com/rust-lang/unsafe-code-guidelines/issues/348#issuecomment-1221376388

> +more about UB in Rust
> +`here <https://doc.rust-lang.org/reference/behavior-considered-undefined.html>`_.
> +
[...]
