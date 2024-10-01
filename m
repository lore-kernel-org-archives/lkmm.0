Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BEB645
	for <lkmm@lists.linux.dev>; Tue,  1 Oct 2024 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796242; cv=none; b=LH+liK1ahzGT5tU8FALtbHjnbYoAPv6cN/OgixxxH0xXXdtDixvQRW1s3KhfIyaOVVhVFhCvXATM3ZpDHBhC3P0YT5wshTRZ/ChvqDnoxuE35YRG/zkd6AoNPJoCsxCubwCt7D0mo+YNb80NuxcEgXAhxX3meGZvx5JHU5wYqBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796242; c=relaxed/simple;
	bh=dY/hObHpTfSvu2gmgMotxnpX0bTUr4T6tmeJ0AkgdLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8svrQoQRzAl1GeemvgsexHePYw2MB3/R3/ovD9TbC42EKw+gsW46t7cnr8iqPclegzQ3rVU/VLMEgKsX5F5tAsJ8aMZkGEDXtpWnxxUpPpDIx5XF+hNEUa8jel9ZaJ545TATjCCwAqP6ev514wPujkZQ3zYRod3M0XTPNd6aWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Shqd4nEN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Shqd4nEN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22ABC4CEC6;
	Tue,  1 Oct 2024 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727796241;
	bh=dY/hObHpTfSvu2gmgMotxnpX0bTUr4T6tmeJ0AkgdLw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Shqd4nENvmTT3qBTwKhQRZilGAvQNaMsWqoP2e1RlKTdXdmb40sPfhvlKbySIagB6
	 S+L1dP2Oqmh7EHzoda6FAfgOIlW+VqC/6RIA8UE4W5g7klGCD7QYlRYeJ+8MlCFgC7
	 VlbxYZS+wdp4zQircl0PbQxe7/sHP31oyrb2PW7IuYQKw0dI8IV0Ooq4mZFDfxqGXg
	 le6RPND+y+QcWq3qnlqS66Hr/p83PBkMVnPgG0BZXHQJiN4Hd6XgdHYtDXrsSv2hrR
	 1LMtg+VSOHHyAOUI7tu/IRbs6sbMd+C8xNts4hiKBzkG0WD7ovAo7n18qWK19JleJl
	 RjrnZBYirjv9g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 44BFCCE0546; Tue,  1 Oct 2024 08:24:01 -0700 (PDT)
Date: Tue, 1 Oct 2024 08:24:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Boqun Feng <boqun.feng@gmail.com>, lkmm@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
Message-ID: <c0c83773-2c9b-4cfa-a28e-dec410f1b35a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
 <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>

On Mon, Sep 30, 2024 at 03:31:02PM +0200, Jonas Oberhauser wrote:
> [dropping a lot of CC]
> 
> Am 9/21/2024 um 6:42 PM schrieb Mathieu Desnoyers:
> > 
> > Porting it to the Linux kernel should be straightforward.
> 
> 
> Btw, what is the relation between uatomics and LKMM?
> 
> Should I assume that they intend to have LKMM semantics modulo whatever is
> explained here:
> 
> https://github.com/urcu/userspace-rcu/blob/master/doc/uatomic-api.md
> 
> Because on C11 model, dependencies are generally not considered

I must defer to Mathieu for recent uatomic directions, but the original
idea was to follow LKMM.

You are right that C11 compilers and memory model don't do much with
dependencies, one exception being the "don't create data races" rule
which requires that non-atomic accesses protected by "if" statements
stay protected, at least in the absence of a nearby unprotected access
to that same variable.

So if uatomic is to rely on dependencies, it must use the same tricks
as LKMM does, including code-style restrictions.

							Thanx, Paul
