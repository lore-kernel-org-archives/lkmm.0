Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97340204C31
	for <lkmm@lists.linux.dev>; Mon, 17 Mar 2025 23:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742253995; cv=none; b=kprRKXwtDt3AZP50ynj89337XXadxLIHQekMX5+lxM9t6HF2T2chSJtYYQBcTBmbqw4af4OvBMpd16tb9N5Znjk3XxdEoBqHUnrlx5IBXqNlY0CYHG2EXRdF1wnmirvn/Ur9jKdreZj13sPUkxzWnmPoD+AvMqk0hU2JoTBzZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742253995; c=relaxed/simple;
	bh=bOoa0MzEuzRswCO/3iwP9WJqI6BPXK0bI7G8VFDI5y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfenEyHRui2Vod2liNOpvxrtxRrdiO9qh4hNVzAcE6nZjeAYoRvDNk9YYTe2Nu7kDwDpXskRQDzJg/+dqbAqZG2QPGLzVWKmnauppAxaud9qgg1vKmUpG17Nk1kChg8Y787XO8Zar8HbcAaNVIPkIZYh0K4imRDp25mvtfuu5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tBbPpXhU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBbPpXhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D343C4CEE9;
	Mon, 17 Mar 2025 23:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742253995;
	bh=bOoa0MzEuzRswCO/3iwP9WJqI6BPXK0bI7G8VFDI5y0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=tBbPpXhUEqbt2xhyXPtoeUhWkfBbQufhixmr9KQ8ie6VrteOmbREQDNghXPgSYZX7
	 CQUzooB9rxsp0vShwWy+U/bWfMDYGUuUhcwDJuvqmnrdJW0XJFAU4V/smJFF0rySaR
	 nMlHmW/nPehZ+kVmP3v/O3OZQqoS/GdVuvstYBfoAeGpeYhjAepfRV+1Bi6xPWFiKf
	 TAkSa+/4lLFaXbYLUCNd94ox4FrKKongXLAk1CQkNBQCSQRcVO0ALDfds0stam/og2
	 IS0vkwyYOJNz+yMrl1IN7Ez1pFHaG8oUBUhhxkXXdtIw93hYZIrldSyR/PKa2TWZy7
	 YxWCQnPe3hXtQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B9D6ECE0C2A; Mon, 17 Mar 2025 16:26:34 -0700 (PDT)
Date: Mon, 17 Mar 2025 16:26:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 0/4] tools/memory-model: Documentation updates and fixes
Message-ID: <5e70aa5f-2c4c-4c0c-971e-82c5bf356cbb@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>

On Fri, Mar 14, 2025 at 08:08:24PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> While re-reading LKMM documents, I noticed minor issues here and there.
> 
> This patch set is a collection of updates and fixes resolving them.
> 
> Patch 1/4 clarifies the relation of locking.txt and recipes.txt.
> Patches 2/4 and 3/4 are trivial fixes of typos.
> Patch 4/4 removes a link of MIPS doc which does not work.

Queued and pushed, thank you!  I did a bit of wordsmithing and also
updated to the 2024 LWN API article, so could you please check to see
whether I messed anything up?

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   tools/memory-model: docs/README: Update introduction of locking.txt
>   tools/memory-model: docs/simple.txt: Fix trivial typos
>   tools/memory-model: docs/ordering: Fix trivial typos
>   tools/memory-model: docs/references: Remove broken link to imgtec.com
> 
>  tools/memory-model/Documentation/README       |  7 +++++--
>  tools/memory-model/Documentation/locking.txt  |  5 +++++
>  tools/memory-model/Documentation/ordering.txt | 20 +++++++++----------
>  tools/memory-model/Documentation/recipes.txt  |  4 ++++
>  .../memory-model/Documentation/references.txt |  3 +--
>  tools/memory-model/Documentation/simple.txt   |  4 ++--
>  6 files changed, 27 insertions(+), 16 deletions(-)
> 
> 
> base-commit: 87d07e135725dd8976a5ddbc7dfa968198d9ae91
> -- 
> 2.34.1
> 
