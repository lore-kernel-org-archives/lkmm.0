Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BFF15DBAE
	for <lkmm@lists.linux.dev>; Wed, 25 Sep 2024 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727261201; cv=none; b=V+qtQG2/jMnMVQuER3bcnIIa84XN+6FvXmSTALx41t6ulVU8rcy8YqFjBkAiBFQzFUuUdHJbK2g4q/JV6hyBw2xJ857lKYmWe+WnCVl6TriAKYycAX18wx17oco4gz87JFIV6gWnjSgZ6qNqQMKU2lPAFIO4KdCVmzhk+7W9tvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727261201; c=relaxed/simple;
	bh=uu/PXwiT3eXsRa1cBT+MzQ24JypnbUQpiBpLXUDF0d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIoHIOVYA7Vf1IYTNIDsPBVSbWaCis+ZDFsrKkiMBOwWFOT3i/Pps0lk1M3R2a1r+2Nv+TJhocnsYMGn7m2srAUuQyzJxaYesIC967NOlfbS83sH/2jMbFXr6W2HZaMlKUf09aG803ScS52IQgrKwMm3hCuJprANuiUWztIIC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WonUgeVT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WonUgeVT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9b72749bcso594732685a.0
        for <lkmm@lists.linux.dev>; Wed, 25 Sep 2024 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727261199; x=1727865999; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aNL2DkbqIFQCOqqQozrXxRXJzMB2AW4PJqi08QSnaw=;
        b=WonUgeVTrNR6SEqxioyd8gVFQOwQOj0xR6C1FEItpPTKiYlA/ALgL96jtMVDjwD8Hw
         I7KvnjKOKs+cOnoCbv6uIaLrUPStj4hWEm4XiaUXXuItF5rmQEng7QOvw0tN2MAtCli0
         Gtyq5WPNcuSGQE8HRg7PQR2gV6/ZZFU3f7mxsjeyJFr48EBsev3DTRcmyeYDSvqCsJSo
         Ey/UhlGAru07OL9faluM1DZza3jMcVtmhAcCGL/y23L/uZbW636KT9+62YkZ0KRcVJgU
         A4m//vrF3SsOePH1CPQwzbRGT6NcDE7XKA55Sdcyqw0+WasOO58p2jAvJ+dWn0mcOqXv
         N6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727261199; x=1727865999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aNL2DkbqIFQCOqqQozrXxRXJzMB2AW4PJqi08QSnaw=;
        b=FZ6QfWTXLtjWbzgJYDxe97LM7Y+7HY+6y+Bm04fUiar9ycLOzZdd2ZA17vwotcHnhv
         NumBlhq06a0rOqD0IfeAFj5IuGqz4+4lghhTv8fa7mKxrpR5ktjwIVUFrOJdXKXYGQPy
         LzAnhx3VIl9fbg+c229QIpzXRCz0POUSbk/NzUH6Dl6gIhTm3kOYCcXn8qOP2AR6oPl+
         TyegzB66Ft1Ll+1EUpigXT4LOj+UcRifDoXwsitaoyJDi003eClIC8YNah7roPEmnk+4
         DufJTz1yQx9+muforlqO0Gx1m7yl+4DaLP9uUrp0pHUYYzeg5VL3+6BzoyYSciSdyJFI
         Vvaw==
X-Forwarded-Encrypted: i=1; AJvYcCVFWPqzvlhZO43i90OoJOnj7jPd3bHFe9BXy/HcBZAYeNWyBN/Jp0ZoU3SZVisza78JIszK@lists.linux.dev
X-Gm-Message-State: AOJu0YxsD6jXQqXxHp2G3EQthL0nFYT71B/kNvLHIIxd1847hciBzPSm
	TfJmlaBgS5rvNxanlSqED18H6HE9uagJ7mEelvtr7rsEqRS8M9sG
