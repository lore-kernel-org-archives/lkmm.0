Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408C2E2651;
	Tue, 17 Jun 2025 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165221; cv=none; b=jrNUPSQp+rGspHAgENZH/jpWSuK9g5NSdHVOSOpo4caIULxT8YpL2Msm+9XZnAtK0IGbuBORhEQ9dCDyTADgkiFr4W6y2fDf0VRrMp74Lfqi4AOkWclBEiOhjr5In4xhjsOwVSwsjLlrh26T83k9PL3ZuOiQZ59haJPzBoWduvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165221; c=relaxed/simple;
	bh=BGmA/bVMJ9ftGI7TvxXUi+QwAR8gKmoQYzQ5tMnoBp4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=knU5svUtRPIb5aeF4dktoDOhUKW3EaE+/A2kCryX1zrP9NAUZztUF6RUs07cLzMRSM9B9CmRyoxFyBdBbNrv21Mcdw7TqbfQRkzemLtUnISc4KP9SOzkbD+mu0/CYwiR+cme3cL+P9rwjRX6eQ6DGuMMvjMm0pm03aSI1FYs8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KODCWbnI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KODCWbnI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d6ade159so47263115e9.1;
        Tue, 17 Jun 2025 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165215; x=1750770015; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGmA/bVMJ9ftGI7TvxXUi+QwAR8gKmoQYzQ5tMnoBp4=;
        b=KODCWbnIquni6IB7yGazdQeorvjeqK3PEMHkrAYraaiT+ntwpuZ2LU4fEOnXzrLD7B
         T+yhQ9bp9d+vtpfovSviYesD/TcDTZ4Bq5CvtlzjVJA76GXP0iYTeJBDdnIoviLM3o29
         4HrxT2ds5GougbINrIAud2c06FkHpqm66XJbV4TkqwP0hu9U/I6zbqLlpWawNJPcyZZ/
         xailNuiw6P0L2iei/CERq3cingi5h98+ercFshPESQdsPupFwr95NhBAyig/Okkga95G
         vcdRriCv5R+JlNsqZWZ3iO/p3Gji6Pny2/Cq9OnXyRi1fn/+x0WTHRH+iTt0IDXwzeB0
         iYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165215; x=1750770015;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGmA/bVMJ9ftGI7TvxXUi+QwAR8gKmoQYzQ5tMnoBp4=;
        b=N5NIb7tWbg7px9xKvWupySnEhofiCmL79MiLRLsc8Lb6NJFTKuO6GJTUXfVYt+XDiO
         6kb5hRlL5lrO1DjclklcnhtRpSe2I79CGouRemj0eJ+ceXni+gXrWKUMwxyHF7sdSYdI
         1LgjzEozaLXZLzA/7fUrO6VB5NWKmjTohKzdq19uOUeGj7zaaGzutR/hPqrb/Xne6UzU
         60W0EXvjdnnlldxLe1naLMt+qUs5Yn+2bCaZ1X1Xp7Pvk3Mhirl7JQOEwLZelPRQcVjB
         4n+fHRTgpnufgOrfOZLF1/OxMCEPweoRmTLeyhNZWmm9IjD+2aBrfW31FLvv6Y6+FRAH
         KRSA==
X-Forwarded-Encrypted: i=1; AJvYcCUN7nqXCoROyo4EqpvoY5DbYSsQ+Nj3oEkc7+Xc58JEc+0COuC/cw6r7iJTnhn9lkNtI8Vtv+0MVAWsR6TTVJ37lHmmxg==@lists.linux.dev, AJvYcCXUN4yCr9agBhcbTDIHfgKubwNGw/rkSCf93AQKfIQ0Wi3I9qeKOpDpEY5rvz2paEXDyBPePA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycHkIBMCYiXsKoCJDoXqEhN+p3IjQlxe9Yfrn3WGYKynDrhyyE
	4EdvicSjKKj1jXgijBazm7HRQzVEZHf9vladhUQ+5YmABxjTPjXFsEMD
X-Gm-Gg: ASbGnculhabCT+RSvfPg92KpfXnBuUUdCbKzcU8T8ZhrVMLZPCMh4KlbVjs2ojFZGar
	XxjrS52ftHWXF5QCjrjad2HsTBkYCb8oaMeMQoUReWOr500f8D1msifID8TGwqK212x/C+nWJab
	D5GeBxzqwg7KwrfsYxa+ZZqLp5jjRrHM0kjGIoiruLz1EIwLgoQCZXwAHMx3gfZ5XwAALHtigzF
	eMKq+27l8IqwZa+B9DYq8eHD8D2GaBUqC8pCZSouNEWFDw6fvfJOFzhtUu8bzmMamxxUurv+6Gk
	HN3gcVeNV5rBs8koWOfv9n0A4O7QASvhFHckLgdTS+MA6jqyvYD/CvrFxnQ44y7OLpdYlw5nAdc
	6KLrD81NU0A==
X-Google-Smtp-Source: AGHT+IFdwscoFtKDmQDDxuggxEnGBwA789Okb1t+Dl/aRVj/6eU4eWq9IO95AQuPjQQagJ63A6hoHg==
X-Received: by 2002:a05:600c:1c12:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-4533caf5e9fmr139557665e9.13.1750165215199;
        Tue, 17 Jun 2025 06:00:15 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e169d90sm178458845e9.32.2025.06.17.06.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:14 -0700 (PDT)
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
Subject: Re: [PATCH v5 12/15] docs: uapi: netlink: update netlink specs link
In-Reply-To: <33f4626404cc92ee3f3aab481a8d163e9b4a0f6c.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 13:46:16 +0100
Message-ID: <m2tt4eilif.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<33f4626404cc92ee3f3aab481a8d163e9b4a0f6c.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> With the recent parser_yaml extension, and the removal of the
> auto-generated ReST source files, the location of netlink
> specs changed.
>
> Update uAPI accordingly.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

nit: seems like this could be part of patch 11

Either way,

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
