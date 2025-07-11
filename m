Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686252F0E5C
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752269125; cv=none; b=LBUweNAyi3JX54JUJUn3aRVFOj0D0XNR7LFnaXCtmk3/AvUTSQdvaBD2EPMmbry7Jfxl2GexPoDBR/4VWbYqGwDYPKK2LilGWkoA/cjrAMAnS5cXpQygKRQZuC3MZa6Cnvq9TABxentomx27ZnSXJHTXEJxG9Hau5V5NQIXbqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752269125; c=relaxed/simple;
	bh=vC3PVXTJBIz2jeZWSCWKN0Xnoj9RurMpRQ9hz73geyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2yWdcs8PkVes8WoLaAx9UXehDX8dYtDzTFJLFghv3wqSsj8om0Z9k/2KPFaj2eEksdcvwrVPuKdJENNuHPWOFBIjG9ZrNJYoMHRWnpRZ1qUJ6i7SkIMQOO2G0DVFgmrj+g5Q6xM3BUecnDRPb7qhLcIwjOXxuBrI9E+7kdDgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiDLbefV; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiDLbefV"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d20f79a00dso352915985a.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752269123; x=1752873923; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81AF1UakxRffZTLQAg4yaS1lBgs+aKnzFImbGXcyFbg=;
        b=GiDLbefVgZyaeWJgH5jECWZWrmknmzc6Vxo2WYRKmr7qvlfhNsdrPqmIbxmW6ydoPC
         rqQhyAF0m9NXsfwoSXgvuZO96jkkAKbcWy62lyZlsfaC/bOZ9ARsw0Kr81nZFFw/DwaM
         UYEudHqONeRGQniqGoO75AQdJ9CspzjuyhVzoI70Ml72GP8GwZdOlNRhJZDZ25Js+ufv
         vStNqmqPEHPLDoQvwY3hunb4a8+mJoKyGmjbAz7HNdi04q07DNDNg68DP4krilX+DqcM
         IfnENUp44iHlXbIXM5rU3ZM7feebSMzam3fLUx+YE43NKtsPTgoVKGsVfy85YVQSBuf6
         oRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752269123; x=1752873923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81AF1UakxRffZTLQAg4yaS1lBgs+aKnzFImbGXcyFbg=;
        b=X/ZiXxqD/EScEt2f7obrIRjTEvd2KBukTI75IFpw38gfocdQDdUphMJ3dADdlv9Tz9
         4eJVcqvt15VO7/eec/MOnUKt8LycEibgcZvAPJxVsFD4/pkSxCJS+v6vZTP3YEPZTX1i
         X6toglOk4AJQzOG+EBmvJYZ0n0B5yWt+nkGzdzOMp+VPuSW3KTxlDRCpJjUb18coI9JH
         oKu4lISmjguDEMHWDktG4/hptnlKaEDPTG1bqYO4zKdO9gI13qja/uoJlDdD8X1vh+SS
         CTfqf0wkLmOkLWwe1HHezn/so2wqIlIadCxtaT+umN0HpS8sCRI/kDCCRolSGa+KB8i5
         QCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV9LQ0PX5ESYwWUctrlvO+moa9EMDJSRnEP/WFM+PUqSaR1smZTPrvRwetcJvl4BnUtkwj@lists.linux.dev
X-Gm-Message-State: AOJu0YzegmoRU2ha03FS/bHlyZsWgU5q3bNt3vjPOaNiMUxuX2bJ5k+n
	N0oI1SsL5JtWX83w9veqOYcfUTDO0zNamTUPym5wBT49PCGFOJL5nk0R
X-Gm-Gg: ASbGnct/hbfAWmuCLcCkDKEqkxRfASefid0zrvY/vxjtLp+9j65o1HYrN8zOLfhj4bm
	i1Yug665HFcKV8OVRnb710kRdEiLQzaqeCytkwqYdD++NB9d7vFgh5nayPtCFMTdq+JGgepWOiI
	qgu7yqFv7onUGzAlZQOsJqaeqMGsBMFr+xH2Fnqrq086d2o2/gcLeUa0asIhBlOKK31m3L5wDEz
	qfMmtlhkZXLgI0Hu9EHvsZYV21Obi3YwzifKVFrd4p12sr/WRSjqg4G2A0Pxp1jt4H15CDllsxi
	LSIF5KEjNXauZHGvY2WpFyeA1TFu74AngCS7xtZTPk9deI6vU+BUyc/kMVjebriS+aaCEqEuJsT
	G4WM6yps+TO70wEEkcA3GBzp95UcgnnMHS8+AJOtxXOmVWttr0WAaZK5G6KUOkpvMPTpqDF5UZ6
	mmBXxq51CIXaurneU+VCkYklQ=
