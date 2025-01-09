Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF51946A2;
	Thu,  9 Jan 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445269; cv=none; b=hVzyZGYJ+PQyyI9b3xm2YsUgKrfxd/vGjGKXYLk57WD6MvACuqcNpMXh7o8hlv4JsDE1id1Q5Bed0UX+OzgVHpEV8Ay0sPxsO7M5JzMcblVsq2g1pe29aSd9A5oxUYVrHEv2bNV4Jr76IhVhFJz5qDZ65RDpxiIQUUCnO//u18o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445269; c=relaxed/simple;
	bh=KZNT6eik6uDfeURnZCH40jrW6Fy9IP+gYzfnz05GJ14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTgX7hTMaTtQO/nmmbtGqPvyhkckS8jFONkJTiOeGibMHFnypd3GGtMSwQm9JX+5YN4HesTBRBI9Mfw0BRVTcrkhH1Gj3JjciAiDgSJSOxWc7id+AKLxXNOgiJFmaCurf3sBFyM7kh5m8AXa6dV0hNwYwIcZYVUh8LYLOsp8OxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AY+zpz+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AY+zpz+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014E0C4CED2;
	Thu,  9 Jan 2025 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445269;
	bh=KZNT6eik6uDfeURnZCH40jrW6Fy9IP+gYzfnz05GJ14=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AY+zpz+lZ89vFst7zjPS+CuVyKBhsRrCOOyGHO7cAQHzVEzzxHEE0pW9koj3khTmb
	 9B2dave4mi0B7xwljPj1Su/WBjkKNCyhJmxpNOuIrYLK+w7UMiHBtxe3PhhADfRW0r
	 xOHvI5Cd5SEVp14EFk6yW/TdHxKeKIEDW2JTHytyOw4IJyNhOqgKEU+/BR9Vs5nMq4
	 a+adlpEoyxIzvF9Q4Uw/5cWcam9RqWwvI1VznFAasTTehafKixbFhXjMY7qvN+KvZL
	 NmGf0Y4d6qFNFJylPqxwrNyFF7c6O6HNIfjVEb7xFRojetsWTQhzYKE6uTeuDWqa1p
	 QArhhG59ChSVQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A4EDFCE098C; Thu,  9 Jan 2025 09:54:28 -0800 (PST)
Date: Thu, 9 Jan 2025 09:54:28 -0800
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
Message-ID: <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>

On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
> > On Wed, Jan 08, 2025 at 06:39:12PM +0100, Jonas Oberhauser wrote:
> > > 
> > > 
> > > Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
> > > > On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
> > > > 
> > > > > (For example, in a presentation to the C++ working group last year, Paul
> > > > > and I didn't try to show how to extend the C++ memory model to exclude
> > > > > OOTA [other than by fiat, as it does now].  Instead we argued that with
> > > > > the existing memory model, no reasonable compiler would ever produce an
> > > > > executable that could exhibit OOTA and so the memory model didn't need
> > > > > to be changed.)
> > > > 
> > > > Furthermore, the LKMM design choice was that if a given litmus test was
> > > > flagged as having a data race, anything might happen, including OOTA.
> > > 
> > > Note that there is no data race in this litmus test.
> > > There is a race condition on plain accesses according to LKMM,
> > > but LKMM also says that this is *not* a data race.
> > > 
> > > The patch removes the (actually non-existant) race condition by saying that
> > > a critical section that is protected from having a data race with address
> > > dependency or rmb/wmb (which LKMM already says works for avoiding data
> > > races), is in fact also ordered and therefore has no race condition either.
> > > 
> > > As a side effect :), this happens to fix OOTA in general in LKMM.
> > 
> > Fair point, no data race is flagged.
> > 
> > On the other hand, Documentation/memory-barriers.txt says the following:
> > 
> > ------------------------------------------------------------------------
> > 
> > However, stores are not speculated.  This means that ordering -is- provided
> > for load-store control dependencies, as in the following example:
> > 
> > 	q = READ_ONCE(a);
> > 	if (q) {
> > 		WRITE_ONCE(b, 1);
> > 	}
> > 
> > Control dependencies pair normally with other types of barriers.
> > That said, please note that neither READ_ONCE() nor WRITE_ONCE()
> > are optional! Without the READ_ONCE(), the compiler might combine the
> > load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
> > the compiler might combine the store to 'b' with other stores to 'b'.
> > Either can result in highly counterintuitive effects on ordering.
> > 
> > ------------------------------------------------------------------------
> > 
> > If I change the two plain assignments to use WRITE_ONCE() as required
> > by memory-barriers.txt, OOTA is avoided:
> 
> 
> I think this direction of inquiry is a bit misleading. There need not be any
> speculative store at all:
> 
> 
> 
> P0(int *a, int *b, int *x, int *y) {
> 	int r1;
> 	int r2 = 0;
> 	r1 = READ_ONCE(*x);
> 	smp_rmb();
> 	if (r1 == 1) {
> 		r2 = *b;
> 	}
> 	WRITE_ONCE(*a, r2);
> 	smp_wmb();
> 	WRITE_ONCE(*y, 1);
> }
> 
> P1(int *a, int *b, int *x, int *y) {
> 	int r1;
> 
> 	int r2 = 0;
> 
> 	r1 = READ_ONCE(*y);
> 	smp_rmb();
> 	if (r1 == 1) {
> 		r2 = *a;
> 	}
> 	WRITE_ONCE(*b, r2);
> 	smp_wmb();
> 	WRITE_ONCE(*x, 1);
> }
> 
> 
> The reason that the WRITE_ONCE helps in the speculative store case is that
> both its ctrl dependency and the wmb provide ordering, which together
> creates ordering between *x and *y.

