Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650117C91
	for <lkmm@lists.linux.dev>; Wed, 23 Jul 2025 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753290821; cv=none; b=N3phrvsddWIxUALTdzMmOnEDzL4C66iBPTGzvnlI8PbFpkIk+A+ZBfdYruNQRqb0h+lEijbPQLJWAZysR2NjE/OfGPXFvfdj0ipe7wlquWHX+zsEUIG9UgwUXU9ryDb0pwpovsxHzgceY+mdhQtxvhB59h/hhXhryIBm6BrwdME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753290821; c=relaxed/simple;
	bh=02phW/kJoqrTRvi+SiCfo0sg0dwIafOxxOfUn4ZtSEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ome4FlmY9lR0dGh5RUDmu9TZ/f131JI4uSkqjt/8v01OsY58obHjtT37KUXe+3pjCYaF2esG16XW8kT7w4t3GOTvXJ+Cwv3eNz4YnqdDOd4gJkI2JUS5Ozwq0UnofcF5EWj7b3GxKcB8kqT3xeOEBA6SNfD+f6mTpCI8MmC8bYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rGrxgMRL; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rGrxgMRL"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e278d8345aso17364285a.0
        for <lkmm@lists.linux.dev>; Wed, 23 Jul 2025 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753290818; x=1753895618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfPJ1KI5q6cIQ1/grhOrHOy9FqylsuGFeadXkjjdSH4=;
        b=rGrxgMRLS2RDUZucrTt0unqi94n5dQ84MezXzUbnSXk6F8s5pHFJXa9hOrHB+cXLFQ
         rBineDsGyE7BhZVr2DIr8s8S/Uj7IYbyP8P4CzHrfcKyhXg2Q5tnoaxaJeH/Rzq4AfG+
         Ev2ftHBewXn+qZRThBxw5d7ceBX/oRvQYQ8XifMosFgw1MM0ERQZwY3sZAhZ7IhFnd7B
         eyVfpcXkhNAh2QmMM5RakrXtQnhSFHQxPOnbskxXbUQ9HSYv90u+WLMI5NylbxwKQKNb
         oGOBkwh1o4x8O6RcaygoObRmDBjFpROloVS9GD7QnYQVOWBrkmovVqgpjnj6qwkTzgNO
         St1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753290818; x=1753895618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfPJ1KI5q6cIQ1/grhOrHOy9FqylsuGFeadXkjjdSH4=;
        b=jsp0ZK1qK9SLnLURspBU0No/NdnRxUHfpxcRKqYmWEz6PPJHybg/EalmqAM3bielEK
         5GP9l60vqY4+NSUFxGfb8UtCNRnW4e6a2lneOQR/34udM7aYvIEtTzlXCbMLdtWmoNdq
         82wEJy4mtWNM6+KvRp2GF/efEBkwFMFYuPfp6I1PAm+IwtlXu+vI32hX+9zRR6P2LVkp
         1wbFumyhX3dCTDhfYOgjoUcmluiZQttgVIBcx5AyMrI5kP3trtwC1+H8JKwG9aRwefyO
         e5BeQQHInmn6z0meDxaCs9jVB7W4Wy7M9GFZbLszUK2k5/1h0SnZlb/UZsJXj3w356JB
         zETw==
X-Forwarded-Encrypted: i=1; AJvYcCWA/svl7RvSYVcDbmYwLijyMY9RJOyU6V/ZoFjLYYU7X0QE9kNX4vZ1IFw0zimqlztOfxui@lists.linux.dev
X-Gm-Message-State: AOJu0YyYcKoWeEr3A9ilDykS1wTk2SYXABDeaSO+i7dMpmZWo2HBq9Zh
	GaFXKm6L5YUx4MYykgvysM9y5+BpMyAKHra5apNrZGsoA7Qx+Nl1s7v96emTTK913wS+ZZT0rWO
	Mj1Q=
X-Gm-Gg: ASbGncuCKMbwmLgZDjP9zRY5LtcUmtWQIJpihWv3l0CRrHj1FojLN1lGIanwqO2O4nt
	2of7iAiYP/VRCoBmOyvpr+8V7+gRT2/2Hy4C+rCfFRDSxWrgNyeMHVpMqLqnmgwIFHkSmUxd7wc
	aIZY1r6IgR8qKWWjiz1Yiuny0ed0VPA4qByzLw8IwER7lZ2mtM5swjXX04xAkQLqT6h5GJS6z4E
	fdvffjLHOM+xQ0MWS0xwZIpqgtJZifWnX5sKguUNVr2VzDGIvD3/lmlurdNTd8DmC3fER7o0YLW
	aoogl6GErVkrx6ic2s5uJg/x3UnzcHgZnYvXyVE/g7ZszU3fdWXN88AwEQ64aH9Eytfy9BlrNIw
	XThbTXyofWX0ftOqTNtw8zTroQxlK8syPYlIz3ihsOkWCcAJf98Ky/O6/x0hnZjpvXQ==
X-Google-Smtp-Source: AGHT+IHGdwf01nnbSYZJolJcE7oNtlESdrTKJFxeHydgcJvjRDFHZh43mFdvETydOI903RgS12ueDQ==
X-Received: by 2002:a05:620a:9c7:b0:7e3:3c02:ee8b with SMTP id af79cd13be357-7e62a1910femr416771285a.43.1753290818371;
        Wed, 23 Jul 2025 10:13:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:3d4c:de64:63d3:50b5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356b62e63sm684966185a.47.2025.07.23.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 10:13:37 -0700 (PDT)
Date: Wed, 23 Jul 2025 13:13:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
	dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
	quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <abafbf9b-d13d-4389-82fe-501810388a10@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <6fb01aea-f7b4-4f38-82b9-fd6c360514fc@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fb01aea-f7b4-4f38-82b9-fd6c360514fc@paulmck-laptop>

On Tue, Jul 22, 2025 at 05:43:16PM -0700, Paul E. McKenney wrote:
> On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:
> > The current LKMM allows out-of-thin-air (OOTA), as evidenced in the following
> > example shared on this list a few years ago:
> 
> Apologies for being slow, but I have finally added the litmus tests in
> this email thread to the https://github.com/paulmckrcu/litmus repo.
> 
> It is quite likely that I have incorrectly intuited the missing portions
> of the litmus tests, especially the two called out in the commit log
> below.  If you have time, please do double-check.

I didn't look very closely when this first came out...

> --- /dev/null
> +++ b/manual/oota/C-AS-OOTA-2.litmus
> @@ -0,0 +1,33 @@
> +C C-AS-OOTA-2
> +
> +(*
> + * Result: Always
> + *
> + * If we were using C-language relaxed atomics instead of volatiles,
> + * the compiler *could* eliminate the first WRITE_ONCE() in each process,
> + * then also each process's local variable, thus having an undefined value
> + * for each of those local variables.  But this cannot happen given that
> + * we are using Linux-kernel _ONCE() primitives.
> + *
> + * https://lore.kernel.org/all/c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu/
> + *)
> +
> +{}
> +
> +P0(int *a, int *b)
> +{
> +	int r0 = READ_ONCE(*a);
> +
> +	WRITE_ONCE(*b, r0);
> +	WRITE_ONCE(*b, 2);
> +}
> +
> +P1(int *a, int *b)
> +{
> +	int r1 = READ_ONCE(*b);
> +
> +	WRITE_ONCE(*a, r0);

This should be r1 instead of r0.

> +	WRITE_ONCE(*a, 2);
> +}
> +
> +exists ((0:r0=0 \/ 0:r0=2) /\ (1:r1=0 \/ 1:r1=2))

Alan
