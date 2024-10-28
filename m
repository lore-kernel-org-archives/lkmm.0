Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897BA1CF5CA
	for <lkmm@lists.linux.dev>; Mon, 28 Oct 2024 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730153541; cv=none; b=V0/lB2YYFi+lxohs9K61bk3/kz60ZMFL9ZOvim0Oq1g0WjPSiTusTVuspRUkZGmKh4oc5szU6q4XFNNQaJMOLYUMAY4lwPzeMtXELuM8LbTY9qyaPdcNy/GyDRBeQk1b7ZUuoGXNFaa3qqLP16CAlvRLSq5w3d/JBJlhJDOpIIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730153541; c=relaxed/simple;
	bh=Deckwbul0mNRoMYoz5PO+I7SromwfImJLO6IpTtZkJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9UZJlKdLS0se1pEkjOlZ5QHfJcWD3a0wMh4b6d6wCamgyB5ZsZY7DlHXaNHO8YQf3p8dqkuvy/VgaCjYxEHGP8gWuHA7psBf95ezRxxV08GoZrig3xB3IiSX1xeiosS+26mUyHzHitJP63I1S9ULLK6Li07nH/FanP4kVUudKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQQowygE; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQQowygE"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cd7a2ed34bso30789826d6.2
        for <lkmm@lists.linux.dev>; Mon, 28 Oct 2024 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730153538; x=1730758338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrwERy/ViyqkNBMQGynBTkAP86AjfxK5sTdbvTvjomw=;
        b=LQQowygEW+fBcgOuvZuyIRokrP66ny+F7vyBYrzrqY/IdxaX79U23s8qTSQ077cpiC
         swfH1kgH47BjzMj33qROMJzqq7/UzYGQGKUF9C8admzUtw108HWy/pc212eOrv91XBYg
         jRAt6Ma2frrdIfBkzUeLDd5Zau6u9baaI1JED4CewR6KZz/QP7tnTxFYzIHfoFbWpF6/
         77GN6g4/UfFL3X6rCuP2uGpK/bTPCWCX0fDXeLgafZqteZ1EXhYpum4YaBJw97yTx2A7
         PTkloYR2pBY39cYAfv6e3igGxIebWGHuuRJZUsf4XKsyT/M+A0EFGzm+gjOJkX5hpmvh
         0ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153538; x=1730758338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrwERy/ViyqkNBMQGynBTkAP86AjfxK5sTdbvTvjomw=;
        b=o01LdUn9FGPf9tHgtTb9qUsE3f+O6vXVBQWp87x6OTg6sNPUrZjQuzt+IU2WVllTQ3
         qEDS0qSn/a1iJcrqqsxKmg/7Exmt7lkyemNBL/09HRmqpUmA2/bERg0yYLmgYha6jCYO
         qSwpfLzDhyEQjye5U066HJqUqq0C4ZX24dhnqsgAwryN0yEaxoBy+u9xuGPSZOT8AUXk
         tR5g43RnycSZduqNs+I/tyl7M/oBNrNN7z0lfQqouBi0gbhkRkQzELCmvioi4Hug41cA
         1EPgkxNZ0GV/SeO6LMVORJtPm4MlmF8uVdWdvARW4HSuIfM2pnccxNr+ZrSO69VCkY6x
         rt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr3122tpw6xGylb/Syh25v4rRJPBQglRHTFFCUO3hrYkOeAvjvKT47w9GDzRh/HfVGFE5V@lists.linux.dev
X-Gm-Message-State: AOJu0YzTwnjQNHqZBjaU80X+113I/bEn7hrWRjJuvVVMgrrCMqis3e8j
	KNsI1oAWvTxXvfGTXAHGhd+35FPjbeHVwwS6o+z6kRM47sEw+aim
X-Google-Smtp-Source: AGHT+IHVka5oZGk/1RTkaxKllBiRPoSuUUbzH8qKQDL5wOEd/2QDaRCCgO8MWt2dt2IzJshBO4pvCA==
X-Received: by 2002:a05:6214:5f0a:b0:6cc:41cb:4c6c with SMTP id 6a1803df08f44-6d1858738c8mr151790276d6.48.1730153538408;
        Mon, 28 Oct 2024 15:12:18 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2d637sm36608956d6.124.2024.10.28.15.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:12:18 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 759721200043;
	Mon, 28 Oct 2024 18:12:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 28 Oct 2024 18:12:17 -0400
