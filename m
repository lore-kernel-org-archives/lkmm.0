Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197341BCA1C
	for <lkmm@lists.linux.dev>; Sun, 12 Jan 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736697341; cv=none; b=Pew8CC8H0barZ7wW9wsuq3Gpxo8ljOxjVjWCHJpuQSipATCbdIhq5HnGVcJZS7QD+eld2PUqvVKMtxlPG7H+L6+lBLjJmvXkOYCmkLYtS1bjnl/QWbj4dKjfXtBlxDF2CVBjV1U4mpMmXonYj1n44aVw1ZQKU6I70wdYd0TfP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736697341; c=relaxed/simple;
	bh=ZBVSngFRsQHYZu4/sTJzMPOHFbM4KiIn8g8Rs7b20T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoLx14Q0naWF+34cFHGHSCQ0TARYz+bNlnO7notBTq4rLesAc/Fpke/QgFjpRNlNZ5RKz1oZ6yxI5TOpWDKm6xAQiEdap6y1QincfpLk4KECm/cR7JK2TIJ28nMSyuUwSJem7icbWZNOIj8VNWZbMVhW02vdOUSO5p20Va9mqus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YWKDB1cK9z9v7J5
	for <lkmm@lists.linux.dev>; Sun, 12 Jan 2025 23:33:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id EAF851402E0
	for <lkmm@lists.linux.dev>; Sun, 12 Jan 2025 23:55:23 +0800 (CST)
Received: from [10.81.210.13] (unknown [10.81.210.13])
	by APP1 (Coremail) with SMTP id LxC2BwAnrEre5YNnsFSBAA--.57461S2;
	Sun, 12 Jan 2025 16:55:23 +0100 (CET)
Message-ID: <0b1a9379-000d-4924-a930-dde5daaf1dd8@huaweicloud.com>
Date: Sun, 12 Jan 2025 16:55:07 +0100
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
References: <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
 <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
 <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
 <838f7a51-c0f5-4a19-8407-6591426fd4a8@huaweicloud.com>
 <44749eab-90b0-489d-a409-c6a5cc7b8e04@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <44749eab-90b0-489d-a409-c6a5cc7b8e04@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwAnrEre5YNnsFSBAA--.57461S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww47Jw4xKw43XF43tr47Jwb_yoW3ur1rpF
	WrKFy7Ka1kCFyIyw12vw17XFySqr4xJF45Jr95Gry8Awn0gr1xtF4xKrWYvFyUZr4kZa4j
	v3yjvF95Zas8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/11/2025 um 10:19 PM schrieb Alan Stern:
> On Sat, Jan 11, 2025 at 01:46:21PM +0100, Jonas Oberhauser wrote:
 >>
>> This is under my assumption that if we had let's say gcc's "semantic
>> dependencies" or an under-approximation of it (by that I mean allow less
>> things to be dependent than gcc can see), that these cases would be
>> resolved, in the sense that gcc can not undermine [R & Marked] ; gcc-dep
>> where gcc-dep is the dependencies detected by gcc.
> 
> That seems circular.  Basically, you're saying the gcc will not break
> any dependencies that gcc classifies as not-breakable!

Maybe my formulation is not exactly what I meant to express.
I am thinking of examples like this,

  r1 = READ_ONCE(*x);
  *b = r1;

~~>

  r1 = READ_ONCE(*x);
  if (*b != r1) {
    *b = r1;
  }

Here there is clearly a dependency to a store, but gcc might turn it 
into an independent load (in case *b == r1).

Just because gcc admits that there is a dependency, does not necessarily 
mean that it will not still undermine the ordering "bestowed upon" that 
dependency by a memory model in some creative way.

The cases that I could think of all still worked for very specific 
architecture-specific reasons (e.g., x86 has CMOV but all loads provide 
acquire-ordering, and arm does not have flag-conditional str, etc.)

Or perhaps there is no dependency in case *b == r1. I am not sure.

Another thought that pops up here is that when I last worked on 
formalizing dependencies, I could not define dependencies as being 
between one load and one store, a dependency might be between a set of 
loads and one store. I would have to look up the exact reason, but I 
think it was because sometimes you need to change more than one value to 
influence the result, e.g., a && b where both a and b are 0 - just 
changing one will not make a difference.

All of these complications make me wonder whether even a relational 
notion of semantic dependency is good enough.

>>>> Alan Stern:
>>>>> Perhaps so.  LKMM does include other features which the compiler can
>>>>> defeat if the programmer isn't sufficiently careful.
>>>>
>>>> How many of these are due to herd7's limitations vs. in the cat file?
>>>
>>> Important limitations are present in both.
>>
>> I am genuinely asking. Do we have a list of the limitations?
>> Maybe it would be good to collect it in the "A WARNING" section of
>> explanation.txt if it doesn't exist elsewhere.
> 
> There are a few listed already at various spots in explanation.txt --
> search for "undermine".  And yes, many or most of these limitations do
> arise from LKMM's failure to recognize when a dependency isn't semantic.
> Maybe some are also related to undefined behavior, which LKMM is not
> aware of.

