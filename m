Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=14.137.139.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016084;
	b=MwVyPpSQQ/oQ4wRJNwt9pG37WOq3RkvTHS1qaALpsCUzZk4NTh65jE6R5kUV5iyyV15y
	 gZdMXbB7+oiX07SjjK7gh6yiR16E17eUnEtVZJUAOIvEO6jfZhDh0NOmXs24z+8cILf7k
	 xT0XOjeM/AbJRUk3Xs55J0wh/Gn3HFuC7M2gi/U7E6KkMMyjkdgDvV4VOGHUtMacjrFwC
	 K5PBEz7LzoSHkMNQmA/dvmjLjDR1UTuHNyFPZ1fMKZcuxwVEoQSKadlGvY8nKP8AYIDcr
	 m568sfoD+V+cnbPNAPyKZ7Bo4J4Qqx1c/VIZEw3cMee0Kgv4I3bznKkoAE2Ez/esZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016084;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=9ecD0lIw5S2Wwx8/HWKybPtToBKIEJwvPma+Hr4KRfk=;
	b=pb/VX7XsbcN4wN7DfK5pR+A4Gc3sVnLuNuFrJA2JTfJHZLnhsz2dOte98fwm9/N1kFqx
	 ba4G4DHXbuD+cUozg40s/pPIhzCsFdENFc2c078g7QBkdt1z7+oYrZm3em6Xm6dvir3W3
	 pQERz5Fa1wFdPqvdWp96Hu+OIcwGv+mc9f+VLSxAjxTey5q/q6Rm/X6CbxGXnno04RA9O
	 /JLlV6KyxmizuHYfUpXtEbfGRc1syU07887ZFlBKmkhcKgg8PQY0eZyp7d6nf+tyw5LqD
	 vt3s2KQUDrFZ4X9E3qUCI6VcSCfuuyUyRJE4sXRsy9uoi2671WKomCUmrbEvNE4tc1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BgG15WAl;
	arc=none smtp.remote-ip=14.137.139.52
Received: from framsgout01.his.huawei.com (framsgout01.his.huawei.com [14.137.139.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7260A262A
	for <lkmm@lists.linux.dev>; Mon, 26 Oct 2026 12:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A7260A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=BgG15WAl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9ecD0lIw5S2Wwx8/HWKybPtToBKIEJwvPma+Hr4KRfk=;
	b=BgG15WAliRz3Ine17uRm8Co86FujUmmEztKSEfBl2soUDwTMF8+DyduV+aGWbdW/J1m0EfOfz
	Qpt9vnFXFDTDdmv+RwLv4qDie/Ykc/ixVH+CiWM9Nlb5Q4JySS9BQf9nRadRxDNMQcdcSjkhs4S
	BRC8ov3SblpF0ZLcLJTv/VI=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by framsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jCsfL4N9bz14K1y;
	Mon, 26 Oct 2026 20:01:14 +0800 (CST)
Received: from frapema500004.china.huawei.com (unknown [7.182.19.21])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E54F4058B;
	Mon, 26 Oct 2026 20:01:19 +0800 (CST)
Received: from M2403003457HW (10.224.107.168) by
 frapema500004.china.huawei.com (7.182.19.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 26 Oct 2026 13:01:18 +0100
From: Kai Ma <kai.ma1@huawei.com>
To: <paulmck@kernel.org>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<linux-kernel@vger.kernel.org>, Boqun Feng <boqun@kernel.org>, "Bradley
 Morgan" <brads@mainlining.org>, Gary Guo <gary@garyguo.net>,
	<rcu@vger.kernel.org>, <lkmm@lists.linux.dev>, Lian Wang
	<lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH hazptr v3 0/4] Hazard pointer updates
In-Reply-To: <2cf703a6-7828-4735-98af-1a6fe93abd3f@paulmck-laptop>
References: <20261011194902.97364-1-mathieu.desnoyers@efficios.com>
	<2cf703a6-7828-4735-98af-1a6fe93abd3f@paulmck-laptop>
Date: Mon, 26 Oct 2026 13:01:18 +0100
Message-ID: <87cxsw4qnl.fsf@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: frapema100007.china.huawei.com (7.182.19.38) To
 frapema500004.china.huawei.com (7.182.19.21)

"Paul E. McKenney" <paulmck@kernel.org> writes:

> On Sun, Oct 11, 2026 at 03:48:46PM -0400, Mathieu Desnoyers wrote:
>> Hi Paul,
>> 
>> This series applies on top of "hazptr: handle NULL address in
>> hazptr_detach" you have in your rcu dev tree.
>> 
>> This first patch addresses a race identified by Boqun Feng in the
>> two-phase wildcard scheme. (no change since the last series)
>> 
>> Patches 2-3 are prerequisites for using ptr_eq() in the 4th patch.
>> Those were discussed at length in a prior version of hazard pointer
>> patches.
>> 
>> Since the last series, I have renamed ptreq.h to ptr_eq.h, addressing
>> the feedback received from Boqun and Gary.
>> 
>> Patch 4 introduces a "try acquire" helper to allow the fast path
>> to not rely on wildcards, while keeping the wildcard forward
>> progress guarantees in the acquire slow path, used on fast path
>> failure.
>
> I have pulled this in for additional review and testing, thank you!
> (With Bradley's Reviewed-by on 4/4.)  Still subject to rebase, which means
> that I can easily replace it with an updated series from you, if you
> wish.

Hi Paul, Mathieu, and everyone,

I've been following the hazard pointer work and have done some testing
on earlier versions. I'd be interested in getting more involved,
particularly in concurrency correctness testing.

If there are WIP patches or early design discussions where additional
review or testing would be useful, could you please CC me? I'd
appreciate the opportunity to get involved earlier and help identify
potential concurrency issues.

Thanks,
Kai

> But in the meantime, some additional testing.  ;-)
>
> 							Thanx, Paul
>
>> Thanks,
>> 
>> Mathieu
>> 
>> Mathieu Desnoyers (4):
>>   hazptr: Fix two-phase hazptr_synchronize race with detach
>>   ptr_eq.h: Introduce ptr_eq() to preserve address dependency
>>   Documentation: RCU: Refer to ptr_eq()
>>   hazptr: Introduce "try acquire" fast path, fallback to overflow list
>> 
>> Cc: Paul E. McKenney <paulmck@kernel.org>
>> Cc: Boqun Feng <boqun@kernel.org>
>> Cc: Bradley Morgan <brads@mainlining.org>
>> Cc: Gary Guo <gary@garyguo.net>
>> Cc: <rcu@vger.kernel.org>
>> Cc: <lkmm@lists.linux.dev>
>> Cc: Lian Wang <lianux.mm@gmail.com>
>> Cc: Kunwu Chan <kunwu.chan@gmail.com>
>> 
>>  Documentation/RCU/rcu_dereference.rst |  38 +++++++-
>>  arch/x86/include/asm/ptr_eq.h         |  16 +++
>>  include/asm-generic/Kbuild            |   1 +
>>  include/asm-generic/ptr_eq.h          |  16 +++
>>  include/linux/hazptr.h                |  48 +++++----
>>  include/linux/ptr_eq.h                |  63 ++++++++++++
>>  kernel/hazptr.c                       | 135 +++++++++++++++-----------
>>  7 files changed, 237 insertions(+), 80 deletions(-)
>>  create mode 100644 arch/x86/include/asm/ptr_eq.h
>>  create mode 100644 include/asm-generic/ptr_eq.h
>>  create mode 100644 include/linux/ptr_eq.h
>> 
>> -- 
>> 2.43.0
>> 

-- 
Kai Ma
