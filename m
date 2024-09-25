Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB61227FBD
	for <lkmm@lists.linux.dev>; Wed, 25 Sep 2024 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266639; cv=none; b=cIwYMoCW9IEPiLkgAjBBSdOT+cBkAPY1qrZsfCse1FafBt2d5LNXN93IW1zwqLyNxsptUvYvw1RRL4nYVUYl7Y91wT14Ia+szmIhbdFLXP638LZKKnyHStOO5o/Fd8YrsJ6re6PLJxuBX37wLW837OVM+ksXlDJKW7amzofudKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266639; c=relaxed/simple;
	bh=cH+5J7f8BEJJATmRwSiukfqHICY+fAeMBJtQDLS8ucM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xame66GBHmW9u1/1SqHZzcuKeAGU94lEWv2AmhY/2sgR5g3gGHGk2KcNZJkoWxWDbR1dhzKt0sKmmF0Cc4elluiqV1pYEcmNxcagd7b7ixZCYfxvP+UCKXvM9LuZZ8MKZV4rig0rbDm6yE8k2Y/hRfPXbrQIEE0FaN22oH6iNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2KucqAa; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2KucqAa"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a9ac0092d9so786947085a.1
        for <lkmm@lists.linux.dev>; Wed, 25 Sep 2024 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727266637; x=1727871437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfamvyNrNLAKTVHJr/a3uL3GwlQLYqAprzFxSBGIch8=;
        b=c2KucqAacRr/Hmty/odCivlA1Rn119RnEeEeccFF+y4cJPB+habNYYJ7RxlQJxEnKL
         uBqXXWu9qFHPHs8EMeO7ic7RjUKBfx2stGq4hlkTj1Zf+kvbGtf0HtznPDqm0f3TqUY+
         OZNxTWZnrjuz7yBVFsWKK4ZPuUuEym9Ym9kNs0lUTFjeA4SMCvaEEE1HpvD/rrY8D4Wc
         fhnqO4VBhnIVvvXrldfRWUc6U9mjJYjT3KxVy5w2tjO7GKDTVaVHmcu7OUqH7jOQ+fK8
         HBegfusl2ubAefADtmHBYyPJAxRwNmDv2+wDazhbau8PGy90S8hpSBoSeYZFY9MTSVeu
         oJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727266637; x=1727871437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfamvyNrNLAKTVHJr/a3uL3GwlQLYqAprzFxSBGIch8=;
        b=C9aws25+96WhjDygnfyule0MzktDc0BLRwO31L0K3Q8rloeMnj7r5qsJDW60Bhfkgc
         jeGyJqqQ5Kmcj/FWiOVwS35Nmr9Di+06AxHUmCWZOcsRRtu3tmIG03JlbIeGDdhtc1Xi
         lRjSYJpzEQa37taKBcxFGVmPTHOGBm58O6+4cxII4vuExxyZddMbCPkpc7MAdYKCdUM3
         FYjEJPaNH0CExK/s8sfM0t3bQO4Ej/xcXly19aTU99yDVD93PKqTBde0xcDFkO7749Y0
         PAGIMY54suoDIwX4Llx7TX5Uh3nKHbL+0B4KD6KO7ncYjrhzNXabN800qE1HotRmaBFu
         9d5A==
X-Forwarded-Encrypted: i=1; AJvYcCWk+2cmD6WP9Kgm6flpKe4Qn0M5v1kBxvEHspMu6hLJvessIo17J/i3NHxKtfDugyjBqsHQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyOXeLZpfW+djp8o++mxjq+jL8+kGKfJViyxRQyk2zTlLnbB5L5
	dcQ4YzbD+iG4zIwpGiGVAqTe/TZ5lVLMZ4lEhMb9l0my7yt6YnYS
X-Google-Smtp-Source: AGHT+IHiPFXBYm9II8VMy+jpneK1EOwCUCltshSdJ4SGf3Pi2WXgD7UwIafZGSQkUKkmgDxrtvRjMQ==
X-Received: by 2002:a05:6214:5992:b0:6c5:9afc:6046 with SMTP id 6a1803df08f44-6cb1dc21005mr44705366d6.0.1727266636532;
        Wed, 25 Sep 2024 05:17:16 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f552c15sm15658226d6.76.2024.09.25.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:17:16 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 32B6D1200066;
	Wed, 25 Sep 2024 08:17:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 25 Sep 2024 08:17:15 -0400
X-ME-Sender: <xms:S__zZtqdJJAHGjjNgWxIU3tmkqeXqTPX1NcamQUtP7QgVNKg2OLDQA>
    <xme:S__zZvotVx5Ogm3WIIzq_C-l7yzjg-RL8WlUZ2P4ZlWimy5iQ0EtOLT-mnvBxXXzs
    P4oKOA03SLKKNolWA>
