Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B41D22D4EB
	for <lkmm@lists.linux.dev>; Thu, 16 Jan 2025 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054533; cv=none; b=kv0l0lg0fx/4grb+Zptd6bU8cDTg3QHBP39Obqs9oLtkSwPISHdRh9wqCgMk5bhZlHKy0LWecSHeIkXm2lhAunug0zUhrM+g371GZZTjtIZFHU2nciJJ5dUbGeb9TrSlYc2Q13R9Wx+Thqg33esOw3LR5dZnCeEiJT/flQOZ+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054533; c=relaxed/simple;
	bh=EySxsoaeQOx9D3KkNIcg4KVUnc7K+CeDLPIB9v8f7KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LE3CB+xtjl6M5xXzwVg9m4Z/FY8SW2yJ2TlNt2BWQXYmJCipQ303qKzrqCSy+yHxiHTVr+EL3ZwgrBZWhXS6vWCJr5T0fTNy2d68s8JMz1dlsrezkiHUnPo8jEnlc78DcGCGR9SLT9k9ZheXRts/YrBMmrfN3JouzWGdJ0Kj+VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YYs9K2BL6z9v7JW
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 02:39:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id CAAFA1400FD
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 03:08:41 +0800 (CST)
Received: from [10.45.144.192] (unknown [10.45.144.192])
	by APP1 (Coremail) with SMTP id LxC2BwA3vUspWYlnEf_AAA--.35109S2;
	Thu, 16 Jan 2025 20:08:40 +0100 (CET)
Message-ID: <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
Date: Thu, 16 Jan 2025 20:08:22 +0100
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
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwA3vUspWYlnEf_AAA--.35109S2
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr1rXw48KF1UGry5XF4fKrg_yoW8Gr1rJo
	Z3Cw4xJa1xtr18uF1UCa4kCry3W34qkF45Xryjvr45KF1qq3yUCw1UAw18Xay3tF10kFWD
	Ja4rXa4YvFnxtFnxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUY77kC6x804xWl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/13/2025 um 11:04 PM schrieb Paul E. McKenney:
> On Fri, Jan 10, 2025 at 05:21:59PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/10/2025 um 3:54 PM schrieb Paul E. McKenney:
>>> On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
>>>> Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
>>>>> On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
>>>>>>
>>>>>>
>>>>>> Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
>>>>>>> If I change the two plain assignments to use WRITE_ONCE() as required
>>>>>>> by memory-barriers.txt, OOTA is avoided:
>>>>>>
>>>>>>
>>>>>> I think this direction of inquiry is a bit misleading. There need not be any
>>>>>> speculative store at all:
>>>>>>
>>>>>>
>>>>>>
>>>>>> P0(int *a, int *b, int *x, int *y) {
>>>>>> 	int r1;
>>>>>> 	int r2 = 0;
>>>>>> 	r1 = READ_ONCE(*x);
>>>>>> 	smp_rmb();
>>>>>> 	if (r1 == 1) {
>>>>>> 		r2 = *b;
>>>>>> 	}
>>>>>> 	WRITE_ONCE(*a, r2);
>>>>>> 	smp_wmb();
>>>>>> 	WRITE_ONCE(*y, 1);
>>>>>> }
>>>>>>
>>>>>> P1(int *a, int *b, int *x, int *y) {
>>>>>> 	int r1;
>>>>>>
>>>>>> 	int r2 = 0;
>>>>>>
>>>>>> 	r1 = READ_ONCE(*y);
>>>>>> 	smp_rmb();
>>>>>> 	if (r1 == 1) {
>>>>>> 		r2 = *a;
>>>>>> 	}
>>>>>> 	WRITE_ONCE(*b, r2);
>>>>>> 	smp_wmb();
>>>>>> 	WRITE_ONCE(*x, 1);
>>>>>> }
>>>>>>
>>>>>>
>>>>> If we want to respect something containing a control dependency to a
>>>>> WRITE_ONCE() not in the body of the "if" statement, we need to make some
>>>>> change to memory-barriers.txt.
>>>>
>>>> I'm not sure what you denotate by *this* in "if we change this", but just to
>>>> clarify, I am not thinking of claiming that there were a (semantic) control
>>>> dependency to WRITE_ONCE(*b, r2) in this example.
>>>>
>>>> There is however a data dependency from r2 = *a to WRITE_ONCE, and I would
>>>> say that there is a semantic data (not control) dependency from r1 =
>>>> READ_ONCE(*y) to WRITE_ONCE(*b, r2), too: depending on the value read from
>>>> *y, the value stored to *b will be different. The latter would be enough to
>>>> avoid OOTA according to the mainline LKMM, but currently this semantic
>>>> dependency is not detected by herd7.
>>>
>>> According to LKMM, address and data dependencies must be headed by
>>> rcu_dereference() or similar.  See Documentation/RCU/rcu_dereference.rst.
>>>
>>> Therefore, there is nothing to chain the control dependency with.
>>
>> Note that herd7 does generate dependencies. And speaking informally, there
>> clearly is a semantic dependency.
>>
>> Both the original formalization of LKMM and my patch do say that a plain
>> load at the head of a dependency chain does not provide any dependency
>> ordering, i.e.,
>>
>>    [Plain & R] ; dep
>>
>> is never part of hb, both in LKMM and in my patch.
> 
> Agreed, LKMM does filter the underlying herd7 dependencies.
> 
>> By the way, if your concern is the dependency *starting* from the plain
>> load, then we can look at examples where the dependency starts from a marked
>> load:
>>
>>
>>    r1 = READ_ONCE(*x);
>>    smp_rmb();
>>    if (r1 == 1) {
>>      r2 = READ_ONCE(*a);
>>    }
>>    *b = 1;
>>    smp_wmb();
>>    WRITE_ONCE(*y,1);
>>
>> This is more or less analogous to the case of the addr ; [Plain] ; wmb case
>> you already have.
> 
> This is probably a failure of imagination on my part, but I am not
> seeing how to create another thread that interacts with that store to
> "b" without resulting in a data race.

