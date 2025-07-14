Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D4139E
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500849; cv=none; b=Px+Zu89SFRhImoWCiC+QL9xNE9MILhcm6NnFIjGVPVZaA0hCXxoXH29VLm4DWCfc46qxs7jWnETNHVlk0Ro2FI00dHHfhxjwFl4K9HDUbdKI35k1Xakn5tj243xygHbWoCWK8gD8JQxyYsp0WD3UHswHsgKyhaxs63bEen6E6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500849; c=relaxed/simple;
	bh=Olq+q1hlsZvSCxl6oX0NqRMgS/hv5fLjRTZshMpP0o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCH2TMeo3fhb26LcmsZk6tdaIV2+FIuB4qDDsG7HsH+0enYRol1fdRsd2EBr8VIan/vUuDqeNvNmBoX6iI/QDFKpp0Mf88bsM3aN5AXib/WwhLBuVZYibo3jRJU2gDcYYE+0btcgPp0M5U+BLTrsgqmK3IILOCfaFAmlqZjCWnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxLFBru2; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxLFBru2"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7de159778d4so231413285a.1
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752500847; x=1753105647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3j4m+MGxK9NH+sARTNaIEHxLP5Gbuav9zslDuXdpPU=;
        b=RxLFBru23Ptvfpxt6DTcnjiFQgNKu6i20iPpzY9A+972UW7MSsNb1NfTtcAekuGSj7
         9owioQNOVMIRi2oy0TDcxtMDBDfXSAAnybv56OZzRBWpjwQex7JYB6uvK51aASIjpf+t
         eplhDIIIzR4xI/xczBZ7zNxQ9yPwlhx215HDX6BEBJaq51c96EcocIvq99uvCAXMQ//H
         VO45qzhb9WUw5QAmXJseVv/Ri9lCf/R51ifcvTMbIrWu+z40OqDjLoFNoayb14vkSN5M
         UBaajkD6IReOKDP36oSldcmM4HLPmZ+/d8uYswynOHa0MDHl2slhoU4h2NtBU0y3jS4p
         LQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500847; x=1753105647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3j4m+MGxK9NH+sARTNaIEHxLP5Gbuav9zslDuXdpPU=;
        b=iTuWCOkUhtJhGg3rcAbE+3xhNSgzumJWkzowEfswE3QB+EB7WMAnHX/bMH3wQyU5Hg
         BlkgI34OJ15uTpBxTO+Lh5sHZkX3TfPZoXCVOQNjdkNZ8ScSH7VTgAgrGBWsXjwsIPas
         Y/NWTmijloFX1MlJzx3zDBiCQhVwjoc5H8NDRQPHwcISUPeBGRsPlxYPvLsMY/WZ1Lng
         lcG8mVGB7j4ZxssxSTuo7EyQ3ZU0MJX0M/IbDoKtuvYLgeefcd/rpu5Kpee2XrgpAhNl
         X9RO/RgK9XQc/DSmnbAmyaF8G50nng+pdoGchbMY4YmSPH7ZMTdZ+dYbOqiv9tEmRr7f
         cu9w==
X-Forwarded-Encrypted: i=1; AJvYcCUc2CfLzeri7VFGON52z67l/v4xnOA6rlA/fcNeRk5oyQyl6S7GXQ8nY7J3QhpO5X7EUGiD@lists.linux.dev
X-Gm-Message-State: AOJu0YzikwwrUN4xGNJHjTLX0WiUdqX1z8oAWbUY5aUx262ttx2BB2Xv
	wc6Pd7ONIfB+LXGBBk/PGeMUpPBqqtHiIRdv0COuztt0Lu+ryXhF7jId
X-Gm-Gg: ASbGncvCN8OtFsGKyTgXjByNKQw3GzwJKLvlJCzxKZJVVK14LMYujPAIZh4ay1tfh6P
	RGabx48ZkcRi7KrqNJFo7zy8gmVLH9sqnUQZNq8VB66E7ALPY4T2eQhV0B+2jEbbdAvaHJX8kQC
	PBD2aDgb27zQcxdvXNlPMY2rItSx8PxxRdQB7U1zLqQHACGwJtFBA8D51zcVB6iFvpmb8BaHi+Z
	ZeUt60vO0SWGjrA22+kQ/W9ZOd5/pYeCQeTxsAjRX8qnvw47F2U/wbCT66KRZZwvsGYB+wOHCVd
	ltLpGRhcmaG+Kt3F7MBU9hRMkOYPYZUX2Aw/yrzGHoLF3yO+4x497REvWpmqwEnk2Iujmrad5K9
	n2s77MkV/9bZ83skr3mI98FvCpLsKbIEsOfTNFL2UTbxK+z+/sbRDNQJr8kj+eDukpRTly48gcz
	TxbN071br9ms6x
