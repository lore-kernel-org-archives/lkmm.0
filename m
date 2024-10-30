Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448C72746A
	for <lkmm@lists.linux.dev>; Wed, 30 Oct 2024 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298891; cv=none; b=dC4iXcn3b7Dhf/nO22tp1JaD8GR6q8VRgi5hrB40CocDnNMQnHb7Un42ExArveG/iI1qsg1d67MuZgn96Ctm/pApsH5Uvn70FuxxRAu7Zg+09EyYcOENMNBNv8lbYn2XlY//wDEcKRMmL6EG4wYA4uGUUdhak/1TW8ZJNsep3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298891; c=relaxed/simple;
	bh=Eki/8PUymi3DlYn8iy09FHeO7F5hi7LYw3hNSmdcLP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utkmuUakGWcTU6hrh7TkH3bqQiOFdIHbtyI9b9GQ2EqREWQ4NgChwK0rpQZ6d75eqJrHlFlloV75qr+acyRnI4cRGtFT9hEX53VtyJrVIV88ZDrRnZ8w14q/q4EPfwqaBlm51WS7j225SWVUVVXNgVEp8vLY9/SK55jUk9Ii3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhUjvpJb; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhUjvpJb"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b15d7b7a32so561585685a.1
        for <lkmm@lists.linux.dev>; Wed, 30 Oct 2024 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730298888; x=1730903688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tFvvK4S+XscR7M4udOgSSj/lik4hiG6acvCg0+VWJI=;
        b=UhUjvpJblxuC7IdrZA/wwpns3HwlbiyTG23+/gz8xMeur0ebSWoUJhb4cEnW/U9qF/
         iqnpACxbnKDVwNoxbYoPwEhaE0ozCwXgodHNOzM70PM0yGA+fDcGgf8VZfk/kQaP9iDA
         XxTq3G3ifjfy4dCw8k4g0VipsioVRuIDiwVE+/aWu8mvHmVJxfC3bSWHZXTM+HGCYU9u
         gnnyJwrLNT9tdMURRltD6h7OgWfKQm8P0dHfaa6jnp577GK4ZG1uHQMqaD1L4NRaw16b
         N2a5M8uyqaYk/LhehwXTpJjKC3RR9ZS7iBIBXU8OxhZoLgBDwtDZ9oCSHjDRK4C1WWA2
         uheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730298888; x=1730903688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tFvvK4S+XscR7M4udOgSSj/lik4hiG6acvCg0+VWJI=;
        b=g5lWbBtk7cllCfKgURFreYiESu/QHSzy5qpjyINH1wRYMOS5jEK0sv+MDFWJv+f4Lc
         3xVKl5BWFM3g6vnj9YeeSKbUFqTDIoQNx6TbIO9Hqva7Pi3baFlK4cPSaBJ7FjwVGzGs
         PE9zlqQJJ8CO0y8R3IMWS6y9gulxJtBr2ZA8e5fglDxI8CTLxEKimSx2pMjKnjeB/L7i
         MLBYKzpkn64IcaXgQWOJ3gdRgDY44gZNTLhl8NrZh25crl/bVpUMY3/0JR4Trfyi9tCP
         TUo3NZbsKZVkhqfj2RAmR6dNZ/L8avXsAdM/U3B4T+UTHwlfmEgdwcNBooSbYeQRHnL+
         AEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVCqrrXOE/s2zoO38BJMi+TGru/agmNOHVk3W+oX7mYKWz0k4t/0Xm5fVxB/dNlyFWM/Yi@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8/zjHrMwpNTjvb+HmkYYstnHxla/FDgmrr62qQOSWePKr1EVj
	V3iBIcqO0LxPbllypKDfZAJTU8ax1ts9XBhCrhZiOQrsyHRUnO2b
