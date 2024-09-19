Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA1381BD
	for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726772341; cv=none; b=cf/vkWKJPDUUHjit4FbrRSPGV7iv3xWnvMHSLTd/tVuUgCwrp2VCvIWqT0eueza8Vza2jThzCT3v28Y71aGSSXkTbdUo25v47OgKYWXvlz2e24xcGkorMH/ZzBwCzWhmLuZtTBS8geVUTr/aAqmzSXxsVlCGsKUTgzPQNOBMH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726772341; c=relaxed/simple;
	bh=2BHRVd2nRHEB49U/lj2UmGkgaXZ4zZLNAKH33PQ1vyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMz6ZoxR+2bYluV1L++75nbj3h+unRDvjnkgafHcNfKxFjA8akw/UBxfZG0ekoUi8M7ldBKt739nSOMhzdPEakQd+XOg8k2K8lMKSzKWW8XsnK4ZyqflVHZfbGacM/YVZjispkadAFSPvz0GYH3ZQBlkkFE1pyYbENTf3/iCPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY6CwIkU; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY6CwIkU"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a9a30a0490so118158585a.3
        for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726772339; x=1727377139; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cwoecdcdbMgPQsF14fynmPgai9K23d2W9nS8l1lA3yI=;
        b=KY6CwIkU12sv6A5cvPhm+oBrRDkQuNYH+0gter+GXRhMpqluI6BjK23TL36JibhvUj
         fRTq8yFzTNGUjhmoB0o8+YHSFUaxeElXq/YQ/kQj3XSWChPHs5MTqnp2yJ8Q5Qotic6M
         PMKH6zxEwHfe3hHL/w38lnV4l/NBicOyoPd0pF4CrQE2GZCjwnpJphI43MbZEAaExZVE
         EbSvAgqFsQZ60xqYXTtmov7fc21bXa93GQciHhUrDFXWcSq8sL9Cvf8WECAYUrOFFlfM
         5uO6F44r82XYY4WBty6IQMu00d4a3srtmpaCarjuBogn5PglL22feFbtbz6cn0r7zLWq
         xGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726772339; x=1727377139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwoecdcdbMgPQsF14fynmPgai9K23d2W9nS8l1lA3yI=;
        b=uuDqMzumbgOyhbgQlpIyBCld0jQhGwXIgQKiTTMvxawLOu2vRK6a2XrrTkQvaLN6ML
         S3g1pSxZ9KfsfI+ww6s0PXqZScIEjaO3Yedf0r3ZM5oPc3J8q92YCQdbo/fdmFhCOMoK
         Y5ny8ArBTL8Wm2UsGqOxrpFYg1M23jZ3sPPgHsF2bT3OXKgosXgu5mjJeNyXWLnMgwlg
         TPnxIySGASRX3JbMDR1eXc9lDwZNJwztbVQ5NpsunD/T6qQWaH8dUu+V65He60hnkpVN
         7KXgjaZXrK+I/K5W6msdIYIbSL1b1SAOp3Miy9tcMfmTUn2Dn72oiATCAsgs5O9NF3M5
         bw0g==
X-Forwarded-Encrypted: i=1; AJvYcCXxahMnDhL+rFG4aypZhhuCY5wAlKUqflWYxoX6QZrby5St3DMsPgiB/UjU2fEiT1vzchId@lists.linux.dev
X-Gm-Message-State: AOJu0YxJZM33xY1xTeEGjLs51nVxcM/N+1zK0L5vyRqep38v/7ZhMUE9
	CTsgflrTgET6wZwb7PNcU2cW6qnPH93mV1uOfpjMxQCgE0DEXiDF
X-Google-Smtp-Source: AGHT+IG9krhB+TqFIp3Xw3Uh0YLWlcpmOM9G1sjuTP6vk0Xn7571glVk4Nejjwuf1CSB1Ql1/7lMFA==
X-Received: by 2002:ac8:7c47:0:b0:447:f7cf:7022 with SMTP id d75a77b69052e-45b2055f185mr5813031cf.40.1726772338945;
        Thu, 19 Sep 2024 11:58:58 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b17919f4bsm9854851cf.85.2024.09.19.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 11:58:58 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D986120006E;
	Thu, 19 Sep 2024 14:58:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 19 Sep 2024 14:58:57 -0400
