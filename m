Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A229B8D0
	for <lkmm@lists.linux.dev>; Fri, 13 Jun 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813466; cv=none; b=ncII6yLquLmXEoeFKaNfHPne7mecAiVRW5DK3sn6IM2j0s6QUKIpamT8mIuBo7kfpQfdUlW0oB2GYzau4mvsG2XMdsaYPuDXvuL4nl1YlA+M32aZZLgHiR8UumH6XRQpwk0h2M/e7ly7oqSQdKzAjpUZsuWaMttpoCyDkfyutvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813466; c=relaxed/simple;
	bh=mtF/JE5cceh49XAD8mCMcwIGfvyvIyabnWCIV7upGnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHU+aQEoma0dkg5Tv+E3Kil3BZla8xD8lYVGgL9aFgKGO4wLpNp5JyBjV/g/79F8m1t+iPZV8xtfOcobcifFh1YKJgp4k3CV2ZbpY+YAL8g2JnBNx5QmS3qL/E2W+XV9i/KWVG840/+p83258BaAhc0kG3ZvohzbWeN5Xk7oxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSbUEc0W; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSbUEc0W"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade326e366dso344965866b.3
        for <lkmm@lists.linux.dev>; Fri, 13 Jun 2025 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813463; x=1750418263; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8+fb9d5SQqy9oK1PPSlfO90PRYcA6JQsTLMYgiTjNj0=;
        b=JSbUEc0Wws+ST4+b4CvzPi983mRcZzuCLG4lyyXz7YhRyyd+trSr8CJvGh4eTLEz2o
         RpERqTniDMo3Gy/E0/HmMkzcmZz8BA3rgcALfUIMa3V4SAJVQpAwm6WK/L9TyDV3Vw84
         LtlnvJo3xWVT6X0jKAA3Mwdrx7QMAjnof/6UBJmtQU1bj9Dd6dP8KCllEioWamkvxvOB
         GvpRQHus1XBObRGT7aiMlur/LkZ9frN+07AekR/EQLME1pDdAeADaEWH3rhKi1fdRpoB
         lSTXoRJ1UhVfYK5AtmDX7u98FjpyST6t1MzefkhR2kMVj+uXHqKGPoAahLdEaOA5BAV+
         SSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813463; x=1750418263;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+fb9d5SQqy9oK1PPSlfO90PRYcA6JQsTLMYgiTjNj0=;
        b=o7soVGwPAdwJ0+WOXYnhIV1/1tdpm1OgC1kGQQAOulmAeabpDxBhwY2UAjla3vKefi
         xSyYfS/xlV8z+TZ5XGUALi1XOU9QFSCS+zS/lFiYTp+xEFXAQVEurleYhVzcR3umXk9y
         DiMFxkIRG/9RDjiuk8NKy4NcaMLZwuEU6X0atVrLvVEYrw7z7BEVmH1jBdhyUCLhEPPp
         b7hitbG3uc8yN9tg4cI3oVg7WDBJgEuDMZ5l2ZJHDtQl8C32wcudwxk7IzDdR1XA7u/Q
         lxQJwdcPlruhW7VtyxYToScaigrUBuW1DzPNkX9IrEZSavJOzdd57ClCW+z9rAKGNSw5
         sOIA==
X-Forwarded-Encrypted: i=1; AJvYcCVCLRVOSwbYs309yQ9g7V1WCqtaga1WcpqPErRU3+p9ok9DNuquFEmkPmBy9PKjsqutFcWb@lists.linux.dev
X-Gm-Message-State: AOJu0YxG6wh5T8+VDtGXsaIslCBGRQ3bVfQMF5x5QbCuTpHfg/E5Km+v
	UeqkZkEfAEdKsJ/gEKcMQYmnagWks/+RN6kPNe1MAYJmcWI4jzL18moc
X-Gm-Gg: ASbGncvwhHKb/Xdc7CnTlOWibFXRar7UnJ2/Ba3iLXRV0KwWF1Yy/aow5UBvFDUaFz0
	aBZewrFF59YXYAkIdVeEmCN0K0EEgPI/9EZlJVAZwzUzd5rA64Bc3i4Y2xiFShSlrW3LbwB/11e
	rudtCErTp8RzkPcp7h8dT8biiW08jMSenTCUMeKUWLrpuINjxSqdBbZdCPHGHmYl6Ndi6Gy33zj
	avRbwQadIzOFfNWvlZVBmR1Mw4t82D1m5ho7wBMrptN/FX+fwFTyfH8KDzaSuGuv6Hw3ajrmBUG
	4Tyef+7MNAoA8sU0wXn5WWz0gvFKCAkReuL42WFkTQRu9BhU4AFn3F2BPw1lJzxlhOc=
X-Google-Smtp-Source: AGHT+IHD9r74C7xCLAz3JGGdVxDJf0xcuJg/kr2xZ/X1ScLL8ZDs5GnXZ/FyZz4Me7DM9dGuAUcPBQ==
X-Received: by 2002:a17:907:9496:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-adec55030damr273383466b.18.1749813462723;
        Fri, 13 Jun 2025 04:17:42 -0700 (PDT)
Received: from andrea ([31.189.73.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8979563sm110704866b.158.2025.06.13.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:17:42 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:17:37 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Haas <t.haas@tu-bs.de>, Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <aEwHufdehlQnBX7g@andrea>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613075501.GI2273038@noisy.programming.kicks-ass.net>

> (snip the excellent details)

Indeed, joining in praising this report -  Great work, Thomas!


> > ### Solutions
> > 
> > The problematic executions rely on the fact that T2 can move half of its
> > load operation (1) to before the xchg_tail (3).
> > Preventing this reordering solves all issues. Possible solutions are:
> >     - make the xchg_tail full-sized (i.e, also touch lock/pending bits).
> >       Note that if the kernel is configured with >= 16k cpus, then the tail
> > becomes larger than 16 bits and needs to be encoded in parts of the pending
> > byte as well.
> >       In this case, the kernel makes a full-sized (32-bit) access for the
> > xchg. So the above bugs are only present in the < 16k cpus setting.
> 
> Right, but that is the more expensive option for some.
> 
> >     - make the xchg_tail an acquire operation.
> >     - make the xchg_tail a release operation (this is an odd solution by
> > itself but works for aarch64 because it preserves REL->ACQ ordering). In
> > this case, maybe the preceding "smp_wmb()" can be removed.
> 
> I think I prefer this one, it move a barrier, not really adding
> additional overhead. Will?
> 
> >     - put some other read-read barrier between the xchg_tail and the load.
> > 
> > 
> > ### Implications for qspinlock executed on non-ARM architectures.
> > 
> > Unfortunately, there are no MSA extensions for other hardware memory models,
> > so we have to speculate based on whether the problematic reordering is
> > permitted if the problematic load was treated as two individual
> > instructions.
> > It seems Power and RISCV would have no problem reordering the instructions,
> > so qspinlock might also break on those architectures.
> 
> Power (and RiscV without ZABHA) 'emulate' the short XCHG using a full
> word LL/SC and should be good.
> 
> But yes, ZABHA might be equally broken.

RISC-V forbids store-forwarding from AMOs or SCs, certain (non-normative)
commentary in the spec clarifies that the same ordering rule applies when
the memory accesses in question only overlap partially.

I am not aware of any "RISC-V implementation" manifesting the load-load
re-ordering in question.  IAC, notice that making xchg_tail() a release
operation might not suffice to fix such an implementation given that the
arch has no plain load-acquire instruction yet and relies on the generic
(fence-based) code for atomic_cond_read_acquire().

  Andrea
