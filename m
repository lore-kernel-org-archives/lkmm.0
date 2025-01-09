Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA231925B3
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447754; cv=none; b=WQqM4RYktaT3uLmmhltwE/jTvYVzG8V+kFwhrq1xxyVzzRU8F7T5+BEZpPUNYeSzJwHoJg/8O3c0W1JS0xoeC80oerHv4Vrbe65lc5psbUMTxyzzSHcw+/bUPE2u5kaLTdkkCsJGPtoLHZtTMydOz385OIN+ghovPapiBbriKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447754; c=relaxed/simple;
	bh=kDrXR8bMtigr1OwuIFC+IPC4WmJjvHjHR4wMqODvh9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kk+bpRhdtX59w3vnIVv6Vfb27oyHwyGSeVYp+8vbGpdcd9jP+bXuC1uewBleQIcEYDFN98Hu2E8lAvJqeMepYAFv4R0rG/zuiJmdwXxlrf/iv8lwnxBMmdIPsYkdJfpzuI7ll+6G+jlWnDsB4AogIvVwFTni7Crbm6SD3M6QuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YTXwT4Bp0z9v7Vj
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 02:13:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id F2B56140360
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 02:35:37 +0800 (CST)
Received: from [10.81.208.239] (unknown [10.81.208.239])
	by APP1 (Coremail) with SMTP id LxC2BwCHC0rqFoBnvPVUAA--.40113S2;
	Thu, 09 Jan 2025 19:35:37 +0100 (CET)
Message-ID: <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
Date: Thu, 9 Jan 2025 19:35:19 +0100
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
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCHC0rqFoBnvPVUAA--.40113S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1Duw45tF15Cr43CFW5GFg_yoW7tr43pr
	yfKFnrGFn8Jr4fAr42yw4UAr90q3Z2yrn8X3Zxury8A3Z09r1ftr17trWFgFyDArWxZr1j
	v3y5K3sxCw1DAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
> On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
>>> On Wed, Jan 08, 2025 at 06:39:12PM +0100, Jonas Oberhauser wrote:
>>>>
>>>>
>>>> Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
>>>>> On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
>>>>>
>>>> The patch removes the (actually non-existant) race condition by saying that
>>>> a critical section that is protected from having a data race with address
>>>> dependency or rmb/wmb (which LKMM already says works for avoiding data
>>>> races), is in fact also ordered and therefore has no race condition either.
>>>>
>>>> As a side effect :), this happens to fix OOTA in general in LKMM.
>>>
>>> Fair point, no data race is flagged.
>>>
>>> On the other hand, Documentation/memory-barriers.txt says the following:
>>>
>>> ------------------------------------------------------------------------
>>>
>>> However, stores are not speculated.  This means that ordering -is- provided
>>> for load-store control dependencies, as in the following example:
>>>
>>> 	q = READ_ONCE(a);
>>> 	if (q) {
>>> 		WRITE_ONCE(b, 1);
>>> 	}
>>>
>>> Control dependencies pair normally with other types of barriers.
>>> That said, please note that neither READ_ONCE() nor WRITE_ONCE()
>>> are optional! Without the READ_ONCE(), the compiler might combine the
>>> load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
>>> the compiler might combine the store to 'b' with other stores to 'b'.
>>> Either can result in highly counterintuitive effects on ordering.
>>>
>>> ------------------------------------------------------------------------
>>>
>>> If I change the two plain assignments to use WRITE_ONCE() as required
>>> by memory-barriers.txt, OOTA is avoided:
>>
>>
>> I think this direction of inquiry is a bit misleading. There need not be any
>> speculative store at all:
>>
>>
>>
>> P0(int *a, int *b, int *x, int *y) {
>> 	int r1;
>> 	int r2 = 0;
>> 	r1 = READ_ONCE(*x);
>> 	smp_rmb();
>> 	if (r1 == 1) {
>> 		r2 = *b;
>> 	}
>> 	WRITE_ONCE(*a, r2);
>> 	smp_wmb();
>> 	WRITE_ONCE(*y, 1);
>> }
>>
>> P1(int *a, int *b, int *x, int *y) {
>> 	int r1;
>>
>> 	int r2 = 0;
>>
>> 	r1 = READ_ONCE(*y);
>> 	smp_rmb();
>> 	if (r1 == 1) {
>> 		r2 = *a;
>> 	}
>> 	WRITE_ONCE(*b, r2);
>> 	smp_wmb();
>> 	WRITE_ONCE(*x, 1);
>> }
>>
>>
>> The reason that the WRITE_ONCE helps in the speculative store case is that
>> both its ctrl dependency and the wmb provide ordering, which together
>> creates ordering between *x and *y.
> 
> Ah, and that is because LKMM does not enforce control dependencies past
> the end of the "if" statement.  Cute!
> 
> But memory-barriers.txt requires that the WRITE_ONCE() be within the
> "if" statement for control dependencies to exist, so LKMM is in agreement
> with memory-barriers.txt in this case.  So again, if we change this,
> we need to also change memory-barriers.txt.
 > [...]
 > If we want to respect something containing a control dependency to a
 > WRITE_ONCE() not in the body of the "if" statement, we need to make some
 > change to memory-barriers.txt.

