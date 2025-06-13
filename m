Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCD2E0B6B;
	Fri, 13 Jun 2025 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815737; cv=none; b=PgPQH5mHj0aSemVx8QQ71S18CNhZ5qBmM7hrkIgrD7lcuygz1Cp5uDExMMtZTk0OngQL5vS9bFa8xYRugVo9JX5hgVsuTxYe4P1rVRpF/t49u4DNHDVibxOfCd5QI50ERA8ZtIx8GxGd/WufmAqobdYgmc4nH07qEkm0M32sR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815737; c=relaxed/simple;
	bh=Ci7710RjJSELOL+1/2aPBQoHM+FZu2LTyHSsddj27FE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=ke77fxshc2L49XDm3dqgeVG6iXkU8DxJLipM+NFDAnuMblHHgfgXDqC521VSl4Fop9gBjUZfBrXMKy6xHD+nmJFZ4CR1CfGjwjh/a9arH+1FsZKRn+sLcHDF28mM3NJUCVv7dHbBjCKsBHjol4Eh808UbMqt7j9ptZ9q7PTL4Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtrLD0a7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtrLD0a7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso10105365e9.0;
        Fri, 13 Jun 2025 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815734; x=1750420534; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uL5y/ewTTMQ7/ta7feOWe7CZOUk7g4FBbNi0PxftJG0=;
        b=jtrLD0a7LFDXBRm0DSJt729WXNxcF5iCLLIao1tAu+xpCVm+17nZzGG23sSITa1NNa
         soPs1dmCPvKtJeSsPqJ7oTwzRxnOK3H2+hrgEVyxWnY2hkCheL2DAVTwnTuANL2xdUeR
         RU3CBaXcWFJJ27jjcwfxsFOlf+sLjxJDbr/vy5JrWsESSKlKJkSUbs5RgDIb8s2EFc6n
         xlXnNPWivljuF4XML6lCDsACQdKaAEaERl+Hzjog4gzOFdzIhn6ljzK/02ogWnJ8DuOY
         1TSyP6yv7UodOAj2n5i8TZBLl99nC7klkg2HsCpaUh1YSoYsEOsxj3oHVKsJDCTojDNF
         EYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815734; x=1750420534;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL5y/ewTTMQ7/ta7feOWe7CZOUk7g4FBbNi0PxftJG0=;
        b=e9d8YZla1/ICufecNMXp785/EVc/wLbmWmX0ce8ys3ENFFQXACsEY6hF3iiCP4GPFV
         3NMoX6azch1Yt+7K9NdOGIFcR+fyeRWrpUHwSorzHRl9aSl66gggwSMjQOWOZx7jz9CN
         pICr+QqNnnwb+hnw7v3BtC25/ByUsjRRYHTqqmzc8irDhq94tXyqhnJYYod0OMWJzLn/
         t3R7n2f1UH/+4pYEBUm7eTFBXDmY2mCWKLsDyWmzkiQiHTBMjJAmbH3zQH6wbr91YhCY
         GbrjGAuA/5xQsfofemQcPEpd+nW77NRRaI7uBdpOZwwTCMjtBl29bXC5lMQp3aEbn+Uc
         NrYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2XonZYvhVZPaYZMmlZeUWeo0BsHeKsmWR8EO2ZkyU2+rqvpLi8UpAbnYP0+cDneI/zucicw==@lists.linux.dev, AJvYcCXgK9ALARDva/5FpVrAenAyj5rTvBHNnIFTIx1YbDyDvTHwcNd6DXiekufsvxr4GaiPx88kWUvaD3X9lGmqlRNag0bo+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHnrnxt7aFGr5+sXGn81eKG58fZKreYPXLmJkBYRyPTsq02xuA
	ul/HK6tjCy3VrpSHm/iBqSNGdvdkJUMbERGPku7qAsef//Ul/X7LzulS
X-Gm-Gg: ASbGnct462qF1ODbveuf9XXqZBXSio5yZgDPimJoQ9iOydCE+0XhUnfXC5+CHaRhSmb
	sgoi0HcLq2JNMYG53jYqVMu3QCFzhb/zdwX6KZYN+5q+JSgzII8ADgVRTscPDIF+4sy9acxivF7
	g8YR+YTG2iS8k9g4EbxtqwwkL5B20EcfsgJfbfXH4HpUvHygPKR91WQNbrRqyOmwy1t/Ca1IFpO
	zF4hkSz6tGlcPB9KZl7FAvpYOcadWel0VECIXQhv1Vs40Df+NyoiXnQN2x+eyqeV/G/lpeNsLxO
	z+Mik865fyVD+ZMHF9Mh8xg4PKww8+BvBwS/JCb75AINADj//CqpLQHPKXwnZwGBpooKy3IU3Tg
	=
X-Google-Smtp-Source: AGHT+IGMtOD0UDTm67fkmitVK21heePsVMtSrnMkraeiIzLg5EK6P4byBT359avt25zMBKAJPT5CUA==
X-Received: by 2002:a05:600c:34c7:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45334ad3f41mr27165075e9.11.1749815733431;
        Fri, 13 Jun 2025 04:55:33 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e261ebdsm52187085e9.39.2025.06.13.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:32 -0700 (PDT)
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
Subject: Re: [PATCH v2 06/12] scripts: lib: netlink_yml_parser.py: use classes
In-Reply-To: <08ac4b3457b99037c7ec91d7a2589d4c820fd63a.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:20:33 +0100
Message-ID: <m2y0tvnb0e.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<08ac4b3457b99037c7ec91d7a2589d4c820fd63a.1749723671.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As we'll be importing netlink parser into a Sphinx extension,
> move all functions and global variables inside two classes:
>
> - RstFormatters, containing ReST formatter logic, which are
>   YAML independent;
> - NetlinkYamlParser: contains the actual parser classes. That's
>   the only class that needs to be imported by the script or by
>   a Sphinx extension.

I suggest a third class for the doc generator that is separate from the
yaml parsing. The yaml parsing should really be refactored to reuse
tools/net/ynl/pyynl/lib/nlspec.py at some point.

> With that, we won't pollute Sphinx namespace, avoiding any
> potential clashes.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