X-ME-Received: <xmr:S__zZqOHRWTOC3LcPJKcejIVORxfhytJe4Nmc7zOLEoU9_wInMutPI1ESKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddthedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpedttddugeeuveeghffgueffteffueehkeegtdff
    feehhfejfffhgfefgeegteeghfenucffohhmrghinhepvghffhhitghiohhsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpdhr
    tghpthhtohepjhhonhgrshdrohgsvghrhhgruhhsvghrsehhuhgrfigvihgtlhhouhgurd
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehlkhhmmhes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehprghulhhmtghksehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvvghrrghjrdhuphgrughhhigrhieskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:S__zZo6entKLov7-lcnfPbHS2Spsv1iqDwR3Sto5o8CDIfJGO5CLbQ>
    <xmx:S__zZs7aKLuhJV1brklsTh4bA1lmoFhtK1M-1smQtS6RZSrcmhHCtQ>
    <xmx:S__zZgjayD_hxLQpEgVwdy_jmbgpZWhyTIMOQNSPRj0_x5sj75Ng6w>
    <xmx:S__zZu6WZf6EeIb1kUPBEkiFfbU1S-SsCtGt7-FNbfXQ78bIeTKj3g>
    <xmx:S__zZjLk8yY70FpsrYs8Hb6i7KSW2O59wG7qVk4-9MS7qxu4PhCaNEpd>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Sep 2024 08:17:14 -0400 (EDT)
Date: Wed, 25 Sep 2024 05:16:31 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-mm@kvack.org, lkmm@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard
 pointers
Message-ID: <ZvP_H_R43bXpmkMS@boqun-archlinux>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <55975a55-302f-4c45-bfcc-192a8a1242e9@huaweicloud.com>
 <ZvPfmAp_2mDkI3ss@boqun-archlinux>
 <f5aeeeda-c725-422a-9481-4795bd3ade0f@huaweicloud.com>
 <ZvPp4taB9uu__oSQ@boqun-archlinux>
 <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>

On Wed, Sep 25, 2024 at 01:59:06PM +0200, Mathieu Desnoyers wrote:
> On 2024-09-25 12:45, Boqun Feng wrote:
> > On Wed, Sep 25, 2024 at 12:11:52PM +0200, Jonas Oberhauser wrote:
> > > 
> > > 
> > > Am 9/25/2024 um 12:02 PM schrieb Boqun Feng:
> > > > Hi Jonas,
> > > > 
> > > > Of
> > > > course, if we are really worried about compilers being too "smart"
> > > 
> > > Ah, I see you know me better and better...
> > > 
> > > > we can always do the comparison in asm code, then compilers don't know
> > > > anything of the equality between 'ptr' and 'head - head_offset'.
> > > Yes, but then a simple compiler barrier between the comparison and returning
> > > ptr would also do the trick, right? And maybe easier on the eyes.
> > > 
> > 
> > The thing about putting a compiler barrier is that it will prevent all
> > compiler reorderings, and some of the reordering may contribute to
> > better codegen. (I know in this case, we have a smp_mb(), but still
> > compilers can move unrelated code upto the second load for optimization
> > purpose). Asm comparison is cheaper in this way. But TBH, compilers
> > should provide a way to compare pointer values without using the result
> > for pointer equality proof, if "convert to unsigned long" doesn't work,
> > some other ways should work.
> > 
> 
> Based on Documentation/RCU/rcu_dereference.rst :
> 
> -       Be very careful about comparing pointers obtained from
>         rcu_dereference() against non-NULL values.  As Linus Torvalds
>         explained, if the two pointers are equal, the compiler could
>         substitute the pointer you are comparing against for the pointer
>         obtained from rcu_dereference().  For example::
> 
>                 p = rcu_dereference(gp);
>                 if (p == &default_struct)
>                         do_default(p->a);
> 
>         Because the compiler now knows that the value of "p" is exactly
>         the address of the variable "default_struct", it is free to
>         transform this code into the following::
> 
>                 p = rcu_dereference(gp);
>                 if (p == &default_struct)
>                         do_default(default_struct.a);
> 
>         On ARM and Power hardware, the load from "default_struct.a"
>         can now be speculated, such that it might happen before the
>         rcu_dereference().  This could result in bugs due to misordering.
> 
> So I am not only concerned about compiler proofs here, as it appears
> that the speculation done by the CPU can also cause issues on some
> architectures.
> 

Note that the issue is caused by compiler replacing one pointer with
the other, CPU speculation won't cause the issue solely, because all
architectures Linux supports honor address dependencies (except for
Alpha, but on Alpha, READ_ONCE() has a smp_mb() after the load). That
is: if the compiler generates code as the code is written, there should
be no problem.

Regards,
Boqun

> Thanks,
> 
> Mathieu
> 
> > Regards,
> > Boqun
> > 
> > > 
> > > Have fun,
> > >     jonas
> > > 
> 
> -- 
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
> 
