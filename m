Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230172E6D2F;
	Tue, 17 Jun 2025 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165202; cv=none; b=d8GT+hQdWoTXTsw/P1I8sqJma3zGXXvw4rFN/CVqmFjFJsdWDolDR+TiZg3F3yRec9Oj2Kwqc5vUhYiuPGtrYNN9dC8NgmZ3UiVpAN2EPkdFfBjJo4ZTd+1XxGKSx/InLiVrumPqwdax3wi8Z8tmMKtXOXFVpcg41IveyaBw4Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165202; c=relaxed/simple;
	bh=lYCtkVyKdENR+dzqdVYy9VsqrApiz6GmggKM0FQrVSk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=e5nfr1fPKtiLsvJOHdP5NNOzrlXjht7uhUuUwqMYYpSX8IqKFT9/JGebO1t4pJFjuliUlxWmjHQNvCr1TB7EpgrchPFuYDDuGa+1E7Zghob/n1iFbAHXGdAjSAolXP9yc5yFfFtYRp62H8hPTBbZ0aRkTzlEHe1r3JwujAuDrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGtjzSsC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGtjzSsC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3317229f8f.0;
        Tue, 17 Jun 2025 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165199; x=1750769999; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1xGMAYjkvYIscDppoqoFS0dk0S9bQU0DsTqywoNvoQ=;
        b=RGtjzSsCsO+iPyVmwT+V63t1gx4mFw8WMTLLVMKyJkS4BWgxZO5Mw4ui/Me2FIvkXM
         mUJ0mD/eB2U4qbf/pQ44buS2dqmJjTU9hQ/dtEt+m7zeO4DX+XRlbUxBHx0x+d0MBMgN
         MH9EBMMNKRshBc//uE6X+W3xCnCaVD+uGyowbu37/LfQZfYmROBb8jxjUrJ6OOEUopJf
         DoEiSFoC7Fc8kRbY5SXTZmF9Y9HNf5cx0uDQTD1U4M2kxcbmM3tNrA3B2SqpQd4L/7F0
         i2HVwo7VfPxZU2R8t561iJrwxG5rlsagpNglWlEIMlBJborSJd4DB+ZzTJBgkTj8DQQc
         7Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165199; x=1750769999;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1xGMAYjkvYIscDppoqoFS0dk0S9bQU0DsTqywoNvoQ=;
        b=F65t1uf+y0m0IQGtTLNmndjPsY2ie9BsOzOXZfQga1e5uZsuschdqKd2w+Vdla95+P
         /6jaRqGlukp7ynYjoTCerNSXJ+fyfu8wZ7dKLYoEBuwXJEGZR8Nyil7Ewcm54cyq6Jqb
         9Q+JltV23kiOQpJP+tGGbm00K4RZZBQpCawR346M7Pjs35l3twLnw7vg1O8TYE579vtS
         6CWrHQvRriV1NglkZHG51kG7wbBZWa/23vMBwcq7YSAU5VBSWHiDjYeT4AvJ5ylTSY5y
         Ff920FUqXiUzhJaHcCNB7PXYTiULxd0AjXYZtiqes989bPq0AaYAQ2UoQ/EfsCTtAi9w
         9p2A==
X-Forwarded-Encrypted: i=1; AJvYcCUMWq0lxAQPyUHTo0IqPbSklsY9MTMmC8ZXHh6iAWbO23KRxsyQALfcUQcbulNLpU5uUkv0AQ==@lists.linux.dev, AJvYcCWCUJIIX1KUxAqdJDT5h7pjgoEDY0hPqlHh4iExwNzu5ZlP+RgQ7kf8OYgoEFPFFbWrBcoIoDi8h7MMt2h832H6T03FUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Yov+MJY2nsrAhC2peEyp0zsLCuRPDMsg7m2XZwzYwrn9Z8G2
	BHkgFTxtv87kXPExv8kEoyNf7u65aWhd5tOT/W2ShT2hgHh/GXpaf3uX
X-Gm-Gg: ASbGncuAuNS4gTrjnIr4Dxz6IcSdfJ0uBM6SWjzfwtf6VPtixV+lbTzpwlQD4PufVst
	MKoc96qN7uZVTBtiOf1HX360aaff+XSkSV8idGGbr/+CyebSKkdPp0/YXbK/0KvSuOdrEYMuC8M
	gaksTPwnnW0jAbeZJK7DhdV/7Esn/gMGJvjPGfTKn+eZ3ov/AaCTef6v71Ca6NqnjgTqd7V8c93
	YglMAePbFdX74CmyNIBKXl6CQqrR2VwGyuOFf6M2yFrVdoLYmauhNlEJaNEjgKUPAxTUoyuBOE/
	k7c6Sn19adrhXevCvB/dknTDsvPm6ubvJDFMNHwSsOyzzabgAUxf3r8rb7ZGy9l1eSfeaGp4orI
	=
X-Google-Smtp-Source: AGHT+IEJqryb3c66QPuNLx2gZA7HOsR9NZhIMg8bp3yLVq2tmPiEQ398MZ3ApYQ2ePQKbLlR5FM2Dg==
X-Received: by 2002:a05:6000:310e:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3a572370f67mr11657229f8f.14.1750165199271;
        Tue, 17 Jun 2025 05:59:59 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm13724028f8f.81.2025.06.17.05.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:59:58 -0700 (PDT)
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
Subject: Re: [PATCH v5 03/15] tools: ynl_gen_rst.py: create a top-level
 reference
In-Reply-To: <4496d88c381b9f7ddce37c5a2d53156c5e8e6a17.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 11:40:59 +0100
Message-ID: <m2sejyk5vo.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<4496d88c381b9f7ddce37c5a2d53156c5e8e6a17.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Currently, rt documents are referred with:
>
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt-link<../../networking/netlink_spec/rt-link>`
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>
> that's hard to maintain, and may break if we change the way
> rst files are generated from yaml. Better to use instead a
> reference for the netlink family.
>
> So, add a netlink-<foo> reference to all generated docs.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I would still prefer to see patches 3 and 4 merged since they are part
of the same fix.

> ---
>  tools/net/ynl/pyynl/ynl_gen_rst.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/net/ynl/pyynl/ynl_gen_rst.py b/tools/net/ynl/pyynl/ynl_gen_rst.py
> index 0cb6348e28d3..7bfb8ceeeefc 100755
> --- a/tools/net/ynl/pyynl/ynl_gen_rst.py
> +++ b/tools/net/ynl/pyynl/ynl_gen_rst.py
> @@ -314,10 +314,11 @@ def parse_yaml(obj: Dict[str, Any]) -> str:
>  
>      # Main header
>  
> -    lines.append(rst_header())
> -
>      family = obj['name']
>  
> +    lines.append(rst_header())
> +    lines.append(rst_label("netlink-" + family))
> +
>      title = f"Family ``{family}`` netlink specification"
>      lines.append(rst_title(title))
>      lines.append(rst_paragraph(".. contents:: :depth: 3\n"))
