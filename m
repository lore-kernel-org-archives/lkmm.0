Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B12BDC11;
	Fri, 27 Jun 2025 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022297; cv=none; b=QB+HXdmYYRli1vA7NqN2fjvT4q4flIUDTLWw+eAxrg32Q20pE5WuNd5Cq58Gld+Xkhek53hyEafJK74ut5a0kWEfkxD7UOwQAq+gXaJY9wtFxcpC38U6wFYYK+CmOxTfukRPUrK1/4UtpjklB9feTYoCCXQkxTs58mSRMAWMV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022297; c=relaxed/simple;
	bh=UXA/DCfJJfynwzqK4+DzTCalL4EQVESHifFAflGK+pI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=WXkBTopR2j7qol2ee9k9p/P29BG1ISZeyND0QtSbGeVCxaTiHAjLAE3qqxfSr2/f8mypFNo08W2x/ilQY77+MlJQXPpD4tTIjyo5auyIAWG9H5rhkrGI/3tunX9D0r7iQiUVvD166FMtsRGucPOj0rOEyuxrnaVNnYhfRiTLUq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgMgHYeT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgMgHYeT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45348bff79fso20568195e9.2;
        Fri, 27 Jun 2025 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022294; x=1751627094; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LrT0rtgl/4Y4s9eIDFIiuoNzQHixBqPthpAEA+N878k=;
        b=mgMgHYeT1ncWe6bYRYC2Df4A6eq/GNMEEiBvwpexDXVbOUp02va4LkzE3gL5fZkTGr
         rhzlfHZeLXCWV/WPfn1EzStbVsB7o5vOXlfN+p94YoWKIu4+lGVxtHMp0YlMlQOW3b6Y
         8aFFykRGwKI0ShQuATv4P93LNkWbLsDu4hX6u0NlrNLyIODYFHO7yAcndD9JjcYVGeef
         iLHNw0s21xrJt2V6VicC9g+YeBgEtR5EYsjsETw7uB0ga9Fw3eSGg1ujjwtt0l3epMex
         aqgK4ARYw93x0UM0iqqqjwHkKa361mkCM/rjSg9bEuzg5iukG9Q8/EqQFRhiN/9Qm1vd
         lg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022294; x=1751627094;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrT0rtgl/4Y4s9eIDFIiuoNzQHixBqPthpAEA+N878k=;
        b=vW8Bz74+EF9XCdUSzjAs/lkvDnpIA1Knt+eenHtjB86H2IBlrmnXXyhtI9LrMHwgFB
         /A4pXBfGi0BLIQVRgOnQgFxR35xj2Um18IyUxEizlxAsdjmwzbalSy8RVYc0vlWhi7MV
         nFVES+vG8f+gO+v6ZbTBS7xCaE15gDNkpj5whkjkzustb3PvtmIeWfDhk5H2hIpwPiKJ
         6CUB4NKyzpHp3N3Vq0jB5lwuK411kkFVKRG4vYPR/+Oe59lpIaao3lJeWkmMGLsztD4X
         GD6nzGhUDvO7cBNV2yf/0+5o0fe+t/ce8thjo3KBDe8czh8k7oZUo4tuPn1UPn3wLgaz
         kwvA==
X-Forwarded-Encrypted: i=1; AJvYcCVNh6uctLyUBrXU5yd+0PhQizCdi7ly/LFSCZ6XJ/qUOnUSUOaTqKTqjHyvc3tyB6lXg5944Q==@lists.linux.dev, AJvYcCXrkMP91UKXkrhxe7KFJ4nAKYAQNmI19Zr40uuHFGI3xanAGCYobC8+hmogQFNRGuaHGzib4LuPSjKB38Uwd0wPi5riZA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjln+jCvVT/caXYDdmk5/eTGpJR6bd67gCOK3HG+hrQztzkya8
	tAtNTm6vy7ht/I/XGLtTo/MZi9FP+F1rt98URyGv0QXrWb576pQqyCK3
