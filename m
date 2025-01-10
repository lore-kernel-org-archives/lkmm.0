Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1921147A;
	Fri, 10 Jan 2025 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520880; cv=none; b=A8rT9+U1K+JgQ85I3K0axjXkoeczlDTocLOqmvtBJPnyQ1mKD/Lq3PmiIq5+yzKUvHEbJp0dvyUCBFXIA6aYQEMg9dFT6HK7kNUyrtyYC78OZVxsdm+GrMa+S2UsvGc72Uic1mmmUCdi8l4R97giqZap7ntZPGR7QTct4aRQGHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520880; c=relaxed/simple;
	bh=0r3cXrIYz46O8SUwFQPxzvq9vD8Prv9AcOqemftlCeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhMEScAwWnNVY1IZwq5VvCCPc5QkjoGYkCQ7cydWSWWnqJVKZEdigMk8JpCUaVMzOhsa0lzi9/WBHaV4Bbu210Iw2VaJLriiwOsCgJEKx/IlaQiNtmXXcXkR7h26dyMZbvlwJ7k3MUcmc4p8Wy2jRQYKxAkbkoaoKbP9fjOiYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POrqV/bV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POrqV/bV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57608C4CED6;
	Fri, 10 Jan 2025 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736520880;
	bh=0r3cXrIYz46O8SUwFQPxzvq9vD8Prv9AcOqemftlCeI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=POrqV/bV1Jyo/oKeeD5JSaLV7IbuPngGZDL24dXemVXcrhlSGNT7xsCI7rDgQQwaj
	 4SWpofak/AvZ/LRnb+ogaG1vDokKefUHKH5A0ylhihNfoS/QwWG13HN0vJ48w5ICFX
	 XEWNRi+OrDbpSX6+pVEQzN71EweXRzGgkuSkij3QKn7bfcISytVxZtscGgr5RywORV
	 pXEJratwO3BWylVIOJ6kjEudNVndlwAFxwHzqsP0mf4O/78iMKAMGRCN5Pw5i7skwa
	 jE2BJ22AZ6BPBif+SjJVTfy6k+wPEPbNZt3FdTMYtA61PlZVGvg/n4UF+PphXICgpl
	 Vk8gIN9b2anaA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 01C6CCE0DCA; Fri, 10 Jan 2025 06:54:40 -0800 (PST)
Date: Fri, 10 Jan 2025 06:54:39 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com,
	joel@joelfernandes.org, urezki@gmail.com, quic_neeraju@quicinc.com,
	frederic@kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>

On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
> Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
> > On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
> > > 
> > > 
> > > Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
> > > > On Wed, Jan 08, 2025 at 06:39:12PM +0100, Jonas Oberhauser wrote:
> > > > > 
> > > > > 
> > > > > Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
> > > > > > On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
> > > > > > 
> > > > > The patch removes the (actually non-existant) race condition by saying that
> > > > > a critical section that is protected from having a data race with address
> > > > > dependency or rmb/wmb (which LKMM already says works for avoiding data
> > > > > races), is in fact also ordered and therefore has no race condition either.
> > > > > 
> > > > > As a side effect :), this happens to fix OOTA in general in LKMM.
> > > > 
> > > > Fair point, no data race is flagged.
> > > > 
> > > > On the other hand, Documentation/memory-barriers.txt says the following:
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > However, stores are not speculated.  This means that ordering -is- provided
> > > > for load-store control dependencies, as in the following example:
> > > > 
> > > > 	q = READ_ONCE(a);
> > > > 	if (q) {
> > > > 		WRITE_ONCE(b, 1);
> > > > 	}
> > > > 
> > > > Control dependencies pair normally with other types of barriers.
> > > > That said, please note that neither READ_ONCE() nor WRITE_ONCE()
> > > > are optional! Without the READ_ONCE(), the compiler might combine the
> > > > load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
> > > > the compiler might combine the store to 'b' with other stores to 'b'.
> > > > Either can result in highly counterintuitive effects on ordering.
> > > > 
> > > > ------------------------------------------------------------------------
> > > > 
> > > > If I change the two plain assignments to use WRITE_ONCE() as required
> > > > by memory-barriers.txt, OOTA is avoided:
> > > 
> > > 
> > > I think this direction of inquiry is a bit misleading. There need not be any
> > > speculative store at all:
> > > 
> > > 
> > > 
> > > P0(int *a, int *b, int *x, int *y) {
> > > 	int r1;
> > > 	int r2 = 0;
> > > 	r1 = READ_ONCE(*x);
> > > 	smp_rmb();
> > > 	if (r1 == 1) {
> > > 		r2 = *b;
> > > 	}
> > > 	WRITE_ONCE(*a, r2);
> > > 	smp_wmb();
> > > 	WRITE_ONCE(*y, 1);
> > > }
> > > 
> > > P1(int *a, int *b, int *x, int *y) {
> > > 	int r1;
> > > 
> > > 	int r2 = 0;
> > > 
> > > 	r1 = READ_ONCE(*y);
> > > 	smp_rmb();
> > > 	if (r1 == 1) {
> > > 		r2 = *a;
> > > 	}
> > > 	WRITE_ONCE(*b, r2);
> > > 	smp_wmb();
> > > 	WRITE_ONCE(*x, 1);
> > > }
> > > 
> > > 
> > > The reason that the WRITE_ONCE helps in the speculative store case is that
> > > both its ctrl dependency and the wmb provide ordering, which together
> > > creates ordering between *x and *y.
> > 
> > Ah, and that is because LKMM does not enforce control dependencies past
> > the end of the "if" statement.  Cute!
> > 
> > But memory-barriers.txt requires that the WRITE_ONCE() be within the
> > "if" statement for control dependencies to exist, so LKMM is in agreement
> > with memory-barriers.txt in this case.  So again, if we change this,
> > we need to also change memory-barriers.txt.
> > [...]
> > If we want to respect something containing a control dependency to a
> > WRITE_ONCE() not in the body of the "if" statement, we need to make some
> > change to memory-barriers.txt.
> 
> I'm not sure what you denotate by *this* in "if we change this", but just to
> clarify, I am not thinking of claiming that there were a (semantic) control
> dependency to WRITE_ONCE(*b, r2) in this example.
> 
> There is however a data dependency from r2 = *a to WRITE_ONCE, and I would
> say that there is a semantic data (not control) dependency from r1 =
> READ_ONCE(*y) to WRITE_ONCE(*b, r2), too: depending on the value read from
> *y, the value stored to *b will be different. The latter would be enough to
> avoid OOTA according to the mainline LKMM, but currently this semantic
> dependency is not detected by herd7.