X-Google-Smtp-Source: AGHT+IG0Ti+K1kKXrP3qgmIck8+gSErpC9BXLgDSa6X9NIGc6jzs3PudVoJcoOs7EWCFRYro1j5onQ==
X-Received: by 2002:a05:620a:2482:b0:7b1:64fa:3696 with SMTP id af79cd13be357-7b193f4da53mr2158067585a.51.1730298888056;
        Wed, 30 Oct 2024 07:34:48 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d345a9fsm512998285a.103.2024.10.30.07.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 07:34:47 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 10F441200068;
	Wed, 30 Oct 2024 10:34:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 30 Oct 2024 10:34:47 -0400
X-ME-Sender: <xms:BkQiZ53SLYzteVh5JLuUEcFgxNqaUr5ucU-XxkiQLB8Wx7NmdyTY_A>
    <xme:BkQiZwHXbXHwNFEYFrbwPxgPFpBFl_oFruEnILwZLo4QEsXBxWJBtqgQ37EZurnMJ
    0qTKKH1KVAnUozQZg>
X-ME-Received: <xmr:BkQiZ57JOwWUdxZpBbmBTvOgn7wm0Cs2-cvO7-2C2zm3vcXTa3JT9tD6nlk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjohhnrghsrdhosggvrhhhrghushgvrheshh
    hurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehprghulhhmtghksehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehsthgvrhhnsehrohiflhgrnhgurdhhrghrvhgrrhgurd
    gvughupdhrtghpthhtohepphgrrhhrihdrrghnughrvggrsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrii
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepughhohifvghllhhssehrvgguhhgrthdrtghomhdprhgtph
    htthhopehjrdgrlhhglhgrvhgvsehutghlrdgrtgdruhhk
X-ME-Proxy: <xmx:BkQiZ204JBjXgjffr6FvULrOwE84rA9bptikS63c5W1bYoKH2V-S8A>
    <xmx:BkQiZ8G43Zi4wdhl6G1mB9XKzvaJmk8tAeitF3M2ukUcyndIJ8_5iA>
    <xmx:BkQiZ3-sN3tuQLBhUgtaPyPkWGIH_mNqFx_QtZBSGZSR4YkbgbuS0g>
    <xmx:BkQiZ5kdYBVr1D6kfkyRMNzOsq_uKzZhjbNVvpt05RSRf77Zi_spfw>
    <xmx:B0QiZwHdQHRH6NbsqxCDRtYQ8Eri98fYpoGe5cFw9kGA_gl8L52nCWXz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 10:34:46 -0400 (EDT)
Date: Wed, 30 Oct 2024 07:34:45 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [PATCH v4 5/5] tools/memory-model: Distinguish between syntactic
 and semantic tags
Message-ID: <ZyJEBc1qwFHwQQT2@Boquns-Mac-mini.local>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
 <20240930105710.383284-6-jonas.oberhauser@huaweicloud.com>
 <ZyApMteRMxZbpBta@Boquns-Mac-mini.local>
 <cd97e045-dfa4-4ffe-9df0-f7abeec848e7@paulmck-laptop>
 <3b796ef4-735a-44df-a9b1-671df49fd44e@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b796ef4-735a-44df-a9b1-671df49fd44e@huaweicloud.com>

On Wed, Oct 30, 2024 at 12:38:26PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 10/30/2024 um 12:41 AM schrieb Paul E. McKenney:
> > On Mon, Oct 28, 2024 at 05:15:46PM -0700, Boqun Feng wrote:
> > > On Mon, Sep 30, 2024 at 12:57:10PM +0200, Jonas Oberhauser wrote:
> > > > Not all tags that are always there syntactically also provide semantic
> > > > membership in the corresponding set. For example, an 'acquire tag on a
> > > 
> > > Maybe:
> > > 
> > > Not all annotated accesses provide the same semantic as their syntactic
> > > tags...
> > > 
> > > ?
> > 
> > Jonas, are you OK with this change?  If so, I can apply it on my next
> > rebase.
> > 
> 
> I'm ok with an extra s after semantics and a minor rephrase:
> 
> Not all annotated accesses provide the semantics their syntactic
> tags would imply
> 
> 
> What do you think @Boqun ?
> 

Yes, of course! This looks good to me.

Regards,
Boqun

> 
>   jonas
> 
