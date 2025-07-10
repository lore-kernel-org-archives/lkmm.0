Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03132FE314
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 20:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752179376; cv=none; b=BBbDetLRzOwUDI13wrsCuOzkQMmp0a0DVoY9VHpM9R1wjyc9Ue9x38z9/odCF53UzghuAnPJv9+9WQ0Heppga/9JWtXOzmJ4MJRJUf/MEEh9YzUFFOAS6L5eSTjAq54x/9qdXaytsboJgSONWwN45xomJPFv6Xf6rnADzyqpa/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752179376; c=relaxed/simple;
	bh=hI6kF2VsYpQSxed7fWUz+U28xt0SkXt5Eiurxvo0eFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRJQLgwWeq3T56m7Y4mNNqj02csOdKAz8INHJSDMCikthcKOX5iXR/hLMBWYFvd3kP/HU43GiV8/VAVbSk2wYws6bQvfnh3Pbpi30k5x+QBbuoljOqAfzaX9xBTXSjiabrdmPEr93A/j6F80KIpBhXi5Vl3E1cfMA2QwHmdsK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTGSQ2WK; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTGSQ2WK"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d21cecc11fso254955685a.3
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752179373; x=1752784173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9Kows6//5K1XKbUlD36iwUd832otL138Wso87VJRuU=;
        b=HTGSQ2WKc+HN+U/uZSJbudykEjM20AMk6o8as+eWTQj4X4To5XK5Zd1y7ip6w4eRCd
         FKlWOjbCxRQgCkrJGDhQnIsynTrM24y6/YaGnj3IUpkeBEWnZYPMWapkgFIRZmhpKHMA
         Ys+wTUIR8/AjWdY3h/xBQrwL/NTSRG+crVgAsjEgmSGmTlCMFpCpKPdKGPDra+oNRuTX
         X0NA18CGe2qZjVNDMa0B6OYLolNbyrbgauaxM3avPENuTSC5LcR27LAgH8s9jdY0lpe7
         Bpp1Eic7n/4+bMD8Ln9+dDpsfEHTjTFB4SpyMCatJYgeKeZ1mKNtKsOLwGV5KwLdQ6sA
         7I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752179373; x=1752784173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9Kows6//5K1XKbUlD36iwUd832otL138Wso87VJRuU=;
        b=jY7XCw1MTFAUPXdQU/h+QLxGwXCT5S4R7V79UuH/84kVpGDDox+YqcyPCmVArCMkhB
         GPC4F7MIf4js98FSLSXwcaArCMPFvX2sbbbnZOIc8dKP773WKRbuj2ODZ0ABu892QaoJ
         jZm0bGb9TArRutrcP3A6YWJEhMNvZlMJS/ky81iICYZzw/4WAkebI+VsouW0xCC9SV8G
         WbwOm2FNNflksJU7nmV7hrHf/4ylTb+SbcNDGjkLaYBID+ALNs1tn9PyHJdfH6bUBMDO
         Y9gzNSQ8rTH8fxM9+HZxbYFupAvXrc7EfhhK/hSOKDIVDkSjtUPuqW9E2WqzvSipC+TH
         3gDA==
X-Forwarded-Encrypted: i=1; AJvYcCUAqZ9neN/M/WVQndexWSmD5u7CwVCdnXNnvPVPJXNhtGDEguxsQ54RXW72yC/o913lTb1e@lists.linux.dev
X-Gm-Message-State: AOJu0YzG7KoJVxdNDhWthu9KslNz9bJ6anczsktEU70lFb5kSP0dF1v3
	WPUc21QHJTHRm4HhhBt84rbXsycMBzMNBQg1KHg9fwac6kQSZTc7xR0T
