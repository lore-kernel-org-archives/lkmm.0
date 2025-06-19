Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A4523E35D;
	Thu, 19 Jun 2025 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335604; cv=none; b=crjc6HpkBkks971SCedoP3l90JKmWj1cNWj2/3nj6thj2MoebOPTkA3X+O66FWfPXWp9ZPmI3agvvaHZIu7M86rWPBculb9IjxY4ySFeOg6ZjG1sWcE8IX8lfy521JjjGI6BKwrlAlFKhK/0bU5tRz7zJf6zwyL77SfuTWWLi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335604; c=relaxed/simple;
	bh=UlwbZeLMLNhVytz2MMF8Q4is5QXNpz/xiXdRg+hnNMs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=IfxkaBkw88xsMlLXmJsntdSzbtAtuPBJlHGF5LuG4ust4VDlbmWnspYGbnrH+ujyM7keuw7oIhjLD94s/KgvFgc2fP1Pp1gHphjkorAgILTDkS79FwU/akxOCJsj1UIgSN/HkCZwa3foVFulBAbNcMU1MBm72DGtNA38vL7SsdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUn3jB9r; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUn3jB9r"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso679808f8f.0;
        Thu, 19 Jun 2025 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335600; x=1750940400; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqJP4+yTYhK9BQPQIOtnsPRRAOa7y/0vl+XuyGoTtX8=;
        b=lUn3jB9rFIVfTumQeMUSICjg4+zT6tFCaj4YE7P9zDpV7/qi4t3kiSW7fil9O9rGA+
         EuKX7Z0lmPE4ZBiNteTw4g1gGMUYO+8s/Cwcxr3Fv0yRQquEFc1m8OlZaYRJa1aTaR0p
         fNrU7DzlBSgO/8Hy5YmgFeh++mlpDr0Itouk8Zs4+HBr9N9fXWAW3BI5A4ys8BWiiPuq
         4simMD7dN+bY3xDbQeNOOU2NICkJcOFB42WsjtTJYhpk36vj0ncl+f3a0tpGx60ip+mb
         WurN3tB0VbcAV88qc93HhdbhCb6DJgRpRxh8//w1ded8zADoxHnQzJn+zXKlcJVj5+3c
         +umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335600; x=1750940400;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqJP4+yTYhK9BQPQIOtnsPRRAOa7y/0vl+XuyGoTtX8=;
        b=WmtMzPL978eXPYYE41hbEruEHlGr269c3iQzSrE6Y+wx1wSZJUNzK1DMDTKaIZlN8Z
         zzvKMYX5AtPf9yDsleEnsfzgGYOpZheZ6mROtin6Otvihexcs0GVNLDpoEJAX1qyUpP/
         cUSBFA3PVBJ7RllWQMSYO32yJjZ3DpEHzb9cdcjpgTH3pDND1Xl3tW2Sm8998qmaf4Tk
         xYnbTGCNIQZxpsP6C6opMOA6znDFE65oDBL0LGGqg+Ss2CYBFImYzvXkM7zVozk+ICAj
         15CDp737a5s3mWT+WhIv9AI5Tl0Scj34dL976uaaLr76PHKwSwHOHL+75/PzXF5lecwP
         U9/A==
X-Forwarded-Encrypted: i=1; AJvYcCVdkHCLzZ1iVSFxeTLVO8BE1PmjRjXH4K96QasfFna321dBkJTFMYUdenvmuVlHvRwhEbGSHlkulvViH612GC1epcut3Q==@lists.linux.dev, AJvYcCVlKsZvIHwOa1j2toYNH2zEmvwFZiN/bEB0/evXZcP14Kr9dz2DrVF+wvxFCzaPoaRIhDeiog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqkzqgMC5JVK+24gLE/2Y00YYLTOyA0R/gsbrk3MH8bCbWJh9v
	dt3OAI8UgNtEdmAz880sCeCzry2YeDZCBAD6Jle9z0p/qgE9Oed1C7gT
X-Gm-Gg: ASbGncsMQmotQYr1DbtTb6I0oVouhHirj+vHqGOyJs0n+egv8chuYtk1SKzAPgF3eiu
	PuXqe5tQF4rmi/OM21zH2Q+CiKSfPLfNZNFgHeeqifE7zK6yl7fEL2qiWDoSuNHa9nGzO/e1dHQ
	PaVbDPT/bMXZGgNt6iKhOMffD5Hy+teX7LGnfa2MTqIUVLeV19kpn2HIr3OT2bXIEb8OXGv2ycu
	iIwPD/+BFzZGHTyUN7GJ2mOcAZ+8+ycO9MnVM8lVd9Q75vSb/lhfsyv+IKtbYBlNX6g6LqjpsVB
	oc6YWTgXumJ8JCbMK+75SH0R0qNmk3M1sjJO+lhKHrtBJiUCAKSZo6COwF8iJev0awW4bmfo
X-Google-Smtp-Source: AGHT+IFFW++i0RClDXuN5jzsKFtxPwiv+zyqlTFsPj4l45JcwpuEYcB4ySEwNMpn0lpcnf2uOPXLqg==
X-Received: by 2002:a05:6000:4702:b0:3a4:f7e3:c63c with SMTP id ffacd0b85a97d-3a571894b7bmr19742912f8f.0.1750335600402;
        Thu, 19 Jun 2025 05:20:00 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45362219d3dsm6837755e9.26.2025.06.19.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:19:59 -0700 (PDT)
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
Subject: Re: [PATCH v7 04/17] tools: ynl_gen_rst.py: Split library from
 command line tool
In-Reply-To: <4e26583ad1d8a05ba40cada4213c95120bd45efc.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 13:01:14 +0100
Message-ID: <m2plf0ey9h.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
	<4e26583ad1d8a05ba40cada4213c95120bd45efc.1750315578.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> +
> +    def generate_main_index_rst(self, output: str, index_dir: str) -> None:
> +        """Generate the `networking_spec/index` content and write to the file"""
> +        lines = []
> +
> +        lines.append(self.fmt.rst_header())
> +        lines.append(self.fmt.rst_label("specs"))
> +        lines.append(self.fmt.rst_title("Netlink Family Specifications"))
> +        lines.append(self.fmt.rst_toctree(1))
> +
> +        index_fname = os.path.basename(output)
> +        base, ext = os.path.splitext(index_fname)
> +
> +        if not index_dir:
> +            index_dir = os.path.dirname(output)
> +
> +        logging.debug(f"Looking for {ext} files in %s", index_dir)
> +        for filename in sorted(os.listdir(index_dir)):
> +            if not filename.endswith(ext) or filename == index_fname:
> +                continue
> +            base, ext = os.path.splitext(filename)
> +            lines.append(f"   {base}\n")
> +
> +        logging.debug("Writing an index file at %s", output)
> +
> +        return "".join(lines)

Did you miss my comment on v5 to not move this from ynl_gen_rst.py,
since it is not needed and gets removed in a later patch.

> @@ -411,7 +65,6 @@ def write_to_rstfile(content: str, filename: str) -> None:
>  
>  def generate_main_index_rst(output: str) -> None:
>      """Generate the `networking_spec/index` content and write to the file"""
> -    lines = []
>  
>      lines.append(rst_header())
>      lines.append(rst_label("specs"))
> @@ -426,7 +79,7 @@ def generate_main_index_rst(output: str) -> None:
>          lines.append(f"   {filename.replace('.rst', '')}\n")
>  
>      logging.debug("Writing an index file at %s", output)
> -    write_to_rstfile("".join(lines), output)
> +    write_to_rstfile(msg, output)

The changes leave this function broken. Bot lines and msg never get
defined.
