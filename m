Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7931B87DF
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736630393; cv=none; b=Ie4DyqSUYoIsCjkbhdN2qKs6qjO7MrgF1nzreVC2VMlWfTHiqc3T/lHCifBn0CxGPyFX0VI3YihKnppHrlKjhoQupCXcuKIldwdvJElQZWkeCOrxMIqssEUmTPay5gCpPazzg32X/BywUmK+c+lXMTEuhaKvEIhiEtT6iaIe//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736630393; c=relaxed/simple;
	bh=KcuDpk3Z9A3vgLlLh0L2TqbDGDTdhB0zEeL8fwrgVJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRRmvWxTkJeq7Rxtg9+m1AsYcSsXpPe7oNMR6tlJOhC7JhXv7NgyEhXfn8XzURIP+DQvxJtBfMF+omo2DoJnwppHYlMWFcgWQWVbKTrfKlePKEeqvtTknAO1637RTSrX4VVxJ4fz0WYWgFTYabi7jBA3ZpikvpPj5cSRm3syo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kxzJ6X9L; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kxzJ6X9L"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8e773ad77so22183706d6.2
        for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 13:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736630390; x=1737235190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iSwM7cy5fCRTLAre0zqw644PYr4tJNzKgyq62Kipe5g=;
        b=kxzJ6X9L1qFE5VhwU8rLmT+LYGJvt7HB2hmsMOvcDVBbM2C8FbFhUUoDRe0L5Z/4gC
         9o+K4ImgmM7aqFmJ0uNqSmhHQ0VJdxN7GxkE+9HXzJCgJHg3r1ppGOqGD3GC745Gq2fl
         mCPM1msuaZdrrmy5e4m8Wsu1I3aa5CG7RPHCkQFTmS3lmyjqFTDdVp1ua8rCa3GkhWk6
         aW3PJ59Sfzq1Whazp6nBzwdl1HiYIdMNR4+OgHOq/zaMcyKWptEENuLE1RJSGSkXh7U7
         PRYATRm19AsBCPiw8cKQH2TTgnI9QnGzlLmi/9mb47+XJtGAvMv6GbGJdXk/5OYIjtzT
         QTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736630390; x=1737235190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSwM7cy5fCRTLAre0zqw644PYr4tJNzKgyq62Kipe5g=;
        b=PAPw5FZHGlPAHFmu8OrkyVHsM2R5zVugflT7Qqbln1T7i3oeDTXeWZ+D8E2/KBjlqL
         A2j1s2LmTr2F8pSTJVrz7K49NrSqMzThi01kVZLBH/xa0R0WWo9dVgso/atjS4Hqo2Vr
         ubury19JyZxOHRzZVLhKp6md4mhRhEbd0ZOTE16wOQWBgPiTMZpSN2XZvBn/0/GVvidR
         j8J//CiLgH1PYmgWDcq27tyAUSqPAEX9SdhS8aMmB+xnmdS2ik/Cc8dizwURPhy840PG
         79945mI9s3/P7xYTsg94/BM5IyoH4ropypEBRGSZToWVcULJJDICUbA0y23Lx+nI5gSW
         AoGg==
X-Forwarded-Encrypted: i=1; AJvYcCUNv8ZDN0EqQtWtqCADw2swbFqs53yID/lyVLjzLsWYDpHVSXIaZ0luqYkvfHGGwTDaP47X@lists.linux.dev
X-Gm-Message-State: AOJu0YwElOXwhW15tOGObG5X2D0q4VMYuacidDfrTDAwyOuP2w4yiVbe
	X7/6LMWca2CWRBuuQN78ENWipOhipTTTmuPabSld4FqbQT239r8l80y+cWSu1w==
X-Gm-Gg: ASbGncuFENuZXXdrWSjzkjY50+6K/uG6W9EhLqntriyTViHdqw/J4a+D69z+LVgyqWp
	EaIIxSHSSPSnyLv1ccE4EgjajvfAWtTRDlHRN011MA1eXeUXetxlMNxOxu+bFQGU9FglYgOlJeN
	ooPldCNWPFeXDQ/zQXZd0xuCeqwTz92EqjGOsHewvWJ1886H0C4slNZeKyfSLaMbrwiS2x2jY+c
	j1umekJroYDt3NIpJJlHEjmGMzqDL6Dt2U3RYKgMYHWr2FgT9klG8ZQvA==
X-Google-Smtp-Source: AGHT+IEIkvL1esfdeRVIWmA8g8KcRWw56Rt8/5bu/7rh7pc+1YTYPI4aEO9+yHCaW7Au4TyZROG+og==
X-Received: by 2002:a05:6214:242f:b0:6d8:a5da:3aba with SMTP id 6a1803df08f44-6df9b221686mr263373646d6.20.1736630390558;
        Sat, 11 Jan 2025 13:19:50 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5bb3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade89395sm23394166d6.98.2025.01.11.13.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 13:19:49 -0800 (PST)
Date: Sat, 11 Jan 2025 16:19:45 -0500
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
Message-ID: <44749eab-90b0-489d-a409-c6a5cc7b8e04@rowland.harvard.edu>
References: <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
 <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
 <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
 <838f7a51-c0f5-4a19-8407-6591426fd4a8@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <838f7a51-c0f5-4a19-8407-6591426fd4a8@huaweicloud.com>

