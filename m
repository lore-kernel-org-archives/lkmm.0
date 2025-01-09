Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC722186E56
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441125; cv=none; b=IzM2AiX2U5vxnerxswAhnnV9/GDs8zMW7GYHxs1wCOipeuNkbjWoacmYUHH/vcjSOZkXfhuVgq3SUpWOdkZef3awoGgllfj2S6dOHbMwes/VVYvZrNd9JJcVJ8gNe7ESEx8WJ4pVtBSlYwOPoF6DSAGuhabl0n0Yz+6hwjiyk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441125; c=relaxed/simple;
	bh=xCCxxQJo5mMDog+jK3USSwZtb/2iVlaLDgIby5K8XVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ET3993q/tpehMLfz0sFtncxc65Wz455J/JDYCidN3c9zhGrzoV2tMaqzRm6n1bi55K8q9OHwH4BG5iAxafjng7lKs49sbXq2K2vhG10xe7Lq0zOS1yCSAX3IJjrka0AFnRe7WZGVtWFdkTtfJnOPjN/oir1udQTNGIHsdzqgvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YTVKM3b0wz9v7JM
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 00:16:39 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id D5520140A2E
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 00:45:10 +0800 (CST)
Received: from [10.81.211.163] (unknown [10.81.211.163])
	by APP2 (Coremail) with SMTP id GxC2BwCXTeAJ_X9n91FTAA--.38138S2;
	Thu, 09 Jan 2025 17:45:10 +0100 (CET)
Message-ID: <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
Date: Thu, 9 Jan 2025 17:44:54 +0100
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
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwCXTeAJ_X9n91FTAA--.38138S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyxWr1kCr1DXw1fKF43Awb_yoW7tr1rpF
	W7K3WUKF4DXr4Ikr47tw4UAa4ay395tr1UJ3sYk348Z3s09r1fWFZrtFyY9Fy5Cws5ta42
	vr4DZ342q3Wava7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIa
	0PDUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/9/2025 um 5:17 PM schrieb Alan Stern:
> On Wed, Jan 08, 2025 at 08:22:07PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/8/2025 um 7:47 PM schrieb Alan Stern:
>>> On Wed, Jan 08, 2025 at 06:33:05PM +0100, Jonas Oberhauser wrote:
>>>>
>>>>
>>>> Am 1/7/2025 um 5:09 PM schrieb Alan Stern:
>>>>> Is this really valid?  In the example above, if there were no other
>>>>> references to a or b in the rest of the program, the compiler could
>>>>> eliminate them entirely.
>>>>
>>>> In the example above, this is not possible, because the address of a/b have
>>>> escaped the function and are not deallocated before synchronization happens.
>>>> Therefore the compiler must assume that a/b are accessed inside the compiler
>>>> barrier.
>>>
>>> I'm not quite sure what you mean by that, but if the compiler has access
>>> to the entire program and can do a global analysis then it can recognize
>>> cases where accesses that may seem to be live aren't really.
>>
>> Even for trivial enough cases where the compiler has access to all the
>> source, compiler barriers should be opaque to the compiler.
>>
>> Since it is opaque,
>>
>>    *a = 1;
>>    compiler_barrier();
>>
>> might as well be
>>
>>    *a = 1;
>>    *d = *a; // *d is in device memory
>>
>> and so in my opinion the compiler needs to ensure that the value of *a right
>> before the compiler barrier is 1.
>>
>> Of course, only if the address of *a could be possibly legally known to the
>> opaque code in the compiler barrier.
> 
> What do you mean by "opaque code in the compiler barrier"?  The
> compiler_barrier() instruction doesn't generate any code at all; it
> merely directs the compiler not to carry any knowledge about values
> stored in memory from one side of the barrier to the other.

What I mean by "opaque" is that the compiler does not analyze the code 
inside the compiler barrier, so it must treat it as a black box that 
could manipulate memory arbitrarily within the limitation that it can 
not guess the address of memory.

So for example, in

   int a = 1;
   barrier();
   a = 2;
   //...

the compiler does not know how the code inside barrier() accesses 
memory, including volatile memory.
But it knows that it can not access `a`, because the address of `a` has 
never escaped before the barrier().

So it can change this to:

   barrier();
   int a = 2;
   // ...

But if we let the address of `a` escape, for example with some external 
function foo(int*):

   int a;
   foo(&a);
   a = 1;
   barrier();
   a = 2;
   // ...

Then the compiler has to assume that the code of foo and barrier might 
be something like this:

foo(p) { SPECIAL_VARIABLE = p; }
barrier() { TURN_THE_BREAKS_ON = *SPECIAL_VARIABLE; }

and it must make sure that the value of `a` before barrier() is 1.

That is at least my understanding.

In fact, even if `a` is unused after a=2, the compiler can only 
eliminate `a` in the former case, but in the latter case, still needs to 
ensure that the value of `a` before barrier() is 1 (but it can eliminate 
a=2).


> 
> Note that it does _not_ necessarily prevent the compiler from carrying
> knowledge that a memory location is unused from one side of the barrier
> to the other.

Yes, or even merging/moving assignments to the memory location across a 
barrier(), as in the example above.


>>> However, I admit this objection doesn't really apply to Linux kernel
>>> programming.
>>>
>>>>>    (Whether the result could count as OOTA is
>>>>> open to question, but that's not the point.)  Is it not possible that a
>>>>> compiler might find other ways to defeat your intentions?
>>>>
>>>> The main point (which I already mentioned in the previous e-mail) is if the
>>>> object is deallocated without synchronization (or never escapes the function
>>>> in the first place).
>>>>
>>>> And indeed, any such case renders the added rule unsound. It is in a sense
>>>> unrelated to OOTA; cases where the load/store can be elided are never OOTA.
>>>
>>> That is a matter of definition.  In our paper, Paul and I described
>>> instances of OOTA in which all the accesses have been optimized away as
>>> "trivial".
>>
>> Yes, by OOTA I mean a rwdep;rfe cycle.
>>
>> In the absence of data races, such a cycle can't be optimized away because
>> it is created with volatile/compiler-barrier-protected accesses.
> 
> That wasn't true in the C++ context of the paper Paul and I worked on.
> Of course, C++ is not our current context here.

Yes, you are completely correct. In C++ (or pure C), where data races 
are prevented by compiler/language-builtins rather than with 
compiler-barriers/volatiles, all my assumptions break.

That is because the compiler absolutely knows that an atomic_store(&x) 
does not access any memory location other than x, so it can do a lot 
more "harmful" optimizations.

That's why I said such a language model should just exclude global OOTA 
by fiat.

I have to read your paper again (I think I read it a few months ago) to 
understand if the trivial OOTA would make even that vague axiom unsound
(my intuition says that if the OOTA is never observed by influencing the 
side-effect, then forbidding OOTA makes no difference to the set of 
"observable behaviors" of a C++ program even there is a trivial OOTA, 
and if the OOTA has visible side-effects, then it is acceptable for the 
compiler not to do the "optimization" that turns it into a trivial OOTA 
and choose some other optimization instead, so we can as well forbid the 
compiler from doing it).

> What I was trying to get at above is that compiler-barrier protection
> does not necessarily guarantee that non-volatile accesses can't be
> optimized away.  (However, it's probably safe for us to make such an
> assumption here.)

Yes, I agree.

>> It seems the ideal solution is to let Live be defined by the tools, which
>> should keep up with or exceed the analysis done by state-of-art compilers.
> 
> I don't think it works that way in practice.  :-)

Yeah... maybe not :(

Best wishes,
   jonas

