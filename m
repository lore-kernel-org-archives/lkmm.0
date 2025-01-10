Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0121322B
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526151; cv=none; b=uZy6JHNBnuTjfuPChS2Lnysy8pirJT3nrKfknubqdju5u4r07YGkUkjROHA76CWqQFudxP5l5ErPNfkbQ9BmT/RMrrFgf8LOm4+5S4tVzAj+3BQdrtWPhvVhRMpY/XQlDcJSjiPbLASFRw9yynMbkZH4eMLtufyVm5BnS1PhDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526151; c=relaxed/simple;
	bh=sX3c0LAdU7E+1Ve91JPRFTgxw68/dJsIiPO94yOL2ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0dlUwk9L1RzsJAnqLM3cRAdQBmyMVLgajPlZeR41qKucnXq55Z/KxMhFdi45C8Rz8NBaCSv1xAbQxw5NZThO0AuUyL0BE7HlTjNBEqUy3JUdd8miR0cbaKC81SL0voIkSpRBJcda4KBzHeMbamOF9LBrk7QV0ZXKQIeEryrkFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YV5w92CbJz9v7Vd
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 00:00:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id D28F2140381
	for <lkmm@lists.linux.dev>; Sat, 11 Jan 2025 00:22:18 +0800 (CST)
Received: from [10.81.206.79] (unknown [10.81.206.79])
	by APP1 (Coremail) with SMTP id LxC2BwB3SkkqSYFndAxjAA--.10398S2;
	Fri, 10 Jan 2025 17:22:17 +0100 (CET)
Message-ID: <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
Date: Fri, 10 Jan 2025 17:21:59 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: paulmck@kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk,
 luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com,
 joel@joelfernandes.org, urezki@gmail.com, quic_neeraju@quicinc.com,
 frederic@kernel.org, linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwB3SkkqSYFndAxjAA--.10398S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr47urWfKF1rJFW5AFW3GFg_yoWfZr17pF
	WrKF1UKFn8Jr4SkrsFvw47WFyF9rn7AFn8Jr9xurykAan09r1fAry3trWY9FyUAr4Iv3Wj
	vrW5tr9xCas8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/10/2025 um 3:54 PM schrieb Paul E. McKenney:
> On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
>> Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
>>> On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
>>>>
>>>>
>>>> Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
>>>>> If I change the two plain assignments to use WRITE_ONCE() as required
>>>>> by memory-barriers.txt, OOTA is avoided:
>>>>
>>>>
>>>> I think this direction of inquiry is a bit misleading. There need not be any
>>>> speculative store at all:
>>>>
>>>>
>>>>
>>>> P0(int *a, int *b, int *x, int *y) {
>>>> 	int r1;
>>>> 	int r2 = 0;
>>>> 	r1 = READ_ONCE(*x);
>>>> 	smp_rmb();
>>>> 	if (r1 == 1) {
>>>> 		r2 = *b;
>>>> 	}
>>>> 	WRITE_ONCE(*a, r2);
>>>> 	smp_wmb();
>>>> 	WRITE_ONCE(*y, 1);
>>>> }
>>>>
>>>> P1(int *a, int *b, int *x, int *y) {
>>>> 	int r1;
>>>>
>>>> 	int r2 = 0;
>>>>
>>>> 	r1 = READ_ONCE(*y);
>>>> 	smp_rmb();
>>>> 	if (r1 == 1) {
>>>> 		r2 = *a;
>>>> 	}
>>>> 	WRITE_ONCE(*b, r2);
>>>> 	smp_wmb();
>>>> 	WRITE_ONCE(*x, 1);
>>>> }
>>>>
>>>>
>>> If we want to respect something containing a control dependency to a
>>> WRITE_ONCE() not in the body of the "if" statement, we need to make some
>>> change to memory-barriers.txt.
>>
>> I'm not sure what you denotate by *this* in "if we change this", but just to
>> clarify, I am not thinking of claiming that there were a (semantic) control
>> dependency to WRITE_ONCE(*b, r2) in this example.
>>
>> There is however a data dependency from r2 = *a to WRITE_ONCE, and I would
>> say that there is a semantic data (not control) dependency from r1 =
>> READ_ONCE(*y) to WRITE_ONCE(*b, r2), too: depending on the value read from
>> *y, the value stored to *b will be different. The latter would be enough to
>> avoid OOTA according to the mainline LKMM, but currently this semantic
>> dependency is not detected by herd7.
> 
> According to LKMM, address and data dependencies must be headed by
> rcu_dereference() or similar.  See Documentation/RCU/rcu_dereference.rst.
> 
> Therefore, there is nothing to chain the control dependency with.

Note that herd7 does generate dependencies. And speaking informally, 
there clearly is a semantic dependency.

Both the original formalization of LKMM and my patch do say that a plain 
load at the head of a dependency chain does not provide any dependency 
ordering, i.e.,

   [Plain & R] ; dep

is never part of hb, both in LKMM and in my patch.


By the way, if your concern is the dependency *starting* from the plain 
load, then we can look at examples where the dependency starts from a 
marked load:


   r1 = READ_ONCE(*x);
   smp_rmb();
   if (r1 == 1) {
     r2 = READ_ONCE(*a);
   }
   *b = 1;
   smp_wmb();
   WRITE_ONCE(*y,1);

This is more or less analogous to the case of the addr ; [Plain] ; wmb 
case you already have.


>> I currently can not come up with an example where there would be a
>> (semantic) control dependency from a load to a store that is not in the arm
>> of an if statement (or a loop / switch of some form with the branch
>> depending on the load).
>>
>> I think the control dependency is just a red herring. It is only there to
>> avoid the data race.
> 
> Well, that red herring needs to have a companion fish to swim with in
> order to enforce ordering, and I am not seeing that companion.
> 
> Or am I (yet again!) missing something subtle here?



