Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655C1DFE24
	for <lkmm@lists.linux.dev>; Thu,  7 Nov 2024 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976719; cv=none; b=gZHzibIYLUVqUqWdMJ58qCMWbpOsgmxsSrwB2hefLQg9BQAZ4JvCl0A8pl2jwryVbsResl8rcaSKxLpLXlJaFPPn1PbgJtGgqBvc62BLt0QGAM7MqHMlD2t0e0LsLlyR8rga8cjmenkyQzy9eqM4QzFy4l6pXt74OvdEWfuRyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976719; c=relaxed/simple;
	bh=iTraXoQlMnsFBf3dXybH+eULUrZ728/il/5KZ7LOXnY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=C3+afJmEo/WUU7n8Jtkq7OTR6WLgIX2Yk2cSxyyZ66+SDwcB8+g1Xmfxcp+bvo5KVT1txhpMrqNgl+cRyoB8vyKroyaKjxnFSC6Q+YyBe71My6SveygT8ajMMeLwxRtZcr9Zx9SmAnj8ozZyhlZHSz9CMki9fifO2SHIpYKyPMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi15LzWG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi15LzWG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso533531b3a.3
        for <lkmm@lists.linux.dev>; Thu, 07 Nov 2024 02:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730976717; x=1731581517; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuY4SpJUbO4AJrmSD57YV+liJgSVrcOzU9NY1Rw92r0=;
        b=Vi15LzWGM4gzjGS0Bal3C1eB2Zp8ucN6rQkSxkBUjdhOzn0jAQTK44cKB8H9y2yfy/
         A31U08RpRg8A9KHrbf2MJud+2V0T+X6qh/6ADllRrydkqwt4ANYDW8j/Xykr8TT9nkTt
         2ifD7RjUuW/2uOYy5JZf9y3El0CHDwDWs9SSgehP0Eil/+chWcQ3s+n40jMhb8Bo81y3
         TnWnug2wz+cMwu9LTLQU6QjDoySLLNUqG4AaA7AoMZEd5JifTWyLtX1Te3l5tnc5KZjI
         UErfuUqDzqs5HHR9NKyPcuJ8x7X1DksdzDdKqBGckj21OyHVgBuIirM64i+IuIv88giZ
         Hu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976717; x=1731581517;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuY4SpJUbO4AJrmSD57YV+liJgSVrcOzU9NY1Rw92r0=;
        b=t31YHkdqc6vEeN0sJL7hK6bwY4N+UW42fPAhVF+yu7MRekw7bK01RU/2KzskS9Z8CE
         +5Q1OTiRr5URdJp5zh2SAJS3sUWwXbvWACI0rbcrGtZAeuM3cRpQbroHx7Gbzqdsgi4b
         DglnlGmRktOUFykpse0K+CombsZ5o5sOi4zrRJYuomTFj8KYJLtGQSrgdt1SmlM6jaSA
         qPgp/LnYIL4aomxiws56ZLsUO0wwYan630bQ1lX5PQON5hwjcVfJ/topcVcx3zMpRgVf
         VI1VnzGKmtxwTVBsKHFsbYsx5LQMkkbuQM3Mjz3fFGFwU17x1f18O6gP882ozvKaVfb2
         AbNw==
X-Forwarded-Encrypted: i=1; AJvYcCWrXPgPT2HkhWFzdS+M6U8SZW2zjOWLIjogT1LOmGQpNB7U43hZOgoAuDdPolWnt6DPmfBR@lists.linux.dev
X-Gm-Message-State: AOJu0YxnOEChFdyxP5Q+ja9nIVDkAgTQ/tQcwguKi3CKLrFjLOA8vEfc
	ECuLl7cHjDbvfakiqXp70CGMvwSodc/JaZW+BXiFi1Phl1WI5ti0
X-Google-Smtp-Source: AGHT+IF1IWFmBnHTSCycGILlrZMmwZUdqmEcXMZt+Qm0+FNaaUgLuV4TZnIKVHuPWEXKHaTVK7WAgw==
X-Received: by 2002:a05:6a21:9999:b0:1db:f89a:c6fe with SMTP id adf61e73a8af0-1dbf89ac713mr11476967637.32.1730976717526;
        Thu, 07 Nov 2024 02:51:57 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a5ea27sm1178054b3a.177.2024.11.07.02.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:51:57 -0800 (PST)
Message-ID: <46d291da-ddb9-43b9-bd93-b81aacd5e29c@gmail.com>
Date: Thu, 7 Nov 2024 19:51:52 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jonas.oberhauser@huaweicloud.com
Cc: akiyks@gmail.com, boqun.feng@gmail.com, dhowells@redhat.com,
 dlustig@nvidia.com, frederic@kernel.org, hernan.poncedeleon@huaweicloud.com,
 j.alglave@ucl.ac.uk, joel@joelfernandes.org, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, luc.maranget@inria.fr, npiggin@gmail.com,
 parri.andrea@gmail.com, paulmck@kernel.org, peterz@infradead.org,
 quic_neeraju@quicinc.com, stern@rowland.harvard.edu, urezki@gmail.com,
 will@kernel.org
References: <3d72b92a-4935-425c-abd5-ec4631baef2c@huaweicloud.com>
Subject: Re: [PATCH v4 5/5] tools/memory-model: Distinguish between syntactic
 and semantic tags
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <3d72b92a-4935-425c-abd5-ec4631baef2c@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Jonas, despite the CC, your message has not made my gmail mbox, not even
the spam folder.
I'm replying using lore's reply link.

On Thu, 7 Nov 2024 10:05:18 +0100, Jonas Oberhauser wrote:
> Am 11/6/2024 um 7:00 PM schrieb Paul E. McKenney:
>> Never mind, I found your patch in my spam folder. 
> Glad that got cleared up. I had gotten very confused because you had 
> also responded to the thread with the patch.
> 
>  > check this commit on -rcu
> 
> For future reference, where can I find the -rcu repository? I couldn't 
> find the commit on paulmckrcu/linux, but maybe I looked incorrectly.

You can find your patches at:

    [v4] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=c53d54ed7e40255ea0ea66dd121672fd22423326
    [v5] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=9b13bea0966c498629e221c3022a591cc88d4c57

and

    [v4] https://github.com/paulmckrcu/linux/commit/c53d54ed7e40255ea0ea66dd121672fd22423326
    [v5] https://github.com/paulmckrcu/linux/commit/9b13bea0966c498629e221c3022a591cc88d4c57

As Paul mentioned elsewhere, the [v5] patch misses tags from Boqun at the moment.

HTH, Akira

> 
> 
> Have fun,
>     jonas
