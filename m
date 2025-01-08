Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701D19B586
	for <lkmm@lists.linux.dev>; Wed,  8 Jan 2025 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357982; cv=none; b=K3dmFIcC6X2XoXa/Z4XW1aC7CsC7tPDcbGYQ/CjYeHrH2JNPgcbNPTV8sZ1OIdyTVs4BthtL/acK/BHhzzJ82W0y6z+sQ+xix4CnyZlgTS6YacTL2aYtw/v3QRVWvBhLDJIEzoPlchbNI/hm7qPuQj9r1XjOG77B/rAjgUKtjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357982; c=relaxed/simple;
	bh=DQ6h5SUC2fkjRhyG0SfQlJMS9kuCc+sHaO+QY/HtTEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMSTTuzwfqvFi7oYiIJdaKTmgL96s6Og8yw+1i3f7N37v0N9dpxItXI0fDFLEXrYn9N/UI9tIN4zwjMRSWpnMe9+nlfTj6jIlcdAOw5aoJqCzQPVbP1WUl0s4h+//BuKwr2YiaOS9m/By9wz+xGWI4V2G8SmcDt2asYEth/ojPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4YSvkB3zQMz9v7JS
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 01:17:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 5DDA71402E0
	for <lkmm@lists.linux.dev>; Thu,  9 Jan 2025 01:39:27 +0800 (CST)
Received: from [10.45.149.161] (unknown [10.45.149.161])
	by APP1 (Coremail) with SMTP id LxC2BwCXG0pCuH5n8eBEAA--.32646S2;
	Wed, 08 Jan 2025 18:39:26 +0100 (CET)
Message-ID: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
Date: Wed, 8 Jan 2025 18:39:12 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: paulmck@kernel.org, Alan Stern <stern@rowland.harvard.edu>
Cc: parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org,
 boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
 j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
 dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
 quic_neeraju@quicinc.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwCXG0pCuH5n8eBEAA--.32646S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF18Aw1xAr1fCF13Kry3Jwb_yoWktrc_uw
	s5X3W8Cw1DKanFkF4UJFs09r1Skw4kGFyUX3y8GFnF9ry3JasIkF1DWrZ0vFnrGrW3trnx
	uF1ktF97t342vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267
	AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxOz
	3UUUUU=
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 1/7/2025 um 7:47 PM schrieb Paul E. McKenney:
> On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
> 
>> (For example, in a presentation to the C++ working group last year, Paul
>> and I didn't try to show how to extend the C++ memory model to exclude
>> OOTA [other than by fiat, as it does now].  Instead we argued that with
>> the existing memory model, no reasonable compiler would ever produce an
>> executable that could exhibit OOTA and so the memory model didn't need
>> to be changed.)
> 
> Furthermore, the LKMM design choice was that if a given litmus test was
> flagged as having a data race, anything might happen, including OOTA.

Note that there is no data race in this litmus test.
There is a race condition on plain accesses according to LKMM,
but LKMM also says that this is *not* a data race.

The patch removes the (actually non-existant) race condition by saying 
that a critical section that is protected from having a data race with 
address dependency or rmb/wmb (which LKMM already says works for 
avoiding data races), is in fact also ordered and therefore has no race 
condition either.

As a side effect :), this happens to fix OOTA in general in LKMM.

Best wishes,
   jonas

