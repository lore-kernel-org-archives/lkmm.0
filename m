Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182027FB28
	for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 22:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766095685; cv=none; b=V8jXk9aIA9jpWTzVwdOu8ZaV17nL8GdXMWm3/83ejfuErWjT9P79AmtSezLaskSebolHDv0zqnUhMIGMzhwoVtg6XO5jErkfQSh/27/U+w5EX8cy2C7CLJdrIvL45Y6isLgDgzfqX1llP9TLIkt8MawXI59Nezj/s3RIidxsf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766095685; c=relaxed/simple;
	bh=/eLfiFUuH9yvahCPVcjPkezg5kYE43CsIOzLJ1Q0GsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7xdK0SyBIZ+1F6jQ2Jk4I02AIl7n0D5O6ru5DvAFxKa1mVupGRcgQQA0hINrUJNHtcbtfHSAo3nZDwD5wtTUnkNoefQ0ZIN233Fi+LSBU/VhCG9D67MqeTY/c0lXYqf4nD+EcDh9vnYCKIhyJeIZgO1FQPR96FTt82LqJ2Cj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6X063yh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6X063yh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0d67f1877so13936075ad.2
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 14:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766095683; x=1766700483; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8rgecbz9Q7Jzp6eajm21hLSWx7IeyY0MrZP+QvLVqg=;
        b=W6X063yhfiOiV4gBboL/XPxwgEKfvKBRqU0DAVaDIxoHlqMFM2YyC6XW08Wbf43IAG
         +N7K25DLOglohphZrsmF3gNHIpvg/Sc6wiSwY3QixYvIp+DjhQgfmLv4Si/IxmNRX4x8
         UDZA9seqWEPl4PPxvYwvvz3ZJx9NJ60W5KWnb52+4jXKsGcDl7d79iic5GPtdf0zPSZK
         67xvo3gNsrNeBY3bWC4WsP0flxYqHGJkWE5T5glacGIrpjmgCMcg39cyafVkCq0dhj2E
         LpXb9ed9VBOO860ounCS7YPyCs0cBReizhteqmxqJkIpgY+/8/vweUmV2w+1NkCh/uL3
         /hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766095683; x=1766700483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8rgecbz9Q7Jzp6eajm21hLSWx7IeyY0MrZP+QvLVqg=;
        b=kVDhSTGm5wdX2VpWVCWQYFPZYikFEkR6erueXR64+yt07GmnB/i2Up9yDOYwxkGmIU
         Is7MIB3TCsybHJNveIENnhp/4Wu8q8qIvBD9oj9cQxvzz6oN/lWD3l9n6Sscbl69/+48
         htgdLdpGT2rd8NZOtRrnFdQFKgo0MKLLZhcRLoJTdfgfz5Ppg3FOQiqoB4dRG6r+0vcd
         xA/EeaFLBdX8DHJZUd7XNsyt0hclOjT/7DFySTOoX3kEEMaZn8d491GCu77PJenYo7Ng
         /3V/Afd1Ham6YVJ+ttXfW0mmtIPnq8M8TS6wIBvLY3RgDd3Sr9Fwk6XcTrawUqkUvNLI
         QkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmod7dktfpPyUOf4fDd/bxZTlSndkLjClLyyjb6GHsXG5Ox2u9j2p5ynXBKV8poe9Kvgmo@lists.linux.dev
X-Gm-Message-State: AOJu0YxGqP+oyIe4WVqlk6uS8R9M0q83z2gApvOldxMfuqceru/0jJv6
	95hOewVXTuSe9TLro8ZuxgPZMYgnTndDxlMaGa2L4Mfg03LCJlNpCfvGgDSMb8hgVGY=
