Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511EF24E4B4;
	Thu, 19 Jun 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335609; cv=none; b=uTbRMDVGD9WDCq4plBf/oPWYzrbBxOywgggf/zleTSMIa8gQ0xYvr5qsbwazM8poa1vNd4wmRS7hyUI82WEx1rMVRPkdut/pNu7YNdefWMhcxmE51Y3i7MaZPE/5yozgbMmDFg5Sx3BMnJ2+V7V2ZaHt5gONwdUBnSKQnc4xZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335609; c=relaxed/simple;
	bh=mhfIBh/bFaJ/GFxVs2Ar3YirycGFXc5ADMl6GKVDQYk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=V61fFlNcHSln090RK2zM7lHSxpF1lke5D5dRaduIQ9o4+zYUaOzwdKCyhlUHjRtaFOJMZh4KwvoCY0cyuLSJgo1SPLsg+YqI3UWrvcvXtEP8LxrpGU7D8w59FQRXLIcuwdgJfYYBaKn0SRYhq4pNncEeABBTA6NoWHxeEq5Ryqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiA4yfc2; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiA4yfc2"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so605680f8f.2;
        Thu, 19 Jun 2025 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335605; x=1750940405; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nygRZhXsxMlH28nxkhtm4NH4pDec5lLwDc7T4mx9LAQ=;
        b=QiA4yfc29pa00FUSW7YW1KHlmFs/5RAH/AAjoYVbKiQoRQTmhFYAlHuibaBxPfc7Sz
         2JZXkfDz+kyNO1aqeqqOIOl+oBIHvOaZdYK/onrzi0nVrEf3iAhw7ixzCOg280ipMV5i
         ucurV66l+z3m7sUy3xuB9IJukN4qOM4n9VKmRK0ImWlTK+uPIugrh/RzwrT6RsJHvKlp
         c0bgcIuAyOATNdNU/DaQyrrwaTYatgqT962qWLjW8fbLAMvfVKXeb+RlIYWdmB0HjaPw
         85Xfmi2k6V1cDEg0c1qVIFxRMjpX0khUmuTZ9BtTylOFVsQFRJ/EPYP49Ho1lKLBBTfg
         a9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335605; x=1750940405;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nygRZhXsxMlH28nxkhtm4NH4pDec5lLwDc7T4mx9LAQ=;
        b=f5YHKjvl3IEYY5g1T52USQq0ukPY9W1R/I87L4fReMwIEkQ79D/Rh8G9kFQQW92vfb
         K2u5vxXkbI+thd7krxK0Tnm4y27VitPszWB/78og9dEMOSn+YDscj90M564oLzqew19S
         h4R1LpAbRTTwT7BtbNQPjFw1kYluSd8C49KLXFNNa8NXvK+THk7FgfNHNy/HKUVsglpT
         gzSaLpBe6Icy69uSRUUcMxGrOTFyREyq2McZiQSbJqrKXDYCMuAiaeCyKOgK0ooclQvN
         GvY7m2TuSKW1oVcckLPmhaoHZAfi8aX3cw3cf0K2TSfpFOCNT5cABspsRh/ZEeXPI0YA
         svUw==
X-Forwarded-Encrypted: i=1; AJvYcCUQz1ZhUh7R5VThCfsIvsoZxfzn9ccrbKRbLmdWSRFQd26Z3yQrbVYlVGqMtOL0liH8I0SQPrTOFipMW3RcBw1dIyOz8w==@lists.linux.dev, AJvYcCXdrulXSpyXNWIcI9ibDD5XsVnbN5boMG1pCqlYLMeWZa7W1IbJk4Vpe/wjk0j58+7lSGBGNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6aCScONFeFQ6o68ziAH7x1BosqDRI83+weRuiFIwLQcwUlO/Q
	ADiezqDy/1xthU6C6bVRa2p1TBNuJOYeWL/apDGa8bPbtnNTuu86ZVpiPL7HgFCj
X-Gm-Gg: ASbGncsupDeG/Ukn0jVoHkaeRQbM1XBj/GYDWFp4A27tTrFf5PLrIL2i5jZt3WAJd6b
	CA1+dFaboceoCA07BrbpcHGeZdyUxrVhg8DQvHN/zdNZsXSiYfDKurn6GbLR7tva0raqH+/VJ/K
	axuIvMH/fip0z7u4rw/7/67loZOKsrpx6ZKTXsNzxaWQk/v8yyXu20VTbCB5r9bi58wGhTMSppp
	XA8n+8ak5TZvLGtdHovlChuzjU6jEkreCtOWcsI3g1h/8moGgYscGj21cN8fQggMaPMEUB8xQio
	0AJFDL1qv9WzlMwSKgHreNazPOWeJtOoWeXXZWdovbOyv9xk1l9M9sXhHXKpHTzVBQgyPKcb
X-Google-Smtp-Source: AGHT+IGe/eW8uV97j+Ytu4ZG/Iy5t6+Hp3owg5exZAVJPvvkIYpSPp5SobusIEtfHV7zrOM0RAnADw==
X-Received: by 2002:a05:6000:40df:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a572e58768mr15357688f8f.54.1750335605284;
        Thu, 19 Jun 2025 05:20:05 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a589092d1asm7161585f8f.24.2025.06.19.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:20:04 -0700 (PDT)
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
Subject: Re: [PATCH v7 12/17] MAINTAINERS: add netlink_yml_parser.py to
 linux-doc
In-Reply-To: <4077605f84d7ba6423dcb5fda4e96ac950856f1d.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 13:10:38 +0100
Message-ID: <m2cyb0extt.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
	<4077605f84d7ba6423dcb5fda4e96ac950856f1d.1750315578.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The documentation build depends on the parsing code
> at ynl_gen_rst.py. Ensure that changes to it will be c/c
> to linux-doc ML and maintainers by adding an entry for
> it. This way, if a change there would affect the build,
> or the minimal version required for Python, doc developers
> may know in advance.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..caa3425e5755 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7202,6 +7202,7 @@ F:	scripts/get_abi.py
>  F:	scripts/kernel-doc*
>  F:	scripts/lib/abi/*
>  F:	scripts/lib/kdoc/*
> +F:	tools/net/ynl/pyynl/netlink_yml_parser.py

Wrong path now, right?

>  F:	scripts/sphinx-pre-install
>  X:	Documentation/ABI/
>  X:	Documentation/admin-guide/media/
