Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EC19005F
	for <lkmm@lists.linux.dev>; Mon, 28 Oct 2024 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730153480; cv=none; b=jKjqUtpUb50pQYqDUyraTV6rm5aCa61ZiuuF0eTEoH7PQ9Uz1ISYQZtlMy1MtD1Wr3yxNxPCXCRPjRmRwyl931v2jnmv4PaWnobneITyIaYFeYrwJB99sqyZNsImL1FHc9vZ20DPY+EUQ4NW5wW4xtUsqSQIBmveYrisqDgcMLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730153480; c=relaxed/simple;
	bh=YNv414Bw4PuqolanvpKCxf7xgq4otF3vXoKVWfQ0Zk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnJ/p8pPK3HlLnOBV1WSd1IdrhLgKhrMM128fHD5z1iIjTgBtcD2VIAC0LORlWvFDE0ZPQmxXg7Dq//PA6JV7Sqc275KUk/IuM564q85wNxv9O8S5JipeccsJ+EMxa0LteK9yzWWNtSKb8bVtcFiFwyCT/XoRyZG2DL3tfx1E4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdX1PwUB; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdX1PwUB"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6cbe90c7c95so36512156d6.1
        for <lkmm@lists.linux.dev>; Mon, 28 Oct 2024 15:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730153477; x=1730758277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyhLwh2+OKpbMkdci4HatF+1nSS8uoK4ET9ojs2OKAk=;
        b=kdX1PwUBkUTsCksOw0O26PZemNOo/nZD7mQAYpiXNqmBD6hVghpdpcvYexY+iY1sDJ
         VZTRy6LI4RsoMFa10diYbNUzmXAGztaZ0Z8naJlBfRbVjOKCmWXpwStgbAOtI5Psjuei
         R0fmfMvfgMN9dSYpWKZ9VblbgyEdF0yuHH6mVnGtWliDisng8shTkQywb2kKiuujDy2T
         oq8YCSwi+JLaBkwEOS3mwM5LZ5fDIv1nIdvGcLjrib1fXbdB0kEgHbEbdTYjBdHtSclI
         2+QQJjKUBQjQ5sBGnCJdTmzA8yBUvJyOHsg+hRPfgX+pWhvIghaQR4pdip/IZFdV3Vqv
         AXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153477; x=1730758277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyhLwh2+OKpbMkdci4HatF+1nSS8uoK4ET9ojs2OKAk=;
        b=fNTTPoU16sAeD+LHwIXQBcnEei85g+qZMZX3GGr51jKHmOSPusEzx0HSjnLju7fAZQ
         sP4ZkucInqaEfSDeSe2ja25ML3O2PJcqBizSr1IRCWdi4wPktEsejoB+VBkHq70Mc5Yj
         60SfKaEeLYUa2+LnxDnUFT6jWaXF++H/gUbGkEPLrr3sMcdowE+k0xyo5XUkGuuAyQcM
         bNfASUoWInKN5U2tZTnQfYIPtg8XwTQYhlSV8Jc/+dFnwbftp+HCWtllN6+NUuyf6wEP
         MvgN+3eBHVpzoQSg61X6QP1A0XQZah4xqq4HXXj2CXMX6pDPDpk4E+clRKZdh7fRXOoF
         mq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi36L79HX9OdJiloxdgg3nWSsAaA8v3a/Z4q4K3K1REtEfFuIx765eyDMfbkCT2+EiW8mN@lists.linux.dev
X-Gm-Message-State: AOJu0YwyfDdz558ZhxudTOuqohNSamRoPFnfLfBfrFhi4guaRs143/7a
	Ji3TT3V/kBWz97C3jHsUgi93ZhobTBtY6Xu4c2/b1ZnXaI0KD1sh
