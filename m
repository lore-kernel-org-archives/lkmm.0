Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8806C2BEC2D;
	Fri, 27 Jun 2025 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022299; cv=none; b=jOescGaoblpSLD/nbGDi9m1svk+IsanGaux7WpWi7rFrylRDGYKRyH+mwbHmm7wUPuOAmHCzK7TlgOdsAMFxoYL0bgymFPq0ZRKJ1BirLwzkE0mbzjUxejIdAeW78qJc7S0IBB1Z+coTov4ABxmjvx1LtQ78L+swt4LTGcrYpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022299; c=relaxed/simple;
	bh=7OX2gmVdzbsDMuU5mDzT/dNOdFBH3pSx7pn8SHF3BpA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=BIYsXLL4SeSg6wp/a98jhlZ34X+XQP5lGVjQfulY7OmzarPjl/rsouM8NngKLDXjmZtXb8+i+uQ2bpnQJQWO4c9+ZK1hrypqJIdw1Bdzscep+CCwjWaGN1vyXfEwoOEhKC8QZW3wKcpnLK9kroZKs5Jmgwlw1hhew+p2g+3T36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmL7BaN5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmL7BaN5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso11253115e9.2;
        Fri, 27 Jun 2025 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022296; x=1751627096; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w+sVT4qtdvzplq7Tz7qyhzRU8mVdcqltow7utE3n3/o=;
        b=MmL7BaN5/NVMW747bTFOT0744/qmQdroY6e3vxYYHQBbTlmBjbHVDlpLclBFR5lC0f
         3BDGsgbNoWCNHd+KWKIDEUYsNGP6SgozW4hTM9znHqEg3wNjkQOl/rGdIgmMfRH7zXyJ
         gXotx2O1lwk3wdae2X8ZHp+YE1cw0KdJTl3MlMf5M8Yh+lyK87fqmjUc8+PDgqzbdhbk
         +nkVV5Iidl+tEvsh3mk9Wx4PqZ8f/QoBCHbEotr3cJcDKKFpynmOptut9+L6zpmuVNDG
         LuP3iRvL1GAuv+Swc4zSMcPATFs4t4rfk7dgs+7dO1CAcd4FjrTTGXyXK0FX9n28mruy
         lB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022296; x=1751627096;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+sVT4qtdvzplq7Tz7qyhzRU8mVdcqltow7utE3n3/o=;
        b=JwYtADOFdi2J9teB0kHCP+i+Uybgwn5q5JQMH0r1yopfMBqYy+KU/2ulkrYFKmY2+M
         wuLAXIcKrUIpXcHhmFNwmwKL4OKl4xNL2eTmoQlRZfD7D0XGbz1Pg36Vp845jNTnT/Pv
         /Zgw8coh4AiR8vqI/CBTq2Cn/0uD6XrX6rK2mUV7ZEhEzubvtfDVwF775Xbn9qxiduzN
         FG1yGRdABJNkFCZ38IcikxrsHm0IW8bFZqGzKaYMV4Ht8SPVd8NPL7FYxRKrgHep1JOP
         9+rr1HdEbF6L65RxCdCV+KbdYZABTUn6+AgRKylT2EQoJQ0elm2+kgjf/BQRlKigYLQb
         xFaA==
X-Forwarded-Encrypted: i=1; AJvYcCWP+LyVhYeptYhkj5JarY/MQwMarLSAp9ODMuw9CQ0tig+8PtdqXuiYNLvota6Kl9lHj4A/Cw==@lists.linux.dev, AJvYcCWu3ALm2VYO+wv1K3t3FUrc3nVcSr/q0c3elJByo4N2l7CFkNyMJNF/W1DzuegA6PQG5voWDrgMNrqrcEfos4af4zUkQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTUKI3wPbDClij6gkxaLq1XZeYI+fIpQ90wKA1chZhYpwKlwda
	8hJKANi6Qw+OYzJanGPBkRhL8OiSHVWVE/N3hFvUqMbN0R+QkuEQkQjF
X-Gm-Gg: ASbGncu9VRi6KOVXKtqQqBbLK5ktPS8+AkCLz5L/xVx7XTLv8KoaIJpQZCVEXWrhuYm
	DZ76wbfSUklAyNd16tWCVSH4KrhdznkGJ8Il0m8sQpPbP+iL+67CZbR12CTRp0AhT04TSCS8rKB
	aBvJaABny9UiBLGSXx9FDfoZii8KtIDQLXTjsGncZL358muDX+Hi1nfhyUjGO2vbcBOsvjZ6VhI
	Aco6+DhhvCSC6i6kVOLnRY1Bc8GEjT+eTNF+43hyI5OGXxbFBhybqtdeNHQdtxA4qO3TSmgH3EG
	3S82MxIcIklTY+pqxJGZ0K8QZlhJSucKx/MQFQqnH/QkKpsDQwVDztE2XnJuwIyzxcVx2/EiMg=
	=
X-Google-Smtp-Source: AGHT+IG5sOZtrZ/xkGKBtpPDwO9ulvETh61gbQZuRWutZTAPMm2RPvXbvSU+mZffShbCxp1x7KeuNg==
X-Received: by 2002:adf:ea49:0:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a9001a2429mr1995199f8f.43.1751022295630;
        Fri, 27 Jun 2025 04:04:55 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa5easm2364868f8f.26.2025.06.27.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:04:55 -0700 (PDT)
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
Subject: Re: [PATCH v8 06/13] docs: use parser_yaml extension to handle
 Netlink specs
In-Reply-To: <34e491393347ca1ba6fd65e73a468752b1436a80.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:28:40 +0100
Message-ID: <m2wm8x8omf.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<34e491393347ca1ba6fd65e73a468752b1436a80.1750925410.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of manually calling ynl_gen_rst.py, use a Sphinx extension.
> This way, no .rst files would be written to the Kernel source
> directories.
>
> We are using here a toctree with :glob: property. This way, there
> is no need to touch the netlink/specs/index.rst file every time
> a new Netlink spec is added/renamed/removed.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

This patch doesn't currently merge in the net-next tree because it
depends on a series in docs-next.

> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index 585a7ec81ba0..fa2e6da17617 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -18,9 +18,9 @@ from sphinx.util import logging
>  from sphinx.parsers import Parser
>  
>  srctree = os.path.abspath(os.environ["srctree"])
> -sys.path.insert(0, os.path.join(srctree, "tools/net/ynl/pyynl"))
> +sys.path.insert(0, os.path.join(srctree, "tools/net/ynl/pyynl/lib"))
>  
> -from netlink_yml_parser import YnlDocGenerator        # pylint: disable=C0413
> +from doc_generator import YnlDocGenerator        # pylint: disable=C0413

Please fix up patch 5 so that this diff can be dropped.
