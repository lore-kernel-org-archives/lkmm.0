Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1622D1300;
	Sat, 14 Jun 2025 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749907806; cv=none; b=VS/rmOhp+81wASW2V7lcaaRvx20WhViYylUzrK5jbsG7IPwhvj7qZ4PTF59HeubZuXO7ZBuWkxBNnHRfH7BuvECNfyHi6N6a10wNbwk/t9GXKb/yEAEin5zXu8+60kkQl5XdUfBuVSHH5WEa8akHr5lM1rDdsd88W8gCEOhEJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749907806; c=relaxed/simple;
	bh=a4+RnhGxiQVnAjxqCAjlsrCrgJ9m6DH1744AYL0N99M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLah13NC1uvYaD1bk40qkw7QvFEf+EOOLSppZFprzbglAdiQGPEUAWvnAKxVQCqD4+Bs0NWMd+hZBiqGWcxnTpwvBYxwZwS7PHhmNocYflpjZEkYfxa0L1btl8DqDzczG4eXp33DCMhb2Y5XSVctFokSUE3WNKtPKludhDq74qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmHLjuqi; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmHLjuqi"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4066a0d0256so1978232b6e.3;
        Sat, 14 Jun 2025 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749907804; x=1750512604; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpxLAeD+HVolSZVyFVghlR1xvl2/NKfSFQXQsuCC2t8=;
        b=KmHLjuqicdP6/am9iDcWO+2Oxrln2gdQp2E0maOb5s5pWaPtUsm6M7zdXrib/xYdpM
         mJyh9GMiB7Yz86OtTuY7ctSJ+HbERIVqTjNV5MWKU84ruy9LMRXNezvffxumVay2eRGQ
         F+myQ2l+oM+4y9Z5LOpynuU6pTsVH23tKTE9vANzc937LE0vlYzoVbJqShI+FoIUDBM/
         l9M1IaCelkCL/7ImopmY+u4IzTAxRaCzgTqS5+6ngjWyvFTIekLWfDQDmLJdgVZAN6aw
         07YWd7R/8cv2/kuUGhM8mTDmuPXL5yHHkLntHq9zX6fo+xO4IXqkyf95bW1cEiiaUfTr
         D29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749907804; x=1750512604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpxLAeD+HVolSZVyFVghlR1xvl2/NKfSFQXQsuCC2t8=;
        b=LNJ0VGe8PIyRoDeBkehYhRa3ANm7CCx0Izz0wTzmrAmuIX5Oi54GBKzsFZNAqeBhwZ
         Xf/YTgoBatRxtJFkPcVzLvJyWpYWkMcZBiQb4gb+tvqJGAinb0JF02snz6Pa0COJ0SzE
         fQSKp9ppU3bTxeN53afErKWKl7v5Z+7NT65yfBMjX14p6+Ni+LDZDIz0dvdgO0oAQCD2
         b8tIqXKW+Tu8/Rv8UZ/1i223PNfwlDo2O3cSPCb2t6QO4OSo4Rur0StvA4rc3VwThv0f
         BUWZp4OaF3Lo5xXsVq0mA+8pYmik21o5uRJ5wgRN4CjV1vl5KJawFcslU51ar6BQiFyN
         NaRw==
X-Forwarded-Encrypted: i=1; AJvYcCV7q7P7jYxyET50SiA+GrYyp7JDhSi3rNKr4V1sV52DlsaBxcqID8aUZ5ShV3sox69hb30DPTQ9iJ+E5iAXkGdFAJZFwg==@lists.linux.dev, AJvYcCXEfj/ZqTpcIUk8WsoEKq5VDQVyQK/NMQiotts/ogF+4gp8RVtN54dYSXhgxfEM8/EjNo67vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze8PJFv0F0ZuwlFGZ3MsRrA+XNrEuoh5uizizt0+f8q0ddkGIn
	gRz6KIronUAvcIRMCLtRgqv3SW33/W5LMt1EVVAJlIGweUOuAHBcRkzyPnDmhTqdVmfNO6eqJul
	C5970C1EcEo1vzuaYU9QRsono0SRd7Bs=
X-Gm-Gg: ASbGnctL0A1MuOsY2HWd7uv7pIPjpF7CInQ2DsB8Wy6WSGZyA//7qzYlhr9DgrB0uON
	tduqIr3UTjSmV7Rpe3aCAxP/BAzaWdbQbx9g8GUdc62WmdFpel94Fi7uAoZVg0pvcVHs1Pfks2u
	+I0f+CZJMVZbDhGw+S5QnCtfqg+EqRHX5N/njzYvHn7qAbXohEfZIOUGVRGjjGhmuUCY/e/IhdZ
	w==
X-Google-Smtp-Source: AGHT+IGTVlBMWe1jUtHr/9UxJLQLB7fTFlDVLqP+v2cbZPfJZOQCuTo318T7Bp2vjunGuEb33YuFW6h9rg9YFZ3d2OQ=
X-Received: by 2002:a05:6808:1b2c:b0:406:6e31:18a1 with SMTP id
 5614622812f47-40a7c1b1ea5mr2201254b6e.2.1749907803915; Sat, 14 Jun 2025
 06:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
 <m27c1foq97.fsf@gmail.com> <20250613141355.1bba92fc@foz.lan>
In-Reply-To: <20250613141355.1bba92fc@foz.lan>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 14:29:52 +0100
X-Gm-Features: AX0GCFuxx8riQsYcwnktkvT2HBgg8dodkVLgKdtxUeyINtr1KrOWe6fVqRSEbVM
Message-ID: <CAD4GDZz-hVEWhSP9sGqZH2tGrU9T8cd3aed5hRtMNZcXk2WmNw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Don't generate netlink .rst files inside $(srctree)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Ignacio Encinas Rubio <ignacio@iencinas.com>, 
	Marco Elver <elver@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Eric Dumazet <edumazet@google.com>, Jan Stancek <jstancek@redhat.com>, 
	Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>, joel@joelfernandes.org, 
	linux-kernel-mentees@lists.linux.dev, lkmm@lists.linux.dev, 
	netdev@vger.kernel.org, peterz@infradead.org, stern@rowland.harvard.edu, 
	Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 13:14, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> >
> > >   docs: netlink: don't ignore generated rst files
> >
> > Maybe leave this patch to the end and change the description to be a
> > cleanup of the remants of the old approach.
>
> Ok for me, but I usually prefer keeping one patch per logical change.
> In this case, one patch adding support at the tool; the other one
> improving docs to benefit from the new feature.

My point is that "don't ignore generated rst files" is not a step on
the way from the old method towards the new method. The new method
does not involve generating any .rst files so the patch is something
more like "remove obsolete .gitignore from unused directory".
