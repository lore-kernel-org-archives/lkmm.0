Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0A34CC4
	for <lkmm@lists.linux.dev>; Sun, 10 Nov 2024 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731251881; cv=none; b=LOh7xipTnC11g76JfKQr2BpS1XxwFQ69XTIpAf+KgXp3vlwyjBwWSBPlOTJ4W/vbY4l+UbUhP07n/+6K5LFmj3o3kZYJto10P5gUHNqcEzhXG2L/opvcKoXNUXEzFj21GH/GjEFnJEQdhDVks/8cuw0f5GHQgJ556OSGS+Vz1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731251881; c=relaxed/simple;
	bh=LcTbIpUtuy4Z81nMVmgyPvAqJiaUV/40H3miLAStkxY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a19QpBdPW4L7jYutrCD+Esytvf+VNjAyofQ2Au5RtomqMVVsRgc+ybDxzzjJRexAsKbHf2M8q7fsrU0Lk09b1Pad6hBZIbW2HK/LBVhZz9sqgwK9Lob8AO0L3hBLGzw9+UBFGQtPdzry/n01npfYKRPz+44UNeX2QVcmMOjAHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNNgG01K; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNNgG01K"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so2765995a12.1
        for <lkmm@lists.linux.dev>; Sun, 10 Nov 2024 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731251879; x=1731856679; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VCteRcxFW73jIBTSDNFvUke7Cd4VTBcnPuE7xVCRgco=;
        b=aNNgG01KzsRyiPrRnRkXX+AUa9PSESr/3Z8QWrqcm683aeSl0B9bhn8Oz7t8vQkfBx
         dnKBQr+2crRBE3P6EZZyN9Ql0dtSodXErRQzZzDWm+v7LocI0xnUUI3O9U9pPhsTTfBA
         rD/I2ITB3ycVeMOH3pw/CeSGaFQ8j+/jRodiBJ7qv8qKPwXBPcplZb7ZKvQmtEhvBi16
         mbl4KyvTR819UnyQNJdf3PhT+zVjczM8+SiI33k9jxIkdXScddbHNn8RF//WcJLODY8f
         5HcPyIpU1A/kipwy5EhBMlYutQwRgLRdeaPcTdQBnshwI+L8oonW9wzc7UQI+Thwv7Iy
         bz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731251879; x=1731856679;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCteRcxFW73jIBTSDNFvUke7Cd4VTBcnPuE7xVCRgco=;
        b=fu0NbXeI+G60VHjHo2IOsyjDiwezre42xAqWT8Or9ls1354yrx7RF8iPkt+DwLEDBj
         9BK80Ks3X31mfZro0balp2MRJFQyROyxm/Nth6147Dn6khRHxg5t7OQ1H0KFRjVDevZb
         NOgnUBeMh8ZTUIUtVvGN9MMxKydHJapxGBaLUc70miMjY8QP9QfB3dH65xTov708n0m6
         UmNzpbdsjmCugxezLXZ2AsdBcejh7g2ea5mb6ANF74PGcYgMNXwW83oSslERJmVrC8EM
         z7sp8ZkOp709f2mwXE+D0dy1fd1foAazz6W/RY8PSAUqkxocIPxA6NbQY9Jg+z1gZ9oR
         5+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWPLkh13f/peO2d4QV1R6sKLz7vl/1jSjPtIwIeq8LPfRXfL6DEkinyAHnU4GT7Iv0A9OgB@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Oy8vDddFYds7HtHRRv2J3GkIHoPTsBYFqn6/3Cmer/4bxRrU
	9kWwj2aEwA2Q+q2qc1deV82h1wQFe1bGF5E4Y7qCgWyePowqylLV
X-Google-Smtp-Source: AGHT+IH+vJY8EncW+paA866s5okR7BWgRo7IgGmpsIQm/xAH4m0C9WN1WMzLduMlet1VhARiDQ5F3Q==
X-Received: by 2002:a17:90b:4ac8:b0:2e2:bd7a:71ea with SMTP id 98e67ed59e1d1-2e9b16558admr12300902a91.8.1731251879435;
        Sun, 10 Nov 2024 07:17:59 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6a471sm60430325ad.233.2024.11.10.07.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 07:17:59 -0800 (PST)
Message-ID: <ab79531a-5b01-49de-874e-718cb59332a2@gmail.com>
Date: Mon, 11 Nov 2024 00:17:54 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v4 0/5] tools/memory-model: Define more of LKMM in
 tools/memory-model
To: paulmck@kernel.org, luc.maranget@inria.fr
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, dlustig@nvidia.com,
 joel@joelfernandes.org, urezki@gmail.com, quic_neeraju@quicinc.com,
 frederic@kernel.org, linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
 hernan.poncedeleon@huaweicloud.com,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
 <70907739-56b9-4712-a1db-e55161c2a8d6@paulmck-laptop>
Content-Language: en-US
In-Reply-To: <70907739-56b9-4712-a1db-e55161c2a8d6@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul and Luc,

On Mon, 28 Oct 2024 13:16:23 -0700, Paul E. McKenney wrote:
> On Mon, Sep 30, 2024 at 12:57:05PM +0200, Jonas Oberhauser wrote:
[...]
>> This second step (comprising patches 4 and 5) is incompatible with the
>> current herd7 implementation, since herd7 uses hardcoded tag names to decide
>> what to do with LKMM; therefore, the newly introduced syntactic tags will be
>> ignored or processed incorrectly by herd7.
> 
> Thank you, Jonas!
> 
> Queued for further review and testing.  This does need at least an ack to
> proceed to mainline (hint to LKMM maintainers).

Paul's lkmm.2024.11.09a branch carries these 7 commits:

  1  tools/memory-model: Add atomic_and()/or()/xor() and add_negative
  2  tools/memory-model: Add atomic_andnot() with its variants
  3  tools/memory-model: Legitimize current use of tags in LKMM macros
  4  tools/memory-model: Define applicable tags on operation in tools/...
  5  tools/memory-model: Define effect of Mb tags on RMWs in tools/...
  6  tools/memory-model: Switch to softcoded herd7 tags
  7  tools/memory-model: Distinguish between syntactic and semantic tags

As the first commit is already incompatible with released versions of herd7,
Paul will have nothing to upstream for v6.13 unless we see a new release of
herdtoolds7 whose herd7 has those atomic RMW bitwise ops and lkmmv2 variant
support in time for the upcoming merge window.

Luc, I have no idea of herdtools7's release procedure, but is there any
chance for us to see such a release of herdtools7, preferably by the end of
November?

        Thanks, Akira
