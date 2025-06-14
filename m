Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B212D9EF9;
	Sat, 14 Jun 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910949; cv=none; b=Kb/5dPYGa6N18WdMdcEeBglQd4208oLv2/cIdaiL3H/Xw9tNftWO3c/C2K6FjF5tuW3BTfBdSvc2ICRsrMRH9/ZlAdRQGjMrSg7XOxm+0VZAasH/Egdcd9ipbW+ctlsS9bCPitgm6fyFeVV5uDu81UZRuxPXsKM8JIYz9+ALgVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910949; c=relaxed/simple;
	bh=Rg+fgZCwsIUrfRiu8mTCYByi4MeRpBOzpFg5lYgvIBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4z9WyG1aoDDt2F1FtwiBZ6e5CGqOZNy7L2HwKOziDMBtUn+mf/LVTIN4ZwgylRIYHGra1S4xGK5K30eUXcRAOP7D6hUQKwRq7Mwu5eY7Gu7ttK3li/+iEsbrl4IoybRKcfqi8bXQkvoZOEQH76G86d1HQD2Bbc4u1wzmg3ZB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmRGwFV2; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmRGwFV2"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73a01a7bee7so954060a34.1;
        Sat, 14 Jun 2025 07:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749910947; x=1750515747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3hWngazZR49X9JH2w9golPTcAudBQyhGLqPPLoGo5c=;
        b=gmRGwFV2YlhSiXXMgK8ca/KsujlkqqOy1C2h3u7zNci+es5rA349lCUcQa1HOjpkY8
         57f4iJa4qQFedcwB8ZartFFKegI60fYe3ybK8XzrmvdqPVAFXSuoMfjqb/U3H2WTv9Ct
         am6kD5x+ypEJQLzuZBL1AzDcWE0oUo9+ZlbjqckdnsV1Hf2+SfgVCSFAu5ZZ32qlA89T
         oy/yain4MWMzXw5LOUisIuonN2U8V3wmzFbuaxPKsl66L0E1boOEqZGHZfif92rl40ij
         HM05godkuWTh2D/3c9uYQM4ogLOj8jy426DM8Vj72Aiu2pfioNS7g4lIGnxjd3t90X8c
         nP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749910947; x=1750515747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3hWngazZR49X9JH2w9golPTcAudBQyhGLqPPLoGo5c=;
        b=PPaqJUetUkU86mt0OhDA0SlrBdnCbfQELwfsfn+8QShxplccqlpOS8uLw97sMPd6qd
         RX+p4D3trjeA9As7GtsU7h1lUMovUkyGb9GDAlL99e5D+H53NWDrLR4T5vRa7O111mtI
         1yDRGWDSw56ULPn20YbEomTfxsSFTgm3pJxexSLU09UfpgKsNRB5A2ul4BgBVnWiuTMw
         JN+dBV4RYMKS7IUOA/asEBVglQQoWbGRG3BsS/DJKatMUgUrBkSZjLAO2/zDMGJ+6Nx3
         lxtGr7pdKbnaqCFQULA0s+gZ/ABJ3ZIFIL1cKXGoAFpdu8UUQovT61f7TzBH4n6U/P91
         IFtw==
X-Forwarded-Encrypted: i=1; AJvYcCUpdUeNz+lc0aUTak+0JZNbi6mfkX0e75kU+7avsmQPpt9rTxZsRELj420nEnvN+rc4uY2jPIN/k90grTrXTYqRtq26CQ==@lists.linux.dev, AJvYcCWxfCSaVppbQBsTi6/rIOGk0pEANHtJ9gYW9a8fNvYnVoBGjm60ThfZz19EnV7WoGrpzJE+ig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ5zWUyehi/ZfkUN7VgXr5+YFq24rt6eKH4WwCqXWED9HesdJV
	VU5YKwS2zRmEaN6efA4Wn+QZJYR9pE4nXapVNeR3SOMqHamVPnLNTO2HMXNB37GuakUYqp8r8KS
	8FKcofxoq1ny95HwXtofRuCnwzxUAUTo=
X-Gm-Gg: ASbGncvGIGfdgmpT1hr0z13QNtS0oQP8t5FWUMmKFTEmQX3diqr/tlY4h9A2qGsxI6P
	UzeSg/l75YukoKYh9e2IZqZGpuYMqpRgmyUlzO2baazTi72LJuN9yQry6BXWrmczaOIXUeCwJVB
	u2A0BiuKBP55URCn/T47lJPowPTyhrkDJ53KCu4e+N9q2kYGOFNomYgEEEHMuFistRuL/3u//xP
	w==
X-Google-Smtp-Source: AGHT+IEZSMKfIhF5Wtgl7BPD+RHoz/6+X0THEcMGujucKXpF3oqL7pzaETbvgouujlQgGh81A5s/QdODg0dTieqaME8=
X-Received: by 2002:a05:6870:3925:b0:2d4:e420:926c with SMTP id
 586e51a60fabf-2eaf02c9159mr2147858fac.0.1749910947449; Sat, 14 Jun 2025
 07:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749891128.git.mchehab+huawei@kernel.org> <ba75692b90bf7aa512772ca775fde4c4688d7e03.1749891128.git.mchehab+huawei@kernel.org>
In-Reply-To: <ba75692b90bf7aa512772ca775fde4c4688d7e03.1749891128.git.mchehab+huawei@kernel.org>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 15:22:16 +0100
X-Gm-Features: AX0GCFtp1S-v0cvoFkINvtULliHiL3lSbK0RuVnxFH7wmNXiGSQZkNSI3JO8tjs
Message-ID: <CAD4GDZzA5Dj84vobSdxqXdPjskBjuFm7imFkZoSmgjidbCtSYQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] MAINTAINERS: add maintainers for netlink_yml_parser.py
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Akira Yokosawa <akiyks@gmail.com>, Breno Leitao <leitao@debian.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Ignacio Encinas Rubio <ignacio@iencinas.com>, Jan Stancek <jstancek@redhat.com>, 
	Marco Elver <elver@google.com>, Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org, 
	stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 09:56, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The parsing code from tools/net/ynl/pyynl/ynl_gen_rst.py was moved
> to scripts/lib/netlink_yml_parser.py. Its maintainership
> is done by Netlink maintainers. Yet, as it is used by Sphinx
> build system, add it also to linux-doc maintainers, as changes
> there might affect documentation builds. So, linux-docs ML
> should ideally be C/C on changes to it.

This patch can be dropped from the series when you move the library
code to tools/net/ynl/pyynl/lib.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..2c0b13e5d8fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7202,6 +7202,7 @@ F:        scripts/get_abi.py
>  F:     scripts/kernel-doc*
>  F:     scripts/lib/abi/*
>  F:     scripts/lib/kdoc/*
> +F:     scripts/lib/netlink_yml_parser.py
>  F:     scripts/sphinx-pre-install
>  X:     Documentation/ABI/
>  X:     Documentation/admin-guide/media/
> @@ -27314,6 +27315,7 @@ M:      Jakub Kicinski <kuba@kernel.org>
>  F:     Documentation/netlink/
>  F:     Documentation/userspace-api/netlink/intro-specs.rst
>  F:     Documentation/userspace-api/netlink/specs.rst
> +F:     scripts/lib/netlink_yml_parser.py
>  F:     tools/net/ynl/
>
>  YEALINK PHONE DRIVER
> --
> 2.49.0
>
