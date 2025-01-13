Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277F1C5F39
	for <lkmm@lists.linux.dev>; Mon, 13 Jan 2025 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736797387; cv=none; b=Gr3qaxcFxCua9XfsnvkGH1gZ6PEv26xVXumKrhFJ1KjWgcukJs6mF3y6UzLKjTL/Ps1DC+9lvg7opnZEPgpXNKCX2MwI1OqpM1O6BtKupTYnciRdJBk0EtGobvrk4jhXzZErNPbDWHJwIpehF8OEYpzJOSdjyLr8W6jyAZRd26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736797387; c=relaxed/simple;
	bh=Yefa01fTPSFbKpTlH1HMmQyKobV9FIpFf1pEBi6WsQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P62h/l9951udbc0cVrICblPVETGpjItg7quDflbxkyNjJSW/600AsERhIts+Sfd4abplGgYiZgUDppbq3620e8D1Q80lmPhiHKO/sdY+OUyy7bR0JmYGoq65aCmh4dd7P1SNKxgT0Cy6BrX3ksBsyjm6eKXxvPuCOxGGlSqirdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=huZeLvzP; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="huZeLvzP"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6f7d7e128so510772085a.1
        for <lkmm@lists.linux.dev>; Mon, 13 Jan 2025 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736797384; x=1737402184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxle0qn2LunxhQfJrGoHu3/Wy8mhOyXkj7YKagl7HtY=;
        b=huZeLvzPz/jmltaKvV//NCaeeOGThF69mFAj3Haz1pYAWUghZALDilK+VZPcvPz3W+
         RzSlOpOWcpDmu9AtXRzzgnErFoBA94979ji6DYDpjVnZ/uxLZpgAn9K7xKM36MWlMZWH
         cc34znGU8J40JdQRayf6s0KrNgIZtqxJxpP75Mb0ksnGS7Mwlp4TTGvf48BWwBb1KtCd
         PrjwQVYpguv47ZDPxS27kfF9tU+gxTZFjeuxtKQnTAEw04T/Vg5AUDUwAu0NcHAhe/G3
         azZmN0lKI4HWr75E5hPDEUPAn19yq1927QCoj50s/jWj31VX7PcH2UR7KrsuDoHtjzlT
         pHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736797384; x=1737402184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yxle0qn2LunxhQfJrGoHu3/Wy8mhOyXkj7YKagl7HtY=;
        b=RO9NrrvyE9hS7jR7LTAH3689+1QKAmwQVy3+3PC73sPdn72mOyAG4I6qMzfq8+B0hN
         81iFWORzcSyWSFoTU8rsGk3Lj0jR+U+nP7vvLlxQ6+AKSw5V1JZFbZk7iaDYGZT5dVFR
         gNfwsjq9Fz5wWtel/SnRAjyQ3uNr1NmtYyW1kTTaIUfm25jOhTGqAPU+BI5Kt9mVQVYD
         WzKGaGM9tvPPtH3B1DlNkDPUs0evyvksT8BY+LEo93ZJDzeF5CZvgcw8UNMXN34gtz4R
         PoiDGQ8XBTdJzggNaOG870VM5s95zGFmSYGKnMEBDoeOEmRUN2AMb17NiAvGM8ISNpeM
         cyKg==
X-Forwarded-Encrypted: i=1; AJvYcCX3DeNINM+tMFZmKxeJYL/Wj6m+VIzhO1M6zBRpq1QKyQJqNPoTwMnDCj0JLRW/979Qi2fa@lists.linux.dev
X-Gm-Message-State: AOJu0YyHSB38BMT2MvnQJ4gb1l8BIqSy5froMjnlGbpKTOiqCDSe13+T
	T3pl48m6OFNKzyu/Urvr9R0R8WBtNEeOv/yj/NnMkXrvHQIk08ViL4V+ZnLRdQ==
