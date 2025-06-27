Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC62DBF72;
	Fri, 27 Jun 2025 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022306; cv=none; b=JBv8udITlPrsSReyfn9SNr9yeaxpmiwFHxSEqKsu4htBCUYJz5lf04/8xdXzsCjNpt2T63SDo0/XTxab/vSTc+vapCv5Kcr0xFP5hpAihBNlJuQffo1M2TMhX+j4PW21NLRVV1XkQDja4TS08fLLkMMKNpvXUuPteDWjysKYlaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022306; c=relaxed/simple;
	bh=B06vqLsvetg1jFxGBYXyf+6nQe601dcV30vu83BMpw4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=qlCekw3K81aslsH+3mY5IZXgFLnZ2HLPjvQFW9VQaPQ+uAa79KHe915gsVCcIKz+nf3AJd6a+6iFWBs0/CHBR70vIRfBDiLbrejyj/nMXN0dBEjGIYOlp5hJnuu3G6gwzuBIbNb3HZo6ZM+QgtVaP+IRc1HzO008cuRxWrJmHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqClO1bZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqClO1bZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so11010385e9.2;
        Fri, 27 Jun 2025 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022303; x=1751627103; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B06vqLsvetg1jFxGBYXyf+6nQe601dcV30vu83BMpw4=;
        b=SqClO1bZFYq/yfM2R6kwKP+65NfDf/1HPy+0iuW+NS9ZqUWp1I76DwsiFSOu2r7+6U
         QhQdPKAC0Xk2d0lBaTKqjudacjvuQvS0O2BKpcLwOVOQ4QkWymX48MdhrOPU2Ci4a9J4
         c9ziymjUgCCXqRY+acec1cm+MCw7PwORWSe0evFXo9XLMpjBdnEgZadrD//mArtpazRL
         CWcGgUg/yJVBtWhEd7PerHkuizFW8LQ6V7VhXwIoWkla9XzYU2LEde+HwOsnqLrsiS/w
         rQdvtrA/5mJqe+HKiRCpnkopI5zJppffA6q51hDaYvtZyZ3A9MpndnTd0M1PEbnsXvD4
         u2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022303; x=1751627103;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B06vqLsvetg1jFxGBYXyf+6nQe601dcV30vu83BMpw4=;
        b=JcqhO7w3eGrirlUrpwOgAMSpqSiMexl1Fg2UTFXxEgderKyv8k6xNYCclp6cdvFKQZ
         HiecPth5CO3bCUa7kqdw0DkMjgKWVjFk7G66iRmeAbIdTtY+We4ZCL7+H7BRkPJs12Sx
         AHA18GMLYr4vjb+7jVbUICMnSj/ihTI2pxdr3KY0T+iUGYf1xuGHVyyxZYCgq6WqPgpf
         zMJcr7JwB2VOkkUmXj5iytyiOvQEJxNQonomzqA55jFrdG4EB3I98fQ6KF+SozKHFF5d
         mqw/Pk/qjecCDeoT/R5XY3Y7YRTUxXpxonBlCfA9+zDZjZhFrORklyBnNCYfOWfdLWOG
         TUsw==
X-Forwarded-Encrypted: i=1; AJvYcCVAQ1I/+6forT8dxTe/4ECNArXCKFI7/NhSTGoG2mZogrbqwILKl+iq88QbSz1fDtOypXrGgQ==@lists.linux.dev, AJvYcCVTVvHDKxjj/LnAeE/PMA/eXhzRrE2z578J8hEir9A+JhBnoAmMFL+SfCsXyrrW+iXDCD3rRrId8vlBXjnaIkKw4+YjWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd2F3VLG1u5seyfDQuZng+qcrx8KdV092AQ4d4Fw+RnoOHPqw0
	QJvQ/t6Cins4glHMBzHSnO1ffDzAeWFfY4gqZyuv3izqPMNJrN5bkHUU
X-Gm-Gg: ASbGnctYd3/poudzj1nLGO4ROUcqRgdM58Yu/YfLhJLv3lYUUCJZpGN64nwA8hXidJM
	JgB/x6uOYef6ZrUkcsa/VJ4bVGKTHIAkltMvx6BcBr10+59t+p8b0gdDZ+56jDNokHVqirooC5m
	KDfEI6xjyawYcs7Ut7pPhMOfzlOOaYYxK0DqRpPrmV1XNHtsWRX+wq8664FJPhKX4Lgnuaglveo
	dNInn2x5QRwng2/x4QSheD7QZF4HoV4BnHzsjqwl4oWgfoxMVJPEIHPz+RY6S2UJb0O1urGUb64
	c4PEqMpwGeCykiiEuZ9lxikaWaalZZnOYKsVQY9Ky+bbAeHZRHzRCE5gNF671Atw4b7rqHygMw=
	=
X-Google-Smtp-Source: AGHT+IFFLTapbpq9yfN5NyUmLLfh7yHtwG+Kidt1zCbPWpTZBl7MH09mVCDDdVXETaSXAjZye1DAKQ==
X-Received: by 2002:a05:600c:c172:b0:453:6183:c443 with SMTP id 5b1f17b1804b1-4538ee33209mr27999405e9.5.1751022302697;
        Fri, 27 Jun 2025 04:05:02 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe587sm48410295e9.19.2025.06.27.04.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:05:02 -0700 (PDT)
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
Subject: Re: [PATCH v8 10/13] MAINTAINERS: add netlink_yml_parser.py to
 linux-doc
In-Reply-To: <a8688cae5edb21b9ebbc508d628c62989a786fb7.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:50:39 +0100
Message-ID: <m2frfl8nls.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<a8688cae5edb21b9ebbc508d628c62989a786fb7.1750925410.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
