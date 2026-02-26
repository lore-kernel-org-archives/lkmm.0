Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE373876A2
	for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120761; cv=none; b=rtG81WKBhNUEk1sDOCEz0SbhTR1/ZpfWr2wVSYr2q55nqPb/nyq7C+yWuQ/1iZYql0DS0q96B2JKHygaHhsOpVywnqnKyIxwEkY85b259v1XiusuimIh2OrgnL4CtE1jMJWQPvsyitfadnVi7YSQGP+1gTjefbyL7roR7xgyn5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120761; c=relaxed/simple;
	bh=YWHQ3hb1ArwIbRQ89q9zG+CqmiOK4wPfERQK4NQHajI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aetGxp/V3zLQ8MtN9criX81dPfqT+zz3tuivarqPG1my6KJrF7GQBzaYvetqU89EAEhZugElwCvheX4jH3oTKbFYBqig7F5ViQvvTizjqWy9C7zNad8o32JLMO57Uf1RhbKgnPzcck+JigTbBYp9PyDZntY/fSS6YuxQp9/3WhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JpmypDle; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JpmypDle"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb420f7500so92521085a.2
        for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772120759; x=1772725559; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wuTxE1p/1rypYy1lij4BdYhQVDSEtiYhB76DoENLIhw=;
        b=JpmypDle7XL0Fmh3i2IOxxXyRToS84uVYNJE1RmRRWDWOAY0yuwa7BjRSAKptrXEac
         LCLSJ7wVPyVgunDTMjLq7v+F9jgBP1lk+OJqkHvljAM8P+/pxoE9V17GyZomaHlbjn34
         95aQJyT/6Kyn6PmKUOc92pOp4Cm2BnqE/MM2Oz9TTuf7QBsv/TsNVq/tt0kKVBULLQtE
         fnxVIENcEpUYKVjb6bpF7lwl/hlhXx9zPNp5nobO3A6rEmKYs5WOdqGwA5YeHTkHPBJs
         oPnsungstAe7YuTAYpqIjZ3jb8x02bw10IXkd74ZhasoZbVWkN86+7GOAAUDMU5hDDW9
         2b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120759; x=1772725559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuTxE1p/1rypYy1lij4BdYhQVDSEtiYhB76DoENLIhw=;
        b=fI9dPGyiZ9Cares/uZD6GfMGBcn1Bq5k0JiiZifC9d7Ooz3rGUrCT5B5yx2BfohqhT
         B8RsjmlXbhqMhaQOeyjwrv7w4DFuF19d2e7WMuiiYEy2/ZjuGlekjbsXxtldIoF299/n
         HGrVWL8GJOfSq2m4yDcr4wwIQkxA0n/yA1ttnAOsit8FNEgP/3EU962iuqZW0NKiLENK
         zwq2DsTMs9S0G84gIhvSkUPAHJRLwKp6ZsMhAUl4G6yGECCc75B1waA2JOfYrCRfzHU3
         pQPLOR34Dzms5LJD8zawhKRtsMPwaRD0NpsqygUmo3md0vciSqFyZ5Zixc5wsS6e8VUJ
         yfJw==
X-Forwarded-Encrypted: i=1; AJvYcCVU9n7bQVjsCVoqJSFopk/TFUFdxEMie+XgFJUm0iXn/cPs7ZXjUnm/85aDnXqA26k0CxKI@lists.linux.dev
X-Gm-Message-State: AOJu0YyRCcLlsRAALRxHrVIOK/vG4I54zyd46RifM/3AKboe2FJejqec
	ihXQl8rODsfvpreoDVkVrX4FMJuJjnVH8Lk3RlYS43dU6+MoRiOjzjoZ3JbA8MJh+w==
