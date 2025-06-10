Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A3221DAD;
	Tue, 10 Jun 2025 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749521518; cv=none; b=AGbVTZJK7mZ0ZrbN3LRveeJrDrwc7p7g6pyT5qZv2nOzFQRKxp56FRXwT6yK/PmPPedv58g0WVL7bFr3CUB2uA6drK3islCGAll0Rogt3grBHvCJ+SZcUJZnARa2jdjoRxlta0fIGR3kbpMyQL7L3Hz8zW0WxgzzeV+HRCX29T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749521518; c=relaxed/simple;
	bh=tATsaWv8XZP6b8qRxvl/GSsSgoUtYmKnSYOHYbtcquU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t53qY4B5WeIN9jBSt7o/URIdbYUSHBYOPCvYb2CkbbuuPnG9TrkpBbUFFVPHswmALw+RpijG1S3IBS0j53ZdMyVA17QoKlcwcdE1wn7MydwmWlxgjdjOlr/OYXSBHQwsuqCQ6VJunilk7OBRPyaCwDXbaY/xr4qOvcBIKApiYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmhOWcQn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmhOWcQn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso3589485b3a.0;
        Mon, 09 Jun 2025 19:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749521516; x=1750126316; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOzjjX69zeAqzNGoS/8mD5e48m9h1ILJMbdVXJtaK8k=;
        b=XmhOWcQnWk7pjXrsv7kY+HQ/WDDsFmcp4i9tglyhoJJhKq8n+sanmhfnj++7FDFw6u
         iE9KnJXGq4nESSZKxxjSWdizuXU5hy4zqj1fNBZZfKLhGvzBtv05BnYtES7hNgrL1b6a
         EKluumpF3wudcmTaC0cyftqSkX7sqJePWipPkVvOMMeYuYLrqCrB3hl1oeTuDgZHo9gv
         mTizMiarTMk/W28tqR/oSn4TNbMUTeKY+P8Vcy5NIOyiNOW8/a4BBuqxWQTZfiwPpcni
         g7kasMKPaLGB87IfqROCwh3uhat2qXWbc/vHO8EDTo2xUppHSpKvlVBTvG7fzg7RUbQb
         VaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749521516; x=1750126316;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOzjjX69zeAqzNGoS/8mD5e48m9h1ILJMbdVXJtaK8k=;
        b=Ljr3ccWW1l8Kktoiy68S1Y+qX5dz1zFYcjhBJOWWpctEXxSUvcS+/rA4Tztw9ZVzL1
         SxXsfPS8cf4HV9T1LqziuqwUZSImDk4ShpSGBDMq3j+QmgyVtFKqDOTUUg2+H5vz8c15
         s2nXfLJ3Wti6Trq4qZjXT9Xw6StVok7nK3820iY1Z6IFSbkxr17HJpFJnGSIhOOmIiHC
         q9CO4dPY4MAD8pqkAHHNQo19WfAM80z5077cHZlKwOa5BNjSKA1hxsA9GY0JIfcV0P0b
         VJZjGdJcAY0Hr6SMGXoflCREmqgErhj6xK7mRxcCxkb91DbgM3LrJcBrUYSeZS1DRmnb
         NtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZIYWPr29sLZGLW6cjI9iRk+bIECnSXF0czeQMXQ/DK2FG+fLyoZYO6jvIjTpEgw8YvFHLa5I3Ut6xb+tdf5Bg4wsfIQ==@lists.linux.dev, AJvYcCXVZE+PEDYMwEfWukI5TNN9EYuK/X3/fTLBAvhjn9GAOFhCvpYeRAKOdYNnb/1wT+QoWlS3kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo1aYSQFHerf0HcMV6bG26P6e7uEW/kvsXEk+mI6jqS8JpNPL2
	CPQLVy90WZ94kWJrOfnuHpbnHW1o1dOUA0tIPpi8QpRVCezYQkE7bTsq