X-ME-Sender: <xms:cXTsZp8grmHRLhXzxyBFkrYpM6A7dVfgur5B5xZCeXeDzAthQmbhyg>
    <xme:cXTsZtvZ_ER1vCvf0zcR0zXjK6k0r-H65eMkqc2wuWJ33dE9BpuWNuZ0k4oHLebHr
    dFw2VyKDmJI33goZA>
X-ME-Received: <xmr:cXTsZnDcp0IVgtxJRk292AqTlZSmti2eRZ3npRiaa9n1l7NW4cTO06Q34hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeluddgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmmhhpghhouhhrihguvgesghhmrghilh
    drtghomhdprhgtphhtthhopehjihgrnhhgshhhrghnlhgrihesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnvggvrhgrjhdruhhprgguhhihrgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cXTsZtfnqM31xNyB3GG-nslVpV_CZaRpakh6WfZ8evbcyfreWq5CWA>
    <xmx:cXTsZuOkrbkS_vnSCHI8IAKNmwjImZ0-6ebi6xSZHhvL7-zYJcAyMg>
    <xmx:cXTsZvnCPW2JNH02s0lBpysxqBoOq83kturvA4YQc-qhRFrD7j7ulQ>
    <xmx:cXTsZotLoR6rDpEMGMqKzBA-68SokOVqlRQX-F5_WdNTlB4C9bPxiA>
    <xmx:cXTsZgvZYCs0nXp4IZNcciJy_0h_gNQjkE_f0BqqGtGZyI7JsKgiJMec>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Sep 2024 14:58:57 -0400 (EDT)
Date: Thu, 19 Sep 2024 11:58:31 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alan Huang <mmpgouride@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, RCU <rcu@vger.kernel.org>,
	linux-mm@kvack.org, lkmm@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Neeraj upadhyay <neeraj.upadhyay@amd.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard
 pointers
Message-ID: <Zux0Vyh38FK8OeJ4@boqun-archlinux>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <CAJhGHyD8MzUssfuKSGnu1arnayNOyBnUA03vYB0WWwbE3WzoZg@mail.gmail.com>
 <ZuvOWM5c8tZotHFL@boqun-archlinux>
 <D2BDE4C4-48DB-4813-9608-F672896E0121@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D2BDE4C4-48DB-4813-9608-F672896E0121@gmail.com>

On Thu, Sep 19, 2024 at 09:57:12PM +0800, Alan Huang wrote:
[...]
> > 
> > I think you're right. (Although the node will be eventually deleted at
> > cleanup_hazptr_context(), however there could be a long-live
> > hazptr_context). It should be:
> > 
> > hazptr_t val = smp_load_acquire(&hzcp->slots[i]);
> > struct hazptr_slot_snap *snap = &hzcp->snaps[i];
> > 
> > if (val != snap->slot) { // val changed, need to update the tree node.
> > // Already in the tree, need to remove first.
> > if (!is_null_or_unused(snap->slot)) {
> > reader_del(tree, snap);
> > }
> > 
> > // use the latest snapshot.
> > snap->slot = val;
> > 
> > // Add it into tree if there is a reader
> > if (!is_null_or_unused(val))
> > reader_add(tree, snap);
> > }
> 
> It seems like that two different hazptr_context can’t be used to protect the same pointer?
> 
> Otherwise the following can happen?
> 
> thread1 					thread2  					 thread3(worker) 	      thread4
> hazptr_tryprotect(hzp1, ptr1)   hazptr_tryprotect(hzp2, ptr1) 
> 												 add ptr1 to tree

Note that we have snapshot rb_node for each hazard pointer slot, so here
thread3 actually would add two rb_nodes with ->slot == ptr1 here.

> hazptr_clear(hzp1) 
> hazptr_tryprotect(hzp1, ptr2) 
> 												 delete ptr1 from tree     unpub ptr1

Therefore, there is still one rb_node with ->slot == ptr1 in the tree
after the deletion, so updaters won't invoke ptr1's callback.

Regards,
Boqun

> 																       call_hazptr(ptr1)
> 																       oops: invoke ptr1's callback
> Or am I missing something?
> 
> > 
> > Regards,
> > Boqun
> > 
> >> I'm not so sure...
> >> 
> >> Thanks
> >> Lai
> 
> 
