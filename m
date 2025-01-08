Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56A819B586
	for <lkmm@lists.linux.dev>; Wed,  8 Jan 2025 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357619; cv=none; b=m/V9WSXfwbWuGJ4iyTnd52GI+frvJCPiuHHY87LyLp3vvB+BF7YXLSMqfyowLMWYYfbUJ7ZMznigdgKJniuxcL69j0aGCwZm2yX7DPoCbdKipY5QXMUT/xbPWH+Y+z20TL+z0FPz0D6wj/I99UtT88GeY6QQKE8ppmoIWL8aEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357619; c=relaxed/simple;
	bh=sO6OdLS87vqcbK3TYkXtVy1XL1XuOHo0B892fVZFvaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctbmNck5tiNfq2Koz/gkqqQRqghgcFaJQMm78xwW4hAvApPaeX34LYP/bRtQiTW07SonY491/EaUlliST5ScIL3OfeuxbNFw665Dzloara27fRGTvhJ7rQ1emk4L5TfhEQXD/ivdJneKb3WiQX2wpsC8OvJdMIH0PB3WIJ06xrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=none smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YSvb748sTz9v7Vd
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 01:11:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id A65271402C3
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 01:33:22 +0800 (CST)
Received: from [10.45.149.161] (unknown [10.45.149.161])
	by APP1 (Coremail) with SMTP id LxC2BwCHC0rVtn5nFNBEAA--.32587S2;
	Wed, 08 Jan 2025 18:33:22 +0100 (CET)
Message-ID: <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
Date: Wed, 8 Jan 2025 18:33:05 +0100
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
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCHC0rVtn5nFNBEAA--.32587S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XryrKr17AFy5Gr4Uur1kuFg_yoW3Gw1xpF
	WrKF4UKF4DJFsakr4kZa1xXa4F9a95tF15Jr9YvrW8uws0qrn0y3W3try5ZFyUCrnYva4j
	qr4Utr97C3Z8Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/7/2025 um 5:09 PM schrieb Alan Stern:
> On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:
>> The current LKMM allows out-of-thin-air (OOTA), as evidenced in the following
>> example shared on this list a few years ago:
>>
>>    P0(int *a, int *b, int *x, int *y) {
>>    	int r1;
>>
>>    	r1 = READ_ONCE(*x);
>>    	smp_rmb();
>>    	if (r1 == 1) {
>>    		*a = *b;
>>    	}
>>    	smp_wmb();
>>    	WRITE_ONCE(*y, 1);
>>    }
>>
>>    P1(int *a, int *b, int *x, int *y) {
>>    	int r1;
>>
>>    	r1 = READ_ONCE(*y);
>>    	smp_rmb();
>>    	if (r1 == 1) {
>>    		*b = *a;
>>    	}
>>    	smp_wmb();
>>    	WRITE_ONCE(*x, 1);
>>    }
>>
>>    exists b=42
>>
>> The root cause is an interplay between plain accesses and rw-fences, i.e.,
>> smp_rmb() and smp_wmb(): while smp_rmb() and smp_wmb() provide sufficient
>> ordering for plain accesses to rule out data races, they do not in the current
>> formalization generally actually order the plain accesses, allowing, e.g., the
>> load and stores to *b to proceed in any order even if P1 reads from P0; and in
>> particular, the marked accesses around those plain accesses are also not
>> ordered, which causes this OOTA.
> 
> That's right.  The memory model deliberately tries to avoid placing
> restrictions on plain accesses, whenever it can.
> 
> In the example above, for instance, I think it's more interesting to ask
> 
> 	exists 0:r1=1 /\ 1:r1=1
> 
> than to concentrate on a and b.

Yes, and of course there's a relationship between the two anomalies.
My proposed patch solves OOTA indirectly, by forbidding the marked 
accesses to *x and *y from being reordered in case r1 == 1, and thereby, 
forbidding exactly the outcome where both have r1 == 1.


> OOTA is a very difficult subject.

No doubt.

> It can be approached only by making
> the memory model take all sorts of compiler optimizations into account,
> and doing this for all possible optimizations is not feasible.

I think there's two parts of this, one is the correct definition of 
semantic (or compiler-preserved) dependencies. This is a really hard 
problem that can indeed only be solved by looking at all ways the 
compiler can optimize things. I'm not trying to solve that (and can't 
address that issue in a cat file anyways).

The second part is to see which accesses could participate in an OOTA.
I think this is a lot simpler.

> (For example, in a presentation to the C++ working group last year, Paul
> and I didn't try to show how to extend the C++ memory model to exclude
> OOTA [other than by fiat, as it does now].  Instead we argued that with
> the existing memory model, no reasonable compiler would ever produce an
> executable that could exhibit OOTA and so the memory model didn't need
> to be changed.)


