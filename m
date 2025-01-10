Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DE1A4F1F
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 03:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736478785; cv=none; b=ns3AWQoeZv3JI8o65Wi8C86g+iBHj/6L8r20qFx1YK8bBirqyOvmyi/4vrG+qmYiya+RXP8kvu8KEUM0LxELF0pO5euW/jCCMzV/xHcPJ6QxwD2Ix+P3JmfaTs2L5rDsTn55ZrUuB1fJZfQRb2vdONpPb6LzOCscc5BGFJH0pZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736478785; c=relaxed/simple;
	bh=UdZNFeYAVT8NcitTYIB3uSy8vyaYtBBhUhA11U0kCAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3C3Tl4E5Q04am3QiVxFYEU7ouYAdZKc/YYzNztwHH5XM7xU3t4xASOYuq+40e62wlPX7um2/1VS2+F5aXr/znSjq2S4HThFWKZpIHtdt62DVrWrQJBD0xh4HiC82D5HHs4bBH+1+EWSJO2Xk3Gb5eKu+nLl5sVc9UmzhFdJiII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dp0OLRD5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dp0OLRD5"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6e9586b82so123503085a.1
        for <lkmm@lists.linux.dev>; Thu, 09 Jan 2025 19:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736478782; x=1737083582; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMkbP48Q98E6iFTlbm3SZ7sj8tMJ4h0oV0EAQoaTECc=;
        b=dp0OLRD5imlp4+FuTQIKGqoQxj/hvqdNJlMERtBtecd4mzkBaXTCEIlkRU+bshALOd
         3wlJWVNdQa/YeRnmd8bdGx/zLXznbikq6+JLYL8/y0BobaGkS+gB+beNMT8skzRs914c
         ilkvJB0gjCxfZoTNxMCHuxR5jQQQdpuWbfjPI3ijaviWjNTCphvwj8VMjXFi5IoQDDU1
         hwdXEeXgjJ6y7xeEH5Kvv3Cg3iihEvGd/M0qU7DUnekxCno9bR337nXS1hDQRDsEqRjQ
         crDU5EwcY13ohYJ6Q/ifaRFkGEbmrK18NxgwGrQ3wCMEtQwlPMHamGXrtZn4DclS1JEC
         jDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736478782; x=1737083582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMkbP48Q98E6iFTlbm3SZ7sj8tMJ4h0oV0EAQoaTECc=;
        b=NXuPh5Fm8aEf03IdmKPJE5j5qZ8FAKjX/iIXLWOAcDY8MIJcudjLRfzYnmcoNqdo4u
         lg/pUlqewTZmABUsKbL6hamcD069GB3dQ6U5Kw5PPdMxrfhwdxUSchdj2IwqOuh0IlGo
         4mcoY5uQMXs5e6f6hw9K3Khl3XWVMTN5xiv3dCfsoibvKImekj/fzT30MBNwZ0Zyef1O
         u1YwTBvL1qbL9yVWMG+bRq8CRAHrvyVAHXl/M+FeaoH7iCx1sazywClGZBz5VCNAg2lH
         FaY2iWPNua8+jmmQJqYothR5KP+NfBnePzr7kJNTTfIyZKCLvHwN+Z8ki83ZB4VyfZdg
         LLpw==
X-Forwarded-Encrypted: i=1; AJvYcCWwbIX8TDeCLOO5K05vK2/215yhiUzX1/Cd2KRcdB3KPhtGmnMmSYeoI+fKoeGGpMH6589P@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6wrI69Qd02hXda0euwM/Dz9vuykfWm3UN9hRILrXf5M8VSUOg
	xbKl1zgatg6ng87X32UwNT33Rfb4aVhGRyHdy9WEa3Jd2v93eZ7QOG1vRxul2g==
