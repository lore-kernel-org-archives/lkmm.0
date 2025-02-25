Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C831A0BD6
	for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508941; cv=none; b=k4aZ0S8HqCd/LDP3Skl6EeR+CvzYEh9nSg79etVFWvTwPKv5GTTftavvA4/sWQEBItRJ4G5JdhnlkdAzkVkrKHw1srbzoB39VMkiguYJdrqGrIEdH9YBWiY42iv0m8A/apQFBmWiDwWTntyJyoUotjVkK69KQskqGfDph7heMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508941; c=relaxed/simple;
	bh=by6jtExKqdmKKnSPfg/ncDMBsFLmK/lhbYhnDrYjiNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJZFQapqEPbjzVwL3gQmgMyP6SqvK83rNIpR87+SByh9P4iYR25kQe/S8gB0lA+eIzaLH3EbCXt+zWYWvY1JVkUd35pmn4kM0uAprbXvKyBaU8w/KJcBDAf/YnNThLAOS1BtiVwqsj23dydBMdSCGWhdqiB3JeCmGdSXrDdmhUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibXgDKd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibXgDKd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610C4C4CEDD;
	Tue, 25 Feb 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740508940;
	bh=by6jtExKqdmKKnSPfg/ncDMBsFLmK/lhbYhnDrYjiNE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ibXgDKd3vT04PYCJVF9EBE0IqCsmPlFCMbac/7EJjdqH0149yfhHDdYWJY1Tj2AOo
	 BJSx8EN8DUqW5CIiTgstHCFmJ0C/gj/1ZA94rO5tYd4Eu65NxKMkd/JXzMN5gByKM4
	 2AYADfItcCbVvnDq1DDSsLkFRZ5jldYQnpbvtR/+LMJH4fwiInHwQLWBFc8V9kKSjE
	 2MBj9HbryJiQaGvUC+s3AffhkRsX9NCnAA1wUmsw8b+ASd7vzLaPcduUlllkGa0hn4
	 8qfwn+2xvYh+F0epDRXdiMBweHB3GFF7icSdYem9BmBrDJcjDm6H7rm953BoXaTdBR
	 9vkF6e5JDjHRQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0842ACE045A; Tue, 25 Feb 2025 10:42:20 -0800 (PST)
Date: Tue, 25 Feb 2025 10:42:20 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH memory-model 1/2] tools/memory-model/README: Fix typo
Message-ID: <5d6fcb9d-677b-41b5-8b0d-7cb58d86ada1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bd7bba43-7674-4a4f-9eeb-3e2b8684c24c@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd7bba43-7674-4a4f-9eeb-3e2b8684c24c@gmail.com>

On Tue, Feb 25, 2025 at 06:39:58PM +0900, Akira Yokosawa wrote:
> Fix a trivial typo.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
> 
> As this and 2/2 are trivial changes, I'm using a trimmed-down list
> of people in CC.

Queued, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
>  tools/memory-model/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/memory-model/README b/tools/memory-model/README
> index 59bc15edeb8a..64c860863aa9 100644
> --- a/tools/memory-model/README
> +++ b/tools/memory-model/README
> @@ -79,7 +79,7 @@ Several thousand more example litmus tests are available here:
>  	https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/CodeSamples/formal/herd
>  	https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/CodeSamples/formal/litmus
>  
> -Documentation describing litmus tests and now to use them may be found
> +Documentation describing litmus tests and how to use them may be found
>  here:
>  
>  	tools/memory-model/Documentation/litmus-tests.txt
> 
> base-commit: de3ac915f986e6ecc1c219584797c196ff6d1fa2
> -- 
> 2.34.1
> 
