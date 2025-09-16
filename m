Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBF32D5DA
	for <lkmm@lists.linux.dev>; Tue, 16 Sep 2025 16:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041941; cv=none; b=qrq7IUQ0UvG/EfijvEJcC5QmIxDZiqgQfs1U9hPxnvSuFOo0B/xhvkmiJK+aoqmtxQNyscCHgeMYl4Bavx/F+cbSNAGGklGzeoNRvo7iV1pjIZ5gAi9YUGVkykO7RIGRNlY+27wU4+ZDaa9DVktK4YUIveu8g8LdlatzdqRA5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041941; c=relaxed/simple;
	bh=1ESSDa9T5TZiLkRJ/FOm3n3uUjBAWGWKFOXKlYOnIc4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LUUK8qwDhj5JxIJ8fptAa4eWjIdJ2JovtN77Y5AzXbhvBi8mJNTzK1r94HO2yLySl3ZzxwjWbrRN3oykvJ1AcgdLEr2VkBIvcSOXrkZszLdl4f9F+1HOiiQoKAIsmAhkqS6QQQWafmDF2CoELmgJl0nwkXBD71Zs1I2NXONONXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=COKWnnlP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="COKWnnlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758041938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/EZc4VD3I6Rvd/hwPueys9LNwaukhCSs8uHwuxzrAI=;
	b=COKWnnlPOwnFtQjC46qEtjLXrK2/eV+ZT49zVq4CvAzk9dZFtd6O6BpJt2fWRogtL0PLQK
	xhF/BTnJhMDJQNja2jxt3rI/2TlaYouazvFQ0wMRLC/ZpwqUBORj2sk6JITO6UzS7xhUSX
	/2IzgP5J8BMv1cjF2wu7uhHxYA+zClg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-Wxbsj12SMWay5qwNq38NWA-1; Tue, 16 Sep 2025 12:58:57 -0400
X-MC-Unique: Wxbsj12SMWay5qwNq38NWA-1
X-Mimecast-MFC-AGG-ID: Wxbsj12SMWay5qwNq38NWA_1758041937
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-77766aadfd4so34200686d6.1
        for <lkmm@lists.linux.dev>; Tue, 16 Sep 2025 09:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758041937; x=1758646737;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/EZc4VD3I6Rvd/hwPueys9LNwaukhCSs8uHwuxzrAI=;
        b=GxPMBJ/znuEm92nIYR2tGQsi1QTZMI9JOXK3Kdr8Uj42OBIRG2PpyFBFDeELVM71D4
         oCdDeBp8MGgIFrx9r+hYb/xO7ZTvNgxfGQa/zil3hILREEfsRD5V8cg+uH+ECCJW7l2c
         8s1+twZyutbhk0GtrS9Pm/OaVm7tDBvce+v+7RuEdBhO8MlbUN7zNu52AAR0nqFhBw82
         SRn+uObPYr4oVTr9vK9zF2aylLJtxC98V/sL+vUhMojKBDvXgQxyw44kFwiniaCtYWzq
         xPNI86/CujcKq6npuQL37TqXIoyGIPHY5uE49r+TIG/PwvzbldTsEoQ6xA8YwK0sN6PM
         91wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD9NVUrNaFah5q8x3SI5QNdlMsIoFNfAp3s3rkSsS1X64UMkJ6EqTgn/M6Na5bIVk/bdx2@lists.linux.dev
X-Gm-Message-State: AOJu0YyDCTSilQUlpDgSBTYgUaP1QpS06XvEnu2uB9/+eC5JiBm1TLrQ
	e+wvB62xnCztceP5/u97u5AZJWVrDscCc3jpMeZScERmLv7Mwja3ZZYjSFVdgkYmMtkv8m8A8p2
	wtDQVAHgbCWLATj3XWhq7G6OzTGEzJLeCTlM/2JcDNDD+QVaWEvTnvQk=
