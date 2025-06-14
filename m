Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926D2D5C86;
	Sat, 14 Jun 2025 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908503; cv=none; b=j9JhqJDyX2sCnop6XWGVo+QPU4aLfih1QihsQWc9JJgC6ehbvvNhR4J9G7FRppP2WS7vfIakddcODm1bWWcs7S2s1fucBXofoeBtZGsfmVF1rTwyaQ62HeqCkw4hP289cgIZiQWF+awY/2ewjCpEi8AXiM90K4XNXNc2Gev6yfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908503; c=relaxed/simple;
	bh=lM3IIsUYXea4p4rUOkoeGBxOVTyK/3N04efUcluzdIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkTugAbbZCwo/iGj17ruo0DWVfU0tk+1Cdj2q1yYRkjGFO/a6D5upEjHxKgNoO9Chk2Dr11TXKEHP28mBsOtss4/EnbHqV82zOpbEd73VSFyhc3jwb+/eFnZ3QNPQww1VSNI2+LYVOea+uTO25xId69Zf7PjvZbey6r+W1xXNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKsaQ/C3; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKsaQ/C3"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60f276c7313so2097257eaf.2;
        Sat, 14 Jun 2025 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749908501; x=1750513301; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pPyT/NDLG21BaGCfzzI0/BaU7HLCtAjPSFvMEJen/+g=;
        b=DKsaQ/C30zrUdXywpN3rvmjwhDBixcQ10CLu+xDCqL6WR1UZwKXDHmzJfBMDPsVWhN
         P5uFyiWp268zjQgLJVaJYlVS5ZOqexqGz5iuhd8/f3mKvysZKGDOGo5RRujXEWi/vJJH
         tX7m/Cpi7qhZctZ3qEMDCEmU8y3urGFzLrI85tPIHR/ThykU5D+ZqHrNAQztQ32yPs7H
         K5Qy0klToRnfjn6JFE8hx7KK3VifYsp1OsChj9QMj2fENSL7/apuMtp3kNt8Nkh3jek0
         P0xL9eAO78VZQYjpZMmIyzF0udaMewwdLAwhdyGEMo+yQZAqnUbFoFxW1rvVeTci8Zl0
         EuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908501; x=1750513301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPyT/NDLG21BaGCfzzI0/BaU7HLCtAjPSFvMEJen/+g=;
        b=wcOrBrjAunRrBgEF+CrVMOLnEQ0G7q1eboVX4XpKhH435Ko/21ksqCJY01apTCJscT
         GxPdjbeHVa5C7A3+dciP0tXj6zQpC7CulcgFYuSHQijEV9GeKIx9kVhXfFIa6w2M3CQJ
         G79p5ee3NkHVPkYRaDdXESXiGBrYNmvi8HynPAl+b8snQpejDW6iRB0ulXyo5g6rl3R6
         C/NL2nTg2sVXXkax7LQtSLUi3pgscXRr8xjRyFzvijOp2wKrA2mPpZogQ6ffW5rb4YCW
         YBig4BrW1EYkbzX3LxF7aMD56J+8GQfvUvohi+/yVQKz6nJj8kmSnyqzqcOfKOy8cEf3
         XDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlGsiX3aCv+PoFHKTKKdn32+MzN27pXFfOia5/wx3GZzHP5pLVoSmXNv5Tv7QUIr6IKHipuw==@lists.linux.dev, AJvYcCX55d2GsROWHirapTJySIQPs2FMZzF3sczJtgy2P3oYiRLiSTxFQKAodiePkZ7h02ETrLpsdfSs3d0FPoD81KuM4h7pXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyLfab6iTJCI2Rjzc51MyBFkaj7OFs0CABCkkctwUbYBb6ObMh
	O4ANwlgQ08NJ7o8GLlYaQVGL0Nav9Bew61i8RqIXzOE0JOQLymDxAN/UEbDshhS7K83VvcvRg2D
	oMtdl3Xl+GOH7BgS893zem45Ydu0rNwI=
X-Gm-Gg: ASbGncvF3Bt8xfGH498nDv2c5tITwFiyFDefywlsm0uijj5dFolmjUNeMhzRQXJMUXO
	Gi3WBtf5xni7HqOp9LRljUNGxSMiL0boKcgCpusdviulsn+N9TYMUtCIpRrK7rR6umr2Xhvgjf7
	E+xlLEaf3PXGVKQrNaKZ6pLKneDLy8rI3gsXX1cIMxsWDsCuwKhR2X1hSTVd4Ssk3i4HfzAO7Xb
	A==
X-Google-Smtp-Source: AGHT+IE2dEWG7iT8GNYJep3a6JkNJ8eV4PpXFulpLxyQDVpz9R+FS91yWKJUhBNtKFcnS5H31Csgwb8w2XbcpqjcZrM=
X-Received: by 2002:a05:6870:5b92:b0:2e9:1143:584e with SMTP id
 586e51a60fabf-2eaf0bf35bdmr1877905fac.39.1749908500962; Sat, 14 Jun 2025
 06:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749891128.git.mchehab+huawei@kernel.org> <3fb42a4aa79631d69041f6750dc0d55dd3067162.1749891128.git.mchehab+huawei@kernel.org>
In-Reply-To: <3fb42a4aa79631d69041f6750dc0d55dd3067162.1749891128.git.mchehab+huawei@kernel.org>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 14:41:29 +0100
X-Gm-Features: AX0GCFt_USLBH1YdqM00LqXA1QAxCvtGi6cp-lOxexZKo8IC2JWUf0FxeobXNUY
Message-ID: <CAD4GDZwCLd0rAi-FTWZ2UEsfbMtvxbFAqcLeLtE7SfiJUB2VWg@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] tools: ynl_gen_rst.py: make the index parser
 more generic
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

On Sat, 14 Jun 2025 at 09:56, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> It is not a good practice to store build-generated files
> inside $(srctree), as one may be using O=<BUILDDIR> and even
> have the Kernel on a read-only directory.
>
> Change the YAML generation for netlink files to allow it
> to parse data based on the source or on the object tree.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/net/ynl/pyynl/ynl_gen_rst.py | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

It looks like this patch is no longer required since this script
doesn't get run by `make htmldocs` any more.

Instead, I think there is cleanup work to remove unused code like
`generate_main_index_rst`

This whole script may be unnecessary now, unless we want a simple way
to run YnlDocGenerator separately from the main doc build.

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
> --
> 2.49.0
>