The other thread is the same just flipping x/y and a/b around.

     r1 = READ_ONCE(*y);
     smp_rmb();
     if (r1 == 1) {
       r2 = READ_ONCE(*b);
     }
     *a = 1;
     smp_wmb();
     WRITE_ONCE(*x,1);

There is no data race, because the read from *b can only happen if we 
also read from the store to *y, and there are a wmb and an rmb to 
'prevent the reordering' of the assignments to *b and *y, and the load 
from *y and the load from *b.


> Ignoring that, I am not seeing much in the way of LKMM dependencies
> in that code.

Ah, I meant to write

  *b = r2

and

  *a = r2

My mistake.


Note that if we just change it like this:

     r1 = READ_ONCE(*x);
     smp_rmb();
     if (r1 == 1) {
       r2 = READ_ONCE(*a);
     }
     *r2 = a;
     smp_wmb();
     WRITE_ONCE(*y,1);

then we have an addr dependency and the OOTA becomes forbidden (unless 
you know how to initialize *a and *b to valid addresses, you may need to 
add something like `if (r2 == 0) r2 = a` to run this in herd7).

It still has the same anomaly that triggers the OOTA though, where both 
threads can read r1==1. This anomaly goes away with my patch.


>> That is why sequence locks work, after all. In our internal memory model we
>> have relaxed the definition accordingly and there are a bunch of internally
>> used datastructures that can only be verified because of the relaxation.
> 
> Again, it is likely best to model sequence locking directly.

You can take that point of view. For our model, like I said, we have 
taken the other point of view.

The main advantage being that it helps us prove that our sequence lock 
and a few other speculative algorithms we have developed are correct.

>>> I am currently not at all comfortable with the thought of allowing
>>> plain C-language loads to head any sort of dependency.  I really did put
>>> that restriction into both memory-barriers.txt and rcu_dereference.rst
>>> intentionally.  There is the old saying "Discipline = freedom", and
>>> therefore compilers' lack of discipline surrounding plain C-language
>>> loads implies a lack of freedom.  ;-)
>>
>> Yes, I understand your concern (or more generally, the concern of letting
>> plain accesses play a role in ordering).
>> Obviously, allowing arbitrary plain loads to invoke some kind of ordering
>> because of a dependency is plain (heh) wrong.
>> There are two kinds of potential problems:
>>   - the load or its dependent store may not exist in that location at all
>>   - the dependency may not really exist
>>
>> The second case is a problem also with marked accesses, and should be
>> handled by herd7 only giving us actual semantic dependencies (whatever those
>> are). It can not be solved in cat. Either way it is a limitation that herd7
>> (and also other tools) currently has and we already live with.
> 
> This is easy to say.  Please see this paper (which Alan also referred to)
> for some of the challenges:
> 
> https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2024/p3064r2.pdf
> 
> Mark Batty and his group have identified more gotchas.  (See the citation
> in the above paper.)

I'm well aware that an absolute definition of semantic dependencies is 
not easy to give.

The point is, it's not a problem that can, in any way, be really solved 
inside the cat model.

So if it should be solved (instead of approximated in ways that can be 
easily undermined), it needs to be handled by the tooling around the cat 
model.

Btw, I'm re-reading that paper and here are some comments:
- I agree with the conclusion that C++ should not try to solve OOTA 
other than declaring that they do not exist
- the definition of OOTA as sdep | rfe is not the right one. You really 
need sdep ; rfe, because you can have multiple subsequent sdep links 
that together are not a dependency, e.g.,

int * x[] = { &a, &a };
int i = b;
*x[i] = 1;

here the semantic address dependency from loading b to loading x[i] and 
the semantic address dependency from loading x[i] and storing to *x[i] 
do not together form a semantic dependency anymore, because *x[i] is 
always a. So this whole code can just become a=1, and with mirrored code 
you can get a=b=1, which is an sdep | rfe cycle.

So compilers can absolutely generate an observed OOTA for your 
definition of OOTA!

As I explained in the original e-mail, you should instead rely on 
semantic dependency to cover cases of sdep ; sdep where there is in fact 
still a dependency, and define OOTA as sdep;rfe.

