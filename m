Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58021A43B
	for <lkmm@lists.linux.dev>; Sat, 28 Jun 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079880; cv=none; b=lddgaPmKsNFpmalQS6t0xLYAXA6+5Au+wT6HYWCTKTk59VIE9GE8ke1SqUmQBUPp8OA2C9SS58EJ3XSANao2WNnYi84joGCR7ho0luUgKMjN1hfNKcYy0nukkT1rfit+41O0pS4o23JFdHnCMxzgth0hbCVI/GMnsOyakbhKIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079880; c=relaxed/simple;
	bh=A199jhFR5Qy6+t8wqS3MkSs28EyiOM5Yrdp6FjD86/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKC4CyG+pdTbRunAQNBF5Ka0a6zUO5wFqH0pDezcoAGWsyvaTxnura0Zdz8a+KVAwKCH6MgzPVEZJJusOodRmP0k7cMSKeoT/yP4WG0IBb5ZYkTXh45uLe2i80Qd8STJHM7ZUmOFWW01NwOC5JsMjAr5FLGq4CV7vGhTGadjC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBqx8P/C; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBqx8P/C"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d09a17d2f7so41400985a.1
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 20:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751079878; x=1751684678; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBxGWmQb5nk/fyFqkHAC3KnBOgRqr/pEMtIFxkLYnss=;
        b=OBqx8P/C0rS6OQ8ROMPTTBkPNT056SHeT5SJ/xmy+YLFZFpzm+oc1hurOsk02Huf1V
         icrzg6flsdNcrCop0iiMnvZIyYqtQY8VZOGSbEd61uW2w8y8wwgMEhkKvlN5PNarBRkQ
         BXnljkLatK5cIl1M4LqJ3eH2Fy7DhWU8EHzOhhGGbTqI47bHwOwjRFPA1XCk1YRfdBzY
         MuCIL5HUwPkP63qsEQk9WoHUdIj8kkCNWbE9zqT5odEbQ/nUAgYGgO2zlCuThcqzie57
         1f2Qx9lKLMyeKYgYUSr/khsq2+EGDBh2Qz3N0LNyin9O2hTQuCWfoW3d1/hpVRP58lRZ
         v+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079878; x=1751684678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBxGWmQb5nk/fyFqkHAC3KnBOgRqr/pEMtIFxkLYnss=;
        b=mRK4Kb9fnvYKnZX8RBJ2WYLgRhGSA/IISclEB9EZcfbBM8sUzpT9hUH/OZzT5n+61f
         HJ56u9xKM3m+IYgiRHfqLgMo4jek6BAX9FXaHF4WY2kzAvfT36s/rum3Bf8IgBrYzoWV
         m8BN/DEno03Z7n5hquNvl1jfFFsYgaJACiCqDUG2VpbyvuC2tWyl3TDOl9RitgA3Io1y
         08iqYX2W+51hHZoufTq/UlT+NtmsV6Q6oqLAshQuZpO8tjERHsHtfWMcD9YKee8Lcltf
         gJvvmCeZ9BofiSJAD+5Lnc5++qPrhodkGlw+5uiyYkHnID3E8t+dEX8b1dcrhRl7rnTA
         Xytw==
X-Forwarded-Encrypted: i=1; AJvYcCUoqX9f465dp1S4duWptS2dZJcl3UKISJ95BRgDJUNfuE6OTRVsfJq+kGAZqS7T/AClHhUw@lists.linux.dev
X-Gm-Message-State: AOJu0YzMpxENSNPkBKjrewidv8dmzdG4kqof175ZJFrHcAWecxdTVm/n
	F+2LJv0ubsV/zcV0BpOegMHu1uj99SO4UtlktJ3FQroysphpzKBk3FqX
