Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA4881E;
	Mon,  9 Jun 2025 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506616; cv=none; b=XFSPwn+biMleo2/4xCuw+LLhbfvgHbLjqvf5jhRuTEvSmWg/x6m8oweDk5drCFErl8+3VFvJGMlc+t37IlrCVyDentLYLT8BJrAq8UpPQLqPQAB1u7kIdV4UYsXn3N4J2T9RLKUy8W1d7rxbOEBXL2HR4BSVyZM0UnqJu8s36Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506616; c=relaxed/simple;
	bh=okbO8UwYpgV68U8Yupio597V2rQliRMJaegkeJiUuu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uEspXrLp4LZsESOyGS/Hv7/YQlrbfPnh9LcEYSgajyCi83NI9xNnM2+HzGi7IAST2sXi5jbc5nt+CN/cVI0+tHz0mWEJxnRkaw++DHhb59ipljkwMbOrhJ1AzqkxeESvn07TSEg/lsSB9eoljmlJ+nLwds+RhPfpx7XTHqrmaYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NF2YRfKm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NF2YRfKm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 171CD41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749506613; bh=g7JwqdyB7whNc7b0WAeLuRKuK6lAiIc/N/z0P6qk0Ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NF2YRfKmN7XbZCi7Es6gabtxv+AV2ERfOs0Is+0MJ9+PR0gqOTDH5mnqPoGNWX39p
	 DULh62Bx25DO2eZpCHFuG945XSuyjBaAnWAdl/+vfUuuFF7j6sgxzyUI3pF418EJDh
	 n/WCHDhQzwvvyjg7Xaql7u/4Op7NCKK+Q+tcPXQc9yEywTRYZrzwK+yC7ATZuyHQxL
	 MIc54iKTHp9OtXWomkBABG0vZpnSC9mbCq7z1Q/Mh4yzQ/OrMqeniYUiqNIDy6vsVv
	 3o1/mFvyCHxOb1UbtzbQVygsxgUVRrTCYKnZgKGpZ+4a67V6pWUz89y69vSuk5lK8N
	 0SiH9+v2dH1UA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 171CD41AA1;
	Mon,  9 Jun 2025 22:03:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: mchehab+huawei@kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
 stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>, Ignacio
 Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev, Marco Elver
 <elver@google.com>
Subject: Re: [PATCH] lkmm: docs: Put LKMM documentation into dev-tools book
In-Reply-To: <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
 <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
Date: Mon, 09 Jun 2025 16:03:32 -0600
Message-ID: <87ikl48te3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Currently, LKMM docs are not included in any of kernel documentation
> books.
>
> Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
> into the core-api book") covered plain-text docs under Documentation/
> by using the "include::" directive along with the ":literal:" option.
>
> As LKMM docs are not under Documentation/, the same approach would not
> work due to the limit of the include:: directive. 
>
> As a matter of fact, kernel documentation has an extended directive
> by the name of "kernel-include::", which has no such limitation.
>
> Rather than moving LKMM docs around, use the latter with source tree's
> abspath passed through via the "SOURCEDIR" variable which is now defined
> in Documentation/Makefile, and make them included in the dev-tools book
> next to KCSAN.

So this fell through the cracks during my May travel, sorry.

I've taken a look at it now ... it adds a vast number of build warnings:

Documentation/networking/netlink_spec/rt_addr.rst:28: WARNING: duplicate label rt-addr-operation-newaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
Documentation/networking/netlink_spec/rt_addr.rst:41: WARNING: duplicate label rt-addr-operation-deladdr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
Documentation/networking/netlink_spec/rt_addr.rst:54: WARNING: duplicate label rt-addr-operation-getaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
[...]

I haven't had a chance to figure out *why* it would have this particular
bizarre effect...

jon
