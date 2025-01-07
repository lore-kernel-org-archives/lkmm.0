Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FF1E0E13;
	Tue,  7 Jan 2025 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244389; cv=none; b=PDCW66dh2oimZZrHpEDZWK8vmcuphfyDL3zbRbPgMPS6DJf7HNCLMY/mYGPNgmx1dWsVp596CzaEBzByIa1J4MIvwt2Im4kxEg7AU/rVzAXGJajm2fuCvo4w+1YE+Q7HDgnhA2OLBYBg60Muiug8MfKtldF2FtfnDzJ2RQeCjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244389; c=relaxed/simple;
	bh=klqYF5fHVmjwPIB1XdfxsX22GMm3n8G0oQimQZlI8WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLIShFaT7kf2I1jMVBUk3BVR3WNe2lmHNjBGBd2x9XbP7ReQSpMoNl2qY5it0J3F6L9gkMIpvBDyYhq47W4QoZ5JTFm9q6sJyslDPGIiVbAdSN7O2yqUHOHpv3QqtbBqAvfVqaUHiSXlHwZ66JknTe35fnUoKqatp6Sbmp8kM9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CaK6hUh4; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CaK6hUh4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TOLssUkDrxOaN2UlB5vBlZtWXV9KN4Jfn+EMGTcwZLA=; b=CaK6hUh4ZsyWmrmCgrg39kSl+U
	3bsWTVQJJOHtaGcI5PWHvWhmrPDlYbI/6V+VQQ0OysC56XZEG138Kv7QFEg3qY/ImBZ97064cu7i9
	3RSMZiWqLGXAffuio3KyH+CAcUK0hDVbtCvjWY0utGEvnvFjztQyEYqjbimyL3opsWNa0U+LUDNKD
	SZ4wzjfRvRmVDZbMRQ6zdz+dV3R7mVU5F5xdoNUOmr6Cd4cgT+esAY3/XQMAYireobqlXVIdI86gf
	crpxyYidonqlkH3RV85lK4jQTee4xEL04OnvTJptPrCbtmRvu26TRisCKBcQ0G9iaBV4J9+KSGMI0
	YJr7Kg0Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Ta-00000005my4-2yr8;
	Tue, 07 Jan 2025 10:06:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 420B930057A; Tue,  7 Jan 2025 11:06:18 +0100 (CET)
Date: Tue, 7 Jan 2025 11:06:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
	will@kernel.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <20250107100618.GK20870@noisy.programming.kicks-ass.net>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>

On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:

> We first discuss why the more standard definition does not work well for
> language models like LKMM. For example, consider
> 
>     r1 = *a;
>     *b = 1;
>     if (*a == 1)

      if (r1 == 1) 

?

>       *b = 1;
>     *c = *b;
> 
> In the execution where r1 == 1, there is a control dependency from
> the load of *a to the second store to *b, from which the load to *b reads,
> and the store to *c has a data dependency on this load from *b. Nevertheless
> there is no semantic dependency from the load of *a to the store to *c; the
> compiler could easily replace the last line with *c = 1 and move this line to
> the top as follows:
> 
>     *c = 1;
>     r1 = *a;
>     *b = 1;
> 
> Since there is no order imposed by this sequence of syntactic dependencies
> and reads, syntactic dependencies can not by themselves form an acyclic
> relation.
> 
> In turn, there are some sequences of syntactic dependencies and reads that do
> form semantic dependencies, such as
> 
>     r1 = *a;
>     *b = 2;
>     if (*a == 1)

 r1 again?

>       *b = 1;
>     *c = *b;
> 
> Here we would consider that the store to *c has a semantic data dependency on
> the read from *a, given that depending on the result of that read, we store
> either the value 1 or 2 to *c.
