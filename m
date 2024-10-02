Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462671D014D
	for <lkmm@lists.linux.dev>; Wed,  2 Oct 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727885651; cv=none; b=Ufs5mKrSWBY3bzooLloefszgqWDPKBD/RopuXqzvTRe8oSoW12MgqfDeEM9LSiIth0bIutNrATOXkIJs3vhoi4yNOHz/sPDisC68SSDT7hOiqbYzo8ItMkYmpWEyrGiEm++0hR4udv/q+yAdbi5eLcCwOCKklikEVCZUIC+VdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727885651; c=relaxed/simple;
	bh=1pe/EfoDJwpQbKJ/rUv8i+LKR1OAhsFuWY9rb2O950g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2GKI8+M6K9NigHYurCbRTTc0KP3bhBB7BqAEhrqiRZ33bkZ8eU/HlbYqmQqnQ7KStKyJy5bUPcGumOvE90ranNbs0cgpBfP0ACExBr4Vji9yRTgUi6iFb4n+LwljpYNN4y9tR8Z5ckStO8WmDUwTZGgT7lxfCnbl2tl8/wPpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=q7010OUU; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="q7010OUU"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-82aa3f65864so303057539f.2
        for <lkmm@lists.linux.dev>; Wed, 02 Oct 2024 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727885648; x=1728490448; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suV5K2CDRBsWWxuwwC9iTf44NeTKVBNstqk1svUiD9k=;
        b=q7010OUUhtNsN+qx6RyuYyI6at/2UFq/eUBHEXbbU1cD782Ksfa/KtjYblHiGSLhYf
         NeGNeqyJnMuga+aPCVK84Dtzyq8CpWQHO6l5YTCnYwD+Q8hIlz7i8wgI30twhJM0TEFm
         a1ACstRg28uoKlCwI/tIVDSnBAtvX+jFi2/VrKdfddvncJ5eCd+eHOVlDeYZeXTR7mLx
         BwxmpC7NZimNCRpfh2Db867PmNakON0x3zM/ZBqDInU6/o6MagR8v8l+OwzsC7WYwapx
         NUO0JSyTLfuhm4tENGugD3jsNwA2P5NlY6x4EF+VHgyrIscRgt1LYO8yon6odBKYyaua
         r1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727885648; x=1728490448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suV5K2CDRBsWWxuwwC9iTf44NeTKVBNstqk1svUiD9k=;
        b=cLLPQk8g70Rpn91wmApgMxq3AR9qMzrjpoGBRiYRyd7qXVkEO+TI/ygIOjBGXBwTWZ
         PrwxWoxhD9nIK9OwwtKgJRdWwYlaEiniSWcBtUqzOEODCpB1m48omPyRwcbHX6UPcPEr
         PzuMC5Qpm4EUemDRpXmLBlrvMoitStmzd6V1ryNKEJDeTt9gCaN/qLvDmW9/Z16gNWVw
         wJm92BAkU7XL4YhTikce4a5ThoRcogUZP3jBt6EVnR/9EpuKrseupjggz5VwnOd1jgo7
         rcLX/fUjhSrQkVMARvEsYYHqo9b7P3UcO/zxAmW6lKgYKB7vvRUa94PyoLc3Dfo1VSKC
         xH7A==
X-Forwarded-Encrypted: i=1; AJvYcCV5QDZMkuu+sYNm2TkkszzVCXZY4CJcRB6NLcB8V3uV6NtwKEC+PR3LPgR6/IeLtfKDnP00@lists.linux.dev
X-Gm-Message-State: AOJu0YxNtP7cbFyIpLO/h9mhCf9TcA0rLW7yq22KVVpvMNQUB141H0An
	D6SSKWb7k+BV8QdZV/AC+605gyqBx214M1OQcYt8+p6bp07R47QGIEdieVmoxps=
X-Google-Smtp-Source: AGHT+IGl9omV9EQTehYn0SrRAnQbJvtu3xuf912k6OEP16tiWclCTW8yLnjvynJbx2lwFE1h7mD5Pw==
X-Received: by 2002:a05:6e02:1648:b0:39f:5521:2cd4 with SMTP id e9e14a558f8ab-3a365959a2bmr34538815ab.26.1727885648258;
        Wed, 02 Oct 2024 09:14:08 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344d6073esm36800745ab.8.2024.10.02.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 09:14:06 -0700 (PDT)
