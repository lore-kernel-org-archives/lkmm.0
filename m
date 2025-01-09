Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7F1A8F97
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450866; cv=none; b=lsldyq8RSOrH02yABB4LMAItPdyZ5/8Zt5fk+TIojaUFBph25pDXDJ0QAUYkRWGefAapw3WYzRpiQRU/KSWmTXaiAFuYha8F6O41x1Q0JgPHkeoQF+A4Zva9ZK2xt2qwu+CkkJiujQ2t8iVhSHGxycfYyc/QEKIYVs78YRiEnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450866; c=relaxed/simple;
	bh=GjK6IYKHiRP4Ausu+sEIiLA39uS3xvcj3DzQPf+kZJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVdQHjHUipNe15eCjYDah7Tvby65jrQuG097Si/l/CH7Bdcopim0SBZkXtaPB+MZg3f9fvZ05365lAWilsQe5KzC5poR+dPjSuLir5PlPkLlToZlaO7gDI/QeBt2gebn7EjV9rUTvc++6sxe0N4CH21NIksDCUlhPjOKM8r0xbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=og/rh79B; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="og/rh79B"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6c3629816so73193285a.1
        for <lkmm@lists.linux.dev>; Thu, 09 Jan 2025 11:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736450863; x=1737055663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZszVCAvwgiiGRrXiCIvejrKfYq6zm/557ekC6cdiCE=;
        b=og/rh79BtBxT8rG4zzvLYAJ/CW/vgtK3h/wXQk6EApyb1bSBuIQodH1SSoVe8KBOJc
         VEo6izfjd/VaUG+To1VJ7kj3L+59kHEzHsgAr5FdQfaPpIv566COeBW0f1W4UuKBDR3m
         0T+EPlp3aN/tMWvh1r/8mBe6LGYipu9ODE4OOGQ7uiGDlvjYhd4yCxacfXLxudtAbZ1F
         nx6YZenwP/qToqDtNw8eYTDtQhDaN0HKI7JQAASYF0ZnjDedkgIOAxjMKOjl5JBgJugp
         ppI3UpbiuPes5m4qEd92fAGNzdyEVmfEIZtm/+wGMTx6VzG5pJhLmjX2SlmzEYTd1ehp
         lNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736450863; x=1737055663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZszVCAvwgiiGRrXiCIvejrKfYq6zm/557ekC6cdiCE=;
        b=m3QUeU5vx4FpwvptF+13kqyGvO7FdlJFo9D5zoh55oOlLbZa+e7egyDH/Iort8erY6
         0FE4t9lDGaQGyAUWVxXgEXYR2Ld8R+gipMy/CBXOWdaNNwvh6iU+CMsaWC2vNaT9amQa
         j86QWKJlfM1sbMLC3TvhIGNMz5W4lV2HWcvQtVocNp547ANRXk5as8mZ1RVp+VxFyNxe
         rb0+kqoP1q4opnzj1bGKm6C58KoZGrehuATct3BEq8oBH+j32JWDh3JB0ZCBgm7cDEo9
         6HPwknjv7HYV59cORPnEYE5KHYlwe30tIS6FfO7Yxc++Ug2Pgmh3AIWsYC7zfrW+Uax4
         aaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBc1BwpTocuMmj6V7Q5Zukw4D7zETPVQ8SwRWlGuIsQxYH3wd4RzPk7JWW/0MkzUtXofRC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0D4UN05p6TUip+LMzsUoxpAAaQ0pR1e18JRxqgDHuiGiV/7v5
	L10Fp0b3uL8WQ/pb2VF6QTeZQCc9aXXs2O+iEzvQBSvApiRoXFW+dyWK/RiVOQ==
X-Gm-Gg: ASbGncsU/0mII0U5nYFCbs0/+BevOjRLrL1ix0B3I4RMwx3Ajm03QUHrZYM/nOXq+Wh
	Uk4Op8YRtZ1/kVJzDqogWbfXQu/koFjFeVhyPTewxqSEbyRzX8+N1XS+Tz+DSns5iRa+U2nUMvd
	EXjA/iwkvc1wSN4qY5/2HEscoHgLJJY5h9kk/12OT8bpSWVU0Zav5nQ1Mg4taHzUzrZ5kmP/ya4
	fHmUfaSaK7HpjxHUlpX9ZdJ27uZbPEUoBzSYT8/JmPc/5NgckdmV4q3ecwNne58vap7l0DOtyvc
	iDc70tIAR8VU2yBxhNTPtEF8rlmNCPMQP6a8H8/fjvrt5aCVgQ==
X-Google-Smtp-Source: AGHT+IFZfM2zz0rY7OuHXCACiEgsLtsuN+76zHOgbpBKA9+l1wKjGm1DnasYoCutsrg74iNXrLNRig==
X-Received: by 2002:a05:620a:469f:b0:7b1:543d:c99 with SMTP id af79cd13be357-7bcd970aaadmr671340785a.24.1736450863478;
        Thu, 09 Jan 2025 11:27:43 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3504268sm97600585a.94.2025.01.09.11.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 11:27:42 -0800 (PST)
