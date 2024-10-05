Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D382A14C5AE
	for <lkmm@lists.linux.dev>; Sat,  5 Oct 2024 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728130027; cv=none; b=GXJtU3xJsgi8NVJ41rFSFli7gE5rTCTKCi6a7/UwfqeauCYM1StmQ7N4Vo0iaYqvOQqYkxdWEXXvRlnxSzrjs+wAFZVPSvJcNBv3idf2Pj/h6/yPlf1fci9SR5JjhVRxRnhSkXhnZfavPW6/uovO240q93BL1sLk4ZgVpm0xaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728130027; c=relaxed/simple;
	bh=hU5q9QUikjXmWkbzka9caDwMGlVJ8fnlLNqMoTuILEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxq0fU9Kk192UnqJa7GCMNH6W0YYkBNT1z9v7GRb/YyxLzXhW/R/So1fSzld3tmMmd5m82nhBYYvDZ+XPgLFdnmsUPK1yw4V89dD9ZSt4sUYUVfNbuetE9sW6y4P+kLBNYSn7V5NjpK2Qy1n81ygJfC7j3iUDRnV3qlhX6WEhk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=BZMj2elV; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="BZMj2elV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1728130024;
	bh=hU5q9QUikjXmWkbzka9caDwMGlVJ8fnlLNqMoTuILEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BZMj2elVuboGHieaGO34F9soADypE9CImibr9QZpx07zJPFd7FOpQgnvZo1V+nGmb
	 dgb7CwaMa1NNo94MOmpv9HtSbEy1BFxxrpD/vwLXFm34FQk78S9bLzLq4Y/QnrVHtR
	 CV3fPxRY3vdtx5NIV88S7E6wRlMjKDWIb+xwpke1BBt6owZwAGYYjfUR7bpgK+VLXa
	 9lbzJ1uUZDE0npSLEvBln7UfuFd4R3FHoqRYtVFt0dpTpvPtjGc36l0KQWWj+Bcrbc
	 oqPFfjGHRtJ7m0B+EZfy20OMdoh2ajf+opXl+0PBbUmJFQqjwNISIIeD8WQ6sK3EOT
	 daOVjRS1nRwHA==
Received: from [IPV6:2606:6d00:100:4000:cacb:9855:de1f:ded2] (unknown [IPv6:2606:6d00:100:4000:cacb:9855:de1f:ded2])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XLPKh4hQwzXwk;
	Sat,  5 Oct 2024 08:07:04 -0400 (EDT)
Message-ID: <69c7e71a-2076-4fa7-90f3-534b52d74345@efficios.com>
Date: Sat, 5 Oct 2024 08:05:05 -0400
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/4] hp: Implement Hazard Pointers
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev
References: <20241004182734.1761555-1-mathieu.desnoyers@efficios.com>
 <20241004182734.1761555-4-mathieu.desnoyers@efficios.com>
 <CAEXW_YQfyPapBwSuqvFfs+XzSPaSCC3FDKsvb_Up+h-dnqgXeA@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CAEXW_YQfyPapBwSuqvFfs+XzSPaSCC3FDKsvb_Up+h-dnqgXeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-10-04 23:25, Joel Fernandes wrote:
> On Fri, Oct 4, 2024 at 2:29 PM Mathieu Desnoyers
> <mathieu.desnoyers@efficios.com> wrote:
>>
>> This API provides existence guarantees of objects through Hazard
>> Pointers (HP). This minimalist implementation is specific to use
>> with preemption disabled, but can be extended further as needed.
>>
>> Each HP domain defines a fixed number of hazard pointer slots (nr_cpus)
>> across the entire system.
>>
>> Its main benefit over RCU is that it allows fast reclaim of
>> HP-protected pointers without needing to wait for a grace period.
>>
>> It also allows the hazard pointer scan to call a user-defined callback
>> to retire a hazard pointer slot immediately if needed. This callback
>> may, for instance, issue an IPI to the relevant CPU.
>>
>> There are a few possible use-cases for this in the Linux kernel:
>>
>>    - Improve performance of mm_count by replacing lazy active mm by HP.
>>    - Guarantee object existence on pointer dereference to use refcount:
>>      - replace locking used for that purpose in some drivers,
>>      - replace RCU + inc_not_zero pattern,
>>    - rtmutex: Improve situations where locks need to be taken in
>>      reverse dependency chain order by guaranteeing existence of
>>      first and second locks in traversal order, allowing them to be
>>      locked in the correct order (which is reverse from traversal
>>      order) rather than try-lock+retry on nested lock.
>>
>> References:
>>
>> [1]: M. M. Michael, "Hazard pointers: safe memory reclamation for
>>       lock-free objects," in IEEE Transactions on Parallel and
>>       Distributed Systems, vol. 15, no. 6, pp. 491-504, June 2004
> [ ... ]
>> ---
>> Changes since v0:
>> - Remove slot variable from hp_dereference_allocate().
>> ---
>>   include/linux/hp.h | 158 +++++++++++++++++++++++++++++++++++++++++++++
>>   kernel/Makefile    |   2 +-
>>   kernel/hp.c        |  46 +++++++++++++
> 
> Just a housekeeping comment, ISTR Linus looking down on adding bodies
> of C code to header files (like hp_dereference_allocate). I understand
> maybe the rationale is that the functions included are inlined. But do
> all of them have to be inlined? Such headers also hurt code browsing
> capabilities in code browsers like clangd. clangd doesn't understand
> header files because it can't independently compile them -- it uses
> the compiler to generate and extract the AST for superior code
> browsing/completion.
> 
> Also have you looked at the benefits of inlining for hp.h?
> hp_dereference_allocate() seems large enough that inlining may not
> matter much, but I haven't compiled it and looked at the asm myself.

Here is a comparison in userspace:

* With "hp dereference allocate" inlined:

     test_hpref_benchmark (smp_mb)             nr_reads   1994298193 nr_writes     22293162 nr_ops   2016591355
     test_hpref_benchmark (barrier/membarrier) nr_reads  15208690879 nr_writes      1893785 nr_ops  15210584664

* With "hp dereference allocate" implemented as a function call:

     test_hpref_benchmark (smp_mb)             nr_reads   1558924716 nr_writes     14261028 nr_ops   1573185744
     test_hpref_benchmark (barrier/membarrier) nr_reads   5881131707 nr_writes      2005140 nr_ops   5883136847

So the overhead of the function call when using symmetric memory barriers
between hp allocate/hp scan is a 20% slowdown.

It's worse in the asymmetric barrier/membarrier case, introducing a 61%
slowdown.

Given that the overhead is noticeable, I am tempted to leave the hazard
pointer allocate/retire as inline functions.

About code browsers like clangd, I would recommend improving the tooling
rather than alter the design of the code based on current tooling
limitations.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

