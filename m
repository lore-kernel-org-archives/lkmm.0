Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4251A2380
	for <lkmm@lists.linux.dev>; Wed,  8 Jan 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363902; cv=none; b=INMs0IgcjZol6w63tjLhx52C458Enw2Hw3Q+/6NoxDKCPygM7frsfxH1JCHSeeQ1oJscsJma1plWG+LrcKZ8J/Ge5nNZDwIw+dl2o/N3aESkh9W3HRQjkze01jj/tzsH7mAx9zMgBR+IMO8Lgg8FjQ1HzBSXmRyb1Kx9bG8KXc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363902; c=relaxed/simple;
	bh=Hq8wJ3uZ41A4oWS5c3moLiLjRK4gTwf+rQZ+QAjbCTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8uBdT63C8pHIvXMJaL/lE6APovMWxletdHZivH/KW/La9BmfCEwAbB9R6lWiW6+3zcjzRF0dIEhBcBkG+jyNbzigu61yUag/mzd0JdPi+v1SVa0L4xvVz+2KjEyVzu9IKrXSkYJxpOjcSnYItZiKir4Mb6Y+zcuFy1fV/nYTJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YSxmJ1btGz9v7JN
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 02:49:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id BF8A8140368
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 03:18:09 +0800 (CST)
Received: from [10.45.149.161] (unknown [10.45.149.161])
	by APP2 (Coremail) with SMTP id GxC2BwC3beBjz35nhotFAA--.31979S2;
	Wed, 08 Jan 2025 20:18:09 +0100 (CET)
Message-ID: <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
Date: Wed, 8 Jan 2025 20:17:51 +0100
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
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwC3beBjz35nhotFAA--.31979S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFyfCw1DArWfKrWfAr1xAFb_yoW7AF43pr
	WfKFnFkFs8Jrsayr1xAw4DZFW8uas7Ar15JFn2gry8AFs8ur1SyFW7trWSqFyDCrW8Aryj
	yrWUtr9xCrn8Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
> On Wed, Jan 08, 2025 at 06:39:12PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
>>> On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
>>>
>>>> (For example, in a presentation to the C++ working group last year, Paul
>>>> and I didn't try to show how to extend the C++ memory model to exclude
>>>> OOTA [other than by fiat, as it does now].  Instead we argued that with
>>>> the existing memory model, no reasonable compiler would ever produce an
>>>> executable that could exhibit OOTA and so the memory model didn't need
>>>> to be changed.)
>>>
>>> Furthermore, the LKMM design choice was that if a given litmus test was
>>> flagged as having a data race, anything might happen, including OOTA.
>>
>> Note that there is no data race in this litmus test.
>> There is a race condition on plain accesses according to LKMM,
>> but LKMM also says that this is *not* a data race.
>>
>> The patch removes the (actually non-existant) race condition by saying that
>> a critical section that is protected from having a data race with address
>> dependency or rmb/wmb (which LKMM already says works for avoiding data
>> races), is in fact also ordered and therefore has no race condition either.
>>
>> As a side effect :), this happens to fix OOTA in general in LKMM.
> 
> Fair point, no data race is flagged.
> 
> On the other hand, Documentation/memory-barriers.txt says the following:
> 
> ------------------------------------------------------------------------
> 
> However, stores are not speculated.  This means that ordering -is- provided
> for load-store control dependencies, as in the following example:
> 
> 	q = READ_ONCE(a);
> 	if (q) {
> 		WRITE_ONCE(b, 1);
> 	}
> 
> Control dependencies pair normally with other types of barriers.
> That said, please note that neither READ_ONCE() nor WRITE_ONCE()
> are optional! Without the READ_ONCE(), the compiler might combine the
> load from 'a' with other loads from 'a'.  Without the WRITE_ONCE(),
> the compiler might combine the store to 'b' with other stores to 'b'.
> Either can result in highly counterintuitive effects on ordering.
> 
> ------------------------------------------------------------------------
> 
> If I change the two plain assignments to use WRITE_ONCE() as required
> by memory-barriers.txt, OOTA is avoided:


I think this direction of inquiry is a bit misleading. There need not be 
any speculative store at all:



P0(int *a, int *b, int *x, int *y) {
	int r1;
	int r2 = 0;
	r1 = READ_ONCE(*x);
	smp_rmb();
	if (r1 == 1) {
		r2 = *b;
	}
	WRITE_ONCE(*a, r2);
	smp_wmb();
	WRITE_ONCE(*y, 1);
}

P1(int *a, int *b, int *x, int *y) {
	int r1;

	int r2 = 0;

	r1 = READ_ONCE(*y);
	smp_rmb();
	if (r1 == 1) {
		r2 = *a;
	}
	WRITE_ONCE(*b, r2);
	smp_wmb();
	WRITE_ONCE(*x, 1);
}


The reason that the WRITE_ONCE helps in the speculative store case is 
that both its ctrl dependency and the wmb provide ordering, which 
together creates ordering between *x and *y.

I should point out that a version of herd7 that respects semantic 
dependencies (instead of syntactic only) might solve this case, by 
figuring out that the WRITE_ONCE to *a resp. *b depends on the first 
READ_ONCE.

Here's another funny example:


P0(int *a, int *b, int *x, int *y) {
	int r1;

	r1 = READ_ONCE(*x);
	smp_rmb();
	int r2 = READ_ONCE(*b);
	if (r1 == 1) {
		r2 = *b;
	}
	WRITE_ONCE(*a, r2);
	smp_wmb();
	WRITE_ONCE(*y, 1);
}

P1(int *a, int *b, int *x, int *y) {
	int r1;

	r1 = READ_ONCE(*y);
	smp_rmb();
	int r2 = READ_ONCE(*a);
	if (r1 == 1) {
		r2 = *a;
	}
	WRITE_ONCE(*b, r2);
	smp_wmb();
	WRITE_ONCE(*x, 1);
}

exists (0:r1=1 /\ 1:r1=1)

Is there still a semantic dependency from the inner load to the store to 
*a resp. *b, especially since the outer load from *b resp. *a is reading 
from the same store as the inner one? The compiler is definitely allowed 
to eliminate the inner load, which *also removes the OOTA*.

Please do look at the OOTA graph generated by herd7 for this one, it 
looks quite amazing.


> If LKMM is to allow plain assignments in this case, we need to also update
> memory-barriers.txt.  

But I am not suggesting to allow the plain assignment *by itself*.
In particular, my patch does not enforce any happens-before order 
between the READ_ONCE(*x) and the plain assignment to *b.
It only provides order between READ_ONCE(*x) and WRITE_ONCE(*y,...), 
through dependencies in the plain critical section.

Which must be 1) properly guarded (e.g., by rmb/wmb) and 2) live.

Because of this, I don't know if the text needs much updating, although 
one could add a text in the direction that "in the rare case where 
compilers do guarantee that a load and dependent store (including plain) 
will be emitted in some form, one can use rmb and wmb to ensure the 
order of surrounding marked accesses".

 > I am reluctant to do this because the community> needs to trust plain 
C-language assignments less rather than more,
> especially given that compilers are continuing to become more aggressive.

Yes, I agree.

> Yes, in your example, the "if" and the two explicit barriers should
> prevent compilers from being too clever, but these sorts of things are
> more fragile than one might think given future code changes.
> 
> Thoughts?

We certainly need to be very careful about how to formalize what the 
compiler is allowed of doing and what it is not. And even more careful 
about how to communicate this.

Best wishes,
   jonas

