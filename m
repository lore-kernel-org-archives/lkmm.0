Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A60D288513
	for <lkmm@lists.linux.dev>; Fri, 19 Dec 2025 06:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124391; cv=none; b=a/VxcBj9PP4jytPLGNM2k1d+mJaoV5h+Y8wxkAHaMJOhzKjc2fppCb2rKV0PtO0La5mlyZ//AvoJwvJ4lRJxYvdUZEe4IjzXKHsncEwXKTC6yRpiXPq351rRtTscvnSU0PqbNmLKjXPPx/q0wKxo5kRVNEyUJ9AAZBd0+zycuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124391; c=relaxed/simple;
	bh=7u8hnCfa5QgERO4V42EUXwsuYhCoJ8wvN176FpuH0rM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=I+neRTuWhRuB1zyGTZRdqL0Hg3E/tG4/XbOrVVG4g9MSqbSFK6LvKzV89mvLR18qhG1b/kv9l9UohXe5NFed+2MbMaRXyiyLvIw+dBwSyK9PUnB89iFVLzefPR+RjRkbMD40jol/7I9oZAxDpGm8w22kHJi3TzZJ4OsEfuW2h/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=LS4HZyjS; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="LS4HZyjS"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-11beb0a7bd6so3475158c88.1
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 22:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1766124389; x=1766729189; darn=lists.linux.dev;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4ASvqOPK+wdtj+DunJ4RuJFwNDx19O3Ghp3000vvXE=;
        b=LS4HZyjSLwuoVeguKhFyCphDM3KP16b5i5/AfY29DURKSSpyadznm2pACGXw/LetHT
         PcDMpKnUgC3wsjFeiuWjSOxJiyJVRODFc6U0yn2Wma9al+eh0UEJ654KrV4aEt417GHs
         4xpO7V35n8te+2IMfay9H57t3YASG0a/mGugU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766124389; x=1766729189;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4ASvqOPK+wdtj+DunJ4RuJFwNDx19O3Ghp3000vvXE=;
        b=OmefTl7yADqy93CsjMkHLKvdUAuQsDQRzAdjOtdwIpm2ktyt2gdNDwmaNq00JqelAG
         o0/Q8qt1GObTHyfN9HyXcOvLt8ydkKNCLLqexMsFwfO2uQHRdY6qLydzG+un+ZzGk8rk
         h2LaSRx20uJG22w1CT+crEr3Yh4KWXyE4e30L84QkH0ppDfN8l4kuw4OnW56NWfVeWj2
         hfyRrOUP1Y2o+8OIWlnAOg/vDSXMVWiN4jlDq2zWMgn6dNH4Spq33uRIWglc0IU3gPOt
         VgiUubonZrZOEBSXvRHGE/5buB9xDV/WsjTchHX8Hb2VuPCl2WH6O95gu1+FiVdMqekt
         TPhg==
X-Forwarded-Encrypted: i=1; AJvYcCXYfcJSLvMUcR8yXzcrsc/+u9wQUqg5OLeG8QVpFtqueUrYprEn5Xa2IJ4Osum0rThzldZC@lists.linux.dev
X-Gm-Message-State: AOJu0YxhbsFJI4OWiHxTCbyISyj+wiZCMs7F6G1m43tKCmJpBJbz+9fT
	OJalOCHzgh1+dUfX42iuS8F6qA30y6GjeEE9JW+n2QfHX1W24Zoipdmn6s02WIVEFYc=
X-Gm-Gg: AY/fxX5ps8iBWycsaQxU89utfYLL8kfOHx6eM6M6SA8v9cBNOl7EH1vZMrpY4VOx8D9
	DK5qjdUStOjCAFZBcSgLEe3qcygSLGjvuy/47wyxcG2D5knu+KIgtuw4MOLxwNZHPy5f0Op/NXr
	CERqXjTbv8lFE/Lt+ZBJ/pjxJ5vL/F1nwkKOFgUCyVEYo05Dtc13VWMkgm/Xid0sMf59CGclTpf
	2h6AvuWcUnvRISIMhrNn6Gd5+PFgDTlmH9RQwnn4vEsXL20a3sJeerTZbcfrsIyUQo009TtXgm6
	HyEX8Cfx5RoTtEWA7DMtqnB9ZPX//rvhfQo7jYf4BWoeuzAn50u658zdImZO75IEEh9yuZsu/C9
	uLmBRyOHUuTd4ZO94A6XrbKM/YdOydx9xYzSaSulVxEo+Is7PtySXniv7QG3lKiIPV1Ga4FJHsI
	QZgkAm66sewTtIih6bHSHxszSBOvUZJ/Ub5w==
