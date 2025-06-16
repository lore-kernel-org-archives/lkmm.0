Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D292BEFE6
	for <lkmm@lists.linux.dev>; Mon, 16 Jun 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083076; cv=none; b=Ns4IijEV0rrSdNPfJEvBRh5nONvG6OXTx8XZKjJ4IkgTZwpfc7E+o9Y6S+x/IYUgbJRjWXWMw3eJSrAQMkG4aTMVqGdkSw3VJKABlh7YX5Vgj2uUtiAO4i0mrXS7Lx/opD8WlXEP8J8CozXsIEnOPHQZvu18GlJTAslwsOTvJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083076; c=relaxed/simple;
	bh=zoPlTkoZZmJtHvxgje6uQdW9GgwchQlmybNP8yjwaN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWYZZ83qmnWWnaYRdNy7dIVKAEbDj7a1dJNneCxYTtn3SWZ8SNgA2QDUSdCtPtRggZgmIjf9Tjr2F2S9INEs4J2Hq4YZpnUElGagThtdJqTmx8YKZffS6GUL1sFmZhocD4H7KGfeWwcOdps74qO/gfr1EoGrMnPVpifpwsYBiow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=D+7kXLbh; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="D+7kXLbh"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5675dec99so566178785a.0
        for <lkmm@lists.linux.dev>; Mon, 16 Jun 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750083073; x=1750687873; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOggq/KPowkbkENDJnGOHpXXvgQx4F56FAixym3bp2M=;
        b=D+7kXLbhFzmga39VRR49vrr3A5cTs2TFhllB0Fgq3eKVCc6DOkKn96ZntiMaM7ORgV
         yxaXZIaTIRrD7qqP8hpsF7hl7DvI3+vzy5QlA4R97Nf4iHJtXtqz0cNQvgssSh4DgHvC
         dxiLA6kN5fLbM5KZiD9+OpZzl+nGVr0TfHkPHehjPguVQ+VI1JZsBicMZmOt+DlgSup5
         v+mc/19lY139yj+vOaG8xiknWDB7KtGC2MpOCPk5+1istaCGQMigEXRTgTca3itJ/S4J
         ylQuDFfECimTCcOtffAvVDu6NaJgd1JXahEt3/medjjbSFRJmho4i3QdWuHbcHRskh2J
         Gf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083073; x=1750687873;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOggq/KPowkbkENDJnGOHpXXvgQx4F56FAixym3bp2M=;
        b=QBViyXCnu8TP1G4eHkpZ5Omyiw0TvSGIo7yGocAA4bYisQ7S/qdkuAClOh5HM4au4r
         xz4BPBxFDBhhMz5JE2NeELAL8i5T746xO+rhFZGDkKTLkQxJKhRdPwTcqf+hJzRxQB2S
         Wo2DKw3wN6Z5psSlLX+kjOhgBDAip3uo15q5CDxH3J/tebFgjVTLyg1h6C6xzlrS7LoY
         FG2wxDJ25FC4bOpcIzvRHH15tlprHgQi+oHLweI5HkE4sUgOi6JKj59QpG6E+k5yqk3e
         e0Bpo/Ao1kM5HOK7pf8svHTRpx9ZV23+lDX7ISX0/nzVJJCEHtvKPHqr5rDM8Vi/HK29
         4CDw==
X-Forwarded-Encrypted: i=1; AJvYcCUMyuXw4iEIqUlV3VbWpn8QboOnEg/HyOBJluUUikxC78eClq4JCbYmvqz/e/e27fr7SSYp@lists.linux.dev
X-Gm-Message-State: AOJu0Ywakh4W55bi3u4l9feiTtrANbU82nOk2Mwc3/xls0b2VlbToT1b
	hA4f/oOv95nYrieHtLCmt5AnHvXTTEKgzrIjr37CmKg1qVcFlVxCKAwaXo5jRtYL6Q==
X-Gm-Gg: ASbGncuvZIjWdk8aKTYLa4x6zGclQ+ConasPc3JovdlRPCCMhcJfS55s7sShhNplQc1
	575XKTACvT52MzD7+Kxa+P4lkUWJDYgKorF1HAXZVDqRvZU2dcNX/9Xd6d6QXdWfJcKmK3fpQEZ
	OC1snhIoSR1uJDBgTicfWNbQSTUsIWDlCkGe8TFOEEcjPYuAFoMGafzLpRPliITaz2DwbKyzJrZ
	46MX5PGAZf/x3EV09KHczXpNyBTvj3Z4QTBOU236iBFPtlqhs/wf2V5Gh9f5PKA0qhV5Uujg6Ri
	96QnbePqCPxJq53WtxJthUpuWslikKIORtIVOjaUTnnEPzUaEQ/3wevZI/KPMbo0hLQ0G+/UOUV
	BY2rr
X-Google-Smtp-Source: AGHT+IG/Q8oqK3NAs6JYHlzNOnNjSakbP4l5bRaZECFc8nTtdEfQzpzqsQ4tpcjcD5JM5xcRL5wrXQ==
X-Received: by 2002:a05:620a:390a:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d3c6c18fcdmr1653377685a.13.1750083073152;
        Mon, 16 Jun 2025 07:11:13 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe347sm530784885a.36.2025.06.16.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:11:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:11:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Thomas Haas <t.haas@tu-bs.de>, Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aE-3_mJPjea62anv@andrea>

On Mon, Jun 16, 2025 at 08:21:50AM +0200, Andrea Parri wrote:
> > Thanks for the praise. I expected more questioning/discussion and less
> > immediate acceptance :)
> 
> Well, the discussion isn't closed yet.  ;-)
> 
> 
> > Maybe one should also take into consideration a hypothetical extension of
> > LKMM to MSA.
> > I think LKMM (and also C11) do not preserve REL->ACQ ordering because this
> > would disallow their implementation as simple stores/loads on TSO.
> > That being said, maybe preserving  "rmw;[REL];po;[ACQ]" on the
> > language-level would be fine and sufficient for qspinlock.
> 
> On PPC say, the expression can translate to a sequence "lwsync ; lwarx ;
> stwcx. ; ... ; lwz ; lwsync", in which the order of the two loads is not
> necessarily preserved.
> 
> MSAs have been on the LKMM TODO list for quite some time.  I'm confident
> this thread will help to make some progress or at least to reinforce the
> interest in the topic.

Indeed.  I was surprised to learn that CPUs can sometimes change a 
32-bit load into two 16-bit loads.

My question is: Do we have enough general knowledge at this point about 
how the various types of hardware handle mixed-size accesses to come up 
with a memory model everyone can agree one?

Alan
