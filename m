Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0291FE472
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115737; cv=none; b=CXwEW4qdak/O4LnLLwF8t3182ye2Ze78NZr399kwtahG6AtAr0EnhextexBTYVm7E17u47fU+WBRsUoNl3hpXXORAMc1mMAq6LF5h3VAPiK8iuCJC/UEFVLIIiaeB6ZicXcbuGZPWN3VJhlEjdY9EqDIYWYxGUVMw8gF0czLafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115737; c=relaxed/simple;
	bh=2+bCuZKwX/q2Bbf7ckEzqlT5XsCI7CqsuFbzazvjpD0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MoUgq45/t8bgn+fFPuL0zZQ7iiPxDm/GJHu7kGmnYcWBBy8Jo8vt7ua7yTPhnYBAtpCPx68rkLFjDAxnfH5vKCoCILu8sCAekvMY9It9I1pC23ECG1d14/MCK89AXPywjOPqNVoRrBondrQ4fZgvjN5pVAekgrEF/WbOmWvKv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YZHy83FH1z9v7Vd
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 19:46:40 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 80D031402DB
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 20:08:42 +0800 (CST)
Received: from [10.81.204.96] (unknown [10.81.204.96])
	by APP2 (Coremail) with SMTP id GxC2BwCH7+E8SIpnNtvKAA--.36516S2;
	Fri, 17 Jan 2025 13:08:41 +0100 (CET)
Message-ID: <31472b1b-e466-469f-be29-05bba2a3ef52@huaweicloud.com>
Date: Fri, 17 Jan 2025 13:08:25 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: paulmck@kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk,
 luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com,
 joel@joelfernandes.org, urezki@gmail.com, quic_neeraju@quicinc.com,
 frederic@kernel.org, linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com
References: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <3b3a7c1a-c40f-4a98-b328-bb4327876606@paulmck-laptop>
 <446d6a64-7ee4-494a-bbfe-dbfdb6959f9c@huaweicloud.com>
 <4411cf20-f889-4fd7-9e03-14744deaaf72@paulmck-laptop>
In-Reply-To: <4411cf20-f889-4fd7-9e03-14744deaaf72@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwCH7+E8SIpnNtvKAA--.36516S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4rGryDWFWDCr17CFWrAFb_yoW5tw17pF
	WfKan5KrnrJw4Skwn2qr1xXFy0vr1fJFW5Xrn8GryUAw15uFyYvFWSgF1Y9Fyjkrs293WU
	trs0qrykAryqvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/16/2025 um 8:39 PM schrieb Paul E. McKenney:
> On Thu, Jan 16, 2025 at 08:28:06PM +0100, Jonas Oberhauser wrote:
>>
>>
>> Am 1/16/2025 um 7:40 PM schrieb Paul E. McKenney:
>>> 	o	If a value is read in the seqlock reader and used
>>> 		across a "you need to retry" indication, that
>>> 		flags a seqlock data race.
>>
>>
>> This too is insufficient, you also need to prevent dereferencing or having
>> control dependency inside the seqlock. Otherwise you could derefence a torn
>> pointer and...
> 
> True, but isn't that prohibition separable from the underlying
> implementation?

Yes, but so is the prohibition of using the value after the failed 
reader_exit().

So probably it needs to be added to the specification of what you are 
allowed to do with values from the read-side critical section.

Actually this was a bug we had in some code once, and I overlooked it 
because I thought the incorrect data isn't used anyways, right?

Luckily I had put the condition into our cat model already and so the 
tooling caught the bug before it went out...


>> At this point your definition of data race becomes pretty much the same as
>> we have.
>>
>> https://github.com/open-s4c/libvsync/blob/main/vmm/vmm.cat#L150
>>
>>
>> (also this rule should only concern reads that are actually "data-racy" - if
>> the read is synchronized by some other writes, then you can read & use it
>> just fine across the seqlock [edit: boundary])
> 
> Perhaps LKMM should adopt this or something similar, but what do others
> think?

I am not sure how many others are still reading this deep into the 
conversation, maybe best to start a new thread.


>> I also noticed that in my previous e-mail I had overlooked the reads inside
>> the CS in the failure case, but you are of course right, there needs to be
>> some mechanism to prevent them from being data racy unless abused.
>>
>> But I am not sure how to formalize that in a way that is simpler than just
>> re-defining data races in general, without adding some special support to
>> herd7 for it.
>>
>> What do you think?
> 
> I was thinking in terms of identifying reads in critical sections (sort
> of like LKMM does for RCU read-side critical sections), then identifying
> any dependencies from those reads that cross a failed reader boundary.
> If that set is non-empty, flag it.

Yes, the general idea sounds reasonable, but the details have a lot of 
potential for future improvement.

One tricky part of seqlock besides the data race is that it kind of uses 
negative message passing - the fact that you have not seen the message 
means you also have not seen the flag. (And the message in this case is 
the write_enter(), and the flag is the plain access in the critical 
section! Fun.)

This makes it hard to formalize in the box of LKMM and make it play well 
with all the other pieces.


Maybe something like avoiding rw data races also under something like prop?

r-prop-post-bounded ; ((overwrite & ext) ; cumul-fence*) ; 
w-prop-pre-bounded

for the cases where the pre-bounded write must propagate after the 
overwriting store, and the post-bounded read executes before and on the 
same CPU as the overwritten event.

Then you could argue that if the overwriting write has not propagated to 
the overwritten event, the pre-bounded write also has not propagated to 
that event.

 From that you can conclude it also can not have propagated to the 
post-bounded read.

I'm not sure if the cases where propagation is handled by a strong-fence 
are already covered by the rw-xbstar rule.

Have fun,
   jonas

