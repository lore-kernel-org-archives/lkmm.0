Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413001E1C10
	for <lkmm@lists.linux.dev>; Fri,  8 Nov 2024 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060764; cv=none; b=imgCkOdTRsox2fM9igRRyI2+uqkCprUBk/1MYNPXHzCcGl1sqym+STKDh5kb9VuR2be3r2bSNXBPUiO5rngUuDSz6HDrTtsJ50NKfxuGN/K/fzmTI6Hx4AZJHYc/ufxmwLBg9nQI7+9bUJPuUJnBnrOfOYgHuSAxWsKzH1n7iag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060764; c=relaxed/simple;
	bh=SeEZ3FiTtve+//uUNTtAHmQb9BBMARmB8mLGRp0N+6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADobdGdYyhRrLuLXbi4KdnMNIsDdVZURvJIQxsQTZIsimS3+l/CcnY04n12IgVPjQ17uF27UIEaUVQv7Oxp0LlrKxgrMYpUaKqqTMxTVhCAPGrIPW7Gy+CWNw3Kc6DXPp9ww6HVBWMWcBbK4K7BsjcinuydNKUsr6WTwiQn1oZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt7Oz7bS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt7Oz7bS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso1906089b3a.0
        for <lkmm@lists.linux.dev>; Fri, 08 Nov 2024 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731060762; x=1731665562; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCeFBhi53dTGSGPWiOQdp9+xDJ2cZ8mlrfTnzvDIhuM=;
        b=Nt7Oz7bSbgJpxX/cScaUUAu3pc70oohZuKz8pVwttihSBu2kpWAQSYQ9rfejR1a7Cc
         3s4IOJc6ax2igwcg5xmbg90v0evwH/HYDPnPe3/OTgAz1ELVc8aJDJAykALMxa5r1cBj
         AUZpQfdrOjeJ40dCRraK4bxSvP5bicxnPdOLHsc5tyDPWHAlHFkyx09a2zmob1/Aiu3J
         7IpskgMO6VmdfR13ASG3D4H1n0Ifs65097W0Pc/9ohS83djXhyKpHlfHZrpqzKvNjQOX
         qjk+ugg+wu3+5/RM1qL6fMnCY5w2wHctkFjyteCxQjb+z82uhl+w7fyG0xEZe8a/ILYp
         Nggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060762; x=1731665562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCeFBhi53dTGSGPWiOQdp9+xDJ2cZ8mlrfTnzvDIhuM=;
        b=QuOMiAsRifLW4kNV/MTAyyZj1w+30hhkVTaWpdd6fLRJoTPtQxFTvT02pA8bD0P1I8
         a3beAA8cK/3j49vW1ywDxXmieUywbCPhOE329G82k9gwwdpvik7tdL24slY5xfrmRyfb
         QtEh4z5NhWPiZD98xz5SFmf86T/zn8RlWFFB49k5M68tLlfxzZXKqpLWoSwBM3VRVUnB
         jvKyOiRcxu14lnpXK+vv7zN2nacWr9Dj2RX7d4r3+p9IW8auLP3c2qSHry8V+y7K6OiC
         pB03t+auocFNmPAp5oP+Z4NNz0Cud+InwU+7h4kPXLm2B8ZFte1mehXECc8HaEDZlHsJ
         FHgw==
X-Forwarded-Encrypted: i=1; AJvYcCW4mft8ty3wJYd9/eauxKRz8YUIZbIL7iyT3kqcDs+WPptqOUe32LhgZDpTVM5519wGIaAH@lists.linux.dev
X-Gm-Message-State: AOJu0YxWBAPw5qEfiJOMQHoWQ6vSz0f0x2udbCt0b0KrXZNaGim9J7oR
	is5j+WcjVfEG3fs3Rf8xsI7be47kE5xfUKEUah/Ef3OWRD146T6P
X-Google-Smtp-Source: AGHT+IED/7Ma5XQVyEfvEzCla5zLTZctQKHQbYg3d/yVdLqHQKmY3qhfc/N0TxEiAF3EhZikIVSSUw==
X-Received: by 2002:a05:6a20:7349:b0:1d6:f6a1:786 with SMTP id adf61e73a8af0-1dc204cd758mr5129256637.3.1731060762429;
        Fri, 08 Nov 2024 02:12:42 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f48b508sm3032426a12.1.2024.11.08.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 02:12:42 -0800 (PST)
Message-ID: <a278c4a9-eae2-491e-8f13-5a87a25dad26@gmail.com>
Date: Fri, 8 Nov 2024 19:12:38 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] tools/memory-model: Distinguish between syntactic
 and semantic tags
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: boqun.feng@gmail.com, dhowells@redhat.com, dlustig@nvidia.com,
 frederic@kernel.org, hernan.poncedeleon@huaweicloud.com,
 j.alglave@ucl.ac.uk, joel@joelfernandes.org, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, luc.maranget@inria.fr, npiggin@gmail.com,
 parri.andrea@gmail.com, paulmck@kernel.org, peterz@infradead.org,
 quic_neeraju@quicinc.com, stern@rowland.harvard.edu, urezki@gmail.com,
 will@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <3d72b92a-4935-425c-abd5-ec4631baef2c@huaweicloud.com>
 <46d291da-ddb9-43b9-bd93-b81aacd5e29c@gmail.com>
 <7542399d-87c5-4f1c-9d09-6a6f96d148da@huaweicloud.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7542399d-87c5-4f1c-9d09-6a6f96d148da@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 8 Nov 2024 10:10:48 +0100, Jonas Oberhauser wrote:
> Am 11/7/2024 um 11:51 AM schrieb Akira Yokosawa:
>> Jonas, despite the CC, your message has not made my gmail mbox, not even
>> the spam folder.
>> I'm replying using lore's reply link. >
>> As Paul mentioned elsewhere, the [v5] patch misses tags from Boqun at the moment.
>>
> 
> So if I supply a new revision of a patch, should I include in all the reviewed-by
> of the previous patch?
> 

It depends.

> I hadn't done that before (because I thought I should not add other people's tags
> especially if they hadn't reviewed that specific revision), so we may be missing
> *a lot* of reviewed-by...
> 

Section "Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:"
of Documentation/process/submitting-patches.rst has this paragraph:

  Both Tested-by and Reviewed-by tags, once received on mailing list from tester
  or reviewer, should be added by author to the applicable patches when sending
  next versions.  However if the patch has changed substantially in following
  version, these tags might not be applicable anymore and thus should be removed.
  Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
  in the patch changelog (after the '---' separator).

Does this help you?

> If this is the case, I'll try to scour through the previous e-mails and add
> all the missing reviewed-by.

Only if Paul asks you to do so ;-)

HTH, Akira

