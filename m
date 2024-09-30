Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174718E779
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703080; cv=none; b=BeEzxNYIl3rVrLSl9MWCbCUzUyX2OuvZcBu+BILF/HEM/NOn2MckgBUz5oqT2sWVLasjdUllAWd5/7tu/CAKr4lnpT/Px59HRJhxX9/wdnf90B3WlVAgHTqEuGWh6v7A94CKMj0ufKx08z2HsQ47cmpaIaegtZjLfwT3aa7ptVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703080; c=relaxed/simple;
	bh=ou2We3HZvCP1FtDuRVsNH3KPbqGBDtnllZdkXqhV1+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ks/GUVqLC5SVhatzr8FAU0oHCC4f9GRQgOAh/WwiUXfDeZsveQlDOptZ6jpooKTWuKzyPjvWX1ViGW2udAwjY8+0pDd45JYLv07EAyuAg2L8VVIZKFnqHKd6ON0zeRLCv+4unRLguG36AFElBuXmTuwCo5xW4O93KE8tYaS3yoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4XHLsR1RGGz9v7JM
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 21:05:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id B024214075E
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 21:31:10 +0800 (CST)
Received: from [10.81.209.28] (unknown [10.81.209.28])
	by APP2 (Coremail) with SMTP id GxC2BwAXesoZqPpmOrrzAQ--.5903S2;
	Mon, 30 Sep 2024 14:31:10 +0100 (CET)
Message-ID: <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
Date: Mon, 30 Sep 2024 15:31:02 +0200
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:GxC2BwAXesoZqPpmOrrzAQ--.5903S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5C7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjc
	xK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkvb40E47kJMIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ZJ57UUUUU==
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/

[dropping a lot of CC]

Am 9/21/2024 um 6:42 PM schrieb Mathieu Desnoyers:
>
> Porting it to the Linux kernel should be straightforward. 


Btw, what is the relation between uatomics and LKMM?

Should I assume that they intend to have LKMM semantics modulo whatever 
is explained here:

https://github.com/urcu/userspace-rcu/blob/master/doc/uatomic-api.md

Because on C11 model, dependencies are generally not considered

   jonas

