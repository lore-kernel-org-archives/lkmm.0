Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BCA77102;
	Thu,  9 Jan 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457240; cv=none; b=esDFRjb7JFaBrlT8mfws28nGXfg7n8gLWOnTzEKWk070WbYEzJv2BFuVt1BRLhb1HOEfpJFKEhts4lbka/neYTi9lakdS163f7wd/2fBMx5X7+lRTUszWOAAs/4zEuAmdhzah60BMGejmWvlOT3nfsa8M8u0TeYH1CWFXLU4umo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457240; c=relaxed/simple;
	bh=ZzQW5BiGSUWusNGiObkD5Cbv4YsY9vRMdzd4J+aKlQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQwtDNvgZMoPGE0/lfqYHzXyJmGz9eXWoMHtW10BhmPhPdemwpQwzQcnHxcoTmk2D3Zmnl5r7cyZzCv4+NqSZglrXRObWSm6Gs7vJk04y/eVIJag3yUjmUmNf/IOUV3wT9O/1L53oYZyqB/sAP+TwBW4d7Ht8dJSW9vXR5YgA6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9xK+wpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9xK+wpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19393C4CED2;
	Thu,  9 Jan 2025 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736457240;
	bh=ZzQW5BiGSUWusNGiObkD5Cbv4YsY9vRMdzd4J+aKlQM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=M9xK+wpJFBNB73nlNw4jEOrv3h+7fQoex/ACvi8w5TovgvYZP4Py5opZcSgDrh7ck
	 6NLZEz2AJTivgN0mua6SQ8iSfxf7LwVsACRk39bbHFxptqXQtAGeCnbEy7OerYi0qg
	 B6t08vZ2zAxQ/SPO+X5eRy4PV0ju2pqjRqVOki0zTYje1MROm5SFjP6dwghu86SrzI
	 7p2Sb2wY6rQgXSqDCX6A21nrqxBOwct1pFDeIujkQO/hUw5Br/MAGq98UthpDSbKRW
	 YXuHcs4NGgG2iNepo8bX/h7n+DqxdrqWVGn8MFfT6we83x46GQZnyW5mcnwQz2vqaR
	 HLAkQbKa+ozHg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ADF61CE11A6; Thu,  9 Jan 2025 13:13:59 -0800 (PST)
Date: Thu, 9 Jan 2025 13:13:59 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
	will@kernel.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <7d947eb7-5181-42eb-8480-f333c791fea6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <20250109203708.GA27200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109203708.GA27200@noisy.programming.kicks-ass.net>

On Thu, Jan 09, 2025 at 09:37:08PM +0100, Peter Zijlstra wrote:
> On Thu, Jan 09, 2025 at 09:54:28AM -0800, Paul E. McKenney wrote:
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
> 
> I think the reason we hesitated on that was CMOV and similar conditional
> instructions. If the body of the branch is a CMOV, then there no
> conditionality on the common path after the body.

That does match my recollection.

In addition, in some cases the compiler can move memory references
following the body of the "if" to precede that "if", and then CPU
memory-reference reordering can do the rest.

							Thanx, Paul
