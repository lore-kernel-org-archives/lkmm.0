Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A921A420
	for <lkmm@lists.linux.dev>; Thu, 26 Jun 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952852; cv=none; b=UQfdsEoHLg7dUZK3EW0Ns0ftGnoGlQm2nbz6+rKFekIzH099o1aEG6WJm49PJlm7FhSJOOTI+vB9eSIF19c6f+2l1Bee1HUgnvhEuQLPUooGdtQWqHDqBgLWDhx2Kjy7x7vIA6eBFJdgT9ZuRjn19vJkf3LQQAAlqtnLTOdLNxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952852; c=relaxed/simple;
	bh=GWh6XhJMCVTqRA2wBhoPAZXgdLaG2+SShV0Fpkjiq2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0rbKO6KYXxGWEwqHL9so+a9Q/I2YMnHVfHUVrj9pWtpnT3s0xWtzZZFqbdfQ3NzKLQFcwiKQX10IpExU9PRQLNgmhoCBDg8uvWeei2hifi6nGQNLyFnIpAs86xzB3ZGDxn6Jr6M1CyrAC3U8EDj0E8S4FSZDq/LGCfqjQAqbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvyr5F71; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvyr5F71"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a44e94f0b0so16297631cf.1
        for <lkmm@lists.linux.dev>; Thu, 26 Jun 2025 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750952850; x=1751557650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhLqdfALuy79ecMu0yMGQplKZjT3wYfhZtz/kdHd2hw=;
        b=Hvyr5F71UpJXnhW8tB4IXJroHYnALcx63ML8c84BYCDcitI1immczbgzCdFwEsXLRk
         lyT6tQfpzRlMkx/s8nauiB8HdBzyEv5WzpvAavsYwBvrwyym3tMtpdSN/8TluOVbpJS6
         ux5UFTqRdJCJOGWbehX0+5WDtTMqf1AZQpd+RgZMrjxv4jKobKRM2lFx1plyOVjy9Dz4
         1KHCuDE6W7Wc9mcKpAONdx3MRFfmwEAht42F2AQfhL36sSR5C3KjXJmgfmSEunwUTe0E
         qTa/St95qBsJuZXA1j5yvboqnTZM7XPqHNx1z3jle9AOeJyevX5jjyZq+eS7fXxLw6DR
         jZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750952850; x=1751557650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhLqdfALuy79ecMu0yMGQplKZjT3wYfhZtz/kdHd2hw=;
        b=HDYvAz4R1LAMliUVxak8/E0Mewa41yrUl+h6WKF3b+AMVOXQp7bHYBNvzyv52DsoE2
         3qIPDnKsRHJa+oeEooom5659V77SJnYvYl2mM1nkyFuPle+oZwWwBZq2Dy5m2b25Y+S+
         0Dhgq4tADw4ntncf4WW5ChN737rI9/JkGMG6AUZJdphBOMJC0wH8N8MqCdJ6OR1ibvHS
         +alevKlf8pKlz67PGLBfGh29fO06mEieoPo4BhhZ5Os+lZNm4g5SlLdwcDhNp5ylgVcH
         MroBwMUVI+Pm9ei/cakIg7QSxa1jQPnpbykykGAPdv82SxLh7Qcxm4GbaLauefFY+qPm
         THkg==
X-Forwarded-Encrypted: i=1; AJvYcCVc9k4ZoFmrK55SGT8cC6c1Sqw99NY8ED1vjv43lTSJOPtdH7UYdSMzQz4KSGFokwqmQ28f@lists.linux.dev
X-Gm-Message-State: AOJu0YyDxoIVQb8T+DT6Rt2umj1H4R3B/oEzOzEk0oSHQOWZcoMWvX/h
	H23AKqog9Jwen+JdRVWgT/BSlKSM8CG7pzM8t3EeHJmdj2vh0e2nNr+I
X-Gm-Gg: ASbGncvJCCJj2RfcP4okMhh+tDzFKOcDEvcY0dEBcbNr9+r8978X72uuzV9+Q728n+6
	xXs/XRcy+Qparf4DkqNEdlvjaNkUr5sDpiPeNb5YwuNQgjHbm0HD0xed2H/k/UczozdB0eJp1VO
	32cbgCpoiLonyxUSuwFP3QRd3RzTRSZXqRYjyH7ggt7IHJEsVGS8uh5XLHsqfidAA91usQzaRjt
	ASV3WYsukgXQh1BX5aitGzNMlWLLQydQe5J0LsvbOopT9CpAYmOXjuZEIRUhReXtaEgFp9NUJux
	x4D/sO7U3jKtYWaXsEed3XThC+sWs3dUl1ZoXU6N14iybJF+6T1bOme87RrXKsYWSY9WLp73iUv
	xe6FrjTmivKZ/nDuEGjzGlSWiLZk6dR9ydCj8tgp+Q5NV0+Navx7f
