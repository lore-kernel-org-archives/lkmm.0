Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619F190468
	for <lkmm@lists.linux.dev>; Wed,  8 Jan 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736364152; cv=none; b=jPc4N3n/8ENGh2GFD+OgPtBjr0RrHxdzRtoZlERDXBTP589hAF1VZwfyCPh4MfhW3OjdXKhQ3dezKYiGUvmtf3RMBy5qrrXTc5ruyDWnurh7y/mIwvlgcTSpwEQ/N4r3HR1PBJCgy3kAtf+OUMkyTk9jMojvCmMI2UI5ximCWVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736364152; c=relaxed/simple;
	bh=Ry0HRw8lEeaO9yuqpHZrdFWI1+srkfZIj/REyjw/i0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=De17AjFtHvzYXQgH0iyI/HGciIgXfuDhYHxDX3KqVrXzSFzMOt4TmmFL2///gDFWtbfL77+PGqrsv+WlTL0wQ/eUAaBSkd2KM08r5h5d+Ula/WdN34v9b+suGTzpnvuff6gt9VBF1c8CdGR4JGJXKs07q5CoOQvGGqBhhYlWPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YSxs85yXWz9v7JP
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 02:53:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 629A9140410
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 03:22:22 +0800 (CST)
Received: from [10.45.149.161] (unknown [10.45.149.161])
	by APP2 (Coremail) with SMTP id GxC2BwA37d9h0H5nEZdFAA--.31596S2;
	Wed, 08 Jan 2025 20:22:21 +0100 (CET)
Message-ID: <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
Date: Wed, 8 Jan 2025 20:22:07 +0100
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
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwA37d9h0H5nEZdFAA--.31596S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryrGw1DZF4DKFy8ZrWrXwb_yoWrGFW5pF
	WxKFWUKFs8J3y0kr17ZrW7ZFWa9wsYyF15G34rKry8Zw4YgryftFyxtay5ua43Crnaya4j
	vr4jqry3JFyDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/8/2025 um 7:47 PM schrieb Alan Stern:
> On Wed, Jan 08, 2025 at 06:33:05PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/7/2025 um 5:09 PM schrieb Alan Stern:
>>> Is this really valid?  In the example above, if there were no other
>>> references to a or b in the rest of the program, the compiler could
>>> eliminate them entirely.
>>
>> In the example above, this is not possible, because the address of a/b have
>> escaped the function and are not deallocated before synchronization happens.
>> Therefore the compiler must assume that a/b are accessed inside the compiler
>> barrier.
> 
> I'm not quite sure what you mean by that, but if the compiler has access
> to the entire program and can do a global analysis then it can recognize
> cases where accesses that may seem to be live aren't really.

Even for trivial enough cases where the compiler has access to all the 
source, compiler barriers should be opaque to the compiler.

Since it is opaque,

   *a = 1;
   compiler_barrier();

might as well be

   *a = 1;
   *d = *a; // *d is in device memory

and so in my opinion the compiler needs to ensure that the value of *a 
right before the compiler barrier is 1.

Of course, only if the address of *a could be possibly legally known to 
the opaque code in the compiler barrier.


> 
> However, I admit this objection doesn't really apply to Linux kernel
> programming.
> 
>>>   (Whether the result could count as OOTA is
>>> open to question, but that's not the point.)  Is it not possible that a
>>> compiler might find other ways to defeat your intentions?
>>
>> The main point (which I already mentioned in the previous e-mail) is if the
>> object is deallocated without synchronization (or never escapes the function
>> in the first place).
>>
>> And indeed, any such case renders the added rule unsound. It is in a sense
>> unrelated to OOTA; cases where the load/store can be elided are never OOTA.
> 
> That is a matter of definition.  In our paper, Paul and I described
> instances of OOTA in which all the accesses have been optimized away as
> "trivial".

Yes, by OOTA I mean a rwdep;rfe cycle.

In the absence of data races, such a cycle can't be optimized away 
because it is created with volatile/compiler-barrier-protected accesses.


>> If an access interacts with an access of another thread (by reading from it
>> or being read from it), it must be live.
> 
> This is the sort of approximation I'm a little uncomfortable with.  It
> would be better to say that a store which is read from by a live load
> must be live.  I don't see why a load which reads from a live store has
> to be live.

You are right, and I was careless.
All we need is that a store that is read externally by a live load is 
live, and that a load that reads from an external store and has its 
value semantically depended-on by a live store is live.


>> The formulation in the patch is just based on a complicated and close but
>> imperfect approximation of Live.
> 
> Maybe you can reformulate the patch to make this more explicit.


It would look something like this:

Live = R & rng(po \ po ; [W] ; (po-loc \ w_barrier)) | W & dom(po \ 
((po-loc \ w_barrier) ; [W] ; po))

let to-w = (overwrite & int) | (addr | rmb ; [Live])? ; rwdep ; ([Live] 
; wmb)?


> In any case, it seems that any approximation we can make to Live will be
> subject to various sorts of errors.

Probably (this is certainly true for trying to approximate dependencies, 
for example), but what I know for certain is that the approximations of 
Live inside cat get more ugly the more precise they become. In the above 
definition of Live I have not included that the address must escape, nor 
that it must not be freed.

A non-local definition that suffices for OOTA would be so:

Live = R & rng(rfe) & dom(rwdep ; rfe) | W & dom(rfe)


It seems the ideal solution is to let Live be defined by the tools, 
which should keep up with or exceed the analysis done by state-of-art 
compilers.

Best wishes,
    jonas

