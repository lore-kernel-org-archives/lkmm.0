Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E9207E13
	for <lkmm@lists.linux.dev>; Fri, 14 Feb 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523080; cv=none; b=jp+8YvwpNiaWlO2+i7VZDM5i3rgPWAd+koFSevz0jxGYqM8a1cPYZMgfEHme+sCkSrAB167Vk3qbxwrnFOkyqpOS1WYtSFQb9WOakh9tvBfL4aQRPyBddp0V2JzwSVCCseAMRPyfhxByaoNdh+ZXNeCdSNB/ZruSiuuB4Hb2nyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523080; c=relaxed/simple;
	bh=H5NdkhDWyJsQbW+Cpv0yliFtp1U9xsVeY0GG0CEHGHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f34/N26HubwzfjrjCBvUt5456WribgCDrVYWgSNySdcskIAmphI5qUl016mgpdtu0KueCfK7u+jRGEtBCMbiEQ8CFTdJtwj8ZtIU+FJGKfJ9N2L9n/ZWRWGr8U1z5V/xDMS9UuAFweYW5OfqktCOP2KD5NUJToSSxVkO7D3hFbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/arh9+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/arh9+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C246FC4CEE2;
	Fri, 14 Feb 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739523079;
	bh=H5NdkhDWyJsQbW+Cpv0yliFtp1U9xsVeY0GG0CEHGHQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=j/arh9+vigsVg2DzBJglnuM5b/YLtZvLu3RkGql65GqMHOCt1pr/Xsr1Bfktrfpum
	 1wnzQ7qeQT/WAUFNaP9kJSBOS8OlmwR1YJnB5remJ8vlranMbV89rn88HZEZc81Q1I
	 jAZnk6NHKjw6sZSmZGsoGDkl6Mq0DCgVHOz8HS+qxawVFmJOEQG7pm5n5IsX+lj4q5
	 qr47US68aPYHMkrT+R/t646pPcTz66x4WTmrphur6+qIBfbPkQcSlp5ewNKuQaffOo
	 ukpPYqHvblgJ/fLw99IL4RxE74dmExOX8F50jfXHN4EUWyK2zwd7Bc7YdyZnjK13D/
	 47WKOlfZsvVtw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 70394CE0426; Fri, 14 Feb 2025 00:51:15 -0800 (PST)
Date: Fri, 14 Feb 2025 00:51:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: lkmm@lists.linux.dev,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
	Hernan Ponce de Leon <zeta96@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Luc Maranget <luc.maranget@inria.fr>
Subject: Re: herdtools7.7.58 is now available
Message-ID: <e52c415b-7469-41c4-842d-f15e32e1d80b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <234b1984-1956-4bfa-9b60-20b28514c8cb@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <234b1984-1956-4bfa-9b60-20b28514c8cb@gmail.com>

On Fri, Feb 14, 2025 at 04:58:36PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Thanks to Luc, herdtools7.7.58 is now available [1, 2], which means
> pending LKMM changes by Puranjay, Hernan, and Jonas have become
> ready to go for the next merge window.
> 
> I'm not sure who will be in charge of sending LKMM pull request for
> v6.15, though.
> 
> [1] https://github.com/herd/herdtools7/issues/1155
> [2] https://github.com/herd/herdtools7/releases/tag/7.58

That would be me, and thank you for letting me know!

Would you like to submit a patch updating the required version of herd7?
One location is tools/memory-model/README, and there might be others
(though I hope not).

							Thanx, Paul