X-Gm-Gg: ASbGnctMZXq25Bdor7v5Wd81CzoLY7sQ/yDbuImjbS2aNVdrK73gBmQEVqeLKQpzehH
	kFFFriJFo+fFu2zEBFXjtyGjUczL/eZiak/oLv1r7hiADEj28Q7GAKavm1XhHJLLgu1PtMRXpQL
	bNzzI8zmheR59OzdIw0BASoRC8COd8IAP4RHJGaJcjieuO55tSaF3xTLET/m5o89UDrNgowAYGw
	qVKsBnwKvEEt0QiF4pwcYmJA/1FrPpburOeauPtMW/kWc2q3ThnUSOlFEFi/OTtGDXNfNF2EO+W
	NETsKhp07CSNDYLRqiMuAHFEhnZrgzNLhq3ExwmWzRcPa5JjC9hTGxYqBnqLLSilpYgn6vqVT02
	LwDeyOKZ6uA==
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-767c5622e1bmr202158776d6.58.1758041937108;
        Tue, 16 Sep 2025 09:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxei0FEEqUvZjdq9XLJMNLngrWTypPoizScTxs9as/2F2uiQ+je0ZPIhRgPrZ72mzjcrKQNw==
X-Received: by 2002:a05:6214:e85:b0:758:2117:887a with SMTP id 6a1803df08f44-767c5622e1bmr202158396d6.58.1758041936534;
        Tue, 16 Sep 2025 09:58:56 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7843978ab05sm37136006d6.30.2025.09.16.09.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 09:58:56 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f971b01a-2d76-4511-8880-0f4de2a042d9@redhat.com>
Date: Tue, 16 Sep 2025 12:58:54 -0400
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/qspinlock: use xchg with _mb in slowpath for
 arm64
To: Peter Zijlstra <peterz@infradead.org>, pengyu <pengyu@kylinos.cn>
Cc: mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 t.haas@tu-bs.de, parri.andrea@gmail.com, j.alglave@ucl.ac.uk,
 luc.maranget@inria.fr, paulmck@kernel.org, jonas.oberhauser@huaweicloud.com,
 r.maseli@tu-bs.de, lkmm@lists.linux.dev, stern@rowland.harvard.edu
References: <20250916033903.3374794-1-pengyu@kylinos.cn>
 <20250916141032.GJ3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250916141032.GJ3245006@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ym9F7QQOFfB10YbC9Vecq0d_1wRx8nXGxHYwdc1DeKs_1758041937
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 10:10 AM, Peter Zijlstra wrote:
> On Tue, Sep 16, 2025 at 11:39:03AM +0800, pengyu wrote:
>> From: Yu Peng <pengyu@kylinos.cn>
>>
>> A hardlock detected on arm64: rq->lock was released, but a CPU
>> blocked at mcs_node->locked and timed out.
>>
>> We found xchg_tail and atomic_try_cmpxchg_relaxed used _relaxed
>> versions without memory barriers. Suspected insufficient coherence
>> guarantees on some arm64 microarchitectures, potentially leading to
>> the following issues occurred:
>>
>> CPU0:                                           CPU1:
>> // Set tail to CPU0
>> old = xchg_tail(lock, tail);
>>
>> //CPU0 read tail is itself
>> if ((val & _Q_TAIL_MASK) == tail)
>>                                                  // CPU1 exchanges the tail
>>                                                  old = xchg_tail(lock, tail)
>> //assuming CPU0 not see tail change
>> atomic_try_cmpxchg_relaxed(
>> 	  &lock->val, &val, _Q_LOCKED_VAL)
>> //released without notifying CPU1
>> goto release;
>>                                                  //hardlock detected
>>                                                  arch_mcs_spin_lock_contended(
>>                                                        &node->locked)
>>
>> Therefore, xchg_tail and atomic_try_cmpxchg using _mb to replace _relaxed.
> Yeah, no. We do not apply patches based on suspicion. And we most
> certainly do not sprinkle #ifdef ARM64 in generic code.
>
> There is this thread:
>
>    https://lkml.kernel.org/r/cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de

Ah, I was not cc'ed on this email thread. That is why I was not aware of 
this discussion about xchg_tail(). It is an interesting read.

Anyway, this particular problem may be about the clarity of the arm64 
memory model and whether any microarch's strictly follow it or not.

Cheers,
Longman

