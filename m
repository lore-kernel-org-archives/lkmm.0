Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398A22FDEC
	for <lkmm@lists.linux.dev>; Thu, 16 Jan 2025 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054838; cv=none; b=qG8SVR1NC4lFexx52XBxv+fc0d/Io/L0Ugjp9RkYz2lbhVY+S1DNjGrB+AeImyzGXCbPpA75Y8JAZJFjeUbFdhDRcb+54uJIuDfaVOQ37xdTetDcVLH3LuMEat+rGPOYum4M6hsXLKJYBWi+VVmVPT2dQ9OlCE1x5yqZmi6A+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054838; c=relaxed/simple;
	bh=+VFrXNrengUoQB93Qow+9+n35akx75eZ6mjDcxkRK3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5sv3uC8AmX6fe3OGoZhc1Wr5dNRlUToyaKtiJEMe3ccZ/bsziuACWm787V8QhWnVI7qJXywe24BptkBGSey6Vb5nwdKjAzYMcfgIm+xXVscjHC/Qf8RtKiECrfO9bJVO9RBU5WFe6v/26ylJfocA7GGfy5sOrMEPUvq1Q8lbn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YYsR365sKz9v7NL
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 02:51:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id B94B714039E
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 03:13:42 +0800 (CST)
Received: from [10.45.144.192] (unknown [10.45.144.192])
	by APP1 (Coremail) with SMTP id LxC2BwC3O0paWoln5AzBAA--.18725S2;
	Thu, 16 Jan 2025 20:13:42 +0100 (CET)
Message-ID: <cbde6574-cf5d-4160-a0fe-46fcafa69eac@huaweicloud.com>
Date: Thu, 16 Jan 2025 20:13:28 +0100
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
References: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <3b3a7c1a-c40f-4a98-b328-bb4327876606@paulmck-laptop>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <3b3a7c1a-c40f-4a98-b328-bb4327876606@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwC3O0paWoln5AzBAA--.18725S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr17JFWrXrykCr45Aw4kXrb_yoWrGF1xpr
	W5KFWUKr4qyr43Aws7tw4UJFy0yw1xtFy3Xr95Wr1UAas09F1YkFyUXFW5CFyUurnava1j
	qrW5t3srA3s8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxo
	7KDUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/16/2025 um 7:40 PM schrieb Paul E. McKenney:
> On Mon, Jan 13, 2025 at 02:04:58PM -0800, Paul E. McKenney wrote:
>> On Fri, Jan 10, 2025 at 05:21:59PM +0100, Jonas Oberhauser wrote:
>>> Am 1/10/2025 um 3:54 PM schrieb Paul E. McKenney:
>>>> On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
>>>>> Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
>>>>>> On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
> 
> [ . . . ]
> 
>>>>> I currently can not come up with an example where there would be a
>>>>> (semantic) control dependency from a load to a store that is not in the arm
>>>>> of an if statement (or a loop / switch of some form with the branch
>>>>> depending on the load).
>>>>>
>>>>> I think the control dependency is just a red herring. It is only there to
>>>>> avoid the data race.
>>>>
>>>> Well, that red herring needs to have a companion fish to swim with in
>>>> order to enforce ordering, and I am not seeing that companion.
>>>>
>>>> Or am I (yet again!) missing something subtle here?
>>>
>>> It makes more sense to think about how people do message passing (or
>>> seqlock), which might look something like this:
>>>
>>>    [READ_ONCE]
>>>    rmb
>>>    [plain read]
>>>
>>> and
>>>
>>>    [plain write]
>>>    wmb
>>>    [WRITE_ONCE]
>>>
>>>
>>> Clearly LKMM says that there is some sort of order (not quite happens-before
>>> order though) between the READ_ONCE and the plain read, and between the
>>> plain write and the WRITE_ONCE. This order is clearly defined in the data
>>> race definition, in r-pre-bounded and w-post-bounded.
>>>
>>> Now consider
>>>
>>>    [READ_ONCE]
>>>    rmb
>>>    [plain read]
>>>    // some code that creates order between the plain accesses
>>>    [plain write]
>>>    wmb
>>>    [WRITE_ONCE]
>>>
>>> where for some specific reason we can discern that the compiler can not
>>> fully eliminate/move across the barrier either this specific plain read, nor
>>> the plain write, nor the ordering between the two.
>>>
>>> In this case, is there order between the READ_ONCE and the WRITE_ONCE, or
>>> not? Of course, we know current LKMM says no. I would say that in those very
>>> specific cases, we do have ordering.
>>
>> Agreed, for LKMM to deal with seqlock, the read-side critical section
>> would need to use READ_ONCE(), which is a bit unnatural.  The C++
>> standards committee has been discussing this for some time, as that
>> memory model also gives data race in that case.
>>
>> But it might be better to directly model seqlock than to try to make
>> LKMM deal with the underlying atomic operations.
> 
> Maybe I should give an example approach, perhaps inspiring a better
> approach.
> 
> o	Model reader-writer locks in LKMM, including a relaxed
> 	write-lock-held primitive.
> 
> o	Model sequence locks in terms of reader-writer locks:
> 
> 	o	The seqlock writer maps to write lock.
> 
> 	o	The seqlock reader maps to read lock, but with a
> 		write-lock-held check.	If the write lock is held at
> 		that point, the seqlock tells the caller to retry.
> 
> 		Please note that the point is simply to exercise
> 		the failure path.
> 
> 	o	If a value is read in the seqlock reader and used
> 		across a "you need to retry" indication, that
> 		flags a seqlock data race.
> 
> But is there a better way?
> 

You need to be careful with those hb edges. The reader critical section 
does not have to happen-before the writer critical section, as would 
with an actual read-write lock.

I think the solution would have to be along changing the definition of 
r-post-bounded.
The read_enter() function reads from a write_exit() and establishes hb.
The read_exit() function also reads from a write_exit(), if the same as 
the matching read_enter(), then it returns success, otherwise failure.

Reads po-before a successful read_exit() are bounded with regards to 
subsequent write_enter() on the same lock.

Best wishes,
   jonas




