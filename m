Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526615B0EF;
	Fri, 13 Jun 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820255; cv=none; b=niMNYZkWX9nJar1ycppgP8+bgn/f4jB/vMY5OMKVpuZJP6bX4btCEFWQXFaRyeh2X7odIIQ7a/hTMBD+jN0CnUhH83FoU4x1rAaTZmAc9fGFr1/f20vQXvluN1vW/48ncnEYSqMG1d3D5s4ayrOjjBOHqckOwfm1LoF6ukuu5Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820255; c=relaxed/simple;
	bh=6rp7eAnv7jydJiNj1mOqYkTX3fDMNGW8f61mmdX4yIM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=vCS6iMYLeLNu3gtqj3wRiXaYwufJPFjlSo5NnYO0/9ttmKrIfHMYnjMJcYvbgRKOxHCTj7Phj3w/Y8JxDYUwemf6dzPlA3YnGowrF7WSt1XZHQVPr4RNfZK0VzOGlt1/WiqnehuNIUxzzfYpLCggqNWPTpsKZx5+emZ0L1JBzcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3U52tng; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3U52tng"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso17408635e9.3;
        Fri, 13 Jun 2025 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749820252; x=1750425052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qkrgZn1Te7Sj9IIaDIwy8pfNXIJhrotxZavh7kLndew=;
        b=F3U52tngwwt6K19EqBoyFua7iLRedCthK5s/z96L/jHQwj2NNHB4Mz/uZ1F8sg3ogf
         aSRXtiABYWEtF4CJsqogtkN84U/CjqUZjnZgHqUbkbPtZ2tDGU0ro1Jw3FzSLNdJAKT9
         uKIEqUTdDHgPdhMygxovKnzz3eFPO7uBQ3rm53YrV2vN9Bvahh2hJLfwdxJgaNB2Ct7T
         xN/UMA3ifEA9QS6vNQPyLBp7Abt7XjVh7AACWUQH+y6G2Y2LSyHKYc8QioubxCWIw/wE
         vROwgaeCk5ywNTNUrFQGvu50LYMZs2+asy/9yEPxh/rLfxOyiIcKaylwf2FKUcsXKi0O
         TuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820252; x=1750425052;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkrgZn1Te7Sj9IIaDIwy8pfNXIJhrotxZavh7kLndew=;
        b=HReHdPxIOJ3y2UJVp5G9XPwj6PGRQ9RKIupcLDO22WQtRr0iEPPj3B8LwsJwd35ZHG
         WavFW8kAvwCPLXPN/O6GEQZpEfTmNqe5pZXh6KclTk+VUqRCJG5C/K4AGgSSfkcaEIEE
         CMW/FQQB6mmujyPccPhSkq/0TrfdvV+ACzh6tKFTyFTtWZFKNtnt3/693vb5JxpqLbQP
         V2LRgS3KNutlrBOmUtAw312ZuAmjOZSfZY2XGdKNCP4U3G70YlwQrTeayKKgDTXOe8VL
         U8M2+BJNm48SznvTm/wsXEAFziBGGZwd0EyaiVxDApAZaeJvuvICifbQG7tgLxstMoz5
         ZvkA==
X-Forwarded-Encrypted: i=1; AJvYcCUyGUoQ2b5N2umh1ffoYmDvLrM8R4qGmu4KT21+44oMVXd/Gqzaoqfo8Uy7IZFcKWV7LHINzA==@lists.linux.dev, AJvYcCXFmJqzEOF2WoWbzIRyGTEHYO5QuMFGzMHw0W2pUgJiF3dBAa4CPyMalCj4AZAQpfw5B4vXS2sWNsW3joeLnT+My/KVPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpbzRNQ3obKyIOyut5kIElgk1A3QjY+hQZz+/UnB3dpL08RrRT
	yjpsp3/Hk5x0WtIGh5wXva6Om7miQnaREjYDLfEcpjXb5ysrYJioDfXY
X-Gm-Gg: ASbGncvERdRAzrvrUaXNTtNpWkR0AiIC0H974l5i9lI6OPCTFRPOAw5o6PV86yayxnI
	oJxBksQ75/Br4QqI3mmBKv2a36qkV7pTWO2kPa8X1okYOf5BhMJpwn/RmhMfbhYCi5kfHNm8CEL
	9e1I32JglYYiHIuuEyikgsgpF9HUZsacZ7NE7gnK2e1VUKtdQk+vtQB4hG4WVTsy4dYpdAS6Kwm
	G01voo3WNhKu6LQCfastfIRQHg8TG0NOzDEBjUNQLL0d/YkzqnjhIi07x9r3j0UrV6o+ryppjjr
	u89iKnYU4nZJAC67uH7NADFmKFwYcGw3SFzLBX+pkzcNVGdQ0rqKsBod212hZaW1KX9Loh0aL+o
	otNvi4jmAzg==
X-Google-Smtp-Source: AGHT+IHgXB8AXL/nBv92iI8+cZmWTMu3M9SVVTLKyCQOyvG2PJJtoDlsBbfj+n5MGh8yOcyLVZGdKg==
X-Received: by 2002:a05:600c:8b2d:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-45334b19469mr33212305e9.15.1749820252233;
        Fri, 13 Jun 2025 06:10:52 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4e8sm51884785e9.3.2025.06.13.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:10:50 -0700 (PDT)
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
Subject: Re: [PATCH v3 12/16] docs: conf.py: don't handle yaml files outside
 Netlink specs
In-Reply-To: <d4b8d090ce728fce9ff06557565409539a8b936b.1749812870.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 14:06:24 +0100
Message-ID: <m2ecvnlrjj.fsf@gmail.com>
References: <cover.1749812870.git.mchehab+huawei@kernel.org>
	<d4b8d090ce728fce9ff06557565409539a8b936b.1749812870.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The parser_yaml extension already has a logic to prevent
> handing all yaml documents. However, if we don't also exclude
> the patterns at conf.py, the build time would increase a lot,
> and warnings like those would be generated:
>
>     Documentation/netlink/genetlink.yaml: WARNING: o documento n=C3=A3o e=
st=C3=A1 inclu=C3=ADdo em nenhum toctree
>     Documentation/netlink/genetlink-c.yaml: WARNING: o documento n=C3=A3o=
 est=C3=A1 inclu=C3=ADdo em nenhum toctree
>     Documentation/netlink/genetlink-legacy.yaml: WARNING: o documento n=
=C3=A3o est=C3=A1 inclu=C3=ADdo em nenhum toctree
>     Documentation/netlink/index.rst: WARNING: o documento n=C3=A3o est=C3=
=A1 inclu=C3=ADdo em nenhum toctree
>     Documentation/netlink/netlink-raw.yaml: WARNING: o documento n=C3=A3o=
 est=C3=A1 inclu=C3=ADdo em nenhum toctree
>
> Add some exclusion rules to prevent that.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index add6ce78dd80..b8668bcaf090 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -222,7 +222,11 @@ language =3D 'en'
>=20=20
>  # List of patterns, relative to source directory, that match files and
>  # directories to ignore when looking for source files.
> -exclude_patterns =3D ['output']
> +exclude_patterns =3D [
> +	'output',
> +	'devicetree/bindings/**.yaml',
> +	'netlink/*.yaml',
> +]

Please drop this patch from the series.

>  # The reST default role (used for this markup: `text`) to use for all
>  # documents.
