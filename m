Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAD22089
	for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727538578; cv=none; b=cLT1kjXNIGm2TkuupB+RkQJ2sIt/0uL8iAqtLaQB/TAi6U5P18J+tj4daKcUPD0JVHYrZgWoUQOLJoWbVi30SQgT3nYSko7S1UHSzFFpBp0xYlhYh2dX4WqHwpKgx9qsRIQzB5blx7XrKdL5QmSLDlJsVpYdheZOZn63lACEdkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727538578; c=relaxed/simple;
	bh=KdlqkuyEZNSXhZ/xOqSFaF4Sqp97IPoT4Hyq+yGHbDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vshue6g70uF0PH7Q4fsiK1bNS6eWmf8dzkg9dD+3hIonmQAcgoWRU5JBiI/zeB5yZPDus+CiIwd7e+kelBlmnmHBF8cO8uE4iml4abglGSC/2rPKjnmm+20Q79JHK7tD89g/XfmsZwqES5TLI5HIoTYPPH1JfWWAbDkfRpvFtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tyVPVybT; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tyVPVybT"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a9a3071c6bso340392385a.0
        for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727538576; x=1728143376; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XrCo872hmVBErLkNqqyCKwLhlZ6UWeKTxhBBD/77L9s=;
        b=tyVPVybTniC46UQ3HruhNo+NO/0mjs7mCnBcOS3v5iTv4BFkWsxs9o83eJ8O+Tdunf
         DRKmiGU3mr3oSY60UEmK/fVzwhsGxHHt0r1r3uydl+LuVo4MkENEcWlrdy/9NFKfTJDM
         C31aJXwZrbenauAP/ndmDWRStZa4kTIPVlBhNNDdrXKQkVXHg9BOws6npYbI/clFApWI
         AyPtBVAlCcwvFZuIsCBsMjrDZ5fFMu8SEm1XtBxvoNbuUuS4O/o37Cx22pzzrH9DmZcr
         T47RpobFFg4KpyCi25QRl9KOqGUnF6ILi7D6/iv+BfQXZcTweBcVl9Tu+o5yH59jAeP8
         3FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727538576; x=1728143376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrCo872hmVBErLkNqqyCKwLhlZ6UWeKTxhBBD/77L9s=;
        b=pH63RSRbO2JBdgqxtvapmamQR2SieX6//E7uK+MQRz7BvJfA/OpBVkSs/KC4akFvVO
         R9sHVxyLlptLWMvl1zjg/Qu0aLmuiaID+jRNeOeNP9+UkYth4QG4J8EfH1y/uO/Htr4+
         a1XC4j2ayuITn8+dQgvTHjyXOkSPSW881x/vEYi8sOWJDDubV5nSThH9dKNN/luWxOvW
         VHoLJ9ENN6EnoSO2fHQHmwO08iXQpNAOmr+h3PGJwLuz/KdpKGcTPJgRtOdutw68ahLF
         vQrhLoFISuMszOPJZmSu1QPglwUYr7VQlR8M6h4F7bcuinlR4PqMlyDTdowGVTXtBamU
         483Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpSN5/7fh5soOWLT7osFkovO3sAcNyM2cyvCy7qDgfqR6jQZmawbhzAqpWK2Q4nRBzri2l@lists.linux.dev
X-Gm-Message-State: AOJu0YxEqad2KWKk2d7fFm0d3ADMZy9v4YVKfBESTS6FNQyhRwEhgTeo
	JChW+vhQFVlyDb8Jmm0bUKyzpm1L+fzD3xKI/5+ZN6U+g0Cys13+DL+lADbE0Q==
X-Google-Smtp-Source: AGHT+IGsYQHE3RPSuWx28NtFs8dvK9IDS8pN9FrHReEx/6WQL6RLjGENttnDoHZznhpeHZaPDj6EnA==
X-Received: by 2002:a05:620a:410c:b0:7a9:bca2:edff with SMTP id af79cd13be357-7ae378353c3mr1106315385a.14.1727538576067;
        Sat, 28 Sep 2024 08:49:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::abbf])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782cdf6sm212124785a.95.2024.09.28.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 08:49:34 -0700 (PDT)
Date: Sat, 28 Sep 2024 11:49:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
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
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
Message-ID: <d2c87672-af75-4210-bd96-d7f38f2f63ac@rowland.harvard.edu>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>

On Sat, Sep 28, 2024 at 11:32:18AM -0400, Mathieu Desnoyers wrote:
> On 2024-09-28 16:49, Alan Stern wrote:
> > On Sat, Sep 28, 2024 at 09:51:27AM -0400, Mathieu Desnoyers wrote:
> > > equality, which does not preserve address dependencies and allows the
> > > following misordering speculations:
> > > 
> > > - If @b is a constant, the compiler can issue the loads which depend
> > >    on @a before loading @a.
> > > - If @b is a register populated by a prior load, weakly-ordered
> > >    CPUs can speculate loads which depend on @a before loading @a.
> > 
> > It shouldn't matter whether @a and @b are constants, registers, or
> > anything else.  All that matters is that the compiler uses the wrong
> > one, which allows weakly ordered CPUs to speculate loads you wouldn't
> > expect it to, based on the source code alone.
> 
> I only partially agree here.
> 
> On weakly-ordered architectures, indeed we don't care whether the
> issue is caused by the compiler reordering the code (constant)
> or the CPU speculating the load (registers).
> 
> However, on strongly-ordered architectures, AFAIU, only the constant
> case is problematic (compiler reordering the dependent load), because

I thought you were trying to prevent the compiler from using one pointer 
instead of the other, not trying to prevent it from reordering anything. 
Isn't this the point the documentation wants to get across when it says 
that comparing pointers can be dangerous?

> CPU speculating the loads across the control dependency is not an
> issue.
> 
> So am I tempted to keep examples that clearly state whether
> the issue is caused by compiler reordering instructions, or by
> CPU speculation.

Isn't it true that on strongly ordered CPUs, a compiler barrier is 
sufficient to prevent the rcu_dereference() problem?  So the whole idea 
behind ptr_eq() is that it prevents the problem on all CPUs.

You can make your examples as specific as you like, but the fact remains 
that ptr_eq() is meant to prevent situations where both:

	The compiler uses the wrong pointer for a load, and

	The CPU performs the load earlier than you want.

If either one of those doesn't hold then the problem won't arise.

Alan Stern