On Sat, Jan 11, 2025 at 01:46:21PM +0100, Jonas Oberhauser wrote:
> What I want is to change the interpretation of ctrl,data,addr in LKMM from
> saying "it is intended to be a syntactic dependency, which causes LKMM to be
> inaccurate" to "it is intended to be a semantic dependency, but because
> there is no formal defn. and tooling we *use* syntactic dependencies, which
> causes the current implementations to be inaccurate", without formally
> defining what a semantic dependency is.

I guess you could take that point of view.  We have never tried to make 
it explicit.

> E.g., in "A WARNING", I would change
> -------------
> The protections provided by READ_ONCE(), WRITE_ONCE(), and others are
> not perfect; and under some circumstances it is possible for the
> compiler to undermine the memory model.
> -------------
> into something like
> -------------
> The current tooling around LKMM does not model semantic dependencies, and
> instead uses syntactic dependencies to specify the protections provided by
> READ_ONCE(), WRITE_ONCE(), and others. The compiler can undermine these
> syntactic dependencies under some circumstances.
> As a consequence, the tooling may write checks that LKMM and the compiler
> can not cash.
> -------------
> 
> etc.

I doubt the ordinary reader would appreciate the difference.

How would you feel about changing the existing text this way instead?

	... it is possible for the compiler to undermine the memory
	model (because the LKMM and the software tools associated with 
	it do not understand the somewhat vague concept of "semantic 
	dependency" -- see below).

> This is under my assumption that if we had let's say gcc's "semantic
> dependencies" or an under-approximation of it (by that I mean allow less
> things to be dependent than gcc can see), that these cases would be
> resolved, in the sense that gcc can not undermine [R & Marked] ; gcc-dep
> where gcc-dep is the dependencies detected by gcc.

That seems circular.  Basically, you're saying the gcc will not break 
any dependencies that gcc classifies as not-breakable!

> But I would be interested to see any cases where this assumption is not
> true.
> 
> 
> Note that this still results in a fully formal definition of LKMM, because
> just like now, addr,ctrl,and data are simply uninterpreted relations. We
> don't need to formalize their meaning at that level.

> > > > Perhaps so.  LKMM does include other features which the compiler can
> > > > defeat if the programmer isn't sufficiently careful.
> > > 
> > > How many of these are due to herd7's limitations vs. in the cat file?
> > 
> > Important limitations are present in both.
> 
> I am genuinely asking. Do we have a list of the limitations?
> Maybe it would be good to collect it in the "A WARNING" section of
> explanation.txt if it doesn't exist elsewhere.

There are a few listed already at various spots in explanation.txt -- 
search for "undermine".  And yes, many or most of these limitations do 
arise from LKMM's failure to recognize when a dependency isn't semantic.  
Maybe some are also related to undefined behavior, which LKMM is not 
aware of.

There is one other weakness I know of, however -- something totally 
different.  It's an instance in which the formal model in the .cat file 
fails to capture the intent of the informal operational model.

As I recall, it goes like this: The operational model asserts that an 
A-cumulative fence (like a release fence) on a CPU ensures ordering for 
all stores that propagate to that CPU before the fence is executed.  But 
the .cat code says only that this ordering applies to stores which the 
CPU reads from before the fence is executed.  I believe you can make up 
litmus tests where you can prove that a store must have propagated to 
the CPU before an A-cumulative fence occurs, even though the CPU doesn't 
read from that store; for such examples the LKMM may accept executions 
that shouldn't be allowed.

There may even be an instance of this somewhere in the various litmus 
test archives; I don't remember.

> > An execution of the corresponding machine code would then be compatible
> > with an abstract execution of the source code in which both r0 and r1
> > get set to 42 (OOTA).  But it would also be compatible with an abstract
> > execution in which both r0 and r1 are 0, so it doesn't make sense to say
> > that the hardware execution is, or might be, an instance of OOTA.
> 
> Yes, but this does not require the definition you expressed before. This is
> already not observable according to the definition that there is no read R
> from an OOTA-cycle store, where some observable side effect semantically
> depends on R.

Yes.  This was not meant to be an exact analogy.  It was merely an 
observation of a concept closely related to something you said.

> What I was trying to say is that your definition is almost a
> no-true-scotsman (sorry Paul) definition:

(I would use the term "tautology" -- although I don't believe it was a 
tautology in its original context, which referred specifically to cases 
where the compiler had removed all the accesses in an OOTA cycle.)

>  every program with an OOTA
> execution where you could potentially not find an "equivalent" execution
> without OOTA, is simply labeled a "no-true-unobserved OOTA".
> 
> > > But it does make the proof of your claim totally trivial. If there is no
> > > other OOTA-free execution with the same observable behavior, then it is
> > > proof that the OOTA happened, so the OOTA was observed.
> > > So by contraposition any non-observed OOTA has an OOTA-free execution with
> > > the same observable behavior.
> > > 
> > > The sense in which I would define observed is more along the lines of "there
> > > is an observable side effect (such as store to volatile location) which has
> > > a semantic dependency on a load that reads from one of the stores in the
> > > OOTA cycle".

Agreed.  But maybe this indicates that your sense is too weak a 
criterion, that an indirect observation should count just as much as a 
direct one.

Alan