X-Google-Smtp-Source: AGHT+IGfnQNVeOY1T4zM0c/j+51jYKfoUhVlwgWCHYMu06THo68d5vh5WR6USv/4L8KyfR5evMnvhw==
X-Received: by 2002:a05:6214:4589:b0:6cb:4b70:8ead with SMTP id 6a1803df08f44-6d18584a41emr165401776d6.37.1730153477273;
        Mon, 28 Oct 2024 15:11:17 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2d637sm36601046d6.124.2024.10.28.15.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 15:11:16 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3685C1200069;
	Mon, 28 Oct 2024 18:11:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 28 Oct 2024 18:11:16 -0400
X-ME-Sender: <xms:BAwgZyr7N4smtMibuOuQLVTZKxxMKFvSM64-09wvCi2VOUT09e6oNA>
    <xme:BAwgZwrJK9EPwi3GMAPvFN6SW7C3dbhjJo6Y6nXWA9myavRCs3YadE9qXM1WyjRT7
    FogzMQZiCp40yDbww>
X-ME-Received: <xmr:BAwgZ3Pt216srplrgN-kayRtr7gLtr-bo3k3mDt3mVyecvnSuwvle6nEgyw>
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
X-ME-Proxy: <xmx:BAwgZx7Y4N9950UGTI3sX5FysspVKvUksBbVXlqh__YebL2_qmLECA>
    <xmx:BAwgZx690tDiaZ0C3o9lx1AkS2cK48_-jzthp1KCWt8WdzQsQ1UUEw>
    <xmx:BAwgZxgWMhxvoOZ66cn4YUSb9NJ5E3g9pVDq7kJrBbHHZw-i-M1IrA>
    <xmx:BAwgZ76J6qGEBq203FELvNMwi50Rulu2t0M3rCqlTbftc8cRpFAMBQ>
    <xmx:BAwgZ8ImdnAGXR-VxzUdxNqTitEVcSQ1kJ97I9CTYHLu6zZW-NEXGcrq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 18:11:15 -0400 (EDT)
Date: Mon, 28 Oct 2024 15:11:14 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [PATCH v4 1/5] tools/memory-model: Legitimize current use of
 tags in LKMM macros
Message-ID: <ZyAMAoqykP-EkdMS@Boquns-Mac-mini.local>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
 <20240930105710.383284-2-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930105710.383284-2-jonas.oberhauser@huaweicloud.com>

On Mon, Sep 30, 2024 at 12:57:06PM +0200, Jonas Oberhauser wrote:
> The current macros in linux-kernel.def reference instructions such as
> __xchg{mb} or __cmpxchg{acquire}, which are invalid combinations of tags
> and instructions according to the declarations in linux-kernel.bell.
> This works with current herd7 because herd7 removes these tags anyways
> and does not actually enforce validity of combinations at all.
> 
> If a future herd7 version no longer applies these hardcoded
> transformations, then all currently invalid combinations will actually
> appear on some instruction.
> 
> We therefore adjust the declarations to make the resulting combinations
> valid, by adding the 'mb tag to the set of Accesses and allowing all
> Accesses to appear on all read, write, and RMW instructions.
> 
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  tools/memory-model/linux-kernel.bell | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/memory-model/linux-kernel.bell b/tools/memory-model/linux-kernel.bell
> index ce068700939c..dba6b5b6dee0 100644
> --- a/tools/memory-model/linux-kernel.bell
> +++ b/tools/memory-model/linux-kernel.bell
> @@ -16,10 +16,11 @@
>  enum Accesses = 'once (*READ_ONCE,WRITE_ONCE*) ||
>  		'release (*smp_store_release*) ||
>  		'acquire (*smp_load_acquire*) ||
> -		'noreturn (* R of non-return RMW *)
> -instructions R[{'once,'acquire,'noreturn}]
> -instructions W[{'once,'release}]
> -instructions RMW[{'once,'acquire,'release}]
> +		'noreturn (* R of non-return RMW *) ||
> +		'mb (*xchg(),cmpxchg(),...*)
> +instructions R[Accesses]
> +instructions W[Accesses]
> +instructions RMW[Accesses]
>  
>  enum Barriers = 'wmb (*smp_wmb*) ||
>  		'rmb (*smp_rmb*) ||
> -- 
> 2.34.1
> 
> 
