Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F12D979A;
	Thu, 10 Jul 2025 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146863; cv=none; b=MH0RtdlxUNZpA5AJHVIT+XPK+UG/qUJP5uR/kc8S93Q9GosdSm3Tnda8tF32VhPbLlvVK9dMEG7QIBaAAE5aUR3MZYIv9vQ5aAnNfsGVy/O8+qayUC6N+NEbLjjPOG7X4iI8usAaohdBqwyA/WvPJOOHdd6H/5+q2NQLtGIBxPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146863; c=relaxed/simple;
	bh=KjSzvJUpxXfbbJMn+GnW97GcF7y9pkc6qt0xEvGgaAI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=PSriA/5/w6yx5IGmbvX2fBwN04ezcaw+8IWoMV8N+dyXmqFA0ddnV4Ptdux2HdiKfmO0jzs+8Y0rOW8ZtNxN/rj0X6JQXxBE5lFbKm4zRerD4ZzgxkyuV/4TS+GpaD4lv7dvR/O1GaKOSaTwL5ZFq7eTquXvrzQBF/fBnuCY6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nlz+0DBO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nlz+0DBO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a52874d593so739240f8f.0;
        Thu, 10 Jul 2025 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752146860; x=1752751660; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IR5AJVT4G5WLtAAqgPLSimQyStJGWsVwlw9CufaXOaE=;
        b=Nlz+0DBOxlVQv1iLdjNvXgle3khqbBuewbe724Ulvo4SxnOZHJRT0Qk0FPf9yJuFjT
         znYiCEdd+jrWZTTdidMh3jGs0MwIqWOyh8bTLBaKJ0Z4OyLfpnSVqUfjsQB/IHe+hllq
         UFMPDeVmIinja0qySJhjxNr84DvwGKlLsqGH3dTf7C1pUOoFiYo/2wcBuXUYfH28qfQF
         +7BT2lF10w29Joez+IdjpeA5YCgVbXDhsNReYA5yJ0IjL7qNqRlpHzyAQhflpnUvT2O8
         DGkHKQWiHUhv65u3js9anRRAZnfwFtR3Kj+2wQwmJYG2LrlB6GdIW4voChrW68ApPHKe
         rXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146860; x=1752751660;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR5AJVT4G5WLtAAqgPLSimQyStJGWsVwlw9CufaXOaE=;
        b=h2KkI5b4/9cLk7YgPOLRU4erwAqgf+QTOFPSjjFdIy8/QSiYgUGq4xIc0amcM5hoIj
         P7iisIH52juRiBdecDJBi40qp/Ou3KeC/4yMJ1HZ6YYrdsT/4naq2OKp3BcUhQ2tDHVP
         LrsZ6+PC5ZUA3LYyV9sVvaiqY9O7HJS8AD71V/Ik1UN9EB/uXAGYdMokPcrIxk7FtL+O
         8O9u4TgyVphN/0XgX9F555S2yY02a8NrXqV5+mzjlpryK3vp1EPfM2cDByAdGAQa6Aqo
         gGoEBzgBCxE/niOQtag7KsEWZ2m8tuU8MqFeAyzKou5rs6LB+2ezXzJVZYK+ynh1CKwt
         AUig==
X-Forwarded-Encrypted: i=1; AJvYcCUyxm5MSPWQVSgGDbI0zQuc0RLh0pVauY3SrrXKP7jt4/7EWG73LVG9fgXM69+E9t2+GLeuOg==@lists.linux.dev, AJvYcCX8Q5SI5GYsioi7T7lOXOt5GmbJONnKF1eNj//oiSXMI2xU73AHZP6oMhLNMxFpiXWjtIoEcYOqv71kolYB7b6ZMYE6Bg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywun7783Cax/vx5USbj90yEs9ejmu9fCdxA0I7p605aj9jPth/X
	oEjQY/45Ejse01ER7jStu0xeHxaiwhn4yP5/8LikUYwIdImsHIXP1WqB
X-Gm-Gg: ASbGncuhlk3cwzNNid4xFRdXU4WGQgpW7k96FAMo/HKg23iqWlBHv9ec4f/SoogA4gL
	2sfFqxbM6r3XTqOeRZxjofJS7SSBqOKCs7/Wi7/+bGg8RxXivx3uFV9JsefAaKNIEHHhxH2CDaG
	Mx4BWgGbF2V8mFSp+/aFDYymU7XU+W6Rt3n2iujaUwTNm6ieTMs49lyciWl/XZ+ydLFNVl5pa+T
	dCZqF4PE/8E1v8Mk1NGFP106jGF+mnpnEqNK+I5RhAaHAZCICgLZpUKk2LGb20212cv238LSBHr
	tGNLfB+3S/T4MMMpH1n5KSRSkoX0HrBb6Uzp7d+7fBB9TZiKBJgvcJp0o2qBAoDkOFlG/YYnrgU
	=
X-Google-Smtp-Source: AGHT+IGJxYQYyVxwJGUcleyu2QUatvGZlx5j2drpe8o9TCCtxQrleJg0cqNcOTkJRlgizlSSl5qgwQ==
X-Received: by 2002:a05:6000:43d5:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b5e788d43cmr2498398f8f.2.1752146859857;
        Thu, 10 Jul 2025 04:27:39 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:a8bc:3071:67a5:abea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd474a9csm17122225e9.16.2025.07.10.04.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:27:39 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Ruben Wauters" <rubenru09@aol.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  Jakub Kicinski
 <kuba@kernel.org>,  Simon Horman <horms@kernel.org>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH v9 12/13] docs: parser_yaml.py: add support for line
 numbers from the parser