X-Gm-Gg: ASbGncvyE5YVUYkPlbcVW8FPg1KmgY/nw1kKWsidCmUTqT1DJDLINYVI5HgrqeVvT88
	8lfDS7W/H3qQAiGdWXFygB39QcYz/3mK8KQ31MrtDDVQjQrh9eKevL/c4aDruJDk+Jkj8SbKx6C
	pp6r+do7FKse2z++DkcLfzdrOadGRzw/XDUtWLUXec2qQLloK9lww5zUh+IzESA+x+u3NCHFQSo
	y/WyaTepikKqpVf9bg5RAc3FVpkJcXkif7UZNOIKNsk1dxnsiDpNYFrAfjodb3OwWGvGUgjWk63
	KUqBXK2Kz5Aw1dHOVQ9yhOSl7+v2I2x67Wf6AUUpJqY1pk5BzA==
X-Google-Smtp-Source: AGHT+IHvidcrARw2037HqCB/8kmQwEUKgJJ2qBUrHutCHOk1Nk7AtxJlbcC+4ArLIeLbdyWU6gMhIw==
X-Received: by 2002:a05:620a:40cc:b0:7b6:d799:1f83 with SMTP id af79cd13be357-7bcf364324cmr1638919685a.3.1736797384442;
        Mon, 13 Jan 2025 11:43:04 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce351604bsm522368685a.111.2025.01.13.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:43:03 -0800 (PST)
Date: Mon, 13 Jan 2025 14:43:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <22c28114-145d-4968-a346-75abbc058b84@rowland.harvard.edu>
References: <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
 <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
 <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
 <838f7a51-c0f5-4a19-8407-6591426fd4a8@huaweicloud.com>
 <44749eab-90b0-489d-a409-c6a5cc7b8e04@rowland.harvard.edu>
 <0b1a9379-000d-4924-a930-dde5daaf1dd8@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b1a9379-000d-4924-a930-dde5daaf1dd8@huaweicloud.com>

On Sun, Jan 12, 2025 at 04:55:07PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/11/2025 um 10:19 PM schrieb Alan Stern:
> > On Sat, Jan 11, 2025 at 01:46:21PM +0100, Jonas Oberhauser wrote:
> >>
> > > This is under my assumption that if we had let's say gcc's "semantic
> > > dependencies" or an under-approximation of it (by that I mean allow less
> > > things to be dependent than gcc can see), that these cases would be
> > > resolved, in the sense that gcc can not undermine [R & Marked] ; gcc-dep
> > > where gcc-dep is the dependencies detected by gcc.
> > 
> > That seems circular.  Basically, you're saying the gcc will not break
> > any dependencies that gcc classifies as not-breakable!
> 
> Maybe my formulation is not exactly what I meant to express.
> I am thinking of examples like this,
> 
>  r1 = READ_ONCE(*x);
>  *b = r1;
> 
> ~~>
> 
>  r1 = READ_ONCE(*x);
>  if (*b != r1) {
>    *b = r1;
>  }
> 
> Here there is clearly a dependency to a store, but gcc might turn it into an
> independent load (in case *b == r1).
> 
> Just because gcc admits that there is a dependency, does not necessarily
> mean that it will not still undermine the ordering "bestowed upon" that
> dependency by a memory model in some creative way.

Yes; that's why the LKMM considers only ordering involving marked 
accesses, unless absolutely necessary.

> The cases that I could think of all still worked for very specific
> architecture-specific reasons (e.g., x86 has CMOV but all loads provide
> acquire-ordering, and arm does not have flag-conditional str, etc.)
> 
> Or perhaps there is no dependency in case *b == r1. I am not sure.
> 
> Another thought that pops up here is that when I last worked on formalizing
> dependencies, I could not define dependencies as being between one load and
> one store, a dependency might be between a set of loads and one store. I
> would have to look up the exact reason, but I think it was because sometimes
> you need to change more than one value to influence the result, e.g., a && b
> where both a and b are 0 - just changing one will not make a difference.

Paul and I mentioned exactly this issue in our C++ presentation.  It's 
in the paper; I had to reformulate the definition of OOTA to take it 
into account.

