Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEB1F30A8
	for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951360; cv=none; b=QlFoftNuk+IFrjB4mD1hvnqC4KwIDh8BGD9pDAxTpJZ+gl/6GU9pw3De4yKVEzzIeduhdMua0Rw6f5HArF7/g5H9StpHX9Vk889n98zjtTf3iLaPui/GjEwI+RL8EzLawEAHX7zXMEv52GISr9xXxU/zoI3IpkIskGLxNRN+9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951360; c=relaxed/simple;
	bh=7GbOh1uf5/FsBz6hVCMEOqk9Cs8LRbLKoNWgnC9yxZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAxqH/vRCOiWqcpBbVRkcGgjGHbYu+R/L7r7tzUExi3m6Hwg+1WTRNcPNZP0cD5qq6VxNofal59E0aVbBhJGeHbMmeGFyNViFm/zv6hbeCSEgE4yIzM//HbKzKDkCoqN/0nLXu3XLQEKM7Jybka2YELniAGxZAbvhGyOlcNGJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNDMERse; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNDMERse"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso4076053a91.1
        for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741951358; x=1742556158; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OY6tbKZVOZev3QWRR0lESJ3vzq7AhZLN6s1GzeUIO60=;
        b=WNDMERseBltUUdk/LoOVepa5kwC3k25FuyBmpDQk7ls4ApjvPmDXxgngzBs1oZJVfV
         AdZ4b8CiK5ngArmTZHaXRNHaAEk/nxSneTGw0icSLpfwAsdAKrRIozI8yPttxj9TanwX
         GjWJFsT2yUtPyQvczrkJ5aHosIFsDwmN9ZTa/B7jhe/TMPXhcTxi63EeDgVBypj/DjKl
         TCtncHg025d6fNK9YkwQSutm/je+rPfuRxYKCd0rDy0HQOsxQRsXfYhfP1G4bdNkHLcG
         qVBBkkqVhmo0/XHO/Z6bo58FN5sf/Z3Zpb6ZJL8urMBKUWaxhySn4USb/nokVkZkBJcW
         jkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951358; x=1742556158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY6tbKZVOZev3QWRR0lESJ3vzq7AhZLN6s1GzeUIO60=;
        b=Wf2YsJBCsVG7Ovjikg0z6J2HW6GLlfRxYNBr+SpUUkwIyz8rmAubDTFJ7KmHB0XeAQ
         RhK1iADTIrbhcediSBAA5M6hthWcP2d+ToWgCGsyUH+1/hUdW0QC/9lVirmthdPTlHC6
         vVakoo3fRWnBYqjzKUTOdzeBPai+ha4WdbpVPY79qm3DFD+OpKGE7xxmibKTZe9kvLKz
         3bAmh6JxYqHtIcYhPen1bO4S/Qdtpvyciuu37yBLkz6WtwgJ2PA6ByMvvkcGY9qoBbhQ
         dhBduLzbHAVkTDfLoGjjXwTbTEhH58cyW6PfJygCrn5SHLTIzcY5lQjDEQQXxrksWho7
         NYmw==
X-Gm-Message-State: AOJu0YxOK6FO47OfiWvnmpv3Io/K1Qs8dJ7glS+sMpvVGuv2elvvcRlb
	AqJSUUgVzMt1eKt0eLwnIMhYcxcv4iMmJz2+LaN8YunKCVCsY2+g
X-Gm-Gg: ASbGnctgGv+COppXfGjCd+dJfr16+ii9YLTR+7XcjFGZVbbL7gpQoNSiVp4RLk9RCvu
	nX4c7G0Sb9dhBIESH1TFoX/t6tllNQ7b3YJgDqJIRqtpdTcB100KRkEo8NGoBnPH6xGdBw81RXz
	9hjIkAZpxTpahb5TWtH8sION1K3y3SDKuOtNVXcn0tHdMHd9OzJI/qvpoUEJpdAApMZ/V8o0QGZ
	yVR6aM6+aVpxFxZTxMRDW1VjprQ3rAk9JlImN9IghJV5wH8qkxDSwZkg5/fWilPx2AdQLalJ1rA
	uydUB/Prbm0vDHwl9QfVhcZYg2SeeyHL54r60YbxJErsiBG8hBmLk0cMHEtEvu2ogVxEgooT2tg
	AmTimcIQt6HfHlsU=
X-Google-Smtp-Source: AGHT+IGQu0SoYs6EO7wdy+mHUS1adVMPnMoBGrciQlEZpJBm6ZzW/W+XGFqvm52zGdQkEqiQlTqygg==
X-Received: by 2002:a17:90b:5288:b0:2ff:62f3:5b31 with SMTP id 98e67ed59e1d1-30151dc7983mr3071770a91.29.1741951358573;
        Fri, 14 Mar 2025 04:22:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153532d7asm805120a91.21.2025.03.14.04.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:22:38 -0700 (PDT)
Message-ID: <a003bdb8-fb7c-48b6-aa1e-675af37c1e59@gmail.com>
Date: Fri, 14 Mar 2025 20:15:54 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] tools/memory-model: docs/references: Remove broken link
 to imgtec.com
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
References: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MIPS documents are not provided at imgtec.com any more.
Get rid of useless link.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Currently, a later version of the document is available at:
https://s3-eu-west-1.amazonaws.com/downloads-mips/documents/MD00087-2B-MIPS64BIS-AFP-6.06.pdf

It has a copyright notice of Wave Computing, Inc., but there is no info
on the entity who maintains it.
---
 tools/memory-model/Documentation/references.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/memory-model/Documentation/references.txt b/tools/memory-model/Documentation/references.txt
index c5fdfd19df24..d691390620b3 100644
--- a/tools/memory-model/Documentation/references.txt
+++ b/tools/memory-model/Documentation/references.txt
@@ -46,8 +46,7 @@ o	ARM Ltd. (Ed.). 2014. "ARM Architecture Reference Manual (ARMv8,
 
 o	Imagination Technologies, LTD. 2015. "MIPS(R) Architecture
 	For Programmers, Volume II-A: The MIPS64(R) Instruction,
-	Set Reference Manual". Imagination Technologies,
-	LTD. https://imgtec.com/?do-download=4302.
+	Set Reference Manual". Imagination Technologies, LTD.
 
 o	Shaked Flur, Kathryn E. Gray, Christopher Pulte, Susmit
 	Sarkar, Ali Sezgin, Luc Maranget, Will Deacon, and Peter
-- 
2.34.1