X-ME-Sender: <xms:QQwgZ5bWmre-VWxgT2hdQA47MmE-s6KwmRoLxCj-bJVshht24G9TKg>
    <xme:QQwgZwY-9nd6euvSHELj3cqbaSSsYLlp_pCJesJm8XnWOX_8egp22Z3VP3Mam5ZwY
    zp6r9geWbasgAxsgQ>
X-ME-Received: <xmr:QQwgZ78keqhYitGDsksfUVhgSsvvp89FUygFVOUpgotC5ZS0PqdGoAyKcd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvtddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhonhgrshdrohgsvghrhhgruhhsvghrse
    hhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrug
    drvgguuhdprhgtphhtthhopehprghrrhhirdgrnhgurhgvrgesghhmrghilhdrtghomhdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghi
    lhdrtghomhdprhgtphhtthhopeguhhhofigvlhhlshesrhgvughhrghtrdgtohhmpdhrtg
    hpthhtohepjhdrrghlghhlrghvvgesuhgtlhdrrggtrdhukh
X-ME-Proxy: <xmx:QQwgZ3qr_D-0e11PmKzMZ4-mTeU1KivXGDf72xCiIZtT3PtYIhWTnw>
    <xmx:QQwgZ0pjYF0pDGh0ZLu7KCpr-zBmYN-mec7TRBp6-R57Ccku5kF7XA>
    <xmx:QQwgZ9ReXZA03815vz2GmRVwXvxsZzmpdbJX0F805hvUMgB-0pz8Dg>
    <xmx:QQwgZ8ppARG-7LsSSQHlKxKLF6qMqTshj4hNdEF7CMlhV39v1xcSrQ>
    <xmx:QQwgZ95Tjj1F5i6tC2uOtlOCsYDkhcwkES7Zkce2JGwjRSCwq-c4LJ4y>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 18:12:16 -0400 (EDT)
Date: Mon, 28 Oct 2024 15:12:16 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [PATCH v4 2/5] tools/memory-model: Define applicable tags on
 operation in tools/...
Message-ID: <ZyAMQIgyWojstuk6@Boquns-Mac-mini.local>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
 <20240930105710.383284-3-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930105710.383284-3-jonas.oberhauser@huaweicloud.com>

On Mon, Sep 30, 2024 at 12:57:07PM +0200, Jonas Oberhauser wrote:
> Herd7 transforms reads, writes, and read-modify-writes by eliminating
> 'acquire tags from writes, 'release tags from reads, and 'acquire,
> 'release, and 'mb tags from failed read-modify-writes. We emulate this
> behavior by redefining Acquire, Release, and Mb sets in linux-kernel.bell
> to explicitly exclude those combinations.
> 
> Herd7 furthermore adds 'noreturn tag to certain reads. Currently herd7
> does not allow specifying the 'noreturn tag manually, but such manual
> declaration (e.g., through a syntax __atomic_op{noreturn}) would add
> invalid 'noreturn tags to writes; in preparation, we already also exclude
> this combination.
> 
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  tools/memory-model/linux-kernel.bell | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/memory-model/linux-kernel.bell b/tools/memory-model/linux-kernel.bell
> index dba6b5b6dee0..7c9ae48b9437 100644
> --- a/tools/memory-model/linux-kernel.bell
> +++ b/tools/memory-model/linux-kernel.bell
> @@ -36,6 +36,17 @@ enum Barriers = 'wmb (*smp_wmb*) ||
>  		'after-srcu-read-unlock (*smp_mb__after_srcu_read_unlock*)
>  instructions F[Barriers]
>  
> +
> +(*
> + * Filter out syntactic annotations that do not provide the corresponding
> + * semantic ordering, such as Acquire on a store or Mb on a failed RMW.
> + *)
> +let FailedRMW = RMW \ (domain(rmw) | range(rmw))
> +let Acquire = Acquire \ W \ FailedRMW
> +let Release = Release \ R \ FailedRMW
> +let Mb = Mb \ FailedRMW
> +let Noreturn = Noreturn \ W
> +
>  (* SRCU *)
>  enum SRCU = 'srcu-lock || 'srcu-unlock || 'sync-srcu
>  instructions SRCU[SRCU]
> -- 
> 2.34.1
> 