> All of these complications make me wonder whether even a relational notion
> of semantic dependency is good enough.

For handling OOTA, probably not.

> > > I am genuinely asking. Do we have a list of the limitations?
> > > Maybe it would be good to collect it in the "A WARNING" section of
> > > explanation.txt if it doesn't exist elsewhere.
> > 
> > There are a few listed already at various spots in explanation.txt --
> > search for "undermine".  And yes, many or most of these limitations do
> > arise from LKMM's failure to recognize when a dependency isn't semantic.
> > Maybe some are also related to undefined behavior, which LKMM is not
> > aware of.
> 
> Thanks. Another point mentioned in that document is the total order of po,
> whereas C has a more relaxed notion of sequenced-before; this could even
> affect volatile accesses, e.g. in f(READ_ONCE(*a), g()). where g() calls an
> rmb and then READ_ONCE(*b), and it is not clear whether there should be a
> ppo from reading *a to *b in some executions or not.

Hah, yes.  Of course, this isn't a problem for the litmus tests that 
herd7 will accept, because herd7 doesn't understand user-defined 
functions.

Even so, we can run across odd things like this:

	r1 = READ_ONCE(*x);
	if (r1)
		smp_mb();
	WRITE_ONCE(*y, 1);

Here the WRITE_ONCE has to be ordered after the READ_ONCE, even when *x 
is 0, although the memory model isn't aware of that fact.

> For now I am mostly worried about cases where LKMM promises too much, rather
> than too little. The latter case arises naturally as a trade-off between
> complexity of the model, algorithmic complexity, and what guarantees are
> actually needed from the model by real code.

Agreed, promising too much is a worse problem than promising too little.

> By the way, I am currently investigating a formulation of LKMM where there
> is a separate "propagation order" per thread, prop-order[t], which relates
> `a` to `b` events iff `a` is "observed" to propagate to t before `b`.

I guess this would depend on what you mean by "observed".  Are there any 
useful cases of this where b isn't executed by t?  All I can think of is 
that when the right sort of memory barrier separates a from b, then for 
all t, a propagates to t before b does -- and this does not depend on t.

> Observation can also include co and fr, not just rf, which might be
> sufficient to cover those cases. I have a hand-written proof sketch that an
> order ORD induced by prop-order[t], xb, and some other orders is acyclic,
> and a Coq proof that executing an operational model in any linearization of
> ORD is permitted (e.g., does not propagate a store before it is executed, or
> in violation of co) and has the same rf as the axiomatic execution.
> 
> So if the proof sketch works out, this might indicate that with such a
> per-thread propagation order, one can eliminate those cases.
> 
> But to make the definition work, I had to make xb use prop-order[t] instead
> of prop in some cases, and the definitions of xb and prop-order[t] are
> mutually recursive, so it's not a very digestible definition.

These mutually recursive definitions are the bane of memory models.  In 
fact, that's what drove Will Deacon to impose other-multicopy atomicity 
on the ARM64 memory model -- doing so allowed him to avoid mutual 
recursion.

> I think there are two relevant claims here:
> 1) compilers do not introduce "observed OOTA"
> 2) For every execution graph with not-observed OOTA, there is another
> execution with the same observable side effects that does not have OOTA.
> 
> While it may be much easier to prove 2) with a more relaxed notion of
> observed OOTA, 1) sounds much harder. How does the compiler know that there
> is no indirect way to observe the OOTA?
> 
> E.g., in the LKMM example, ignoring the compiler barriers, it might be
> possible for a compiler to deduce that the plain accesses are never used and
> delete them, resulting in an OOTA that is observed under the more relaxed
> setting, violating claim 1).

A main point of the paper Paul and I wrote for the C++ working group was 
that the _only_ way OOTA can occur in real-world programs is if all the 
accesses have been removed by the compiler (assuming the compiler obeys 
some minimal restrictions).

We did not consider the issue of whether such instances of OOTA could be 
considered to be "observed".  As I understand it, they would not satisfy 
your proposed notion of "observed".

Alan