I think a model like C++ should exclude it exactly by fiat, by 
formalizing OOTA-freedom as an axiom, like

   acyclic ( (data|ctrl|addr) ; rfe )

This axiom is to some extent unsatisfying because it does not explain 
*how* the OOTA is avoided, and in particular, it does not forbid any 
specific kind of behavior that would lead to OOTA, just the complete 
combination of them.
So for example, the following would be allowed:
P0:
   r0 = y.load_explicit(memory_order_relaxed);
   x.store_explicit(r0,memory_order_relaxed);

P1:
   r1 = x; // reads 1
   atomic_thread_fence();
   y = 1;

which could by some people be interpreted as the accesses of P0 being 
executed out of order (although there is no such concept in C++), 
indicating that if P0's accesses are allowed to be executed out of 
order, then so should P2's:

P2:
   r2 = x.load_explicit(memory_order_relaxed);
   y.store_explicit(r2,memory_order_relaxed);

Of course if both P0 and P2 are "executing out of order" at the same 
time, one would have OOTA, but this "global behavior" would be forbidden 
by the axiom.

But that is already how C++ works: a release access in C++ does not have 
any ordering by itself either. It is just the combination of release + 
acquire on other threads that somehow establishes synchronization.

LKMM works differently though, by providing "local" ordering rules, 
through ppo. We can argue about a ppo locally even without knowing the 
code of any other threads, let alone whether their accesses have acquire 
or release semantics. So we can address OOTA in a "local" manner as well.

And it has the advantage of having compiler barriers around a lot of 
things, which makes reasoning a lot more feasible.



>> In this patch, we choose the rather conservative approach of forcing only the
>> order of these marked accesses, specifically, when a marked read r is
>> separated from a plain read r' by an smp_rmb() (or r' has an address
>> dependency on r or is r'), on which a write w' depends, and w' is either plain
>> and seperated by a subsequent write w by an smp_wmb() (or w' is w), then r
>> precedes w in ppo.
> 
> Is this really valid?  In the example above, if there were no other
> references to a or b in the rest of the program, the compiler could
> eliminate them entirely.

In the example above, this is not possible, because the address of a/b 
have escaped the function and are not deallocated before synchronization 
happens.
Therefore the compiler must assume that a/b are accessed inside the 
compiler barrier.


>  (Whether the result could count as OOTA is
> open to question, but that's not the point.)  Is it not possible that a
> compiler might find other ways to defeat your intentions?

The main point (which I already mentioned in the previous e-mail) is if 
the object is deallocated without synchronization (or never escapes the 
function in the first place).

And indeed, any such case renders the added rule unsound. It is in a 
sense unrelated to OOTA; cases where the load/store can be elided are 
never OOTA.

Of course that is outside the current scope of what herd7 needs to deal 
with or can express, because deallocation isn't a thing in herd7.

Nevertheless, trying to specify inside cat when an access is "live" -- 
relevant enough that the compiler will keep it around -- is hard and 
tedious (it's the main source of complication in the patch).

A much better way would be to add a base set of "live loads and stores" 
Live, which are the loads and stores that the compiler must consider to 
be live. Just like addr, ctrl, etc., we don't have to specify these in 
cat, and rather rely on herd7 to correctly .


If an access interacts with an access of another thread (by reading from 
it or being read from it), it must be live.

Then we could formulate the rule as

+let to-w = (overwrite & int) | (addr | rmb ; [Live])? ; rwdep ; ([Live] 
; wmb)?

(the latter case being a generalization of the current `addr ; [Plain] ; 
wmb` and `rwdep` cases of to-w, assuming we restrict it Life accesses - 
it is otherwise also unsound:

  int a[2] = {0};
  int r1 = READ_ONCE(*x);
  a[r1] = 0; // compiler will just remove this
  smp_wmb();
  WRITE_ONCE(*y, 1);

)

The formulation in the patch is just based on a complicated and close 
but imperfect approximation of Live.

> In any case, my feeling is that memory models for higher languages
> (i.e., anything above the assembler level) should not try very hard to
> address the question of OOTA.  And for LKMM, OOTA involving _plain_
> accesses is doubly out of bounds.
> 
> Your proposed change seems to add a significant complication to the
> memory model for a not-very-clear benefit.

Even if we ignore OOTA for the moment, it is not inconceivable to have 
some cases use a combination of plain accesses with 
dependencies/rmb/wmb, such as in an RCU case.

That's probably the reason for the current addr ; [Plain] ; wmb exists.
It's not clear that it covers all cases though.

Best wishes,
   jonas