X-Gm-Gg: AY/fxX5h1Og8bGR8FzeyXLZHzofyaG0m3WJdiiTpnT7G1VhWbrMzHsKwR7utswt3Hwb
	shDOT9Snjik25CSnggYW+wn9Qw+i651Hyw2OR+LPHqq8mSSDuzAm6jr1I9YfAi3amo4K7x99/2e
	J+CIBjX2yvoINNqKi/pN58NLHZBln/uE4wVorKenunUPr7cVXmb9FutjUUgYDtUwqkkfqHd8Soy
	qdFXeBZJ36x85uJQD23M7333mgjg0Gv7R7WIFO5OSKhYXXat94VPY4saiDtvIf+ihLLbyX/CPvz
	CpzIEWih397zWh70dF8Mdlxi2n6QgybhrYB1NqRYv4nRcx57vRuu5Z0HZZa6F3fHt6TGBpftlIz
	nnInL7tfHiajR6X5Xt89o2k6IUb7cLXRQ+/nefNlGDIeDZSfSY5FEckseSSErQ+ZlCRFLEmIALk
	go7oVnCxJg+peSlsbssuODB5DDFc2BKiUTVe7E4dzfwJEEQZKOlX8vb6+0KtbFvm08QGNnmpyNU
	xMO1PoU1v7kybs=
X-Google-Smtp-Source: AGHT+IEspr+mA8yBfzyu92XEiMHrHEfySL5XUdcBH3qNwt/XL6ga6kYNOb/BEKUmPIRMr7Vo9NJQvA==
X-Received: by 2002:a05:622a:1801:b0:4f0:2b7d:5e05 with SMTP id d75a77b69052e-4f4abdc5894mr6756991cf.73.1766089353934;
        Thu, 18 Dec 2025 12:22:33 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d973a7f17sm3470116d6.22.2025.12.18.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:33 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6CAEFF40068;
	Thu, 18 Dec 2025 15:22:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 18 Dec 2025 15:22:32 -0500
X-ME-Sender: <xms:iGJEaTXC7Mbzq2VSxQnniDwb0KXl8rx5O8vsG465qQfLHhdNSZdoLw>
    <xme:iGJEaZH-9Zcpv5hnLU3pV4LhmPg9-pPVGbsYVvnaglo0r3e9p15WL18nuEXd9AQ1J
    OTqM5u5b5LgFyvYLHhR-VD0NFHPy9gs-5L3cb6GLJhRjnxreyUGGA>
X-ME-Received: <xmr:iGJEabe_lCyjfDp07p_7ZwF5QdisUDkwZxJhmKbV5l1RBsbTZaoiNqWOavJd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnheptddtudegueevgefhgfeuffetffeuheekgedtffefhefhjeffhffgfeeggeetgefh
    necuffhomhgrihhnpegvfhhfihgtihhoshdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepfeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghthhhivghurdguvg
    hsnhhohigvrhhssegvfhhfihgtihhoshdrtghomhdprhgtphhtthhopehjohgvlhesjhho
    vghlfhgvrhhnrghnuggvshdrohhrghdprhgtphhtthhopehprghulhhmtghksehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepghhrvghg
    khhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsghighgvrg
    hshieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopeifihhllheskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:iGJEabnyuKxJGLEnl3scEcV1Wr2sOT-vA5J2RYUGjX6RJN1qIORUpw>
    <xmx:iGJEaQEQN4GdKTlX4_1v-2RuuKtYr-H51p_MjcfnG3FsOmRfLIpdsg>
    <xmx:iGJEaW9xXmliOc7FtXTAYnwZkx0ObVMah_X-__4eArWyRu5ecw4ZXw>
    <xmx:iGJEaRiYrFqs_GGsbrm8ibaxbhwj1OlS_MFhn4aj6bNPGtNjuBwxLg>
    <xmx:iGJEaaQeaoS5QqiZYn8gsAq0HZwfSVU4BK7sqnOpSpF3J5k8G5qP5m-->
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 15:22:31 -0500 (EST)
Date: Fri, 19 Dec 2025 05:22:29 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,	linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>,	Peter Zijlstra <peterz@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,	John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,	Mateusz Guzik <mjguzik@gmail.com>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,	rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [RFC PATCH v4 3/4] hazptr: Implement Hazard Pointers
Message-ID: <aURihbmjsKi8m7MO@tardis-2.local>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
 <20251218014531.3793471-4-mathieu.desnoyers@efficios.com>
 <aUO9KRaP0FXpm_l9@tardis-2.local>
 <fcbc99d0-b7c7-45f7-9cf8-f5d3bfad966e@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcbc99d0-b7c7-45f7-9cf8-f5d3bfad966e@efficios.com>

