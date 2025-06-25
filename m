Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EB264634
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860544; cv=none; b=Evp8lx5NPQCBuCnyJKzgNGMZgIkXA3TvUHcdZTDoNBPFLh7E6sGsHxOpFnxvtgT2f3sEyb/dTsytq1nVIU5S/9KepTeq4iuFhXysBaO8GrkZWSuSp8ud0oiuJFHwLIXPP8GkxNXeKjsxwHfuoKxLA/NnvlDsRI27t1f/yrW1WLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860544; c=relaxed/simple;
	bh=WpwnfGVGjxp5of/6IZTd6KwuTsBR7L32KPSN66Lelok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUbAdooXDDtDQQ5+o4nK77C7S+Qb6U4snCj9Dj+Atvl/uchEpBn73zikHBQZKlbPk/VzV/2cIuG8mw68308DKdPwlCIOMU8rMQcfDpDhyLiPL9DFbQEG1gVSIFyXSL5ezqJXy1kLh5vJX6EJ5icwJbCh0RJEH0PLpKFSbr/KuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt+KgqTR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt+KgqTR"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d38d562a55so836073485a.2
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750860541; x=1751465341; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJCFyxNIJ7B2fFTdwEw8L9jsO7+gbSPGHGFr4LFZGcg=;
        b=Bt+KgqTRf++Cdd05Pa2kcCIhS40OylJ9PbySIoU4AjKaKNuglFws+mZc7ob1XRknRR
         eO2Imgyx1v8raJbHBLiEuKeSP8RbKeaxBB94ukMQA3nMCW7jyWAJUh916wDsREQ806T3
         kchAuECTOZshylgcYpVMvaizA+5rIhT3hw4UPDSI0DSisefH5naFqy/CrrxJFQheWmXn
         8X6CHz8KSZqnAjo8NtGumAeyORKXCky/dx5mYW1ohgikd7HnrVk2xAnqj3HoZ5l7Csoz
         UFKpEQ+EczIIpV3Hx5JZFAM6MDApr6PZ0AgWhvnu0mI9tyghVxhJLiZXA4vuepOUdOYh
         3TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860541; x=1751465341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJCFyxNIJ7B2fFTdwEw8L9jsO7+gbSPGHGFr4LFZGcg=;
        b=dAgg/34W87wL1OzWCU63s8QhGZUdnqyTel0NWphmdgX0/dzLhCT1s48UUNqitTeRUi
         YroxPFL8yxdDZog6CjiZxWxWH9ZSbXIZWI0Xr79y+rnA+s9eCMda0KJUAqHlaHX+hM0k
         unXkfdQJfUktguyxXC342vyyRDDjdWEYXpexfCt3EtJ+P13lVkVOUn1HUxyrpSghLpP2
         7Y72IPL2nXo1buUFC/z3zGpTQHdwBWphtz4uYJ6x4uFCjRztmGIp/F8L0q+4F+BQdSce
         q74j0U1ANBfOmLAJxoE7p5wb9Z/vV7cu/TJyykQ8Wnj1Jyf6HebG271t32e1j5izzAwX
         iPzA==
X-Forwarded-Encrypted: i=1; AJvYcCXTOzxbGq14XpGnNbM9eWVgZZcZdY6sF+ojOgv119p7g2KODcIYiM0bTA6c3nI95qRctjKm@lists.linux.dev
X-Gm-Message-State: AOJu0YyGzNqxZZdT7Tmy8xI/ZsVFVSyR9rHJRP9UVIz4HCopSWrvfBfM
	cqwrpKbU7LouLCTDNdl8mbVzAOk/oGAI4ohMZt0i6OwOygmCfvL0fPYC
X-Gm-Gg: ASbGncsE+4ICVAwu/ED1lORHliVRn6MPUDvUNMWgHU5fjiDhLS/ds1jyK3o29BkZJdi
	CpmJRtSJ5Y1yymgMeJNMgN5cm0pwHsWj86dwqiKd9WRdoSbLJ9/lJxnU6uxNevEtl8VGilJQjyO
	S0GKEIbzE+4Z/AX63teHxZgwO4tjaphSUnjevNVpWvGTm1UoeaYXV1+AGs6bjh5RJk6cb1JXpOa
	hrwAv8j14XKHKJhaNHX5b0EMrQGnP31vQLWClIG4RV8rJsSobLPahkEDIy/NWj39Verm05u35b2
	m2KLfMTH9eSfluU1IqaxyDFDzPdXc+qFqPFLy5A/hbfgHld9NnJVkaFxP0edcZ49jaCGTwVepZT
	q3ORgghN1o94q15R8fhqH0LEnd0VFHJrbhAgFoMnkwQfvV6PjGTri