Ah, and that is because LKMM does not enforce control dependencies past
the end of the "if" statement.  Cute!

But memory-barriers.txt requires that the WRITE_ONCE() be within the
"if" statement for control dependencies to exist, so LKMM is in agreement
with memory-barriers.txt in this case.  So again, if we change this,
we need to also change memory-barriers.txt.

> I should point out that a version of herd7 that respects semantic
> dependencies (instead of syntactic only) might solve this case, by figuring
> out that the WRITE_ONCE to *a resp. *b depends on the first READ_ONCE.
> 
> Here's another funny example:
> 
> 
> P0(int *a, int *b, int *x, int *y) {
> 	int r1;
> 
> 	r1 = READ_ONCE(*x);
> 	smp_rmb();
> 	int r2 = READ_ONCE(*b);
> 	if (r1 == 1) {
> 		r2 = *b;
> 	}
> 	WRITE_ONCE(*a, r2);
> 	smp_wmb();
> 	WRITE_ONCE(*y, 1);
> }
> 
> P1(int *a, int *b, int *x, int *y) {
> 	int r1;
> 
> 	r1 = READ_ONCE(*y);
> 	smp_rmb();
> 	int r2 = READ_ONCE(*a);
> 	if (r1 == 1) {
> 		r2 = *a;
> 	}
> 	WRITE_ONCE(*b, r2);
> 	smp_wmb();
> 	WRITE_ONCE(*x, 1);
> }
> 
> exists (0:r1=1 /\ 1:r1=1)
> 
> Is there still a semantic dependency from the inner load to the store to *a
> resp. *b, especially since the outer load from *b resp. *a is reading from
> the same store as the inner one? The compiler is definitely allowed to
> eliminate the inner load, which *also removes the OOTA*.

Also cute.  And also the WRITE_ONCE() outside of the "if" statement.

> Please do look at the OOTA graph generated by herd7 for this one, it looks
> quite amazing.

Given the way this morning is going, I must take your word for it...

> > If LKMM is to allow plain assignments in this case, we need to also update
> > memory-barriers.txt.
> 
> But I am not suggesting to allow the plain assignment *by itself*.
> In particular, my patch does not enforce any happens-before order between
> the READ_ONCE(*x) and the plain assignment to *b.
> It only provides order between READ_ONCE(*x) and WRITE_ONCE(*y,...), through
> dependencies in the plain critical section.
> 
> Which must be 1) properly guarded (e.g., by rmb/wmb) and 2) live.
> 
> Because of this, I don't know if the text needs much updating, although one
> could add a text in the direction that "in the rare case where compilers do
> guarantee that a load and dependent store (including plain) will be emitted
> in some form, one can use rmb and wmb to ensure the order of surrounding
> marked accesses".

If we want to respect something containing a control dependency to a
WRITE_ONCE() not in the body of the "if" statement, we need to make some
change to memory-barriers.txt.

> > I am reluctant to do this because the community> needs to trust plain
> C-language assignments less rather than more,
> > especially given that compilers are continuing to become more aggressive.
> 
> Yes, I agree.

Whew!!!  ;-)

> > Yes, in your example, the "if" and the two explicit barriers should
> > prevent compilers from being too clever, but these sorts of things are
> > more fragile than one might think given future code changes.
> > 
> > Thoughts?
> 
> We certainly need to be very careful about how to formalize what the
> compiler is allowed of doing and what it is not. And even more careful about
> how to communicate this.

No argument here!

							Thanx, Paul