On Thu, Dec 18, 2025 at 12:35:18PM -0500, Mathieu Desnoyers wrote:
> On 2025-12-18 03:36, Boqun Feng wrote:
> > On Wed, Dec 17, 2025 at 08:45:30PM -0500, Mathieu Desnoyers wrote:
> [...]
> > > +static inline
> > > +void *hazptr_acquire(struct hazptr_ctx *ctx, void * const * addr_p)
> > > +{
> > > +	struct hazptr_slot *slot = NULL;
> > > +	void *addr, *addr2;
> > > +
> > > +	/*
> > > +	 * Load @addr_p to know which address should be protected.
> > > +	 */
> > > +	addr = READ_ONCE(*addr_p);
> > > +	for (;;) {
> > > +		if (!addr)
> > > +			return NULL;
> > > +		guard(preempt)();
> > > +		if (likely(!hazptr_slot_is_backup(ctx, slot))) {
> > > +			slot = hazptr_get_free_percpu_slot();
> > 
> > I need to continue share my concerns about this "allocating slot while
> > protecting" pattern. Here realistically, we will go over a few of the
> > per-CPU hazard pointer slots *every time* instead of directly using a
> > pre-allocated hazard pointer slot.
> 
> No, that's not the expected fast-path with CONFIG_PREEMPT_HAZPTR=y
> (introduced in patch 4/4).
> 

I see, I was missing the patch #4, will take a look and reply
accordingly.

> With PREEMPT_HAZPTR, using more than one hazard pointer per CPU will
> only happen if there are nested hazard pointer users, which can happen
> due to:
> 
> - Holding a hazard pointer across function calls, where another hazard
>   pointer is used.
> - Using hazard pointers from interrupt handlers (note: my current code
>   only does preempt disable, not irq disable, this is something I'd need
>   to change if we wish to acquire/release hazard pointers from interrupt
>   handlers). But even that should be a rare event.
> 
> So the fast-path has an initial state where there are no hazard pointers
> in use on the CPU, which means hazptr_acquire() finds its empty slot at
> index 0.
> 
> > Could you utilize this[1] to see a
> > comparison of the reader-side performance against RCU/SRCU?
> 
> Good point ! Let's see.
> 
> On a AMD 2x EPYC 9654 96-Core Processor with 192 cores,
> hyperthreading disabled,
> CONFIG_PREEMPT=y,
> CONFIG_PREEMPT_RCU=y,
> CONFIG_PREEMPT_HAZPTR=y.
> 
> scale_type                 ns
> -----------------------
> hazptr-smp-mb             13.1   <- this implementation
> hazptr-barrier            11.5   <- replace smp_mb() on acquire with barrier(), requires IPIs on synchronize.
> hazptr-smp-mb-hlist       12.7   <- replace per-task hp context and per-cpu overflow lists by hlist.
> rcu                       17.0
> srcu                      20.0
> srcu-fast                  1.5
> rcu-tasks                  0.0
> rcu-trace                  1.7
> refcnt                  1148.0
> rwlock                  1190.0
> rwsem                   4199.3
> lock                   41070.6
> lock-irq               46176.3
> acqrel                     1.1
> 
> So only srcu-fast, rcu-tasks, rcu-trace and a plain acqrel
> appear to beat hazptr read-side performance.
> 

Could you also see the reader-side performance impact when the percpu
hazard pointer slots are used up? I.e. the worst case.

> [...]
> 
> > > +/*
> > > + * Perform piecewise iteration on overflow list waiting until "addr" is
> > > + * not present. Raw spinlock is released and taken between each list
> > > + * item and busy loop iteration. The overflow list generation is checked
> > > + * each time the lock is taken to validate that the list has not changed
> > > + * before resuming iteration or busy wait. If the generation has
> > > + * changed, retry the entire list traversal.
> > > + */
> > > +static
> > > +void hazptr_synchronize_overflow_list(struct overflow_list *overflow_list, void *addr)
> > > +{
> > > +	struct hazptr_backup_slot *backup_slot;
> > > +	uint64_t snapshot_gen;
> > > +
> > > +	raw_spin_lock(&overflow_list->lock);
> > > +retry:
> > > +	snapshot_gen = overflow_list->gen;
> > > +	list_for_each_entry(backup_slot, &overflow_list->head, node) {
> > > +		/* Busy-wait if node is found. */
> > > +		while (smp_load_acquire(&backup_slot->slot.addr) == addr) { /* Load B */
> > > +			raw_spin_unlock(&overflow_list->lock);
> > > +			cpu_relax();
> > 
> > I think we should prioritize the scan thread solution [2] instead of
> > busy waiting hazrd pointer updaters, because when we have multiple
> > hazard pointer usages we would want to consolidate the scans from
> > updater side.
> 
> I agree that batching scans with a worker thread is a logical next step.
> 
> > If so, the whole ->gen can be avoided.
> 
> How would it allow removing the generation trick without causing long
> raw spinlock latencies ?
> 

Because we won't need to busy-wait for the readers to go away, we can
check whether they are still there in the next scan.

so:

	list_for_each_entry(backup_slot, &overflow_list->head, node) {
		/* Busy-wait if node is found. */
		if (smp_load_acquire(&backup_slot->slot.addr) == addr) { /* Load B */
			<mark addr as unable to free and move on>
		
> > 
> > However this ->gen idea does seem ot resolve another issue for me, I'm
> > trying to make shazptr critical section preemptive by using a per-task
> > backup slot (if you recall, this is your idea from the hallway
> > discussions we had during LPC 2024),
> 
> I honestly did not remember. It's been a whole year! ;-)
> 
> > and currently I could not make it
> > work because the following sequeue:
> > 
> > 1. CPU 0 already has one pointer protected.
> > 
> > 2. CPU 1 begins the updater scan, and it scans the list of preempted
> >     hazard pointer readers, no reader.
> > 
> > 3. CPU 0 does a context switch, it stores the current hazard pointer
> >     value to the current task's ->hazard_slot (let's say the task is task
> >     A), and add it to the list of preempted hazard pointer readers.
> > 
> > 4. CPU 0 clears its percpu hazptr_slots for the next task (B).
> > 
> > 5. CPU 1 continues the updater scan, and it scans the percpu slot of
> >     CPU 0, and finds no reader.
> > 
> > in this situation, updater will miss a reader. But if we add a
> > generation snapshotting at step 2 and generation increment at step 3, I
> > think it'll work.
> > 
> > IMO, if we make this work, it's better than the current backup slot
> > mechanism IMO, because we only need to acquire the lock if context
> > switch happens.
> 
> With PREEMPT_HAZPTR we also only need to acquire the per-cpu overflow
> list raw spinlock on context switch (preemption or blocking). The only

Indeed, pre-allocating the slot on the stack to save the percpu slot
when context switch seems easier and quite smart ;-) Let me take a look.

Regards,
Boqun

> other case requiring it is hazptr nested usage (more than 8 active
> hazptr) on a thread context + nested irqs.
> 
> Thanks,
> 
> Mathieu
> 
> -- 
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