X-Gm-Gg: ASbGncuFYb59gN6KW0ivs0HyvFm3e6XEWtIxDO1Pq4yi+D2R9jNozOsEsx415JWLDC2
	lpX0MoGa/MJL4WUqM6Tar33svy1Dzwr4quvSv6nF8v0TqKDjRu97mfe9anF4FY9JGrGKJRmRXWB
	IKTHW/Al8I0GZOZ5WAeq9Y8qfdkhnGT9paXId3QPZ0i8IdDaJS2IKJJSrw1ZvosyfV8i5PmQ1p6
	GE6H2/ckJ5tNokuh4YOWAqMWF4G3yRkPmbvX8QjNwO3uPrJiW1hg/RCKQ==
X-Google-Smtp-Source: AGHT+IEGb68i56DqA/ivOTnlm7VrsQNxcJKtZ18DDjoCrECBACcv2VL6jYvKXlVjKy67o1uKRbbNHA==
X-Received: by 2002:a05:620a:7201:b0:7b9:bac0:513f with SMTP id af79cd13be357-7bcd9709561mr1185037285a.22.1736478782554;
        Thu, 09 Jan 2025 19:13:02 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::bde5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c873216e6sm5071731cf.2.2025.01.09.19.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 19:13:01 -0800 (PST)
Date: Thu, 9 Jan 2025 22:12:57 -0500
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
Message-ID: <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>

On Thu, Jan 09, 2025 at 09:09:00PM +0100, Jonas Oberhauser wrote:

> > > So for example, in
> > > 
> > >    int a = 1;
> > >    barrier();
> > >    a = 2;
> > >    //...
> > > 
> > > the compiler does not know how the code inside barrier() accesses memory,
> > > including volatile memory.
> > 
> > I would say rather that the compiler does not know that the values
> > stored in memory are the same before and after the barrier().
> >
> > Even the
> > values of local variables whose addresses have not been exported.
> 
> No, this is not true. I used to think so too until a short while ago.
> 
> But if you look at the output of gcc -o3 you will see that it does happily
> remove `a` in this function.

Isn't that consistent with what I said?

> > > But it knows that it can not access `a`, because the address of `a` has
> > > never escaped before the barrier().
> > 
> > I don't think this is right.  barrier is (or can be) a macro, not a
> > function call with its own scope.  As such, it has -- in principle --
> > the ability to export the address of a.
> 
> See above. Please test it for yourself, but for your convenience here is the
> code

Oh, I believe that gcc does what you say.  I'm just not sure your 
explanation is entirely accurate.

> If you wanted to avoid this, you would need to expose the address of `a` to
> the asm block using one of its clobber arguments (but I'm not familiar with
> the syntax to produce a working example on the spot).
> 
> > 
> > Question: Can the compiler assume that no other threads access a between
> > the two stores, on the grounds that this would be a data race?  I'd
> > guess that it can't make that assumption, but it would be nice to know
> > for sure.
> 
> It can not make the assumption if &a has escaped. In that case, barrier()
> could be so:
> 
> barrier(){
>   store_release(OTHER_THREAD_PLEASE_MODIFY,&a);
> 
>   while (! load_acquire(OTHER_THREAD_IS_DONE));
> }
> 
> with another thread doing
> 
>   while (! load_acquire(OTHER_THREAD_PLEASE_MODIFY)) yield();
>   *OTHER_THREAD_PLEASE_MODIFY ++;
>   store_release(OTHER_THREAD_IS_DONE, 1);

Bear in mind that there's a difference between what a compiler _can do_ 
and what gcc _currently does_.

> > I think you're giving the compiler too much credit.  The one thing the
> > compiler is allowed to assume is that the code, as written, does not
> > contain a data race or other undefined behavior.
> 
> Apologies, the way I used "assume" is misleading.
> I should have said that the compiler has to ensure that even if the code of
> foo() and barrier() were so, that the behavior of the code it generates is
> the same (w.r.t. observable side effects) as if the program were executed by
> the abstract machine. Or I should have said that it can *not* assume that
> the functions are *not* as defined above.
> 
> Which means that TURN_THE_BREAKS_ON would need to be assigned 1.
> The only way the compiler can achieve that guarantee (while treating barrier
> as a black box) is to make sure that the value of `a` before barrier() is 1.

