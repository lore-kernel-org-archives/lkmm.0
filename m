Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C795265CA9
	for <lkmm@lists.linux.dev>; Fri, 14 Feb 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545170; cv=none; b=QGuC50Gxm+lw3T1O4Pj8TiKmT5i7nBZk07FmJF69q40SP56IluHY2/IczcW2hsqCXNyO/lHfjdNvDfpFahD8vk/wCRKgArSSZTdlwS5lpXGV9w2mut3XlNilaLUNDvNY9f/WOEp+WAhJeQrqm1CFbmEzGWzg5LIvBbwJirPaktM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545170; c=relaxed/simple;
	bh=DyWVbcvQhqRRay3nylvG/rIWst3boOWeThwZbHFfAug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeQCPgiQOdfqupUjC3WIj7p+oAEUAWjst99X+klSWaj9wjYjO7rKdmAFZWaRm22ELb1OYsPHr0WlaTK+obQljjlTFBtYn80nUQndLP6eTx2IuDU5poSmL1RwYM7VSajjg+sHHi3E1YFEC+bGMcg56tS5601+a2tWlYRlKNdmI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0m2Y7yn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0m2Y7yn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFF8C4CED1;
	Fri, 14 Feb 2025 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545170;
	bh=DyWVbcvQhqRRay3nylvG/rIWst3boOWeThwZbHFfAug=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=r0m2Y7ynYxObSvH7XNdUlZtp/1h248gupJu8r46Fxj57P8he0kgqcfm9nGLOGhjoR
	 te2TaszVeRt6ZFU7fGvKs+2W8r02NuJv0wCQiF/7d9FQEJFcHnpnUvPPTE+biLOKiY
	 MpwJI+hNJbxpR/t7wvBpaGQ3IbYbyOgFgvmg5hcfbklhIAirMfNjo+JACEo1omGzH0
	 Nr9Om3Oa8NFQgsb/4wHp14VeWtXrahYQH+F8qIaN/Qh/r4wZ2dJT/JGQfhHakA+Ifh
	 zS3dfIJRzbu24tLr/ydUT73CW98oKATSaGA2P261rYbqm4eqxGHmzEUSiiB4rTNnzk
	 kHlxZ2S1Il0eg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2AAD1CE0928; Fri, 14 Feb 2025 06:59:27 -0800 (PST)
Date: Fri, 14 Feb 2025 06:59:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
	lkmm@lists.linux.dev, Hernan Ponce de Leon <zeta96@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Luc Maranget <luc.maranget@inria.fr>
Subject: Re: herdtools7.7.58 is now available
Message-ID: <cfcec0f8-1af0-4397-b8f5-0a4f072d80f3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <234b1984-1956-4bfa-9b60-20b28514c8cb@gmail.com>
 <e52c415b-7469-41c4-842d-f15e32e1d80b@paulmck-laptop>
 <ec97f28e-31ad-4a45-ac87-fab91e27d4ee@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec97f28e-31ad-4a45-ac87-fab91e27d4ee@gmail.com>

On Fri, Feb 14, 2025 at 08:26:02PM +0900, Akira Yokosawa wrote:
> Paul E. McKenney wrote:
> > On Fri, Feb 14, 2025 at 04:58:36PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> Thanks to Luc, herdtools7.7.58 is now available [1, 2], which means
> >> pending LKMM changes by Puranjay, Hernan, and Jonas have become
> >> ready to go for the next merge window.
> >>
> >> I'm not sure who will be in charge of sending LKMM pull request for
> >> v6.15, though.
> >>
> >> [1] https://github.com/herd/herdtools7/issues/1155
> >> [2] https://github.com/herd/herdtools7/releases/tag/7.58
> > 
> > That would be me, and thank you for letting me know!
> > 
> > Would you like to submit a patch updating the required version of herd7?
> > One location is tools/memory-model/README,
> 
> It is already taken care of by
> commit c6476bdc49b3 ("tools/memory-model: Switch to softcoded herd7 tags").

Indeed it is, thank you!

> That said, its Sob chain looks confusing to me (provided its author is Jonas):
> 
>     Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
>     Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Thank you again for checking!

This says to me that Hernan wrote the patch, and Jonas took it in and
sent it out.  If this is the case, I should change git's idea of the
author to "Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>".

							Thanx, Paul

> This should be either (Jonas as the author):
> 
>     Co-developed-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
>     Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
>     Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>     
> , (Hernan as the author):
> 
>     Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
>     Co-developed-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
>     Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> , or (Hernan as the author, Jonas as a submitter):
> 
>     Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
>     Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Jonas, Hernan, which is the case here?
> 
>         Thanks, Akira
> 
> >                                            and there might be others
> > (though I hope not).
> > 
> > 							Thanx, Paul
> 
