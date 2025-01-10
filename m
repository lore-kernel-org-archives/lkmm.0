Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE1209F4C
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511720; cv=none; b=PfjqNlXuXZD8oexghBRHRhSt8Apk5NgPw0PxqMwW3IAFaWkruPr/5hBlnYoF8Jxf4fGGaeyRSD4wG5A05ah08cojtU1mdVfXKUhZgPmnORoOBoCxFzCRRpieB8SIJ1V07ZTZYkvZkvOQdHFvhH2D+Dw0Mg564ook/NcwVKzQCBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511720; c=relaxed/simple;
	bh=9mpUIgSxEbGBrJS/J2oW3TOW6sZ3JGlAzBbEgjVRhvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+kQzX2NvXQumPYyO61OZjNeYcZNiAKxd/yCTDLrCUhWSHN3daVJ/wciswhaXZeuXnHZTfxDZKw2fqggc/p8YO/98gY4t9smz+dqIKgoI0gnp3tA69mtMhbvREw1OTkHpL6RNSLRBweausr3LfaqMETG1EOM6qVtx7XAwwihjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YV0Zj57QGz9v7J5
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 19:59:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id BEE9B140381
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 20:21:48 +0800 (CST)
Received: from [10.81.209.26] (unknown [10.81.209.26])
	by APP1 (Coremail) with SMTP id LxC2BwCXG0rPEIFnXXJgAA--.44457S2;
	Fri, 10 Jan 2025 13:21:48 +0100 (CET)
Message-ID: <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
Date: Fri, 10 Jan 2025 13:21:32 +0100
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
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCXG0rPEIFnXXJgAA--.44457S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ArykWry7WF1DAFyUAw15CFg_yoWfArWfpF
	ZxKa47KF1DJrZ2yr1Ivr48X3Za9ws7Jr15Jas5Kr18Zws8Xr1ftFZ7tFyY9a47Crs5ZFWj
	vFWYqr9xXa4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/10/2025 um 4:12 AM schrieb Alan Stern:
> On Thu, Jan 09, 2025 at 09:09:00PM +0100, Jonas Oberhauser wrote:
> 
>>>> So for example, in
>>>>
>>>>     int a = 1;
>>>>     barrier();
>>>>     a = 2;
>>>>     //...
>>>>
>>>> the compiler does not know how the code inside barrier() accesses memory,
>>>> including volatile memory.
>>>
>>> I would say rather that the compiler does not know that the values
>>> stored in memory are the same before and after the barrier().
>>>
>>> Even the
>>> values of local variables whose addresses have not been exported.
>>
>> No, this is not true. I used to think so too until a short while ago.
>>
>> But if you look at the output of gcc -o3 you will see that it does happily
>> remove `a` in this function.
> 
> Isn't that consistent with what I said?


Ok, after careful reading, I think there are two assumptions you have 
that I think are not true, but my example is only inconsistent with 
exactly one of them being not true, not with both of them being not true:

1) the barrier only tells the compiler that it may *change* the value of 
memory locations. I believe it also tells the compiler that it may 
*read* the value of memory locations.
2) the barrier also talks about the values of local variables whose 
addresses have not been exported. I do not believe this is the case.

The second example I put (where a=1 is still emitted) shows your 
assumption 1) is inconsistent with what gcc currently does.

For what gcc guarantees, the manual says: "add memory to the list of 
clobbered registers. This will cause GCC to not keep memory values 
cached in registers across the assembler instruction", i.e., it needs to 
flush the value from the register to actual memory.

I believe this too is not consistent with your assumption 1), because if 
the barrier would just modify memory and not read it, there would be no 
need to flush the value to memory. It would suffice to ensure that the 
value is not assumed to be the same after the barrier.

With your assumption 1) discharged, the fact that `a=1` still can be 
removed from before the barrier should show that this guarantee does not 
hold for all memory locations (only for those that could legally be 
accessed in the barrier, which are those whose address has been exported).



>>> Question: Can the compiler assume that no other threads access a between
>>> the two stores, on the grounds that this would be a data race?  I'd
>>> guess that it can't make that assumption, but it would be nice to know
>>> for sure.
>>
>> It can not make the assumption if &a has escaped. In that case, barrier()
>> could be so:
>>
>> barrier(){
>>    store_release(OTHER_THREAD_PLEASE_MODIFY,&a);
>>
>>    while (! load_acquire(OTHER_THREAD_IS_DONE));
>> }
>>
>> with another thread doing
>>
>>    while (! load_acquire(OTHER_THREAD_PLEASE_MODIFY)) yield();
>>    *OTHER_THREAD_PLEASE_MODIFY ++;
>>    store_release(OTHER_THREAD_IS_DONE, 1);
> 
> Bear in mind that there's a difference between what a compiler _can do_
> and what gcc _currently does_.

Of course. But I am not sure if your comment addresses my comment here, 
or was intended for another section.

