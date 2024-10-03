Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DE838C
	for <lkmm@lists.linux.dev>; Thu,  3 Oct 2024 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727920234; cv=none; b=TSBF3QknyxNyPf/9L0vkgz/Se7YPNl3To8jnvsrOIeiO/48hJX2c2NxRvGR9pWOE8nNnc5svnntXpMiIv6tVXJR8+ueUV9Pfqmj/qOQ5fKbHwnT0I/QfYsX+s2h9LEEsXUylqfErOQZKUCCoUN0ceQyoDJ3Q6EAWtCv5lWhnIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727920234; c=relaxed/simple;
	bh=z/negRqsG6gkntIZJHtSlJSuVmE0XE7frCZfd1hTztk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huLn14o99oX2jhweyDXnbMVRap2GDQ+gEB7Jh7ul3L9J501ZjEG2ocs9zmIWUJ/8SoVDId18Sq/qh0Wp6qXvwYSrNixZT0IfoYRXDnH7+yhTvxHHf9I8tzzIxNH+3ARLYHiS+enyKkjQCSL1ql59uKoy+TmGiZibi1UHf7xWkig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ptEg+Hj6; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ptEg+Hj6"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cb7c312b6eso3644226d6.2
        for <lkmm@lists.linux.dev>; Wed, 02 Oct 2024 18:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727920232; x=1728525032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TW60IUTPehz0g12Pfaz6AL2tkt66MvpF0k2D1aaI7NQ=;
        b=ptEg+Hj6AUdH3hNd0USTqXNOQLupIp3T2hPDH9FhfiWVdjT3stWENpcq9e00ZDjQ0N
         KpegpckDY476KBpiwcLlWf6GTOGiFV0UqCGuR2LT/cEdrd3AmtmSn9/6LmWh/ccIkofs
         Ar6G6c3IC8F26zetdTYsxnlGEvPGHJpotqYfaDDBPrT9nzY4jeJFIWVcqS8IRwheadzk
         saEFQp7lntH0YPr+iAEy6RAOPTPt9lFnminEK8FSciBGvB2Aj4jkbfRkVT8FPks6d3ax
         xiUliDpYRjm8lKcE8xS7VuN9sHIxkuylAVQT1GcwP8GX8yxE4K2RT5M5HDp6xVm6kn9S
         L0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727920232; x=1728525032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW60IUTPehz0g12Pfaz6AL2tkt66MvpF0k2D1aaI7NQ=;
        b=v8YnICzjrqsVqqsmMzchbCQF6TviP5Yfk7giIp5LokIqWQdsl7iq9DPbDZD+jnNMco
         gP5iKsROxFp5au1f9oK5hGgOnIzpL/LHyjnAoXhn1prlMu7v+LeVog/UAOxMkMAD4u3b
         3MWNw+wVicXeRA254JsChERMtAeHuzCGJyoh5wMcmfhMXvwI9y51BU4iF1UYwUDsYEdP
         g8WVp1KsiXMZ4TV8Th+KhQdzsivo6dQBIAOJtmsq2HzJ5AjkBdCa0YnHhbLvXLZtb010
         wpHzFJos2xEyTLPqzItDi6puvi9UcxKO4M2CaojyBkOScsD7bi4JBYXCLWeEwlc3f7tI
         ZEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyxCtEQmzBGYk36sdYLz0pb5LKtrok10Hav37rS3YBSnVvs6+VmeTZdEIkT/wbSS8fFtrG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4IoegdbXXZ9ScDQAVGnkI1J9emoV1vKYgN9r1DhOVdpMYceg8
	GKr+Zxk+45Z3Cu74vKrf1vqCSORgtVCjvhI0KyPtzbCkLVqPl6L+Om4NaaaJ0A==
X-Google-Smtp-Source: AGHT+IEv26iq8/1ZOyYGTcYuUxX/o0z7IncEd2xD4JiQFmC+bd8vOYXdTa6iFRK06pFUDggHzbTHhw==
X-Received: by 2002:a05:6214:4890:b0:6cb:5105:8d4a with SMTP id 6a1803df08f44-6cb81a9e3d2mr76906956d6.34.1727920231847;
        Wed, 02 Oct 2024 18:50:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::1384])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb9359bfe3sm1286326d6.9.2024.10.02.18.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 18:50:31 -0700 (PDT)
Date: Wed, 2 Oct 2024 21:50:27 -0400
From: 'Alan Stern' <stern@rowland.harvard.edu>
To: David Laight <David.Laight@aculab.com>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	"maged.michael@gmail.com" <maged.michael@gmail.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"lkmm@lists.linux.dev" <lkmm@lists.linux.dev>
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
Message-ID: <68dc00b3-1ca1-42bc-8f1e-78ace10e4d64@rowland.harvard.edu>
References: <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <9539c551-5c91-42db-8ac1-cff1d6d7c293@huaweicloud.com>
 <2cdda043-1ad9-40cf-a157-0c16a0ffb046@rowland.harvard.edu>
 <5d7d8a59-57f5-4125-95bb-fda9c193b9cf@huaweicloud.com>
 <82e97ad5-17ad-418d-8791-22297acc7af4@rowland.harvard.edu>
 <ea02ce2ce8a348efa8d461f84f976478@AcuMS.aculab.com>
 <2b1caba3-48fa-43b9-bd44-cf60b9a141d7@rowland.harvard.edu>
 <22638e2fe1274eb0834fa3e43b44184e@AcuMS.aculab.com>
 <d192cf63-a274-4721-968e-a2c098db523b@rowland.harvard.edu>
 <e39c6e5975f345c4b1a97145e207dee4@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e39c6e5975f345c4b1a97145e207dee4@AcuMS.aculab.com>

On Wed, Oct 02, 2024 at 03:24:45PM +0000, David Laight wrote:
> I think I know what you are trying to do, and you just fail.
> Whether something can work is another matter, but that code
> can't ever work.
> 
> Inside if (a == b) the compiler will always use the same register
> for references to a and b - because it knows they have the same value.

According to the other people in this discussion who have actually tried 
using this code, it _does_ work (at least some of the time).

However, I'm not one of those people and so I leave it up to them to 
decide how to respond to this critique.

Alan

> Possibly something like:
> 	c = b;
> 	OPTIMISER_HIDE_VAR(c);
> 	if (a == c) {
> 		*b
> will ensure that there isn't a speculative load from *a.
> You'll get at least one register-register move - but they are safe.
> Otherwise you'll need to put the condition inside an asm block.
> 
> 	David
