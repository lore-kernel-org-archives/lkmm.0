Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A71EF0BC
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264823; cv=none; b=JYdtjnm48B46qDituZa/SElxKjwRrrM7I0jPeeRCEvJ0f59xB7iWfNbkKxpNaoMOmUJFn/C/ld+gHWHQQlS0eJzKONSLXaHceQnQKTPHiYRUwXnCxUzsr5WGIGlLHWVdKvW1WCtod2yUwnSU28yP73O20MJOvlHbEkdGbxs7OdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264823; c=relaxed/simple;
	bh=ZgUvpLAYr+peAcb50viKmv27heowApjGPo4ML1CK7C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SngTVV/soi+uHJ7QAdRtBZmGBfh5qy4eQcppt7paOuffEzY6CMpyzDtZ442YVNTGmwQJfVMsu8XdljASBvIj+Ytv+m+YdsbxyaO/u/8ojE4Q+SR7yGuhdObYBIAfyFm/76jfaDxU83QFArDw2iTOtQTl4xm+OG+4zt5kqYDaby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4YSFGf0tzhz9v7g1
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 23:24:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 5A22B140F69
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 23:46:52 +0800 (CST)
Received: from [10.206.134.186] (unknown [10.206.134.186])
	by APP1 (Coremail) with SMTP id LxC2BwB3_kxeTH1nByE0AA--.39543S2;
	Tue, 07 Jan 2025 16:46:51 +0100 (CET)
Message-ID: <9df85484-9a31-4682-a053-f3aaf01c0bbb@huaweicloud.com>
Date: Tue, 7 Jan 2025 16:46:35 +0100
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
To: paulmck@kernel.org
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
 urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:LxC2BwB3_kxeTH1nByE0AA--.39543S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF18GryxXr1kAr1xZFyftFb_yoW5Zryfpr
	Zxt343KrZrtr4qv348XwnruFy8uws7Jas8WFy5CryYyw1Yv34fZw1vqas09Fy7Grsaka45
	KryIgF98Zw1DXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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



Am 1/6/2025 um 10:40 PM schrieb Jonas Oberhauser:>
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> ---
>   tools/memory-model/linux-kernel.cat | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/memory-model/linux-kernel.cat b/tools/memory-model/linux-kernel.cat
> index d7e7bf13c831..180cab56729e 100644
> --- a/tools/memory-model/linux-kernel.cat
> +++ b/tools/memory-model/linux-kernel.cat
> @@ -71,6 +71,10 @@ let barrier = fencerel(Barrier | Rmb | Wmb | Mb | Sync-rcu | Sync-srcu |
>   		Rcu-lock | Rcu-unlock | Srcu-lock | Srcu-unlock) |
>   	(po ; [Release]) | ([Acquire] ; po)
>   
> +let w_barrier = po? ; [F | Marked] ; po?
> +let rmb-plain = [R4rmb] ; po ; [Rmb] ; (po \ (po ; [W] ; (po-loc \ w_barrier))) ; [R4rmb & Plain]
> +let plain-wmb = [W & Plain] ; (po \ ((po-loc \ w_barrier) ; po ; [W] ; po)) ; [Wmb] ; po ; [W]
> +
>   (**********************************)
>   (* Fundamental coherence ordering *)
>   (**********************************)
> @@ -90,7 +94,7 @@ empty rmw & (fre ; coe) as atomic
>   let dep = addr | data
>   let rwdep = (dep | ctrl) ; [W]
>   let overwrite = co | fr
> -let to-w = rwdep | (overwrite & int) | (addr ; [Plain] ; wmb)
> +let to-w = ((addr | rmb-plain)? ; rwdep ; plain-wmb?) | (overwrite & int) | addr ; [Plain] ; wmb
>   let to-r = (addr ; [R]) | (dep ; [Marked] ; rfi)
>   let ppo = to-r | to-w | (fence & int) | (po-unlock-lock-po & int)
>   

I will also try to give an intuitive :) :( :) reasoning for why this 
patch rules out OOTA.

If we look at an dep ; rfe cycle

   dep ; rfe ; dep ; rfe ; ...


then because of the absence of data races, each rfe is more or less an

   w-post-bounded ; rfe ; r-pre-bounded

edge.

If we rotate the circle around we turn

   dep ; w-post-bounded ; rfe ; r-pre-bounded ; dep ; w-post-bounded ; 
rfe ; r-pre-bounded ; ...

into

    rfe ; (r-pre-bounded ; dep ; w-post-bounded) ; rfe ; (r-pre-bounded 
; dep ; w-post-bounded) ; rfe ; (r-pre-bounded ; ...


and ideally, each of these (w-pre-bounded ; dep ; r-post-bounded) would 
imply happens-before, since then the cycle would be.
    rfe ; hb+; rfe; hb+ ; ...
which is acyclic.

However, we do not get hb+ in general, in particular if the bounding is 
due to rmb/wmb. For all other cases, it is relatively easy to see that 
we get hb+, e.g., if the bound is due to an smp_mb().

Luckily, in our specific case, we can get hb+ evenfor cases where 
rmb/wmb bound these accesses, because these accesses related by the dep 
edges are known to be reading/read-from externally.
Such an external interaction would be impossible if there were another 
store to the same location between such an access and the next 
w_barrier: because of the absence of data races and the lack of 
w_barriers that would allow synchronization with the outside world, the 
external event could not "occur between" the access and such a store.

As a result, all pre-bounds caused by a rmb must have the form

[R4rmb] ; po ; [Rmb] ; (po \ (po ; [W] ; (po-loc \ w_barrier))) ; [R4rmb 
& Plain]

and similar for post-bounds caused by wmb, which means the corresponding

    r-pre-bounded ; dep ; w-post-bounded

edges must be

    rmb-plain ; dep ; plain-wmb

which is in ppo and thus also hb.

Hope that helps clarify the idea...

   jonas