X-Google-Smtp-Source: AGHT+IFvHuGGdp6zrYogUOKGpCVDO+pYTLfd+cXdAs25Wrk14yTLJgeGQxPFJrC9SIR0gcCZRTm9PA==
X-Received: by 2002:a05:620a:3199:b0:7a9:bf31:dbc7 with SMTP id af79cd13be357-7ace7461d21mr347540485a.53.1727261198621;
        Wed, 25 Sep 2024 03:46:38 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde62b3d0sm158399585a.134.2024.09.25.03.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:46:37 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0FF831200069;
	Wed, 25 Sep 2024 06:46:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 25 Sep 2024 06:46:37 -0400
X-ME-Sender: <xms:DOrzZjJSGMuMjwT-CxfQOIMmOIVDZyrLcSf_UkXRaVhTZ39XtyDyUA>
    <xme:DOrzZnIHQr2tj5kWc8meY7wB6NkH_Q-dqQJJ3cU5F4mcQooxEKxt0_c-0tOEjjpjB
    UKDW-G1Ma2l5zWINw>
X-ME-Received: <xmr:DOrzZrvvRZjLgKFaJfT4u9c6EV6wKQrSYzKv5rv1yt0cB7LQWcfYLVvZl3D0-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddthedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjohhnrghsrdhosggvrhhhrghushgvrheshh
    hurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhr
    tghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepph
    gruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehnvggvrhgrjhdruhhprgguhhihrgihsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhesjhhovghlfhgvrhhnrghnuggvshdr
    ohhrgh
X-ME-Proxy: <xmx:DOrzZsaAcBqNHeASds4eEcgDk_lQ5GM87IQGyL-x5ZCX8D8mNzdTtg>
    <xmx:DOrzZqZ8ZPzkMZfcOkW23uyahf2VuQO16bYMOT03jY6vKQBGQcDygg>
    <xmx:DOrzZgDTtBxTuAMxP71zmYf5zTpIV7o66qzJDiEtE-2XtOZLZw8SWQ>
    <xmx:DOrzZoZoLaVSxlF9wFcEhoILwPTqmYEmR2EHKb_lU5WDGLRW6pzlEg>
    <xmx:DerzZuqxdrjChdezibvqGC_ASUpO23azOPWlRhtKkP9c3eTw1SIKz54b>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Sep 2024 06:46:36 -0400 (EDT)
Date: Wed, 25 Sep 2024 03:45:54 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org,
	lkmm@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Message-ID: <ZvPp4taB9uu__oSQ@boqun-archlinux>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <55975a55-302f-4c45-bfcc-192a8a1242e9@huaweicloud.com>
 <ZvPfmAp_2mDkI3ss@boqun-archlinux>
 <f5aeeeda-c725-422a-9481-4795bd3ade0f@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5aeeeda-c725-422a-9481-4795bd3ade0f@huaweicloud.com>

On Wed, Sep 25, 2024 at 12:11:52PM +0200, Jonas Oberhauser wrote:
> 
> 
> Am 9/25/2024 um 12:02 PM schrieb Boqun Feng:
> > Hi Jonas,
> > 
> > Of
> > course, if we are really worried about compilers being too "smart"
> 
> Ah, I see you know me better and better...
> 
> > we can always do the comparison in asm code, then compilers don't know
> > anything of the equality between 'ptr' and 'head - head_offset'.
> Yes, but then a simple compiler barrier between the comparison and returning
> ptr would also do the trick, right? And maybe easier on the eyes.
> 

The thing about putting a compiler barrier is that it will prevent all
compiler reorderings, and some of the reordering may contribute to
better codegen. (I know in this case, we have a smp_mb(), but still
compilers can move unrelated code upto the second load for optimization
purpose). Asm comparison is cheaper in this way. But TBH, compilers
should provide a way to compare pointer values without using the result
for pointer equality proof, if "convert to unsigned long" doesn't work,
some other ways should work.

Regards,
Boqun

> 
> Have fun,
>    jonas
> 
