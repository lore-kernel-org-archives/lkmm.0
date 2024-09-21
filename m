Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422A15383D
	for <lkmm@lists.linux.dev>; Sat, 21 Sep 2024 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726918093; cv=none; b=RVnmvHaZfb7s5xFP7kekwAs9YLOVoPJkjFsIuxxla9dCHgg50Daq/m/8hXsiomhKJh1M/Fhb0ezgVim38wUEwa9DJNOroEO70NTqbpgMXYlqBc/wc2kKauZ01Hzz1PXWcMnRSPGLZSxkFg6ifJI7pIwCuF2izHANJr24YTvb5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726918093; c=relaxed/simple;
	bh=cJuRp/VT9u23ZwqggQtkt7xtePVkwfUUowEUIFvzudw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TriZtZOW4Nr5m5+GATZioCXLkHQf2UtWYdGWRP45uyEEkAv/esnKj+vzDSAqjDVEeTTR3YbJTndliNKuhSTelkpXc8xo4SWPRAQKFn0V6fg+JbeYykbmtkH826/wnhT/3t7B7ymFFX7C+bv2SPRkq/yexkcfJ0BEieShQyVl3yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6F3nvZA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6F3nvZA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718d6ad6050so2165420b3a.0
        for <lkmm@lists.linux.dev>; Sat, 21 Sep 2024 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726918091; x=1727522891; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TosarMix0EeLolPPk4hOFOZ1EcbZ3V9GwDjexY3/fo=;
        b=Z6F3nvZAJBHTpLay4YXmb5RRU6nTY5/HI2G1RIqc8mtQcpzGTklPqSDwEmAd/E1ghA
         /aKvQ2l5ONlaQUvY8n3uFtlSIWSWXNCfI3ZOQxZbDqpQ9wgdiEOMr/9SNn57NMh0X5Nc
         55bKxajwAKKHUmfOC2VYXP7Y6eTNw5nSw9dt9FD7zo2OYTC/BuELvZ/lVNUGYVHsnIv/
         zkK29h2iYd15Szz39/Kedr/gLaUi+YKvw97gQfKpBi5dZfu4D03gica+88CLa6EbrfPd
         KF8Hkkhap8Knb8L1vVbA9/8IgXVSbOoka3eFqpXKL08TjO9Jk29U3U4ckZSNTRS/r2Pa
         sC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726918091; x=1727522891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TosarMix0EeLolPPk4hOFOZ1EcbZ3V9GwDjexY3/fo=;
        b=Y6QblKB8bHrrUzKeYC/elOhmX0yOpD9mAaC7DubdMF7GGbKHaWO8Gqv9yF6xyqanBM
         5c+3wpReR+mpTmbDulWzMrIvij4uO0RW9MXitutfLSlpgWvgaCLtD+odTdjqhkXCPxAN
         MeWv+QEG43GsoBdKnQlWGrJOqKuw5tlwtFVq+VRwgY41OlHVpV8xl3osekr4HtX+B1sq
         iGPRXry3uojQKDBNWo0SK3pwPHwOpg7EZOT6i17qqnxtLo2XRWmHkpHmHbdQQR9CPcMI
         GhuzcHZYqpG1fo2EWPxohnCQYda8fXfYcowHj0PSA+CAvGA2Lad7lWpm23C6iA5MxU/o
         Jkgg==
X-Forwarded-Encrypted: i=1; AJvYcCX7HgAAiV3kMnG/McOtMHLrRfVq0+EWr/bTfXq5ru5ZRDSTaik24O1okFu8rOnyMDzgdkqN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7d2aEIm91gi8Cc147uTEl0fJXrDuhJihNHIstOYqLXFda4vXX
	6LdrUyOEohcLV7dIphnzSJa+K2QH9f2pPw7pO/QtmJx5CUxEUoK3
X-Google-Smtp-Source: AGHT+IHCIfk8HcWv/D8DDJPhd0JyXbNBo7shCo7ksMrbEmle4wuD51KpLK6mMmOWR4h+h2fmXvowTw==
X-Received: by 2002:a05:6a20:d795:b0:1d2:ef5c:13f6 with SMTP id adf61e73a8af0-1d30a987f85mr7330776637.34.1726918091388;
        Sat, 21 Sep 2024 04:28:11 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a974dcsm11173426b3a.32.2024.09.21.04.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Sep 2024 04:28:11 -0700 (PDT)
Message-ID: <a333f5f9-ffc0-4dea-80de-92e275492235@gmail.com>
Date: Sat, 21 Sep 2024 20:28:04 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] tools/memory-model: Switch to softcoded herd7 tags
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, paulmck@kernel.org
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
 quic_neeraju@quicinc.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
 Akira Yokosawa <akiyks@gmail.com>
References: <20240919130634.298181-1-jonas.oberhauser@huaweicloud.com>
 <20240919130634.298181-5-jonas.oberhauser@huaweicloud.com>
 <8cb4e810-da6c-4d8f-b608-5bdba56da2bd@gmail.com>
 <c0b25884-b22a-46d6-949a-81fa9ce8f836@huaweicloud.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c0b25884-b22a-46d6-949a-81fa9ce8f836@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 21 Sep 2024 09:39:05 +0200, Jonas Oberhauser wrote:
> Thanks Akira for your continued eagle eyes!
> Will include in next revision.
> 
> One question below.
>  jonas
> 
> 
> 
> Am 9/21/2024 um 4:44 AM schrieb Akira Yokosawa:
>> This litmus test is not compatible with klitmus7, which is much
>> stricter than herd7's C parser.
>>
>> You can have only int or int* variables in the exists clause.

I should have said:

   By default, you can have only int or int* variables in the exists clause.

You can find an example where an atomic_t variable is listed in its exists
clause at:

    Documentation/litmus-tests/atomic/Atomic-RMW-ops-are-atomic-WRT-atomic_set.litmus

, where the atomic_t variable is declared explicitly in the initialization
block as follows:

    {
	atomic_t v = ATOMIC_INIT(1);
    }

>> Register variables need their declarations at the top of each Pn()
>> (classic C).
>>
>> See below for klitmus7 ready code.
>>
>> And tools/memory-model/litmus-tests/README need to mention this
>> litmus test.
>>
>>          Thanks, Akira
>>
>> ---------------------------------------------
>> P0(int *x, int *y, atomic_t *z)
>> {
>>     int r0;
>>
>>     WRITE_ONCE(*x, 1);
>>     r0 = atomic_add_unless(z,1,5);
>>     WRITE_ONCE(*y, 1);
>> }
>>
>> P1(int *x, int *y)
>> {
>>     int r0;
>>
>>     r0 = READ_ONCE(*y);
>>     if (r0 == 1)
>>         WRITE_ONCE(*x, 2);
>> }
>>
>> exists (1:r0=1 /\ x=1)
>> ---------------------------------------------
>>
> 
> Should z also be changed from atomic_t to int?
>

No, it should not.
Such a change would make z incompatible with atomic_add_unless().

        Thanks, Akira

