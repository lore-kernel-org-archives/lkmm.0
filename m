Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5802D5405;
	Fri, 13 Jun 2025 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815734; cv=none; b=tMyyHzfZDxdRyfxp0SuBEH8+3t16icLeuyKttERo64CQr907c7StKUP2cc7pKNyI2+tfkRYCXOaJXdZozkEDEFncy8d1EDf5D5gXqDRnc0cm4IVaTEdjl2GsAGkZjSsUAGOTffPKJko93ZEhn4Ig7NWQ0l2iFcsc6ccxBdatBTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815734; c=relaxed/simple;
	bh=39J8B/it+yKmHYIqv06bQIDCskhQbpop8t56XJh97As=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=mFGrkyqznSZkXppKRBhbaBNGyfMfvz/TMrvgbobAQfxUWByLouzhk0V/QFIjBvjHQhXrtNS3pH/vvzPRh5R+4sg1yBr+2oeX+qFK+V60NIDZ0bFULYeIFdpaSFo1W20KVKzV2podbbyrDY5UptgClYV1EnD/7xQHXAXTCP66Sck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hja276fs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hja276fs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1954913f8f.1;
        Fri, 13 Jun 2025 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815731; x=1750420531; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JJXFHi9ldlQPLqupON6xlA5LEI029g70pUzRWZNKyU=;
        b=Hja276fseXZAUi73uq5ivdvyuwyrqJ/4uhfN288R67TbC8+1pm61Ku9MF7Q5hG20XL
         g32tUGqwT++N5tkHKJ9I/cADCHLotUHb5PD0ITKCUAq5mCCFPqwblT9Xzedf2Q3G+beP
         4oDiyuteGVwC7WLZ+5cuCaQ0YLD4bFJto5xWFEII7OflcXu0dUA6L5M+iIls2sBDsw+0
         SdRbcqCnlfpkEOfel91CQIoE6tOWpLLGrfhppwbwAiJGEQLGhaO2XDhM+eXR4edCylxv
         xFMgcqm0dGVDE1Qxd6mx+WthrEbmJnC38ieRcRamyGl37iCbtbhYOcuBaUYNROb5baTw
         HkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815731; x=1750420531;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JJXFHi9ldlQPLqupON6xlA5LEI029g70pUzRWZNKyU=;
        b=JwnJPrI6bm7WwnCgslKWQ4RzdpawBheUleIzt232OeVkQvRsTM5uqW6UE9rf13EbZX
         ttZrUmX9TRegljDFwMOw91DHr+U/k35YXCjeAXdvcCfKIby+DTs4KfJUod4w4UfgFLRz
         eU0ltwfVMKiIA505WSW7h0w1f3RjYPQAc7pVvLZ8wwMyl0Ryl8oEAli4f43ZP6xgKOyg
         QjhPeTwt4B/vuOWHAACpgMlC/+wzaHFBy3B1goMvoJQrAVJcbihrV9gBOMPEDdpY3JPm
         jN28WjEVJbmQ4EyQvIgrpOjaxULxZqmhzpIPLsBPwq55dQd1J/2kGZvW8hAL5IKhgWlE
         ulaA==
X-Forwarded-Encrypted: i=1; AJvYcCUA3sC1C3UfZy+/TcGAF0asJpdP8YCCBi2Ff/Nwo94kjH5pCB5NFbKbrotIogDwjNl720SXYzKCaCzNDsib9ywkZk/NQw==@lists.linux.dev, AJvYcCWcMfu8Dl44SgDrYGG7Dx5qYWB7Ayhhe8EpzUniD/ATJmSyR7Tk4e5Yh85kqn+Y5OtJqfF5jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7rqoWi7loQabQc0qT5DYijQJz9/YxooOe1Q5REXY3tsmMftPs
	RU01jdQcP12SSHsF214qVqgO7K2vzBBtifZ19i3ECs4Hwjw2UozugH56
X-Gm-Gg: ASbGncvDmgkpMwAdUOIyOFq2UpSbT9saZPOf1k9UDarMANEhPepW9q1s3IRu2hjfYP8
	11plJ1A2cLcSWVvs6VcJ9SzC/9qaI8rEmM0DQ7Ni79Gm1LFQXGAFMWlBWB2afCN6i1foG32e7tE
	8I2fnXjIXbDTJChCo+Ln2s/RX+i5EjaMgEEmiVyQnUVGa12ezE/BKy0cdsgUyN5D4SxFgPM034Q
	oXLiz528MBR36typ0AtXfIoVflJAEHIfoump5P7idV4/Y0JMC3y1L9Vp5f9dge2o/Mte7q1xC1e
	3uXtoZ/reeU6RaWVQffGGj+72t+CHGZk0Vo31JnApuKBmVIZgcMKxYWWc42w7hqJg4hs5bsSXQQ
	=
X-Google-Smtp-Source: AGHT+IH6ZxOKA+nk3cYFyy4sPdDCDQoX/fjJFz1gR0pdr5Ok5AHJOjXsI4WxV20/dTCer5v7vreBMQ==
X-Received: by 2002:a05:6000:2c0c:b0:3a5:5fa4:a3f7 with SMTP id ffacd0b85a97d-3a5687603d1mr3028691f8f.58.1749815731307;
        Fri, 13 Jun 2025 04:55:31 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087f8sm2176397f8f.53.2025.06.13.04.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:30 -0700 (PDT)
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
Subject: Re: [PATCH v2 05/12] tools: ynl_gen_rst.py: Split library from
 command line tool
In-Reply-To: <440956b08faee14ed22575bea6c7b022666e5402.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:13:28 +0100
Message-ID: <m234c3opwn.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<440956b08faee14ed22575bea6c7b022666e5402.1749723671.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As we'll be using the Netlink specs parser inside a Sphinx
> extension, move the library part from the command line parser.
>
> No functional changes.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/lib/netlink_yml_parser.py  | 391 +++++++++++++++++++++++++++++
>  tools/net/ynl/pyynl/ynl_gen_rst.py | 374 +--------------------------

I think the library code should be put in tools/net/ynl/pyynl/lib
because it is YNL specific code. Maybe call it rst_generator.py
