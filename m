Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BD8632E;
	Fri, 13 Jun 2025 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820252; cv=none; b=mZcIjI5XzG/Zyhyk/XfaV82uiBLgTzIhCWRZTQkZ8LGjFqjDMnwTse9mtzBYsmkPiz0Zy9sbZwY0QsrpyA5cd+3ssq7+sWATMh97nPlXaS8zEUZ5GGQ/C9BxjS0UpirKrUuZ/bRWa8wIcQ0gl7qUdW6gXQCYOiSPHoA5VSDG0p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820252; c=relaxed/simple;
	bh=bighsJukvHCmbsxtrGb5PYuln7NuXuTra9dKT6j4s1c=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=lwZjbzG7LNuRKF4KU8kuT4QLwZGM072TYG/keytSop1HHlWxJdGBY4kCDoN34KhrVecht441HJFleF6nIypfHjDhcjHDmBwYN4BB5o6AIFguvSolLjo8avda4PsTawgPRmPwlHa3YCxIm2IBDBtcjUZSOaUFmPeBe76+cUuuGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXWftKk3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXWftKk3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so22687345e9.0;
        Fri, 13 Jun 2025 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749820248; x=1750425048; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLilsl7/9YCC/BIaIFPuFIBhon3SF7Um1puCDANK0WU=;
        b=GXWftKk3dS57qRblPZUXHIq25ZIrOwaS1QC6svbPEBTT1LbuzIxFnmiy7u/SOA4T2n
         qY7gCEb+dd46v8LALZSh2wrVhCosu8QMrmgm07Dg/Szg1Jro9b++3Q0TzjRkLdTK2TpB
         a1tSmg5gOvcPwX2N4Pm4sPQXFFutuqvsZOQsIjIINbcHNtAdM7IImaSDk/8MY0TUZ0v9
         5hcTabtKf08n4JHW1XXwJp5vLI/iBSvBK3cRCmYWf98PWSzCtEnfnQ6zXxvDjr5YE86G
         mv6olWJMZheBQDjMAZoTeVTSkEeBsC3cXEoNA4lYQJyB2OtJLLWYmBtz5fRmUJRhgTNx
         Uicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820248; x=1750425048;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLilsl7/9YCC/BIaIFPuFIBhon3SF7Um1puCDANK0WU=;
        b=PyrXVw4kvnIKmH4lyWmBJU9jVoOGzHQ6OyF8qS74aTONuXdOOjgXE9fhT3yPxbw5+y
         avUucLWqMbjM1Dx3Bs6JN7faUebO/N9wwRo74CtYhEBh3k0TZA2z4PHiWs8fszwg/j69
         Hl/tBqhC9slcA5w2wScDWCPAghqHTof/ZiWN4vZFjOwzsfj0wh5KJguK6DtQkD4GKE//
         nR5TyVnRcvqD2ZOEpXrK6ChvAthnMgjhNBm8M3LhfETlpjTegMhbVGJoZwS6bLwAPF0/
         IGq8TRqr14YsOZ93vyJGPskGibR0lpHBfuWKp7L5FGg07ZZ48bPA2zj4gn4tEDXsYoL8
         hiMg==
X-Forwarded-Encrypted: i=1; AJvYcCUax9PXl4UqkyJeyJL8nlV8sUBz6DWwFOQIcDJqZQ5vmAsrJSnIXUnyx0T1eL7zpUOsfu539YTaAcPsI0Xby8g7MX7PdA==@lists.linux.dev, AJvYcCVG45Sa+GkTBKXeiYHFAnMss0qKvMmlb016ulflTPdomDm5NWs1nc1gCZ4AUfBYHuhjlrUjEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+eX6wvnQqPW6GbeHG+ot75yPsg2Un4pWwgwlp8ULd4K1BmdiU
	MqZsEYYw3rioisFJzXayS8Jc87WG/RvcfD4LzpkwNWciDfRsjvrc2F1v
X-Gm-Gg: ASbGnctArxu10sGGUEYZFStupFF6LAqIi7poYYf45zoGzhZLnT4Uh32u4LParhDM7nG
	KSqhedM/9hOP+6a47eXDCBUeLFi8ONjreOV+ROfs4iNsE/L3+tj+RrOovDTqEdPXH9hZSN8AHz9
	c84jjWY1wGT/cbMMubjXVqsgJQEPWHoLJ7H2+AkkDU0r/84WdaHr/1CNeenbKq7eg7iLi2Z/reE
	mxL5UABwtCLGZCjQQG3zNWgmpflIoU+8C7bj1/mYCFHWcTVsYZC1/6V8uLOJXTkdgps/j9sCmRk
	yF9uF7krrDzs3HBL1QVUWiKUSgHFnrljZ/P56GGwFYqmgRR/O9WpFBKj9Vbbn156ERz91oU2cgs
	=
X-Google-Smtp-Source: AGHT+IGfVZFiAggq9Aw6BMb9XwyEivoymyFHVpaowGl0cVCFRIr9NgEggsMqUnBqGZmFMU5CQmtjhA==
X-Received: by 2002:a05:600c:5908:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4533b235e16mr6682555e9.2.1749820248270;
        Fri, 13 Jun 2025 06:10:48 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2384cesm51114175e9.16.2025.06.13.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:10:47 -0700 (PDT)
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
Subject: Re: [PATCH v3 13/16] docs: conf.py: add include_pattern to speedup
In-Reply-To: <62f2de3a195dc47ba6919721e460a8dd7ae95bc3.1749812870.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 14:02:55 +0100
Message-ID: <m2ikkzlrpc.fsf@gmail.com>
References: <cover.1749812870.git.mchehab+huawei@kernel.org>
	<62f2de3a195dc47ba6919721e460a8dd7ae95bc3.1749812870.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Now that we have a parser for yaml, use include_pattern, adding
> just yaml files from the only directory we currently process.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index b8668bcaf090..60e6998e49e1 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -222,10 +222,13 @@ language = 'en'
>  
>  # List of patterns, relative to source directory, that match files and
>  # directories to ignore when looking for source files.
> +include_patterns = [
> +	'**.rst',
> +	'netlink/specs/*.yaml',
> +]

It's unfortunate where you added the include patterns because the
adjacent comment is specific to exclude patterns. I suggest rewording
the comment to be relevant to both.

> +
>  exclude_patterns = [
>  	'output',
> -	'devicetree/bindings/**.yaml',
> -	'netlink/*.yaml',
>  ]
>  
>  # The reST default role (used for this markup: `text`) to use for all
