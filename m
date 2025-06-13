Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CEB2E7623;
	Fri, 13 Jun 2025 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815753; cv=none; b=KMi2xbyPMQrvpccpkDrackZvycTAk7udcmIjXVgpc8S4CddGFmulkn7k64lvViFufP9VaQRUl6Z9I4aBfJWvBD9dsNm86Zh9kHGZTBNk9P4kEg2HG3wfwnAyMr4K6ZwepBE4US8E7f3p4/1f7uQzmhi2lEMme152S1Mv6JyMGRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815753; c=relaxed/simple;
	bh=kDHzDpgYMT9BX3ib7Jt5mtCoGJdm2oP5AXFagcKzZpI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=u7Qr4PurAZM5bBMRni+qJjuWVPNufnCmxZGNurLOGC2NFABAj//4teOvBR6tikQ8huzuewV72tAxaBcFkhaOkVZ6pmcejJC0PLGq5Hai4IlYst/QeXsxlCkUvKXK/qeFphfwwHx0xIUcWQFcQ+pFGr3yzU4THJk6A90fmTO4t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5Oz+Uzg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5Oz+Uzg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1286386f8f.3;
        Fri, 13 Jun 2025 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815750; x=1750420550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hj+Kuj4ajGUXyFsALB4EF9wgie9c+yJaBbr7r88UdqI=;
        b=E5Oz+UzgwFTy1GuWN3yNlFTA7Xo6LyDs7b7LgapPNZYn+CUsuWJhtgHfw4NvRziV8q
         n03l7Hy7Xrv3hArYeldpNS5H/eoPoTuBOo6ZHZkAm/Pm7e460rxIUqj+zshf0lncy033
         q2z+Oq9Xsl0Etj4oFdWiughxcZ61ekchL55rDWM66xrl7o5uvs+YciRVqy3XI7NGWGoB
         JDDoVBWMShagIn8gEcRilnh9g4SKbIITIEA+FmiiYkLdycNL3kB2A9vssLhTGdQeUIPD
         n35G9EaxvCp40B2JTwTqjA82ruMRtL67jSQFYksjgEDPYYqYUs+qcjsDL9VEB2eKIfq1
         gSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815750; x=1750420550;
        h=content-transfer-encoding:mime-version:user-agent:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hj+Kuj4ajGUXyFsALB4EF9wgie9c+yJaBbr7r88UdqI=;
        b=K8fUR+N0OeUCb+JvnLxLEGbyTupoeexhbT6gJMosQws+QBYLbNMYxooUDerHpCEIr6
         Fij4hply9R/4ktvcH/xfhD0QfYZPbhfVrFh/dIGbkPPjRynGGFcOOjkEcogUrtD9VJTA
         tRmFQNR2WSmbIG3PGESvfnS0s/swIOMAJh8wLaRwhhjQlJEGwcuEuQqPfsfzUVtJNOBP
         XLQz3yvIiMjlWXZoikTMCYeh066/2rnpvzkY3nx/iHXbxEl1WLoPyqEo4waaxJc4bHEq
         ZbwoyIJkXjrMaPlscvhsSl1LVOHXi+iUWOJko7wBRWtUlQ0JA+z686gDBJfqlerbCHLw
         EjMw==
X-Forwarded-Encrypted: i=1; AJvYcCWtyEPoHI20XJ047V4eSbdVUgKxelgfuybPEPw/fEqkxvZbi6tCoyofKFkjWG7BMmaGZvID36U/S7zZH1rWs4HhG2bGHA==@lists.linux.dev, AJvYcCX4Qc7hdHwoXXD4xlMzJcFWzWhzxoZ9oDnV1gNHUdjvZL1g0IN4PW1mtTFwAaL2druRk86H9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBcJSSyUVvNbKvuQRtw3ICKip7NSUZmqIMbGE0C2iSUCA6b3hI
	GRAiDN7Vt72wL/MLdKcoPYM98jJOTMLhxuu/iAbTqpgh/CzDFwWoCWl4
X-Gm-Gg: ASbGncs0zmWnuAbZxe3nWw1qlOya9BUyTvfvJ7mTi2E/ahn88WQtFogtr/YNYP0aj/5
	LSeGGwAzPrruv45Sti/PzdagVDPSUqedp+gEiW6dhunujUjymelnC9lMu28vTIikD1SD1RVHPw4
	QLsAHDHq2nHiaJmRR23O2RFcRd8z9oHJDNFzZQtUXgOEO7d7gCm09zT3eDVwBGPZ12p0sGUpBNG
	mHZ8EdV/CmbVwhoNsstHFWK7lAn+i8CogVGRguAJ+n/Rdqslu+1WDlCOXjHq/W2qRNsMCPUiezE
	Tfb8oQ7IcfqQKRsswfN3/0Y0ls7SKzsPTos4Vn3fQQkm14zaFd8q5OoJhrR1n976aIAEjQ2VX+Q
	=
X-Google-Smtp-Source: AGHT+IGbaooFKQ20QFU1kZYymRa3Ue0gA9srqwzYyuAtJsiw7seBWEUCQrPm6Zfl385iai6WGcQtdA==
X-Received: by 2002:a05:6000:1ac6:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3a568656099mr2747920f8f.9.1749815749896;
        Fri, 13 Jun 2025 04:55:49 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087f8sm2177157f8f.53.2025.06.13.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:47 -0700 (PDT)
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
Subject: Re: [PATCH v2 12/12] docs: conf.py: don't handle yaml files outside
 Netlink specs
In-Reply-To: <d4b8d090ce728fce9ff06557565409539a8b936b.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:52:35 +0100
Message-ID: <m2h60jn9j0.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<d4b8d090ce728fce9ff06557565409539a8b936b.1749723671.git.mchehab+huawei@kernel.org>
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

Please merge this with the earlier patch that changes these lines so
that the series doesn't contain unnecessary intermediate steps.

>  # The reST default role (used for this markup: `text`) to use for all
>  # documents.
