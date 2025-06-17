Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BBA2376E6;
	Tue, 17 Jun 2025 17:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181016; cv=none; b=AyvwhN+EFqqhIdLoPlnUun4rJ+Vkb1EZqESSn9a0KVTV7e7W92vx2NYXwsXfsCMBhGfGBtBQReX2+kML5qxgB59zQ0me4Enae4hWHW/rdWxH4Iay1AeHtfxpk21D00jJMxPwZgE7VnNfaYtsPY6OzktnTAtunyYl0twg5dM75jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181016; c=relaxed/simple;
	bh=Hrcbm7dR2at0MkRPfeNTjwQ82G1ZwMmIaW0GWSsNuu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqB0VHuxEDkxAZA/kwnusmEUg9qNhc3tbw9NV4zOV9S4tBSZ7FPcEYnTv5fbvRLuyYWjwn2epmhOL73ttIgTKbPDEs6gVLv5gTTfFkQ1ZAw7G3pWVfOephFZ1gYT0owUeVrwk7yoXFws9mtzgVMdS+BDv1wzfqtKcfi6IWBCojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6jiKTMG; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6jiKTMG"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-735a8be4ea9so1404608a34.0;
        Tue, 17 Jun 2025 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750181014; x=1750785814; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej9TAlXzgN0LHQcsnKzmV9b6lBqh4sRH5fw58an3btI=;
        b=C6jiKTMGqP7ylqxpG3+Cd9eLTGp4sHrTv0030E8h370vyj2CX5OdmTqZ6hlGga1t/O
         ZMD4iaV/CzVbJfS0AQfGhWUXFtLrnW6vaVC1t/Ozo9zrY/iEj/7Aw341RHqaLjws/e9m
         hVj0H78+XMHqk0lX0BiIJmYk8axog49/XiJcKLEpXVz8mx+eA3AbEjx/C2Y/ETfpn10M
         5+OH+X5aA5WVsI1G8BGio3E2U5mdwd+UFf8iDrsV3nq/L2xdp4HAqCPa8bM7+FxyLR6c
         GrRrlpWkXB7+xO2q5hDZRCXoFWkNM1qDgeqvUq92FRIzfHveZuAX89qDIUxMkByECU1R
         L51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750181014; x=1750785814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej9TAlXzgN0LHQcsnKzmV9b6lBqh4sRH5fw58an3btI=;
        b=La1/bzPOXKqt0QGjomkfnij2ThOmAMIMJS71yKTC65UYYU3GPoneCBPHsGNueIpVVG
         gqdjvmSyh5yQ7z2u5MwRT2GCoUEI6h+KBbctxGZYondoQlDXKJA0o56KiU+/4DROY1JJ
         royuZR/PyNfweqbxP5GMHBBvmKYkpvYk0O9v7e+TFf9wkz2fo15YqS0N85YeKXW6nuyN
         NDbWTF/czxqRvgjrKy8BRUu4B4sWenFTiFlnjqqaWdqC++TjrDMNIq8uoeQfA4aNWaMv
         SWe462W1gTAdWmQharv7Vi3E8fybDFVMr/a5j1krz1ahYYPIej/7VX4K3bL7pmitUH4h
         qaPw==
X-Forwarded-Encrypted: i=1; AJvYcCUH0M4h52n0tmwU6/hYoFZNKrdVhxU1mOfRTdv07nIaTRVwfMz2V4Fl0bKz8eUQYAbkJYs9rw==@lists.linux.dev, AJvYcCWECULbax1QeM2Uy+1XR8vxeXupNA4iS7hfHKguY9kzwFXbFzaXneO4Zuhjx9vkHeI3p4a9bEojZOVrewguAHH3WOiIgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEO31oK9VKMKIyFlR6223XW+9tK6+MhaesyQj1/ZoQXXdNwH9R
	RTE1WqELzAfdNPRvEfdR/90dqXajhRyOlJrSvvBSEt/jNemDwiIuNtKzl/6B1GKZ8hQJKxt//1d
	v9qtFJ2Msv4rwD7ZDnD8VAYX7sDLvzv8=