X-Google-Smtp-Source: AGHT+IGP3xXAQS3aRTeDmPFsQlYIlwFJjsOntFEA1J01weuYZPTG6VG9nUgH89lQn3xG0BigJ5bv8w==
X-Received: by 2002:a05:620a:2902:b0:7d4:e3e:6606 with SMTP id af79cd13be357-7d4296d49d5mr473909885a.18.1750860541118;
        Wed, 25 Jun 2025 07:09:01 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999bfdasm618007285a.1.2025.06.25.07.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:09:00 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C6F9FF4006B;
	Wed, 25 Jun 2025 10:08:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Jun 2025 10:08:59 -0400
X-ME-Sender: <xms:-wJcaJdwbGZBmxEN9j6y_78lQL4fcdBQvDTlOCyqeew87MY_tXnEHg>
    <xme:-wJcaHO2fQ7GEaRxo6xqYDR28zh9SO-8ANjsQIwEDCtQd40EvDSAFHyG6ll5l7hnG
    u-Ol92oGK7gJditFA>
X-ME-Received: <xmr:-wJcaChZ1gB2oei1fHWaEjpsWflJu3QQnVqBK3jhFv5uI2C5hjTofK4kKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdeljecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohephhgthhesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilh
    hlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdr
    tghomhdprhgtphhtthhopegurghvvgesshhtghholhgrsghsrdhnvght
X-ME-Proxy: <xmx:-wJcaC9SIRUxm3GO8s19-RXkdVH_rArIOhzfzpcmzNM-_d39bSt6Ew>
    <xmx:-wJcaFv8nbBOJLcGByCnAxajdWVjxopT8SmEcUiCmBZZYZC3PgMoTg>
    <xmx:-wJcaBHRyDLwhfOzIx4pKXsYEiKQJhUSMNQ4wc5h5L1PAdmOSr8nYQ>
    <xmx:-wJcaMPbn_fTVl6EW6q6E9gbgVJTQ0WkpFPVpeq40MWWr-yF0GC_iw>
    <xmx:-wJcaOOQ9shCLPu7c6XInbYEihY93p9riyskcRSe86qZBaWl3X3bFgqB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 10:08:58 -0400 (EDT)
Date: Wed, 25 Jun 2025 07:08:57 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
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
	Zqiang <qiang.zhang@linux.dev>, Breno Leitao <leitao@debian.org>,
	aeh@meta.com, netdev@vger.kernel.org, edumazet@google.com,
	jhs@mojatatu.com, kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 0/8] Introduce simple hazard pointers for lockdep
Message-ID: <aFwC-dvuyYRYSWpY@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <aFvl96hO03K1gd2m@infradead.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvl96hO03K1gd2m@infradead.org>

On Wed, Jun 25, 2025 at 05:05:11AM -0700, Christoph Hellwig wrote:
> On Tue, Jun 24, 2025 at 08:10:53PM -0700, Boqun Feng wrote:
> > Hi,
> > 
> > This is the official first version of simple hazard pointers following
> > the RFC:
> 
> Can you please put an explanation of what hazard pointers are
> prominently into this cover letter?
> 

Sure, I will put one for the future version, here is the gist:


Hazard pointers provide the similar synchronzation behavior as RCU:
readers are cheap, updaters need to wait for existing readers to go
before they can free the objects.

The difference between hazard pointers and RCU is that instead of
waiting for a grace period, which all the readers have to exit the RCU
read-side critical sections, the updaters of hazard pointers only need
to wait for the readers that are accessing the objects they are about to
free. For example, if we have 2 readers accessing different objects and
1 updater is freeing one of them:

using RCU:

	Reader 1		Reader 2		Updater
	========		========		=======
	rcu_read_lock();
	r = rcu_dereference(a);
				rcu_read_lock();
				r = rcu_dereference(b);
							synchronize_rcu();
	rcu_read_unlock();
				rcu_read_unlock();
							<synchronize_rcu() returns>
							free(a);

The updater will need to wait for reader 2 to finish before it can
free 'a', however when using hazard pointers:

	Reader 1		Reader 2		Updater
	========		========		=======
	g = shazptr_acquire(a);
				g = shazptr_acqurie(b);
							synchronize_shazptr(a);
	shazptr_clear(g);
							<synchronize_shazptr(a) returns>
							free(a);

				shazptr_clear(g); // <- updater doesn't
						  //    need to wait for
						  //    this.

The updater's wait can finish immediately if no one is accessing 'a', in
other words it doesn't need to wait for reader 2.

This means for a particular workload, hazard pointers may have smaller
memory footprint and less updater wait time compared to RCU, while still
have the similar performance on the reader side.


That being said, it does come with some cost, the readers would need to
provide their own hazard pointer slots (allocating memory) in general
cases. And in the simple hazard pointer implementation in this series,
although readers don't need to provide their own hazard pointer slots,
they need to disable the preemption to use the hazard pointer, and the
performance would downgrade (to a naive SRCU implementation probably) if
they want to protect multiple objects in one read-side critical section.


Regards,
Boqun
