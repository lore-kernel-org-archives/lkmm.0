Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9632038DD1
	for <lkmm@lists.linux.dev>; Wed,  8 Jan 2025 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736362033; cv=none; b=YVW9A49pu/PT1cDHIHOtyCkPdEpKRphhMeTFhcb/ScmP9lWT8MZ7wFEaa3OVlhN+nrkPCQheSGFNgoLdPlJwzvCaIc0TB7NP9KbOXXBjs7WrTcm5MiQrEHJE6+Tf34YcBKlPOShJwMsuefeIYidZKj7cPXdGhZuOLQwDzswmoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736362033; c=relaxed/simple;
	bh=r+MK02N0q2JhRiJHDtEQPKV77yBn9x4DINOKeM9Vxr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwzxPCg0MD3mS9a/Mp4X7yl2NwXDz9tF7cWo1MiCom16/dov41sK3ecVKtM57y7GBag/hVogmZyH8CdJhkZ5uGsNQBqA4R/E6saHnU4pG5tt3ikdzJujLnNDw7p7JoJ5LBjV0ls31xavJNkMW5r8ptmUk9XhwWiT7KUayIF/TS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=u6kggEu8; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="u6kggEu8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467a6781bc8so165551cf.2
        for <lkmm@lists.linux.dev>; Wed, 08 Jan 2025 10:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736362030; x=1736966830; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zkoqut2i8gHq0oWcrLljUgu7v9PxrPGBIAkMOXgkm8U=;
        b=u6kggEu89uzEyJo6bQhADHUTNoIw6w6tqMUOudYYr0m69dn+AGJBG+Psx6IO5GT2Kw
         78O7saAJCSHYJ5oDEp44V9bgWxR8rsFLwU8wuT9wnIz0bqClsq6jI/0KINW8qIyiUmZ8
         6ZGuctvIxBN/+KeMvzAOvXDn+pgU2h8ntQ1BBrwgv/jY1cE578BlweEo8CWXZqDidJdj
         QsKQu7569bLZQ8ylyzs5lhiFt9vC/mmt7PkacMAJW+uc9xdUKeQGDTdX37phTYSbFuSc
         kvQ1paUkrOmN5eWwBQyLDPcFYpIhavbFKbDFhuLzWIjRL88rc/360/jYuUZRta7aaG7S
         vszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736362030; x=1736966830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkoqut2i8gHq0oWcrLljUgu7v9PxrPGBIAkMOXgkm8U=;
        b=N14vdUMkaUE3DIxggLQFhzrPa6oBOQ+ONlUZj+Zrc70TSZwULgYewr9OKBvCoLBPcu
         3/XvTPVwbMUpDyDS5qrguj0b1wUsz4K2sVIrQlzqgZig/0I0s/vY5kBfQp7ydrKlw8gq
         7/TGy6CxSAGZJ4fOTROlmAplfpWF9vxuf/kCYXwOxXbYoUPs6Izb8BbuOeTf5O/q4cGb
         HpC4y28YYZZlF/ApY1V+X9xNH+KOHZAGa3KAeS6OxFv7nnR2yHPb+TJ0xs/AkSiB392E
         gHmIfVUkEfvyd3kH3xcRSDvhkqfcY6/uzJDcNMstMmP+LnxFxRlhC9pccQE0hEun9ccN
         vjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy/qy0j3bHm/JMWWn/t9av6jsXYpVduX6XfAZfHbQ0AbiXK90gn28PtWerIVGZ7jac+TYX@lists.linux.dev
X-Gm-Message-State: AOJu0YwXzDQ1wsn4j/6PTUecHvA70VAtTleI31MwKEqjEY77W3y9q28o
	zW96ZplJx5qpSYKvnULJgHCJjGovnmiY+mFaje6yQvWeYA22bWPcwmIY1BIeFw==