X-Gm-Gg: ASbGncvhpzVwrjS/+9kBugMw5DHfvFc7xCDpIxjFDeb3T+Q3Ts+9w0bUplNvlYL/mfJ
	6h3pnpt91sCvGZac6e7wUGYH8b3L8bCVwO7P4z/95jh0J3pv2s7buskUL9PX4o3FAD2Nnc8JU5B
	M5x6V4OMXyzD4XlZ5QYzM3PjLzKTHoYCt3r2TIbWPOakKbl3RowKLW9c4KRt/VfUUYjo3u0CT4f
	A==
X-Google-Smtp-Source: AGHT+IGHKF0IR41tdCiQQ/QwZTYP3zh1WNnW6OvBJ5ZDaIV3FvSbKqv8iszY6CxnH5G025ZAAXULy+HPrKZVqCHkgAU=
X-Received: by 2002:a05:6871:e785:b0:2e8:7953:ece7 with SMTP id
 586e51a60fabf-2eaf08390ecmr8933677fac.24.1750181013728; Tue, 17 Jun 2025
 10:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
 <c407d769c9f47083e8f411c13989522e32262562.1750146719.git.mchehab+huawei@kernel.org>
 <m27c1ak0k9.fsf@gmail.com> <20250617154049.104ef6ff@sal.lan> <20250617180001.46931ba9@sal.lan>
In-Reply-To: <20250617180001.46931ba9@sal.lan>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Tue, 17 Jun 2025 18:23:22 +0100
X-Gm-Features: Ac12FXxjYAQl11Cjy04pJrUUVKxkLrmxF1LVKWdXWiav8_AOc6p_ww281gT6_58
Message-ID: <CAD4GDZzWMoxnatNXYbKOphzVZ4NyedD5FtjxF7cgB1ad-wDFWg@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] docs: sphinx: add a parser for yaml files for
 Netlink specs
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

On Tue, 17 Jun 2025 at 17:00, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> >
> > (2) is cleaner and faster, but (1) is easier to implement on an
> > already-existing code.
>
> The logic below implements (1). This seems to be the easiest way for
> pyyaml. I will submit as 2 separate patches at the end of the next
> version.
>
> Please notice that I didn't check yet for the "quality" of the
> line numbers. Some tweaks could be needed later on.

Thanks for working on this. I suppose we might be able to work on an
evolution from (1) to (2) in a followup piece of work?

