Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F3922DA13;
	Fri, 13 Jun 2025 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806817; cv=none; b=LTUdCQWXupZd0oIKOOcrW1JZfF0HptpR65NnC3Z5476jvYYSW1TNnLiohtWhxHoeP/XsAR/TI5HzzNb8Hy+F8Kwau/yA6gPvYWTAc2g+NlhCZG8LG9PSWTa+CvwmC3u578FQo0BrxrrgUQsI6fq0AKHDGV7yEJ1zEXSZKXjA9W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806817; c=relaxed/simple;
	bh=Q5BhcgYpE35Y8AxcdDXKZviSULn7xDLW+iYnDJ09n7Y=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=Cvu2xcf1OwctF/68W21TmGNW5snNkc6q5GKLhZUbPyucXU13pfjqvkd9JrdH+YdYPMhGcAQM4VI54VLb/01UDyKLDaV0Av2A1BfZNM9RxwWEUi8IGmxAhLnU9Oj1l+eP3jtMb3jwbMaGKDaLRGpgcTlLNQ8Zlr2MjuF6s632oS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8U2Oucg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8U2Oucg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d3f72391so25058475e9.3;
        Fri, 13 Jun 2025 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749806814; x=1750411614; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Itja5tG6Qc2KiSi1iAZTXe7H2ni0UGVq2sw+wpmt+pc=;
        b=K8U2OucgBRDkG38UsxyDoZOUkaeuVoBdR/Dmm5sq8sSWkpZNHDXDNm8fZfhXkAR1VY
         CSZWC03LOFlGCS596E3qSrsHToe9R2jMaLYgMgUzgTfnQj/CxJj/EVrsOIcYtsmc6MM/
         QVQst6SdzSHANyR2652CGV1L7UCF29ZOcUZcAgHvcj+RiW//eivn542hfqcDMJgRApLY
         2kUM3fieoaIxbfva3f+2JeEQHf2GI6tevHswYK1ph7nk6t2tJm+HMnyAmgAIh9k5V4IS
         4J1iRXBHzRpjKxBsYV+CiL6k6DOhc+zrMEjFmyfQb4G7UuEu2iEVEKLFXdG0oN94Qw/E
         yHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806814; x=1750411614;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Itja5tG6Qc2KiSi1iAZTXe7H2ni0UGVq2sw+wpmt+pc=;
        b=EftGyGZ8sCRhY1mtmcBHlQJF79uC2HhRS9oXkUpne7ScBUw5fcCVaveOSa5nlmtTMY
         dyxHkOYf9HxVZRIxV6KKBqzRia7EL+sg4egWmpuLWo6RarMZj+ivUjzvCuLRcKU42IbY
         nhOdzva5cxJfPU+TuGBVRTkjs2f5BKrtA00SK/dqqRLbzYXVvxmeUkGXivDu1coJzGnv
         qnyjFzetGGiU8NkoeKOxPdO/0F+hZOrQ1qfb/DjxaLU+917tiUuuygBuQBm6CtDStwj4
         qicP7bQJZiZklByJXfMBVJLcnmOgOp/DTra7h0PbphQVJuIaEXAIrJ7+zbOU36THfCrJ
         R/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBcp9hRS4IRFe7EAwnz8HC7MKbxmevcQqbUUHM5N9iHJTXySVJmbgw396Evw809LShAD6eFg==@lists.linux.dev, AJvYcCXvuRumd/tToMfCysTWl+PqqBiE9PilodJt81gMc8j8v6s0jIipXROjU8mqdIUvlL2/pL6duo3vdCNg4Q0qcIlH1vtG5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYne+jgkV6T2xeUM9E5tYG95/tBaJB8fX1nN5Si/YxNa4uRkHZ
	C14udllT/0Vi4Y3yneo09I1KNRzSJ52mj9+SkCog4nIhWNajoWH43eWg
X-Gm-Gg: ASbGncs/wvrCxvdt4rRyVxuTNEgZDnwefnsHMb94cQ/xCeeP3T428skTta6hqli2yyE
	hgoTJS2T4t6iioL5JlyUB0qbpFCIpOTrxLQRVNuqj4MDAoee60WgjPonCeV9eQdxGxhGwpqwCAQ
	RtPAFNLYGSVo9PCmno3P+K9UdojEpIhKyAaWiN0YLp27CbLwWAaEsATVjAvSjiG5JQsn5iyarss
	M3bav3phgNTCITQTIJhrbHSE5cH82TKu7NnCFSED7HbXlpf+Wzx4lJr7uiyliqmpQP5m03dOmex
	Thq0RHDdkJ8/7tqDfpgBBYbmpZb0d8OV/C46xfvQHr6NeiZVd5SgbDM+qRzVsg78XQCydS6rgp8
	=
X-Google-Smtp-Source: AGHT+IEBTo7kIZ4DJ8graOHN/KQaV05qSrUjoSPXsongpILB30NWUheQhDMVK1PCPCF5Qi8PHQzzXQ==
X-Received: by 2002:a05:600c:4f16:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-45335582b9dmr20908865e9.3.1749806814082;
        Fri, 13 Jun 2025 02:26:54 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2c957sm1747795f8f.76.2025.06.13.02.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 02:26:53 -0700 (PDT)
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
  stern@rowland.harvard.edu,  Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v2 0/2] Some extra patches for netlink doc generation
In-Reply-To: <cover.1749735022.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 09:24:43 +0100
Message-ID: <m2ldpwnj5g.fsf@gmail.com>
References: <cover.1749735022.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> This patch series comes after:
> 	https://lore.kernel.org/linux-doc/cover.1749723671.git.mchehab+huawei@kernel.org/T/#t

Can you please incorporate this series into a v3 of the other patch set.
