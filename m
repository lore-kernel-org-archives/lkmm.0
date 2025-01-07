Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18271D90D7
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248781; cv=none; b=PmgYGgn/AJSA6Sdx2Yp2a10yTV2AMFxRXRWP8ndx39u+TJXhSE5qxZptxNzbL5onhHTSqT7koKqsUu6hS+deWLQGQmIphGiqcFsRYhFUcsP508yMrCHHoOYqZOt8MU5w6rHVVMd8me5blT461b3/OGKBI0KbERYggk+odhh/DQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248781; c=relaxed/simple;
	bh=EhSfR99VqzmcGL5bE/uG+ftXMO57Fb8/6Y1nwYJ8LdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSCnQndUUnKHapbbRb81nYc/TmwnxGVbdsWqj5ran77x7dcHtM+2/ed3Sm4T3+fwACdTYZRV38Z6YxkJcN0lMojPUDVGhMsBt7fLg6N6Bn//wj/y3PDuDDV7lLM1t/zKXf2mAcFFKZUfS3efVwbIwavBPxCiPABDmeXKgdB+Qlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YS6z44Dy3z9v7JS
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 18:41:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 7FC28140522
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 19:02:55 +0800 (CST)
Received: from [10.206.134.186] (unknown [10.206.134.186])
	by APP2 (Coremail) with SMTP id GxC2BwDXP+LRCX1nLsQwAA--.36863S2;
	Tue, 07 Jan 2025 12:02:54 +0100 (CET)
Message-ID: <ea6a8150-aaaa-4108-af8b-fb5088e25016@huaweicloud.com>
Date: Tue, 7 Jan 2025 12:02:38 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: Peter Zijlstra <peterz@infradead.org>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com,
 will@kernel.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
 urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <20250107100618.GK20870@noisy.programming.kicks-ass.net>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <20250107100618.GK20870@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwDXP+LRCX1nLsQwAA--.36863S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF18Cw1DJryUZw4xZF17GFg_yoW8Jw48p3
	yqqa43K3Z0vw4fAr1Igw1DGFW0vrsavF1rJr93G34Iy345uF1S9r4agw4j9F9rAF4Sv3Z8
	ArWY9wsxu3Z0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/7/2025 um 11:06 AM schrieb Peter Zijlstra:
> On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:
> 
>> We first discuss why the more standard definition does not work well for
>> language models like LKMM. For example, consider
>>
>>      r1 = *a;
>>      *b = 1;
>>      if (*a == 1)
> 
>        if (r1 == 1)
> 
> ?
> 
>>        *b = 1;
>>      *c = *b;
>>
>> In the execution where r1 == 1, there is a control dependency from
>> the load of *a to the second store to *b, from which the load to *b reads,
>> and the store to *c has a data dependency on this load from *b. Nevertheless
>> there is no semantic dependency from the load of *a to the store to *c; the
>> compiler could easily replace the last line with *c = 1 and move this line to
>> the top as follows:
>>
>>      *c = 1;
>>      r1 = *a;
>>      *b = 1;
>>
>> Since there is no order imposed by this sequence of syntactic dependencies
>> and reads, syntactic dependencies can not by themselves form an acyclic
>> relation.
>>
>> In turn, there are some sequences of syntactic dependencies and reads that do
>> form semantic dependencies, such as
>>
>>      r1 = *a;
>>      *b = 2;
>>      if (*a == 1)
> 
>   r1 again?
> 
>>        *b = 1;
>>      *c = *b;
>>
>> Here we would consider that the store to *c has a semantic data dependency on
>> the read from *a, given that depending on the result of that read, we store
>> either the value 1 or 2 to *c.


Yes on both counts, thanks!

    jonas

