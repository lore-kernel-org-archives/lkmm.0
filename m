Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E822E62C2;
	Fri, 13 Jun 2025 11:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815744; cv=none; b=kc1fiKJhmmX+Y1Qa/sT2XxL9Na19XSBgaxwhnyZIAxdP1Y66wVQ6FrVfmxd7houTxv/PLe4K/EV8hVKz7oY4umATCxOaNpBkWFpvswajryE8DDvmvfGy7TqDAm/8RSL7ZLdVHfE5H0k7/mLk5NJMf+cd+5Cw3VaYmTniMgvfX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815744; c=relaxed/simple;
	bh=d54+gSW1JK4j62Cxqb5brtnTXHHA9kuB6ewvEvemkwE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=F3gKV4/gP0eDCb5P4hyvUGVrpCIJK/sEholRZkuj77m4u5eh6Nn4YrOlu3nyj2X9AgT2wvHgVjiAEu5Yqe1ZH9NR1MRQZL3KCsUSixpjMsdTxUfNaZSwSG8B7j+KRArENJRdccyfahgb9uLu/8kQE+Z+vRHHowwkweB0zsFplEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQzNORr9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQzNORr9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so22171115e9.0;
        Fri, 13 Jun 2025 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815739; x=1750420539; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CQWoVNWcriJachxlqnlzulKdD48PUrSHgzzEoQPD1HE=;
        b=kQzNORr99UbHAaemPELD6zys9JXTi7nMNaQ/+T5KfMNk98ScJqmMUvUqJsA4X/QfZO
         7v3KYUCDgJRtejV9EVTqdSXxJFDZ/jalPvMsjkAT6TuYm8H7CZPW2VPOo++lGy/VmCC2
         UnZ11G2GhdvCvi4Uq4cpyo8gwayTKT1K4+C21teWdXqs0AlGkw1VhVfDpX9/ZjN+4gcH
         3TtXDNGGboEm5ceo7d8wFVEOa4E3z229PjvRD85cQ28bp+tpiKVnLUoqMAbSG3Zd6PCB
         6t/1tQWQABfgj4JjVdolwjxVzj3vpX1cBsjv9dCNTAjEccvtRTzMa9LugLHC+n1TQdce
         2ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815739; x=1750420539;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQWoVNWcriJachxlqnlzulKdD48PUrSHgzzEoQPD1HE=;
        b=krl2E4IpwstJm7n3O1sjJaLLhFY3TjnW7zFzLlFKc4QVLGYhZcQZEiq5OaM+VCOoyB
         P5ibYvUngJH447JyOqCEXW+J74bMyrhNJF2+ByMSeQg+9wtHsDiNfB4wvJ+Q+hje6YE5
         2U/xlhTFBtsXChf13OtraGObw5VtFrSU21aXiATg0N03qtG9rfdnEfYgaGdApf4ANG8x
         wO3sVnKKl82+oDYzJ5mvYgI6FQr5YfVB5LrJid/lytKnxVWyw5Ez9D5u/WMhe/XN6mfw
         b/yGrvSq1FXcUTjqDMRDsRWuPgcFRm+p7iCMqj/GKb1uKAxyL9TQirVe7uiuhTGndvUU
         EfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUrYBBqsKBxp1ab2l17W/ltIZZlZ4Y3QBbHmmiv+NTxCV+pJCh7RYZV9eDF+zkE5yDeo9VJR8df7U+8aLvBCA9hhiFbIg==@lists.linux.dev, AJvYcCV/WTaumRcCuXhLGzPJeX3RZES9Beg0+NVoCq19wuxAONGERlLOtbhDtl8up+dcBRHCmXCzUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/SmIu+bx4zF0vwXuM9B5ZADksrWqOWbZjRlGGCJrQEb82nmNl
	FKx7qM3B0sh76ZuKufBWa2J+crqDgLkI7XgpZ07sfgJ18Z/v36RHonOr
X-Gm-Gg: ASbGnct5WNDKY5XM+dutoz8a9jv0v5TYfSsXTqCzGMIVmy3RVXov9eJpyBo/RjLSJiU
	pVhiSt/Ni/Otxcdnfh80XlNvshztU0nWNXAf5m3AP6+nmPwOnbgdXylt3we7D/UMHsl37e7TB6N
	+4+t+5aNlfHRb1ED79+Z8SzLU3iY045rzNF6vE5R075u81Gg0nUfb+twLUrkGSpwOKBJcjERNp/
	fbCxuzqzhK+WTxVU8J5tzDjgdwY5KVWKF94qAlGfCAdy57gk7jZmcQeZprDjB0kVlJyURP9YBEI
	N7cLPZfOB8EQ2bx5HOsip+qbRUy8So4GX15QkNUJ0DMxb1CymxPiLHntIxvus8EJiZui/9VsLIo
	=