Thanks. Another point mentioned in that document is the total order of 
po, whereas C has a more relaxed notion of sequenced-before; this could 
even affect volatile accesses, e.g. in f(READ_ONCE(*a), g()). where g() 
calls an rmb and then READ_ONCE(*b), and it is not clear whether there 
should be a ppo from reading *a to *b in some executions or not.

> 
> There is one other weakness I know of, however -- something totally
> different.  It's an instance in which the formal model in the .cat file
> fails to capture the intent of the informal operational model.
> 
> As I recall, it goes like this: The operational model asserts that an
> A-cumulative fence (like a release fence) on a CPU ensures ordering for
> all stores that propagate to that CPU before the fence is executed.  But
> the .cat code says only that this ordering applies to stores which the
> CPU reads from before the fence is executed.  I believe you can make up
> litmus tests where you can prove that a store must have propagated to
> the CPU before an A-cumulative fence occurs, even though the CPU doesn't
> read from that store; for such examples the LKMM may accept executions
> that shouldn't be allowed.
> 
> There may even be an instance of this somewhere in the various litmus
> test archives; I don't remember.


Ah, I think you explained this case to me before. It is the one where 
prop & int covers some but not all cases, right? (compared to the cat 
PowerPC model, which does not even have prop & int)

For now I am mostly worried about cases where LKMM promises too much, 
rather than too little. The latter case arises naturally as a trade-off 
between complexity of the model, algorithmic complexity, and what 
guarantees are actually needed from the model by real code.

By the way, I am currently investigating a formulation of LKMM where 
there is a separate "propagation order" per thread, prop-order[t], which 
relates `a` to `b` events iff `a` is "observed" to propagate to t before 
`b`. Observation can also include co and fr, not just rf, which might be 
sufficient to cover those cases. I have a hand-written proof sketch that 
an order ORD induced by prop-order[t], xb, and some other orders is 
acyclic, and a Coq proof that executing an operational model in any 
linearization of ORD is permitted (e.g., does not propagate a store 
before it is executed, or in violation of co) and has the same rf as the 
axiomatic execution.

So if the proof sketch works out, this might indicate that with such a 
per-thread propagation order, one can eliminate those cases.

But to make the definition work, I had to make xb use prop-order[t] 
instead of prop in some cases, and the definitions of xb and 
prop-order[t] are mutually recursive, so it's not a very digestible 
definition.

So I do not recommend replacing LKMM with such a model even if it works, 
but it is useful for investigating some boundary conditions.

>>> An execution of the corresponding machine code would then be compatible
>>> with an abstract execution of the source code in which both r0 and r1
>>> get set to 42 (OOTA).  But it would also be compatible with an abstract
>>> execution in which both r0 and r1 are 0, so it doesn't make sense to say
>>> that the hardware execution is, or might be, an instance of OOTA.
>>
>> Yes, but this does not require the definition you expressed before. This is
>> already not observable according to the definition that there is no read R
>> from an OOTA-cycle store, where some observable side effect semantically
>> depends on R.
 >>
>> What I was trying to say is that your definition is almost a
>> no-true-scotsman (sorry Paul) definition:
> 
> (I would use the term "tautology" -- although I don't believe it was a
> tautology in its original context, which referred specifically to cases
> where the compiler had removed all the accesses in an OOTA cycle.)
> 
>>   every program with an OOTA
>> execution where you could potentially not find an "equivalent" execution
>> without OOTA, is simply labeled a "no-true-unobserved OOTA".
>>
>>>> But it does make the proof of your claim totally trivial. If there is no
>>>> other OOTA-free execution with the same observable behavior, then it is
>>>> proof that the OOTA happened, so the OOTA was observed.
>>>> So by contraposition any non-observed OOTA has an OOTA-free execution with
>>>> the same observable behavior.
>>>>
>>>> The sense in which I would define observed is more along the lines of "there
>>>> is an observable side effect (such as store to volatile location) which has
>>>> a semantic dependency on a load that reads from one of the stores in the
>>>> OOTA cycle".
> 
> Agreed.  But maybe this indicates that your sense is too weak a
> criterion, that an indirect observation should count just as much as a
> direct one.
I don't follow this conclusion.
I think there are two relevant claims here:
1) compilers do not introduce "observed OOTA"
2) For every execution graph with not-observed OOTA, there is another 
execution with the same observable side effects that does not have OOTA.

While it may be much easier to prove 2) with a more relaxed notion of 
observed OOTA, 1) sounds much harder. How does the compiler know that 
there is no indirect way to observe the OOTA?

E.g., in the LKMM example, ignoring the compiler barriers, it might be 
possible for a compiler to deduce that the plain accesses are never used 
and delete them, resulting in an OOTA that is observed under the more 
relaxed setting, violating claim 1).

Best wishes,
   jonas

