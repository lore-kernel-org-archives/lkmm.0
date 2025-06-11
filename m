Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F1A9B32;
	Wed, 11 Jun 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657320; cv=none; b=hCKn+APfghuv+Xcalv920Fm4+RZ7OuMhMIUQBWV4Tr15N5teMxkQi361oXP3Bnieze3lqT4N2+gFEJ829pynV4EdL8fy9x0xXkcTY2+ZeDfG1BHeNLoc7JCESwKbDZKtfg/IFyuZzThJfgHhdWzoxO7KZbzbr7NlsPkkg8GWHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657320; c=relaxed/simple;
	bh=RuH+17plmVtHYvKUZVvFokwqhJyYZSSTBslAfWYSSes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKNXhAzBDPtypYOwrNHbtTGLFHLGX8Ltnb3Gf9dr6IW07Jd/dOMh5YF12XcAKx2HHUmVF/6LDs7giVwWVQxUtOS60vazdMlkBAI0CdfaND9YF9/LmB1OuVK3+Pzc5O/nqtbh/C8rGhJr3LCK2YLHFbtv9AbJSbvPNOyytejXNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-addda47ebeaso1310200966b.1;
        Wed, 11 Jun 2025 08:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657317; x=1750262117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dwG9EoMZ9ZKiC4ZdlNpo301IGTXAAOKclnpBssAG0E=;
        b=BBkWmCQMVH+hydSDMkSe6/K3jxWGKf0Cg9MWvs/IBKi43LlxLM2nPoMe8obQijU2PR
         6voZB/cH/TJr3YSCJxZcNlfVV/wNSmy65Z96OvwxMvSLgL4z7+rlNCFnpz4vqmDrVJYX
         5mZfqcsKC9TOPDcxr/STLINIHCUNspdxnR9jgMrgk6pOXdq47iSrfJWeAQBI99zsQ3G+
         jW3Iu5hqO9e41ENwL7Iguof21KxooV2SuPWjqFvaCGsDDz8+Mt4xde24jZCZUmeN1bLC
         2nLuXrV5qa0MIYbHEVOceeHMZ0tPjSxpRw0mT94WCLIPEaA3TgVbCxkUMLf3ofDecdY7
         o3sw==
X-Forwarded-Encrypted: i=1; AJvYcCUKhPtZCie54BoS2BV80T+0N9/wugjJ6R5Ke9dH7c1S5h6ME4YAl6P5qeWxECu2k3NcKwkvPetwYQhD4cggd/uHOqJMXQ==@lists.linux.dev, AJvYcCWWig9RPzKRhd34YNiKsWEwcMRvrlI7RWaYXNIcHblNhJ/3ovBjrFj4dowKZ6Zjr16X7rECRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx88OWt/xLLGiIcKi2UfFQdhV8acV87/tJOmZBayou7qEuTwgJp
	KTWoFewLaYH2XgAHj02pHFrDjh1/iqNjaxGvHrNQHYTDl2snDWyTTDqm
X-Gm-Gg: ASbGncv9nz9D/cZHMEymYWuvn/To8avHbOuCdQ/KhRQlU+wS0zst2rjp5vfcHPs1XYi
	w0S/4+3k8Mm9AECxzooh6jpIYL962LsLj+JYvcLEX2KKDm99DQ5ySoSombvCzc8gdy60SP07905
	MgVbVD/YVxHxWKajXxwOgu0bw48cm3D/Evpv4IRW5TJ90kKQm9kXkxVYPj2yjJ4seiyxVHl5kTa
	iQUz4MO2kujVPG9OGCtw0/HPsM8KU+8pWvIAedhQ9K8/NN5cC1cjCdnjA5b6j6Etv91T7PwWGYb
	tmwIE7hM2QRt2mi8cdazQ3kP5MhuzmSy/JIBRm3OeZg66GkT8tp/Zg==
X-Google-Smtp-Source: AGHT+IEsIs1LfkvlptHxbiWYOk1v3wDTy5QTNB0kKe4Qx9gAubVMpbktdWpOaQty3ez3oGX+LfxDTQ==
X-Received: by 2002:a17:907:7210:b0:ad8:8689:2cc9 with SMTP id a640c23a62f3a-adea378cd5bmr12817366b.56.1749657316839;
        Wed, 11 Jun 2025 08:55:16 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db57610sm919089666b.52.2025.06.11.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:55:16 -0700 (PDT)
Date: Wed, 11 Jun 2025 08:55:13 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>,
	Marco Elver <elver@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jan Stancek <jstancek@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	Ruben Wauters <rubenru09@aol.com>, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH 4/4] docs: netlink: store generated .rst files at
 Documentation/output
Message-ID: <aEmm4bHxn3+l0vDO@gmail.com>
References: <cover.1749551140.git.mchehab+huawei@kernel.org>
 <5183ad8aacc1a56e2dce9cc125b62905b93e83ca.1749551140.git.mchehab+huawei@kernel.org>
 <aEhSu56ePZ/QPHUW@gmail.com>
 <20250611174518.5b24bdad@sal.lan>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611174518.5b24bdad@sal.lan>

Hello Mauro,

On Wed, Jun 11, 2025 at 05:45:18PM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 10 Jun 2025 08:43:55 -0700
> Breno Leitao <leitao@debian.org> escreveu:
> 
> > Hello Mauro,
> > 
> > On Tue, Jun 10, 2025 at 12:46:07PM +0200, Mauro Carvalho Chehab wrote:
> > > A better long term solution is to have an extension at
> > > Documentation/sphinx that parses *.yaml files for netlink files,
> > > which could internally be calling ynl_gen_rst.py. Yet, some care
> > > needs to be taken, as yaml extensions are also used inside device
> > > tree.  
> > 
> > In fact, This is very similar to what I did initially in v1. And I was
> > creating a sphinx extension to handle the generation, have a look here:
> > 
> > https://lore.kernel.org/all/20231103135622.250314-1-leitao@debian.org/
> > 
> > During the review, we agree to move out of the sphinx extension.
> > the reasons are the stubs/templates that needs to be created and you are
> > creating here.
> > 
> > So, if we decide to come back to sphinx extension, we can leverage that
> > code from v1 ?!
> > 
> > > -def generate_main_index_rst(output: str) -> None:
> > > +def generate_main_index_rst(output: str, index_dir: str, ) -> None:  
> > 
> > You probably don't need the last , before ).
> > 
> > Other than that, LGTM.
> > 
> > The question is, are we OK with the templates that need to be created
> > for netlink specs?! 
> > 
> > Thanks for looking at it,
> > --breno
> 
> Hi Breno,
> 
> I did here a test creating a completely new repository using
> sphinx-quickstart, adding yaml to conf.py with:
> 
> 	source_suffix = ['.rst', '.yaml']
> 
> There, I imported your v1 patch from:
> 	https://lore.kernel.org/all/20231103135622.250314-1-leitao@debian.org/
> 
> While your extension seems to require some work, as it has issues
> processing the current patch, it *is* creating one html file per each
> yaml, without needing any template. All it is needed there is to place
> an yaml file somewhere under source/ directory:

Thanks for the tests. It appears that the sphinx extension can function
without requiring stubs and templates, right?

Given you have your hands dirty with it, and probably more experience
than I have with sphinx extensions, would you be willing to take
ownership of this extension and submit it? I'd be more than happy
to review it.

--breno