X-Gm-Gg: ASbGnct99/+QCA7nW6KngAixVm87PsB2VDKom55iOisFt6u3K+5cSZ2uAKXE2iW9hEE
	42rNQ0RI07PClS+AsnVujLJ2XZdOD0n4c0X2X/5XkWEQMAv8u86C85A2LK1LhIkEJKOPF2USwan
	IH/2d45ZTRdldMufCAYcc5t8/yKdg0ArJYRPYjvKBI7LorDAIlr8XWBA4evMUoHA1O2wYmfZHZh
	fZtnn05kQhMs5j/0asdzYb5fW5wQD4p4ZPsPMVl/bC6hEO7vBK0JOzfFmM6tl0J1i6F6y+M9Lf9
	BT90LOE4htxyy6GgM5ZRLh5hFdATATo+R0Q4Uj3xX+Bni0YZf45d6X3EvEKU1OMsjhB+RFZWt1h
	sAJKlgbF40X46Y/nVVDWqJ08zatJ5fLyE81aQYTp/9T2Mgaoe4Wv6
X-Google-Smtp-Source: AGHT+IHTxHpV0SwGmDFllmbTBLgJt+IQPK8l4umZTYz9F0x4Va7+5/8tlYrHthE4s2dROSDM9gkudA==
X-Received: by 2002:a05:620a:a118:b0:7d4:57b7:bc12 with SMTP id af79cd13be357-7dde9d4b464mr115881485a.10.1752179373431;
        Thu, 10 Jul 2025 13:29:33 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdebeadb5sm136572885a.113.2025.07.10.13.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:29:33 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26EFEF40066;
	Thu, 10 Jul 2025 16:29:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 10 Jul 2025 16:29:32 -0400
X-ME-Sender: <xms:rCJwaApMAG3WehairgMCq8kOSYcKvMddKt9s7szDEwvLTogrYO4TDw>
    <xme:rCJwaILFerzZGDlmOTkw4csLP2SdPJPzHC7jmO8TG3CRlnOR_6U2lkLa-nijzVRJw
    chnhFI0VM5NPb_5Iw>
X-ME-Received: <xmr:rCJwaJxDoKHRCxVqWXHTBIs6llhd7KG1GACW0EPSONc5jKvUnmOxWxwhYF3anoVz6UbHpEMUvdey0hWHD_L5ezcPi24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegudegtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:rCJwaHabvA280zNgmWRCUYxiiRtxOB7BFdP3fzB8P0egKRMvSLaxTg>
    <xmx:rCJwaN6MuakdEsUfkF6v6aCHEK7TRJKsVZ8ewUsMpmy_EqhSIzDx2A>
    <xmx:rCJwaACF3OI3zx8uVHhJ-JWze1x5lpppwZs0aLk65pMEvBhDhBSWBw>
    <xmx:rCJwaLuqE6Nqlit1Cv77HRIYlf2VTRDVoSiSvt_B6klWLtN4nPPuyA>
    <xmx:rCJwaNuU1aYnFxMo6iLrDLg7_BdA_kdupz1-vus4I2wi46AAq4QRP1cu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 16:29:31 -0400 (EDT)
Date: Thu, 10 Jul 2025 13:29:30 -0700
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
Subject: Re: [PATCH v6 2/9] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <aHAiqhPe5OwVioUe@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-3-boqun.feng@gmail.com>
 <DB8BQGJNFDAY.BGQ8CZSFFOLH@kernel.org>
 <aG_Yah5FFHcA3IZy@Mac.home>
 <DB8HQLY48DFX.3PBBUTQLV14PC@kernel.org>
 <aG_nT3H8J-h2qwr5@Mac.home>
 <DB8MAQC4V57F.1GGYO1PNPOV2X@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8MAQC4V57F.1GGYO1PNPOV2X@kernel.org>

On Thu, Jul 10, 2025 at 09:21:17PM +0200, Benno Lossin wrote:
> On Thu Jul 10, 2025 at 6:16 PM CEST, Boqun Feng wrote:
> > At least the rustdoc has safety section for each function. ;-)
> 
> I don't usually use rustdoc to read function safety sections. Instead I
> jump to their definition and read the code.
> 

Understood. It's probalby the first time we use macros to generate a few
unsafe functions, so this is something new.

But let me ask you a question, as a programmer yourself, when you run
into a code base, and see something repeat in a similar pattern for 10+
times, what's your instinct? You would try to combine the them together,
right? That's why duplication seems not compelling to me. But surely, we
don't need to draw conclusion right now, however that's my opinion.
 
Regards,
Boqun

> ---
> Cheers,
> Benno
