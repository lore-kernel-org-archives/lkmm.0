Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA82E8890;
	Tue, 17 Jun 2025 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165207; cv=none; b=US8Fhy6lZTp7/tzcJ7a0052SN07vBSuBGEUg93dBSsonZTJhHSRMYNDM/9T6w1xAELBB06P6xddJP5nuQqRslHEjxIkzQo8KQmPpkq9KdsHsXLirGmwgQYww2CpAFH+pGcOY7a4GoFEOwB0sw7S4e/NqWJWO1FMaf5+9eWxFwqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165207; c=relaxed/simple;
	bh=8uP6LT+ukBwhaivCh05LcJGGOB2/OgSp8Re0GYi7SoU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=QxM2qOtNUZuJsQ4BrUpMSss+/9GgsIkuW9Z+wvR2VViBJJ+p47+HAa8Q8uzR7n56HzspUm/yNWKzUz1x6geR0F4QD5Ifu7qWgl9UA20BI7r4rQlH00m3gRxYR87w3t4xqX5HDxXe3LzBcWqBG77gMz7deTfJtDtqOwlVApMJSOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmHlWj0I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmHlWj0I"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453426170b6so17318595e9.1;
        Tue, 17 Jun 2025 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165203; x=1750770003; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjsWg6wjDm6jQcEuM4LRUlfdhggu9x3buFoTSjnXWV0=;
        b=AmHlWj0IUyOy5+ik7QeQgNh/1p/tUKo6hLTl7+MQPLn58BiqEym4nMv1UNyzSskSNV
         GjsOWj2SI+UTRzpI6grHYErhNgiq+5zCbnIFjea8TTk69QEMXBeUNwTLr30ok88yIKZW
         ZiNSEjNAbf8P9NPsNrGOtqCNFAB7n5nuJINSQma1heCLa5i7EBYQKyGRvm5IJrsA47ix
         rqVkec5MKFZQlrftcaCgD4xx9Lw3jPw5nw1fA8NB4D2dnCKGYMRdggzxtMkPNIMEyLL9
         kYOdYu2AcOj+jkpIBVCLG2Fu8ELqhekXmAOYK+p8qUaXKxv9AwpE4Sty76DqQxEFfCN1
         pKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165203; x=1750770003;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjsWg6wjDm6jQcEuM4LRUlfdhggu9x3buFoTSjnXWV0=;
        b=ACBNZ1aeaoUUFpnHKHZ7x/xc7Hb67CR75oNs+kE97lG984FH472yjTmUFnkmGETLj+
         3HHptLSFvaqcgx9KdxoJFLX+rOSLx0WrxSoBoFTOyDhDcdCmvGTowdwHxiqp0Eg4wjkD
         OJArKHbhW+Oeavg0EKC3NVxo2uhKlQQduaoyEWQ3OcBwOSvNY2YQpdN/vxxAGb120FM1
         7ASqCHRyT19WosgE081rSxmLYAGQn/Bbo4VdUE7fUN+EUOvH1iZg7BK+bx8O4hGUK4x4
         tu9kZTjJVGnVl/XwiRj2GXraXWO4RTtsL9vk5yk2aZoBjOTGoGUSOfjrHglmLeXejPSr
         a7yw==
X-Forwarded-Encrypted: i=1; AJvYcCUufdrG9myeOSrXGJJLTmoaNl4IOxqwo85lSmlgD/F2YFTbnqZ5Ejd8KDG0vBSGeXz7wpI5tA==@lists.linux.dev, AJvYcCVhn8jEvRMcGCjcdGOmVKrvKu9puTXBYYylEVhDZzxrotth68aFfV8vDIVcREeUM3EwKSndRWmFbUL4beloMc0XwYSGeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YytgB+tNXvi4C5QRbrKZzCFlM5ZlUkAqrMzxW0bPvlnx1hdkTr1
	al1ueEF4+7mytiADn+EuZjpO9emhbH35dP/9oE60+FsrPD4k2YtTVVbU
X-Gm-Gg: ASbGncvJtHHdHhXt0oFDj9z5GDuiX3z8Njc4OxztbxWXNsQOrte2Sxn0r7sJLt29gRJ
	hClKwrs0REmEoSV8kHN1ntjC3pBpR1NXO2F/y9Z4dhpNlwVbYqL74hyXBfAofEShoSXUsGyHs2t
	0D8UDAgtescpAC/EXrYDMwEaPHWMVw0rntbx+7wN2kD7V07YTTyJw9OufhdrOMdxd5EAoydMk+d
	xcQuCNQ5JLrob1JzsGHwPqPwgcrzchyu9k6fsCOFjaitruubSbnajCgiiCM6rkTES5I43xyJCDt
	dz+JCPYGPRcqEMrFTSLYgCD+PI2uveyGxCdwTEvrsJFgYardItYQuMNy0t2vUT1K5/zYDIeQSoU
	=
