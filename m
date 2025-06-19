Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011B21FF33;
	Thu, 19 Jun 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335605; cv=none; b=nYv0UvBnc8t4WDrhQcBiJ5fYM9hooY+wJRn72eiS7b3+wNtpxnTH7fbYCNB0EVB7bIWjy+3rUqg92R5RYSsbuc0iHmccusj95ayFfddcRQbd10saA6+KJ1fKDaZPRIfcJ3iS/QWT04kQEf12JfBhcdKKKExWAA1szp/1xFTOA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335605; c=relaxed/simple;
	bh=SFVUled2DNWsQTvMSa+zPfq1kFUaKNFnt90w8B3bJxA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=Q3AWK3D+aYz8sNY7P7QrRGAAda3a1FQ66PapvSgw+evRpNT6nQOQY6D1pKHPnauHi8tLqLFzWRweWF1jDCEJ/oVaUbC386a1iPcv3lErxo9gcmmjGYc8ukj2G0vYPa/N4KT6KYGq8CrB3uTgKhL+d/06KUChAm/Ge4hmilSO7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7i4r1Ja; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7i4r1Ja"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso642621f8f.1;
        Thu, 19 Jun 2025 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335602; x=1750940402; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFVUled2DNWsQTvMSa+zPfq1kFUaKNFnt90w8B3bJxA=;
        b=T7i4r1JaFBgoOc2adq3vl1HMfsTe9PU43JRXi8uG8g1AOLJis6l5IMAp8CM09TqUdf
         nQ6ezEi4AnB5wRNLmggWDmcS6kcTvzxhdNLW+Lry982NIq7tu1/UT71dcAlABNznIf9Y
         bdUkbMbKBMGDuOJB2wKVgcGG9bRCIoL0PkMX58QBXhYwxNbTHE03g6IlIMwdoAPDrkYY
         7ffOJcluXmi/PDGHMUWv0kVZnPUgPhY5jh1QlG1lCyQkNf5GSCbJT/0CfWW1neGfdPJW
         DTeH97/AlaG1fzZ6Vh0KQ6RpRkwge3HV9NfYZvFn3WeLA5Z/bw6Jwe44tTrpQxn1y9oH
         8kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335602; x=1750940402;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFVUled2DNWsQTvMSa+zPfq1kFUaKNFnt90w8B3bJxA=;
        b=l7Ak3PF17IXQiV+wZXjyV5hjfLL4U64BIlwWrn+6qCKDCjvLFB1zWUEUySRgaqSYxb
         U88Kx2ii6hiXhH9+Tnd9l5QgD/H/DU5gowBk6e/bf8K74jEvpuz6H7KcbcRRR6o0ACgP
         NdYjkS0x379mTPRriE8B1AEF7BLfg1Y1CLS/1jD04thNFbe0g6WOawUM0SBt1MsJsa2C
         CUa5f9d1vgNePrQaF+LI5c36zxs2Kz4lETakeVFhtV/eBC6Fdj1mPxVNAGqyiNqPwDwG
         DweDAd/lJEBvhDCDuDJ7nhs5u3OAzTAMWKb4izkWmnqm9N1KWqsYYAUygWx2tL463G0P
         ZX1w==
X-Forwarded-Encrypted: i=1; AJvYcCVev6dO27orZnul2/Qz0m334Sy+gD8OLSZr1tvftklmDRNudciuOUlq2Cdrdc4fWb9NvySNbjkNyM3okxeWdYetj+hPVg==@lists.linux.dev, AJvYcCWDkCq1nIyuZRoHn+i2kgc2mps8wDdoZ8CnsSRbc1OIRv2YEiyBbtlXYOLtgZPm9Clm4r+Swg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyhDmADnGc5RacXqEt5Wshw2EqZLis4NzsqlmQ2+Zm4Vku4sjO
	TtYnmBeANT5NPWdKZVB9wvhNAs9Kmn61N9Ge1TnS6LgLmMVOcnihGNYhZJZyAkYT
X-Gm-Gg: ASbGnctoKXkLZmVf89b1ADWVwRU5g/aj0N2D51QEorp7pmfiVSE4WSKpMP/n5HFFl7E
	AJQk70xVVgOGIPU2hRrXr1Om03lr0/ToteZ9phqvLDI0zeaF0PGo7a0OU+bNQzx0gOCom/BldYa
	9LsABrOShyS4BFYyux1KLvO8pR9S5f5kJvRpnaDLZmM8n+cz1pRHl9zBgHHon1DZUHx/xNvXtY/
	0OjJIHN3tVJi07jzzo/mI2J4Kw9FzMOHXYd7Obf16U7g6BlAWgbQLQgZPbuUD6cPsY3qb7wLNEi
	XhR3G63jBv3uig27SHBAnZKQtXXHr1D9HYxiw1YP1ZoDAMqzjMzD1HvbiJ1RFqGh0w2YxOg7
X-Google-Smtp-Source: AGHT+IHrpm5jxLPfVnVLJ87g+D7u7rNwqCS0PrAflkDvNv7ygn4IyA1hW4bxGY9gJHusIbAXcvODMw==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr15927457f8f.1.1750335602053;
        Thu, 19 Jun 2025 05:20:02 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99cad0sm27567735e9.32.2025.06.19.05.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:20:01 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Ruben
 Wauters" <rubenru09@aol.com>,  "Shuah Khan" <skhan@linuxfoundation.org>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH v7 06/17] tools: ynl_gen_rst.py: cleanup coding style
In-Reply-To: <901d329a2d679e05572eb399b39418a48a491844.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 13:04:33 +0100
Message-ID: <m2ldpoey3y.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
	<901d329a2d679e05572eb399b39418a48a491844.1750315578.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Cleanup some coding style issues pointed by pylint and flake8.
>
> No functional changes.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
