Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D211FAA
	for <lkmm@lists.linux.dev>; Wed, 22 Jan 2025 03:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737517587; cv=none; b=kqYliJoxwwR6crVA93aF01rw+wtYMGRATP5Ej+mcTOji8zw9abSnVGs+BpN+OVq/aHMcMirt6bEs3bkRupxXPifHRwDBww5Hv2BdmeFX6QGY0wVH8WjIx+0+csTV8oDKRlfeOONWIfPMKHElQiPhCsZvD6YzGjutph9gQArPf5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737517587; c=relaxed/simple;
	bh=6BA56aW4weEH9j/M1195ufY5VIPs7DONBblGO1GvVVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQ8LyII2YOf7BP5c6xjnVYKwq/dTFlzd6gdVp3GXQEi0q6yswdjuAk4IzE1c2r8rVsDlh6EOatVgSgoAIXXnioRlXCF1J9CgawXkPwa25uSMGiieJ9IPRNyYt5nDlzAGTeiLrirbSHdeXw7E2Er7JU+ZvcFPSgzGI6ZLTyv1MGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Yd8Yz38Yvz9v7Vc
	for <lkmm@lists.linux.dev>; Wed, 22 Jan 2025 11:24:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 64B2B140230
	for <lkmm@lists.linux.dev>; Wed, 22 Jan 2025 11:46:14 +0800 (CST)
Received: from [10.166.203.69] (unknown [10.166.203.69])
	by APP2 (Coremail) with SMTP id GxC2BwB3LeD9aZBneCgSAQ--.46915S2;
	Wed, 22 Jan 2025 04:46:13 +0100 (CET)
Message-ID: <a2057858-fd7c-4458-96fc-0c3f52eae5fb@huaweicloud.com>
Date: Wed, 22 Jan 2025 04:46:03 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: Alan Stern <stern@rowland.harvard.edu>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
 urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com
References: <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
 <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
 <2139f8ce-63fa-4231-864b-500ee2645811@huaweicloud.com>
 <df9de992-fd3d-432b-9758-9fe35cc9b0c4@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <df9de992-fd3d-432b-9758-9fe35cc9b0c4@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwB3LeD9aZBneCgSAQ--.46915S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFWUWF1Dur4kWr13uw1ftFb_yoWftr4Up3
	95Kan8Ka1DJF4jkr1Iyw1xWF1Sva1v9r45GF9Ygry8Zwn0qw1ftr1xKr45ZFZ5Cw4vvFy2
	qrWvvr98C3ZxZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/21/2025 um 5:39 PM schrieb Alan Stern:
> On Tue, Jan 21, 2025 at 11:36:01AM +0100, Jonas Oberhauser wrote:
>>> What makes you think this "more appropriate" definition of semantic
>>> dependency will be any easier to detect than the original one?
>>
>> For starters, as you mentioned, the compiler has to assume any value is
>> possible.
>>
>> Which means that if any other value would lead to a "different behavior",
>> you know you have a semantic dependency. You can detect this in a per-thread
>> manner, independently of the compiler.
> 
> How?  The question is not as simple as it sounds.  What counts as
> "different behavior"?  What if some loads take place with the other
> value that didn't take place with the original value?  What if
> completely different code ends up executing but it stores the same
> values as before?

I agree that it is not easy, mostly because there's no good way to say 
whether two stores from two executions are "the same".

Besides the complications mentioned in your paper (e.g., another store 
to the same address being on the new code path), I would also need to 
think about barriers (e.g., a relaxed store in one execution, but a sc 
one in another execution), other kinds of synchronization (what if there 
are other atomic accesses in between that establish synchronization?).

One could take your definition (with the requirements about H dropped), 
and perhaps since in this specific example all atomic accesses are 
volatile, the restriction about counting accesses does not sting as much.

> 
>> Without the assumption of volatile, even a different value that could
>> actually be generated in another run of the same program does not prove a
>> semantic dependency.
> 
> So then how do you tell whether there is a semantic dependency?
> 
>>>> Yes. Actually I wonder if you put this "all loads are volatile" restriction,
>>>> can a globally analysing compiler still have any optimizations that a
>>>> locally analysing compiler can not?
>>>
>>> Yes, although whether they are pertinent is open to question.  For
>>> example, a globally optimizing compiler may observe that no thread ever
>>> reads the value of a particular shared variable and then eliminate that
>>> variable.
>>
>> Oh, I meant the "all atomic objects is volatile" restriction, not just the
>> loads. In that case, all stores the object - even if never read - still need
>> to be generated.
>>
>> Are there still any optimizations?
> 
> Perhaps not any that affect shared variable accesses.  In a way, that
> was the intention.

Yes, but it becomes a bit strange then to treat the "globally analyzing 
compiler" as a harder problem. You have made a globally analyzing 
compiler that can not globally analyze. I understand that makes the 
argument feasible, but I am not sure if this is how compilers really 
behave (or at least will still behave in the future).

>> Well, I certainly have not put as much deep thought into it as you have, so
>> it is certainly more fragile. But my current thoughts are along these lines:
>>
>> We consider inter-thread semantic dependencies (isdep) based on the set of
>> allowed executions + thread local optimizations + what would be allowed to
>> happen if rfe edges along the dependencies become rfi edges due to merging.
>> So the definition is not compiler-specific.
> 
> How do you know what thread-local optimizations may be applied?
> Different compilers use different ones, and new ones are constantly
> being invented.

