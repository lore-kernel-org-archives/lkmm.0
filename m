Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6842192F4;
	Thu, 19 Jun 2025 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335600; cv=none; b=XLrVqeqf+phGfewNwBVxtPprcKvEw/pV27RegkxxcEBsP0LVW27KKGGfA0NClaCHWy0FIHGL+7aa4mCYq8Yq1PYrMUHymj2K0H1tq8CN38TUvJADYGLTsqWhdV9h0QxKXiG+yWaghtJ8VtrRJvF7m5NU2gHUGu/8yhfvkAmVosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335600; c=relaxed/simple;
	bh=XquW5ZV6oc/hCki+AgbKZYygFXjNvaYEnNIQqvtyoYk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=I1nRXQCHzvUur4OUdVX/5cYhdhf/giMYJHyJsSusAvrQyhcXA3FdieUDA0ShCpahra4sUrhM47Q5/NHChBly01knbpVjkv7t1xabhq2Y1ppm3PXak+1dLPHsKQNbuZtY0Q8URa/HiNdu4kgHwfTfnk2bukyu0JRu4Up7RIEmX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+SEgtWv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+SEgtWv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so441131f8f.0;
        Thu, 19 Jun 2025 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335597; x=1750940397; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQfUHBUgL4FYDXO1aQtp+eVF7jpagDZr1s2Tf1cBE7o=;
        b=Z+SEgtWv2C9fMxKUIE+Pe/UTgQvIwX/H+DlRlx6RYO2+VrA8jpt+6GrqIVZDn4IToG
         B1+a8SQEqeJeuV7gWqvAQWh5Al7kY9xuvZ2BNf2DNI2iDNA/Uy7Umu8AHNADxNuXlVKI
         jm1y7YgL9OK79CA+5NHNXCui4oFtB8iwOgpL/nvytcl7QyoO+qtFvtSaicRgGl6vliRi
         QOTgB8Uh6A9+NF4xc2rm/+8PE5JPKZaHM0ZeehAw41CKTwObn5D0o7GZ7UTqwcAoN61l
         /Nu3Xlwr4RPt0KFR1u7nHoJzRaJ6zdh8mrRBCtXqxaydmGBCB/rpyU8QjCquKbWnq+yD
         Q8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335597; x=1750940397;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQfUHBUgL4FYDXO1aQtp+eVF7jpagDZr1s2Tf1cBE7o=;
        b=WzK3/5cr9pYjDSR58s3khnXSaZBXZe7Ldza7q+ARPU1VaM+m2l6AhPtWnmmTbPybTc
         cLT6uA0+lP275pHpzLxgMvITzxKFYcxlOmo3YZb8pybC4dkKppTKvux1W+mXeIKcv1DT
         6cmdSiPc5bG7/UrEDc9YoD3vrwog7uTbIpGrRW5uiArrpFc9l+ejRz4frG3sVpf47BVN
         CmZhVEsSkQafmgwJBbkVZVISQXIrw7fzzLhEt7VAflnmMPSnrjFOmfQbUlV+zRccRx00
         TzDiiVZOFsjXGRxZtQFx1gk7PyaECJrrXpGbwf84/2sLqvmmHg0tyvCrkkt5HzJ9Rb92
         NcuA==
X-Forwarded-Encrypted: i=1; AJvYcCWqY6JL08jfSF/ag5KrkH8AO7O8OXe7qKpm1rQXz8YaCQzSQBcLEVzv8Nasu3aYBGiEpg7PVA==@lists.linux.dev, AJvYcCWz2O+lU6QeG4fwfyCTGC3Ed8WMpYufxEIp1/4bXA8asJb3gYqFlehTJ6HGkpcWm7jmjv1jRcr4355+8Z1KKWP5cJWxyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPCdnYtdRK2Zvl5OFSwrtxhooX6AAKtnxJlkxGdx4fS/KJWaVe
	ICLRAhivIYThL9oGzVNJ6BZPNSb3oBB+h7Yxd8gkkE7waz/6eP3Zf1hygrBWf19T
X-Gm-Gg: ASbGncsdZEmUON82UQoVDTOET71u484uSveYOHx1QhZ6RlfxPnbF2e7UNwHB2KG/ZNU
	xcGm+pOSdT6h01q7Dx/viUUTseRHyXhOAbq516LOF+V/o00FFVa2z5sN7usXWu0EifFN5iwFKKV
	78bR6GtYyxHKLM0lde7V6NBJK2ktV6+RFHYfjoBcN8eIWDMWFkADoYKIEry7yRZmTa14jgVbg1W
	B8SNhI1GvQI5245hcUFgIyuh5/p5RAc8nOCQDyUCHseVEJNzAxTYYaVQoXlSmn3N60DduwCqRy6
	loqSfL2CxU5tPHUR5NgUyPMEfH/OcQmLgxHUP32M/oVOmgv/CZV7zYYBCRJmaE4dyVXprfLN
X-Google-Smtp-Source: AGHT+IFMDYQMfyO8NuzqQxoOHc8RZSPZIdd81fqB1a+VABhpS0urt+/BDcKR/TSjd1tmz0JMUrX5ag==
X-Received: by 2002:a05:6000:22c1:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6c96bde70mr3293996f8f.14.1750335597039;
        Thu, 19 Jun 2025 05:19:57 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b5c372sm18955330f8f.89.2025.06.19.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:19:56 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  linux-kernel@vger.kernel.org,  Akira Yokosawa
 <akiyks@gmail.com>,  "David S. Miller" <davem@davemloft.net>,  Ignacio
 Encinas Rubio <ignacio@iencinas.com>,  Marco Elver <elver@google.com>,
  Shuah Khan <skhan@linuxfoundation.org>,  Eric Dumazet
 <edumazet@google.com>,  Jan Stancek <jstancek@redhat.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Ruben Wauters <rubenru09@aol.com>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  lkmm@lists.linux.dev,  netdev@vger.kernel.org,  peterz@infradead.org,
  stern@rowland.harvard.edu,  Breno Leitao <leitao@debian.org>,  Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 00/17] Don't generate netlink .rst files inside
 $(srctree)
In-Reply-To: <cover.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 09:29:19 +0100
Message-ID: <m2y0tof82o.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>
> v7:

ETOOFAST

https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

I didn't complete reviewing v6 yet :(

> - Added a patch to cleanup conf.py and address coding style issues;
> - Added a docutils version check logic to detect known issues when
>   building the docs with too old or too new docutils version.  The
>   actuall min/max vesion depends on Sphinx version.

It seems to me that patches 15-17 belong in a different series.
