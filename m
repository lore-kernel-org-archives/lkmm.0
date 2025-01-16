Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E774414;
	Thu, 16 Jan 2025 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052859; cv=none; b=LCxN5ED0ncKZozURGF8b/aPjaNu8Nh8fPXKMNYLtIJ88WfaE45MEmIAE4JSFQrh5FkDYsJYS7oPEgBQjGvNFFSkSCgx1TgTQ4fyXrzWiguNGxVNZE3MoGRO04v8tC5Zz9kdC09AbN2yYVGzWT80VY2Les68nUBqOYy/DgmGrVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052859; c=relaxed/simple;
	bh=5713RVo45+IuPfGoPYDj1BYw/5U/COl46vfTvxvhFI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlNeJbiaGauFZn7DjsLgc+3Qm07UgSx6R6L8V2txp9S+cqJmjoFsJLu7MTYeoBd7P+mGqbrqpawlxloOj+bh4i5+KaBlGy/PmUOvbd9qggw68nw6HTq+ti07caOM/erlKDVBFSj6J5U1j3+Q+I8ltOaSnl0WCKq1/jJYwwJl5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2YJ5a2Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2YJ5a2Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46D1C4CED6;
	Thu, 16 Jan 2025 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737052858;
	bh=5713RVo45+IuPfGoPYDj1BYw/5U/COl46vfTvxvhFI4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=L2YJ5a2YTIM4Hs0EoetjT2cwQAFakdunSI3xn/7qxDmFRBddCQO1+WUYxJhPeYdgX
	 riDX3fMU3YTTGeZNF882kIW3f/exm/nDOYRfZIi7NNAIAVX17dK2INF5VbFZBDYVVP
	 B3oAyWnT26MoDA09TbVcUhuEuc+mnNBH38Pcb4tVk41r+iDtePzjB6Oi4hft8jUAfR
	 /Dl3ug5sESGSYQfv77L50p9WBAZXaaDbiuB/dc4aLOalHw0houNLN9BLLLoJjqwm+h
	 zdWDYpxr4iZpP2fC0UDPNmD7oBvq3P+bwK/3R8TygSmrpBptAvLpl4SYQo/Wyc+lTJ
	 h+fSwTS3tivGQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6D909CE37B1; Thu, 16 Jan 2025 10:40:58 -0800 (PST)
Date: Thu, 16 Jan 2025 10:40:58 -0800
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
Message-ID: <3b3a7c1a-c40f-4a98-b328-bb4327876606@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>

On Mon, Jan 13, 2025 at 02:04:58PM -0800, Paul E. McKenney wrote:
> On Fri, Jan 10, 2025 at 05:21:59PM +0100, Jonas Oberhauser wrote:
> > Am 1/10/2025 um 3:54 PM schrieb Paul E. McKenney:
> > > On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
> > > > Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
> > > > > On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:

[ . . . ]

> > > > I currently can not come up with an example where there would be a
> > > > (semantic) control dependency from a load to a store that is not in the arm
> > > > of an if statement (or a loop / switch of some form with the branch
> > > > depending on the load).
> > > > 
> > > > I think the control dependency is just a red herring. It is only there to
> > > > avoid the data race.
> > > 
> > > Well, that red herring needs to have a companion fish to swim with in
> > > order to enforce ordering, and I am not seeing that companion.
> > > 
> > > Or am I (yet again!) missing something subtle here?
> > 
> > It makes more sense to think about how people do message passing (or
> > seqlock), which might look something like this:
> > 
> >   [READ_ONCE]
> >   rmb
> >   [plain read]
> > 
> > and
> > 
> >   [plain write]
> >   wmb
> >   [WRITE_ONCE]
> > 
> > 
> > Clearly LKMM says that there is some sort of order (not quite happens-before
> > order though) between the READ_ONCE and the plain read, and between the
> > plain write and the WRITE_ONCE. This order is clearly defined in the data
> > race definition, in r-pre-bounded and w-post-bounded.
> > 
> > Now consider
> > 
> >   [READ_ONCE]
> >   rmb
> >   [plain read]
> >   // some code that creates order between the plain accesses
> >   [plain write]
> >   wmb
> >   [WRITE_ONCE]
> > 
> > where for some specific reason we can discern that the compiler can not
> > fully eliminate/move across the barrier either this specific plain read, nor
> > the plain write, nor the ordering between the two.
> > 
> > In this case, is there order between the READ_ONCE and the WRITE_ONCE, or
> > not? Of course, we know current LKMM says no. I would say that in those very
> > specific cases, we do have ordering.
> 
> Agreed, for LKMM to deal with seqlock, the read-side critical section
> would need to use READ_ONCE(), which is a bit unnatural.  The C++
> standards committee has been discussing this for some time, as that
> memory model also gives data race in that case.
> 
> But it might be better to directly model seqlock than to try to make
> LKMM deal with the underlying atomic operations.

Maybe I should give an example approach, perhaps inspiring a better
approach.

o	Model reader-writer locks in LKMM, including a relaxed
	write-lock-held primitive.

o	Model sequence locks in terms of reader-writer locks:

	o	The seqlock writer maps to write lock.

	o	The seqlock reader maps to read lock, but with a
		write-lock-held check.	If the write lock is held at
		that point, the seqlock tells the caller to retry.

		Please note that the point is simply to exercise
		the failure path.

	o	If a value is read in the seqlock reader and used
		across a "you need to retry" indication, that
		flags a seqlock data race.

But is there a better way?

						Thanx, Paul