X-Google-Smtp-Source: AGHT+IFSKRxEte1QaA1H5Go9CtUQyuCEC2zrhMa8WdRw87GMAgfHqEdwaEhwf2VDl2HqfCn3z93Kjw==
X-Received: by 2002:a05:6214:262c:b0:704:9596:b894 with SMTP id 6a1803df08f44-704a36062c0mr77709596d6.13.1752269123167;
        Fri, 11 Jul 2025 14:25:23 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497db3253sm23591726d6.105.2025.07.11.14.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:25:22 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2AC2AF40066;
	Fri, 11 Jul 2025 17:25:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 11 Jul 2025 17:25:22 -0400
X-ME-Sender: <xms:QoFxaGwKm046rbKSuTkGGogiy9YUqj9OJE1_fBcFbAytVTIMMFTrQQ>
    <xme:QoFxaDzhwVBkNIcPleebQ6eIT4bxDIHvuNo1FfDib9ZInX9KrWD4tsKSQl4CJEUrc
    Pg9VaJ_XrpuMHkypw>
X-ME-Received: <xmr:QoFxaM4tSIJz5h9Py6xa8pkPe5lBfuQeyEtjXWjiPmXd1Qtit_bhu09QOvuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepffdtiefhieegtddvueeuffeiteevtdegjeeuhffhgfdugfefgefgfedtieeghedv
    necuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
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
X-ME-Proxy: <xmx:QoFxaMA-vNNviVajjsoHRzvMKL6dJv8QvCh1W_ApA08cHRoB7cAZPQ>
    <xmx:QoFxaGCPflidngcM2V3-EEQ07cX8Lm2eAHnexAs-GkS_Gro0f5Gmfw>
    <xmx:QoFxaFpi11gKItmo9z72GHFLox-qBRNNJh8uzc39jDp7DuFHmPl_ew>
    <xmx:QoFxaA3GulzrE8l2u55pNr-1wTSLO1IF_52K1NcNd9j57V4N_OsjRg>
    <xmx:QoFxaMXiHyGYfY5LkpsW1UmvWH3deTChwLzTVgTAOZAzYkXGCjZH8F10>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 17:25:21 -0400 (EDT)
Date: Fri, 11 Jul 2025 14:25:20 -0700
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
Subject: Re: [PATCH v6 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHGBQLSzOq6RsqKt@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-5-boqun.feng@gmail.com>
 <DB92I10114UN.33MAFJVWIX4AB@kernel.org>
 <aHEQKBT68xvqIIjW@Mac.home>
 <DB99JZ3XMHZS.3N0GLG94JJSA9@kernel.org>
 <aHEWze8p40qeNBr_@Mac.home>
 <DB9FX5XAK4JJ.3GTCC6Z5EHARV@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9FX5XAK4JJ.3GTCC6Z5EHARV@kernel.org>

On Fri, Jul 11, 2025 at 08:34:07PM +0200, Benno Lossin wrote:
[...]
> >
> > So all your disagreement is about the "extra safety requirement" part?
> > How about I drop that:
> >
> >     /// Returns a pointer to the underlying atomic `T`.
> >     pub const fn as_ptr(&self) -> *mut T {
> >         self.0.get()
> >     }
> 
> Yes that's what I had in mind.
> 
> > ? I tried to add something additional information:
> >
> > /// Note that non-atomic reads and writes via the returned pointer may
> > /// cause data races if racing with atomic reads and writes per [LKMM].
> >
> > but that seems redundant, because as you said, data races are UB anyway.
> 
> Yeah... I don't think the stdlib docs are too useful on this function:
> 
>     Doing non-atomic reads and writes on the resulting integer can be a data
>     race. This method is mostly useful for FFI, where the function signature
>     may use *mut i32 instead of &AtomicI32.
>     
>     Returning an *mut pointer from a shared reference to this atomic is safe
>     because the atomic types work with interior mutability. All
>     modifications of an atomic change the value through a shared reference,
>     and can do so safely as long as they use atomic operations. Any use of
>     the returned raw pointer requires an unsafe block and still has to
>     uphold the same restriction: operations on it must be atomic.
> 
> You can mention the use of this function for FFI. People might then be
> discouraged from using it for other things where it doesn't make sense.
> 

I'm going to keep it simple at the beginning (i.e. using the one-line
doc comment above). I added it in an issue so that we can revisit it
later:
	
	https://github.com/Rust-for-Linux/linux/issues/1180

For your other feebacks on patch #4, I think they are reasonable and I'm
going to apply them, except I may need an extra review on the doc
comment of Atomic<T> when I have it. Thanks!

Regards,
Boqun

> ---
> Cheers,
> Benno
