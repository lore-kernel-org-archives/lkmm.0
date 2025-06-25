Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D61C5D55
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 15:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865099; cv=none; b=uyOY4ce1yfJ8/KPt/ZtLgXd9DqlXcS4wxmEGCs6lwQvwVZ2Xbv7K2dA6p+XCcCQVxKHLHuoaKOGDDAQuKoA0xqS433ziLTZFYixXxWf8nIEWlf9s/NDvmS4f8vHA+O8vx/ikYXdtOJ/h/CRA0UKeKyETBRkGy/Kp42/4c+3fYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865099; c=relaxed/simple;
	bh=DVaxS9mTINZk0rvzzEi0zAW5HSrGIGK0lZqID2qLB+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJl/J0oqp02ku7kSaciI0ircc3+vq5TsrQdF09naNgFOb7ew8h0oe5qvRM9SuAMsY3lm6o7+YvJub5SYHTLPNhNupWY5+mdCv8gqBtUF9khu1Y4XZhkA9zTlLa1wwugQ0K4ux2MsWAkVClOjxZQc4sguR7p1bmUozF2UtEROczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHnRgEDu; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHnRgEDu"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5a196f057so524411cf.3
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 08:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865097; x=1751469897; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ST35E8pfOiK/1Yn/IFpq1998QsVUH66BaD6x0ib8XaU=;
        b=ZHnRgEDuB1xdKYwu5qqEIGUQA/ZsCO4kJ85n6tqMchDchlLO+htsw+YhhBPOkHd++C
         M8nDzAZjw9fptn+E6FnHPQ/yZ/peREYV70j0xw92A86vpx1xENLKGQHygUhTnAlQjNBH
         NWSrJl49s/L/UE4K09T/MK3fbxNm0kETftJYMYUbqzE+byIvAu/90aWOW7kuF9eOliMz
         0/JAFGmalmN5EUbFZEk74QE4didGU8jaS6HRXIJPfr33QTUJ1WhJLW1LdqTNH0tJHNQg
         6YvefsCWj57Qex743l7xsgqT5kQ2fRrkfnq7le44MbGqoKH8UeJ9wI32LvNKUomrU/B0
         zM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865097; x=1751469897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ST35E8pfOiK/1Yn/IFpq1998QsVUH66BaD6x0ib8XaU=;
        b=iWXsPD1cB1Kzaa9hLsCzaQaiCrz9RuX7FxDfgklNaBrc20gdJqD2O3Qwp7jslIG0mI
         VEbA8b85c40a6/aPEPQ3eI03WYY3Z9Thw1fufQlU3vpH0uzDvB6a1R45YIPyQQnKIiry
         w5M4BIjVIP1atXaMpIK9LqkiDdYr7IN3Ez+UaRdbpyXqOsS78T/ra2iDPN8S8tXiS5F2
         JXWgDox3eTUVOGYhZNemT6lyuDQuE4m84OdfYU1NvKVyWP7MhwQlyX/joi0bUujgCgDK
         5JKUyMSGWG+KbkzkjMv9/3EGmgcpeUeq9vmZgK6Rnb0AWZn8T3niZaiQIAvrrNhXAPT1
         ZErA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNY2QllDubJ5fyHMYUa6c+Uf8/xYJNwlyhK4bpRXjeLb4/8LwGLYDI0+7WLZBuY5KWnS3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu8p2WlGqyV1uKWmyoZ7/jCjDlf2cpudaRuD005ws6wfW/o0ga
	cHasaJPpsQOWIM6bAVq+iPdZ8ShAspcRvGrdYmEsC+6J5vQlQEGXNw40
X-Gm-Gg: ASbGnctuMf3zjSIqG0CdO+261H67jsHsO9yXd20jRlR2R5J3ILObJKvqb9ZfcNQD2lV
	pitST2CTeHkI6RgVptmvkBCCPZFVb64VaTwE6Iw7lt6YDplwson4BRTGq/im6+y5DQx7tS/UQvj
	rK7iyTjox8PcQJZIOX8znPHZDl0XOueOLiSMXFye+molRa+TLsnmBO+NznRoys85d7t+4luUkNE
	e7s5SD5fyF4lxAyW02HENfvfhIUS3kfIGX5QSiBYFArsmUBpImF4eMmLEJjZJY2ZOvLLxCa51DE
	5tcF/zC0Mq+pOj5CdCuFTdQLocMu7D3CRItruF2lLX1NZ0e/NVOfVRBIblwjlCCjW6tXGJ0X21+
	hcHiQ+LpAEq1o6b2b2C9DScy1znaE7QXWkgON9E9iMR0PkCkxKQjy
