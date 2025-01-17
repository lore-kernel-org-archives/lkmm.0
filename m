Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAA335BA
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132379; cv=none; b=Z53/F2NXnT3emuXR8NShUGVpgUdFVGHQ0yx+Jck8qfii1l48n6iFsZBA3VK/L9DOZ56SqgNvoUTH8HQRgqNvSveOYw5Qv9eqiAzJC3oLJVVPew64pYSmMvr2iAtbwWFyQiljwLKgd3u8JzpXmR1n9heIcKt8bOrc2GLerlEhEAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132379; c=relaxed/simple;
	bh=+qDulpWtEkVvXXwDqgKOHb/u1CCIxBusRC19UoTU+sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9x/DV9f5im/JEoRZgEAhskmJ887jNKtuDkmAZjNpH1k3dUqgW2ojQ4aesleETpsSvrAxLWbGkfAKHWIsWNdO1hwAT9TUlHrnPhRrlndX2V2rClUW1tahLNIavE1omjdSw+K4ccSK7cl8CG6U+V5+9DfKem04J2Vf5eorH1MYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YZQ6D5R9Yz9v7Vd
	for <lkmm@lists.linux.dev>; Sat, 18 Jan 2025 00:24:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 0EDCF140138
	for <lkmm@lists.linux.dev>; Sat, 18 Jan 2025 00:46:07 +0800 (CST)
Received: from [10.206.134.186] (unknown [10.206.134.186])
	by APP1 (Coremail) with SMTP id LxC2BwB3+0lBiYpnE+bOAA--.24248S2;
	Fri, 17 Jan 2025 17:46:06 +0100 (CET)
Message-ID: <a1019624-7f82-4897-a1f2-3a381794b2ad@huaweicloud.com>
Date: Fri, 17 Jan 2025 17:45:50 +0100
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
References: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <b0bac412-cfc4-4334-8d8e-2fb080fe6e3e@rowland.harvard.edu>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <b0bac412-cfc4-4334-8d8e-2fb080fe6e3e@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwB3+0lBiYpnE+bOAA--.24248S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF15ZrW3ZF17Cry8tF4Utwb_yoW5tF4DpF
	ySg3WakF4Dur4kAFn5ZwsrX34Fqrs5ZryUGrnxW348Zw15uryIqr4xKF1Y9FWDAFs7Zr1a
	yrWjqr9xJw1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/17/2025 um 4:52 PM schrieb Alan Stern:
> On Thu, Jan 16, 2025 at 06:02:18PM -0500, Alan Stern wrote:
>> On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
>>> I would say that the approach with volatile is overzealous because it tries
>>> to create a "local" order solution to the problem that only requires a
>>> "global" ordering solution. Since not every semantic dependency needs to
>>> provide order in C++ -- only the cycle of dependencies -- it is totally ok
>>> to add too many semantic dependency edges to a program, even those that are
>>> not going to be exactly maintained by every compiler, as long as we can
>>> ensure that globally, no dependency cycle occurs.
>>
>> But then how would you characterize semantic dependencies, if you want
>> to allow the definition to include some dependencies that aren't
>> semantic but not so many that you ever create a cycle?  This sounds like
>> an even worse problem than we started with!
> 
> An interesting side comment on this issue...
> 
> This is a slight variation of the example on page 19 (section 4.3) of
> the paper.  (Pretend this is actually C++ code, the shared variables are
> all atomic, and their accesses are all relaxed.)
> 
> bool x, y, z;
> 
> void P0(bool *x, bool *y, bool *z) {
> 	bool r1, r2;
> 
> 	r1 = *x;
> 	r2 = *y;
> 
> 	*z = (r1 != r2);
> }
> 
> The paper points out that although there is an apparent semantic
> dependency from the load of x to the store to z, if the compiler is
> allowed not to handle atomics as quasi volatile then the dependency
> can be broken.  Nevertheless, I am not able to think of a program that
> could exhibit OOTA as a result of breaking the semantic dependency.  The
> best I can come up with is this:
> 
> [P0 as above]
> 
> void P1(bool *x, bool *y, bool *z) {
> 	bool r3;
> 
> 	r3 = z;
> 	x = r3;
> }
> 
> void P2(bool *x, bool *y, bool *z) {
> 	y = true;
> }
> 
> exists (x=true /\ z=true)
> 
> If P2 were not present, this result could not occur in any physical
> execution, even if the dependency in P0 is broken.  With P2 this result
> isn't OOTA, even in executions where P0 ends up storing z before loading
> x, because P2 could have executed first, then P0, then P1.
> 
> So perhaps this is an example of what you were talking about -- a
> dependency which may or may not be semantic, but either way cannot lead
> to OOTA.

Yes, that looks like an example of what I have in mind.

If at the model level we just say "yes there is a dependency, but no it 
does not give any ordering guarantee", then the compiler is still free 
to break the dependency like in your example.

A thread P3 { r1 = z; atomic_thread_fence(); r2 = y; }
could still observe r2 == false, r1 == true, "showing" that the 
dependency was broken.

This would not violate such a model.

(if we consider consume, then that would need to restrict the compiler 
from eliminating the dependency like this)

That is not to say that I am 100% sure that it is possible to define 
sdep correctly to make this work.
One problem is if the compiler merges two threads (with an OOTA cycle of 
3+ threads), it can turn sdep;rfe;sdep;rfe into sdep;rfi;sdep;rfe.
If sdep is too naive then it is easy to come up with counter examples 
where this sdep;rfi;sdep no longer provides ordering, making the whole 
sdep;rfe cycle possible.

I am not sure if sdep can be formalized in a way that ensures that this 
sdep;rfi;sdep edge would still need to be preserved.

Of course one could have inter-thread semantic dependencies and only forbid
   isdep ; rf (e?)
from being reflexive...

Best wishes,
   jonas


