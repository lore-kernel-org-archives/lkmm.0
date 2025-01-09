Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1E1FA8FF
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736453375; cv=none; b=L+W0xUr2jt45l2V88SK4YizVLZ6ltyLlW/vW+wr4ixHzmG94vkzqYjq6nPAB+xh9rB/FmUxtPydgeO0CDO6BjHLjFBVWnjbUpNR3zY/ZYrs1mYg2epdAf1aiQZAgHwVhW7mzEjc1xY+av+6bPLfG9b9ad3nTr3DowFeb/tNWkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736453375; c=relaxed/simple;
	bh=axZzrtmmlxcaXqsJi/mh2XSsCaSLE+xRAzIWm2Zf+68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrQVO4PJiGHxJicv0GUFt08oJ/R0HxdIMeSu4ya0uIK57e23yuGo0PJDk/rluTHRtNr0gJo2SYFkgGNrhgdSK3Pihs6FhpOh3asXf95qqAlOtzPGFKk/mcEIVcwIfrInKZguYNdxPxPq4ry/GFdmaqcV3g/OZUVt4oR4fj4G6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YTb0c5D46z9v7J5
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 03:47:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id D016314038F
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 04:09:16 +0800 (CST)
Received: from [10.81.208.239] (unknown [10.81.208.239])
	by APP1 (Coremail) with SMTP id LxC2BwDnbEvfLIBno_VVAA--.55970S2;
	Thu, 09 Jan 2025 21:09:16 +0100 (CET)
Message-ID: <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
Date: Thu, 9 Jan 2025 21:09:00 +0100
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
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwDnbEvfLIBno_VVAA--.55970S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFWDtw4xWFykZw15GF1ftFb_yoWfXw4kpF
	ZxK3W5KFWDAr4Iyw17tw47Za4fZws3GF13A3s8Kr1kZws0qr1S9FsrKryY9a45Cws5Xa42
	qr4qv347Ga1qya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/9/2025 um 8:27 PM schrieb Alan Stern:
