Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20122DA1F
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752476943; cv=none; b=l4uRMiu1yZ7oc526+553+zr7C0qb4Ma67YiNQS01Z6ijBieT4sMuKCAUxnf+NuZ7P7jcx8rXqhMVuByUO68vvC3/7eqqgQ4P5ljl8l4Ykh9DFmT6Y1Hz3oFn9JQFlSCHBmRg5HDjpmKHFhgJaBsKuWrKbtksS/ieUx07EJiHGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752476943; c=relaxed/simple;
	bh=x//8q92R3nOcCNECS4nY8PWQLzPPAa1uQNquSm3Vvmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL+RVJFRnmxx491W61DMbJFd/z6WcSzvy4+4qBUL/DdoWk6lbkUlaciaxtF0K9ZEWSfMxYDS+PPuHsxmSk9GQQQRE9PKeBEfyn7PhvuMsdIGa2HSYXo1wFBorL/oqq1BckaorSNMw79dpHcKQPEvFZHOVyajl36Y1nCm0IwDiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZUMxWQP; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZUMxWQP"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so51587856d6.0
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752476941; x=1753081741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkJDkHbnoquXDlGKTmb4rIJk6It3tSzSiHWA/GDYj/Y=;
        b=lZUMxWQPyaDU9T71KIetJf+blksSYh35E+ovfAHF+PkpXLeu1dI+YsV84iXDyHnllm
         N1VAVFRZEvfgczO4xDo3RfBqxVlsWpj/zLQaa9dZ8z0YKGZzuQOMX8XgcYXSna3p7Q3H
         yi6K/gnUIzDORkVqIvB3ATRjsFqA5rhCuH1lJS6iNNFtd8PchMt194KdWKWFVwrHJls0
         tj9LA13GUiH5UrI5HNmzDFiuvOnkSga+OnN0FVh6Ctuf55kapHpsNS4T//WblchMBU/n
         i32YZI7JMRWH52uxVq2kPkk/bmtI4zT1bS9tm5C5vhw0thBhzUP90j7ikxQXooU2SlOR
         RWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752476941; x=1753081741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkJDkHbnoquXDlGKTmb4rIJk6It3tSzSiHWA/GDYj/Y=;
        b=abBrUZb4vQXnvXE1UL1sGQiUzt0mEj8qj55gXlHa+yBeJsI0YnZdmnirjnbGq98DzV
         B+YlJTU2WtT3tltuqFlfZCsYvr4WwD+HktbzeoamGUNB7QlzbXaOhs01yJEwOuRzqBET
         16DQGAiKstlDmqS2RHdCFDTa7Z35niCpIjQMnOZM8mIyjzTQg4xRZ9eAhs2C91CZATRD
         qnmplAuoeuMsB1ENBaQrtpqVVOdMX91AvLza8TdNFic6W2XxLnnRS8XPT2tztUWK/n8R
         dVdUB3OP1JKjbA2zPzNVQcE7xQayJu9+stodYYg7XACh/Nqcb/EQX+ITONezTbiB5AJc
         hmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTc4fUUhlEjoe24gk7Hscnf/EBPmY/icud4F2sheaTRQXBbpw5/m8NlTjV+e/CV7B0lgxR@lists.linux.dev
X-Gm-Message-State: AOJu0YwgI9sDMHLaCaDdVPD5qkcNyywE/IjW//iZuYgYP55UrRszabwA
	/6PEip6NyTJ8g84dNxsw79bBLwLEYcUMs364YUEIKmwsMY3X89wW+KA3
X-Gm-Gg: ASbGncvuOPeLOpMnzngffzFcvQrmHSo8FPcnbhM1ALkr17sWM53qcAIaiLHLDKV+6gn
	DYA/6qq+ccoBVWtZo/ekSUIDiC0D4tStZXWUe/zzcm2b724QpiQhZEatSnjxXeOqtiWfuMnXnE+
	tLOHCu7cDcpLs8YtApooFKuQj+6gOPWo9OmnHLtaCDGsOsha1XJA/5tHcO3KvfXiM6TerintTJ9
	O0QCe3TXHpewVgRTWjCxhehMazqmKFsR+BgY+wCfwYL00yGdT1QyJwh/+xoLewaxfqOrqnEFWom
	5tcPdajBwOAf5mogzaCzXPP5ihVoMfAZP5+x1LjfaMSutbtR2Wu1y+z4nLmwRkTLxVfdrIgI5B+
	aDK5z9UV0m3zf/EjrD3H36Tu6BiSnLjiBgibZTGArDfVUWAZv4p7UTZRLbsoJFVdcnzjOFD9Ax5
	9I6Q8FzMZ0dsSvgDbbLbQxY3M=
