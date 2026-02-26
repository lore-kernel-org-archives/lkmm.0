Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E91332634
	for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124127; cv=none; b=nzDjGqXxOiuFmLBL1lmHcZe8FKf4n3m7OnyYaeYm2UXTWtNEeeRPusGGqcVGcDju1+5FGnZgh0V4Gn2CWQYQ5YfAKZGtHZf9YLC3WLWFlKnFPLfwNL/4wq9kmRz/HswWqvKDcceE+9/lOEZmlf0vhInXkoR0QEhHOzq6Ua/8ViQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124127; c=relaxed/simple;
	bh=Sz2h/B59VzM/elbQ5KRgcEfNz0dQLT3qJ4J437bHqGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2d2FU4tNhBI6aFVhCBlE/U1nDr87BYkWZgYOkIfIzz/wFZefYayKCK2PurAmZbQL302YtpwuTvxzFYCoupobJCle4kswdSrAr08F7bhIxcwg0nOskpKs242Cpg6Ul2w+MwS1enJkE/q+KN3iFK0MoQ4hK/jtnxuZAM+Sitjit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PJYwZznP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PJYwZznP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb3bae8d3eso91514185a.1
        for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772124125; x=1772728925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25OvDP+ctZOpce7ovpdW5sTLVF7qvDLK1eZyECLnIqg=;
        b=PJYwZznPZdhyyDlxts8jUR7j/1PHU1j2h+mqnQjq2HDUjiiqJGT8nzy6K+/ulKQFyu
         JY4UGs4jyNGM3ZVY5D++CsFY7cj74sLDZTPPQCyG8qR+kkaEVZjyw5Laqu9GvLA70wcI
         HW207rmBSUbYflU2ctWtKKfbsNqxwZJOXFWi3cg9CyxIklA+o8/z/uKZCUVDKlrN0hNJ
         qNT1ZMcCcVYANhE1QljKqX+oKB2+Dy7c/rWlJIE8f46JD5A5fc6cXvPTZtpW9rsvMSJ4
         poae5gfWS4cXKkAt6WDsM4wLyYIkhIRGH/lMPqCWLdveUILpWG7kNlHcePPtNKRaKefR
         +t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772124125; x=1772728925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25OvDP+ctZOpce7ovpdW5sTLVF7qvDLK1eZyECLnIqg=;
        b=F72IEjryZzgN4ANDPs+Lg58iwIu9+GR5HLdg/aqGX1A3RwvO0O2BLm6jKXiRXiSKJ1
         OVqOmysuyKgmvBBksfS3eNiUGCHCNlRfF16IhAh/8sqBG13u52rI6qZ5h9NqShBMakXK
         6TMei2Nb7tSEV633hVXa/bLK8v88TagmGxnYeeYDxBW74QjZBN91p9b3FkPzkejcqJrA
         2DYLDU5Mhh9HDSttMmKsTQWwzigwNNqK+VTrLVPpgielFuWjiXrLLpk8+/64AltU9+5c
         orIh0j3Rzr0XqhoAIOHrEslK5SwOxo3RqWreXIAFTbcOoRDc6yYZuuQDdEItVPwAtne3
         fIuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6FHqeF3JUTn1V9I4DpEszAZ31ThrZYrtynhqLL34L6ktTlFSZZns3BUtimwBaVwRzFfP1@lists.linux.dev
X-Gm-Message-State: AOJu0YxSJ5c4IMq7Jy6wm1LHBXThmW3UoiVVdEEXPCWGP0umHDcxTK9J
	2MU6SzNo98PNZFaaavnAIouBW9nbCOZQn5uoDb8r8oSU3HFoGlvxjzEsnw0BgYxpyQ==
X-Gm-Gg: ATEYQzzrl07Va788VgoQK0Kj0vB0v6cptAkppxuvLbAxcI9o1Z4oEJj7276E94ITAo4
	YFyvS0GUfqr3U/KofnjGj7K6JCUdLhL8nlT3aALCwoE2rqF0BW8ekxFXW1gv95d9uELHm7ssNrt
	QziQqe5KaIcuzKjj+jrGqstE4OcryHFtTohyXPtXwS3Bw/5+Pv9V4syKzFLnkndUgFAGFt1kHbX
	Rr8VKFomhJxpGcYRMqGnod5gKzJ51wJaI8y8r3x6xuGAk1fcs4DdraAut5yGxekZIu6CeiiU2JN
	uZGEh48jJQzC+oo2GgvYXBkI3mV64t5g6ETX01rlEwqg7aj0Sh0wpTYt7meVPS8NpiYYEcP6TLd
	HMDPwMrNnpWKZL+yp65t/n3fdS3XiHvcvJXS+hSpu1QZM/5//A3/fzJJqqxDfvQ4+jYXQ7HCQXy
	LrB6qL3d9FJgJM9oee15zqQi4qZHxRfVwr7GWWXtbLPUUPy1XzPS6+vJHjfHp+1yBEYWVerWOt/
	UMt+E12fDXGoxT7Z6vz
X-Received: by 2002:a05:620a:4542:b0:8cb:4c29:66b3 with SMTP id af79cd13be357-8cb8c9cdf25mr2260008985a.15.1772124124932;
        Thu, 26 Feb 2026 08:42:04 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716e09csm22299906d6.19.2026.02.26.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:42:04 -0800 (PST)
Date: Thu, 26 Feb 2026 11:42:02 -0500
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
Message-ID: <d8308828-ed28-4650-8c8f-22a7e5cfd1a0@rowland.harvard.edu>
References: <aZ_lJAqxh_hNGr_v@hyeyoo>
 <9dcd02b9-42da-455d-aa08-165e6ff0b921@rowland.harvard.edu>
 <aaByMLSAIJM8HdbO@hyeyoo>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaByMLSAIJM8HdbO@hyeyoo>

On Fri, Feb 27, 2026 at 01:17:52AM +0900, Harry Yoo wrote:
> On Thu, Feb 26, 2026 at 10:45:55AM -0500, Alan Stern wrote:
> > On Thu, Feb 26, 2026 at 03:35:08PM +0900, Harry Yoo wrote:
> > > Because the slab allocator itself doesn't guarantee that such
> > > barriers are invoked within the allocator, it relies on users to
> > > do this when needed.
> > 
> > It doesn't?  Then how does the slab allocator guarantee that two 
> > different CPUs won't try to perform allocations or deallocations from 
> > the same slab at the same time, messing everything up?
> 
> Ah, alloc/free slowpaths do use cmpxchg128 or spinlock and
> don't mess things up.
> 
> But fastpath allocs/frees are served from percpu array that is protected
> by a local_lock. local_lock has a compiler barrier in it, but that's
> not enough.

If those things rely on a percpu array, how can one CPU possibly 
manipulate a resource (slab or something else) that was changed by a 
different CPU?  The whole point of percpu data structures is that each 
CPU gets its own copy.

Alan Stern
