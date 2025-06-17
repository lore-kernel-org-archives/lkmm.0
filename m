Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34DD2EBDEC
	for <lkmm@lists.linux.dev>; Tue, 17 Jun 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169410; cv=none; b=FfNrYrjVafcLFIPh3BnJLyO5ufmIAyVYP3y2kG8hHfbAW67jnlQhCV+swW2x4ep7dFori6POdsOKZoYbJYXS6PXRT+jhwr437LJCAXcyWen1O9ReMxK9WSyHeiVs2t/duXaFwOkLQxJzzWcO3ygZ8xA1aqsWYwPDiAQdH6T0ASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169410; c=relaxed/simple;
	bh=iyMKWm3mSC0FkjcF0R3622r5I8u9Cp5VpdkuiRTVNH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQHG+4X0A78y/BGHAEiH2MoNY4cWzSMp7ZM54ejlvtAE+TALjffpMzXeK0eIdLm5p7vqAk//0xYCfapEu1yQgtZnuwVQ1ny1m2aK1+j0ZvJ35w7Rd8r7qk3gW/r5x/j9L94uEKTyPf4DqL2nT8R3NrPcGcFuavKemKlT1E9RRYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR1B7xcF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR1B7xcF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so3219400f8f.0
        for <lkmm@lists.linux.dev>; Tue, 17 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750169407; x=1750774207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yIBACmWgX7l966LbMVSZorYkOqXPTghDqN6AWOfmEo=;
        b=QR1B7xcFKISdnn+LEwwdnVdTymd6oMSWKaaju/pjdhLR4jfzRM9mwyetgH4YCjrXjc
         gnfhj7IIOF+aG0tRgL/2+lrNTqe8SGkM1vKNt61U7Ak9LS8UCLiFmy8craOWH/1Lwyiv
         QVSBJ4t7BdhzmkvnV9vCHoaPEzkjAH4krHFxInMUHil4y5+Xm/KJOXRX4KyTF+drqDG0
         RtyLHKyt2rUTU/PetT/oL/dulejfmmjkyBMH+m9L9NNTfhcBRWgvC1qnODjoRntWeAto
         +6KatAOSsAu+uc9nAVJaiAbNaZn8m3huGfuHe33KSxpAzeub/9/Ls/K84SBCSc9pLu/H
         ExNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169407; x=1750774207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yIBACmWgX7l966LbMVSZorYkOqXPTghDqN6AWOfmEo=;
        b=FdKyb2YApTQ4Ha3SFIIsG/it1Jq2PqKjYbEfk46A4EjoYWr1z5AEkhPAmClkMYK3jE
         01UMoAS8ZGoWx1dn1eVc72t1BYW8QvEDjapGCZLvHrH1juI5fUtc235eEEPQreagIITm
         3wh9bC4aTrmqaTnp6UM2ldT0bjCjzS9UMyVlTrT8NuZiwe5rtXCyx1Vx1aUzp7Tf6Ob4
         fwAQDRF87YZWa3+KyMYwcncKahOdwkuWjZ4uJTOsOgH5r/YfkNvG1ZVGgytznxmAxO9V
         LlwzuRHhj9vu1zKU8R2nZC3FlpT3yS3hpkyltsel2Kx9SnU8cjO7e567a0nqQG8CuuOM
         tZxw==
X-Forwarded-Encrypted: i=1; AJvYcCXCCCTvvIpIGkS+bN3Wqhw7WIPjLkuo8ggSVMAEnN+DiY4WJBQFgoYWigvYbr6agFhZkBSm@lists.linux.dev
X-Gm-Message-State: AOJu0YwD4LsY/P6dveF8aqjoAiRaOI6SMQIEmfWL7nPEZ1e7WrbpHIo9
	1lHwCTwWjoHizUulaMXOOcnBFPRcYM08pkt24i3fPUYM5ZuDneYx9QTH
X-Gm-Gg: ASbGnctz91uPBLEDftevIzy/rE9/XVl3rhKBZ0MBbyWH/tJbqEoful8iY7bXEEgq3jf
	LSwAwIh5HfBZtwRe7irrzMKahwOtaZr5zgpIyVbEjkPvRSF06A/XgmmD2ZNPdOaUnfejR/lfQuK
	8JTs4IKPEVPVxsXe2DIRTKKj3z8YneaX19ZI5w7HFsrizrRKTkPL3AxiZtdmoRNnxbuNMQN2Rep
	t/YtrTCUegz3M+F1Uu/DakxoQpDvaz+98YmT2RUSxEHdD56nEwV6Zm1VqF6bllkEvbYmJqnfiko
	YQqyh90Tejp25YVP+WNs4hwsFGtehqzRN7dvj7eYm1wy0C+1/ozpYOSsRKus
X-Google-Smtp-Source: AGHT+IHhV6aPwQ3z4bGt2UdYrL2Uo5IQ2qap/P3r5HVqRrVdq5gQPZ8PvS+O0eqHB3HO/uSvbblRDA==
X-Received: by 2002:a05:6000:4024:b0:3a4:edf5:b942 with SMTP id ffacd0b85a97d-3a572e586f1mr11172093f8f.57.1750169406549;
        Tue, 17 Jun 2025 07:10:06 -0700 (PDT)
Received: from andrea ([217.201.252.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a577e928f7sm10557923f8f.64.2025.06.17.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:10:05 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:09:57 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
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
Message-ID: <aFF3NSJD6PBMAYGY@andrea>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
 <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>

> My question is: Do we have enough general knowledge at this point about 
> how the various types of hardware handle mixed-size accesses to come up 
> with a memory model everyone can agree one?

You know, I can imagine a conversation along the following line if I
were to turn this question to certain "hardware people":

  [Me/LKMM] People, how do you order such and those MSAs?
   [RTL/DV] What are Linux's uses and requirements?

that is to say that the work mentioned is probably more "interactive"
and more dynamic than how your question may suggest.  ;)

Said this, I do like to think that we (LKMM supporters and followers)
have enough knowledge to approach that effort.  It would require some
changes to herd7 (and klitmus7), starting from teaching the tools the
new MSAs syntax and how to generate rf, co and other basic relations
(while monitoring potential non-MSA regressions).  Non-trivial maybe,
but seems doable.  Suffice it to say that herd7 can't currently parse
the following C test, but it can run its "lowerings"/assembly against
a bunch of hardware models and implementations, including arm64, x86,
powerpc and riscv!  Any volunteers with ocaml expertise interested in
contributing to the LKMM?  ;)

C C-thomas-haas

{
u32 x;
u16 *x_lh = x; // herd7 dialect for "... = &x;"
}

P0(u32 *x)
{
	WRITE_ONCE(*x, 0x10001);
}

P1(u16 **x_lh, u32 *x)
{
	u16 r0;
	u32 r1;

	r0 = xchg_relaxed(*x_lh, 0x2);
	r1 = smp_load_acquire(x);
}

exists (1:r0=0x1 /\ 1:r1=0x2)
