Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F152B3B5308;
	Tue, 28 Apr 2026 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402362; cv=none; b=Pf2MboENLRmrd78j7XwYdA+tDzGj/0MUtyRlYTqUOoiwFbFDJEjMAwvzREYlWmR25RmC1JcpEPdSMJVawhu4jgVEb6RJQWIEsz5mgaJv3HqBKgxabBdGD7fzKn8zrf8thFDHcrkBeolaqLT4HpRgWgaDyu34lrLDpdYpUNFuPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402362; c=relaxed/simple;
	bh=NzyIV7gtqRnT/mBgICSKMYuDFqBvgZwKM5Eurm0Xjtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj8ogQj9BKHkc2495iVxzQBm8+ASRnkaR/xvau0AEwCY044daHJrL5DJFzXJuZClYzP/vfeFOtRM7JPKezA8nulPERF1bFywhWBi6GXJJ8OoM8+nNEazX/HSeGOASMl0THhDYJc0SPcYcNzuRbHdxW7SZzo1zHsSLD0N89wCWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsXV8fg6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsXV8fg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96173C2BCAF;
	Tue, 28 Apr 2026 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402361;
	bh=NzyIV7gtqRnT/mBgICSKMYuDFqBvgZwKM5Eurm0Xjtw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=PsXV8fg6lQE2pA3zOwcR8f2Vwexa82NrNscA72+xEBxb8pJtD3rLXUXinwOxieu4u
	 Jdybph3UPwOXy2oP0E58gtRYKR2WR/XmG2U6QStlzHHoVm9sGCkOS/ppGu/T0dwTgH
	 ipYYCiEvX6LxBmQxaISa+jVc4isZLVjgnAz0T1cN4qypg8zTlnbXS19ZXVJo/KfmDx
	 T46SMpCPr0hS5f4sZeeCu04+L5/iPAS6xq4KBfNy7vZFPnjELu9DohFhH34Ylggb9a
	 DxFDG/hzCBFk/i9lqIrTvn9OrgM6XKGFuLw5Pl2Ano+KZW66ZP0NY6xO4yTfiI+bU2
	 DgJofQp/25HtA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 29E9CCE0DD0; Tue, 28 Apr 2026 11:52:41 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:52:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Adjust T: entry for LKMM
Message-ID: <c8909165-c788-4bd6-b485-871ecedb77e6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <80206f78-d057-43c4-a64d-edeb59c53925@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80206f78-d057-43c4-a64d-edeb59c53925@gmail.com>

On Tue, Apr 28, 2026 at 09:18:06PM +0900, Akira Yokosawa wrote:
> Commit 8f6f1636e345 ("MAINTAINERS: Update RCU git tree") updated
> LKMM git tree along with RCU related subsystems' tree info.
> 
> However, LKMM is maintained at Paul's linux-rcu git tree at the
> moment.
> 
> Adjust it.
> 
> Fixes: 8f6f1636e345 ("MAINTAINERS: Update RCU git tree")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: <stable@vger.kernel.org>
> ---
> 
> Hi Paul,
> 
> While I was skimming MAINTAINERS for other purposes, I came
> across this error.  I'm not sure about "Cc: stable" if it's
> worth for this one.  It's up to you.

Good catch!!!

But the error is not in the MAINTAINERS file, but rather in my failure
to remember to hand off the LKMM patches.  Unless Boqun, Frederic,
Joel, Neeraj, and Uladzislau have changed their minds and would rather
I continue pushing them, in which case I will take your patch.

							Thanx, Paul

> Thanks, Akira
> 
> --
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96ea84948d76..d3e9c648d596 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14732,7 +14732,7 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-arch@vger.kernel.org
>  L:	lkmm@lists.linux.dev
>  S:	Supported
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
>  F:	Documentation/atomic_bitops.txt
>  F:	Documentation/atomic_t.txt
>  F:	Documentation/core-api/refcount-vs-atomic.rst
> -- 
> 2.43.0
> 
