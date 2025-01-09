Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887A204696
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439436; cv=none; b=uoAvQy8LYU0dzD1br1YE4LnX9NonSYZtu8WlRKu7heQj4mI7j6E5QRdr6TWc71+Ne+NGOLTPvpPi3X2f7Wn4bryjqKDWZ6CSzJ85mcGBVQ2JK+iXZBag7sU1RxcvJ3065CF1cboViizV4mYgzvdzQUjBvtX6UrJIaE+1MI5ZoSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439436; c=relaxed/simple;
	bh=EQ9lTkJj5hVITyZtb/CU7uK04iGBFGO+6cXPUdDZjAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXtRegxnIwAeOwrkvuQN8pvcJ6rwU+q9vEGjrWkhOrjg5I9fsSrCZXFjzYYaNNDRpNOJzAE4CZlbstTp4Kf2+eVHuqETn5atB/hroOw33TOV/5gii9SuteKf0zi+i12pJg/rBIOttPMTu+BPAdMjwSXYTdFEN5Sn32bzXcQud70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=g3MeZhkZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="g3MeZhkZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92cd1e811so17795266d6.1
        for <lkmm@lists.linux.dev>; Thu, 09 Jan 2025 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736439433; x=1737044233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvXzKAdEajSDj7kVBY3z63caF0WRxLoy22sGj/czuHk=;
        b=g3MeZhkZFBbE7FUTBJ/J1/3kX3BW6hSTQvyZIvrB+iaBb/x4fwbZfzX6sDp9LC04HV
         k0s6dG3QaiAypP1aHE0R7Oqt/+Xw41XccDzpPFtGUmnZTQi4Z14t4zZ1Qwa5iW3tYaFT
         n0zifmiaMqHGkIzubxg4yKJDpSihOura03O1H3n1O+7FZBQls+JYzPY5GTLeYPbL8taq
         iPXBRfGDJl/F0BH/t6bbPFfFNpxXwZNkLYD92gp5ekQS/TT3bOcAmt/C5pPFb5X6AE2w
         oCD3rAhOPD7lHc6Dkwee5qqsUy6hzR3RxdhfVanC9qpAQ5oFth9AS82Zl0VvGqSD83bR
         G+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736439433; x=1737044233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvXzKAdEajSDj7kVBY3z63caF0WRxLoy22sGj/czuHk=;
        b=v2nLEoD+HrvW8u7nOKe2YsPsxW5D2Pijf15op7OXEAla01Q5KTOpSaqsaqCMh7gA9X
         QciY0rOTTM22iTrK632s85HOk5EAMSX/EfONXsViPx9Uq1NkL43IUcf+RZrd9DKlwx/A
         H8UFWfQyyIgWdbXNV4+FaECstZMmdh9fpjo/du1LIXd+Iwxj3OJx0wQvLqg5vW/US5CU
         GPEuf2bUTT4HntMI3z1jGkUK7ihoVWNGTI0Ds7xYWvRSnPOCd/leyNal18DfkYLewDkd
         fHBmr5hUAux7cQKgbfQJvv+EpbyKviJ5GaUumeU1mS3qs/uqReCJYpR7cvEMMpKPXfmt
         xWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUO9OZYP9Ggkb9vtXC5bDXxaLk95tb8PnXAqvkQjo9PUXUl/0HOM47FilEc/r5M8s4iKoMv@lists.linux.dev
X-Gm-Message-State: AOJu0YypIAJgMiFZiuU9fyutuQtuFzS+zrTK+gJyPeeldtt+Rqt6hoTs
	Fa1y2owBXyaRJFKd06t8vaoyktPRyteVMYlMcYd2CeouYX3jSnXDV3A4trjTPg==
X-Gm-Gg: ASbGncswDmQOhxdQrU/MNTYP7egnRWXfpC0otU7MCZ85nUi/mWs2tt0Xb03us770WDE
	gYWUioIdi6wDS8z75ixWAqBd1xFKURmFrLpBjWg58K+ltuuCuOQiltazmERj+ecIKRP1oyNwSlB
	LioL3bqBilq3lFeBkYntZ5qkNVDA5SFMMNUGAgEBHa1F2umiecv5rWMsSg5QKDpE7JXMGWMazIX
	cXyq+enKh6rA8hwhsF/Bie3nBJO4h5ddQ8xKTeR6clDYrnEkiMkArbXOaTfANKQQzLCz2rImuc=