X-Google-Smtp-Source: AGHT+IGdsubvoo2Cv7zpi9HiTbmjbbDaOnWIdnTnJ7OKDIXW1bb2j3+rkMkVq40YIJ+zDstuYfxwbA==
X-Received: by 2002:a05:600c:3e85:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4533b2428eemr5803465e9.6.1749815739298;
        Fri, 13 Jun 2025 04:55:39 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224795sm50627835e9.7.2025.06.13.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:37 -0700 (PDT)
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
Subject: Re: [PATCH v2 10/12] docs: sphinx: parser_yaml.py: add Netlink
 specs parser
In-Reply-To: <095fba5224a22b86a7604773ddaf9b5193157bc1.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:45:10 +0100
Message-ID: <m2plf7n9vd.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<095fba5224a22b86a7604773ddaf9b5193157bc1.1749723671.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Place the code at parser_yaml.py to handle Netlink specs. All
> other yaml files are ignored.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .pylintrc                           |  2 +-
>  Documentation/sphinx/parser_yaml.py | 39 +++++++++++++++++++++--------
>  2 files changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/.pylintrc b/.pylintrc
> index 30b8ae1659f8..f1d21379254b 100644
> --- a/.pylintrc
> +++ b/.pylintrc
> @@ -1,2 +1,2 @@
>  [MASTER]
> -init-hook='import sys; sys.path += ["scripts/lib/kdoc", "scripts/lib/abi"]'
> +init-hook='import sys; sys.path += ["scripts/lib", "scripts/lib/kdoc", "scripts/lib/abi"]'
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index b3cde9cf7aac..eb32e3249274 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -3,6 +3,10 @@ Sphinx extension for processing YAML files
>  """
>  
>  import os
> +import re
> +import sys
> +
> +from pprint import pformat
>  
>  from docutils.parsers.rst import Parser as RSTParser
>  from docutils.statemachine import ViewList
> @@ -10,7 +14,10 @@ from docutils.statemachine import ViewList
>  from sphinx.util import logging
>  from sphinx.parsers import Parser
>  
> -from pprint import pformat
> +srctree = os.path.abspath(os.environ["srctree"])
> +sys.path.insert(0, os.path.join(srctree, "scripts/lib"))
> +
> +from netlink_yml_parser import NetlinkYamlParser      # pylint: disable=C0413
>  
>  logger = logging.getLogger(__name__)
>  
> @@ -19,8 +26,9 @@ class YamlParser(Parser):
>  
>      supported = ('yaml', 'yml')
>  
> -    # Overrides docutils.parsers.Parser. See sphinx.parsers.RSTParser
> -    def parse(self, inputstring, document):
> +    netlink_parser = NetlinkYamlParser()
> +
> +    def do_parse(self, inputstring, document, msg):
>          """Parse YAML and generate a document tree."""
>  
>          self.setup_parse(inputstring, document)
> @@ -28,14 +36,6 @@ class YamlParser(Parser):
>          result = ViewList()
>  
>          try:
> -            # FIXME: Test logic to generate some ReST content
> -            basename = os.path.basename(document.current_source)
> -            title = os.path.splitext(basename)[0].replace('_', ' ').title()
> -
> -            msg = f"{title}\n"
> -            msg += "=" * len(title) + "\n\n"
> -            msg += "Something\n"
> -
>              # Parse message with RSTParser
>              for i, line in enumerate(msg.split('\n')):
>                  result.append(line, document.current_source, i)
> @@ -48,6 +48,23 @@ class YamlParser(Parser):
>  
>          self.finish_parse()
>  
> +    # Overrides docutils.parsers.Parser. See sphinx.parsers.RSTParser
> +    def parse(self, inputstring, document):
> +        """Check if a YAML is meant to be parsed."""
> +
> +        fname = document.current_source
> +
> +        # Handle netlink yaml specs
> +        if re.search("/netlink/specs/", fname):

The re.search is overkill since it is not a regexp. You can instead say:

    if '/netlink/specs/' in fname:

> +            if fname.endswith("index.yaml"):
> +                msg = self.netlink_parser.generate_main_index_rst(fname, None)
> +            else:

I'm guessing we can drop these lines if the static index.rst approach works.

> +                msg = self.netlink_parser.parse_yaml_file(fname)
> +
> +            self.do_parse(inputstring, document, msg)
> +
> +        # All other yaml files are ignored
> +
>  def setup(app):
>      """Setup function for the Sphinx extension."""