> Regards,
> Mauro
>
> ---
>
> From 750daebebadcd156b5fe9b516f4fae4bd42b9d2c Mon Sep 17 00:00:00 2001
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Date: Tue, 17 Jun 2025 17:54:03 +0200
> Subject: [PATCH] docs: parser_yaml.py: add support for line numbers from the
>  parser
>
> Instead of printing line numbers from the temp converted ReST
> file, get them from the original source.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index 635945e1c5ba..15c642fc0bd5 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -29,6 +29,8 @@ class YamlParser(Parser):
>
>      netlink_parser = YnlDocGenerator()
>
> +    re_lineno = re.compile(r"\.\. LINENO ([0-9]+)$")
> +
>      def do_parse(self, inputstring, document, msg):
>          """Parse YAML and generate a document tree."""
>
> @@ -38,8 +40,14 @@ class YamlParser(Parser):
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
>
>              rst_parser = RSTParser()
>              rst_parser.parse('\n'.join(result), document)
>
> From 15c1f9db30f3abdce110e19788d87f9fe1417781 Mon Sep 17 00:00:00 2001
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Date: Tue, 17 Jun 2025 17:28:04 +0200
> Subject: [PATCH] tools: netlink_yml_parser.py: add line numbers to parsed data
>
> When something goes wrong, we want Sphinx error to point to the
> right line number from the original source, not from the
> processed ReST data.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> diff --git a/tools/net/ynl/pyynl/netlink_yml_parser.py b/tools/net/ynl/pyynl/netlink_yml_parser.py
> index 866551726723..a9d8ab6f2639 100755
> --- a/tools/net/ynl/pyynl/netlink_yml_parser.py
> +++ b/tools/net/ynl/pyynl/netlink_yml_parser.py
> @@ -20,6 +20,16 @@
>  from typing import Any, Dict, List
>  import yaml
>
> +LINE_STR = '__lineno__'
> +
> +class NumberedSafeLoader(yaml.SafeLoader):
> +    """Override the SafeLoader class to add line number to parsed data"""
> +
> +    def construct_mapping(self, node):
> +        mapping = super().construct_mapping(node)
> +        mapping[LINE_STR] = node.start_mark.line
> +
> +        return mapping
>
>  class RstFormatters:
>      """RST Formatters"""
> @@ -127,6 +137,11 @@ class RstFormatters:
>          """Return a formatted label"""
>          return f".. _{title}:\n\n"
>
> +    @staticmethod
> +    def rst_lineno(lineno: int) -> str:
> +        """Return a lineno comment"""
> +        return f".. LINENO {lineno}\n"
> +
>  class YnlDocGenerator:
>      """YAML Netlink specs Parser"""
>
> @@ -144,6 +159,9 @@ class YnlDocGenerator:
>          """Parse 'do' section and return a formatted string"""
>          lines = []
>          for key in do_dict.keys():
> +            if key == LINE_STR:
> +                lines.append(self.fmt.rst_lineno(do_dict[key]))
> +                continue
>              lines.append(self.fmt.rst_paragraph(self.fmt.bold(key), level + 1))
>              if key in ['request', 'reply']:
>                  lines.append(self.parse_do_attributes(do_dict[key], level + 1) + "\n")
> @@ -174,6 +192,10 @@ class YnlDocGenerator:
>              lines.append(self.fmt.rst_paragraph(operation["doc"]) + "\n")
>
>              for key in operation.keys():
> +                if key == LINE_STR:
> +                    lines.append(self.fmt.rst_lineno(operation[key]))
> +                    continue
> +
>                  if key in preprocessed:
>                      # Skip the special fields
>                      continue
> @@ -233,6 +255,9 @@ class YnlDocGenerator:
>          for definition in defs:
>              lines.append(self.fmt.rst_section(namespace, 'definition', definition["name"]))
>              for k in definition.keys():
> +                if k == LINE_STR:
> +                    lines.append(self.fmt.rst_lineno(definition[k]))
> +                    continue
>                  if k in preprocessed + ignored:
>                      continue
>                  lines.append(self.fmt.rst_fields(k, self.fmt.sanitize(definition[k]), 0))
> @@ -268,6 +293,9 @@ class YnlDocGenerator:
>                  lines.append(self.fmt.rst_subsubsection(attr_line))
>
>                  for k in attr.keys():
> +                    if k == LINE_STR:
> +                        lines.append(self.fmt.rst_lineno(attr[k]))
> +                        continue
>                      if k in preprocessed + ignored:
>                          continue
>                      if k in linkable:
> @@ -306,6 +334,8 @@ class YnlDocGenerator:
>          lines = []
>
>          # Main header
> +        lineno = obj.get('__lineno__', 0)
> +        lines.append(self.fmt.rst_lineno(lineno))
>
>          family = obj['name']
>
> @@ -354,7 +384,7 @@ class YnlDocGenerator:
>      def parse_yaml_file(self, filename: str) -> str:
>          """Transform the YAML specified by filename into an RST-formatted string"""
>          with open(filename, "r", encoding="utf-8") as spec_file:
> -            yaml_data = yaml.safe_load(spec_file)
> -            content = self.parse_yaml(yaml_data)
> +            numbered_yaml = yaml.load(spec_file, Loader=NumberedSafeLoader)
> +            content = self.parse_yaml(numbered_yaml)
>
>          return content
>