I'm not sure it is necessary to know specific optimizations.
I don't have a satisfactory answer now.
But perhaps it is possible to define this through the abstract machine, 
maybe with a detour through the set of allowed C realizations.
Something like "given some execution G, and a subset of threads (T)i, 
and a read r and write w in those executions, if for every C realization 
of threads (T)i together such that all executions of the realization 
under all rf relations that exist in some original execution G' modulo 
some po-preserving mapping have the same observable side effects as that 
original execution G', there is a sequence of syntactic dependency + rf 
from r to w, then there is an inter-thread semantic dependency from r to w".

But this makes it really hard to prove that there is a dependency, since 
it quantifies over all C programs. And it only takes into account 
C-level optimizations, not optimizations specific to some hardware 
platform (which for all we know may have some transactional memory or 
powerful write speculation which the compiler knows about and uses in 
its optimizations).

I am not sure there is a better definition.


> Why not consider global optimizations? Yes, they are the same as
> thread-local optimizations if all the threads have been merged into one,
> but what if they haven't been merged?

Some global optimizations are considered by the fact that we only 
consider the set of allowed executions.

So if the compiler can see that in all executions the value of some 
variable is always 0 or 1 - for example, because those are the only 
kinds of stores to that variable - it might use that to do local 
optimizations. Such as eliminating some switch cases which then lead to 
eliminating control dependencies.


> For that matter, why bring thread merging into the discussion?

For one, it sounds impractical to make a compiler that does advanced 
global optimizations without merging the threads. It's probably easy 
enough to do on toy examples, but for realistic applications it seems 
completely infeasible, and additionally, hard to gain much benefit from it.

So I'm not sure it is necessary to solve the more advanced problem.

For another, thread merging defeats per-thread semantic dependencies.
So unless all optimizations related to that are ruled out (e.g., by 
saying all accesses are volatile), it needs to be considered either 
specifically or by a more powerful simpler abstraction. Which I don't have.

> 
> I don't want to think about thread merging, and at first glance it
> looks like you don't want to think about anything else.

I *want* to think about other practical global optimizations that are 
not included in the optimizations due to knowing the set of possible 
executions.

I just haven't been able to.

>>>>> I do not like the idea of tying the definition of OOTA (which needs to
>>>>> apply to every implementation) to a particular clang compiler.
>>>>
>>>> But that is what you have done, no? Whether something is an sdep depends on
>>>> the compiler, so compiler A could generate an execution that is OOTA in the
>>>> sdep definition of compiler B.
>>>
>>> Yes, but this does not tie the definition to _one particular_ compiler.
>>> That is, we don't say "This dependency is semantic because of the way
>>> GCC 14.2.1 handles it."  Rather, we define for each compiler whether a
>>> dependency is semantic for _that_ compiler.
>>
>> Yes, but the result is still that every compiler has its own memory model
>> (at least at the point of which graphs are being ruled out as OOTA). So
>> there is no definition of 'G is OOTA', only 'G is OOTA on compiler x'.
> 
> Our definition of OOTA and semantic dependency does not apply to graphs;
> it applies to particular hardware executions (together with the abstract
> executions that they realize).

True, but it immediately induces a predicate over graphs indexed by the 
compiler (by looking at hardware executions generated by x and the 
graphs from the realized abstract executions).

> 
> Besides, it is still possible to use our definition to talk about
> semantic dependency in a compiler-independent way.  Namely, if a
> dependency is semantic relative to _every_ compiler then we can say it
> is absolutely semantic.

Sure, but that definition is useless.

For example, in the running OOTA example x=y||y=x, there are no 
absolutely semantic dependencies. One compiler can turn this into x=y, 
where there is no dependency from y to x, and another into y=x, where 
there is no dependency from x to y. In fact even a naive non-optimizing 
compiler has no dependencies here under your definition because there 
are no hardware executions with other values.

In my informal definition, there is (intended to be) a inter-thread 
dependency from the load from x in T2 to the store to x in T1, and I 
would claim there is no execution in which that load can read from that 
store. I would not claim anything about the order of the load from y and 
the store to x.

>> The example I gave of the tool verifying the program relative to one
>> specific compiler is also not giving a definition of 'G is OOTA', in fact,
>> it does not specify OOTA at all; it simply says ``with compiler x, we get
>> the following "semantic dependencies" and the following graphs...''
>>
>> And as long as compiler x does not generate OOTA, there will be no OOTA
>> graphs among those.
>>
>> So it does not solve or tackle the theoretical problem in any way, and can
>> not do cross-compiler verification. But it will already apply the
>> 'naive-dependency-breaking optimizations' that you would not see in e.g.
>> herd7.
> 
> Okay, fine.  But we're trying to come up with general characterizations,
> and it appears that you're doing something quite different.

Well, it wasn't me who did this, it was Hernan's group who did this for 
other practical concerns, but yes I agree.
It's not a solution to the very hard problem you're trying to solve, but 
a solution to perhaps the more immediate problem people have while 
looking at real code.

Best wishes,
   jonas