X-Google-Smtp-Source: AGHT+IEOhCnZ8pLf+a8YISSrdtX9i9DRdF2aOmnf8k9SuaTDa5tYgK9sUyuwL4gFJ0WEU0fYrkJSJQ==
X-Received: by 2002:ac8:5815:0:b0:4a6:f57a:8638 with SMTP id d75a77b69052e-4a7fc92eb01mr944141cf.8.1750952849998;
        Thu, 26 Jun 2025 08:47:29 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57ab7csm623191cf.56.2025.06.26.08.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:47:28 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 928B7F40066;
	Thu, 26 Jun 2025 11:47:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 26 Jun 2025 11:47:26 -0400
X-ME-Sender: <xms:jmtdaOBhWCQr_1RoVYrLbkMaVl4xG_cEcfa_VyONpjmXUhO6i_bDyw>
    <xme:jmtdaIgIB6SW3O-22P0wL799HMZeTfdtkMyIkWmt1oPovWlft2zgoRDt020yT7ckL
    GB8ifg14p1LB9vrHQ>
X-ME-Received: <xmr:jmtdaBkqae0xmz4373Cz4FNzIVKXrpX4_EvAQtduxj8NulqnxuTj8K36Dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    ephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedtnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvght
    vghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepuggrvhgvsehsth
    hgohhlrggsshdrnhgvth
X-ME-Proxy: <xmx:jmtdaMzOiFP1auxdZ543LCBYDNuMIB9gJ3LwNG5oP7lYb_Bty_YL7w>
    <xmx:jmtdaDQZX0OUOQEZFDv0vi28epE9xJgmsNJ59H1rO_YRlWkr2-g9eg>
    <xmx:jmtdaHYP-fQI6gZcHUXW_09piY57gdLkATHY-HQRjlwnRhG3o94LXg>
    <xmx:jmtdaMQqVRnKLMPLXvi6jhibmrKKtUqVxl-HKNC1bbRCew7pMK_rYg>
    <xmx:jmtdaFAaELug5nmB8PlJJ2lQusAQ7LK3zw-X8I9UVjWj5Lhdi2V2A7Rz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 11:47:26 -0400 (EDT)
Date: Thu, 26 Jun 2025 08:47:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Breno Leitao <leitao@debian.org>,
	aeh@meta.com, netdev@vger.kernel.org, edumazet@google.com,
	jhs@mojatatu.com, kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 0/8] Introduce simple hazard pointers for lockdep
Message-ID: <aF1rjV8XQozi7hXB@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <aFvl96hO03K1gd2m@infradead.org>
 <aFwC-dvuyYRYSWpY@Mac.home>
 <aF0eEfoWVCyoIAgx@infradead.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0eEfoWVCyoIAgx@infradead.org>

On Thu, Jun 26, 2025 at 03:16:49AM -0700, Christoph Hellwig wrote:
> On Wed, Jun 25, 2025 at 07:08:57AM -0700, Boqun Feng wrote:
> > Sure, I will put one for the future version, here is the gist:
> 
> Thanks a lot!
> 
> > The updater's wait can finish immediately if no one is accessing 'a', in
> > other words it doesn't need to wait for reader 2.
> 
> So basically it is the RCU concept, but limited to protecting exactly
> one pointer update per critical section with no ability for the read
> to e.g. acquire a refcount on the objected pointed to by that pointer?

For the current simple hazard pointer, yes. But simple hazard pointers
is easily to extend so support reading:

	{ gp is a global pointer }

	Reader				Updater
	======				=======
	g = shazptr_acquire(p):
	      WRITE_ONCE(*this_cpu_ptr(slot), gp);
	      smp_mb();
	
	if (READ_ONCE(gp) == *this_cpu_ptr(slot)) {
	    // still being protected.
	    <can read gp here>
					to_free = READ_ONCE(gp);
					WRITE_ONCE(gp, new);
					synchronize_shazptr(to_free):
					  smp_mb();
					  // wait on the slot of reader
					  // CPU being 0.
					  READ_ONCE(per_cpu(reader, slot));
	}

	shazptr_clear(g):
	  WRITE_ONCE(*this_cpu_ptr(slot), NULL); // unblock synchronize_shazptr()


Usually the shazptr_acqurie() + "pointer comparison"* is called
shazptr_try_protect().

I will add a document about this in the next version along with other
bits of hazard pointers.

[*]: The pointer comparison is more complicated topic, but Mathieu has
     figured out how to do it correctly:

     https://lore.kernel.org/lkml/20241008135034.1982519-2-mathieu.desnoyers@efficios.com/

Regards,
Boqun
