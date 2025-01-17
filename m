Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BB146BF
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737113397; cv=none; b=ilFEZVUB2K1dXYyJygiVcRDfVJi+QjU3rMeqMkanHPZZOrF8cQCfOstZUxSaITkZNf3gimQqEHuHJu0CAWzH5wq1duQXR1SBiuvAhrXHBub93xzmy6YGAwHIPWh+YgRzPhv3LXzq0G6NbnDbuxQRcMmKxaX0rNxEudFQxFozpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737113397; c=relaxed/simple;
	bh=A0mAw7vLqBQxFQtmb9cl4zPOikZy7iqTMgRcfOMHxdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alJ06+kF2X0zUwE8Ga/JGMRBUvvURL2WgugBeJIBIOBSdNNWHGsKMcDbdpH519Gow4SvuhdOfL62qbQT5xJfrBbMJO1qoIOcT92XNLjGBJWETMSlC1fXxWD5PI8cQ2s3VQ9PpLaQ81qCcdOhb6nnEnuILo/qAcqJeRyasATHVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YZGxN6vbLz9v7JN
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 19:00:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id A7D91140123
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 19:29:50 +0800 (CST)
Received: from [10.81.204.96] (unknown [10.81.204.96])
	by APP1 (Coremail) with SMTP id LxC2BwCnekkhP4pnsHvLAA--.52966S2;
	Fri, 17 Jan 2025 12:29:50 +0100 (CET)
Message-ID: <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
Date: Fri, 17 Jan 2025 12:29:34 +0100
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
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCnekkhP4pnsHvLAA--.52966S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKrW3Gr47WF43KrWfWFy8Krg_yoWfKw13pF
	yfKa1jka1DArsakr1Iyw1xXF1Sqw1kCry5JrnI9r18Awn8Xw1xtr13Kw1YvF98Aan7Zryj
	q390qr9rG3Z3ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/17/2025 um 12:02 AM schrieb Alan Stern:
> On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
>> I'm well aware that an absolute definition of semantic dependencies is not
>> easy to give.
> 
> In fact it's undecidable.  No tool is ever going to be able to detect
> semantic dependencies perfectly.

It depends.
Firstly, let's consider that the tool only runs on finite (or 
"finitized") programs.
Seceondly, your definition depends on the compiler.

So in the sense that we don't know the compiler, it is undecidable.
But if you fix the compiler, you could still enumerate all executions 
under that compiler and compute whether that compiler has a dependency 
or not.

But as I mentioned before, I think you can define semantic dependencies 
more appropriately because you don't really need to preserve semantic 
dependencies in C++, and in LKMM (and VMM) you have volatiles that 
restrict what kind of dependency-eliminations the compiler can do.

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

I see. There is a line in the introduction ("Roughly speaking, there is 
a semantic dependency from a given load
to a given store when all other things being equal, a change in the 
value loaded can
change the value stored or prevent the store from occurring at all"), 
but I read it too carelessly and treated it as an implication rather 
than an iff.

I suppose at some point you anyways replace the definition of OOTA with 
a version where only semantic dependencies from loads to a store are 
considered, so the concern becomes irrelevant then.


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


Yes. Actually I wonder if you put this "all loads are volatile" 
restriction, can a globally analysing compiler still have any 
optimizations that a locally analysing compiler can not?

It rather seems the other way, that the locally analysing quasi-volatile 
compiler can at least to some local optimizations, while the global 
volatile compiler can not (e.g., x=1; y=x; can not be x=1; y=1; for the 
global compiler because x is volatile now).

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
> semantic but not so many that you ever create a cycle? 

I don't know which definition is correct yet, but the point is that you 
don't have to avoid making so many dependencies that you would create a 
cycle. It just forbids the compiler from looking for cycles and 
optimizing based on the existance of the cycle. (Looking for unused vars 
and removing those is still allowed, under the informal argument that 
this simulates an execution where no OOTA happened)


> This sounds like
> an even worse problem than we started with!
 >
 >
>> So for example, if we merge  x = y || y = x,  the merge can turn it into
>> x=y=x or y=x=y (and then into an empty program), but not into a cyclic
>> dependency. So even though one side of the dependency may be violated, for
>> sake of OOTA, we could still label both sides as dependent.
> 
> They _are_ both semantically dependent (in the original parallel
> version, I mean).  I don't see what merging has to do with it.

Note that I was considering the case where they are not volatile.
With a compiler that is not treating them as volatile, which merges the 
two threads, under your definition, there is no semantic dependency in 
at least one direction because there is no hardware realization H where 
you read something else (of course you exclude such compilers, but I 
think realistically they should be allowed).

My point is that we can say they are semantically dependent for the sake 
of OOTA, not derive any ordering from these dependencies other than the 
cyclical one, and therefore allow compilers to one of the two 
optimizations (make x=y no longer depend on y or make y=x no longer 
depend on x) but noth make a cycle analysis to remove both dependencies 
and generate an OOTA value (it can remove both dependencies by leaving x 
and y unchanged though).


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

Verify that the algorithm, e.g., qspinlock, has no executions that are 
buggy, e.g., have a data race on the critical section.

It does so for a fixed test case with a small number of threads, i.e., a 
finite program.
  >> I think something like that can be a good practical solution with fewer
>> problems than other attempts to approximate the solution.
> 
> I do not like the idea of tying the definition of OOTA (which needs to
> apply to every implementation) to a particular clang compiler.

But that is what you have done, no? Whether something is an sdep depends 
on the compiler, so compiler A could generate an execution that is OOTA 
in the sdep definition of compiler B.
(Of course with the assumption of atomic=volatile, it may just be that 
we are back to the beginning and all "naive" semantic dependencies are 
actually semantic dependencies for all compilers).

Anyways what I meant is not about tying the definition of OOTA to one 
compiler or other. As I mentioned I think it can be fine to define OOTA 
in the same way for all compilers.
What I meant is to specialize the memory model to a specific compiler, 
as long as that is the compiler that is used in reality.
So long as your code does not depend on the ordering of any semantic 
dependencies, the verification can be cross platform.

And although...

 > I'm not particularly concerned about OOTA or semantic dependencies in
LKMM.

... there is code that relies on semantic dependencies, e.g. RCU read 
side CS code. (even if we do not care about OOTA).
For that code, the semantic dependencies must be guaranteed to create 
ordering.

So you either need a definition of semantic dependency that
a) applies in all cases we practically need and
b) is guaranteed by all compilers

or we need to live with the fact that we do not have a semantic 
dependency definition that is independent of the compilation (even of 
the same compiler) and need to do our verification for that specific 
compilation.

I think for LKMM we could give such a semantic dependency definition 
because it uses volatile, and verify RCU-read-side code. But we 
currently do not have one. What I meant to say is that using the actual 
(whatever compiler you use) optimizations first to remove syntactic 
dependencies, and then verifying under the assumption of whatever 
dependencies are left, may be better than trying to approximate 
dependencies in some way in cat. Given that we want to verify and rely 
on the code today, not in X years when we all agree on what a 
compiler-independent definition of semantic dependency is.

I think for C++ consume we could also give one by simply restricting 
some compiler optimizations for consume loads (and doing whatever needs 
to be done on alpha). Or just kick it out and not have any dependency 
ordering except the global OOTA case.

Sorry for the confusion, I think there are so many different 
combinations/battlefields (OOTA vs just semantic dependencies, 
volatile/non-volatile atomics, verifying the model vs verifying a piece 
of code etc.) that it becomes hard for me not to confuse myself, let 
alone others :))


Best wishes,
   jonas

