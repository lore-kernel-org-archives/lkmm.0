Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8592E4241;
	Tue, 17 Jun 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165216; cv=none; b=X6k0VInaonUOYzluUUy2p59W1MgplD5yVTK/F1kO5Zy749cpHSbWkMUS6Msqp+dynzmyU9e3EoaO1TmuDgzlNaVq91F1z2ES/stxmRN9dheUKeU+hybXpkvl+ckqU1naa8yFXvqJpUVOt+bxHygqsUnlVt7mUuLCcRL75wHTrOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165216; c=relaxed/simple;
	bh=vKPakfogKKix3izDDBo9OyyTz68HN3ZhsLtr7WF+d3k=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=VCgtu6ILceQokN4AFNPSqq+O4yXA4r1Hzt0gW5MQqINKU48yd+SuhTxrsjE0EXu2FkX00cBi62j385AtF7KCE9+lIYa8cSAH/35uGnzkxMo775FQHsNWkB3axH4rdrYQvnKqGwSLMu24+ofHGOl8MX0hsyS42OComWEDEwMalu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyGKv4+8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyGKv4+8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a588da60dfso508167f8f.1;
        Tue, 17 Jun 2025 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165210; x=1750770010; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYoy6x7UGY+cu6w5H/g64EV7yFmP0q4eOzaGrrkLz/0=;
        b=XyGKv4+8uLnQrim5iCDzoyin27XbshAX5IzWgUz1RFXzzkLsNEEuzy7EiFlXMTVOCW
         N4ALIW9OG/nBWusOuwsoIGryLudKQ/kvzh/KWs+GA8cgNFtXph9Mb3P5IJed3R4aP+Ob
         VxEwn2nOGgAiP0jffWT6uU4nEVARAByeHRySGFBiKZHmhWHAak1RTOG75255f5fD9GN3
         lcUNxejyjSfTiNf5pLEmQllRnul0b0Z2UygjHJ//sGF4wYLysHaTLU8A6YmJtWjU8o0K
         g7DUsCBbBrEZHSikcW020XIrdhaIvXVjzjwpdqZqOX/BWwvJYe2fTWeieWX3M+jORM6s
         NgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165210; x=1750770010;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYoy6x7UGY+cu6w5H/g64EV7yFmP0q4eOzaGrrkLz/0=;
        b=A7f/JWz97e8/JRRO/1dhuVakAGSlMMjTlzmFjYHHIS023NZbRuXdZypOJAvoK70ugY
         kVODIrDIm6YoB1VX/+LZ2BcDEsRre/ep6ocDDVm5QY5b0Isa6EZALjiysj5gPRs7dxn7
         wCaLmnXJkXuUNjpHKqOU8c0ZKaxNsavZbhkyKofBQ6gjTnSxlYKFbRszRbbcdA0Ig8A6
         8LrlPy67RI6pCy+PnxkBgWeuXYfVDXS0uzzGnnFcd5oFvpExW7lkp0i327Ry297L7mmI
         sq3HPLS8A5o0jXybI47dyUNpuy1NjaPGbl8zQEG5vyxOq8N9zj1RE4oHGI4mXvEdxzJn
         H1cA==
X-Forwarded-Encrypted: i=1; AJvYcCU0q0NC9WxCcjnlVJ3MICv91IJudIt8ye3gsYmIJ/MdLPynqTGPmF6pbr+bgxOYWcuzIG3j2Q==@lists.linux.dev, AJvYcCW+2wL/lTTpuvhmRU+jWVbBzApa6oetzz/wIpwUg+Kv/0p5r7yfsju9PRXu1RCvFFyjp+b8bBytt54ZVSFIblCcVbXlZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4X3er0Kwv/1WtI19+YwEHmoGsJmyEpgd4uzLpnP2uaAZCBljS
	V96Cg4nxq0yDeZAhriQsVL3FEbdUHFndUVBarq9r23aviUXiWCOsUkc1
X-Gm-Gg: ASbGncuHXZta+AWiNRMrIcRsEMNC5fTV/JdG1jsdNi7hsEAx27E+Qz5JDAtodObz1AR
	+/4u890TVnBN/grqlGjuqiFJ787cKTf9AdRT4FFY2X+9Qbv9mbUNmrrIKyhmwSga+vpzlJNYt2Y
	MPBs8ZwVIocaYj2cHazraFiBm0AMe3jqEXYKo646LhfKCJd8bbYnSaLt0u/V1x/PiA5gl4by2Wm
	AO3ZRCJZyE0XNnPfIHJ0Yc+fb2jvp/5SoKuzv7eXUU/s9h4raJwox0LkcdHYsHNoFdGl8bXCbrf
	R84h/i1k9+tWwluDA6ZAkStLrtRmwSs/w3shJvF/gdU9MKApHp7pYMNV3REGv02boXSKlLbYgJU
	=
