Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95B2E9EAB;
	Wed, 18 Jun 2025 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261378; cv=none; b=GQqTmkekOGi0FxhUcMtLSKRhqUdSuO02x/DRVWzdVfBIqBlgUmt85EW8BupSwW7hgMnJ+MGI7lZnehXix+pkigJXLBdlZD7M2Kj6ooPiNHtwncQ9gVorM8rgIPTbjAe3ozshzq4dMcMB9sceXW7jfg9uuM7f6F6jb2qtPXXHFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261378; c=relaxed/simple;
	bh=ZAdHHI1Qa6a7uSzz9G6krYI8Sdg7y2V5dKsM4QZVgG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc7xdly/EMjtfFCQZuPtNAWKpj8pJRfT3+XGPLMx74CG0dmCQi+2EYkZ2NGhBQJXqpAaAMX7CggdX/awImTyym6jLV7ebqGDXgYvdjtdsVsCQr6/3YeNQAyoYzCGGqTNL0QMA/x1mQW8ll96C1Ekkm99cGnFLo1HF3xVH3Hb1c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad574992fcaso1118296366b.1;
        Wed, 18 Jun 2025 08:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261375; x=1750866175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWYHbpP051s3adQYzbRj7oJpUnu9maWKCI8y343Rnlo=;
        b=JEo8PYBM1eTqZ0Y4ebIRkaDvQBxq9Xw7mKcbXg+8fS1do6SzjDp/sIa888WXtZG37q
         P5Odyg1EODSYfLE1bzfe+Hki0bJc5pIzMnqOpdmi1KZyC1wpSwNB+qUHo/lKDlS/tbrT
         /ebOFTxBReinor5D/0A6ajHx+PQNoL3Jy/VM27TuaNKcfKg+L2+bMeTiZ7T4Kb4ipkDI
         0ni9t6PpLmGSlVeGU8VpUNl7yvLcJX6I03ZeMttxfVLrzsIIJpyMsQiFdFBniFpWOLud
         xEbvz2CGJ9EXEfsCcscubs23LSSU8C2i7hBzlkIt3RxIByLIr0XK4s1Ie/zt77gMowJu
         nVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh+LvUG7oBH/m5+VazKyqB4HOeK7qROWd1MKjiHKmhgC9GIT5nPcavvHqwRBis+/imxKebGbku34yFnkAQG3CB9uJtUw==@lists.linux.dev, AJvYcCV4d+8CpRI/XxQ0bRgIjF75gm/UP2YI0asbpsduxMnuvzA3QEAs/V2dyNE/IzdgdjqKtrtAgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCNj+1y5D9U2baCOuxtoWgqWw5vN3DrS6889fRQFD3/p3IefmC
	8smQdcEbKDOzBlobHXLzcYfs3MKU2mIlhfw4w+f+7Prp4rPbKsdSUznnQu8hFg==
X-Gm-Gg: ASbGnctjwAON9zqVmS9/mdGtKrXJbmaEa/eH7KchLCgGm3AxA0HwCRCALBnKW3WiJMp
	3Tx4ZIIMqErn6oqncEIOqOQOPfBHAxjMAjvAqwz1eRj03eIHk7fkIHtj2dGdbN2rsD68OZp4gaY
	8kM6kNVk4igLqgt9CO6Wad4LvDeepuiBhDVTyOf1lwptclBRXAML/bKcW2Xps4n4hB55pKc0wgF
	w9GUH/iJNFtj26484YxBfiTcbTQg4rAQehxHcQ1VpKll8mzubGUgKJ84CMx99dUU0eWmaMWsJ2l
	iaPtPExj6DBGWfZ+xvZNCJMT3eJ2AcLFg92611Jwpc4lrBw3NluZ
X-Google-Smtp-Source: AGHT+IEZeb5BUZBwW+3X3Mghevtyvvv3qa+6/WQujzPyWQjQVnuNccvQjc/vqxVtBIzGQN0UTopzuA==
X-Received: by 2002:a17:907:3f07:b0:adb:2db9:b0b0 with SMTP id a640c23a62f3a-adfad415cafmr1729558966b.35.1750261374664;
        Wed, 18 Jun 2025 08:42:54 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff5d3sm1104154566b.101.2025.06.18.08.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 08:42:54 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:42:51 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>,
	Jan Stancek <jstancek@redhat.com>, Marco Elver <elver@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>,
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v6 01/15] docs: conf.py: properly handle include and
 exclude patterns
Message-ID: <aFLee2PdbK+6SiA8@gmail.com>
References: <cover.1750246291.git.mchehab+huawei@kernel.org>
 <737b08e891765dc10bd944d4d42f8b1e37b80275.1750246291.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <737b08e891765dc10bd944d4d42f8b1e37b80275.1750246291.git.mchehab+huawei@kernel.org>

On Wed, Jun 18, 2025 at 01:46:28PM +0200, Mauro Carvalho Chehab wrote:
> When one does:
> 	make SPHINXDIRS="foo" htmldocs
> 
> All patterns would be relative to Documentation/foo, which
> causes the include/exclude patterns like:
> 
> 	include_patterns = [
> 		...
> 		f'foo/*.{ext}',
> 	]
> 
> to break. This is not what it is expected. Address it by
> adding a logic to dynamically adjust the pattern when
> SPHINXDIRS is used.
> 
> That allows adding parsers for other file types.
> 
> It should be noticed that include_patterns was added on
> Sphinx 5.1:
> 	https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-include_patterns
> 
> So, a backward-compatible code is needed when we start
> using it for real.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/conf.py | 67 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 12de52a2b17e..4ba4ee45e599 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -17,6 +17,66 @@ import os
>  import sphinx
>  import shutil
>  
> +# Get Sphinx version
> +major, minor, patch = sphinx.version_info[:3]
> +
> +# Include_patterns were added on Sphinx 5.1
> +if (major < 5) or (major == 5 and minor < 1):
> +    has_include_patterns = False
> +else:
> +    has_include_patterns = True
> +    # Include patterns that don't contain directory names, in glob format
> +    include_patterns = ['**.rst']
> +
> +# Location of Documentation/ directory
> +doctree = os.path.abspath('.')
> +
> +# Exclude of patterns that don't contain directory names, in glob format.
> +exclude_patterns = []
> +
> +# List of patterns that contain directory names in glob format.
> +dyn_include_patterns = []
> +dyn_exclude_patterns = ['output']
> +
> +# Properly handle include/exclude patterns
> +# ----------------------------------------
> +
> +def update_patterns(app):
> +

PEP-257 says we don't want a line before docstring:

https://peps.python.org/pep-0257/#multi-line-docstrings
