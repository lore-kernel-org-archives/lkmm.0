Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B208B1F12F4
	for <lkmm@lists.linux.dev>; Tue, 21 Jan 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455784; cv=none; b=AgtJ0NCO8VCYF4XnNkkBIf24np61OW8NDSTg7ppwZb6l2SgjQxlzLaGHzhWi5DUu5iq/6qMCVmvCeQi9LCf/2+QSucyVltNqflFF/NESJi1rJHhITiUGA2irmJlLEGt54MIXJGXLNsHyxjZpbkqO2Ds9K9UGZw8uBIbAw5K/HNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455784; c=relaxed/simple;
	bh=4IIgDlco9UFvSMVJCs2CrLd/CvayMFFKTwHuITf+oGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c45nKyFZMHSUD+S7//yWdBW3H6mDnqTC/pnnsMp0zV76y6eKz9CEqSo0/O5wkcSHZ/4FN1vUOx1pVm2tXTmBgUi3CaXlD1COP/r/OyK5bGeEMLeKzzQL8WOiudu8e18oCyFQ/CWolO5H2pajEq7hGgS2xu+SHLNFObyAXARlJ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YcjjW5MY3z9v7JS
	for <lkmm@lists.linux.dev>; Tue, 21 Jan 2025 18:14:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 6F04014037F
	for <lkmm@lists.linux.dev>; Tue, 21 Jan 2025 18:36:12 +0800 (CST)
Received: from [10.48.13.152] (unknown [10.48.13.152])
	by APP1 (Coremail) with SMTP id LxC2BwA3vUuTeI9nsIcIAQ--.64422S2;
	Tue, 21 Jan 2025 11:36:11 +0100 (CET)
Message-ID: <2139f8ce-63fa-4231-864b-500ee2645811@huaweicloud.com>
Date: Tue, 21 Jan 2025 11:36:01 +0100
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
References: <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
 <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwA3vUuTeI9nsIcIAQ--.64422S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KrW8Xry7XryrZr48Jr1xAFb_yoWDWr48pa
	4fKa12kF4DJFsrCr1Iyw4xWa4Fvwn7AFy5Grn8Gr10ywn8Ww1ftr47KrWY9F9xCr4xZFyj
	q3yqqr9rG3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
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



Am 1/17/2025 um 9:01 PM schrieb Alan Stern:
> On Fri, Jan 17, 2025 at 12:29:34PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/17/2025 um 12:02 AM schrieb Alan Stern:
>>> On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
>>>> I'm well aware that an absolute definition of semantic dependencies is not
>>>> easy to give.
>>>
>>> In fact it's undecidable.  No tool is ever going to be able to detect
>>> semantic dependencies perfectly.
>>
>> It depends.
>> Firstly, let's consider that the tool only runs on finite (or "finitized")
>> programs.
> 
> A program may be finite; that doesn't mean its executions are.  Programs
> can go into infinite loops.  Are you saying that the tool would stop
> verifying executions after (say) a billion steps?  But then it would not
> be able to detect semantic dependences in programs that run longer.

Yes, what I said is not fully correct. Finite (non-trivial-)loop-free 
programs, or programs with finite (representative) execution spaces, 
would have been more correct.



> 
>> Seceondly, your definition depends on the compiler.
>>
>> So in the sense that we don't know the compiler, it is undecidable.
>> But if you fix the compiler, you could still enumerate all executions under
>> that compiler and compute whether that compiler has a dependency or not.
> 
> You can't enumerate the executions unless you put an artificial bound on
> the length of each execution, as noted above.

Note that for many practical cases it is possible to write test cases 
where the bound is not artificial in the sense that it is at least as 
large as the bound needed for exhaustive enumeration.


>> But as I mentioned before, I think you can define semantic dependencies more
>> appropriately because you don't really need to preserve semantic
>> dependencies in C++, and in LKMM (and VMM) you have volatiles that restrict
>> what kind of dependency-eliminations the compiler can do.
> 
> What makes you think this "more appropriate" definition of semantic
> dependency will be any easier to detect than the original one?

For starters, as you mentioned, the compiler has to assume any value is 
possible.

Which means that if any other value would lead to a "different 
behavior", you know you have a semantic dependency. You can detect this 
in a per-thread manner, independently of the compiler.

Without the assumption of volatile, even a different value that could 
actually be generated in another run of the same program does not prove 
a semantic dependency.


>> Yes. Actually I wonder if you put this "all loads are volatile" restriction,
>> can a globally analysing compiler still have any optimizations that a
>> locally analysing compiler can not?
> 
> Yes, although whether they are pertinent is open to question.  For
> example, a globally optimizing compiler may observe that no thread ever
> reads the value of a particular shared variable and then eliminate that
> variable.

Oh, I meant the "all atomic objects is volatile" restriction, not just 
the loads. In that case, all stores the object - even if never read - 
still need to be generated.

Are there still any optimizations?

>> It rather seems the other way, that the locally analysing quasi-volatile
>> compiler can at least to some local optimizations, while the global volatile
>> compiler can not (e.g., x=1; y=x; can not be x=1; y=1; for the global
>> compiler because x is volatile now).
> 
> In the paper we speculate that it may be sufficient to require globally
> optimizing compilers to treat atomics as quasi volatile with the added
> restriction that loads must not be omitted.

I see.