In-Reply-To: <3b18b30b1b50b01a014fd4b5a38423e529cde2fb.1752076293.git.mchehab+huawei@kernel.org>
Date: Thu, 10 Jul 2025 12:25:56 +0100
Message-ID: <m2zfdc5ltn.fsf@gmail.com>
References: <cover.1752076293.git.mchehab+huawei@kernel.org>
	<3b18b30b1b50b01a014fd4b5a38423e529cde2fb.1752076293.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of printing line numbers from the temp converted ReST
> file, get them from the original source.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This doesn't seem to work. This is what I get when I change line 14 of
rt-neigh.yaml

diff --git a/Documentation/netlink/specs/rt-neigh.yaml b/Documentation/netlink/specs/rt-neigh.yaml
index e9cba164e3d1..937d2563f151 100644
--- a/Documentation/netlink/specs/rt-neigh.yaml
+++ b/Documentation/netlink/specs/rt-neigh.yaml
@@ -11,6 +11,7 @@ doc:
 definitions:
   -
     name: ndmsg
+    doc: ".. bogus::"
     type: struct
     members:
       -

/home/donaldh/docs-next/Documentation/netlink/specs/rt-neigh.yaml:165: ERROR: Unknown directive type "bogus".

.. bogus:: [docutils]


> ---
>  Documentation/sphinx/parser_yaml.py      | 12 ++++++++++--
>  tools/net/ynl/pyynl/lib/doc_generator.py | 16 ++++++++++++----
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index fa2e6da17617..8288e2ff7c7c 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -54,6 +54,8 @@ class YamlParser(Parser):
>  
>      netlink_parser = YnlDocGenerator()
>  
> +    re_lineno = re.compile(r"\.\. LINENO ([0-9]+)$")
> +
>      def rst_parse(self, inputstring, document, msg):
>          """
>          Receives a ReST content that was previously converted by the
> @@ -66,8 +68,14 @@ class YamlParser(Parser):
>  
>          try:
>              # Parse message with RSTParser
> -            for i, line in enumerate(msg.split('\n')):
> -                result.append(line, document.current_source, i)
> +            lineoffset = 0;
> +            for line in msg.split('\n'):
> +                match = self.re_lineno.match(line)
> +                if match:
> +                    lineoffset = int(match.group(1))
> +                    continue
> +
> +                result.append(line, document.current_source, lineoffset)

I expect this would need to be source=document.current_source, offset=lineoffset

>  
>              rst_parser = RSTParser()
>              rst_parser.parse('\n'.join(result), document)

But anyway this discards any line information by just concatenating the
lines together again.

> diff --git a/tools/net/ynl/pyynl/lib/doc_generator.py b/tools/net/ynl/pyynl/lib/doc_generator.py
> index 658759a527a6..403abf1a2eda 100644
> --- a/tools/net/ynl/pyynl/lib/doc_generator.py
> +++ b/tools/net/ynl/pyynl/lib/doc_generator.py
> @@ -158,9 +158,11 @@ class YnlDocGenerator:
>      def parse_do(self, do_dict: Dict[str, Any], level: int = 0) -> str:
>          """Parse 'do' section and return a formatted string"""
>          lines = []
> +        if LINE_STR in do_dict:
> +            lines.append(self.fmt.rst_lineno(do_dict[LINE_STR]))
> +
>          for key in do_dict.keys():
>              if key == LINE_STR:
> -                lines.append(self.fmt.rst_lineno(do_dict[key]))
>                  continue
>              lines.append(self.fmt.rst_paragraph(self.fmt.bold(key), level + 1))
>              if key in ['request', 'reply']:
> @@ -187,13 +189,15 @@ class YnlDocGenerator:
>          lines = []
>  
>          for operation in operations:
> +            if LINE_STR in operation:
> +                lines.append(self.fmt.rst_lineno(operation[LINE_STR]))
> +
>              lines.append(self.fmt.rst_section(namespace, 'operation',
>                                                operation["name"]))
>              lines.append(self.fmt.rst_paragraph(operation["doc"]) + "\n")
>  
>              for key in operation.keys():
>                  if key == LINE_STR:
> -                    lines.append(self.fmt.rst_lineno(operation[key]))
>                      continue
>  
>                  if key in preprocessed:
> @@ -253,10 +257,12 @@ class YnlDocGenerator:
>          lines = []
>  
>          for definition in defs:
> +            if LINE_STR in definition:
> +                lines.append(self.fmt.rst_lineno(definition[LINE_STR]))
> +
>              lines.append(self.fmt.rst_section(namespace, 'definition', definition["name"]))
>              for k in definition.keys():
>                  if k == LINE_STR:
> -                    lines.append(self.fmt.rst_lineno(definition[k]))
>                      continue
>                  if k in preprocessed + ignored:
>                      continue
> @@ -284,6 +290,9 @@ class YnlDocGenerator:
>              lines.append(self.fmt.rst_section(namespace, 'attribute-set',
>                                                entry["name"]))
>              for attr in entry["attributes"]:
> +                if LINE_STR in attr:
> +                    lines.append(self.fmt.rst_lineno(attr[LINE_STR]))
> +
>                  type_ = attr.get("type")
>                  attr_line = attr["name"]
>                  if type_:
> @@ -294,7 +303,6 @@ class YnlDocGenerator:
>  
>                  for k in attr.keys():
>                      if k == LINE_STR:
> -                        lines.append(self.fmt.rst_lineno(attr[k]))
>                          continue
>                      if k in preprocessed + ignored:
>                          continue