X-Google-Smtp-Source: AGHT+IGwMAZNN8AD5qW4BbAhXwX1eHbt0owrDB1h0dBh3YezG4fRDCPDgmTWlW9rY3wcM+7oOchshg==
X-Received: by 2002:a05:7022:698b:b0:11b:9386:a38f with SMTP id a92af1059eb24-12061991877mr5710079c88.22.1766124388926;
        Thu, 18 Dec 2025 22:06:28 -0800 (PST)
Received: from smtpclient.apple ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm5150094c88.5.2025.12.18.22.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:06:28 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v4 3/4] hazptr: Implement Hazard Pointers
Date: Fri, 19 Dec 2025 01:06:16 -0500
Message-Id: <BEBCE6F9-F76A-4443-AEF7-9E0D80039F41@joelfernandes.org>
References: <aUSbhiMgluudbVEG@tardis-2.local>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev
In-Reply-To: <aUSbhiMgluudbVEG@tardis-2.local>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: iPhone Mail (23B85)

Hi Boqun,

> On Dec 18, 2025, at 9:07=E2=80=AFPM, Boqun Feng <boqun.feng@gmail.com> wro=
te:
>=20
> =EF=BB=BFOn Thu, Dec 18, 2025 at 06:36:00PM -0500, Mathieu Desnoyers wrote=
:
>> On 2025-12-18 15:22, Boqun Feng wrote:
>> [...]
>>>>> Could you utilize this[1] to see a
>>>>> comparison of the reader-side performance against RCU/SRCU?
>>>>=20
>>>> Good point ! Let's see.
>>>>=20
>>>> On a AMD 2x EPYC 9654 96-Core Processor with 192 cores,
>>>> hyperthreading disabled,
>>>> CONFIG_PREEMPT=3Dy,
>>>> CONFIG_PREEMPT_RCU=3Dy,
>>>> CONFIG_PREEMPT_HAZPTR=3Dy.
>>>>=20
>>>> scale_type                 ns
>>>> -----------------------
>>>> hazptr-smp-mb             13.1   <- this implementation
>>>> hazptr-barrier            11.5   <- replace smp_mb() on acquire with ba=
rrier(), requires IPIs on synchronize.
>>>> hazptr-smp-mb-hlist       12.7   <- replace per-task hp context and per=
-cpu overflow lists by hlist.
>>>> rcu                       17.0
>>>> srcu                      20.0
>>>> srcu-fast                  1.5
>>>> rcu-tasks                  0.0
>>>> rcu-trace                  1.7
>>>> refcnt                  1148.0
>>>> rwlock                  1190.0
>>>> rwsem                   4199.3
>>>> lock                   41070.6
>>>> lock-irq               46176.3
>>>> acqrel                     1.1
>>>>=20
>>>> So only srcu-fast, rcu-tasks, rcu-trace and a plain acqrel
>>>> appear to beat hazptr read-side performance.
>>>>=20
>>>=20
>>> Could you also see the reader-side performance impact when the percpu
>>> hazard pointer slots are used up? I.e. the worst case.
>>=20
>> I've modified the code to populate "(void *)1UL" in the 7 first slots
>> at bootup, here is the result:
>>=20
>> hazptr-smp-mb-7-fail    16.3 ns
>>=20
>> So we go from 13.1 ns to 16.3 ns when all but one slots are used.
>>=20
>> And if we pre-populate the 8 slots for each cpu, and thus force
>> fallback to overflow list:
>>=20
>> hazptr-smp-mb-8-fail    67.1 ns
>>=20
>=20
> Thank you! So involving locking seems to hurt performance more than
> per-CPU/per-task operations. This may suggest that enabling
> PREEMPT_HAZPTR by default has an acceptable performance.