>>> But then how would you characterize semantic dependencies, if you want
>>> to allow the definition to include some dependencies that aren't
>>> semantic but not so many that you ever create a cycle?
>>
>> I don't know which definition is correct yet, but the point is that you
>> don't have to avoid making so many dependencies that you would create a
>> cycle. It just forbids the compiler from looking for cycles and optimizing
>> based on the existance of the cycle. (Looking for unused vars and removing
>> those is still allowed, under the informal argument that this simulates an
>> execution where no OOTA happened)
> 
> At the moment, the only underlying ideas we have driving our notions of
> semantic dependency is that a true semantic dependency should be one
> which must give rise to order in the machine code.  In turn, this order
> prevents OOTA cycles from occuring during execution.  That is the
> essence of the paper.
> 
> Can your ideas be fleshed out to a comparable degree?

Well, I certainly have not put as much deep thought into it as you have, 
so it is certainly more fragile. But my current thoughts are along these 
lines:

We consider inter-thread semantic dependencies (isdep) based on the set 
of allowed executions + thread local optimizations + what would be 
allowed to happen if rfe edges along the dependencies become rfi edges 
due to merging. So the definition is not compiler-specific.

Those provide order at machine level unless the compiler restricts the 
set of executions through its choices, especially cross-thread 
optimizations, and then uses the restricted set of executions (i.e., 
possible input range) to optimize the execution further.
I haven't thought deeply about all the different optimizations that are 
possible there.

For an example of how it may not provide order, if we have accesses 
related by isdep;rfe;isdep, then the compiler could merge all the 
involved threads into one, and the accesses could no longer have any 
dependency.

So it is important that one can not forbid isdep;rf cycles, the axiom 
would be that isdep;rf is irreflexive.


When merging threads, if in an OOTA execution there is an inter-thread 
semantic dependency from r in one of the merged threads to w in one of 
the merged threads, such that r reads from a non-merged thread and w is 
read by a non-merged thread in the OOTA cycle, then it is still an 
inter-thread dependency which still preserves the order. This prevents 
the full cycle even if it some other sub-edges within the merged threads 
are now no longer dependencies.

But if r is reading from w in the OOTA cycle, then the compiler (which 
is not allowed to look for the cycle) has to put r before w in the 
merged po, preventing r from reading w. (it can also omit r by giving it 
a value that it could legally read in this po, but it still can't get 
its value from w this way).

E.g.,
P0 {
   y = x;
}
P1 {
   z = y;
}
... (some way to assign x dependent on z)

would have an inter-thread dependency from the load of x to the store to 
z. If P0 and P1 are merged, and there are no other accesses to y, then 
the intra-thread dependency from loading x to store to y etc. are 
eliminated, but the inter-thread dependency from x to z remains.



>>>> So for example, if we merge  x = y || y = x,  the merge can turn it into
>>>> x=y=x or y=x=y (and then into an empty program), but not into a cyclic
>>>> dependency. So even though one side of the dependency may be violated, for
>>>> sake of OOTA, we could still label both sides as dependent.
>>>
>>> They _are_ both semantically dependent (in the original parallel
>>> version, I mean).  I don't see what merging has to do with it.
>>
>> Note that I was considering the case where they are not volatile.
>> With a compiler that is not treating them as volatile, which merges the two
>> threads, under your definition, there is no semantic dependency in at least
>> one direction because there is no hardware realization H where you read
>> something else (of course you exclude such compilers, but I think
>> realistically they should be allowed).
>>
>> My point is that we can say they are semantically dependent for the sake of
>> OOTA, not derive any ordering from these dependencies other than the
>> cyclical one, and therefore allow compilers to one of the two optimizations
>> (make x=y no longer depend on y or make y=x no longer depend on x) but not
>> make a cycle analysis to remove both dependencies and generate an OOTA value
>> (it can remove both dependencies by leaving x and y unchanged though).
> 
> I don't understand.

Does the explanation above help?

> 
>>> I do not like the idea of tying the definition of OOTA (which needs to
>>> apply to every implementation) to a particular clang compiler.
>>
>> But that is what you have done, no? Whether something is an sdep depends on
>> the compiler, so compiler A could generate an execution that is OOTA in the
>> sdep definition of compiler B.
> 
> Yes, but this does not tie the definition to _one particular_ compiler.
> That is, we don't say "This dependency is semantic because of the way
> GCC 14.2.1 handles it."  Rather, we define for each compiler whether a
> dependency is semantic for _that_ compiler.

Yes, but the result is still that every compiler has its own memory 
model (at least at the point of which graphs are being ruled out as 
OOTA). So there is no definition of 'G is OOTA', only 'G is OOTA on 
compiler x'.

The example I gave of the tool verifying the program relative to one 
specific compiler is also not giving a definition of 'G is OOTA', in 
fact, it does not specify OOTA at all; it simply says ``with compiler x, 
we get the following "semantic dependencies" and the following graphs...''

And as long as compiler x does not generate OOTA, there will be no OOTA 
graphs among those.

So it does not solve or tackle the theoretical problem in any way, and 
can not do cross-compiler verification. But it will already apply the 
'naive-dependency-breaking optimizations' that you would not see in e.g. 
herd7.


>> So you either need a definition of semantic dependency that
>> a) applies in all cases we practically need and
>> b) is guaranteed by all compilers
>>
>> or we need to live with the fact that we do not have a semantic dependency
>> definition that is independent of the compilation (even of the same
>> compiler) and need to do our verification for that specific compilation.
> 
> Add the qualification that the definition should be practical to
> evaluate, and I agree.

Yes, an important point. And hard to resolve as well.


Best wishes,
   jonas