Who says the compiler has to treat barrier() as a black box?  As far as 
I know, gcc makes no such guarantee.

> > > That's why I said such a language model should just exclude global OOTA by
> > > fiat.
> > 
> > One problem with doing this is that there is no widely agreed-upon
> > formal definition of OOTA.  A cycle in (rwdep ; rfe) isn't the answer
> > because rwdep does not encapsulate the notion of semantic dependency.
> 
> rwdep does not encapsulate any specific notion.
> It is herd7 which decides which dependency edges to add to the graphs it
> generates.

Sorry, that's what I meant: rwdep plus the decisions that herd7 makes 
about which edges are dependencies.

> If herd7 would generate edges for semantic dependencies instead of for its
> version of syntactic dependencies, then rwdep is the answer.

That statement is meaningless (or at least, impossible to implement) 
because there is no widely agreed-upon formal definition for semantic 
dependency.

> Given that we can not define dep inside the cat model, one may as well
> define it as rwdep;rfe with the intended meaning of the dependencies being
> the semantic ones; then it is an inaccuracy of herd7 that it does not
> provide the proper dependencies.

Perhaps so.  LKMM does include other features which the compiler can 
defeat if the programmer isn't sufficiently careful.  Still, I suspect 
that changing the memory model solely with the goal of eliminating OOTA 
may not be a good idea.

> Anyways LKMM should not care about syntactic dependencies, e.g.
> 
> 
>   if (READ_ONCE(*a)) {
>     WRITE_ONCE(*b,1);
>   } else {
>     WRITE_ONCE(*b,1);
>   }
> 
> has no semantic dependency and gcc does not guarantee the order between
> these two accesses, even though herd7 does give us a dependency edge.

Like I said.

> > > I have to read your paper again (I think I read it a few months ago) to
> > > understand if the trivial OOTA would make even that vague axiom unsound
> > > (my intuition says that if the OOTA is never observed by influencing the
> > > side-effect, then forbidding OOTA makes no difference to the set of
> > > "observable behaviors" of a C++ program even there is a trivial OOTA, and if
> > > the OOTA has visible side-effects, then it is acceptable for the compiler
> > > not to do the "optimization" that turns it into a trivial OOTA and choose
> > > some other optimization instead, so we can as well forbid the compiler from
> > > doing it).
> > 
> > If an instance of OOTA is never observed, does it exist?
> 
> :) :) :)
> 
> > In the paper, I speculated that if a physical execution of a program
> > matches an abstract execution containing such a non-observed OOTA cycle,
> > then it also matches another abstract execution in which the cycle
> > doesn't exist.  I don't know how to prove this conjecture, though.
> 
> Yes, that also makes sense.
> 
> Note that this speculation does not hold in the current LKMM though. In the
> Litmus test I shared in the opening e-mail, where the outcome 0:r1=1 /\
> 1:r1=1 is only possible with an OOTA (even though the values from the OOTA
> are never used anywhere).

If the fact that the outcome 0:r1=1 /\ 1:r1=1 has occurred is proof that 
there was OOTA, then the OOTA cycle _is_ observed, albeit indirectly -- 
at least, in the sense that I intended.  (The situation mentioned in the 
paper is better described as an execution where the compiler has elided 
all the accesses in the OOTA cycle.)

> With C++'s non-local model I wouldn't be totally surprised if there were
> similar examples in C++, but given that its ordering definition is a lot
> more straightforward than LKMM in that it doesn't have all these cases of
> different barriers like wmb and rmb and corner cases like Noreturn etc., my
> intuition says that there aren't any.

I'll have to give this some thought.

Alan

> But I am not going to think deeply about it for the time being.
> 
> Best wishes
>    jonas