Date: Thu, 9 Jan 2025 14:27:39 -0500
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
Message-ID: <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>

On Thu, Jan 09, 2025 at 05:44:54PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/9/2025 um 5:17 PM schrieb Alan Stern:
> > What do you mean by "opaque code in the compiler barrier"?  The
> > compiler_barrier() instruction doesn't generate any code at all; it
> > merely directs the compiler not to carry any knowledge about values
> > stored in memory from one side of the barrier to the other.
> 
> What I mean by "opaque" is that the compiler does not analyze the code
> inside the compiler barrier, so it must treat it as a black box that could
> manipulate memory arbitrarily within the limitation that it can not guess
> the address of memory.

Okay, I see what you're getting at.  The way you express it is a little 
confusing, because in fact there is NO code inside the compiler barrier 
(although the compiler doesn't know that) -- the barrier() macro expands 
to an empty assembler instruction, along with an annotation telling the 
compiler that this instruction may affect the contents of memory in 
unknown and unpredictable ways.

> So for example, in
> 
>   int a = 1;
>   barrier();
>   a = 2;
>   //...
> 
> the compiler does not know how the code inside barrier() accesses memory,
> including volatile memory.

I would say rather that the compiler does not know that the values 
stored in memory are the same before and after the barrier().  Even the 
values of local variables whose addresses have not been exported.

> But it knows that it can not access `a`, because the address of `a` has
> never escaped before the barrier().

I don't think this is right.  barrier is (or can be) a macro, not a 
function call with its own scope.  As such, it has -- in principle -- 
the ability to export the address of a.

Question: Can the compiler assume that no other threads access a between 
the two stores, on the grounds that this would be a data race?  I'd 
guess that it can't make that assumption, but it would be nice to know 
for sure.

> So it can change this to:
> 
>   barrier();
>   int a = 2;
>   // ...
> 
> But if we let the address of `a` escape, for example with some external
> function foo(int*):
> 
>   int a;
>   foo(&a);
>   a = 1;
>   barrier();
>   a = 2;
>   // ...
> 
> Then the compiler has to assume that the code of foo and barrier might be
> something like this:
> 
> foo(p) { SPECIAL_VARIABLE = p; }
> barrier() { TURN_THE_BREAKS_ON = *SPECIAL_VARIABLE; }

I think you're giving the compiler too much credit.  The one thing the 
compiler is allowed to assume is that the code, as written, does not 
contain a data race or other undefined behavior.

> and it must make sure that the value of `a` before barrier() is 1.
> 
> That is at least my understanding.

This is the sort of question that memory-barriers.txt should answer.  
It's closely related to the question I mentioned above.

> In fact, even if `a` is unused after a=2, the compiler can only eliminate
> `a` in the former case, but in the latter case, still needs to ensure that
> the value of `a` before barrier() is 1 (but it can eliminate a=2).

And what if a were a global shared variable instead of a local one?  The 
compiler is still allowed to do weird optimizations on it, since the 
accesses aren't volatile.  The barrier() merely prevents the compiler 
from using its knowledge that a is supposed to contain 1 before the 
barrier to influence its decisions about how to optimize the code 
following the barrier.

> > That wasn't true in the C++ context of the paper Paul and I worked on.
> > Of course, C++ is not our current context here.
> 
> Yes, you are completely correct. In C++ (or pure C), where data races are
> prevented by compiler/language-builtins rather than with
> compiler-barriers/volatiles, all my assumptions break.
> 
> That is because the compiler absolutely knows that an atomic_store(&x) does
> not access any memory location other than x, so it can do a lot more
> "harmful" optimizations.
> 
> That's why I said such a language model should just exclude global OOTA by
> fiat.

One problem with doing this is that there is no widely agreed-upon 
formal definition of OOTA.  A cycle in (rwdep ; rfe) isn't the answer 
because rwdep does not encapsulate the notion of semantic dependency.

> I have to read your paper again (I think I read it a few months ago) to
> understand if the trivial OOTA would make even that vague axiom unsound
> (my intuition says that if the OOTA is never observed by influencing the
> side-effect, then forbidding OOTA makes no difference to the set of
> "observable behaviors" of a C++ program even there is a trivial OOTA, and if
> the OOTA has visible side-effects, then it is acceptable for the compiler
> not to do the "optimization" that turns it into a trivial OOTA and choose
> some other optimization instead, so we can as well forbid the compiler from
> doing it).

If an instance of OOTA is never observed, does it exist?

In the paper, I speculated that if a physical execution of a program 
matches an abstract execution containing such a non-observed OOTA cycle, 
then it also matches another abstract execution in which the cycle 
doesn't exist.  I don't know how to prove this conjecture, though.

Alan
