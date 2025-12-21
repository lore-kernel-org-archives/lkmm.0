Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E2327B34C
	for <lkmm@lists.linux.dev>; Sun, 21 Dec 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766311156; cv=none; b=fqMRkw+xAB3kz3FdyADfOFO6YWHN4fXikki2wjUHmkDwjP6bMEkhURTa96CRDFjK/79IOpMLxrbMYc4ff0JW5OL0G26yy4Y6dOC+MsXCMlAvwS+oo2m2rfhIIlQNAUWozy9WKc1gP3mnlnoYS1CszgxRtyYvDv8u5ZMU7AuFEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766311156; c=relaxed/simple;
	bh=xwKCdQhBtY7sdy8Zz446mEtEqk90qmGnWtG0zOgftIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSSmJSntO5PIRHVQrHOQy9ToxsGPRMyFwi5sWkU8jhVTju3rE6rc5HfQGEao1FhWzeaYhoM2K1UHLTHGcJDyAevc/f6VwtA4GL4HTbMrxwgVJkKt9mpUrgC570y3kLraFab1TsvWQ93xRlEzNYo9rgmnBqUA5QBd4Giyf+15tSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBLsM3Tw; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBLsM3Tw"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4f4c89f8cc6so2807041cf.1
        for <lkmm@lists.linux.dev>; Sun, 21 Dec 2025 01:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766311153; x=1766915953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjHwQCJ+WLLRT0TZamL7R6ZEjyOxsMVMPGjCn4Gr/2c=;
        b=iBLsM3TwxaXYsSTLHYatfmzOyFcHQII1oUT8RFxhs+YNfLIjI92fE9xWJ7Wapcy+oA
         amJJYAblkBz+2AdEKQa77EhUGW2EgeWNUIp43BIsoZ8S31UW+sJB8MS9KabttcWmK7N/
         SNXF5KDIycysub6f9HaqCuIkmFtw+wirTTyYnh/78WBZ0PKQVStchaQ3mGrNSkIlmvVs
         Gf+e0JolfybIgkRJf5xhhctBWmYpvvaLeiH3XAUeKLEOnqsqnMTxJsQ1XMG4UfCF2aoU
         /R6dfZoeIqQnVb80xrnV0lohRoWKmIPgw1oOQkILb2eOeWGcqUSPGik4vxwc8iuX7BHQ
         fYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766311153; x=1766915953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fjHwQCJ+WLLRT0TZamL7R6ZEjyOxsMVMPGjCn4Gr/2c=;
        b=iDY91DWZPHkrxgc8uQMn4iob3vIpBtLZ/8nRktK568em5JpvroVYS2lhLeXdjHMFCH
         T61X+iq5yXrDdaSXnH2oo/dD5JDTdKeP4C3cWJGDvySqSYyZj7dsaY4mnaKgc2ptINLs
         a/e9ALUpMk5ERCzow/qi1bxVTS7LT2J+BV0WHvSIZJUtJOc8zCzE8w5ojDa2Nc3kqPXe
         BDX3T5vlhf86JjQAYjGKSTMKY+srB7BKZOeW0K9xFTs2EKAAOsBeuLoIi0KaqvkERwQn
         t3+5TD8BEqHqlG+vI6JlISeEm5ykUWjb10saRDNWx6WkxiAF4gN2y5TDpZj2UiaogtRZ
         6F8w==
X-Forwarded-Encrypted: i=1; AJvYcCUW2bA/a8IEWsBK345rdYQlG0RCMMRgGYzROx5EoQ7PwHITyZ/4CvSdYIxbsre9yAfm+reS@lists.linux.dev
X-Gm-Message-State: AOJu0YzjPLqkMioqpoaM6cszCg5jyUVTiBQXr0m5fja4eJ+fY523Ff4l
	1Xk48YP2V6V40gIBbbb6sZgOlw4TIQHXKUSQYINBYhZmH+H1yNnUrGgK
X-Gm-Gg: AY/fxX4IWgulUklyvZsKZoR4tNmgvoBZI6NIZ/jYMdCBzqgum9bkE0+hAKl9yPmlqVp
	qqaFykrbUvPG0P7MiTQFuKnsis5Cp5FjV2nXtVHfaL4TEuEvLHUnw+5xqvid578ezHsKyvUIS5u
	rIYAHZSU3FZXKXbNdXKtCMCTmlUherdqumiuqq6QSyzvg27PiLTFJwSGXmKzG4el3Wd4yp3tzk7
	QK/i+3zeWSiPbIXOtU67oJrODUdIuenWK0x9LHxtXGeva8GNgCUbjjkAgenkUm18545uPohqh0o
	VnP3+uvuX6Rw/uQ6QwN/kbnEdy5+dqv0/AbWvOAKUx81TBoba2qRupew1DKPcn8BcHCEPtoJMLK
	r0sIF2xkyoXflf0TrWyhs+Dg9wpMBIVsCeFhk0OSaFCiPtzEZ2e5QUxkKo9GNoF5YasAmea0XVl
	jxhCibkxj1p874ar4DavYIOmMHjZJcA2uOvr5E3JnK2wJODswgERjJI4mkFOSAIjye4x8ocrl3C
	oWFlePZxKyoTl0=
X-Google-Smtp-Source: AGHT+IGkZ7YmQ4iCIVP39dS3Dspfdfd6jXXAiK+b4cBzlfzo3Zgdyb/boYNxk+mCnLQREZ4Jn+Teag==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr113519801cf.50.1766311152615;
        Sun, 21 Dec 2025 01:59:12 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64e43asm54346251cf.26.2025.12.21.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:59:12 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06446F40068;
	Sun, 21 Dec 2025 04:59:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 21 Dec 2025 04:59:11 -0500
