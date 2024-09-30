Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAFA194147
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727714641; cv=none; b=fsR/lLdQbOd+GurJQUR2BwIAc5ULlhmRg7P6ZtGCTONlfLTuknvtvgSp92CSmhHE1qtk6+4uVm30DD34hWnmGLUfgi+c26/1CZFcva0kqqsWm/lfD/l+ULLTvViRidjWnpOKm+EeM0D1/4oAdxFNBjPUct/dZysSrodOdOdsT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727714641; c=relaxed/simple;
	bh=QKNtRSc2cNCYGCwqn1eTBhtDpFJPYjvSXYdly8vAgBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hY/Pt0rFXuygJ98EzmKtju7TepWqz/aYcvSoK6E8jdmMaV7xYc8ra99k0n48u3G+x0S7DnvxCX2hw4FYTNHDxlUEI4w8BqFE0gC3RkM5dZkcbBDR1u6EuZ5rHEsDcPv4olrJcxwIZc8WTopjxNQ+BvcJGEYL/q9wLz5eU4DhSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ApQr7Znp; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ApQr7Znp"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a99e8ad977so383160185a.3
        for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727714638; x=1728319438; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOmsLRCNGVCtqpLkiEPmqmMJ6TKdIvwB/jyhOC3obpY=;
        b=ApQr7ZnpRZvaJfrZJRTVOjnCxBBq3ZAi14nbFiMhytQ3MeVGg5L5ptG/FIlnRDegz0
         P6H6V4mCJDHeZX5Pokl4s/9wI9dWQgpomI7OzYxMHjS1dGdmA79YTxE2qR6faj7mymwP
         Etz/w9YRApsJhUud2fGCt/okTX0CbmRgFISxgtiKqNFOYFv/qSCRQOPONpIHVQ0DlgfL
         jjpLAvK+JXe3kTlzABsFTmNIToqD42DRfDgq85GaKJLZqTsB5o7mVQ5kYcX5TDEFJOR2
         8wfz46sTbgu6zdM0BoJKysAbfXZa/U86xrF9hWc0++C76ij3G/IqJFqoPlXqrMWfVfPt
         AlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727714638; x=1728319438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOmsLRCNGVCtqpLkiEPmqmMJ6TKdIvwB/jyhOC3obpY=;
        b=syTfDbftb8cZmNcFtxmRQxUgJHhW0LW8rKHn/ki4de1HF+7SjtEHtvTg1sBLC1FRU2
         p53SKCZLJ3NAqphp4qNLdP1KCtRXPZ+HOIcO5jB6axYQdGQe53AlErVC+hAr6SQhUEAN
         PlB2996qaehcZagfopxcmK0TRmZSe7xT76C1WuNo3GsWAdsOxJyMGKYWty55M18BcmH2
         8h8LRrzXF8Sk4c93TyWK9zvXgADWt2NXuJtYo6rR40Cdd2PhFlgxUzjYisVPT8gK1F5a
         ZFNyN1gG2QbV8Uu+5JCu0VfRGMdJscSGhVlAW+JG+SQ9AuXXBpOMudLdPmj0q70aLrBe
         yTXA==
X-Forwarded-Encrypted: i=1; AJvYcCUN9JNqzwiEKH/4gF6b/Z9B7A2W/73wcUTEyIFMzE/b3ofIJGeiXxDyv9PzsruDnpdNh0Cg@lists.linux.dev
X-Gm-Message-State: AOJu0YzE6cd173C0808wOW+c61VeG+y/2LvfiTrVsXD4InsITC6DA9w2
	46lfhl7m0Xq1JItWBVl4vsCav2OWhxBfI5bmZXOYQcvQxR1G+C0a4o9/EzGysA==
X-Google-Smtp-Source: AGHT+IHsEwT5syMe6xjkTSTWIhlO/HTJ7JUiinZyPraGC1x0RYXykQwqYqv5YwDs8lui9gvfUyrG4w==
X-Received: by 2002:a05:620a:6002:b0:7a9:c129:4e5d with SMTP id af79cd13be357-7ae3b23c2d9mr1634819485a.62.1727714638513;
        Mon, 30 Sep 2024 09:43:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5638])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3783fdd8sm426543185a.102.2024.09.30.09.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:43:57 -0700 (PDT)
Date: Mon, 30 Sep 2024 12:43:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
Message-ID: <2cdda043-1ad9-40cf-a157-0c16a0ffb046@rowland.harvard.edu>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <9539c551-5c91-42db-8ac1-cff1d6d7c293@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9539c551-5c91-42db-8ac1-cff1d6d7c293@huaweicloud.com>

On Mon, Sep 30, 2024 at 01:26:53PM +0200, Jonas Oberhauser wrote:
> 
> 
> Am 9/28/2024 um 4:49 PM schrieb Alan Stern:
> > On Sat, Sep 28, 2024 at 09:51:27AM -0400, Mathieu Desnoyers wrote:
> > > Compiler CSE and SSA GVN optimizations can cause the address dependency
> > > of addresses returned by rcu_dereference to be lost when comparing those
> > > pointers with either constants or previously loaded pointers.
> > > 
> > > Introduce ptr_eq() to compare two addresses while preserving the address
> > > dependencies for later use of the address. It should be used when
> > > comparing an address returned by rcu_dereference().
> > > 
> > > This is needed to prevent the compiler CSE and SSA GVN optimizations
> > > from replacing the registers holding @a or @b based on their
> > 
> > "Replacing" isn't the right word.  What the compiler does is use one
> > rather than the other.  Furthermore, the compiler can play these games
> > even with values that aren't in registers.
> > 
> > You should just say: "... from using @a (or @b) in places where the
> > source refers to @b (or @a) (based on the fact that after the
> > comparison, the two are known to be equal), which does not ..."
> 
> I should also point out that it is not enough to prevent the compiler from
> using @a instead of @b.
> 
> It must also be prevented from assigning @b=@a, which it is often allowed to
> do after finding @a==@b.

Wouldn't that be a bug?  Consider this litmus test:

int x = 0;
int y = 45;
int z = 0;

void P0(int *x, int *y, int *z) {
	int r1, r2;

	r1 = READ_ONCE(*x);
	r2 = READ_ONCE(*y);
	if (r1 == r2) {
		WRITE_ONCE(*z, 1);
		// L1: WRITE_ONCE(*y, r1);
	}
}

void P1(int *x, int *y) {
	int r3;

	WRITE_ONCE(*x, 45);
	WRITE_ONCE(*y, 56);
	r3 = READ_ONCE(*y);
}

exists (z=1 /\ 1:r3=45)		(* Not allowed *)

If the compiler were to make the extra assignment (basically, 
uncommenting the line marked L1) then the exists clause could be 
satisfied.  That would indicate there's a bug in the compiler.

Alan
