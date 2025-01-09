Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6186AB677;
	Thu,  9 Jan 2025 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455038; cv=none; b=ToSBSmvbEqQY8TGWOZGu7X8lD8+vEB+j6uKYfmAczhJqoMK01vtq7VpWS11+Xq0jt1jr2S0F2+PHJxdJnwLSM0Wx5PMiss4szkqRIHfI1vEQyWqWIN+woB4JQbbSWe66+znAgG1U9TsyWggQJuXYtdA4lcg5qmbUNLSzKNPcbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455038; c=relaxed/simple;
	bh=z9b5Yb4jv/VQCNIoXZP58QzOKaW4I654nfL/YmeaiJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwx8y9XaKgi+FPZqarRjgVkoLo3FJBGQw5MgEKaXyPMHH69FtRmmfDpKKNwGVCy1BDTOSXYNPbkRpP/Meo0jGlNsdmm730JrTZ09WZtdTrqkSrhdCGVhtTrB5dAmKrvOjo1QuV1M1WUOI2puAGaZB7ln5YAFOBVzN8azYnZuRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g5jDLlBl; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g5jDLlBl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JVxE9DGju1My1pUbfbr6NyCexgMpzFnfl9cyQHPEpjA=; b=g5jDLlBlWbzwFV5aiiQghquWjp
	KZj3vKtGwn5lID7dEiwHX3kudYmG5YJkqOsFet3B608DZ2WU9CtA+ig9n4QShEmAql0ksVfctUwly
	U1oOFnjdHCDa7siRAesqc86+K0uBK4gkTpXvgnNzaEcU1+BkEaSSaRb0qGzZP1g5tu+C1b2Tng25K
	O8LZGzWOqTV5Qu76V5wn24GooIvimUX6E/fG7e51AQLQ6uG77/lLhk+zDte42cVnHWjAW52+Hv2OR
	URg5FrBGWRAdBoz4t/1vCzFkXEW6+B0kAQerF1DgwB7cpQ5SDSnAgq+HHl68NeQ0Du1QJWqgKrfW9
	WBoA/UrQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzHB-00000008XJQ-3oAb;
	Thu, 09 Jan 2025 20:37:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F15253003AF; Thu,  9 Jan 2025 21:37:08 +0100 (CET)
Date: Thu, 9 Jan 2025 21:37:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
	will@kernel.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <20250109203708.GA27200@noisy.programming.kicks-ass.net>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>

On Thu, Jan 09, 2025 at 09:54:28AM -0800, Paul E. McKenney wrote:
> > P0(int *a, int *b, int *x, int *y) {
> > 	int r1;
> > 	int r2 = 0;
> > 	r1 = READ_ONCE(*x);
> > 	smp_rmb();
> > 	if (r1 == 1) {
> > 		r2 = *b;
> > 	}
> > 	WRITE_ONCE(*a, r2);
> > 	smp_wmb();
> > 	WRITE_ONCE(*y, 1);
> > }
> > 
> > P1(int *a, int *b, int *x, int *y) {
> > 	int r1;
> > 
> > 	int r2 = 0;
> > 
> > 	r1 = READ_ONCE(*y);
> > 	smp_rmb();
> > 	if (r1 == 1) {
> > 		r2 = *a;
> > 	}
> > 	WRITE_ONCE(*b, r2);
> > 	smp_wmb();
> > 	WRITE_ONCE(*x, 1);
> > }
> > 
> > 
> > The reason that the WRITE_ONCE helps in the speculative store case is that
> > both its ctrl dependency and the wmb provide ordering, which together
> > creates ordering between *x and *y.
> 
> Ah, and that is because LKMM does not enforce control dependencies past
> the end of the "if" statement.  Cute!

I think the reason we hesitated on that was CMOV and similar conditional
instructions. If the body of the branch is a CMOV, then there no
conditionality on the common path after the body.