X-Google-Smtp-Source: AGHT+IGGt9c3g5ocSLs6ER6i4TSNQnR8605ekObL+FAV6dt9sSig0LCnZAjmkbZHXYQxcEO+mDqvhA==
X-Received: by 2002:a05:6214:230c:b0:702:da0c:61d with SMTP id 6a1803df08f44-704a421dab2mr226258786d6.25.1752476940718;
        Mon, 14 Jul 2025 00:09:00 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979e459csm44240566d6.49.2025.07.14.00.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 00:09:00 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 957D0F40068;
	Mon, 14 Jul 2025 03:08:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 14 Jul 2025 03:08:59 -0400
X-ME-Sender: <xms:C610aNvXitwiN8QyoM5oDmoifC0DBJ_FU4jl7zzEELX4Fc59Ekce6g>
    <xme:C610aH8TwtYcUtsRYeUiQniPa7ypuMd1ALJqxA_saUFwCcCwpUoF2wE-4-npSmdRd
    Y7ViYpF1eGRQz_Mkg>
X-ME-Received: <xmr:C610aFXGSS3mMQ7oSh3AKxX74A7HlDLtCjK7bm4paEphKDEVP5zUFiLhww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgt
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:C610aDt658Cbv0cR0jGgDKcoZRdZw95fvS-PaXJw7hb4S80IYIKLfA>
    <xmx:C610aL9ku6p9ppgesOwtUD7NUtTsu2zTp7uR6PaZvz39VT-kncR_AA>
    <xmx:C610aM2VBRrSJswqPKRyjqMk4GbH9lfWKJta7065cscYxhDtF6MebQ>
    <xmx:C610aAQApEeuoftoqhPSQGNL1Xc4aXhXbhGCyGBCyKuW28mhnKBkQA>
    <xmx:C610aPB6NVJN0R6x5AujjMKg0bw9cAsLXrTvSHmhfbuNCaCjC6bpscYl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 03:08:58 -0400 (EDT)
Date: Mon, 14 Jul 2025 00:08:57 -0700
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
Message-ID: <aHStCX_pxoGog8RF@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-5-boqun.feng@gmail.com>
 <DB92I10114UN.33MAFJVWIX4AB@kernel.org>
 <aHEYkg5K7koUohRo@Mac.home>
 <DB9FY5IYEKIH.3KRD160QZ8C54@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9FY5IYEKIH.3KRD160QZ8C54@kernel.org>

On Fri, Jul 11, 2025 at 08:35:25PM +0200, Benno Lossin wrote:
[..]
> >> > +///
> >> > +/// # Guarantees
> >> > +///
> >> > +/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race,
> >> > +/// this is guaranteed by the safety requirement of [`Self::from_ptr()`] and the extra safety
> >> > +/// requirement of the usage on pointers returned by [`Self::as_ptr()`].
> >> 
> >> I'd rather think we turn this into an invariant that says any operations
> >> on `self.0` through a shared reference is atomic.
> >> 
[...]
> > [...]
> >> > +        let a = self.as_ptr().cast::<T::Repr>();
> >> > +
> >> > +        // SAFETY:
> >> > +        // - For calling the atomic_read*() function:
> >> > +        //   - `a` is a valid pointer for the function per the CAST justification above.
> >> > +        //   - Per the type guarantees, the following atomic operation won't cause data races.
> >> 
> >> Which type guarantees? `Self`?
> >> 
> >
> > The above "# Guarantees" of `Atomic<T>`, but yeah I think it should be
> > "# Invariants".
> 
> Yeah and if we use invariants/guarantees always mention the type that
> they are of and don't assume the reader will "know" :)
> 

Just FYI, I ended dropping the "# Invariants" (or Guarantees) of
`Atomic<T>` because I don't need them any more. Instead I add a
guarantee for Atoimc::as_ptr(): always returns a properly aligned
pointer, which I actually need for calling C functions.

Regards,
Boqun

> ---
> Cheers,
> Benno
