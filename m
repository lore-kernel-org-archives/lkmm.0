Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A1155C87
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752201115; cv=none; b=GpnfQz2N1xOjeFD+MnrbiHjsEp9L6GaL0W04zYBdqOwa7YLGPm2LPbU2VUkJQQcjvJ2gVRSSA+AlQW5ets1x28+YN3hgVn6DqZ/x3GqAwcqknObBWr/Io7mL2qhsmRh5LTlXwZLxdA4CuCI5Qe69LYVJJHD3zJo9NNyPPiaUoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752201115; c=relaxed/simple;
	bh=qoMv3I/wvYY0fBc/km+29iL2QTJH+hPrK/s0FOHTlyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7kpSAjf9xartRi/f3Wa6Q7vFdzEYeUGgkceC9Ba478z54Axx7BU4N765snRYetYWKTAPmbwA16jzixd2dECKMCSIUjGynFC9697N8nd5seQYv0Mp5te2swJ/BfUyClHWm2t5hxRkZURS4hay/q2yG06CB/gntb046fuCp2EY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmNf05OF; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmNf05OF"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fabb948e5aso19079656d6.1
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 19:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752201112; x=1752805912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hpxRkNYRuqENsjSxqDYk0zNqW0LZ1+U3jypHB6kGXw=;
        b=bmNf05OF3knlPXlaRMtrEguryPRSjfmt7f/3bX5e04FERrqYWWn4Yj2zlVpCl2y/Op
         xZJi3p85ujHny2momzyA9Yi/IWfefswuPz68lvDNt8pjvNIUASXOqlTIn/G790EDifKa
         vvg6bXifIY/APk88IyuA1PFXc/nFTUtliagCARAym9hEVQy3hyZ0bmy8IbV+Lupm9kSa
         F8PL3esHFuX1/ZvCu4jHtmlPr55wmAXqhzzWWKJHHXcRYc/Ttbj0ozTnsSvM9zEQvKyb
         QUReZSUKRulW87LG48kXIfejqUvBcUDEt9zHpwRELST3xLc8ntj4561h0KG95bBfX/P+
         BCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752201112; x=1752805912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hpxRkNYRuqENsjSxqDYk0zNqW0LZ1+U3jypHB6kGXw=;
        b=OAG6slbPTl4pVvibEYgsBMZ4KzHvKmikPMjevd8mULzh9GCnYnnNYkimx3TM4yPP3S
         TPQP4i9fjyi/Nzo/wi/bTQ6R+Gx39r1uIX4oJuqf44fL0OY3NSVOxLrX1w1Ov2+0WCVr
         3PLjVjQTqAsJxmAgRYkoDGQpedSRceL/B6x+ieNcG4q911hc79gSVvUGVj+VQBtRtalv
         MTMk6MY44LyE5DdLxxW3XwFc434NIu7dZTgWYEUlf2qdK58BtotvpSBiL3TW116fz31A
         fz1zSTrAA89OGBaiwEnSzRgL+6Tx0wOZxT1RZ2B59MFy7tRYYKVRbhXbvuPzZicvM5xP
         uK6A==
X-Forwarded-Encrypted: i=1; AJvYcCXC3biR68DyB7ssXcICuOeTDJtXTUjcpsJzzKq4P0hOclxRZGSkzCmZGoC9fhUeOjmPxgW8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3yYT2hAyBQPtu43hztSTHfcHqsAjmHecK2MXpAA+J0gGL17F2
	uTzJ+/5F+fI5tSvUnhGO31dkVJuPJx9fQth+InmwTGoJQ5DNvaZGuOSg
X-Gm-Gg: ASbGnctVJJXjvP1JoRdyl4mA98QE/tji1hlwC/pfIeEVQqLEcpT88YAsG3sQxqSgDsQ
	8HvvBYSFOgtB3UaXblkRJw7XOj5hhIuIA2HjqiguitM9aQyept/yE/VFwUBO1bM2CkD49r12LGH
	LvQ2bRCknUNz6PhuBCtXdOuFi/uv4ZqnGEVSwB5Rtna4HbxwCTb9IG5dqL3hcG+/eAdkjbIP0kP
	R2aIkC17BV1vq16jfNg/w/pY8ibMUweEHkWpowK1MCPCWOaNce5aOwUGaxGUjzAsxFaJbDeK+64
	2sSCKI9FN79IUEnvggRunMZju4xVYqNjhZ5Ljq2q3cXgaDh8MHYqWWpNdn5cMbnYSm7PqkHf3tS
	N2MjFxKbrHZFpBNufl9ByYxV7Xx1G2aKKE4Q7F7fQbf6BajMVVpTjpM4kG5nE0851KWMCaFlvWw
	gCsG7QWyjyvyYa