My impression is we do other locking on preemption anyway, such as the block=
 list for preempted RCU critical sections. So maybe that's okay. As you said=
, it is an acceptable performance.

>>>=20
>>>> [...]
>>>>=20
>>>>>> +/*
>>>>>> + * Perform piecewise iteration on overflow list waiting until "addr"=
 is
>>>>>> + * not present. Raw spinlock is released and taken between each list=

>>>>>> + * item and busy loop iteration. The overflow list generation is che=
cked
>>>>>> + * each time the lock is taken to validate that the list has not cha=
nged
>>>>>> + * before resuming iteration or busy wait. If the generation has
>>>>>> + * changed, retry the entire list traversal.
>>>>>> + */
>>>>>> +static
>>>>>> +void hazptr_synchronize_overflow_list(struct overflow_list *overflow=
_list, void *addr)
>>>>>> +{
>>>>>> +    struct hazptr_backup_slot *backup_slot;
>>>>>> +    uint64_t snapshot_gen;
>>>>>> +
>>>>>> +    raw_spin_lock(&overflow_list->lock);
>>>>>> +retry:
>>>>>> +    snapshot_gen =3D overflow_list->gen;
>>>>>> +    list_for_each_entry(backup_slot, &overflow_list->head, node) {
>>>>>> +        /* Busy-wait if node is found. */
>>>>>> +        while (smp_load_acquire(&backup_slot->slot.addr) =3D=3D addr=
) { /* Load B */
>>>>>> +            raw_spin_unlock(&overflow_list->lock);
>>>>>> +            cpu_relax();
>>>>>=20
>>>>> I think we should prioritize the scan thread solution [2] instead of
>>>>> busy waiting hazrd pointer updaters, because when we have multiple
>>>>> hazard pointer usages we would want to consolidate the scans from
>>>>> updater side.

Yeah the scan thread idea also fixes the scan cost issue with per-task slots=
 if we batch. If we implement a separate hazard pointer flavor along those l=
ines, then maybe we should definitely do a worker thread.

>>>> I agree that batching scans with a worker thread is a logical next step=
.
>>>>=20
>>>>> If so, the whole ->gen can be avoided.
>>>>=20
>>>> How would it allow removing the generation trick without causing long
>>>> raw spinlock latencies ?
>>>>=20
>>>=20
>>> Because we won't need to busy-wait for the readers to go away, we can
>>> check whether they are still there in the next scan.
>>>=20
>>> so:
>>>=20
>>>    list_for_each_entry(backup_slot, &overflow_list->head, node) {
>>>        /* Busy-wait if node is found. */
>>>        if (smp_load_acquire(&backup_slot->slot.addr) =3D=3D addr) { /* L=
oad B */
>>>            <mark addr as unable to free and move on>
>>=20
>> But then you still iterate on a possibly large list of overflow nodes,
>> with a raw spinlock held. That raw spinlock is taken by the scheduler
>> on context switch. This can cause very long scheduler latency.
>>=20
>=20
> That's fair.

What about combining both approaches? =20
Can we do the generation trick along with worker thread scanning? I feel tha=
t should be doable.

>=20
>> So breaking up the iteration into pieces is not just to handle
>> busy-waiting, but also to make sure we don't increase the
>> system latency by holding a raw spinlock (taken with rq lock
>> held) for more than the little time needed to iterate to the next
>> node.
>>=20
>=20
> I agree that it helps reduce the latency, but I feel like with a scan
> thread in the picture (and we don't need to busy-wait), we should use
> a forward-progress-guaranteed way in the updater side scan, which means
> we may need to explore other solutions for the latency (e.g.
> fine-grained locking hashlist for the overflow list) than the generation
> counter.

Hmm.. That only works I guess if there is no interference between the finger=
 grained list being iterated and the list being overflowed into. Otherwise, I=
 think it might run into the same issue, but I could be missing something ab=
out the idea.

thanks,

 - Joel


>=20
> Regards,
> Boqun
>=20
>> Thanks,
>>=20
>> Mathieu
>>=20
>> --
>> Mathieu Desnoyers
>> EfficiOS Inc.
>> https://www.efficios.com
>=20
