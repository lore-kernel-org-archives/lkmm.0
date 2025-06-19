Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDB248891;
	Thu, 19 Jun 2025 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335607; cv=none; b=u0NjYwKTkoNvUqiPO7K0A12kx2jXi+SSXs8lAcv8il9qhwFbwcxIu8DS5L3OvOSgy/OqOIuGAENAUkA+iCiz/U8cNttaQCD+VKn1o1mt7xlBKQ/dx4fwDKCqONhVoU98XHaXmhNyH/DMGVOaBO90CBKfazYr13MXFusOdrX9JZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335607; c=relaxed/simple;
	bh=+9UeE2l/NBrc6NHJHLM+SqBJwMqTtJPpRZcGfcKWndo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=QICM2JGDZ3snocuHfbgpDGlYpgUOLUJUpeEyXwhARqsBtQU/5yx5RNHhcvbz89qji6tg4lbh65vY8lTpiY/gb6mBE1t0Ku5wlWgPQtLxKwiJ1uek5V3/r80lWwjFyde8Nn0JithHwuJ738tr3SOfHirUjv3uzjA8Q8JMeZ3knJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqmEbSjP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqmEbSjP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d3f72391so7297135e9.3;
        Thu, 19 Jun 2025 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335604; x=1750940404; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xpuh9d9jSa1SnmPuObykoxa1W8u0W5/a2m7QmA4uxfc=;
        b=HqmEbSjP4a9WvfrVeyiZlMUZbyxlS92tPmuYSj1eStzQFbFNl52kKySYXY7FAkfge+
         TZNf4g9fF5MZXEHaFbjx8BapSJ49SXBl8yLBbNvPMmfl6iR4laQxktqKFFGOxXsx8ZgJ
         8N0eefXU2y45TDzgNKOihsbc6v6PJVQl7tjvFnR1s3ZrOgKp94sUEnxJ7xX0feL6XLj9
         Tq/ecONDRxawPtHbfP42gLguDL4ZYP8eM78Vli5ysBCzAfyZPSd3hOjW6YHtccKpfR2u
         2GHlmh9HsUAUJfOM1+OnygXMRU6FL4iInRjMGwZhjK9ZX8IiKU3428jo3GyEZV9x4P9A
         zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335604; x=1750940404;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xpuh9d9jSa1SnmPuObykoxa1W8u0W5/a2m7QmA4uxfc=;
        b=DqyHUshk2WAQ6oPcjTripO4Rgt+8hnMOXTvPL8O4atx9Pj2CpIjO1NYWn8NxRYp6XN
         CT+VZxO3kOsGiWIEPUzqSvhXIUycveadcHuDEC49DNmRooH/bwu695A+B31+bJssopWo
         AN3Eh1JChQeSF7M2O1mstAkXgZ/fHsI6sRf6Ihox5ih+P2K2jUQj/r+/UByaDGehk1yW
         65flPRxlhbN8jcgiH2rmIbyr/uUAb9zU4n88fB7Ywcs1sbdRtqwP/HovjaPYLx3tjX71
         bNf9EKmmzgcpCF1Q4thVUjz47nNGI5phC2m7dFfJMmGKle4GSu+Iq/rEug5NEksAoyaY
         A2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVFDxS8HKBNiqxdv6a9N1afeuPA0vBUJvNYyP66LkQdESL+rusOFwZYgCf5SW7+/hlSxJS19Q==@lists.linux.dev, AJvYcCVt0AyZOlx+0Q2TszCxiLNyqYFj2G135ncg5s8jcP42sccw8p3vgExsVyLYIN4BAladQf1STHWjkpp8fMHLgc9v2XvEnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLfYLGdV41HpK6bhOItPNTv0f0bD9X+UfDX9tSQb8MbDzaTnUK
	J+CB16nud27rEOivcrUJVKqOUBctNmc7ZA5kPfk8sPbqBRdrDIzQtobk
X-Gm-Gg: ASbGncskxkEIzflr+OgF3stehWMqqox8dCKEFhKktKMtFP/rjXgceT+AiMutWDw9ZU5
	Dn8lGpkBrRyL4MLAGSHXkB0SwNifZTb56CRFtujEI8grAZF1tiKM9wpZ6hLE+hNf4rORYCy7NZR
	8ycuJ+GDBx5vJqE2BahLTIntlSiPzBCq3G+cZDKxGPfrlZEfMvaFRCUIBdOr0yqrZK67mQd3ff4
	/4dv49GjDrlMwk3zPxsExLq/GJr8UcqCTK58z5RjSouM0SKa8/i/mr1GrzAgSMn0++Ts8sqxGCr
	J6hPEdFAsDTapVo2C1V2bCVEdTpKIFpDry0InWjk5DcNuVmDRYHyFma/amOMPzxXH8PzwqPJ
X-Google-Smtp-Source: AGHT+IFaiatrhl5qZ/OrmLM3fFIrH6qG4uVdCj3J3SdJMfbXJLfvEWhGu6oFTTau9oRt+9XtwRRbhw==
X-Received: by 2002:a05:600c:1e1d:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4533ca7518dmr222070495e9.13.1750335603668;
        Thu, 19 Jun 2025 05:20:03 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a908sm27074965e9.4.2025.06.19.05.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:20:03 -0700 (PDT)
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
Subject: Re: [PATCH v7 07/17] docs: sphinx: add a parser for yaml files for
 Netlink specs
In-Reply-To: <79fd88d84e63351d1156a343d697d9bbca8159c5.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 13:08:31 +0100
Message-ID: <m2h60cexxc.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
	<79fd88d84e63351d1156a343d697d9bbca8159c5.1750315578.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Add a simple sphinx.Parser to handle yaml files and add the
> the code to handle Netlink specs. All other yaml files are
> ignored.
>
> The code was written in a way that parsing yaml for different
> subsystems and even for different parts of Netlink are easy.
>
> All it takes to have a different parser is to add an
> import line similar to:
>
> 	from netlink_yml_parser import YnlDocGenerator
>
> adding the corresponding parser somewhere at the extension:
>
> 	netlink_parser = YnlDocGenerator()
>
> And then add a logic inside parse() to handle different
> doc outputs, depending on the file location, similar to:
>
>         if "/netlink/specs/" in fname:
>             msg = self.netlink_parser.parse_yaml_file(fname)
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks like you didn't address my comments from v5:

    > > +class YamlParser(Parser):
    > > +    """Custom parser for YAML files.""" 
    >
    > Would be good to say that this is a common YAML parser that calls
    > different subsystems, e.g. how you described it in the commit message.

    Makes sense. Will fix at the next version.

    >
    > > +
    > > +    # Need at least two elements on this set 
    >
    > I think you can drop this comment. It's not that it must be two
    > elements, it's that supported needs to be a list and the python syntax
    > to force parsing as a list would be ('item', )

    Ah, ok.

    > > +    supported = ('yaml', 'yml')
    > > +
    > > +    netlink_parser = YnlDocGenerator()
    > > +
    > > +    def do_parse(self, inputstring, document, msg): 
    >
    > Maybe a better name for this is parse_rst?

    Ok.

    >
    > > +        """Parse YAML and generate a document tree.""" 
    >
    > Also update comment.

    Ok.

