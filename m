Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B560441C6A
	for <lkmm@lists.linux.dev>; Thu, 16 Jan 2025 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737055720; cv=none; b=Lx0sL/gFiwNNxIxT12UEstC1NMLmZsL2ERNPClYPTE5m2DfSdGn8XmTTJtdxLfzuhYPiflSz4XpAsFwneoZpqZ1A6YEbXG+aJ06cedO5jAZ96rRf+Lcn6uCIwj04WLGZTeBSxH1NSB7MQumE45D8mIQI0JyAJJOIQz6Mbci3y3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737055720; c=relaxed/simple;
	bh=vZFQT3T4hLWjDCv4TeqOknh7lnWlt2gnKzJzlAw78LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmflJqo7kA6Ap1fF5YJByPblZ4hQm7AMvyXKMt/O4Oc0RLSG8LfJplN2/G+stj7LKq179f5B3ddE92k+/sjw0ILFG/5uRfsEe5eMKfamkrkBzYvL/5FzhhXBHfqA8sUFTEA86rQHChsvscEVfpUM8/VBLFnuFxWmSfq3TaNlLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YYscF0TSSz9v7JN
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 02:59:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id B81F01407AB
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 03:28:23 +0800 (CST)
Received: from [10.45.144.192] (unknown [10.45.144.192])
	by APP2 (Coremail) with SMTP id GxC2BwDHfeDJXYln_TjAAA--.15156S2;
	Thu, 16 Jan 2025 20:28:22 +0100 (CET)
Message-ID: <446d6a64-7ee4-494a-bbfe-dbfdb6959f9c@huaweicloud.com>
Date: Thu, 16 Jan 2025 20:28:06 +0100
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
X-CM-TRANSID:GxC2BwDHfeDJXYln_TjAAA--.15156S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr15uw15Wr4DXFWxJr4rGrg_yoWkJrc_uF
	4kCws7Aw1UWr1ag3W5GFs8Gw4xAa98uFy7Cay0qr4jqryjvryUXFZrArWqy3Z7Ka90gw1D
	Gryavw1rJwnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267
	AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	Ixkvb40E47kJMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU92NtUUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/16/2025 um 7:40 PM schrieb Paul E. McKenney:
> 	o	If a value is read in the seqlock reader and used
> 		across a "you need to retry" indication, that
> 		flags a seqlock data race.


This too is insufficient, you also need to prevent dereferencing or 
having control dependency inside the seqlock. Otherwise you could 
derefence a torn pointer and...

At this point your definition of data race becomes pretty much the same 
as we have.

https://github.com/open-s4c/libvsync/blob/main/vmm/vmm.cat#L150


(also this rule should only concern reads that are actually "data-racy" 
- if the read is synchronized by some other writes, then you can read & 
use it just fine across the seqlock data race)

I also noticed that in my previous e-mail I had overlooked the reads 
inside the CS in the failure case, but you are of course right, there 
needs to be some mechanism to prevent them from being data racy unless 
abused.

But I am not sure how to formalize that in a way that is simpler than 
just re-defining data races in general, without adding some special 
support to herd7 for it.

What do you think?


   jonas