X-Google-Smtp-Source: AGHT+IHvvz+osm2cO8LQlWRP667hSU+yCQkQMj1d8ck8XeDh1CX1nmzrX3OCIPW3T2b+YuR2ht6zQg==
X-Received: by 2002:a05:6214:509e:b0:6d8:ab3c:5d7 with SMTP id 6a1803df08f44-6dfa3b2473amr56850436d6.24.1736439433388;
        Thu, 09 Jan 2025 08:17:13 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfac3e0a37sm2076676d6.89.2025.01.09.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 08:17:12 -0800 (PST)
Date: Thu, 9 Jan 2025 11:17:09 -0500
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
Message-ID: <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>

On Wed, Jan 08, 2025 at 08:22:07PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/8/2025 um 7:47 PM schrieb Alan Stern:
> > On Wed, Jan 08, 2025 at 06:33:05PM +0100, Jonas Oberhauser wrote:
> > > 
> > > 
> > > Am 1/7/2025 um 5:09 PM schrieb Alan Stern:
> > > > Is this really valid?  In the example above, if there were no other
> > > > references to a or b in the rest of the program, the compiler could
> > > > eliminate them entirely.
> > > 
> > > In the example above, this is not possible, because the address of a/b have
> > > escaped the function and are not deallocated before synchronization happens.
> > > Therefore the compiler must assume that a/b are accessed inside the compiler
> > > barrier.
> > 
> > I'm not quite sure what you mean by that, but if the compiler has access
> > to the entire program and can do a global analysis then it can recognize
> > cases where accesses that may seem to be live aren't really.
> 
> Even for trivial enough cases where the compiler has access to all the
> source, compiler barriers should be opaque to the compiler.
> 
> Since it is opaque,
> 
>   *a = 1;
>   compiler_barrier();
> 
> might as well be
> 
>   *a = 1;
>   *d = *a; // *d is in device memory
> 
> and so in my opinion the compiler needs to ensure that the value of *a right
> before the compiler barrier is 1.
> 
> Of course, only if the address of *a could be possibly legally known to the
> opaque code in the compiler barrier.

What do you mean by "opaque code in the compiler barrier"?  The 
compiler_barrier() instruction doesn't generate any code at all; it 
merely directs the compiler not to carry any knowledge about values 
stored in memory from one side of the barrier to the other.

Note that it does _not_ necessarily prevent the compiler from carrying 
knowledge that a memory location is unused from one side of the barrier 
to the other.

> > However, I admit this objection doesn't really apply to Linux kernel
> > programming.
> > 
> > > >   (Whether the result could count as OOTA is
> > > > open to question, but that's not the point.)  Is it not possible that a
> > > > compiler might find other ways to defeat your intentions?
> > > 
> > > The main point (which I already mentioned in the previous e-mail) is if the
> > > object is deallocated without synchronization (or never escapes the function
> > > in the first place).
> > > 
> > > And indeed, any such case renders the added rule unsound. It is in a sense
> > > unrelated to OOTA; cases where the load/store can be elided are never OOTA.
> > 
> > That is a matter of definition.  In our paper, Paul and I described
> > instances of OOTA in which all the accesses have been optimized away as
> > "trivial".
> 
> Yes, by OOTA I mean a rwdep;rfe cycle.
> 
> In the absence of data races, such a cycle can't be optimized away because
> it is created with volatile/compiler-barrier-protected accesses.

That wasn't true in the C++ context of the paper Paul and I worked on.  
Of course, C++ is not our current context here.

What I was trying to get at above is that compiler-barrier protection 
does not necessarily guarantee that non-volatile accesses can't be 
optimized away.  (However, it's probably safe for us to make such an 
assumption here.)

> It would look something like this:
> 
> Live = R & rng(po \ po ; [W] ; (po-loc \ w_barrier)) | W & dom(po \ ((po-loc
> \ w_barrier) ; [W] ; po))
> 
> let to-w = (overwrite & int) | (addr | rmb ; [Live])? ; rwdep ; ([Live] ;
> wmb)?
> 
> 
> > In any case, it seems that any approximation we can make to Live will be
> > subject to various sorts of errors.
> 
> Probably (this is certainly true for trying to approximate dependencies, for
> example), but what I know for certain is that the approximations of Live
> inside cat get more ugly the more precise they become. In the above
> definition of Live I have not included that the address must escape, nor
> that it must not be freed.
> 
> A non-local definition that suffices for OOTA would be so:
> 
> Live = R & rng(rfe) & dom(rwdep ; rfe) | W & dom(rfe)

I could live with this (although I would prefer to have more parentheses 
-- IMO it'smistake-prone to rely on the relative precedence of | and &).  

Especially if the to-w definition above were rewritten in a way that 
would be a little easier to parse and understand.

> It seems the ideal solution is to let Live be defined by the tools, which
> should keep up with or exceed the analysis done by state-of-art compilers.

I don't think it works that way in practice.  :-)

Alan