X-Google-Smtp-Source: AGHT+IHSHF4por84O5ihD13mbCVJ7lpg+HRk5vsTlb5fCqjI7ut2qlgYqwNXArOEw1tTdM6stSMZ5A==
X-Received: by 2002:ac8:5894:0:b0:4a4:4103:f301 with SMTP id d75a77b69052e-4a7c0238ac5mr57115501cf.0.1750865096376;
        Wed, 25 Jun 2025 08:24:56 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fbe06sm617917785a.94.2025.06.25.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:24:55 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5313EF40066;
	Wed, 25 Jun 2025 11:24:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 25 Jun 2025 11:24:55 -0400
X-ME-Sender: <xms:xxRcaIp0-3z8Y82Uxt2hVCZV8kIa1hAGuObc1oIZ1qXg6d_bgmERrg>
    <xme:xxRcaOq28oQPCOkPkxmycqOcEJpMG11hbwxIbqKkNmtPa6__qxPDueYPehkWMRG-h
    tLCuWUQn5O7MsURqQ>
X-ME-Received: <xmr:xxRcaNN1xi6iCfXozA66TncMfc37ecEv-3kURRDbr1QAlfUmdLucsgfW2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfeduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfrhgvuggvrhhitgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgt
    uhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    ifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepuggrvhgvsehsthhgohhlrggsshdrnhgvth
X-ME-Proxy: <xmx:xxRcaP4owxUiMUd1ZE-tIHcSRGwqSDial2gl1MrTtL-Jglnlq6xhBA>
    <xmx:xxRcaH5sWOVDw1NtamZwNzNWwSSVM8VfQdQt4h6T5WIcY4Zj0KWmIA>
    <xmx:xxRcaPgBLuEEfc09Q2iiwixCj4ufuP0YgnsrM_0n3-uKpzyiIV5SCA>
    <xmx:xxRcaB44mYkmJRvK5tl0T_uAVso9nWdY53Z3D2XoB-dwvhzb0DMU8g>
    <xmx:xxRcaKKlAAdPhdSHMinHEPHnUnZd7R9n-wzF9ZMBySHaqyhUGGWfu-3n>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 11:24:54 -0400 (EDT)
Date: Wed, 25 Jun 2025 08:24:53 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
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
Subject: Re: [PATCH 4/8] shazptr: Avoid synchronize_shaptr() busy waiting
Message-ID: <aFwUxblhRjh24JF1@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-5-boqun.feng@gmail.com>
 <aFv_9f9w_HdTj9Xj@localhost.localdomain>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFv_9f9w_HdTj9Xj@localhost.localdomain>

On Wed, Jun 25, 2025 at 03:56:05PM +0200, Frederic Weisbecker wrote:
> Le Tue, Jun 24, 2025 at 08:10:57PM -0700, Boqun Feng a écrit :
> > +static void synchronize_shazptr_normal(void *ptr)
> > +{
> > +	int cpu;
> > +	unsigned long blocking_grp_mask = 0;
> > +
> > +	smp_mb(); /* Synchronize with the smp_mb() in shazptr_acquire(). */
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		void **slot = per_cpu_ptr(&shazptr_slots, cpu);
> > +		void *val;
> > +
> > +		/* Pair with smp_store_release() in shazptr_clear(). */
> > +		val = smp_load_acquire(slot);
> > +
> > +		if (val == ptr || val == SHAZPTR_WILDCARD)
> > +			blocking_grp_mask |= 1UL << (cpu / shazptr_scan.cpu_grp_size);
> > +	}
> > +
> > +	/* Found blocking slots, prepare to wait. */
> > +	if (blocking_grp_mask) {
> 
> synchronize_rcu() here would be enough since all users have preemption disabled.
> But I guess this defeats the performance purpose? (If so this might need a
> comment somewhere).
> 

synchronize_shazptr_normal() cannot wait for a whole grace period,
because the point of hazard pointers is to avoid waiting for unrelated
readers.

> I guess blocking_grp_mask is to avoid allocating a cpumask (again for
> performance purpose? So I guess synchronize_shazptr_normal() has some perf

If we are talking about {k,v}malloc allocation:
synchronize_shazptr_normal() would mostly be used in cleanup/free path
similar to synchronize_rcu(), therefor I would like to avoid "allocating
memory to free memory".

> expectations?)
> 
> One possibility is to have the ptr contained in:
> 
> struct hazptr {
>        void *ptr;
>        struct cpumask scan_mask
> };
> 

You mean updaters passing a `struct hazptr *` into
synchronize_shazptr_normal()? That may be a good idea, if multiple
updaters can share the same `struct hazptr *`, we can add that later,
but...

> And then the caller could simply scan itself those remaining CPUs without
> relying on the kthread.

.. this is a bad idea, sure, we can always burn some CPU time to scan,
but local optimization doesn't mean global optimization, if in the
future, we have a lots of synchronize_shazptr_normal()s happening at
the same time, the self busy-waiting scan would become problematic.

Regards,
Boqun

> 
> But I'm sure there are good reasons for now doing that :-)
> 
> Thanks.
> 
> -- 
> Frederic Weisbecker
> SUSE Labs