It makes more sense to think about how people do message passing (or 
seqlock), which might look something like this:

   [READ_ONCE]
   rmb
   [plain read]

and

   [plain write]
   wmb
   [WRITE_ONCE]


Clearly LKMM says that there is some sort of order (not quite 
happens-before order though) between the READ_ONCE and the plain read, 
and between the plain write and the WRITE_ONCE. This order is clearly 
defined in the data race definition, in r-pre-bounded and w-post-bounded.

Now consider

   [READ_ONCE]
   rmb
   [plain read]
   // some code that creates order between the plain accesses
   [plain write]
   wmb
   [WRITE_ONCE]

where for some specific reason we can discern that the compiler can not 
fully eliminate/move across the barrier either this specific plain read, 
nor the plain write, nor the ordering between the two.

In this case, is there order between the READ_ONCE and the WRITE_ONCE, 
or not? Of course, we know current LKMM says no. I would say that in 
those very specific cases, we do have ordering.


>> In a hypothetical LKMM where reading in a race is not a data race unless the
>> data is used (*1), this would also work:
> 
> You lost me on the "(*1)", which might mean that I am misunderstanding
> your text and examples below.

This was meant to be a footnote :D

>>   	unsigned int r1;
>>   	unsigned int r2 = 0;
>>   	r1 = READ_ONCE(*x);
>>   	smp_rmb();
>>   	r2 = *b;
> 
> This load from *b does not head any sort of dependency per LKMM, as noted
> in rcu_dereference.rst.  As that document states, there are too many games
> that compilers are permitted to play with plain C-language loads.
> 
>>   	WRITE_ONCE(*a, (~r1 + 1) & r2);
>>   	smp_wmb();
>>   	WRITE_ONCE(*y, 1);
>>
>>
>> Here in case r1 == 0, the value of r2 is not used, so there is a race but
>> there would not be data race in the hypothetical LKMM.
> 
> That plain C-language load from b, if concurrent with any sort of store to
> b, really is a data race. Sure, a compiler that can prove that r1==0 at
> the WRITE_ONCE() to a might optimize that load away, but the C-language
> definition of data race still applies.

It is a data race according to C, but so are all races on WRITE_ONCE and 
READ_ONCE, so we already do not actually care what C says.

What we care about is what the compiler says (and does).

The reality is that no matter what kind of crazy optimizations the 
compiler does to the load and to the concurrent store, all that would 
happen is that the load "returns" some insane value. But that insane 
value is not used by the remainder of the computation.

I think the right way to think about it is that a race between a read 
and a write gives the read an indeterminate value, and a race between 
two writes produces undefined behavior. I vaguely recall that this is 
even guaranteed by LLVM.

That is why sequence locks work, after all. In our internal memory model 
we have relaxed the definition accordingly and there are a bunch of 
internally used datastructures that can only be verified because of the 
relaxation.


> 
> I am currently not at all comfortable with the thought of allowing
> plain C-language loads to head any sort of dependency.  I really did put
> that restriction into both memory-barriers.txt and rcu_dereference.rst
> intentionally.  There is the old saying "Discipline = freedom", and
> therefore compilers' lack of discipline surrounding plain C-language
> loads implies a lack of freedom.  ;-)

Yes, I understand your concern (or more generally, the concern of 
letting plain accesses play a role in ordering).
Obviously, allowing arbitrary plain loads to invoke some kind of 
ordering because of a dependency is plain (heh) wrong.
There are two kinds of potential problems:
  - the load or its dependent store may not exist in that location at all
  - the dependency may not really exist

The second case is a problem also with marked accesses, and should be 
handled by herd7 only giving us actual semantic dependencies (whatever 
those are). It can not be solved in cat. Either way it is a limitation 
that herd7 (and also other tools) currently has and we already live with.

So the new problem we deal with is to somehow restrict the rule to loads 
and dependent stores that the compiler for whatever reason will not 
fully eliminate.

This problem too can not be solved completely inside cat. We can give an 
approximation, as discussed with Alan (stating that a store would not be 
elided if it is read by another thread, and a read would not be elided 
if it reads from another thread and a store that won't be elided depends 
on it).

This approximation is also limited, e.g., if the addresses of the plain 
loads and stores have not yet escaped the function, but at least this 
scenario is currently impossible in herd7 (unlike the fake dependency 
scenario).

In my mind it would again be better to offload the correct selection of 
"compiler-un(re)movable plain loads and stores" to the tools. That may 
again not solve the problem fully, but it at least would mean that any 
changes to address the imprecision wouldn't need to go through the 
kernel tree, and IMHO it is easier to say LKMM in the cat files is the 
model, and the interpretation of the model has some limitations.





> We should decide which of these examples should be
> added to the github litmus archive, perhaps to illustrate the fact that
> plain C-language loads do not head dependency chains.  Thoughts?

I'm not sure that is a good idea, given that running the herd7 tool on 
the litmus test will clearly show a dependency chain headed by plain 
loads in the visual graphs (with `doshow rwdep`).

Maybe it makes more sense to say in the docs that they may head 
syntactic or semantic dependency chains, but because of the common case 
that the compiler may cruelly optimize things, LKMM does not guarantee 
ordering based on the dependency chains headed by plain loads. That 
would be consistent with the tooling.

> [1] https://people.kernel.org/paulmck/hunting-a-tree03-heisenbug

Fun. Thanks :) Duplication and Devious both start with D.

Best wishes
   jonas

