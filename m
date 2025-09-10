Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AF2BD024
	for <lkmm@lists.linux.dev>; Wed, 10 Sep 2025 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757482061; cv=none; b=uK9UXgd+AiNSnQ/YfBii6pelxJeyNNQnR6O37yd1nvZbaMjN1m1ImkGGeL3lzE88saasXtz0p0VqTh2fn/ukDOLPqNy6iXKvyxpdHpZ6BE0gyodTjnNk1/thcshrrWJVu8CRZ67cRyjNV7C7NpfI5NFxbOz9eSkS8a6PEq/DdFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757482061; c=relaxed/simple;
	bh=OEjoHrb9xyWRVDSFvcYOUh3LLg2YMksqTVPNz0zunko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GduyYx5Q8YnDarS2SxU5Fwt7pEt2w3lSety+P1svo+GM7fnGZonmUDErhhnKFxaPGP38ai0jd9JhpMJ3EFkvl5dYlvTXJTBPC4WGjj+1pnBPkXjTB+hUb/+/nCUvO1BQaHfuCRAJDbbdMsNBFIsoVBbMo3C1vJK84kILRhyAQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYNVbl+L; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYNVbl+L"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b60144fc74so40322391cf.2
        for <lkmm@lists.linux.dev>; Tue, 09 Sep 2025 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757482059; x=1758086859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfXAU4kTFrH930fc28SyL71k8a9bCpgJfUYnQ/0K2J8=;
        b=PYNVbl+LsW7O3fE/9jYcrAZq10pY5++c3HeDy+4IlBXHSfKSGb92W1KWZykFgC9HmE
         W3LQCPj0R/76XRZ4U+4QQ7EhwcXXckw+XYEcP+L+jdZzMAjFBgRaNeTzzCev5kkY5jNE
         NJbUFp2QZgbt4xDWWf9hAzhqxVw/N4JO7Airu4qH05Bc9fYaGp16fPzYKY/9OMAyce5m
         z1YV65clrqJLIDcGbuzbdgZNsN0dlQMruSezBSAdHof6kJKSDk2cocZWTCWlnYZHIyCn
         a/mhDu/VUL7uctfhBzMabLon8YL5YMH866Q0t6pseTSWINHRCI6gxWWbKFuNAoWyxH2Y
         N5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757482059; x=1758086859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfXAU4kTFrH930fc28SyL71k8a9bCpgJfUYnQ/0K2J8=;
        b=wRPof+WfYn0h5jmCpzNRD0cCCdZvaM2AfoouiDy7mIEZwcOvnEgYL1EpINRYNIZ30W
         bmt4HbHyGRU1k7qr44UMIW7svUZdwkqsU0vnucH/0KCMBBFrG1KBQwYMUdQUr/1NA7LW
         MmNBNVR2qEGdYmQBGeo2xBP4RQX3SHWKY2QSWUGlWAsTejUMlPD1467YHmGBMYCa5wmS
         ovQvK8vUk5mSaMjIB72RqRbiO/Nds9gxtrSL3srNPaKmewZUJHB8x3NyzINulJoZTIXs
         iFxYuGVCXDrn/O6Rzx/sEiPM6FSY6HRelypYKOAcTG9YWCuIsW9DyVnpUIbMVsyoawha
         2Ylg==
X-Forwarded-Encrypted: i=1; AJvYcCVKj1bjLLeb/gAvJFh3pOymJPim6o7k4cnbPQMQdB9tCfkeQDl2Itz/vSYyo1vXKmZh8aUe@lists.linux.dev
X-Gm-Message-State: AOJu0YzN+88ncgncEHylC5vIDfr+GPmSc2YUmiLNJx7NazjT9sBroisY
	b/eFYpZ5d569dDHikgpXoGSvDXukHdDuYM+++qsFm8gCbslti9+TGZgO
X-Gm-Gg: ASbGncuSzGlyuqqinCTYbs+308/XfHWP/UTjSNB4BaRVc+lYVNoni191fGRItCjcZYu
	f5A/RLt5uW7r/hwidu1pOEyDA4kNn/2y+p9rxLFXtyFbx3aCxvt3foFiQs8P6wqlwZvZBDjSfop
	JtOk5QLywHvnDqhi6+KQ+/mAK8wEt1PRJiq99FjKNQV5xD2aLvlObgf3LDQXSMIRNnGIw0hE5vr
	RLB6S6VAimL8IL/IrN3N017cARKxl6Xv1tRXKSEv642Zpidp7m31Xt6HCC0wa/AjHz9xvB9HMp+
	3OCLYJHJ4V4/MgF2ZB++LYkf9ZWldFCPfGuHWAoeglQiV1pU8ebh+PRqCQPLJ91+aCL9NkBst67
	35d7HzRdxial0BN3iKZPbSDnCT04QbrDSYNoFFxAxgBZOJSooUltJ/5t9qng3oKzYuQO5mWnZVY
	XrhNJc72yAb9YxuFGm1ttmt1/lC5SIuw2BcQ==