I'm not sure what you denotate by *this* in "if we change this", but 
just to clarify, I am not thinking of claiming that there were a 
(semantic) control dependency to WRITE_ONCE(*b, r2) in this example.

There is however a data dependency from r2 = *a to WRITE_ONCE, and I 
would say that there is a semantic data (not control) dependency from r1 
= READ_ONCE(*y) to WRITE_ONCE(*b, r2), too: depending on the value read 
from *y, the value stored to *b will be different. The latter would be 
enough to avoid OOTA according to the mainline LKMM, but currently this 
semantic dependency is not detected by herd7.


I currently can not come up with an example where there would be a 
(semantic) control dependency from a load to a store that is not in the 
arm of an if statement (or a loop / switch of some form with the branch 
depending on the load).


I think the control dependency is just a red herring. It is only there 
to avoid the data race.

In a hypothetical LKMM where reading in a race is not a data race unless 
the data is used (*1), this would also work:


  	unsigned int r1;
  	unsigned int r2 = 0;
  	r1 = READ_ONCE(*x);
  	smp_rmb();
  	r2 = *b;
  	WRITE_ONCE(*a, (~r1 + 1) & r2);
  	smp_wmb();
  	WRITE_ONCE(*y, 1);


Here in case r1 == 0, the value of r2 is not used, so there is a race 
but there would not be data race in the hypothetical LKMM.

This example would also have OOTA under such a hypothetical LKMM, but 
not with my patch, because in the case where r1 == 1,
  READ_ONCE(*x) is seperated by rmb from the load from *b,
    upon which the store to *a depends,
    which itself is seperated by a wmb from the store to WRITE_ONCE(*y,1)
and this would ensure that READ_ONCE(*x) and WRITE_ONCE(*y,1) can not be 
reordered with each other anymore.


(*1= such a definition is not absurd! One needs to allow such races to 
make sequence locks and other similar datastructures well-defined.)


I currently don't know another way than the if-statement to avoid the 
data race in the program(*2) in the current LKMM, so that's why I rely 
on it, but at least conceptually it is orthogonal to the problem.

(*2=we can avoid the data race flag in herd by using filter, and only 
generating the graphs where r1==1 and there is no data race. But that is 
cheating -- the program is not valid under mainline LKMM.)

>> Please do look at the OO
TA graph generated by herd7 for this one, it looks
>> quite amazing.
> 
> Given the way this morning is going, I must take your word for it...

That sounds awful :(
Technical issues?
With any luck, you can test it on arm's herd7 web interface at 
https://developer.arm.com/herd7 (just don't be like me and type all the 
code first and then change the drop-down selector to Linux - that will 
reset the code window...)

Best wishes,
   jonas