X-ME-Sender: <xms:7sRHaR2N2v5QV0zS7rTjGaMTxsDxXqevcMfxDYvckKrndiHr9nNznw>
    <xme:7sRHabBBkyoml_p8QsCSVUISTOCodrotwwrFVf2B7-gdeQo-11qe60ozt8uJk-u0T
    HNU-gARi0H5n7K7phSZiFSuAiofuMLm0OKicd7-IEHjM0akskKMcw>
X-ME-Received: <xmr:7sRHaaFsv_hcs8DZVZClK1YuwwoTNd4iBxKqdxkoSNNA8ZJmsbqidfjit9pE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehfeejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeefvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepjhhovghlrghgnhgvlhhfsehnvhhiughirgdrtghomhdprhgtphhtthhopehmrg
    hthhhivghurdguvghsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthho
    pehjohgvlhesjhhovghlfhgvrhhnrghnuggvshdrohhrghdprhgtphhtthhopehprghulh
    hmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghp
    thhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpth
    htohepsghighgvrghshieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:7sRHadqKf0RTS3nOePlAQvUozbdkH1E35MAQvZyfuG_bq4zKpklFew>
    <xmx:7sRHaS1Y2epauX9OBV-y9l-R-Zk5Fbd6FmY3INiJFgdckMvEcL9nFg>
    <xmx:7sRHaRAPbAze_26JzP05OzQKeAn06Zg5nMbyWgmetanI2Ftb88lQ_w>
    <xmx:7sRHad_m279CbYEdXqv4sqfsQSdM2Z_3F2PEOvAtMVxacM33U0ReiQ>
    <xmx:78RHafNWcaktLFSnepHDt1H0rFJluyVrCqzHdfbKcufE0b2QeG9VpLXk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Dec 2025 04:59:09 -0500 (EST)
Date: Sun, 21 Dec 2025 18:59:07 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,	linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>,	Peter Zijlstra <peterz@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,	John Stultz <jstultz@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,	Mateusz Guzik <mjguzik@gmail.com>,
 rcu@vger.kernel.org,	linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [RFC PATCH v4 3/4] hazptr: Implement Hazard Pointers
Message-ID: <aUfE61t5cITwolX7@tardis-2.local>
References: <20251218014531.3793471-4-mathieu.desnoyers@efficios.com>
 <aUO9KRaP0FXpm_l9@tardis-2.local>
 <fcbc99d0-b7c7-45f7-9cf8-f5d3bfad966e@efficios.com>
 <aURihbmjsKi8m7MO@tardis-2.local>
 <42607ed5-f543-41bd-94da-aa0ee7ec71cd@efficios.com>
 <aUSbhiMgluudbVEG@tardis-2.local>
 <edbe45b3-0f85-48d2-8d4f-784781a8dee5@efficios.com>
 <6353feeb-c2ab-4ff6-9ea6-04ae5102641d@nvidia.com>
 <6b27f3c3-47f7-402f-aa6c-b564e3db1d6a@efficios.com>
 <38d05c17-c28e-4ec1-be30-e77fd7015b5a@nvidia.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38d05c17-c28e-4ec1-be30-e77fd7015b5a@nvidia.com>

On Fri, Dec 19, 2025 at 05:39:00PM -0500, Joel Fernandes wrote:
> 
> 
> On 12/19/2025 5:19 PM, Mathieu Desnoyers wrote:
> > On 2025-12-19 10:42, Joel Fernandes wrote:
> >>
> >> IMHO the overflow case is "special" and should not happen often, otherwise
> >> things are "bad" anyway. I am not sure if this kind of complexity will be worth
> >> it unless we know HP forward-progress is a real problem. Also, since HP acquire
> >> will be short lived, are we that likely to not get past a temporary shortage of
> >> slots?
> > 
> > Given that we have context switch integration which moves the active
> > per-cpu slots to the overflow list, I can see that even not-so-special
> > users which get preempted or block regularly with active per-cpu slots
> > could theoretically end up preventing HP scan progress.
> 
> Yeah, I see. That's the 'problem' with the preemption design of this patchset.
> You always have to move it in and out of overflow list on preemption even when
> there is no overflow AFAICS. My idea (which has its own issues) does not require
> that on preemption.
> 
> > Providing HP scan progress guarantees is IMO an important aspect to
> > consider if we want to ensure the implementation does not cause subtle
> > HP scan stall when its amount of use will scale up.
> 
> Sure. But if you didn't have to deal with a list in the 'normal' case (not over
> saturated slots case), then it wouldn't be that big a deal.
> 

With PREEPT_HAZPTR, the overflow list will be used if a task gets
preempted while using hazptrs, without PREEPT_HAZPTR, the overflow list
will be used if there are more than 8 slots used on the CPU (most likely
due to task being preempted with a hazptr slot being used). Therefore,
if this hazptr design it to have a few users and we want to support that
preemptible hazard pointer read-side section, soon or later we need to
resolve this scanning racing with readers (in context switches) on
overflow list issue.

Surely we don't need to have something perfect in day 1, but planning a
bit ahead won't hurt ;-)

Regards,
Boqun

> >> Perhaps the forward-progress problem should be rephrased to the following?: If a
> >> reader hit an overflow slot, it should probably be able to get a non-overflow
> >> slot soon, even if hazard pointer slots are over-subscribed.
> > 
> > Those are two distinct forward progress guarantees, and I think both are
> > important:
> > 
> > * Forward progress of HP readers,
> > * Forward progress of HP scan.
> 
[..]