Message-ID: <0fd31bb1-6b76-4d27-9365-4dedfc323b2c@kernel.dk>
Date: Wed, 2 Oct 2024 10:14:05 -0600
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] sched+mm: Track lazy active mm existence with
 hazard pointers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: paulmck@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev
References: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
 <cfcf9c05-c639-4757-a3ac-6504d154cdfe@paulmck-laptop>
 <d412fa7e-6348-4e51-89e8-4c740184cb2f@efficios.com>
 <Zv1n0VeM3ZSVPyyE@casper.infradead.org>
 <d788c6aa-c8b9-41b8-b4fb-ac126a4f053f@efficios.com>
 <8a627fc7-cc62-40e6-ad28-c730d4a8f7d6@efficios.com>
 <579bdbbf-82a7-4330-9a5e-495d89befbac@kernel.dk>
 <f2b6f19e-0dea-4568-b3b0-832cfc950160@efficios.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f2b6f19e-0dea-4568-b3b0-832cfc950160@efficios.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/24 10:02 AM, Mathieu Desnoyers wrote:
> On 2024-10-02 17:58, Jens Axboe wrote:
>> On 10/2/24 9:53 AM, Mathieu Desnoyers wrote:
>>> On 2024-10-02 17:36, Mathieu Desnoyers wrote:
>>>> On 2024-10-02 17:33, Matthew Wilcox wrote:
>>>>> On Wed, Oct 02, 2024 at 11:26:27AM -0400, Mathieu Desnoyers wrote:
>>>>>> On 2024-10-02 16:09, Paul E. McKenney wrote:
>>>>>>> On Tue, Oct 01, 2024 at 09:02:01PM -0400, Mathieu Desnoyers wrote:
>>>>>>>> Hazard pointers appear to be a good fit for replacing refcount based lazy
>>>>>>>> active mm tracking.
>>>>>>>>
>>>>>>>> Highlight:
>>>>>>>>
>>>>>>>> will-it-scale context_switch1_threads
>>>>>>>>
>>>>>>>> nr threads (-t)     speedup
>>>>>>>>        24                +3%
>>>>>>>>        48               +12%
>>>>>>>>        96               +21%
>>>>>>>>       192               +28%
>>>>>>>
>>>>>>> Impressive!!!
>>>>>>>
>>>>>>> I have to ask...  Any data for smaller numbers of CPUs?
>>>>>>
>>>>>> Sure, but they are far less exciting ;-)
>>>>>
>>>>> How many CPUs in the system under test?
>>>>
>>>> 2 sockets, 96-core per socket:
>>>>
>>>> CPU(s):                   384
>>>>     On-line CPU(s) list:    0-383
>>>> Vendor ID:                AuthenticAMD
>>>>     Model name:             AMD EPYC 9654 96-Core Processor
>>>>       CPU family:           25
>>>>       Model:                17
>>>>       Thread(s) per core:   2
>>>>       Core(s) per socket:   96
>>>>       Socket(s):            2
>>>>       Stepping:             1
>>>>       Frequency boost:      enabled
>>>>       CPU(s) scaling MHz:   68%
>>>>       CPU max MHz:          3709.0000
>>>>       CPU min MHz:          400.0000
>>>>       BogoMIPS:             4800.00
>>>>
>>>> Note that Jens Axboe got even more impressive speedups testing this
>>>> on his 512-hw-thread EPYC [1] (390% speedup for 192 threads). I've
>>>> noticed I had schedstats and sched debug enabled in my config, so I'll have to re-run my tests.
>>>
>>> A quick re-run of the 128-thread case with schedstats and sched debug
>>> disabled still show around 26% speedup, similar to my prior numbers.
>>>
>>> I'm not sure why Jens has much better speedups on a similar system.
>>>
>>> I'm attaching my config in case someone spots anything obvious. Note
>>> that my BIOS is configured to show 24 NUMA nodes to the kernel (one
>>> NUMA node per core complex).
>>
>> Here's my .config - note it's from the stock kernel run, which is why it
>> still has:
>>
>> CONFIG_MMU_LAZY_TLB_REFCOUNT=y
>>
>> set. Have the same numa configuration as you, just end up with 32 nodes
>> on this box.
> 
> Just to make sure: did you use other command line options when starting
> the test program (other than -t N ?).

I did not, this is literally what I ran:

for i in 24 48 96 192 256 512 1024 2048; do echo $i threads; timeout -s INT -k 30 30 ./context_switch1_threads -t $i; done

and the numbers I got were very stable between runs and reboots.

-- 
Jens Axboe