X-Google-Smtp-Source: AGHT+IFFtE66j0KBeiVBmHT2kdpGgOwXtX4PGlW51AaI/zJ78oGV7HwQmIMFUGUqOcnRWs2CbvgRsw==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3a572e79fa4mr10169058f8f.32.1750165209425;
        Tue, 17 Jun 2025 06:00:09 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm13815810f8f.45.2025.06.17.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:08 -0700 (PDT)
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
Subject: Re: [PATCH v5 10/15] docs: sphinx: add a parser for yaml files for
 Netlink specs
In-Reply-To: <c407d769c9f47083e8f411c13989522e32262562.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 13:35:50 +0100
Message-ID: <m27c1ak0k9.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<c407d769c9f47083e8f411c13989522e32262562.1750146719.git.mchehab+huawei@kernel.org>
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
> 	from netlink_yml_parser import YnlDocGenerator
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
> ---
>  Documentation/sphinx/parser_yaml.py | 76 +++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100755 Documentation/sphinx/parser_yaml.py
>
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> new file mode 100755
> index 000000000000..635945e1c5ba
> --- /dev/null
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -0,0 +1,76 @@
> +"""
> +Sphinx extension for processing YAML files
> +"""
> +
> +import os
> +import re
> +import sys
> +
> +from pprint import pformat
> +
> +from docutils.parsers.rst import Parser as RSTParser
> +from docutils.statemachine import ViewList
> +
> +from sphinx.util import logging
> +from sphinx.parsers import Parser
> +
> +srctree = os.path.abspath(os.environ["srctree"])
> +sys.path.insert(0, os.path.join(srctree, "tools/net/ynl/pyynl"))
> +
> +from netlink_yml_parser import YnlDocGenerator        # pylint: disable=C0413
> +
> +logger = logging.getLogger(__name__)
> +
> +class YamlParser(Parser):
> +    """Custom parser for YAML files."""

Would be good to say that this is a common YAML parser that calls
different subsystems, e.g. how you described it in the commit message.

> +
> +    # Need at least two elements on this set

I think you can drop this comment. It's not that it must be two
elements, it's that supported needs to be a list and the python syntax
to force parsing as a list would be ('item', )

> +    supported = ('yaml', 'yml')
> +
> +    netlink_parser = YnlDocGenerator()
> +
> +    def do_parse(self, inputstring, document, msg):

Maybe a better name for this is parse_rst?

> +        """Parse YAML and generate a document tree."""

Also update comment.

> +
> +        self.setup_parse(inputstring, document)
> +
> +        result = ViewList()
> +
> +        try:
> +            # Parse message with RSTParser
> +            for i, line in enumerate(msg.split('\n')):
> +                result.append(line, document.current_source, i)

This has the effect of associating line numbers from the generated ReST
with the source .yaml file, right? So errors will be reported against
the wrong place in the file. Is there any way to show the cause of the
error in the intermediate ReST?

As an example if I modify tc.yaml like this:

diff --git a/Documentation/netlink/specs/tc.yaml b/Documentation/netlink/specs/tc.yaml
index 4cc1f6a45001..c36d86d2dc72 100644
--- a/Documentation/netlink/specs/tc.yaml
+++ b/Documentation/netlink/specs/tc.yaml
@@ -4044,7 +4044,9 @@ operations:
             - chain
     -
       name: getchain
-      doc: Get / dump tc chain information.
+      doc: |
+        Get / dump tc chain information.
+        .. bogus-directive:: 
       attribute-set: attrs
       fixed-header: tcmsg
       do:

This is the resuting error which will be really hard to track down:

/home/donaldh/net-next/Documentation/netlink/specs/tc.yaml:216: ERROR: Unexpected indentation. [docutils]

> +
> +            rst_parser = RSTParser()
> +            rst_parser.parse('\n'.join(result), document)
> +
> +        except Exception as e:
> +            document.reporter.error("YAML parsing error: %s" % pformat(e))
> +
> +        self.finish_parse()
> +
> +    # Overrides docutils.parsers.Parser. See sphinx.parsers.RSTParser
> +    def parse(self, inputstring, document):
> +        """Check if a YAML is meant to be parsed."""
> +
> +        fname = document.current_source
> +
> +        # Handle netlink yaml specs
> +        if "/netlink/specs/" in fname:
> +            msg = self.netlink_parser.parse_yaml_file(fname)
> +            self.do_parse(inputstring, document, msg)
> +
> +        # All other yaml files are ignored
> +
> +def setup(app):
> +    """Setup function for the Sphinx extension."""
> +
> +    # Add YAML parser
> +    app.add_source_parser(YamlParser)
> +    app.add_source_suffix('.yaml', 'yaml')
> +
> +    return {
> +        'version': '1.0',
> +        'parallel_read_safe': True,
> +        'parallel_write_safe': True,
> +    }