X-Gm-Gg: ASbGncutVU3zI8GIM53Tx+1M7DDN6N7ZxHKt3I+cs5ssKoK8Vy03T6MSVT8BQ4ggg5+
	dBDgZdOpM06OanfUMWHqohSyjWi5oknGTYd5HwuqoGRn43Qem5qRCNk5hNhx/lxJafblTcQUyed
	WQ+wuiXetupX4Ug7pg1EPphEpukg/hJEPQrN/8Ne7VeLcxVghgsdHnUVS+frj2Ud5dnzf2dn0NX
	7Fbyf63Ox1xYGgdRt4x/SXkICd1RH9qxqL+72IJLkVzF+Hun4adOC44tXhS4WNVUETr0tC7lWT7
	8nS9R5U6oaqWmGimp2VTaZNS7w9Y0HFDAWvFE+VNHZxfsNoLUGTusfHBSfHJNfbLyrKBSpGTMqe
	8mF4QPkm/xSOGeiJhaFl0uzsalygofQa8RkKS4VXE0b4vMIMQJpew
X-Google-Smtp-Source: AGHT+IEMhz5iYk21dCtC1J+T5Da9qhJbwioVtNp4BihLPHEjAmfyFJF8r20P/5zPbWgHh60hUN51mQ==
X-Received: by 2002:a05:620a:1904:b0:7d0:9ebd:821d with SMTP id af79cd13be357-7d44390ec5dmr925757385a.23.1751079877775;
        Fri, 27 Jun 2025 20:04:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44321993bsm232088285a.77.2025.06.27.20.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:04:37 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 78802F40066;
	Fri, 27 Jun 2025 23:04:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 27 Jun 2025 23:04:36 -0400
X-ME-Sender: <xms:xFtfaNQ5HDN4uzShRCrOpL0yntYmtrJHJMfN0km4FAysrKe-4-jfOg>
    <xme:xFtfaGwzX47PfuTePuNnee15Rc4oHguC-lrWx5G91OSk0AW6czQ2dEBxbOhbHG9u-
    FhwClcCBzulDJ2KMQ>
X-ME-Received: <xmr:xFtfaC1FrC3Ti1npqEvJhqfBKuhQcaklP2GQsJ1gzch1GoEzh2AsJV_0hQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
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
X-ME-Proxy: <xmx:xFtfaFBO30jdjyu0Er-WsXTCfahfeACGgAZ2tYNg03Har2wDKexw8A>
    <xmx:xFtfaGj8c3VgOFPRFef3vwwYG6VulR9udcCOaJg0mbPEIj2tzrInZg>
    <xmx:xFtfaJqE7pdQP9xBO0B5xi1SHErzH9GcpDm61CQLB5IEJKLf2vsF1Q>
    <xmx:xFtfaBhjRjh5SuIWojKP05EypYk5bNR2gQCk0s5-iKV69RCmpM16Qg>
    <xmx:xFtfaBSO0GVaF8v-4vci8h7gfry4xURzJJtMyJGojysyt4cuWYed70K3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 23:04:35 -0400 (EDT)
Date: Fri, 27 Jun 2025 20:04:35 -0700
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
Subject: Re: [PATCH v5 06/10] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aF9bw_FcuSTvK9IS@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <ZpemRgknqWbwYAShU6PA8VNVPU7cQv8WMNwyb9hlZzfkfXKJ_fyN8xfM2Ca75tXcE6Cv6pGHcNJgrp-p8fm6hQ==@protonmail.internalid>
 <20250618164934.19817-7-boqun.feng@gmail.com>
 <87qzz6znfu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzz6znfu.fsf@kernel.org>

On Thu, Jun 26, 2025 at 02:39:49PM +0200, Andreas Hindborg wrote:
[...]
> > +        // - For calling the atomic_add() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> 
> Typo, should be `AllowAtomic`.
> 
[...]
> > +        // SAFETY:
> > +        // - For calling the atomic_fetch_add*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> 
> Typo, should be `AllowAtomic`.
> 

Both fixed.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
