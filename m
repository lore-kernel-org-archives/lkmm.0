Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626EB1ADC69
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873687; cv=none; b=DrnJDxqG7t7oJWgcLI75mq67GMW/fjb/wrceUrBwysVGWJFJuXMFgCnjcIG31lnylbH7/TumMhrXkCHZFB74wF+Jg+BT1g6ZlEAOojYpr82bbwhIGcYSxX81rlyZN/XwoBcgKr53KZM+Oe0Gd5SJGIv3y27HuFn6W3w16Yjk8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873687; c=relaxed/simple;
	bh=7hhr28iehbxV1W+VLs54+Oo0mG4xdVqBfI8Lz2DxStU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hF4ELJ6epNfhJ+piCxr5qxiEilvUNP5ho22Cx5Zj6byEe4uogMFGjVPMP1iOASyTny9jLg4JCFHNaHrjR+jT7OuRJavl34pzfVOhBfjZiqDAGhIOghpWFmOFd7LlryKSFXxGUdkmFSC6QqigvzOYYjFjXWJjZgLdkNKHTTdjtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I9Ij0vl4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I9Ij0vl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750873684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwTu+Wt/h6v7ZrbX8K8bLUbTVXbSKmPqSY5AZLWV8nk=;
	b=I9Ij0vl4t6mLFZXq9pgBvFyGufBm7Bi66CvFjC6pCb1ZdwugnIsh1TXf+qfqjOLcpUmDHu
	rJznN60jbpEW+od7aUYQ6CkIJRlkITlN90f+s4ARjdKmGXZHTmoXjX95f2uXvQ5w2PEhfD
	xRN/2i3DMRFap7Q1daxcfTS0JggOh+4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-Y6HngD6bO6CEhID86CrbKg-1; Wed, 25 Jun 2025 13:48:03 -0400
X-MC-Unique: Y6HngD6bO6CEhID86CrbKg-1
X-Mimecast-MFC-AGG-ID: Y6HngD6bO6CEhID86CrbKg_1750873682
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e1d70d67so1420145ad.0
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 10:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750873682; x=1751478482;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UwTu+Wt/h6v7ZrbX8K8bLUbTVXbSKmPqSY5AZLWV8nk=;
        b=QL4mQq+NGXtEc88tuia3S5cKJhHIIZylKq5gOaPY/PJ+fm8RF/9qJJkXedCPdJJ9Og
         T56pQIufn+PsOOZvGvVE2WvMPFYPmchvuYN6gloaP5UkLqjMxCmOJwl3hwzCLGkgzMTQ
         ALin+uYQwttd9QmKzAmvl27jgSkhUW2XZVOTLNw08VIRFvIaJn2iusA0qmCeYuVTnevy
         0+LPSRYgukf6leAnsqznMSled5P3uQzNZAFrm/KJZNhWq1FiKDmwI1KiuuzRHOh5Zib/
         kWdQMhaOCK1WlPaSf0JFCh5WQXp7okGJoIhpuOfZ5ejlYNmTGEDr5dKNj2klhnduRW+r
         2qBA==
X-Forwarded-Encrypted: i=1; AJvYcCU1OKDeQ3m8btIjMv/UiMuZv7xMmL2wUzAbgilQuVI437SDDLse8Vl140ba/xa4n2BhZlEe@lists.linux.dev
X-Gm-Message-State: AOJu0YxvOY1CA570okBgvn1UP7aRkGFQ/VTW/avjfwwHH81PYQtib2Ss
	5jF+RwbnjPiY/SmifjzasoxoGT7xzlMZBOBrGS8k02N+BBmRU8uSTUA4m8AW2ciKkITeCV63UdJ
	h0AvsYSX0b7q3HWsUQAur/qxPP5SHof/4WI6XANM1Bk5jeIGpvpL2Y7M=
X-Gm-Gg: ASbGncvgtaEZZb7H8yhiQAF3OBLCUKfZmtiHIwPv6naCYS+ydJQtSShgiXt5NISAeon
	jy63FY9hfq/g4UI9Nwxb2AcR3yFdQQUqpzagrsghDGVkkGwcnbrZQ5ktz3ZIwAqvNJwRPrGAT7B
	rr1/QjLAbDmaLcBp9JorrdtvMF8Hmx7OPOFfxwMmyHDegDdqzmKN+N3wL8GTpbEKOfGOHiK+6tq
	IIz9T6Ua5zeN8x/GG5WbHu7bS4bsXYI9BjELM0Oiu4eDDCzoynTr5fvqiSBDmIH5eH/Oy7tEv6d
	xOdIWyLhfEfA6dv7u6UlCFKWr/BoC84xRaNicrERQb7DW+/JR83dn3yZ5Keqc4s1cunr
X-Received: by 2002:a17:902:f68f:b0:234:ed31:fc98 with SMTP id d9443c01a7336-2382406aaf8mr66947665ad.37.1750873682158;
        Wed, 25 Jun 2025 10:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3+PJS3xebQrgq54ldrQdwtd/GmCDOD/XYhhutmas5K7tDvKj2czAREFvQqDcBLOC9o54Cog==
