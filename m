Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A91209F38
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863953; cv=none; b=tQ7oGduvV4G3FGXIJpcEVwOVGgHT+dk7U2vvEcWRgcr8BWNPO+SZ91C1YsW8JGlTy/pjs+o6D8jBRmTetSvUXJuS4UwNJuzY5EvLi0rfvApKa11sqmJlxLxvIZF+PYLchiCpwK0lpN5EJWdj6yT8KvKKcXvii8ktB/FxO3R8vwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863953; c=relaxed/simple;
	bh=l5nird3PVMjr8OkJr+e7IHDK6msydbxihukDb/k8U0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfTKORBleYZ+yg3fYpe1XUcgk1VG76HqV9KmuQoR2XrvbdbsXMkz1bak02XRzP4+BVEm3QCCGzAnUrVR1zJKl3jVXAuyXtAOpJL7ulW/RmjRNJTOEORdRFdvizr/UtvSyt/J5pPYyHP308atUsGqhDP36mPqgTYdtpx6Iw9PuaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGEx8VC2; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGEx8VC2"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0976776dcso760787585a.2
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750863951; x=1751468751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLxNZ2nfHdzqYuGH8fuWWbBZX9lmP9zWUSihpsHjHn8=;
        b=RGEx8VC2Vl00OKM1/35IToin7cSIKXRJXHhqABaQY8m1TXzpoR4ZL+3lQysA0GMDkj
         ZpD/TG2qaR0dxPA6QFhp8NYTFg/NcjTweRb0PHiWSu67Ibi6Pg1MSLP32iVyPQ0jALgS
         PoHNdespsfGulWLy/9/G9psRqF/YU2pFiYAc+pXBqgDp5sjtaY7qrSfrnKK1tjPCnEih
         lOoMJS4xECZJxxCeU/YxENM4lwUtC9/dUrn4XJkMpqXVJQ5mxZk17/wBoKyo+JXRw8be
         O0zhu9XbRPR4pfrk3rULXYkl0br6TW0UrT4hmCpQl+bIZ64plkJI4rhPjnoPdZwfCGur
         7QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863951; x=1751468751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLxNZ2nfHdzqYuGH8fuWWbBZX9lmP9zWUSihpsHjHn8=;
        b=SoJmU+EihQwCRQxU1GIarGgf5aG7ej1TWGMC5wX2BNnJDCURnz9ZI9ajZKZE4h1q6M
         fonTjq6GB+qnIHiuJcLT9YUctlSI2PoHiYaW3e6269WEWEseyWknKcOr6q6L8+Eae0a6
         D6zPaCIcD8nZBfKfsZ9ZapirRc7FjhvW1bGMHm24UOoDsuMQXdAGApd8NK5MQ3gDYkcd
         c+iIoHGIj8TwgVxFKq48+gF9jprFPm4OnbXcdTA2Y0ze07zaiHXV0yW/1A+UCHyuEQgC
         pteJOgw3AEzSzNlWEOKOaWeTsntTsDKk6jXBRjlz9h4uKMF4EhlRx2BT5H9GZU8wI0Fh
         oRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQYYvZgOvTFafPi1u0l7T7Zio1+Fm1aSmx9LFj5l6oidAa5iePFMHK1iVlxb1oIycGo9qp@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1BML1VWSyk2BrWmMsMik6+NaovprJsOem3L5WP6rOKazdFQ+n
	F8Oua5gxwa0mKnQSr/kFuZTvhwMzuSJdgHBJmJ04AJxz66JUfqhoI7gv
X-Gm-Gg: ASbGnct08LdU0QhiSeXvs1lXkZDaYhv9CUo79R1J59GnDvUB5n0VUh2fsMJO8OxtsKY
	7QLoYhAbBeB/aWtp0jq9Qq3TLtoxn8rCUDe1Nb1i+uHzusPbrBRWSQjOPtYXaNpWMmSwtJXJeCu
	j+dkPBEctt+PCXKGCphskV7F/qETPXKxIbv4sXNFJNQaX/hF+l1Plz64oJqbC8yhUcbgd/ucFMx
	aH7YZSjP6gJ0BKPLQiRgJzMz29CDiEkNeExE48mRiuJ9cd4nKsZwal+QSEgawiY8d58/ykFix0N
	ZeBpBny1C6El+S4a22dR2qKeGXNnEfOFpLpSCLO+BW2r9xrXCvpNzzYvc6Au0n6P9Goy4ODbuiz
	lPVme4qCa6dmkhJ4tFCKKeaIGU8yajvhHD3xBxyhlsTi50RonKH9I