X-Google-Smtp-Source: AGHT+IGJCpC+WkX11yTimojnzJpYFmfIyENqaoCRO9ATPdK5TG7co7dhryOiWhUgo1G6hXyFDiewfA==
X-Received: by 2002:ac8:598e:0:b0:4b3:5060:2520 with SMTP id d75a77b69052e-4b5f85396e0mr144011751cf.54.1757482059056;
        Tue, 09 Sep 2025 22:27:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbf7e4asm18769491cf.52.2025.09.09.22.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:27:38 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25393F40066;
	Wed, 10 Sep 2025 01:27:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 10 Sep 2025 01:27:38 -0400
X-ME-Sender: <xms:SgzBaIzwYRQ4Ab6lGaG2VfE32Siy1RNHNHHvowNhpDeNvBnOG7ahmA>
    <xme:SgzBaKodVCj1d7SRIE6X1gDwVm1M0mwf3SlMP-jSkOyfFY1Cgq6aWmXQTMHn9kBwq
    bJJRXJvpCAneno1QA>
X-ME-Received: <xmr:SgzBaGUWm_7OTEyRro3DZog1ojhO8RFLRh6KHhre-GOO_E_oeK2BVUy9gqtecgoiAqStwdWfX8ZvYA0mcG74jTfebMydEmHj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinh
    hugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhish
    htshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepmhhinhhgohes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SgzBaJrdnrmq4oGebfUVw60Et0G5R_v1jwoP4oX7GmjTC83BfPbEJA>
    <xmx:SgzBaCHYfqMbtt3REvQnyyE2BaAM6kF5atDtvEiyMHj1NLaaSPNdWw>
    <xmx:SgzBaDtgqjk1d0w7H27JPIc-EV0RaUjhs8zWPRcd8slF6tESybD0OQ>
    <xmx:SgzBaNQIHv_3lcmrVqVvWmrQlJMF4aEaTAqnzwm6uLURm4A0W1gsUQ>
    <xmx:SgzBaIHr-TT9egXJ7Ki0K_lPKpYOyeBPq6K-6hSyRUpkl-uxmUNgBslF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 01:27:37 -0400 (EDT)
Date: Tue, 9 Sep 2025 22:27:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>, stern@rowland.harvard.edu,
	Miguel Ojeda <ojeda@kernel.org>, alex.gaynor@gmail.com,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [GIT PULL] [PATCH 00/14] Rust atomic changes for v6.18
Message-ID: <aMEMSGSLpprpG_w2@tardis-2.local>
References: <20250905044141.77868-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905044141.77868-1-boqun.feng@gmail.com>

On Thu, Sep 04, 2025 at 09:41:27PM -0700, Boqun Feng wrote:
> Hi Will, Peter and Mark,
> 

Ping ;-)

Regards,
Boqun

> I'm sending this pull request containing Rust atomic changes to tip
> tree. You can find the technical details below, but most importantly we
> got a new reviewer for ATOMIC INFRASTRUCTURE that can help maintaining
> the code. Welcome Gary!
> 
> Similar to other pull requests of myself to the tip tree, this pull
> request is sent in form as patch series as well, in case that I missed
> something and changes are needed in some patch.
> 
> Thanks!
> 
> The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:
> 
>   Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-atomic.2025.09.04a
> 
> for you to fetch changes up to f9bd1b3774be140762af2fec9c415b4a11746c48:
> 
>   MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-01 19:15:53 -0700)
> 
> ----------------------------------------------------------------
> Rust atomic changes for v6.18:
> 
> - Add initial support for generic LKMM atomic variables in Rust. This
>   ensures Rust and C side are using the same memory model when
>   communicating with each other, and would unblock a few more
>   fine-grained concurrent core on Rust side.
> 
> - Add the wrapper for `refcount_t` in Rust. This avoids using customized
>   reference counting solution on Rust side (e.g. in `block::mq`).
> -----BEGIN PGP SIGNATURE-----
> 
> iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmi6YvwACgkQSXnow7UH
> +rh/kgf+LruO9gn49QAzDE4T7kf9rP/z4ocie8sxMtED5J0vw12PAVa0UERQyB4m
> 756O0GSFKwESJMjLUifBslkt64k8x8hQ+XHYH/WPe/Rm7Ku4kf1zsTO9Mt0xA5qr
> c5OgnLxR3T2L+1x8rEus8lPnExyX0G0b1/H1XjR+rvZAP1enwcLNyGFV3fNfAYNJ
> cMpkGCMFM9wc5dpzDx89ttw49I8yuy+Cmf/eTtm1YDWQgzYVEycF8jTkFqYykIax
> jMcZC0a1Lqrn1pLbxCZ5UEM9vxJREv46xBW6iKSkH5RWlbLo2gqMJbixYvkLtgBP
> AbtrUtsyIx4Rw0nPEZ880Nce/LdhUw==
> =Kuix
> -----END PGP SIGNATURE-----
> 
[...]