X-Google-Smtp-Source: AGHT+IHo28sU146jMqRyWUoeKa8Yk5IwPxZWxFAwdDfLIIABL6lkMYs53Nt2rNNPIXEDcgl9CfZFhQ==
X-Received: by 2002:a05:6214:2263:b0:704:846b:5f53 with SMTP id 6a1803df08f44-704a42b14f8mr240353746d6.25.1752500846500;
        Mon, 14 Jul 2025 06:47:26 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704b394b6f5sm23848676d6.12.2025.07.14.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:47:25 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 32369F40066;
	Mon, 14 Jul 2025 09:47:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 09:47:25 -0400
X-ME-Sender: <xms:bQp1aBiDBYppdzCwS6cNCIufgkY6XF5ZrSFeFMqkWYygHKGoVKCM4w>
    <xme:bQp1aHjKEazCF_cFWoU4WNX9XmH8iMYfsr5GHR4xLYVdVIC_gvrjnQlLz40Cwo1UO
    JbnNR8Vceoq0wtqJw>
X-ME-Received: <xmr:bQp1aFpkKjojUIvRAKhztRMi5OAhdVj1LxYuHALuhTFm4SoaRHAE9TUh-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdduudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:bQp1aFxAHw3eOmeq7mO212W6QCGo8bgCQsCyXOg0vlLt3kHpdYHfPA>
    <xmx:bQp1aMxm6H5LUvqSBBMl7MMw2__QVBaFB6sMV039M9EDTCctRaTE1w>
    <xmx:bQp1aFYjAwtvYTvtc0HfkJ7Q_626o--RfyzgfqRtmLRPJgQ3FyR55w>
    <xmx:bQp1aFlZDvmi2K_VOJE-ZZkU6MoUzpd5frDNYzY8plmd4FfxQR0OCA>
    <xmx:bQp1aCHiG3nnjcqPTSBcGxzV-K6dOBX6NP0ZYop2ujIZDueJ7R0vW1j1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 09:47:24 -0400 (EDT)
Date: Mon, 14 Jul 2025 06:47:23 -0700
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
Subject: Re: [PATCH v7 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
Message-ID: <aHUKayPmRrAOd9JM@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-10-boqun.feng@gmail.com>
 <DBBQ9SLMWA2K.33BWRE1ME65MG@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBQ9SLMWA2K.33BWRE1ME65MG@kernel.org>

On Mon, Jul 14, 2025 at 01:06:08PM +0200, Benno Lossin wrote:
> On Mon Jul 14, 2025 at 7:36 AM CEST, Boqun Feng wrote:
> > +// Defines an internal type that always maps to the integer type which has the same size alignment
> > +// as `isize` and `usize`, and `isize` and `usize` are always bi-directional transmutable to
> > +// `isize_atomic_repr`, which also always implements `AtomicImpl`.
> > +#[allow(non_camel_case_types)]
> > +#[cfg(not(CONFIG_64BIT))]
> > +type isize_atomic_repr = i32;
> > +#[allow(non_camel_case_types)]
> > +#[cfg(CONFIG_64BIT)]
> > +type isize_atomic_repr = i64;
> > +
> > +// Ensure size and alignment requirements are checked.
> > +crate::static_assert!(core::mem::size_of::<isize>() == core::mem::size_of::<isize_atomic_repr>());
> > +crate::static_assert!(core::mem::align_of::<isize>() == core::mem::align_of::<isize_atomic_repr>());
> > +crate::static_assert!(core::mem::size_of::<usize>() == core::mem::size_of::<isize_atomic_repr>());
> > +crate::static_assert!(core::mem::align_of::<usize>() == core::mem::align_of::<isize_atomic_repr>());
> 
> This is fine for now, but I would prefer for this to go into an
> `assumptions` module like Miguel proposed some time ago.
> 

Well, sure. Also if `assumptions` or other core kernel mod can provide
a definition similar to `isize_atomic_repr`, I'm happy to use it.

Regards,
Boqun

> ---
> Cheers,
> Benno
