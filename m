Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95251EB44
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736599614; cv=none; b=CYzJ2MoVYRyvj3+4Nx1otupxbE1X14FAJjfv3WBX508fhzIazEMytrPCJuUQ8i9DNIutyfsD5vFVrLhraMeQ8zODGwu/RG66gkN8s3o0s3fsUln45tPhWUUuSrlpjUHggGtA1nx2tM2WXLFaPz8SWop6dbe3Wo2oUeVWCqCj+bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736599614; c=relaxed/simple;
	bh=R74g+cPm6bYplvTQdyZTUhAF3GBvU/qZYFVgvm+yKvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTiaMBMCWLBxY1nn2mH9CyrvYAnXMaWQEp8IuoPleEfwbWmhhVQ9gMShKGuQhT7vyNUdwr/UPKuZEpNjdRbPcLjhy7jyU/2Ak89jcZl43HNNMdr6Vfn8pfxY1g4EC7kimQd49whMC0SfVQlNRY24mfRtKcvVgp0d8W85B5zkMHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YVd4q0P1Fz9v7Vc
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 20:24:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 9D297140381
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 20:46:37 +0800 (CST)
Received: from [10.81.206.62] (unknown [10.81.206.62])
	by APP1 (Coremail) with SMTP id LxC2BwCnLUwgaIJnUQxwAA--.2013S2;
	Sat, 11 Jan 2025 13:46:37 +0100 (CET)
Message-ID: <838f7a51-c0f5-4a19-8407-6591426fd4a8@huaweicloud.com>
Date: Sat, 11 Jan 2025 13:46:21 +0100
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
References: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
 <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
 <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCnLUwgaIJnUQxwAA--.2013S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tF4xAFyUKF47AF1kGFW5Awb_yoWDtF1DpF
	W3KasrKF4DAF1xAw1Iywn7Xa4SyFs7Ar15Jr98Kry8Zas09r1xtF48Kr1F9FyUCrWkZFyY
	vrZ0qr9ruws8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/10/2025 um 10:51 PM schrieb Alan Stern:
> On Fri, Jan 10, 2025 at 01:21:32PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/10/2025 um 4:12 AM schrieb Alan Stern:
>>> On Thu, Jan 09, 2025 at 09:09:00PM +0100, Jonas Oberhauser wrote:
>>>
>>>>>> So for example, in
>>>>>>
>>>>>>      int a = 1;
>>>>>>      barrier();
>>>>>>      a = 2;
>>>>>>      //...
>>>>>>
>>>>>> the compiler does not know how the code inside barrier() accesses memory,
>>>>>> including volatile memory.
>>>>>
>>>>> I would say rather that the compiler does not know that the values
>>>>> stored in memory are the same before and after the barrier().
>>>>>
>>>>> Even the
>>>>> values of local variables whose addresses have not been exported.
>>>>
>>>> No, this is not true. I used to think so too until a short while ago.
>>>>
>>>> But if you look at the output of gcc -o3 you will see that it does happily
>>>> remove `a` in this function.
>>>
>>> Isn't that consistent with what I said?
>>
>>
>> Ok, after careful reading, I think there are two assumptions you have that I
>> think are not true, but my example is only inconsistent with exactly one of
>> them being not true, not with both of them being not true:
>>
>> [...]
 >>
>> 2) the barrier also talks about the values of local variables whose
>> addresses have not been exported. I do not believe this is the case.
>  
> 2) isn't so clear.  If a local variable's address is never computed then
> the compiler might put the variable in a register, in which case the
> barrier would not clobber it.  On the other hand, if the variable's
> address is computed somewhere (even if it isn't exported) then the
> variable can't be kept in a register and so it is subject to the
> barrier's effects.

I understood "its address is exported" to mean that enough information 
has been exported to legally compute its address.

Btw, I just remembered a discussion about provenance in C & C++ which is 
also very related to this, where the compiler moved a (I think 
non-atomic) access across a release fence because it "knew" that the 
address of the non-atomic was not exported.

I can't find that discussion now.



>> For what gcc guarantees, the manual says: "add memory to the list of
>> clobbered registers. This will cause GCC to not keep memory values cached in
>> registers across the assembler instruction", i.e., it needs to flush the
>> value from the register to actual memory.
> 
> Yes, GCC will write back dirty values from registers.  But not because
> the cached values will become invalid (in fact, the cached values might
> not even be used after the barrier).  Rather, because the compiler is
> required to assume that the assembler code in the barrier might access
> arbitrary memory locations -- even if that code is empty.

Yes :)


