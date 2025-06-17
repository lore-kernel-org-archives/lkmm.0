Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDE2E2EF1;
	Tue, 17 Jun 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165213; cv=none; b=LB5cGIXIM8G7Exb5pUqL1B7+vYtIfxb8/ftpZW4TjRH+qCMjYhWcTiymWTpGaT3OCFvGWqR1ZI/Szop/3taOhfstyaBYvNiENaTrKsD7y5yR6hxbeq8bAM8d110r6jenAIvKjATMO8Q1YtsjVgmIiMg+m85U9WP9cVtLjwyv9eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165213; c=relaxed/simple;
	bh=Tn6DIXlUhv3B7Mxsw2Vcugb8YFMBuoDehiPuJhnVEK0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=pEkX13F8DqoUwlbSGGHZB2R7J2qkJpAC9jiCMjRc1AQ/QVd7XuL5jbahRYHDn033WTwtDDQCvD1ceU7Ox9MWemTqFVzdxWMvdsdVZsufBU7RvHob4TL2P1U7RQ195uXjx5ClehXHGUqvmCKh8LEIu3grKz5I3Dy+bUMSkz45Ro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYPKJKY/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYPKJKY/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a51481a598so3328389f8f.3;
        Tue, 17 Jun 2025 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165207; x=1750770007; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tn6DIXlUhv3B7Mxsw2Vcugb8YFMBuoDehiPuJhnVEK0=;
        b=QYPKJKY/vZKHKw93ilrnOsywwveXQy5xJ2E+uhCJhebjSQB7m8/No/vw9ViGe6w04H
         GAPylhtl6DUkm4D4WjY61usfK5qCQWjkwZxpyKZpI+p3NTrPKA5k/tMhGjh8Ec9AuDWy
         +rDMDO7OY1/2Xs/NsWgBP+CtNFrWWadTifodpMS5bvMhsGHg26p/AiqKJRegnQjkKR9f
         j3o3b8DXp5mWaYkbJ0NrI3+baKwCWElXQJ0+HYxgPAxRcNKKbj/MONOg1DClJ0q9gTUh
         CzjzG0pW2WqXKc53m0xl6CXznZ/Yy/2rK3aQl9heR24594udBdn7AEV9ztmtd2KKsS8h
         tUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165207; x=1750770007;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tn6DIXlUhv3B7Mxsw2Vcugb8YFMBuoDehiPuJhnVEK0=;
        b=gM7P3+/R919C5BBfkG8/DA28mwWRcb6P5zQuRJKa/JLauEI4mZr2pPzABzn6/uVFo0
         /Vkvzl2OSSG6Rr2qQBifoHxPX7ODOCbMES4wQhWLVXDe4rOBdvKzBzj/zYF/mvvAEf4E
         9H7jnKr8eBUU93X5e+5T/7vo2uQe50YE4OVL/QTYGlvGJEqmFaDAizYnjiq7xhz63Utn
         2lMtAn+XxXN5ltDG3w9Qt4BEZYevknFfzUTE/g6XOvb1bYmygBosB3dsP2O0uPDYb/zc
         h2H/us9drO33nmpdZVnRSPVW8zqlBjfUbEXqXO/1LMNlk8FuRkc8LeDpsVp9mOJwlZDF
         dLxw==
X-Forwarded-Encrypted: i=1; AJvYcCVMH/X8BqDCEXHPYgScmfIv6a1vr0yAXxLMr5M9cxq2gUPd+zntoaBoK4XnRmrhbsIp978lrA==@lists.linux.dev, AJvYcCXA2aROUMxmMKEvTgY2Ha9WPKOOdX2eNnuopo8J3o5ucz/F9FOjDovHI3LScndF6VwbF2gWJ8dawmG44bTK/fNsRdxm4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMZ1bKL3zudk2s4WA8PXHRIqpR7U4USk2efdaMo/9gYucyBSVt
	mNey4D0LKfnZmBYJKod8F5/s+SdBNgneiMsA+uISmLcX0or98eh0jTBP
X-Gm-Gg: ASbGnctd5fHeTeCpXrTubNDGfyMYwnvcuFIqhzrcx+g5EBVAm9wCplSDOTtZxpYI7FV
	S5pcaxUB70rJ/M/paR+Wjn+JC7CVvH6/HMwGeR2Sq//9gsX7OEcbOhU4YT7vl6zBTBqFRnlqAm2
	un9ciyykeOTQymQoY8zr5WCysmZVSv4mTUpmJgFDhIc1PrwZTHBhfDEDyYeq7UZiL7DdEx5kKu2
	529xXc2puhPHODUjkb9ThgSplpdzkR/g5DLCsFzrQ/mrYJix3i8vsHF+nSODO+Q90+X9VDRKEH8
	DavD/J+/FEHkSeT1sE3RGtnpuWUSVzLW4rUuK+VbkuPILOJrdHyt25PgZhciTSZtCi1ViC/1Mao
	=
X-Google-Smtp-Source: AGHT+IFkHumuNOw5OMyit+NMq5xP3L+6hRTHFZsw1kWHH1x7SYNjE0rJe5ZLM7vSjscgPl5z/3ZYAA==
X-Received: by 2002:a05:6000:178a:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3a572366706mr10967411f8f.8.1750165207082;
        Tue, 17 Jun 2025 06:00:07 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60f5asm13787720f8f.25.2025.06.17.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:06 -0700 (PDT)
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
Subject: Re: [PATCH v5 09/15] tools: ynl_gen_rst.py: clanup coding style
In-Reply-To: <b86d44729cc0d3adfdddc607a432f96f06aaf1be.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 12:12:28 +0100
Message-ID: <m2bjqmk4f7.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<b86d44729cc0d3adfdddc607a432f96f06aaf1be.1750146719.git.mchehab+huawei@kernel.org>
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

nit: typo in the subject line: clanup -> cleanup
