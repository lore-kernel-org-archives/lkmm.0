Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB025219E4D
	for <lkmm@lists.linux.dev>; Tue, 12 Nov 2024 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442806; cv=none; b=tEcmsmZyVvO5tgpe/e8QuaLONm0G8/W4l1tsU8AUhPQe7wZYwzRTeW+N2zHCHUal93KewUChq9XCSKSTjwKZbZ0RVGRwaCegpxBaKqWHYFkDVuWF2bggOcDLG2Px0LCHCNTBsZfPtvn73X7FH9siWJdJh+PlbMiUd5X/qNoHz94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442806; c=relaxed/simple;
	bh=qh6V9H24WUaHZ398YoDNUIlxMIImfm73W8XwHDnuY+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhOHzhzf8yCbghXC7mj53FaxxcJREmM08yGmS5dvBbFSXwj4B2CXk6lcxVqDO2g4fmidK3asGDT82FkrrYjOyrJm7s8UGXUU4ODWcKkuHAkJpGmT/yNsl/kgWiT3eWCPTqMW9Gkpbrnz8cJJmaUVMBJaH+LyaBxMisMHCl0d0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rF6x9LKw; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rF6x9LKw"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e60d3adecbso3273142b6e.2
        for <lkmm@lists.linux.dev>; Tue, 12 Nov 2024 12:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731442804; x=1732047604; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2I9EFlpFWjPTkUAQq90uTZ+s3a93U8M2zwH+dtcnH4g=;
        b=rF6x9LKw0xEQsqfx9X7wVYF1xb5ajzT/QoKULlvuenAEDdt0l1bubkkHRhsckXHSR0
         7rfsatE4LYPA/pwH2+lGrsTuxP0zng/l+iCAmbuYOsjSohvDtapx0Lw25gtWQ+fojz7c
         UbnTqzgiLlQ8uT2dBnEb60J3NtkkK5A+CT7qyXJKwbDq/s08yH2sQY0DJrDgSiVM/eXr
         RoVo8nGWshpTJIGdkTozf4vh9gP5XYE0T0g3KTKH4YVx8xcCr0uTWTdpt2NbZRhHIzDa
         SkHsaO9MnU++Fg8fBM5enx+UZuo7gsc5MdXjax5aFC0rFcqH7EO4ma1S8DYcgcGU9kj9
         kFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442804; x=1732047604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2I9EFlpFWjPTkUAQq90uTZ+s3a93U8M2zwH+dtcnH4g=;
        b=B6aU5xeJhDYVdd81U+macNwXwn68ITXBToEhw3wTrkD2+cTPPfU1aPVgj6J6XRnqnq
         cmIYhW6wzGbkI4/sw9e9ew2kO0NbHt5xzEzSHYFsLw+aokWszauY+6bmhyAa7h4LS6Xi
         iy1pCUffQEPJ854veYToXT553F4HLhxy08QazLMc9b6kISs+FsUtqLChdNLx6tZBinbs
         Y+7NJ+sDYthP4rpgGOfLRXh6+QORURTV3nNkAGcBW8Hq2WMZCXGVYGBky+aAVG9+I+mk
         F9uQohGARuFscSk5Nn2mo/WWMQhiUiSROxh099U+TOp94lSmPaFBwMWIQsrtp0FL4veP
         NIqA==
X-Forwarded-Encrypted: i=1; AJvYcCWEp+HtFKmifT6e2LnWdn6t2GR3NVhLuNnsF7th3UliZ/+bT8jnf6RO+B86L24dTBBEltVZ@lists.linux.dev
X-Gm-Message-State: AOJu0YysplT3l2P6WvQOIbevAIyZ7HW8gP6hYoKuj+1Rl2overDT6bNY
	BAYEelTLctlKQXOvnaI2tEet+yHIwx2ytbu/SYOspml2/jwHf+hzrZDvCbS7nw==
X-Google-Smtp-Source: AGHT+IH1weg8kjVuBmmwCga7pLih0gbvjmLcj7PDw/tDzwTnXQ97nvMfMsfBc6I2vGLThNMzOqVnPw==
X-Received: by 2002:a54:470e:0:b0:3e7:9e03:2359 with SMTP id 5614622812f47-3e79e0328e1mr8282209b6e.34.1731442803988;
        Tue, 12 Nov 2024 12:20:03 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961df03fsm75883546d6.16.2024.11.12.12.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:20:03 -0800 (PST)
Date: Tue, 12 Nov 2024 15:20:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: =?utf-8?B?U3rFkWtl?= Benjamin <egyszeregy@freemail.hu>,
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
	dlustig@nvidia.com, joel@joelfernandes.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, torvalds@linux-foundation.org
Subject: Re: [PATCH] tools/memory-model: Fix litmus-tests's file names for
 case-insensitive filesystem.
Message-ID: <25cee4ed-1115-42d4-8422-ed7f7f4ff389@rowland.harvard.edu>
References: <69be42c9-331f-4fb5-a6ae-c2932ada0a47@paulmck-laptop>
 <8925322d-1983-4e35-82f9-d8b86d32e6a6@freemail.hu>
 <1a6342c9-e316-4c78-9a07-84f45cbebb54@paulmck-laptop>
 <ec6e297b-02fb-4f57-9fc1-47751106a7d2@freemail.hu>
 <5acaaaa0-7c17-4991-aff6-8ea293667654@paulmck-laptop>
 <a42da186-195c-40af-b4ee-0eaf6672cf2c@freemail.hu>
 <62634bbe-edd6-4973-a96a-df543f39f240@rowland.harvard.edu>
 <61075efa-8d53-455b-bba3-e88bbf4da0a5@paulmck-laptop>
 <75a5a694-1313-44b1-baff-d72559ac9039@rowland.harvard.edu>
 <de5485b8-6d88-46f6-b982-cdfb3cf80a13@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de5485b8-6d88-46f6-b982-cdfb3cf80a13@paulmck-laptop>

On Tue, Nov 12, 2024 at 10:26:37AM -0800, Paul E. McKenney wrote:
> We do have a rule for the filenames in that directory that most of
> them follow (I am looking at *you*, "dep+plain.litmus"!).  So we have
> a few options:
> 
> 1.	Status quo.  (How boring!!!)
> 
> 2.	Come up with a better rule mapping the litmus-test file
> 	contents to the filename, and rename things to follow that rule.
> 	(Holy bikeshedding, Batman!)
> 
> 3.	Keep it simple and keep the current rule, but make the
> 	combination of spin_lock() and smp_mb__after_spinlock()
> 	have a greater Hamming distance from "lock".  Szőke's
> 	patch changed only one of the filenames containing "Lock".
> 	(Bikeshedding, but narrower scope.)
> 
> 4.	One of the above, but bring the litmus tests not following
> 	the rule into compliance.
> 
> 5.	Give up on the idea of the name reflecting the contents of the
> 	file, and just number them or something.  (More bikeshedding
> 	and a different form of confusion.)
> 
> 6.	#5, but accompanied by some tool or script that allows easy
> 	searching of the litmus tests by pattern of interaction.
> 	(Easy for *me* to say!)
> 
> 7.	Something else entirely.
> 
> Thoughts?

Thumbs up for 3.

Alan