X-Received: by 2002:a17:902:f68f:b0:234:ed31:fc98 with SMTP id d9443c01a7336-2382406aaf8mr66947305ad.37.1750873681766;
        Wed, 25 Jun 2025 10:48:01 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86ef84fsm135684415ad.216.2025.06.25.10.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 10:48:00 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <665865d7-aa34-40a1-b985-7d6229d272b0@redhat.com>
Date: Wed, 25 Jun 2025 13:47:57 -0400
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] Introduce simple hazard pointers
To: Boqun Feng <boqun.feng@gmail.com>, Waiman Long <llong@redhat.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Breno Leitao <leitao@debian.org>, aeh@meta.com, netdev@vger.kernel.org,
 edumazet@google.com, jhs@mojatatu.com, kernel-team@meta.com,
 Erik Lundgren <elundgren@meta.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-2-boqun.feng@gmail.com>
 <c649c8ec-6c1b-41a3-90c5-43c0feed7803@redhat.com> <aFwfUCw2izpjC0wr@Mac.home>
In-Reply-To: <aFwfUCw2izpjC0wr@Mac.home>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qeVQfdUEoJa6X-Bbj3_sVURPuHXu-_Ej5ngAWS7_BvY_1750873682
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/25 12:09 PM, Boqun Feng wrote:
> On Wed, Jun 25, 2025 at 11:52:04AM -0400, Waiman Long wrote:
> [...]
>>> +/*
>>> + * Acquire a hazptr slot and begin the hazard pointer critical section.
>>> + *
>>> + * Must be called with preemption disabled, and preemption must remain disabled
>>> + * until shazptr_clear().
>>> + */
>>> +static inline struct shazptr_guard shazptr_acquire(void *ptr)
>>> +{
>>> +	struct shazptr_guard guard = {
>>> +		/* Preemption is disabled. */
>>> +		.slot = this_cpu_ptr(&shazptr_slots),
>>> +		.use_wildcard = false,
>>> +	};
>>> +
>>> +	if (likely(!READ_ONCE(*guard.slot))) {
>>> +		WRITE_ONCE(*guard.slot, ptr);
>>> +	} else {
>>> +		guard.use_wildcard = true;
>>> +		WRITE_ONCE(*guard.slot, SHAZPTR_WILDCARD);
>>> +	}
>> Is it correct to assume that shazptr cannot be used in a mixed context
>> environment on the same CPU like a task context and an interrupt context
>> trying to acquire it simultaneously because the current check isn't atomic
>> with respect to that?
> I think the current implementation actually support mixed context usage,
> let see (assuming we start in a task context):
>
> 	if (likely(!READ_ONCE(*guard.slot))) {
>
> if an interrupt happens here, it's fine because the slot is still empty,
> as long as the interrupt will eventually clear the slot.
>
> 		WRITE_ONCE(*guard.slot, ptr);
>
> if an interrupt happens here, it's fine because the interrupt would
> notice that the slot is already occupied, hence the interrupt will use a
> wildcard, and because it uses a wild, it won't clear the slot after it
> returns. However the task context's shazptr_clear() will eventually
> clear the slot because its guard's .use_wildcard is false.
>
> 	} else {
>
> if an interrupt happens here, it's fine because of the same: interrupt
> will use wildcard, and it will not clear the slot, and some
> shazptr_clear() in the task context will eventually clear it.
>
> 		guard.use_wildcard = true;
> 		WRITE_ONCE(*guard.slot, SHAZPTR_WILDCARD);
>
> if an interrupt happens here, it's fine because of the same.
>
> 	}
>
>
> It's similar to why rcu_read_lock() can be just a non-atomic inc.
You are right.
>
>>> +
>>> +	smp_mb(); /* Synchronize with smp_mb() at synchronize_shazptr(). */
>>> +
>>> +	return guard;
>>> +}
>>> +
>>> +static inline void shazptr_clear(struct shazptr_guard guard)
>>> +{
>>> +	/* Only clear the slot when the outermost guard is released */
>>> +	if (likely(!guard.use_wildcard))
>>> +		smp_store_release(guard.slot, NULL); /* Pair with ACQUIRE at synchronize_shazptr() */
>>> +}
>> Is it better to name it shazptr_release() to be conformant with our current
>> locking convention?
>>
> Maybe, but I will need to think about slot reusing between
> shazptr_acquire() and shazptr_release(), in the general hazptr API,
> you can hazptr_alloc() a slot, use it and hazptr_clear() and then
> use it again, eventually hazptr_free(). I would like to keep both hazptr
> APIs consistent as well. Thanks!

Thanks for the explanation. Maybe we can reuse the general hazptr API 
names (alloc/clear/free) even though shazptr_free() will be a no-op for 
now. Just that the current acquire/clear naming looks odd to me.

Thanks,
Longman