> 
>>> I think you're giving the compiler too much credit.  The one thing the
>>> compiler is allowed to assume is that the code, as written, does not
>>> contain a data race or other undefined behavior.
>>
>> Apologies, the way I used "assume" is misleading.
>> I should have said that the compiler has to ensure that even if the code of
>> foo() and barrier() were so, that the behavior of the code it generates is
>> the same (w.r.t. observable side effects) as if the program were executed by
>> the abstract machine. Or I should have said that it can *not* assume that
>> the functions are *not* as defined above.
>>
>> Which means that TURN_THE_BREAKS_ON would need to be assigned 1.
>> The only way the compiler can achieve that guarantee (while treating barrier
>> as a black box) is to make sure that the value of `a` before barrier() is 1.
> 
> Who says the compiler has to treat barrier() as a black box?  As far as
> I know, gcc makes no such guarantee.

Note that if it wouldn't, then barrier() would not work. Since the asm 
instruction is empty, the compiler could figure this out easily and just 
delete it.

But maybe I should also be more precise about what I mean by black box, 
namely, that
1) the asm block has significant side effects,
2) which include reading and storing to arbitrary (legally known) memory 
locations in an arbitrary order & control flow

Both of these imply that the compiler can not assume that it does not 
execute some logic equivalent to what I put above.




>> If herd7 would generate edges for semantic dependencies instead of for its
>> version of syntactic dependencies, then rwdep is the answer.
> 
> That statement is meaningless (or at least, impossible to implement)
> because there is no widely agreed-upon formal definition for semantic
> dependency.

Yes, which also means that a 100% correct end-to-end solution (herd + 
cat + ... ?) is currently not implementable.

But we can still break the problem into two halves, one which is 100% 
solved inside the cat file, and one which is the responsibility of herd7 
and currently not solved (or 100% satisfactorily solvable).

The advantage being that if we read the cat file as a mathematical 
definition, we can at least on paper argue 100% correctly about code for 
the cases where we either can figure out on paper what the semantic 
dependencies are, or where we at least just say "with relation to 
current compilers, we know what the semantically preserved dependencies 
are", even if herd7 or other tools lags behind in one or both.

After all, herd7 is just a (useful) automation tool for reasoning about 
LKMM, which has its limitations (scalability, a specific definition of 
dependencies, limited C subset...).


>> Given that we can not define dep inside the cat model, one may as well
>> define it as rwdep;rfe with the intended meaning of the dependencies being
>> the semantic ones; then it is an inaccuracy of herd7 that it does not
>> provide the proper dependencies.
> 
> Perhaps so.  LKMM does include other features which the compiler can
> defeat if the programmer isn't sufficiently careful.

How many of these are due to herd7's limitations vs. in the cat file?

>>> In the paper, I speculated that if a physical execution of a program
>>> matches an abstract execution containing such a non-observed OOTA cycle,
>>> then it also matches another abstract execution in which the cycle
>>> doesn't exist.  I don't know how to prove this conjecture, though.
>>
>> Yes, that also makes sense.
>>
>> Note that this speculation does not hold in the current LKMM though. In the
>> Litmus test I shared in the opening e-mail, where the outcome 0:r1=1 /\
>> 1:r1=1 is only possible with an OOTA (even though the values from the OOTA
>> are never used anywhere).
> 
> If the fact that the outcome 0:r1=1 /\ 1:r1=1 has occurred is proof that
> there was OOTA, then the OOTA cycle _is_ observed, albeit indirectly --
> at least, in the sense that I intended.  (The situation mentioned in the
> paper is better described as an execution where the compiler has elided
> all the accesses in the OOTA cycle.)

I'm not sure that sense makes a lot of sense to me.
But it does make the proof of your claim totally trivial. If there is no 
other OOTA-free execution with the same observable behavior, then it is 
proof that the OOTA happened, so the OOTA was observed.
So by contraposition any non-observed OOTA has an OOTA-free execution 
with the same observable behavior.

The sense in which I would define observed is more along the lines of 
"there is an observable side effect (such as store to volatile location) 
which has a semantic dependency on a load that reads from one of the 
stores in the OOTA cycle".




> 
>> With C++'s non-local model I wouldn't be totally surprised if there were
>> similar examples in C++, but given that its ordering definition is a lot
>> more straightforward than LKMM in that it doesn't have all these cases of
>> different barriers like wmb and rmb and corner cases like Noreturn etc., my
>> intuition says that there aren't any.
> 
> I'll have to give this some thought.

If you do want to prove the claim for the stricter definition of 
observable OOTA, I would think about looking at the first read r in each 
thread that reads from an OOTA store w, and see if at least one of them 
could read from another store.

If that is not possible, then my intuition would be that there would be 
some happens-before relation blocking you from reading from an earlier 
store than w, in particular, w ->hb r.

If it is not possible on any thread, then you get a bunch of these hb 
edges much in parallel to the OOTA cycle.

Perhaps you can turn that into an hb cycle.

This last step doesn't work in LKMM because the hb may be caused by 
rmb/wmb, which does not extend over the plain accesses in the OOTA cycle 
to the bounding store to make a bigger hb cycle.

But in C++, if you have w ->hb r on each OOTA rfe edge, then you also 
have r ->hb w' along the OOTA dep edge, and you get an hb cycle.

Best wishes,
    jonas

