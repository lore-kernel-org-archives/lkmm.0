Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B128691;
	Fri, 13 Jun 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819234; cv=none; b=spMV3TwWIiHZf1zutjEh2/PvYMhk/QpPb4t63VTRh+c0KP/qJVg4Qz7VnxqwYnfpkJwkXL38f1hU0sInThNyrJHAgK1KA9xgZ8w9aBGAeTLci3KqSrvFjvcYfh+5v9vAFxiaUUFI0iaqKbLseHGVyvW/ytZFeodbA170a2FHHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819234; c=relaxed/simple;
	bh=xsyK3DDIp1rgLxrUI+jVN6D+Sh2hh46tvv4RC/83r74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBNIqPkccJQf55a4MsJMzbwO8nYgO26h8e/Hc7Lb/DMHOndqLOZoTgMQeDndn0GOlSrRRUECsYonAh7VX8ECHO2MpNBF2pgD8a/ThLWQjHU7qdrwBCVIoi4pgyhBBkKKfMu7K6INihmzxp0ZoCPKwAlY4LYo5xFrEtDI2M9+Bs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7e/EDtE; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7e/EDtE"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4080548891fso635707b6e.3;
        Fri, 13 Jun 2025 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749819232; x=1750424032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9uK7NfXjMZE9zyAnGAVVRnIGOP/qUCD+jt4heNuFuQs=;
        b=e7e/EDtE1NhALwY1m13p5gdBk2/kKKwwr0LalIl0HwJtb6Rs/Am2ryclWEPoSnRnzo
         YX06pTNBNZgia0C4TLaEdQAXTsd7vMlsPySSHtGnWTlctOWg+qaEoVKVWFlnoF7Xew3b
         khu54rNadx9F7mtEfr/1i80l7xCenBHau/g/n5dW0IB2SaYb+HrFAa3h/oZEil/eTLL1
         /AzQQ07MJ/cmCrOFjF2aKjaBPWgFr50u3fT3PszbP7dpcq21Dv5A2NB/+O9tSC32yGP2
         CRDwwbqEDyFlBMebu4UCHeDsRFK92e6bzz1uHG3z/c2LWsAN+JliXxjfqfrpx8+uTrpY
         ajYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749819232; x=1750424032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uK7NfXjMZE9zyAnGAVVRnIGOP/qUCD+jt4heNuFuQs=;
        b=ZcNIgRszQHVlUQ3Ej56J21FFSaWPRIFiQ6/jk9Ji3RkvzGbxxCLxx41j8TwaKu839B
         aqWFH5sr/LJjp522AQaRk0UmkXQgXE+Q1iGcxdpYj3KiUaAR9xkGMLhyxyc57YYTF5FZ
         xl1ZII3JQr8Gk73C9O1ltVP7l0llLakYOirfze0nouPMZEg1SeenFQ8X5KfoPsV0jeQB
         dfG6PErQPYc9n17PN+C8QnTPbzwaYKtDREAzrLcZVa6tblHoVT68VoaD2Zjvd++uSoTY
         0ngvA/gVqdczvQBKsuF8spl6iZCAysKy6zXYZ4P1tRlYnBWpcdlwBnVmspuqVWz5cEGT
         lodw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ130vo1Hh3yxemeh/29mDBPqNh5982UVLODI0A/xP5EQyLm/ou2jqkP2wJ59Qz34d/TtPeA==@lists.linux.dev, AJvYcCW5v6bYMM/wyxK+hIG3PyOUgm3tTGRFE4MOi61TfEsNCzJWRVVGIJVkOYYq/a07tf1ISTdX4thn80mUxW5CzYGrYlrjMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeq/Mfp4PbrWd0+S665vyb+TEcLSEjsWvL1+x/B57tlFOL1QNw
	EYfbz54NF36WkegK74h2pEA7V6KdcUn/Eo/l6bRXlbEJZwdTa1IPiehDFBUFONFb0sNQ0P1qUu6
	1HWVhh3bavIbjplmvKHLVMPsHqxmVYF0=
X-Gm-Gg: ASbGnctYpLxERpcMN5RrhiEVDGFRmobdB6orN5gLvV2V2JAgKSk3+fU8GzjlVu7y9Le
	Om/IXUlQObjx3V+5UXJGGNVEHzeDED6IrOgD5ld0w7WmlGFAZ8XVonLxuAosNIU7PjFh8VT4sTD
	gwL5T48qEKbxPiXrMvJrFtBNEFM3+lCIrVohXYUmzre4ewxRHFPqlOQhInMIp6Szif4f/mApUj9
	g==
X-Google-Smtp-Source: AGHT+IG4oeSmNbFar9MLWvDxuCLCzS1cvjPlujNGI66zalqzF9G7WhJe/7gNkuUgdZQZqQaDPQKfIQiwXIfWMIU4QXY=
X-Received: by 2002:a05:6808:4fe9:b0:404:dd07:9703 with SMTP id
 5614622812f47-40a723a0827mr2330242b6e.26.1749819231675; Fri, 13 Jun 2025
 05:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
 <08ac4b3457b99037c7ec91d7a2589d4c820fd63a.1749723671.git.mchehab+huawei@kernel.org>
 <m2y0tvnb0e.fsf@gmail.com> <20250613144014.5ae14ae0@foz.lan>
In-Reply-To: <20250613144014.5ae14ae0@foz.lan>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Fri, 13 Jun 2025 13:53:40 +0100
X-Gm-Features: AX0GCFueKdzQLScURrrCaq--58okmj1NFh4Gy-SFqVk9_ecMKypyt0JhaFhZIuE
Message-ID: <CAD4GDZwLW0yogWitN5vbfkDhpZZ=0YCnDh+taRzwnv_CY9Miag@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] scripts: lib: netlink_yml_parser.py: use classes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Akira Yokosawa <akiyks@gmail.com>, Breno Leitao <leitao@debian.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Ignacio Encinas Rubio <ignacio@iencinas.com>, Jan Stancek <jstancek@redhat.com>, 
	Marco Elver <elver@google.com>, Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org, 
	stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 13:40, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 13 Jun 2025 12:20:33 +0100
> Donald Hunter <donald.hunter@gmail.com> escreveu:
>
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >
> > > As we'll be importing netlink parser into a Sphinx extension,
> > > move all functions and global variables inside two classes:
> > >
> > > - RstFormatters, containing ReST formatter logic, which are
> > >   YAML independent;
> > > - NetlinkYamlParser: contains the actual parser classes. That's
> > >   the only class that needs to be imported by the script or by
> > >   a Sphinx extension.
> >
> > I suggest a third class for the doc generator that is separate from the
> > yaml parsing.
>
> Do you mean moving those two (or three? [*]) methods to a new class?
>
>     def parse_yaml(self, obj: Dict[str, Any]) -> str:
>     def parse_yaml_file(self, filename: str) -> str:
>     def generate_main_index_rst(self, output: str, index_dir: str) -> None:
>
> Also, how should I name it to avoid confusion with NetlinkYamlParser?
> Maybe YnlParser?

On second thoughts, I see that the rst generation is actually spread
through all the parse_* methods so they are all related to doc generation.

I suggest putting all the parse_* methods into a class called
YnlDocGenerator, so just the 2 classes.

And I'm hoping that generate_main_index_rst can be removed.

> [*] generate_main_index_rst is probably deprecated. eventually
>     we may drop it or keep it just at the command line stript.
>
> > The yaml parsing should really be refactored to reuse
> > tools/net/ynl/pyynl/lib/nlspec.py at some point.
>
> Makes sense, but such change is out of the scope of this series.

Agreed

Thanks,
Donald.
