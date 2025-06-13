Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46F2E2F02;
	Fri, 13 Jun 2025 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815739; cv=none; b=XoliuvS4Ehm+0417SoFkiN40oL9qSjLj1V2XrT25TkKRLyxkvtW/0fqNhrW0j7N9nqtboFhYakzQFJxUHdJgl6QXiz3WUG5X4Yw+kmJFCrnZaybaRsesb0nzmDjJ7qtehbiwXnICjdZOPs8IHK1wGSUIi/l8fXCBMrTSJODxjpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815739; c=relaxed/simple;
	bh=zXGq9qaDsbHQ+3z70oVdXVkvT7TLBW8Sq21vfokbjNc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=HK4DaSalqa/iFvpJfO1QgDJ13YjfmFyLVqMl9+kqWjHDdy4Ee8LrF3r0yZ4jROGB4E2ouV8TwqpS9TeylYXJDaRam8cghHLA2Cg2bjYUSqj8klUF159cNWnWifBfmFKr7Gh5OkFI3/CMf0Fk6C5QzCyilplcSDwnWXmFer3tg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXDfzAY3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXDfzAY3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4508287895dso20031935e9.1;
        Fri, 13 Jun 2025 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815736; x=1750420536; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7UTlJHoMHi1drH038eVgqSVLWynDfABQdhPWNCYmpg=;
        b=KXDfzAY3NfdBW1jVLlfqXxEHOn1Eun18x+qWYvfxYedt9rK+dXz/8wtk3WRK/2P/YB
         +PNwXe/MeTOJF5c91R2hr/yACjb8RMAQpkH4UND7KchG9pQdiHtI0b88A0u/1fAKK4Ne
         jlseED5y4jylLFtY+LjOoe6J6LSZ8wJ28MTZKlFFVsYh/uEb3+0VNisnxRIrc4JIrB2s
         IYJNbc6x/vR08sZlzB4n9F9RfJR7xabC64iCk7lUXZuk6Wm6ikLdT/tcSijtshibsD13
         NwYc/UKRV0XE3JmmIWBmrIkjlVBlmLjNP/B9OHFOF61Fgu58pnF1prLWppbYPf1kzV+7
         YUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815736; x=1750420536;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7UTlJHoMHi1drH038eVgqSVLWynDfABQdhPWNCYmpg=;
        b=A4H899pcXfK1sLMrZAgwVYaxZqOW/jc4/Hw79S5QH03zMeaI3hWhLGA/M1Qz4/JFVN
         +ArWM3s7+e5lRFSDJCs0GBQzvIx+pny+48+kRYD59udiogz8ywOC5f1RUAx1JX9rtGxD
         QA11BMPfeUfVXFJlP8ZRBlC2Z4QwQaPePThdM3OVtNI4AA1fU/jlEOsg87nEVsQDUq6f
         Hsip8R7QwuEf7+f5bRFM5F3QxXRYVB+x0KUSPD+jcX+g+oFByqyUEhMa7SnXHCM6rMz5
         IfnWd6rMsRu21p35YlYhyGVO9IwIq0OtF1SSdAw/oCDI+QKGqw+5dA0AWHBxj51fxQQr
         YPHA==
X-Forwarded-Encrypted: i=1; AJvYcCVGz2Bv6wpqalecTkXqzREdXbMDDqYggB56o+lO9B43Lb/AhV4gzW9bLx/u5GVmSZsH86HllA==@lists.linux.dev, AJvYcCVkCgP7k1o4XafVp/NkMgCwIrKJUeiF45M9juxirEk8CE93TaQcxuy1QjFDg2NTujm8ILJLcT247t/jD0T9VtuQZVMdLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygKl3cFBD9Lf2bujVpsjdTa9So/jTN1fm44UVPihze5Q8rFwOJ
	GCmD6CKv7bjJL4Br4xmIpZHl4TDb4g3DmdIH+8qJCp0KW1NGzH3JjZ4G