>>>> If herd7 would generate edges for semantic dependencies instead of for its
>>>> version of syntactic dependencies, then rwdep is the answer.
>>>
>>> That statement is meaningless (or at least, impossible to implement)
>>> because there is no widely agreed-upon formal definition for semantic
>>> dependency.
>>
>> Yes, which also means that a 100% correct end-to-end solution (herd + cat +
>> ... ?) is currently not implementable.
>>
>> But we can still break the problem into two halves, one which is 100% solved
>> inside the cat file, and one which is the responsibility of herd7 and
>> currently not solved (or 100% satisfactorily solvable).
> 
> I believe that Luc and the other people involved with herd7 take the
> opposite point of view: herd7 is intended to do the "easy" analysis
> involving only straightforward code parsing, leaving the "hard"
> conceptual parts to the user-supplied .cat file.

I can understand the attractiveness of that point of view, but there is 
no way to define "semantic dependencies" at all or "live access" 100% 
accurately in cat, since it requires a lot of syntactic information that 
is not present at that level.

But there is in herd7 (at least for some specific definition of 
"semantically dependent").

>> The advantage being that if we read the cat file as a mathematical
>> definition, we can at least on paper argue 100% correctly about code for the
>> cases where we either can figure out on paper what the semantic dependencies
>> are, or where we at least just say "with relation to current compilers, we
>> know what the semantically preserved dependencies are", even if herd7 or
>> other tools lags behind in one or both.
>>
>> After all, herd7 is just a (useful) automation tool for reasoning about
>> LKMM, which has its limitations (scalability, a specific definition of
>> dependencies, limited C subset...).
> 
> I still think we should not attempt any sort of formalization of
> semantic dependency here.

I 100% agree and apologies if I ever gave that impression.

What I want is to change the interpretation of ctrl,data,addr in LKMM 
from saying "it is intended to be a syntactic dependency, which causes 
LKMM to be inaccurate" to "it is intended to be a semantic dependency, 
but because there is no formal defn. and tooling we *use* syntactic 
dependencies, which causes the current implementations to be 
inaccurate", without formally defining what a semantic dependency is.

E.g., in "A WARNING", I would change
-------------
The protections provided by READ_ONCE(), WRITE_ONCE(), and others are
not perfect; and under some circumstances it is possible for the
compiler to undermine the memory model.
-------------
into something like
-------------
The current tooling around LKMM does not model semantic dependencies, 
and instead uses syntactic dependencies to specify the protections 
provided by READ_ONCE(), WRITE_ONCE(), and others. The compiler can 
undermine these syntactic dependencies under some circumstances.
As a consequence, the tooling may write checks that LKMM and the 
compiler can not cash.
-------------

etc.

This is under my assumption that if we had let's say gcc's "semantic 
dependencies" or an under-approximation of it (by that I mean allow less 
things to be dependent than gcc can see), that these cases would be 
resolved, in the sense that gcc can not undermine [R & Marked] ; gcc-dep 
where gcc-dep is the dependencies detected by gcc.

But I would be interested to see any cases where this assumption is not 
true.


Note that this still results in a fully formal definition of LKMM, 
because just like now, addr,ctrl,and data are simply uninterpreted 
relations. We don't need to formalize their meaning at that level.