X-Gm-Gg: ASbGncuzJEktIbxlI56HdRVIXe3UT4vx7kgxI42dsiBIf9+3rDNOeAp45lX8jL36QVV
	sOXI4x4DVnZ7hZkxtVFFZRbrEXsriEE86t+XWZHZCW7TtL77IQ25fkyP7oBzgbVX9U9DZvKj4wE
	BK5608Av4GGhnj1K3uBEiAt9707uajMgwE94QlMrLw9+sQ+WI7AtUM65rf6dj4t0FP4MpLsXhhj
	Zf3he7dOjzPS9x6mIzi9NcRTC76MFSz90VPCihGbSQOKgkxQPhCw6dYFlcu4eq+25jk5MYcoVwh
	jw1Fp6Url+GyLyfg0c9FMJ2VSDsLG//ICbLF1l9aXjTcYEUIHA==
X-Google-Smtp-Source: AGHT+IEDcKvxiVgIhHX7HQrw1a6Fw+EvfA7gq/4fIXrr3520rT3qoCGrWfm1jRCmjWyCp7IpYOK5hw==
X-Received: by 2002:ac8:58d0:0:b0:467:7cda:9375 with SMTP id d75a77b69052e-46c71026185mr55879441cf.24.1736362030579;
        Wed, 08 Jan 2025 10:47:10 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6813eesm198267611cf.35.2025.01.08.10.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:47:10 -0800 (PST)
Date: Wed, 8 Jan 2025 13:47:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>

On Wed, Jan 08, 2025 at 06:33:05PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/7/2025 um 5:09 PM schrieb Alan Stern:
> > Is this really valid?  In the example above, if there were no other
> > references to a or b in the rest of the program, the compiler could
> > eliminate them entirely.
> 
> In the example above, this is not possible, because the address of a/b have
> escaped the function and are not deallocated before synchronization happens.
> Therefore the compiler must assume that a/b are accessed inside the compiler
> barrier.

I'm not quite sure what you mean by that, but if the compiler has access 
to the entire program and can do a global analysis then it can recognize 
cases where accesses that may seem to be live aren't really.

However, I admit this objection doesn't really apply to Linux kernel 
programming.

> >  (Whether the result could count as OOTA is
> > open to question, but that's not the point.)  Is it not possible that a
> > compiler might find other ways to defeat your intentions?
> 
> The main point (which I already mentioned in the previous e-mail) is if the
> object is deallocated without synchronization (or never escapes the function
> in the first place).
> 
> And indeed, any such case renders the added rule unsound. It is in a sense
> unrelated to OOTA; cases where the load/store can be elided are never OOTA.

That is a matter of definition.  In our paper, Paul and I described 
instances of OOTA in which all the accesses have been optimized away as 
"trivial".

> Of course that is outside the current scope of what herd7 needs to deal with
> or can express, because deallocation isn't a thing in herd7.
> 
> Nevertheless, trying to specify inside cat when an access is "live" --
> relevant enough that the compiler will keep it around -- is hard and tedious
> (it's the main source of complication in the patch).
> 
> A much better way would be to add a base set of "live loads and stores"
> Live, which are the loads and stores that the compiler must consider to be
> live. Just like addr, ctrl, etc., we don't have to specify these in cat, and
> rather rely on herd7 to correctly .

I agree that determining which accesses are live (in the sense that the 
compiler cannot optimize them out of existence) accounts for a large 
part of the difficulty of analyzing plain accesses in general, and OOTA 
in particular.

> If an access interacts with an access of another thread (by reading from it
> or being read from it), it must be live.

This is the sort of approximation I'm a little uncomfortable with.  It 
would be better to say that a store which is read from by a live load 
must be live.  I don't see why a load which reads from a live store has 
to be live.

> Then we could formulate the rule as
> 
> +let to-w = (overwrite & int) | (addr | rmb ; [Live])? ; rwdep ; ([Live] ;
> wmb)?
> 
> (the latter case being a generalization of the current `addr ; [Plain] ;
> wmb` and `rwdep` cases of to-w, assuming we restrict it Life accesses - it
> is otherwise also unsound:
> 
>  int a[2] = {0};
>  int r1 = READ_ONCE(*x);
>  a[r1] = 0; // compiler will just remove this
>  smp_wmb();
>  WRITE_ONCE(*y, 1);
> 

Yes, and we recognize that this part of the rule is on shaky ground.

> )
> 
> The formulation in the patch is just based on a complicated and close but
> imperfect approximation of Live.

Maybe you can reformulate the patch to make this more explicit.

In any case, it seems that any approximation we can make to Live will be 
subject to various sorts of errors.

Alan
