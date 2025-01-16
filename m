Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A824414;
	Thu, 16 Jan 2025 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737056373; cv=none; b=i/lhliATYB48UjbNjhHv/LvI4HD2O1tp+DIuNLFI6Kw2wsioQxieP+G6LqnVxUMBCCbmOLKNadbqm+ncX9wPeFtEQo/9+/gFJLRGdGjDz7ylt0dtiCwZ09tkuPp6lToNxoIOu5OqpoHdtb+IwfluYFl/uWLJ3NegMhMHVW3suIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737056373; c=relaxed/simple;
	bh=cspWEDLAcQmGECw6IW3WuqcjO49yHNn7AsjkSm4wPYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFmlkgNDbNKrk7AOWpn6ThlvjUerACfeOUa5TOhQtX+xOzDCxE9mT0+zb6QctAA+WcSdAjQ5NmtHUF8xKGeqNeIgarRrHVWM5i60P7NH35NSGGVIBJs+AvR2lZRw/dkWqhttz5GS4t5nijZkIxUGCpUoZ262779eQYuM4BY+E8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LimhiAnQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LimhiAnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1D7C4CED6;
	Thu, 16 Jan 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737056373;
	bh=cspWEDLAcQmGECw6IW3WuqcjO49yHNn7AsjkSm4wPYo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LimhiAnQQMuetQ78fTjL9spcrasd1lww2jBRPmGcOyk9gl6trwTEglF+PXYYIdVmq
	 81GvJJLFYHM0H2DGh11v/XFYkjtHhvegI8BDr9WCsyRvNIa628TLICgX8wSTsuLMp1
	 x7N+ZAAobYJk849Zt7ivyMOZhqdMHWYgkt3mqc/nurA3Hs7JMNFKi3D+YMJU9iJyBG
	 3kmm8ouNv+08k8u43n660SxIueySQY9+XdivWwEDQGgADP2ZQ0bVCvpkjtoZGskj0k
	 VYf+EZevVB6+JHWM3myQuylVQxbHlZOu+E2vIYelMJFhls3bbr7PJHdjaJaH4u/wHM
	 hgb4jZJESFVKg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id F330ECE0EDF; Thu, 16 Jan 2025 11:39:32 -0800 (PST)
Date: Thu, 16 Jan 2025 11:39:32 -0800
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
Message-ID: <4411cf20-f889-4fd7-9e03-14744deaaf72@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <3b3a7c1a-c40f-4a98-b328-bb4327876606@paulmck-laptop>
 <446d6a64-7ee4-494a-bbfe-dbfdb6959f9c@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <446d6a64-7ee4-494a-bbfe-dbfdb6959f9c@huaweicloud.com>

On Thu, Jan 16, 2025 at 08:28:06PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/16/2025 um 7:40 PM schrieb Paul E. McKenney:
> > 	o	If a value is read in the seqlock reader and used
> > 		across a "you need to retry" indication, that
> > 		flags a seqlock data race.
> 
> 
> This too is insufficient, you also need to prevent dereferencing or having
> control dependency inside the seqlock. Otherwise you could derefence a torn
> pointer and...

True, but isn't that prohibition separable from the underlying
implementation?

> At this point your definition of data race becomes pretty much the same as
> we have.
> 
> https://github.com/open-s4c/libvsync/blob/main/vmm/vmm.cat#L150
> 
> 
> (also this rule should only concern reads that are actually "data-racy" - if
> the read is synchronized by some other writes, then you can read & use it
> just fine across the seqlock data race)

Perhaps LKMM should adopt this or something similar, but what do others
think?

> I also noticed that in my previous e-mail I had overlooked the reads inside
> the CS in the failure case, but you are of course right, there needs to be
> some mechanism to prevent them from being data racy unless abused.
> 
> But I am not sure how to formalize that in a way that is simpler than just
> re-defining data races in general, without adding some special support to
> herd7 for it.
> 
> What do you think?

I was thinking in terms of identifying reads in critical sections (sort
of like LKMM does for RCU read-side critical sections), then identifying
any dependencies from those reads that cross a failed reader boundary.
If that set is non-empty, flag it.

But I clearly cannot claim to have thought this through.  ;-)

							Thanx, Paul
