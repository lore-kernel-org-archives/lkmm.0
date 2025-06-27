Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2512BFC62;
	Fri, 27 Jun 2025 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022301; cv=none; b=iQIrCp86FbMcEcmmrj+nmW7X4TRO7fAms0T1JKGzYzqWZM/wpE4BItokKKPqQAZZJxjuFuo11svti+M1F65To+mJXrEI8T/hLr4mTYwRoPckgs7pdzZotDf5IvqiyvwyhAY91wktevuyNtvc3BaIho9aCc3F9bPi3VxpM9erkA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022301; c=relaxed/simple;
	bh=Gab9HlTdevtNeTDMwimxTwHY16y/zKL0OdzGVNj+iY0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=b5AqN3VfqB+ikWSJNIODMLgBT1vT1YPlSwmvYuKrquvdX/F0zWhJIDnQO15phTwe7n0czKcQjM8Y9y90y7Mw309YhuoAEgW+bAwu4FBJWxmVQHsOBCp8F7Hd1kp8m7S9S24pr09SKGtdvp4VWPN5qou1rw4Ax8DnRWhZftYYu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2EbYaLH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2EbYaLH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537deebb01so10695665e9.0;
        Fri, 27 Jun 2025 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022298; x=1751627098; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe9OQkLMXpO2IZiw3ZWA9BPKAW+1uGPTqT4qLkMzqak=;
        b=m2EbYaLHeluK66gaOG3BU863VgMP7vtgMJwyEstfe0tsGeaDfznOvcxedx2t45By47
         3CwslZj+FNsp8b7jp3n5IJrjoRYvoQtK1pTLkYy6PfskpyWxXNGmx1DreM+jHwgtXHom
         Hk5eQofCxmHzIjQhrsQFFLMO9LNuBXwhJvlnQTJh92UPV2f9Z8SeMGYz4QhNcLrLGgk6
         vTRlTjGW4OdU7hxfHKlzT95FhrBYbaGFMUqIsK5tvE4q+X5Uty2MeYYzFgZtGSNgkpQl
         VkU5A9SH5VKw5zNgUs3absmVpevtvXnmKuqbtvb6SYP/WK9PcNxGuTSSy2ALbXn3oHyu
         llEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022298; x=1751627098;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe9OQkLMXpO2IZiw3ZWA9BPKAW+1uGPTqT4qLkMzqak=;
        b=l+5TUpNvTT59mAfc4fCdtAsSEHi53gUMyH8Zv5uZeFA+aVctqwcgm581h84r7Z7GvN
         AQ6TlQBAexC9Pk7KC3I3ldv5C+WUe0B26q5tMe+pKrWLuj32M9E9pbmSe45UqeYUkCl7
         w0tg262kPUfFoiDea+J3znlDcVm9tKR5DtjHMn1wXjBA+YLhPpEZAloK5hK4lPCEGdmX
         G0HAENS/IQDWJtCCU+Yq8jMNkE4oeSm3j/VzFKdRXxaPG1N8/XSAbOKoVJmJ3G+xAGU4
         uqSZRboa4zW3zIQxvfSUd88B/id0z5sfEC/Ir+HaM15teXiAxpavTraHytZ/LzMUK3xW
         yW3w==
X-Forwarded-Encrypted: i=1; AJvYcCX/XfNYx/OMC6K8UtKT5fvjBhZZa645UEim8EmTpoDw2SuB/3FN7DIRAqmf4buA0G3XU3kIJPgnf0LpOkhsSgo87Tz8xg==@lists.linux.dev, AJvYcCXpQt5zmU2dNzdU+AT6nb0xze1VtX1g4/w7inxxyeKy9jH/XSORZwy6X1HI3FtsDTJMAK4Mpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGduUXb6zujN6EWsHA6KshuKXZ0pcFN/Dpn++2hgGZafQr3EcI
	pX4T2iBVIiP8HyB/ILsZc/SBX5LcvUyMvHeHhGd6qY6M9ADKL+g1QFw6
X-Gm-Gg: ASbGncvSRqpI5yJRH9DC8DYBurAcWV5FSAuN+nnE5XuYz1avsrtGE/q+XLF9Zk6yaHf
	nt8vnnZAvfy0fuhZVE9jFfS0hR7Jy5T85XptmhhVlDMFiK+eITXWOjSdWJwDf1hW3X5+leLbVIC
	vBvz76MXHENSBs4tNb7KhiqxbmnDbRa+5AXDxgvQbKmM44ypG+ta27E7YPQbNwq2sZJ1KxrcLNj
	nxXgzm/RjhsFgV2WDNy76yXvxZMc2tcsR6R8J18xpOH5v3vtD4IpnTO8jYyp0+HXBVSmdSKcc1/
	ducpxA6hSrrXO2ua3z/5WGmGbqyu7DaXkTR2m5t8nPp5K/7Y5nlGnxSTngBub2Y1hNuTNvi9hA=
	=
X-Google-Smtp-Source: AGHT+IFVcMpR0rLM6VYkpxbugODonjletnVYfb7gUIKV7lAQ+3Nt5KGTvKv9ehhSsIEGXJogIF2sYg==
X-Received: by 2002:adf:9d91:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a8ff51fcc6mr2124588f8f.29.1751022297497;
        Fri, 27 Jun 2025 04:04:57 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm2432679f8f.95.2025.06.27.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:04:57 -0700 (PDT)
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
Subject: Re: [PATCH v8 02/13] tools: ynl_gen_rst.py: Split library from
 command line tool
In-Reply-To: <bf7908e3b23ff85e245e4ea151d8b5be69de0814.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:29:39 +0100
Message-ID: <m2sejl8oks.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<bf7908e3b23ff85e245e4ea151d8b5be69de0814.1750925410.git.mchehab+huawei@kernel.org>
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
> While here, change the code which generates an index file
> to parse inputs from both .rst and .yaml extensions. With
> that, the tool can easily be tested with:
>
> 	tools/net/ynl/pyynl/ynl_gen_rst.py -x -o Documentation/netlink/specs/foo.rst
>
> Without needing to first generate a temp directory with the
> rst files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
