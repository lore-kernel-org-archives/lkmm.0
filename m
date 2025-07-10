Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE5E295530;
	Thu, 10 Jul 2025 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146861; cv=none; b=Pbgiolg0MIv95XJH0qYhknyqWTFM/9jT18ufRiSlRHg1RcUsKhpw7D9/7j/An1wY8d9+4Aexk5j8Res/03N3g0apMXyqw/RnMpd+DsXGe3w3kNRxyPWTOg3DtSGV3n2kcQH9L+DW37IsMmTAoiOs7RzUbes+HXYohOlN4BALohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146861; c=relaxed/simple;
	bh=YclzCq5dgl0eE5mdpw+qGsvA9kPcMfcy+INW0Pn6OCk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=I+Wrs/dHE9RXybAewVMGP8GFHlFQ3RC71zyeXFNPAcXS4Y7BooYAMG6pMQkIn/k2vtd8Z6IjR0gFMRJ7nkyyNDKsARb8Nt3OwFyQrEdXcJfkkwGm/Rj7E8yM/vV/uIyjaVX+eyBd3aRL3tyWL+cy3Xeb15PZCc8X9wwOVbE23AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc2pVFce; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc2pVFce"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso5902165e9.3;
        Thu, 10 Jul 2025 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752146858; x=1752751658; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aR5gXXhx3VKvItg1BxdxP0PttmLiDwY44F0xz6t0vkU=;
        b=Gc2pVFceISbXV72RGVSNPptrj/k/jLO8kpIikA+XxR0H603fIJAOAfDQ4krSNwD6Wj
         p8KPqg/c11QpM31aqJqVjjkr1IkwnquqMzOmdY0yVMz/hyiVSNOrzkFGgY5cD5Eq3GPG
         ejgECbWgNlwzmlaOjqjrSjrk+I7bgHEXj0QKO8dtIOhN5phDHHuEpYiQLMyWuyeBWx25
         fwjzVIF07nTPo7wNaAl1gyTNPfcWdRxIzWtvPm2D66XB3PEq9DiQyRZM+WQtTmifz2bI
         9BgNO3MXT5gbjITfNS61X9xYS0Hlu+nvL+sauW6cbv0s8U33Vq4S/qVS2GFOOhxiPeco
         PhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146858; x=1752751658;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aR5gXXhx3VKvItg1BxdxP0PttmLiDwY44F0xz6t0vkU=;
        b=b/rtGN2Zw26XHPc1cd/P7bchpojglOhLZ2WkBrUAx9hqqv7Br0iCtI96bYa+oFfEf5
         JO/KDM9ATMDzDaRfdsnSW6rt7EPXs7QId91LpnJ4oUq17GbRhmHdxI7m6L1eeUWTSF9L
         Ejoj5VIxDUmEiQ+IrQ9UFurWQCCoxw0jKGUVuaA9ACYftN+pqhnvckrJ50sJ5sIF+S0J
         rQlfz86UqxkBsfeBGWH8bCXoJXsoaltRsh+mf4IjgjTHH5j2Fylt5LHlLezjXOy2V67C
         Ce49yCy28dAekQ1/BMAD2ZlioFp1HnfJDI+RtQhrXXGxlxdG/OE/rxearo5oDCHZVsx2
         dCeA==
X-Forwarded-Encrypted: i=1; AJvYcCVsXRXO+johbwTRo/WrN+/jeB1SfD5fXFJn67IQKxIY68VSiQksyFVygjWy1y3BuwyocIOaPw==@lists.linux.dev, AJvYcCWTfBJH+AQ82FO6Yl0eK5MAafPefqnvJ0IGcJRzFTDj4J03KQwPo6Fze9T8MzdqhzIqOsWUiNP1scMRV3r55aYcnV/srA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Oh/Bsv4GqiPz0LPCjeDB9q2nxBLEaE+x+6nvoO2ZeTiUvm0a
	LuRV/34g7LFhvrim2F6BtDBlI02n/ATN/ywgncx2lrM7iViIbs4E7aR0
X-Gm-Gg: ASbGnctUiOp9df2I6KZXwOuYTvFHxA3QlA7fR+Bid+XsIs0ZbXd20EafFSsHth2apSR
	ygAzitG45ZELcNkNPoTDG/6O5KNBhcH5xBUMDAj2cZiH9KDfH7m2CwOKGyF2YoIReJciiSiFnXC
	uoXgc5MtmaPwp+RFrRBmy+CgBOyR9h4/zxIczq6whXtso4q6EZr7yIZlvllQsbqyw63d+LAa10U
	Fx33vE4gvZg+fNA5yuFfU7dxLQV3PQ83ORT0daU803AVjnN3kCKU8ynUDhjrgJDxYMCODnYoeop
	zr+cqTnY0aYcz/dokiaTHsZB7NlTMP5AjxpAmmTXpNcz7pvPAxJgzS14soh/DBXsl1yu4Jj6XM4
	=
X-Google-Smtp-Source: AGHT+IGeZUzCYmlnvQ1gNQzLgpBT+E7yRCR2OB33C3dIxv4RY59Cz2VgZaNawdxcr0x12uYPeJ5XMQ==
X-Received: by 2002:a05:6000:310e:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3b5e44e3b34mr5080756f8f.12.1752146857827;
        Thu, 10 Jul 2025 04:27:37 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:a8bc:3071:67a5:abea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1932sm1652558f8f.17.2025.07.10.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:27:37 -0700 (PDT)
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
Subject: Re: [PATCH v9 05/13] docs: sphinx: add a parser for yaml files for
 Netlink specs
In-Reply-To: <eab7fb6b3ab7a29a71c35452478619745e66b621.1752076293.git.mchehab+huawei@kernel.org>
Date: Thu, 10 Jul 2025 09:27:31 +0100
Message-ID: <m24ivk78ng.fsf@gmail.com>
References: <cover.1752076293.git.mchehab+huawei@kernel.org>
	<eab7fb6b3ab7a29a71c35452478619745e66b621.1752076293.git.mchehab+huawei@kernel.org>
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
> 	from doc_generator import YnlDocGenerator
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

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