X-Gm-Gg: ATEYQzwjb0g/o53rLbap3nJELtGjTInGLOwYCwgnZw8T6giJNuVaIjBktrRUWADHM3d
	jgUzejsotlpjRLk6yfy3X8pAOiiMC8OpMWb3kxEAYFU8r5JAG//U5eQ8lsP16bOJpo12oxirUhv
	oXwkTCdGtmA/ytE+leo3HgOxy2fFdWPR8xRka0sPqC2DeisUAvvZtDICBZoTUg4mUww/gMf5k1r
	m0fLZRFauZcVi7XvMfTJMOwZ3pWguwszu+/mTY6Ap+2N0C/3HYFg2j6cX+/5XqGp0QRxVX1fO0i
	aYeDTCa740WOhMoeOotQ8rgUk0VTQTNUYAsVpODZsv4x8HgJtwJ9IViChdX5iXKVzpE6gJeVl6M
	SIPre/Rq3TAhqr6ItW+WxHQrWwbmvidXAry+wPG8ux5SiKPWJKbnhtR4+prpZr7aPUALiSNIiK0
	NVh8FdlJdISfnzMscnZKUI3cb4VqPrF78ToYVUc1pEcKK78xxuHgjh
X-Received: by 2002:a05:620a:1a9b:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cbbd05ff45mr585156785a.75.1772120759113;
        Thu, 26 Feb 2026 07:45:59 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf67814bsm272731985a.17.2026.02.26.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:45:58 -0800 (PST)
Date: Thu, 26 Feb 2026 10:45:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: linux-mm@kvack.org, Dmitry Vyukov <dvyukov@google.com>,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Akira Yokosawa <akiyks@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Luc Maranget <luc.maranget@inria.fr>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	David Howells <dhowells@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>, Boqun Feng <boqun@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Pedro Falcato <pfalcato@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>
Subject: Re: [BUG] Memory ordering between kmalloc() and kfree()? it's
 confusing!
Message-ID: <9dcd02b9-42da-455d-aa08-165e6ff0b921@rowland.harvard.edu>
References: <aZ_lJAqxh_hNGr_v@hyeyoo>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ_lJAqxh_hNGr_v@hyeyoo>

On Thu, Feb 26, 2026 at 03:35:08PM +0900, Harry Yoo wrote:
> Hello, SLAB, LKMM, and KCSAN folks!
> 
> I'd like to discuss slab's assumption on users regarding memory ordering.
> 
> Recently, I've been investigating an interesting slab memory ordering
> issue [3] [4] in v7.0-rc1, which made me think about memory ordering
> for slab objects.
> 
> But without answering "What does slab expect users to do for correct
> operation?", I kept getting puzzled, and my brain hurt too much :/
> I'm writing things down to stop getting confused :)
> 
> Since I have never thought about this before, my reasoning could be
> partially or entirely incorrect. If so, please kindly let me know.
> 
> # Slab's assumption: Stores to object, its metadata, or struct slab
> # must be visible to the CPU that frees the object, when it is
> # passed to kfree(). It's users' responsibility to guarantee that.
> 
> When the slab allocator allocates an object, it updates its metadata and
> struct slab fields. After allocation, the user of slab updates object's
> content. As long as the object is freed on the same CPU that it was
> allocated, kfree() can see those stores (A CPU must be able to see
> what's in its store buffer), so no problem!
> 
> However, when e.g.) the pointer to object is stored in a shared variable
> and then freed on a different CPU, things become trickier.
> 
> In this case, I think it's fair for the slab allocator to assume that:
> 
>   1) Such stores must involve _at least_ a release barrier
>      (for example, via {cmp,}xchg{,_release}, or smp_store_release())
>      to ensure preceding stores are visible to other CPUs before
>      the pointer store becomes visible, and
> 
>   2) The CPU that frees an object must invoke at least an acquire
>      barrier to ensure that stores to object content / metadata, etc.,
>      are visible to the freeing CPU when it calls kfree().
> 
> Because the slab allocator itself doesn't guarantee that such
> barriers are invoked within the allocator, it relies on users to
> do this when needed.

It doesn't?  Then how does the slab allocator guarantee that two 
different CPUs won't try to perform allocations or deallocations from 
the same slab at the same time, messing everything up?

Can you explain how this is meant to work, for those of us who don't 
know anything about the slab allocator's internal mechanism?

Alan Stern
