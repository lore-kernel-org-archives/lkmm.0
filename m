Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498C1F76D5
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737102887; cv=none; b=DVQseBPbzmO07bHc6oc+JuanW9gCCcGCFa6TlvO9XEqRjuMlGZp9Q5+Z4c2n8Zsha9qSeb4nLD+GH7XJ51WSBAbnECBjeqQaYIiJxmq+wpGHkS4hMlI5zBoj3D4lccsnZu4sNKYsepKnFXXt/NC3sQ6g/QDyd6Bm2lfHq++LUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737102887; c=relaxed/simple;
	bh=RXqwsYe+gTQukZYTFAlgzL/BL90M2gqdbRBYuFdlRzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2zyZ9tXflwVflk8A+UORsUbv4XiBadar6faAGyGKlvzT2w6cuauqJpY5ZELyQKYx103cfAo+uyI85iGsfKoPTo2qDy6TmYG/vd0Y4NOOZBoQmgJj+7kGKALgIZoIa5EUljkh4q6huWVKtKd8pvVA0lP77+xI3EZ1gP7VBFmF+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YZCC84wn9z9v7JS
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 16:12:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 4C95A1402A4
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 16:34:41 +0800 (CST)
Received: from [10.221.99.159] (unknown [10.221.99.159])
	by APP2 (Coremail) with SMTP id GxC2BwD3rN8TFopnAY7IAA--.50526S2;
	Fri, 17 Jan 2025 09:34:40 +0100 (CET)
Message-ID: <1e79ed9f-827d-4c37-b2ec-026374cf819d@huaweicloud.com>
Date: Fri, 17 Jan 2025 09:34:23 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: Alan Stern <stern@rowland.harvard.edu>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
 urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev
References: <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
Content-Language: en-US
From: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
In-Reply-To: <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwD3rN8TFopnAY7IAA--.50526S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWrCr4rAw1UZFyxZr1UJrb_yoW3ZF17pa
	yIgF4jka1DJF4fAr4xtw4xW3WSva1kAry5Jr9xKr18A3s8Xr1xtr47Kr15ua4kAr4vv34j
	qrZ8ur95G3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: xkhu0tnqos00pfhgvzhhrqqx5xdzvxpfor3voofrz/