> On Thu, Jan 09, 2025 at 05:44:54PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/9/2025 um 5:17 PM schrieb Alan Stern:
>>> What do you mean by "opaque code in the compiler barrier"?  The
>>> compiler_barrier() instruction doesn't generate any code at all; it
>>> merely directs the compiler not to carry any knowledge about values
>>> stored in memory from one side of the barrier to the other.
>>
>> What I mean by "opaque" is that the compiler does not analyze the code
>> inside the compiler barrier, so it must treat it as a black box that could
>> manipulate memory arbitrarily within the limitation that it can not guess
>> the address of memory.
> 
> Okay, I see what you're getting at.  The way you express it is a little
> confusing, because in fact there is NO code inside the compiler barrier
> (although the compiler doesn't know that) -- the barrier() macro expands
> to an empty assembler instruction, along with an annotation telling the
> compiler that this instruction may affect the contents of memory in
> unknown and unpredictable ways.

I am happy to learn a better way to express this.

> 
>> So for example, in
>>
>>    int a = 1;
>>    barrier();
>>    a = 2;
>>    //...
>>
>> the compiler does not know how the code inside barrier() accesses memory,
>> including volatile memory.
> 
> I would say rather that the compiler does not know that the values
> stored in memory are the same before and after the barrier().  
 >
> Even the
> values of local variables whose addresses have not been exported.

No, this is not true. I used to think so too until a short while ago.

But if you look at the output of gcc -o3 you will see that it does 
happily remove `a` in this function.

> 
>> But it knows that it can not access `a`, because the address of `a` has
>> never escaped before the barrier().
> 
 > I don't think this is right.  barrier is (or can be) a macro, not a
 > function call with its own scope.  As such, it has -- in principle --
 > the ability to export the address of a.

See above. Please test it for yourself, but for your convenience here is 
the code


   extern void foo(int *p);

   int opt_a() {
     int a;
     a = 1;
       __asm__ volatile ("" ::: "memory");
     a = 2;
   }

   int opt_b() {
     int a;
     foo(&a);
     a = 1;
       __asm__ volatile ("" ::: "memory");
     a = 2;
   }

and corresponding asm:

opt_a:
         bx      lr

(the whole function body got deleted!)

opt_b:
         push    {lr}
         sub     sp, sp, #12
	// calling foo(&a)
         add     r0, sp, #4
         bl      foo

	// a = 1 -- to make sure a==1 before the barrier()
         movs    r3, #1
         str     r3, [sp, #4]

	// [empty code from the barrier()]
	
         // a = 2 -- totally deleted

	// [return]
         add     sp, sp, #12
         ldr     pc, [sp], #4


If you wanted to avoid this, you would need to expose the address of `a` 
to the asm block using one of its clobber arguments (but I'm not 
familiar with the syntax to produce a working example on the spot).

> 
> Question: Can the compiler assume that no other threads access a between
> the two stores, on the grounds that this would be a data race?  I'd
> guess that it can't make that assumption, but it would be nice to know
> for sure.

It can not make the assumption if &a has escaped. In that case, 
barrier() could be so:

barrier(){
   store_release(OTHER_THREAD_PLEASE_MODIFY,&a);

   while (! load_acquire(OTHER_THREAD_IS_DONE));
}

with another thread doing

   while (! load_acquire(OTHER_THREAD_PLEASE_MODIFY)) yield();
   *OTHER_THREAD_PLEASE_MODIFY ++;
   store_release(OTHER_THREAD_IS_DONE, 1);


>>
>> But if we let the address of `a` escape, for example with some external
>> function foo(int*):
>>
>>    int a;
>>    foo(&a);
>>    a = 1;
>>    barrier();
>>    a = 2;
>>    // ...
>>
>> Then the compiler has to assume that the code of foo and barrier might be
>> something like this:
>>
>> foo(p) { SPECIAL_VARIABLE = p; }
>> barrier() { TURN_THE_BREAKS_ON = *SPECIAL_VARIABLE; }
> 
> I think you're giving the compiler too much credit.  The one thing the
> compiler is allowed to assume is that the code, as written, does not
> contain a data race or other undefined behavior.

Apologies, the way I used "assume" is misleading.
I should have said that the compiler has to ensure that even if the code 
of foo() and barrier() were so, that the behavior of the code it 
generates is the same (w.r.t. observable side effects) as if the program 
were executed by the abstract machine. Or I should have said that it can 
*not* assume that the functions are *not* as defined above.

Which means that TURN_THE_BREAKS_ON would need to be assigned 1.
The only way the compiler can achieve that guarantee (while treating 
barrier as a black box) is to make sure that the value of `a` before 
barrier() is 1.


>>
>> That is at least my understanding.
> 
> This is the sort of question that memory-barriers.txt should answer.
> It's closely related to the question I mentioned above.
> 
>> In fact, even if `a` is unused after a=2, the compiler can only eliminate
>> `a` in the former case, but in the latter case, still needs to ensure that
>> the value of `a` before barrier() is 1 (but it can eliminate a=2).
> 
> And what if a were a global shared variable instead of a local one?  The
> compiler is still allowed to do weird optimizations on it, since the
> accesses aren't volatile.

I'm not sure if `a` being global is enough for the compiler to consider 
`a`'s address as having escaped to the inline asm memory, especially if 
`a` has static lifetime.

If it must be considered escaped, then it can do weird optimizations on 
it, but not across the barrier().
That is because inside the barrier(), we could be reading the value and 
store into a volatile field like TURN_THE_BREAKS_ON.
In that case, the value right before the barrier needs to be equal to 
the value in the abstract machine.

> 
>>> That wasn't true in the C++ context of the paper Paul and I worked on.
>>> Of course, C++ is not our current context here.
>>
>> Yes, you are completely correct. In C++ (or pure C), where data races are
>> prevented by compiler/language-builtins rather than with
>> compiler-barriers/volatiles, all my assumptions break.
>>
>> That is because the compiler absolutely knows that an atomic_store(&x) does
>> not access any memory location other than x, so it can do a lot more
>> "harmful" optimizations.
>>
>> That's why I said such a language model should just exclude global OOTA by
>> fiat.
> 
> One problem with doing this is that there is no widely agreed-upon
> formal definition of OOTA.  A cycle in (rwdep ; rfe) isn't the answer
> because rwdep does not encapsulate the notion of semantic dependency.

rwdep does not encapsulate any specific notion.
It is herd7 which decides which dependency edges to add to the graphs it 
generates.
If herd7 would generate edges for semantic dependencies instead of for 
its version of syntactic dependencies, then rwdep is the answer.

Given that we can not define dep inside the cat model, one may as well 
define it as rwdep;rfe with the intended meaning of the dependencies 
being the semantic ones; then it is an inaccuracy of herd7 that it does 
not provide the proper dependencies.

Anyways LKMM should not care about syntactic dependencies, e.g.


   if (READ_ONCE(*a)) {
     WRITE_ONCE(*b,1);
   } else {
     WRITE_ONCE(*b,1);
   }

has no semantic dependency and gcc does not guarantee the order between 
these two accesses, even though herd7 does give us a dependency edge.


>> I have to read your paper again (I think I read it a few months ago) to
>> understand if the trivial OOTA would make even that vague axiom unsound
>> (my intuition says that if the OOTA is never observed by influencing the
>> side-effect, then forbidding OOTA makes no difference to the set of
>> "observable behaviors" of a C++ program even there is a trivial OOTA, and if
>> the OOTA has visible side-effects, then it is acceptable for the compiler
>> not to do the "optimization" that turns it into a trivial OOTA and choose
>> some other optimization instead, so we can as well forbid the compiler from
>> doing it).
> 
> If an instance of OOTA is never observed, does it exist?

:) :) :)

> In the paper, I speculated that if a physical execution of a program
> matches an abstract execution containing such a non-observed OOTA cycle,
> then it also matches another abstract execution in which the cycle
> doesn't exist.  I don't know how to prove this conjecture, though.

Yes, that also makes sense.

Note that this speculation does not hold in the current LKMM though. In 
the Litmus test I shared in the opening e-mail, where the outcome 0:r1=1 
/\ 1:r1=1 is only possible with an OOTA (even though the values from the 
OOTA are never used anywhere).
With C++'s non-local model I wouldn't be totally surprised if there were 
similar examples in C++, but given that its ordering definition is a lot 
more straightforward than LKMM in that it doesn't have all these cases 
of different barriers like wmb and rmb and corner cases like Noreturn 
etc., my intuition says that there aren't any.

But I am not going to think deeply about it for the time being.

Best wishes
    jonas


