Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CD1D0498
	for <lkmm@lists.linux.dev>; Thu, 24 Oct 2024 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772496; cv=none; b=GDiT62V8/5pGv3dLzI9q6wlNyW6qoYUgYiIio3qVY4GEkAqW6HSlPHtEJ+W5D1LUphl1Dk7bfKRlSC0FBGUAGlEmLoD+QO5ajMjeo7luTNa21DlxZBtpboGzeas39BrgLRofrMfrgNF7rqDGG5Ua9olWykmKfnNq74FZkVKhsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772496; c=relaxed/simple;
	bh=9OHoPXPggoIS9aMnixYAKqhuKE2y+nP3afrC64dTOQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KryJK+BNIrn9Ya780GmfUBiW6mC59Q5i2VZZNkM2v1RS8zAUeAuEJYFYCsVrzWQl0fgrLoTI3Q4CuPDRGsZJuBUwTBuTPi0Rh6/3KukjtHtqy9JUbPEGFDTnzQEIcmghNfKRwn1ejJnw0FtM/RIl5gUDvrSXZnDzOs9mwsEB1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4XZ4J54fK6z9v7NL
	for <lkmm@lists.linux.dev>; Thu, 24 Oct 2024 20:01:09 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 51D9814035F
	for <lkmm@lists.linux.dev>; Thu, 24 Oct 2024 20:21:24 +0800 (CST)
Received: from [10.45.154.7] (unknown [10.45.154.7])
	by APP1 (Coremail) with SMTP id LxC2BwDXlzi9OxpnIjBZAA--.7305S2;
	Thu, 24 Oct 2024 13:21:23 +0100 (CET)
Message-ID: <ecb585c5-7f56-4249-b525-66d9757a6f2f@huaweicloud.com>
Date: Thu, 24 Oct 2024 14:21:15 +0200
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Some observations (results) on BPF acquire and release
To: Puranjay Mohan <puranjay@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, paulmck@kernel.org
Cc: bpf@vger.kernel.org, lkmm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Zxk2wNs4sxEIg-4d@andrea>
 <35bed95a-3203-43a7-972d-f3fd3c7da6f9@huaweicloud.com>
 <mb61pr085bt0g.fsf@kernel.org>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <mb61pr085bt0g.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwDXlzi9OxpnIjBZAA--.7305S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW8XF1UKry8XrW5uF1fCrg_yoW8WryDpF
	4xXan8GFZrtry2kr18twsrJa4agas3trWUJF98Xw4qyr909w12gayftF4UXFy7GF4IyF1a
	qrsrtas3G3W3uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 10/24/2024 um 2:11 PM schrieb Puranjay Mohan:
> Jonas Oberhauser <jonas.oberhauser@huaweicloud.com> writes:
> 
>> Am 10/23/2024 um 7:47 PM schrieb Andrea Parri:
>>> Hi Puranjay and Paul,
>>>
>>> These remarks show that the proposed BPF formalization of acquire and
>>> release somehow, but substantially, diverged from the corresponding
>>> LKMM formalization.  My guess is that the divergences mentioned above
>>> were not (fully) intentional, or I'm wondering -- why not follow the
>>> latter (the LKMM's) more closely? -  This is probably the first question
>>> I would need to clarify before trying/suggesting modifications to the
>>> present formalizations.  ;-)  Thoughts?
>>>
>>
>> I'm also curious why the formalization (not just in the semantics but
>> also how it is structured) is so completely different from LKMM's.
> 

Thanks Puranjay for your response!


 > BPF memory model is an instruction level memory model

You mean BPF has no optimizing byte code compiler?
Is it guaranteed to stay this way?
WASM does JIT optimizations as far as I know, which would bring back a 
lot of the complexity of software models like LKMM.

 > much simpler than LKMM

LKMM has a simple core, roughly like this:

ppo = ... (* all the ppo related rules that are relevant to you -- some 
fences don't matter and you can just remove them *)
prop = (coe | fre) (* remove reflexive closure *) ; ...
hb = [Marked] ; (ppo | rfe | prop & int | prop ; strong-sync) ; [Marked]

acyclic hb
(* ... also add the atomicity & sc-per-loc axioms *)

If you can exclude compiler optimizations, you can remove the Marked bits.


Best wishes,

   jonas