X-Gm-Gg: ASbGncsCDB9Wrvt1vEUV5r/ukOjJxLNrP2/n1C5NqSxyzwbEsyTxi+zbKePHg2n7+rD
	WesW7ICgucw15kKVenedI/SdWyGBGvxMpfSRjjSbULk/LruPCT8nMvsSr9NOr6PagSTMbCyXPmb
	KfxJnVItb/eOWoz+NYhS4RjwAhqnVg7euEQ/dc+LjWwtuuCuOLMXoKDF507RWH2MthSAc9JpFkh
	lzw8Ld0whd6H3whkmIa2CvyGMek/F8p1lYAFZeog8WpM2yQ8kssS4+XnlFhsqxIK4PdY8AlXkwQ
	v+TXPZoJDnvvrmCp0/nclGiOtXp0Dgjeyj8RKnsqYvgQPXrFuzoUy+20gqMFHncOC6EzkqFd1Rl
	fhHgplZGmHA==
X-Google-Smtp-Source: AGHT+IFi/nbdK2tp24U0X9KzKkQTjtsKVXLh7U3co32ExcLSRr/fke5SRM8jwCxSx2RJEy/QxZQqHQ==
X-Received: by 2002:a05:600c:5251:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4533b28a97emr5390165e9.16.1749815735625;
        Fri, 13 Jun 2025 04:55:35 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4e8sm50104975e9.3.2025.06.13.04.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:34 -0700 (PDT)
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
Subject: Re: [PATCH v2 09/12] docs: sphinx: add a parser template for yaml
 files
In-Reply-To: <39789f17215178892544ffc408a4d0d9f4017f37.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:29:34 +0100
Message-ID: <m2tt4jnald.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<39789f17215178892544ffc408a4d0d9f4017f37.1749723671.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Add a simple sphinx.Parser class meant to handle yaml files.
>
> For now, it just replaces a yaml file by a simple ReST
> code. I opted to do this way, as this patch can be used as
> basis for new file format parsers. We may use this as an
> example to parse other types of files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/parser_yaml.py | 63 +++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100755 Documentation/sphinx/parser_yaml.py

It's not a generic yaml parser so the file should be
netlink_doc_generator.py or something.

>
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> new file mode 100755
> index 000000000000..b3cde9cf7aac
> --- /dev/null
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -0,0 +1,63 @@
> +"""
> +Sphinx extension for processing YAML files
> +"""
> +
> +import os
> +
> +from docutils.parsers.rst import Parser as RSTParser
> +from docutils.statemachine import ViewList
> +
> +from sphinx.util import logging
> +from sphinx.parsers import Parser
> +
> +from pprint import pformat
> +
> +logger = logging.getLogger(__name__)
> +
> +class YamlParser(Parser):
> +    """Custom parser for YAML files."""

The class is only intended to be a netlink doc generator so I sugget
calling it NetlinkDocGenerator

> +
> +    supported = ('yaml', 'yml')

I don't think we need to support the .yml extension.

> +
> +    # Overrides docutils.parsers.Parser. See sphinx.parsers.RSTParser
> +    def parse(self, inputstring, document):
> +        """Parse YAML and generate a document tree."""
> +
> +        self.setup_parse(inputstring, document)
> +
> +        result = ViewList()
> +
> +        try:
> +            # FIXME: Test logic to generate some ReST content
> +            basename = os.path.basename(document.current_source)
> +            title = os.path.splitext(basename)[0].replace('_', ' ').title()
> +
> +            msg = f"{title}\n"
> +            msg += "=" * len(title) + "\n\n"
> +            msg += "Something\n"
> +
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
> +def setup(app):
> +    """Setup function for the Sphinx extension."""
> +
> +    # Add YAML parser
> +    app.add_source_parser(YamlParser)
> +    app.add_source_suffix('.yaml', 'yaml')
> +    app.add_source_suffix('.yml', 'yaml')

No need to support the .yml extension.

> +
> +    return {
> +        'version': '1.0',
> +        'parallel_read_safe': True,
> +        'parallel_write_safe': True,
> +    }