X-Google-Smtp-Source: AGHT+IHwwj7CVw6Bj8pFNgBnFdrKM0yuR71YOBGRt973FfrCTBcEA9FDVb4CUIvYdZXyY6zM61Orhw==
X-Received: by 2002:a05:6000:2504:b0:3a4:e624:4ec9 with SMTP id ffacd0b85a97d-3a572384087mr10993800f8f.3.1750165203029;
        Tue, 17 Jun 2025 06:00:03 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089d8sm14174223f8f.57.2025.06.17.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:02 -0700 (PDT)
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
Subject: Re: [PATCH v5 05/15] tools: ynl_gen_rst.py: make the index parser
 more generic
In-Reply-To: <1cd8b28bfe159677b8a8b1228b04ba2919c8aee8.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 11:55:53 +0100
Message-ID: <m2jz5ak56u.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<1cd8b28bfe159677b8a8b1228b04ba2919c8aee8.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> It is not a good practice to store build-generated files
> inside $(srctree), as one may be using O=<BUILDDIR> and even
> have the Kernel on a read-only directory.
>
> Change the YAML generation for netlink files to allow it
> to parse data based on the source or on the object tree.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Please drop this patch. It introduces changes that affect interim
patches and the functionality all gets dropped later in the series.

> ---
>  tools/net/ynl/pyynl/ynl_gen_rst.py | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/tools/net/ynl/pyynl/ynl_gen_rst.py b/tools/net/ynl/pyynl/ynl_gen_rst.py
> index 7bfb8ceeeefc..b1e5acafb998 100755
> --- a/tools/net/ynl/pyynl/ynl_gen_rst.py
> +++ b/tools/net/ynl/pyynl/ynl_gen_rst.py
> @@ -365,6 +365,7 @@ def parse_arguments() -> argparse.Namespace:
>  
>      parser.add_argument("-v", "--verbose", action="store_true")
>      parser.add_argument("-o", "--output", help="Output file name")
> +    parser.add_argument("-d", "--input_dir", help="YAML input directory")
>  
>      # Index and input are mutually exclusive
>      group = parser.add_mutually_exclusive_group()
> @@ -405,11 +406,14 @@ def write_to_rstfile(content: str, filename: str) -> None:
>      """Write the generated content into an RST file"""
>      logging.debug("Saving RST file to %s", filename)
>  
> +    dir = os.path.dirname(filename)
> +    os.makedirs(dir, exist_ok=True)
> +
>      with open(filename, "w", encoding="utf-8") as rst_file:
>          rst_file.write(content)
>  
>  
> -def generate_main_index_rst(output: str) -> None:
> +def generate_main_index_rst(output: str, index_dir: str) -> None:
>      """Generate the `networking_spec/index` content and write to the file"""
>      lines = []
>  
> @@ -418,12 +422,18 @@ def generate_main_index_rst(output: str) -> None:
>      lines.append(rst_title("Netlink Family Specifications"))
>      lines.append(rst_toctree(1))
>  
> -    index_dir = os.path.dirname(output)
> -    logging.debug("Looking for .rst files in %s", index_dir)
> +    index_fname = os.path.basename(output)
> +    base, ext = os.path.splitext(index_fname)
> +
> +    if not index_dir:
> +        index_dir = os.path.dirname(output)
> +
> +    logging.debug(f"Looking for {ext} files in %s", index_dir)
>      for filename in sorted(os.listdir(index_dir)):
> -        if not filename.endswith(".rst") or filename == "index.rst":
> +        if not filename.endswith(ext) or filename == index_fname:
>              continue
> -        lines.append(f"   {filename.replace('.rst', '')}\n")
> +        base, ext = os.path.splitext(filename)
> +        lines.append(f"   {base}\n")
>  
>      logging.debug("Writing an index file at %s", output)
>      write_to_rstfile("".join(lines), output)
> @@ -447,7 +457,7 @@ def main() -> None:
>  
>      if args.index:
>          # Generate the index RST file
> -        generate_main_index_rst(args.output)
> +        generate_main_index_rst(args.output, args.input_dir)
>  
>  
>  if __name__ == "__main__":