X-Google-Smtp-Source: AGHT+IE4R+kXFovwAQJmZ+v8jqidWY5K2h3e6hQAjYhhgIxztQTNavaWz/IaBUBUvPNaZ4bACtvsYA==
X-Received: by 2002:a05:6214:da9:b0:6ff:1665:44ef with SMTP id 6a1803df08f44-704a4216423mr26754716d6.22.1752201112490;
        Thu, 10 Jul 2025 19:31:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-704979e40b6sm15319656d6.46.2025.07.10.19.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 19:31:52 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 82CAAF40068;
	Thu, 10 Jul 2025 22:31:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 10 Jul 2025 22:31:51 -0400
X-ME-Sender: <xms:l3dwaDjCBzuIOtKkXwkkM9WAlS73Aq5nkFvKXN93XoYOd_TT0zh62g>
    <xme:l3dwaLgIRA1-AMiQ0EzhaINKPj0JsaLuaCEgUuRY_GfugsSsDP579a3VQ4LZCRAaQ
    y99gtIJlKhWZUNTWw>
X-ME-Received: <xmr:l3dwaJG9HUf_YlBzMNT7McDBjDlJXoRHWb5JSBXPMHkttbPdWfzwumJTJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlvghithgrohesuggvsghirg
    hnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehp
    vghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepuggrvhgvse
    hsthhgohhlrggsshdrnhgvth
X-ME-Proxy: <xmx:l3dwaODRLba5tSugkVy_SP5N2J9lXjZmT8GsRr6JY6JsnQms934OMw>
    <xmx:l3dwaF_ia8kPFVbnpkmLR4iT8OTaym4i5NUU--E2eeO-jcBew5COPg>
    <xmx:l3dwaBh4NeApwlomub9O-GiDghFI1ejzHhFcw_iXo7b9xP8SvotDxA>
    <xmx:l3dwaOZKDnHFn1g8IKD4re89LI2ZFnt6ibBZvi-GRMte1sPEOTWeWA>
    <xmx:l3dwaDTgLKUwWlkHjAJaVOemsmbbyA_i2h9K6eiqi-pfk682wMDdl4KD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 22:31:50 -0400 (EDT)
Date: Thu, 10 Jul 2025 19:31:50 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, aeh@meta.com,
	netdev@vger.kernel.org, edumazet@google.com, jhs@mojatatu.com,
	kernel-team@meta.com, Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 8/8] locking/lockdep: Use shazptr to protect the key
 hashlist
Message-ID: <aHB3lh4zkh8g5H1T@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-9-boqun.feng@gmail.com>
 <i3mukc6vgwrp3cy5eis2inyms7f5b4a6pel4cvvdx6jlxrij2g@wgrnkstlifv3>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i3mukc6vgwrp3cy5eis2inyms7f5b4a6pel4cvvdx6jlxrij2g@wgrnkstlifv3>

On Thu, Jul 10, 2025 at 07:06:09AM -0700, Breno Leitao wrote:
> Hello Boqun,
> 
> On Tue, Jun 24, 2025 at 08:11:01PM -0700, Boqun Feng wrote:
> > Erik Lundgren and Breno Leitao reported [1] a case where
> > lockdep_unregister_key() can be called from time critical code pathes
> > where rntl_lock() may be held. And the synchronize_rcu() in it can slow
> > down operations such as using tc to replace a qdisc in a network device.
> > 
> > In fact the synchronize_rcu() in lockdep_unregister_key() is to wait for
> > all is_dynamic_key() callers to finish so that removing a key from the
> > key hashlist, and we can use shazptr to protect the hashlist as well.
> > 
> > Compared to the proposed solution which replaces synchronize_rcu() with
> > synchronize_rcu_expedited(), using shazptr here can achieve the
> > same/better synchronization time without the need to send IPI. Hence use
> > shazptr here.
> > 
> > Reported-by: Erik Lundgren <elundgren@meta.com>
> > Reported-by: Breno Leitao <leitao@debian.org>
> > Link: https://lore.kernel.org/all/20250321-lockdep-v1-1-78b732d195fb@debian.org/ [1]
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> First of all, thanks for working to fix the origianl issue. I've been
> able to test this in my host, and the gain is impressive.
> 
> Before:
> 
>          # time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1234: mq
>          real    0m13.195s
>          user    0m0.001s
>          sys     0m2.746s
> 	
> With your patch:
> 
> 	#  time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1234: mq
> 	real	0m0.135s
> 	user	0m0.002s
> 	sys	0m0.116s
> 
> 	#  time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1: mq
> 	real	0m0.127s
> 	user	0m0.001s
> 	sys	0m0.112s
> 
> Please add the following to the series:
> 
> Tested-by: Breno Leitao <leitao@debian.org>

Thanks! Will apply ;-)

Regards,
Boqun