On 1/17/2025 12:02 AM, Alan Stern wrote:
> On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
>> I'm well aware that an absolute definition of semantic dependencies is not
>> easy to give.
> 
> In fact it's undecidable.  No tool is ever going to be able to detect
> semantic dependencies perfectly.
> 
>> Btw, I'm re-reading that paper and here are some comments:
>> - I agree with the conclusion that C++ should not try to solve OOTA other
>> than declaring that they do not exist
>> - the definition of OOTA as sdep | rfe is not the right one. You really need
>> sdep ; rfe, because you can have multiple subsequent sdep links that
>> together are not a dependency, e.g.,
>>
>> int * x[] = { &a, &a };
>> int i = b;
>> *x[i] = 1;
>>
>> here the semantic address dependency from loading b to loading x[i] and the
>> semantic address dependency from loading x[i] and storing to *x[i] do not
>> together form a semantic dependency anymore, because *x[i] is always a. So
>> this whole code can just become a=1, and with mirrored code you can get
>> a=b=1, which is an sdep | rfe cycle.
> 
> We regard sdep as extending from loads (or sets of loads) to stores.
> (Perhaps the paper doesn't state this explicitly -- it should.)  So an
> sdep ; sdep sequence is not possible.
> 
> Nevertheless, it's arguable that in your example there is no semantic
> dependency from the load of b to the load of x[i].  Given the code
> shown, a compiler could replace the load of x[i] with the constant value
> &a, yielding simply *(&a) = 1.
> 
> There are other examples which do make the point, however.  For example:
> 
> int a = 1, b = 1, c = 2;
> int *x[] = {&a, &b, &c};
> 
> int r1 = i;
> if (r1 > 1)
> 	r1 = 1;
> int *r2 = x[r1];
> int r3 = *r2;
> q = r3;
> 
> Here there is a semantic dependency (if you accept dependencies to
> loads) from the load of i to the load of x[r1] and from the load of *r2
> to the store to q.  But overall the value stored to q is always 1, so it
> doesn't depend on the load from i.
> 
>> - I did not like the phrasing that a dependency is a function of one
>> execution, especially in contrast to source code. For a fixed execution,
>> there are no dependencies because all values are fixed. It is the other
>> executions - where you could have read another value - that create the
>> dependencies.
>>
>> Perhaps it is better to say that it is not a *local* function of source
>> code, i.e., just because the same source code has a dependency in context C
>> does not mean that it has a dependency in context C'.
> 
> Of course, what we meant is that whether or not there is a semantic
> dependency depends on both the source code and the execution.
> 
>> In fact I would say a major gotcha of dependencies is that they are not a
>> function of even the set of all permissible (according to the standard)
>> executions.
>> That is because the compiler does not have to make every permissible
>> execution possible, only at least one.
> 
> The paper includes examples of this, I believe.
> 
>> If the compiler knows that among all executions that it actually makes
>> possible, some value is always 0 - even if there is a permissible execution
>> in which it is not 0 - it can still replace that value with 0. E.g.
>>
>>    T1 { x = 1; x = 0; }
>>    T2 { T[x] = 1; }
>>
>>     ~~ merge -- makes executions where T[x] reads x==1 impossible ~>
>>
>>    T1' { x = 1; x = 0; T[x] = 1; }
>>
>>     ~~ replace ~>
>>
>>    T1' { x = 1; x = 0; T[0] = 1; // no more dependency :( }
>>
>> which defeats any semantic dependency definition that is a function of a
>> single execution.
> 
> Our wording could be improved.  We simply want to make the point that
> the same source code may have a semantic dependency in one execution but
> not in another.  I guess we should avoid calling it a "function" of the
> execution, to avoid implying that the execution alone is what matters.
> 
>> Of course you avoid this by making it really a function of the compiler +
>> program *and* the execution, and looking at all the other possible (not just
>> permissible) executions.
>>
>> - On the one hand, that definition makes a lot of sense. On the other hand,
>> at least without the atomics=volatile restriction it would have the downside
>> that a compiler which generates just a single execution for your program can
>> say that there are no dependencies whatsoever and generate all kinds of "out
>> of thin air" behaviors.
> 
> That is so.  But a compiler which examines only a single thread at a
> time cannot afford to generate just a single execution, because it
> cannot know what values the loads will obtain when the full program
> runs.
> 
>> I am not sure if that gets really resolved by the volatile restrictions you
>> put, but either way those seem far stronger than what one would want.
> 
> It does get resolved, because treating atomics as volatile also means
> that the compiler cannot afford to generate just a single execution.
> Again, because it cannot know what values the loads will obtain at
> runtime, since volatile loads can yield any value in a non-benign
> environment.
> 
>> I would say that the approach with volatile is overzealous because it tries
>> to create a "local" order solution to the problem that only requires a
>> "global" ordering solution. Since not every semantic dependency needs to
>> provide order in C++ -- only the cycle of dependencies -- it is totally ok
>> to add too many semantic dependency edges to a program, even those that are
>> not going to be exactly maintained by every compiler, as long as we can
>> ensure that globally, no dependency cycle occurs.
> 
> But then how would you characterize semantic dependencies, if you want
> to allow the definition to include some dependencies that aren't
> semantic but not so many that you ever create a cycle?  This sounds like
> an even worse problem than we started with!
> 
>> So for example, if we merge  x = y || y = x,  the merge can turn it into
>> x=y=x or y=x=y (and then into an empty program), but not into a cyclic
>> dependency. So even though one side of the dependency may be violated, for
>> sake of OOTA, we could still label both sides as dependent.
> 
> They _are_ both semantically dependent (in the original parallel
> version, I mean).  I don't see what merging has to do with it.
> 
>> For LKMM the problem is of course much easier because you have volatiles and
>> compiler barriers. Again you could maybe add incorrect semantic dependencies
>> between accesses, as long as only the really preserved ones will imply
>> ordering.
> 
> I'm not particularly concerned about OOTA or semantic dependencies in
> LKMM.
> 
>> So I'm not convinced that for either of the two cases you need to do a
>> compiler-specific definition of dependencies.
> 
> For the C++ case, I cannot think of any other way to approach the
> problem.  Nor do I see anything wrong with a compiler-specific
> definition, given how nebulous the whole idea is in the first place.
> 
>> BTW, for what it's worth, Dat3M in a sense uses the clang dependencies - it
>> first allows the compiler to do its optimizations, and then verifies the
>> llvm-ir (with a more hardware-like dependency definition).
> 
> What do you mean by "verifies"?  What property of the llvm-ir does it
> verify?

Let me be more precise here. The Dat3M verifier has its own IR and it 
can verify 3 kinds of properties:

- assertions written in the code
- lack of liveness violations (e.g., a spinloop does not hang)
- other properties written in the .cat file as "flag ~empty(r)", data 
races in LKMM/C fit in this category.

Dat3M has several parsers to create its own IR: it can read the litmus 
format of herd, but also C code by first converting to llvm-ir, and then 
parsing this one.

In the case of verifying kernel code wrt LKMM we do some magic such that 
anything related to the "LKMM concurrency API" (things like 
atomic_cmpxchg) appear as function calls in the llvm-ir. This allows us 
to parse this as the concrete type of event we want.

Hernan
> 
>> I think something like that can be a good practical solution with fewer
>> problems than other attempts to approximate the solution.
> 
> I do not like the idea of tying the definition of OOTA (which needs to
> apply to every implementation) to a particular clang compiler.
> 
> Alan

