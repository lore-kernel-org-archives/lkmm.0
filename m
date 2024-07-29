Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647F81AD2
	for <lkmm@lists.linux.dev>; Mon, 29 Jul 2024 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722269167; cv=none; b=b4ObCq8PY9t6wa/vy699jD/WNOD/zt25CHJaG/8W6yBT9yO5Q9p6c+dl4N0xdoOhuRfI8FFK1AgwLICeMAkvMBNkXTfKOxAcm+zzHFMBcBoyV8+y2a/Cyk5fWLpw/cACgwVMLiOe3TZh8spVemi1e/PxGGU2NJ/IfQG61k/dKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722269167; c=relaxed/simple;
	bh=ysBiCh8u5roVVY8+6S8TBy18tSYrcjfO0Lhp6vk058M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+hSFUewF6uWWeYF511NbdiTnSGW23aWDuv016ukJxwhqiFiADdwANB3MzU85nidE+68so6iiScuUegXN1jlT+EXs5rHnkw+nVQpuM3DwWzVS2oglQxuWAcufXkXe/ZJhJoLsDa9tJmrG0zcKOiQRTs4TdYGaw7/aLHry7PYw+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4WXjRN4PsDz9v7Hl
	for <lkmm@lists.linux.dev>; Mon, 29 Jul 2024 23:47:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 1961F140628
	for <lkmm@lists.linux.dev>; Tue, 30 Jul 2024 00:05:53 +0800 (CST)
Received: from [10.45.144.33] (unknown [10.45.144.33])
	by APP2 (Coremail) with SMTP id GxC2BwAnRMHVvadmpTAlAA--.4340S2;
	Mon, 29 Jul 2024 17:05:52 +0100 (CET)
Message-ID: <76bc2c08-655c-4ca4-a573-16a98b7dd919@huaweicloud.com>
Date: Mon, 29 Jul 2024 18:05:36 +0200
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/4] tools/memory-model: Define more of LKMM in
 tools/memory-model
To: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
 urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev
References: <20240604152922.495908-1-jonas.oberhauser@huaweicloud.com>
 <88c1ebc8-4805-4d1d-868a-889043899979@rowland.harvard.edu>
 <bbc3bd10-3bf5-4b1a-a275-dd328c42e307@huaweicloud.com>
 <f93f140b-13bc-4d00-adee-46cc1c016480@rowland.harvard.edu>
 <4792c9e7-2594-3600-5d82-4cb1443fe670@huaweicloud.com>
 <d6a76968-d10b-c60b-245a-f58116eca6af@huaweicloud.com>
 <eb9548de-e66e-3dcd-9136-8702a5bc2934@huaweicloud.com>
 <00f58d20-f92d-461e-beac-b307905cab3b@huaweicloud.com>
 <e45bd166-348a-95b6-c17c-dcd2525f263c@huaweicloud.com>
 <9ac4a586-ef37-4c48-8e66-df3d02b53b6a@huaweicloud.com>
 <cd5a269a-9c6a-a311-d796-ce65c935887b@huaweicloud.com>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <cd5a269a-9c6a-a311-d796-ce65c935887b@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwAnRMHVvadmpTAlAA--.4340S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy3CFyxZr13Gr48GF1fCrg_yoW8JFWfp3
	4aqF43GrsYq34Iqr18J3WkXF9aya97JF45tr13tr47CFy5WrZ0qrySyw45Kr9FqFs5Jayj
	9rWkX3Z3ZryvyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 7/29/2024 um 5:53 PM schrieb Hernan Ponce de Leon:
> On 7/29/2024 5:44 PM, Jonas Oberhauser wrote:
>>
>>
>> I don't think this is a problem. If the old version is the default, 
>> and we define it in the .cfg file for the tree version of LKMM, then 
>> it will work correctly for both the old and new versions. People 
>> playing around with Memory Models should be careful enough not to 
>> intentionally break the model by passing bogus options.
> 
> The same was true for my implementation using the lkmm-legacy option

Yeah, I'm fine with that one. (Although it may be better to have a 
version number as value instead of just a boolean flag, like 
-model-version=x_y_z - just in case this is not the last time).

> rather than the model variant, but this was still considered to break 
> backward compatibility.
> 
> https://github.com/herd/herdtools7/pull/865#issuecomment-2229930493

I think Akira is a bit overzealous here. What if a user accidentally 
puts -lkmm-legacy false and accidentally also adds the version number 
into the litmus test and/or model?

The request can be fulfilled, by defining some relation in the bell file 
that has a magic name like version_x_y_z and checks that the x_y_z 
matches the -model-version=x_y_z provided as an argument.

But I don't think we need to go that far.

jonas

