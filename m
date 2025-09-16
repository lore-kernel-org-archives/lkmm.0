Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76C2F7AA6
	for <lkmm@lists.linux.dev>; Tue, 16 Sep 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040492; cv=none; b=jr8iUvDNTzWE4pe29kaqwcZDPTTOLRMgpCYmP2Gi9BWkDf+308HU/zp8LmKfLBWgBjUwWpkUbIpYL9GMgMLXAZ4mlgOM+pJUxwn11loKll9S9rdw0Z+JyonhoT+UYioCWIG2OGNwgqhV35dzlUCNgdQagoIOSGBXJOsxnWiHI4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040492; c=relaxed/simple;
	bh=mc591n2IFDwS4D693R0/RLquDdE1ToRziX4ziM7KUeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OoxQ9hCNr19FBxfBcbdScXT0suJ/KxfPD3L0L7whSo8/7RWYit2U95XZy8b+XadrMprCW5XTe1k8DCE7iL7HzQzGCY9izITUZl0Zjd28/qk2GLCffC0bZj6szmDC5OIkJZdu49DEtcuJkFcq3ZRUJlf0THMsepCmpKOxT90uifI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KAegK/zC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KAegK/zC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AEB0A40ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758040489; bh=qZOzFdNdyXVISGU7+ACc2UyeP6gIXmqSlZJwg08TagM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KAegK/zCmWJYtBCLMhHG/hpMPjnB1U8BUdZPQhxJDX5oihb9/ne3hHBb+SsXWWSpz
	 d8UPAHX30UK6KGYbtWP+OjoHtuJ1CKgsXPiYksW3v/i5/vErtJITo04znMKlOrP0Wb
	 pk6hOVn2zBll1rRVpss6vEUD+/23MFy0aWBDklExV7PSBoC6SvdbjhEusOT0AvpTmK
	 nkex0ouIt1BSxZR4NDk1YKEfKh5k79pvqQ9aC2WX6QnZ7M4yTCB2VvFF80rvRic1UE
	 3lw16I4hDY91D1Rxey5Yl7/h7rs2zo9sYRPlWnjVPSB4aLQfeIn/BifbVp0b6W1BRo
	 e+qDpNgA3Eh8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AEB0A40ADA;
	Tue, 16 Sep 2025 16:34:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>, Peter Zijlstra
 <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Marco
 Elver <elver@google.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Ignacio Encinas Rubio <ignacio@iencinas.com>,
 lkmm@lists.linux.dev, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: Pull LKMM documentation into dev-tools book
In-Reply-To: <7ce84a93-5cbc-420e-894a-06a0372c52ab@gmail.com>
References: <7ce84a93-5cbc-420e-894a-06a0372c52ab@gmail.com>
Date: Tue, 16 Sep 2025 10:34:48 -0600
Message-ID: <87ldmee4pj.fsf@trenco.lwn.net>
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
> work due to the directive's restriction.
>
> As a matter of fact, kernel documentation has an extended directive
> by the name of "kernel-include::", which loosens such restriction and
> accepts any files under the kernel source tree.
>
> Rather than moving LKMM docs around, use the latter and pull them into
> the dev-tools book next to KCSAN.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> ---
> v2:
>   - Rebased on top of docs-next.
>   - v1 was intended to be upstreamed through Paul's lkmm tree.
>     Given the changes queued in Jon's tree where docs build scripts have
>     seen rather radical changes, upstreaming this through Jon's tree
>     sounds reasonable to me.
>   - Removed "$SOURCEDIR/" from path to the "kernel-include::" directives.
>     "kernel-include::" now treats them as relative to kernel source dir.
>   - Amended summary phrase. 
>
>   Paul, could you ack on this change going through Jon's tree?

Applied, thanks.

jon
