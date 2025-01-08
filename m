Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C14D15853B;
	Wed,  8 Jan 2025 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736359756; cv=none; b=BN4GlRQ44n6vTer0HbxWX8YeL5/Klle+WBIzneK4AeRYv66T9ynRlFroxvVePnCC569roBj4z6z5J8OxCsRs/8nhXKu6maqP/T283ML/bkp/EJh8UCa3PDeYv4YyurZPOJVSVJhix2G9y3RmDEWlhJhyS3q2DLYw2aG4793VJ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736359756; c=relaxed/simple;
	bh=GLm7kX2QAjnrJ6okcGnpJ3l7xoeqlKbarckRmrXbrjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjunQSyVgBXSpXZa+eBLsEO16fulAL27coFuk7GOpLVbiw/w0ggQzB5pK4ajxQTbPmkgRJGBtsNpWQaDspWamcHwupO+4PGNgt+sftmdZdLrk7lX/+iFzDFxhdxYzyuYLBtLUV/lJoSn3JYpx+k+IYU02tWFKxsuD9B63nu+c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKKdoRSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKKdoRSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976A4C4CED3;
	Wed,  8 Jan 2025 18:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736359755;
	bh=GLm7kX2QAjnrJ6okcGnpJ3l7xoeqlKbarckRmrXbrjY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=uKKdoRSIvQSfPnMilfEVn1BXAY1L4mzTq89Y+O0WJZEdDfQ7Xmh5l9S7Lbdzl9fuu
	 SxqWSCX6CGov/pAi4gd05t2WjS8LW8d+gBxWnSRzDF5sny/Hejd3Pod2laG+vBF5/V
	 VZYSKmXMA1gHnPZMZ7eVXdd02CnoGGkEAo7xbiL9K116+QRT/d1LX/X76qqwI2q/TS
	 18CHrLw0sVwqtFMe00kRYcnqd1qJBST1es5J6oj86YVb6sVHeDDB4LjmgfQKmZNV6+
	 glCMvP4bo0xV8TcWbSXbSI+rrbXUAsA54QLa5kGbEm1W/lkSOPA8h/FV4d/NBJrIzo
	 fNnJiaSkugTPg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4128BCE1907; Wed,  8 Jan 2025 10:09:15 -0800 (PST)
Date: Wed, 8 Jan 2025 10:09:15 -0800
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
Message-ID: <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>

On Wed, Jan 08, 2025 at 06:39:12PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
> > On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
> > 
> > > (For example, in a presentation to the C++ working group last year, Paul
> > > and I didn't try to show how to extend the C++ memory model to exclude
> > > OOTA [other than by fiat, as it does now].  Instead we argued that with
> > > the existing memory model, no reasonable compiler would ever produce an
> > > executable that could exhibit OOTA and so the memory model didn't need
> > > to be changed.)
> > 
> > Furthermore, the LKMM design choice was that if a given litmus test was
> > flagged as having a data race, anything might happen, including OOTA.
> 
> Note that there is no data race in this litmus test.
> There is a race condition on plain accesses according to LKMM,
> but LKMM also says that this is *not* a data race.
> 
> The patch removes the (actually non-existant) race condition by saying that
> a critical section that is protected from having a data race with address
> dependency or rmb/wmb (which LKMM already says works for avoiding data
> races), is in fact also ordered and therefore has no race condition either.
> 
> As a side effect :), this happens to fix OOTA in general in LKMM.

Fair point, no data race is flagged.

On the other hand, Documentation/memory-barriers.txt says the following:

------------------------------------------------------------------------

However, stores are not speculated.  This means that ordering -is- provided
for load-store control dependencies, as in the following example:

	q = READ_ONCE(a);
	if (q) {
		WRITE_ONCE(b, 1);
	}

Control dependencies pair normally with other types of barriers.
That said, please note that neither READ_ONCE() nor WRITE_ONCE()
are optional! Without the READ_ONCE(), the compiler might combine the
load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
the compiler might combine the store to 'b' with other stores to 'b'.
Either can result in highly counterintuitive effects on ordering.

------------------------------------------------------------------------

If I change the two plain assignments to use WRITE_ONCE() as required
by memory-barriers.txt, OOTA is avoided:

------------------------------------------------------------------------

C jonas

{}

P0(int *a, int *b, int *x, int *y) {
	int r1;

	r1 = READ_ONCE(*x);
	smp_rmb();
	if (r1 == 1) {
		WRITE_ONCE(*a, *b);
	}
	smp_wmb();
	WRITE_ONCE(*y, 1);
}

P1(int *a, int *b, int *x, int *y) {
	int r1;

	r1 = READ_ONCE(*y);
	smp_rmb();
	if (r1 == 1) {
		WRITE_ONCE(*b, *a);
	}
	smp_wmb();
	WRITE_ONCE(*x, 1);
}

exists b=42

------------------------------------------------------------------------

$ herd7 -conf linux-kernel.cfg /tmp/jonas.litmus
Test jonas Allowed
States 1
[b]=0;
No
Witnesses
Positive: 0 Negative: 3
Condition exists ([b]=42)
Observation jonas Never 0 3
Time jonas 0.01
Hash=39c0c230bd221b2f54fc88be6771372a

------------------------------------------------------------------------

If LKMM is to allow plain assignments in this case, we need to also update
memory-barriers.txt.  I am reluctant to do this because the community
needs to trust plain C-language assignments less rather than more,
especially given that compilers are continuing to become more aggressive.

Yes, in your example, the "if" and the two explicit barriers should
prevent compilers from being too clever, but these sorts of things are
more fragile than one might think given future code changes.

Thoughts?

							Thanx, Paul