X-Gm-Gg: ASbGncvqyC+EmbJm8oEEuDl9UgjGLAZcZ93mut4M+G4VNyaX5WAYnhust/CpyDYcs23
	aa9uSVrN0ICtwzMRjJJCALkSq7qxFFYxgz25WCEusBvRv19vju6hPTHOqG8K+mi62Gut0KGeEit
	MtALcMBZaQjHM0yXeTjTdDhbhhNKPEpXwxcXHiVEOZo7Ye3GWnsHqrhwGNIAvKIo0GNcB/D0IHs
	CQT5/bI/VFm21KEqENyzS8IaOXQnJpzrBw8iFVeL5PueLabtekoiSbGXaNJiYjwz0advd4Wvudl
	HXEbZBprzh5ebqM2sKuT/ASEsv6h282irOcBzioz8eMdpr+3gGvsdxcFJ5UFynL4Iq8OMD/2EGs
	y7jRSOMosnOyLWfqkO8zR85aW2RRUfrHZK6rdZIxYNfQ=
X-Google-Smtp-Source: AGHT+IFinisgc3J8oYpqhY/ibzPdRQH5npX4nMOvZpgH24ipzQnojwu27/upFNl/pwypgIaYqctZDA==
X-Received: by 2002:a05:6a00:9141:b0:748:2b23:308c with SMTP id d2e1a72fcca58-7482b233724mr15790672b3a.14.1749521515721;
        Mon, 09 Jun 2025 19:11:55 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9a0fsm6382936b3a.155.2025.06.09.19.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 19:11:55 -0700 (PDT)
Message-ID: <c1e93b99-21a1-4646-af6c-e05330e1cd3d@gmail.com>
Date: Tue, 10 Jun 2025 11:11:50 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] lkmm: docs: Put LKMM documentation into dev-tools book
To: Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: mchehab+huawei@kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
 stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev,
 Marco Elver <elver@google.com>, Akira Yokosawa <akiyks@gmail.com>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
 <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
 <87ikl48te3.fsf@trenco.lwn.net>
Content-Language: en-US
In-Reply-To: <87ikl48te3.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 09 Jun 2025 16:03:32 -0600, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> Currently, LKMM docs are not included in any of kernel documentation
>> books.
>>
>> Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
>> into the core-api book") covered plain-text docs under Documentation/
>> by using the "include::" directive along with the ":literal:" option.
>>
>> As LKMM docs are not under Documentation/, the same approach would not
>> work due to the limit of the include:: directive. 
>>
>> As a matter of fact, kernel documentation has an extended directive
>> by the name of "kernel-include::", which has no such limitation.
>>
>> Rather than moving LKMM docs around, use the latter with source tree's
>> abspath passed through via the "SOURCEDIR" variable which is now defined
>> in Documentation/Makefile, and make them included in the dev-tools book
>> next to KCSAN.
> 
> So this fell through the cracks during my May travel, sorry.

Thank you for taking the time!

> 
> I've taken a look at it now ... it adds a vast number of build warnings:
> 
> Documentation/networking/netlink_spec/rt_addr.rst:28: WARNING: duplicate label rt-addr-operation-newaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> Documentation/networking/netlink_spec/rt_addr.rst:41: WARNING: duplicate label rt-addr-operation-deladdr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> Documentation/networking/netlink_spec/rt_addr.rst:54: WARNING: duplicate label rt-addr-operation-getaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> [...]
> 
> I haven't had a chance to figure out *why* it would have this particular
> bizarre effect...

I don't think those new warnings have anything to do with this patch.

This is mentioned by Paolo at:
  https://lore.kernel.org/495e43ef-ae20-4dda-97c0-cb8ebe97394b@redhat.com/

    My understanding is that this rename triggers rebuild of the related
    doc, which in turns leads to quite a large number of htmldoc warning,
    but it's really unharmful/pre-existing issue.

, and Donald said in his reply at:
  https://lore.kernel.org/CAD4GDZw+Enkd2dA8f7pNxMadwURFd_tHv1sUwkXqFqxsOquHQQ@mail.gmail.com/

    Yes, Documentation/Makefile goes the extra mile to only try deleting a
    list of .rst files generated from the list of source .yaml files. It
    would be easier to just delete
    Documentation/networking/netlink_spec/*.rst which would be able to
    clean up old generated files in situations like this.

HTH.

BTW, I assumed Paul would take this patch into his lkmm branch for v6.17,
once all is clear for the new uses of "..kernel-include::" with ":literal:".

Thanks,
Akira
