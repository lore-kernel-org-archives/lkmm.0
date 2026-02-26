Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A03603D1
	for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 18:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129217; cv=none; b=dTjVV6Ymv56jHWd0DXZEsJ670+JCdQImbTUYyIPxSKNbKWJ/AvBpnVbhATSB8KAUR9z5pJFF7AZqD+Da3w6RAEO0kyJ+1Xr6IT9jLkctWQCSqGzQ2y7sYL1k6jKT+pU+0kzYq8CgJB4ukT64Ha5KMxdyLxJUpGEw3LnCsWYG2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129217; c=relaxed/simple;
	bh=M3CGrm0VhU4itt4g6xjpQh7V8E2y4Aph7J+dstE5F1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NX8BOw+S0E7/rssRG9JjY3HqdxxPKUtL9XgyRwNQYMQSJViA25T2h/KUSa0WZoJc2foiHt9t9GfF9WNTJDY8uRIszKfmjcU3DO80HXyeUX8yvxOu94GzPAj7IpBNh0qKU5d7ZBboc5hj3xQxbCN/tbl3tEizDhxr+ID2/hKA/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tt9om2N/; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tt9om2N/"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-896f8feee14so15202856d6.0
        for <lkmm@lists.linux.dev>; Thu, 26 Feb 2026 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772129215; x=1772734015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UbRn1/Zoh4IIbiAkpXZr+7zJlNAh6IGPdvB7q6Yi9o=;
        b=tt9om2N/a+NNTydruA/2+jn6DPMrBp6cd0nxHPqFV/3j9fDk+FDZNoGB4LgK/FiNu4
         9k1tyOAiP6vlStYiYEqB2nnhCgdfFAl5+OTq3WCaErGyXnQsC81EttLGPTcFkewQ3Hwv
         qVMNHaxLbRzYGuJrTzp2oO0XNzlSeyrDvIqB+NpqF6ufYsnvJT6hwh23GQLlSlb7KatS
         B7wkkWQZ29J5lX2B76CBk+AgBJyLgw+kq/YETGkKOfm/HOWpOItvrKtJNgV7xWsNOrY8
         OycyptsbK1KhtzaeSflYLaPcnTpLt0F84HMie1q5O+PEqbuVLv/nG3N+4hMuIiIoK2s6
         xefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129215; x=1772734015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UbRn1/Zoh4IIbiAkpXZr+7zJlNAh6IGPdvB7q6Yi9o=;
        b=ncdddWHG+JFyMzP+4JVvkxiNWdMa+q49O6D6yobCu6pGbeuaDDl4yqGvUwL8bvASC7
         MI7IPg8ZC1w1Lq9fmqPn20744cndm/oUyY+M6eAqZ/aQufew2dBkWIyJ98dkOYshdaau
         kOw6SWf59btTuda6/Ovsm4dFt2OfkZTm2T5gYMBsm9Xz2UciA+bNcSAEDyKfszhJ75X0
         C3FJvH1G3HSTTKWsWPoQ+QZOArt3puMx30WBuw2CfI8QVnql/7AkiYUwgXZVsOn9khCT
         ihG5CT7l2GCKeTVWRW9bze2iIxNIzcBJQC65D3zMk7Fdpe+V7nkx+/ZHZNYmLMdmS5Yg
         377A==
X-Forwarded-Encrypted: i=1; AJvYcCUMIwcb3Dm5oC0+CeUh+C3lt7EvToubYHzjmDwNTkOIsKwVTs5TMVUfnpjk8BkD5jg94Gu+@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt3eYWFs8tuuEauhh0phxHIiYSBIuzn4wL74qcJyMj53a9epwh
	JBdraJO2+qPqWrMTrfILYrvlUzLxGPtTHZma6GgiVGeDvFAQ/3C/uvQqs48n48nu+Q==
X-Gm-Gg: ATEYQzzCVKvT/96vA/4u4TFMe+4V547xQUKCc7rD3Hh0KcNNpPrjZBfFGkxGMKLru51
	hih1HNiQREGzRXfCt2ebsEvJVx0fIr5BYQcB4jD78DCpILDZkMsNOhGy8Mz8UInpon6r7ROpr7H
	rU2aAuyUWH3qx4inxKkQOJUrsIum1eix3ICnTcaAiMvJ+jY+WaQL0miFE0DdDJ1uVT96zVg81N8
	h9wvlnQBJ+Xm5/cShB77080/U13UcYIP/x5lto/M9VKynx3jWoI2JF5dMaIXCGDpp/1jxGP+TJL
	MilH03v3NOz8WuOgyMsmG6QPtiExhYhjjJyoPugXnDo60RsLHS6qLQJMQcZ69WmSamJdd5WgjVs
	4B9tnMWwPTMNmO7KVdxVPEnJMdd2eWSUMUGYoE0S37UeNAnhFyHgARTzjCLC5GBb+QyBAUp43+i
	XgGsreviCzwgqEzLq8BjbDf0Otc6VOjG3LEtI/OPWqtwrjf+DCDGwidnfUrnUnt9FZv/kZWQBc/
	hKJvfNKivU7FKjBhmTh