X-Google-Smtp-Source: AGHT+IFdz1ZJDNBl9FpRjIaT86z6/EovaIOb64kf6xyyuNuZOIkf+JVRuQzNIU1aW33VTHbLIA6Z+A==
X-Received: by 2002:a0c:f094:0:20b0:6fd:7297:2559 with SMTP id 6a1803df08f44-6fd72972603mr14952046d6.17.1750863950754;
        Wed, 25 Jun 2025 08:05:50 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd74e3266bsm553516d6.53.2025.06.25.08.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:05:50 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 76F22F40066;
	Wed, 25 Jun 2025 11:05:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 25 Jun 2025 11:05:49 -0400
X-ME-Sender: <xms:TRBcaN9ZCL7uxn4N9ZSzV4Lqwi4hxqVyUFqsxRp1MFszhNhiagY3Ig>
    <xme:TRBcaBu61u1IQTaJg07QPnRqXGYpnD31VJzoLZIgWq1jJAjRSB_g_bVZUyPSmJ1bV
    F7LpIbuKPLp0Uwn6Q>
X-ME-Received: <xmr:TRBcaLDX5SEzsqsRxfnPyNcN1VQ_7640b26ou4SdFWbrWn9bjdp34i8nTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnheptddtudegueevgefhgfeuffetffeuheekgedtffefhefhjeffhffgfeeggeetgefh
    necuffhomhgrihhnpegvfhhfihgtihhoshdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghthhhivghurdguvg
    hsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhn
    uhigrdguvghvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtg
    homhdprhgtphhtthhopegurghvvgesshhtghholhgrsghsrdhnvght
X-ME-Proxy: <xmx:TRBcaBdiyKmSKN6yAsWQbHtK7PNQ8pkLpKdcumGnpWtLqi8Q-qBSeg>
    <xmx:TRBcaCMy6u3UWL2myLBVB-wVwUgHu_oy8pAN0Y3soombcrtAb0LfNw>
    <xmx:TRBcaDln7cjIRHYvXtP9l6Yd38-RyNWbdOJGABi7z78r-sPHZHmNZw>
    <xmx:TRBcaMu6--A2BLrRrytFLQZzC7h1QhMl16s2oXHkyj8QonV5HcT6xg>
    <xmx:TRBcaEu31TpZ6gt7pf_E8pt1WBmper8QRMzjW8P7H52Jfw_C9JE7O4Tj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 11:05:48 -0400 (EDT)
Date: Wed, 25 Jun 2025 08:05:48 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Breno Leitao <leitao@debian.org>,
	aeh@meta.com, netdev@vger.kernel.org, edumazet@google.com,
	jhs@mojatatu.com, kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 1/8] Introduce simple hazard pointers
Message-ID: <aFwQTO-_t-P5rLUp@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-2-boqun.feng@gmail.com>
 <3e2a80e6-b3c5-44dd-b290-1d140cc427ff@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e2a80e6-b3c5-44dd-b290-1d140cc427ff@efficios.com>

On Wed, Jun 25, 2025 at 10:25:23AM -0400, Mathieu Desnoyers wrote:
> On 2025-06-24 23:10, Boqun Feng wrote:
> [...]
> > +
> > +static inline void shazptr_clear(struct shazptr_guard guard)
> > +{
> > +	/* Only clear the slot when the outermost guard is released */
> > +	if (likely(!guard.use_wildcard))
> > +		smp_store_release(guard.slot, NULL); /* Pair with ACQUIRE at synchronize_shazptr() */
> 
> How is the wildcard ever cleared ?
> 

The outermost shazptr_guard will have .use_wildcard being false, so it
will clear the wildcard. E.g.

	g1 = shazptr_acqure(a); // g1->use_wildcard is false
				// this cpu's hazptr slot is 'a'.
	g2 = shazptr_acqure(b); // g2->use_wildcard is true
				// this cpu's hazptr slot becomes
				// WILDCARD.

	shazptr_clear(g2);	// do nothing
	shazptr_clear(g1);	// clear this cpu's hazptr slot to NULL.

Regards,
Boqun

> Thanks,
> 
> Mathieu
> 
> 
> -- 
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
