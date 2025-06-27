Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8D2DD611;
	Fri, 27 Jun 2025 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022308; cv=none; b=fPEj9LL1C+0sfVVKSyJjx9jRnz7baHFO/a2HzXAQLqBvSb1Yf0YoqqJhMCrrO573sf8CH2D2R2AN6QNuY8SmQM72TTuoLDgiT56mJoWJs0bpEas5Hm87bqcshCd5FZLrFp3kAcJqTU8WEeoOrcTaPZvOngET2UklzxIV7LyHb8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022308; c=relaxed/simple;
	bh=ppQn+qQ90LPpJSTEWumnr97tAFSmfMRRb9BDUUMwjN8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=lb8gVALNZ8fg+vcgJ2vnXtadUe3tHuo/l3mSZyEC0+u3cr3tcqfO2DqQIwnmGg9/0pP5wvvSGN2ZuDgjrHSTDzIMHXSEOrvbZG4aZzkHaKUDgDvmO7D1i+tsHtUWfGVUsRpEdUWfIcxOLhJvM/41XtJwBH000lFJkCC9zjuz7Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME4KBcZD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME4KBcZD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1174613f8f.2;
        Fri, 27 Jun 2025 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022305; x=1751627105; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNpoYqb/6Tu0KuIF/3Z4TcTfvMcxACyRbx3GldGRXxM=;
        b=ME4KBcZD1FVwgUvIVM38FPZgowKocLSZkxaG5bWcgDUXZmnhHEfDfdPt3MyHpvNfHh
         HzW8ufd03fwndBCjYveFuCc3zczED3yVV4OwhxLf3bJ5zlvAXfPYHnmd77uE9YZLqTc6
         CVzHLKdfh3THfv0lDdeyvMSHwgqZuIk84mj3yA83Cflf9qtBGjQrO67/Z1oJ7Vzh1Bum
         FBm/z3YwknItzUDdYK+A5ckjykQi0tO2dQ/unLlhBJjcJRXpo8LA2rY5OYghXFOemcIy
         Z1wRWIth43BlKrgR09eKE1bZW3Va+ogXO6ceq9Yb9xNqUEMJuPGoEqExE0Xju4M/xJTy
         lnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022305; x=1751627105;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNpoYqb/6Tu0KuIF/3Z4TcTfvMcxACyRbx3GldGRXxM=;
        b=s11O1J4ASXn42P0QiLGUwgmDtMdIvv7hWuUCTUfqy3gw7U/S/ys2cSNsECYgcfCkI1
         HQXDba0/J5aYk6b04cV7NXgYEEomVklvkTxNEnCvVGB+mrFwP7pXPtbTD3179t69QBiF
         DAB+BtKl1jwvzu55QeU6wJVaOM+xcfKdVz4QAr2WfE3HChWAeErx26jewqFts2zUZoj6
         9iSUVnMTvXezye/OjHbUBPBGaK29fkk/D5QzR9h9shJb5QthYUpyAGDZWjcivAffgSTJ
         fkxuw4jYwJXPGUn7cOjspAGLI1YXj15qa13eg/ndMqBFF3nXLOBhEzcVJheUkNTK4yHJ
         e02A==
X-Forwarded-Encrypted: i=1; AJvYcCVdiGHbN3M0/PpK1ejSHR89alMWPMS/VhPzoI2ZFs8OjK1ppN5oerqPW4eEJbj390WrmZXpMQ==@lists.linux.dev, AJvYcCVrza6GQoc/ZYFEd0/pKesH7rlB4kefvTlktHvcKrzcie4rdXGjAIOn1+4NeEXxoj4/P/pudC4G2FeiLsHF/eiHDk1Omw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKeUaj3BlIhHqmTPTDUtRjocvEPdcETnF6JEljBFi5UaCeBGjC
	sFFMeeUL3zZjV9u9EYDh/5NsuIwmkFadyMH18eECsMScOguz9xq9crap
X-Gm-Gg: ASbGncsLv+z7Tl70vIYTZuVVQUTD4cR43nRvJ9wjPmkJgLgvFUOqzmmXj4O7AytmH4j
	+VncekVRd6bxbQn756sftl0Q3VvO9htKuzyELuS9YKwKz2BFJ9hqpFyFckWgvDw8rnzvLuM4KQJ
	gHtwiFT2N5krMIrDW3hJiMCYVrRDZFlzG+H2jfCg2rGbfDkLkHF7ldmOmmV2WthndMvdi1cGRsI
	ZkQ3vwdTjV6pw9EvrFTsxw8THXPixRUlIBABpEno4aFWEM53981NVF0XOibgwUkKlWXystNfZd1
	CPkTxToz225gbNf1V5/bm8QI7M8/aXv2SD55PK6KF6W+firhLAFKqQGBg1UVtqKTdIRUKHvDwA=
	=
X-Google-Smtp-Source: AGHT+IEW+VyfbzB5QN/NRNUa99sM0LvI8L4cDy6ynoPn7Q4Ru6gR/EqZ673FUOrLyastEjFoWeHGDw==
X-Received: by 2002:adf:9ccf:0:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3a8ffcc9da8mr1892347f8f.33.1751022304411;
        Fri, 27 Jun 2025 04:05:04 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52b9esm2405966f8f.61.2025.06.27.04.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:05:04 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Ruben Wauters" <rubenru09@aol.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  joel@joelfernandes.org,
  linux-kernel-mentees@lists.linux.dev,  linux-kernel@vger.kernel.org,
  lkmm@lists.linux.dev,  netdev@vger.kernel.org,  peterz@infradead.org,
  stern@rowland.harvard.edu
Subject: Re: [PATCH v8 11/13] tools: netlink_yml_parser.py: add line numbers
 to parsed data
In-Reply-To: <549be41405b5ddb6b78ead71f26c33fd6ce8e190.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 12:03:07 +0100
Message-ID: <m2bjq98n10.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<549be41405b5ddb6b78ead71f26c33fd6ce8e190.1750925410.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> When something goes wrong, we want Sphinx error to point to the
> right line number from the original source, not from the
> processed ReST data.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/net/ynl/pyynl/lib/doc_generator.py | 34 ++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/tools/net/ynl/pyynl/lib/doc_generator.py b/tools/net/ynl/pyynl/lib/doc_generator.py
> index 866551726723..a9d8ab6f2639 100644
> --- a/tools/net/ynl/pyynl/lib/doc_generator.py
> +++ b/tools/net/ynl/pyynl/lib/doc_generator.py
> @@ -20,6 +20,16 @@
>  from typing import Any, Dict, List
>  import yaml
>  
> +LINE_STR = '__lineno__'
> +
> +class NumberedSafeLoader(yaml.SafeLoader):
> +    """Override the SafeLoader class to add line number to parsed data"""
> +
> +    def construct_mapping(self, node):
> +        mapping = super().construct_mapping(node)
> +        mapping[LINE_STR] = node.start_mark.line
> +
> +        return mapping

pylint gives these 2 warnings:

tools/net/ynl/pyynl/lib/doc_generator.py:25:0: R0901: Too many ancestors (9/7) (too-many-ancestors)
tools/net/ynl/pyynl/lib/doc_generator.py:28:4: W0221: Number of parameters was 3 in 'SafeConstructor.construct_mapping' and is now 2 in overriding 'NumberedSafeLoader.construct_mapping' method (arguments-differ)