X-Gm-Gg: ASbGncvgOXJyIAA2rTZ2HVx1pPCe/6xRzelUh9q0pN7WjDQFH02UX5FjkyBeET8VOX9
	TMpzZqtvdE7wM7yG45knJ6jWmOyj2yRwh0Qdf3ECj1n8JQ1Jt64MgnLkd649r7WXwpErlEkxczD
	QSF0OV+dKrPsN+o3nVvUD41s0YSZ9RhxXcdEZ0WZ5/iY4Vfo7dnSkgzcmqY1QU1JUWBhAInpE7s
	UbASvtdbPkv+z3xHoDhcWv3jC6Hk6hW0pc+JukzFCRjtvtLxh0iSfmvvkqvF+YGUHRH81aQqjJ8
	qIqg9RgadimjAHTIYrB30oKgSCQIjkQ2+Xw0XB+imnvXMA4fYA9WbBvPupgdhXSY1RfsZoekQQ=
	=
X-Google-Smtp-Source: AGHT+IFux+ewCwtnJcEJvrjwqlskPEmkgrl1E+OU03sLHBdk11oKlm1P+t6SRfzMLWPuNppfl0p/OQ==
X-Received: by 2002:a05:600c:c163:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-4538ee7db55mr33679085e9.16.1751022293718;
        Fri, 27 Jun 2025 04:04:53 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d05sm48152745e9.2.2025.06.27.04.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:04:53 -0700 (PDT)
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
Subject: Re: [PATCH v8 05/13] docs: sphinx: add a parser for yaml files for
 Netlink specs
In-Reply-To: <8373667e90bf5b184dfd28393fe6a955cdb4bbb7.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:25:54 +0100
Message-ID: <m21pr5a3bh.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<8373667e90bf5b184dfd28393fe6a955cdb4bbb7.1750925410.git.mchehab+huawei@kernel.org>
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

This should be: from doc_generator import YnlDocGenerator

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
>  Documentation/sphinx/parser_yaml.py | 104 ++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100755 Documentation/sphinx/parser_yaml.py
>
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> new file mode 100755
> index 000000000000..585a7ec81ba0
> --- /dev/null
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright 2025 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +
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

So that it doesn't need to be changed in a later patch, this should be:

... "tools/net/ynl/pyynl/lib"

> +
> +from netlink_yml_parser import YnlDocGenerator        # pylint: disable=C0413

So that it doesn't need to be changed in a later patch, this should be:

from doc_generator ...

> +logger = logging.getLogger(__name__)
> +
> +class YamlParser(Parser):
> +    """
> +    Kernel parser for YAML files.
> +
> +    This is a simple sphinx.Parser to handle yaml files inside the
> +    Kernel tree that will be part of the built documentation.
> +
> +    The actual parser function is not contained here: the code was
> +    written in a way that parsing yaml for different subsystems
> +    can be done from a single dispatcher.
> +
> +    All it takes to have parse YAML patches is to have an import line:
> +
> +            from some_parser_code import NewYamlGenerator
> +
> +    To this module. Then add an instance of the parser with:
> +
> +            new_parser = NewYamlGenerator()
> +
> +    and add a logic inside parse() to handle it based on the path,
> +    like this:
> +
> +            if "/foo" in fname:
> +                msg = self.new_parser.parse_yaml_file(fname)
> +    """
> +
> +    supported = ('yaml', )
> +
> +    netlink_parser = YnlDocGenerator()
> +
> +    def rst_parse(self, inputstring, document, msg):
> +        """
> +        Receives a ReST content that was previously converted by the
> +        YAML parser, adding it to the document tree.
> +        """
> +
> +        self.setup_parse(inputstring, document)
> +
> +        result = ViewList()
> +
> +        try:
> +            # Parse message with RSTParser
> +            for i, line in enumerate(msg.split('\n')):
> +                result.append(line, document.current_source, i)
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
> +            self.rst_parse(inputstring, document, msg)
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