- I did not like the phrasing that a dependency is a function of one 
execution, especially in contrast to source code. For a fixed execution, 
there are no dependencies because all values are fixed. It is the other 
executions - where you could have read another value - that create the 
dependencies.

Perhaps it is better to say that it is not a *local* function of source 
code, i.e., just because the same source code has a dependency in 
context C does not mean that it has a dependency in context C'.

In fact I would say a major gotcha of dependencies is that they are not 
a function of even the set of all permissible (according to the 
standard) executions.
That is because the compiler does not have to make every permissible 
execution possible, only at least one.

If the compiler knows that among all executions that it actually makes 
possible, some value is always 0 - even if there is a permissible 
execution in which it is not 0 - it can still replace that value with 0. 
E.g.

   T1 { x = 1; x = 0; }
   T2 { T[x] = 1; }

    ~~ merge -- makes executions where T[x] reads x==1 impossible ~>

   T1' { x = 1; x = 0; T[x] = 1; }

    ~~ replace ~>

   T1' { x = 1; x = 0; T[0] = 1; // no more dependency :( }

which defeats any semantic dependency definition that is a function of a 
single execution.

Of course you avoid this by making it really a function of the compiler 
+ program *and* the execution, and looking at all the other possible 
(not just permissible) executions.

- On the one hand, that definition makes a lot of sense. On the other 
hand, at least without the atomics=volatile restriction it would have 
the downside that a compiler which generates just a single execution for 
your program can say that there are no dependencies whatsoever and 
generate all kinds of "out of thin air" behaviors.
I am not sure if that gets really resolved by the volatile restrictions 
you put, but either way those seem far stronger than what one would want.

I would say that the approach with volatile is overzealous because it 
tries to create a "local" order solution to the problem that only 
requires a "global" ordering solution. Since not every semantic 
dependency needs to provide order in C++ -- only the cycle of 
dependencies -- it is totally ok to add too many semantic dependency 
edges to a program, even those that are not going to be exactly 
maintained by every compiler, as long as we can ensure that globally, no 
dependency cycle occurs.

So for example, if we merge  x = y || y = x,  the merge can turn it into 
x=y=x or y=x=y (and then into an empty program), but not into a cyclic 
dependency. So even though one side of the dependency may be violated, 
for sake of OOTA, we could still label both sides as dependent.

For LKMM the problem is of course much easier because you have volatiles 
and compiler barriers. Again you could maybe add incorrect semantic 
dependencies between accesses, as long as only the really preserved ones 
will imply ordering.

So I'm not convinced that for either of the two cases you need to do a 
compiler-specific definition of dependencies.

BTW, for what it's worth, Dat3M in a sense uses the clang dependencies - 
it first allows the compiler to do its optimizations, and then verifies 
the llvm-ir (with a more hardware-like dependency definition).

I think something like that can be a good practical solution with fewer 
problems than other attempts to approximate the solution.


>> So the new problem we deal with is to somehow restrict the rule to loads and
>> dependent stores that the compiler for whatever reason will not fully
>> eliminate.
>>
>> This problem too can not be solved completely inside cat. We can give an
>> approximation, as discussed with Alan (stating that a store would not be
>> elided if it is read by another thread, and a read would not be elided if it
>> reads from another thread and a store that won't be elided depends on it).
>>
>> This approximation is also limited, e.g., if the addresses of the plain
>> loads and stores have not yet escaped the function, but at least this
>> scenario is currently impossible in herd7 (unlike the fake dependency
>> scenario).
>>
>> In my mind it would again be better to offload the correct selection of
>> "compiler-un(re)movable plain loads and stores" to the tools. That may again
>> not solve the problem fully, but it at least would mean that any changes to
>> address the imprecision wouldn't need to go through the kernel tree, and
>> IMHO it is easier to say LKMM in the cat files is the model, and the
>> interpretation of the model has some limitations.
> 
> Which we currently do via marked accesses.  ;-)

Hey, programmers are not tools : )


>>> We should decide which of these examples should be
>>> added to the github litmus archive, perhaps to illustrate the fact that
>>> plain C-language loads do not head dependency chains.  Thoughts?
>>
>> I'm not sure that is a good idea, given that running the herd7 tool on the
>> litmus test will clearly show a dependency chain headed by plain loads in
>> the visual graphs (with `doshow rwdep`).
>>
>> Maybe it makes more sense to say in the docs that they may head syntactic or
>> semantic dependency chains, but because of the common case that the compiler
>> may cruelly optimize things, LKMM does not guarantee ordering based on the
>> dependency chains headed by plain loads. That would be consistent with the
>> tooling.
> 
> Well, LKMM and herd7 have different notions of what constitutes a
> dependency, and the LKMM notion is most relevant here.  (And herd7
> needs its broader definition so as to handle a wide variety of
> memory models.)

I would say that herd7's definition handles a wide variety of hardware 
memory models, but it has limitations for language level models. Perhaps 
it would be good for herd7 to support multiple dependency models as well.


Have fun,
   jonas