>>>> Given that we can not define dep inside the cat model, one may as well
>>>> define it as rwdep;rfe with the intended meaning of the dependencies being
>>>> the semantic ones; then it is an inaccuracy of herd7 that it does not
>>>> provide the proper dependencies.
>>>
>>> Perhaps so.  LKMM does include other features which the compiler can
>>> defeat if the programmer isn't sufficiently careful.
>>
>> How many of these are due to herd7's limitations vs. in the cat file?
> 
> Important limitations are present in both.

I am genuinely asking. Do we have a list of the limitations?
Maybe it would be good to collect it in the "A WARNING" section of 
explanation.txt if it doesn't exist elsewhere.

>>>>> In the paper, I speculated that if a physical execution of a program
>>>>> matches an abstract execution containing such a non-observed OOTA cycle,
>>>>> then it also matches another abstract execution in which the cycle
>>>>> doesn't exist.  I don't know how to prove this conjecture, though.
>>>>
>>>> Yes, that also makes sense.
>>>>
>>>> Note that this speculation does not hold in the current LKMM though. In the
>>>> Litmus test I shared in the opening e-mail, where the outcome 0:r1=1 /\
>>>> 1:r1=1 is only possible with an OOTA (even though the values from the OOTA
>>>> are never used anywhere).
>>>
>>> If the fact that the outcome 0:r1=1 /\ 1:r1=1 has occurred is proof that
>>> there was OOTA, then the OOTA cycle _is_ observed, albeit indirectly --
>>> at least, in the sense that I intended.  (The situation mentioned in the
>>> paper is better described as an execution where the compiler has elided
>>> all the accesses in the OOTA cycle.)
>>
>> I'm not sure that sense makes a lot of sense to me.
> 
> Here's an example illustrating what I had in mind.  Imagine that all the
> accesses here are C++-style relaxed atomic (i.e., not volatile and also
> not subject to data races):
> 
> P0(int *a, int *b) {
> 	int r0 = *a;
> 	*b = r0;
> 	*b = 2;
> 	// r0 not used again
> }
> 
> P1(int *a, int *b) {
> 	int r1 = *b;
> 	*a = r1;
> 	*a = 2;
> 	// r1 not used again
> }
> 
> The compiler could eliminate the r0 and r1 accesses entirely, leaving
> just:
> 
> P0(int *a, int *b) {
> 	*b = 2;
> }
> 
> P1(int *a, int *b) {
> 	*a = 2;
> }
> 
> An execution of the corresponding machine code would then be compatible
> with an abstract execution of the source code in which both r0 and r1
> get set to 42 (OOTA).  But it would also be compatible with an abstract
> execution in which both r0 and r1 are 0, so it doesn't make sense to say
> that the hardware execution is, or might be, an instance of OOTA.

Yes, but this does not require the definition you expressed before. This 
is already not observable according to the definition that there is no 
read R from an OOTA-cycle store, where some observable side effect 
semantically depends on R.

What I was trying to say is that your definition is almost a 
no-true-scotsman (sorry Paul) definition: every program with an OOTA 
execution where you could potentially not find an "equivalent" execution 
without OOTA, is simply labeled a "no-true-unobserved OOTA".

>> But it does make the proof of your claim totally trivial. If there is no
>> other OOTA-free execution with the same observable behavior, then it is
>> proof that the OOTA happened, so the OOTA was observed.
>> So by contraposition any non-observed OOTA has an OOTA-free execution with
>> the same observable behavior.
>>
>> The sense in which I would define observed is more along the lines of "there
>> is an observable side effect (such as store to volatile location) which has
>> a semantic dependency on a load that reads from one of the stores in the
>> OOTA cycle".
> 
> Yes, I can see that from your proposed definition of Live.
> I'm afraid we've wandered off the point of this email thread, however...

Maybe, but it is still an important and interesting discussion.
I am also open to continuing it on another channel though.

> Getting back to the original point, why don't you rewrite your patch as
> discussed earlier and describe it as an attempt to add ordering for
> important situations involving plain accesses that the LKMM currently
> does not handle?  In other words, leave out as far as possible any
> mention of OOTA or semantic dependency.
I will try, but I have some other things to do first, so it may take a 
while.

Have fun,
   jonas