X-Received: by 2002:a05:6214:c2e:b0:895:4b79:83a5 with SMTP id 6a1803df08f44-89979e1bb72mr293888636d6.5.1772129215103;
        Thu, 26 Feb 2026 10:06:55 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c6fe55cesm23138596d6.0.2026.02.26.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:06:54 -0800 (PST)
Date: Thu, 26 Feb 2026 13:06:51 -0500
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
Message-ID: <9240040d-598e-48bd-b802-bf91cce92d0c@rowland.harvard.edu>
References: <aZ_lJAqxh_hNGr_v@hyeyoo>
 <9dcd02b9-42da-455d-aa08-165e6ff0b921@rowland.harvard.edu>
 <aaByMLSAIJM8HdbO@hyeyoo>
 <d8308828-ed28-4650-8c8f-22a7e5cfd1a0@rowland.harvard.edu>
 <aaB-1e1LoxkcYl2f@hyeyoo>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaB-1e1LoxkcYl2f@hyeyoo>

On Fri, Feb 27, 2026 at 02:11:49AM +0900, Harry Yoo wrote:
> On Thu, Feb 26, 2026 at 11:42:02AM -0500, Alan Stern wrote:
> > On Fri, Feb 27, 2026 at 01:17:52AM +0900, Harry Yoo wrote:
> > > On Thu, Feb 26, 2026 at 10:45:55AM -0500, Alan Stern wrote:
> > > > On Thu, Feb 26, 2026 at 03:35:08PM +0900, Harry Yoo wrote:
> > > > > Because the slab allocator itself doesn't guarantee that such
> > > > > barriers are invoked within the allocator, it relies on users to
> > > > > do this when needed.
> > > > 
> > > > It doesn't?  Then how does the slab allocator guarantee that two 
> > > > different CPUs won't try to perform allocations or deallocations from 
> > > > the same slab at the same time, messing everything up?
> > > 
> > > Ah, alloc/free slowpaths do use cmpxchg128 or spinlock and
> > > don't mess things up.
> > > 
> > > But fastpath allocs/frees are served from percpu array that is protected
> > > by a local_lock. local_lock has a compiler barrier in it, but that's
> > > not enough.
> > 
> > If those things rely on a percpu array, how can one CPU possibly 
> > manipulate a resource (slab or something else) that was changed by a 
> > different CPU?
> 
> AFAICT that shouldn't happen within the slab allocator.
> 
> > The whole point of percpu data structures is that each 
> > CPU gets its own copy.
> 
> Exactly.
> 
> But I'm not talking about what happens within the allocator,
> but rather, about what slab expects to happen outside the allocator.

I understand.

> Something like this:
> 
> CPU X				CPU Y
> ptr = kmalloc();
> WRITE_ONCE(gp, ptr);
> 				if (p = READ_ONCE(gp))
> 					kfree(p);
> 
> Yes, it's a crazy thing to do. CPU Y isn't guaranteed to see
> up-to-date version of object content or metadata.
> 
> Instead, the code should do:
> 
> CPU X				CPU Y
> ptr = kmalloc();
> gp = smp_store_release(&gp, ptr);
> 
> 				if (p = smp_load_acquire(&gp))
> 					kfree(p);
> 
> One reason that I started this discussion was to argue that we should
> have a well-defined a contract between the slab allocator and its users.

Yes, you have made that quite clear.  But you're missing _my_ point.

Which is: The same mechanism that the slab allocator uses to ensure that 
CPU X and CPU Y won't step on each other's toes if they both run 
kmalloc/kfree at the same time should also be able to guarantee that the 
metadata changes made by CPU X will be visible to CPU Y if Y manipulates 
a slab that X just finished with.

To put it another way, ensuring non-interference during simultaneous 
accesses isn't all that different from ensuring coherence during 
sequential accesses.  Doing the first should easily allow doing the 
second.

And if it doesn't then something questionable is going on.

Alan Stern