According to LKMM, address and data dependencies must be headed by
rcu_dereference() or similar.  See Documentation/RCU/rcu_dereference.rst.

Therefore, there is nothing to chain the control dependency with.

> I currently can not come up with an example where there would be a
> (semantic) control dependency from a load to a store that is not in the arm
> of an if statement (or a loop / switch of some form with the branch
> depending on the load).
> 
> I think the control dependency is just a red herring. It is only there to
> avoid the data race.

Well, that red herring needs to have a companion fish to swim with in
order to enforce ordering, and I am not seeing that companion.

Or am I (yet again!) missing something subtle here?

> In a hypothetical LKMM where reading in a race is not a data race unless the
> data is used (*1), this would also work:

You lost me on the "(*1)", which might mean that I am misunderstanding
your text and examples below.

>  	unsigned int r1;
>  	unsigned int r2 = 0;
>  	r1 = READ_ONCE(*x);
>  	smp_rmb();
>  	r2 = *b;

This load from *b does not head any sort of dependency per LKMM, as noted
in rcu_dereference.rst.  As that document states, there are too many games
that compilers are permitted to play with plain C-language loads.

>  	WRITE_ONCE(*a, (~r1 + 1) & r2);
>  	smp_wmb();
>  	WRITE_ONCE(*y, 1);
> 
> 
> Here in case r1 == 0, the value of r2 is not used, so there is a race but
> there would not be data race in the hypothetical LKMM.

That plain C-language load from b, if concurrent with any sort of store to
b, really is a data race.  Sure, a compiler that can prove that r1==0 at
the WRITE_ONCE() to a might optimize that load away, but the C-language
definition of data race still applies.

Ah, I finally see that (*1) is a footnote.

> This example would also have OOTA under such a hypothetical LKMM, but not
> with my patch, because in the case where r1 == 1,
>  READ_ONCE(*x) is seperated by rmb from the load from *b,
>    upon which the store to *a depends,
>    which itself is seperated by a wmb from the store to WRITE_ONCE(*y,1)
> and this would ensure that READ_ONCE(*x) and WRITE_ONCE(*y,1) can not be
> reordered with each other anymore.
> 
> 
> (*1= such a definition is not absurd! One needs to allow such races to make
> sequence locks and other similar datastructures well-defined.)

I am currently not at all comfortable with the thought of allowing
plain C-language loads to head any sort of dependency.  I really did put
that restriction into both memory-barriers.txt and rcu_dereference.rst
intentionally.  There is the old saying "Discipline = freedom", and
therefore compilers' lack of discipline surrounding plain C-language
loads implies a lack of freedom.  ;-)

> I currently don't know another way than the if-statement to avoid the data
> race in the program(*2) in the current LKMM, so that's why I rely on it, but
> at least conceptually it is orthogonal to the problem.
> 
> (*2=we can avoid the data race flag in herd by using filter, and only
> generating the graphs where r1==1 and there is no data race. But that is
> cheating -- the program is not valid under mainline LKMM.)

Such cheats can be valid in cases where that is how you tell herd7 about
some restriction that it cannot be told otherwise, but in this case, I
agree that this cheat is unhelpful.

> > > Please do look at the OO
> TA graph generated by herd7 for this one, it looks
> > > quite amazing.
> > 
> > Given the way this morning is going, I must take your word for it...
> 
> That sounds awful :(
> Technical issues?

Nothing awful, just catching up from tracking down a Linux-kernel RCU
bug that fought well [1] and from the holidays.

> With any luck, you can test it on arm's herd7 web interface at
> https://developer.arm.com/herd7 (just don't be like me and type all the code
> first and then change the drop-down selector to Linux - that will reset the
> code window...)

Ah, I have been running them locally, and didn't have time to chase down
the herd7 arguments.

Which reminds me...  We should decide which of these examples should be
added to the github litmus archive, perhaps to illustrate the fact that
plain C-language loads do not head dependency chains.  Thoughts?

							Thanx, Paul

[1] https://people.kernel.org/paulmck/hunting-a-tree03-heisenbug
