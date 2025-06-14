Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93A2E11CC;
	Sat, 14 Jun 2025 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908055; cv=none; b=hssSHy/Mu9hd6jh5I4ZuSH7Mkaz4Q/F5Opg92WZ/nkJLpHJisbVEHWhVh6JFTL75ktrjQwH+ylhZMAvgQdsNpDZZ3J8W06IcIamK40RhbRRSu7xeIXzRmKP5RDggkRKQdCaMnXIGt+HAk8aiiwF2KstcBF0xaqoAIJHCrUNZjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908055; c=relaxed/simple;
	bh=GghmQMVIpd5ow4BvOSK9cdhAIcjwLkKs50ouTbuGm3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3lND8lYxzw26Ge7PsB9bwzpcznDo2xe2ubPn6Pqu3f7vcVclC6+oOBBzrZk+4g/R6fmyKfBWgt/zYuoq+40kyuJcA/t2ML7vTKInB4EM0ZhtgN2UamsV/HvxBl8JfpEWQFAwFLzcP9DhizP7wG8hKvlX6GWL4D66tGiw29C7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo/3DnwD; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo/3DnwD"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2eaad5eb1easo1641828fac.3;
        Sat, 14 Jun 2025 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749908052; x=1750512852; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgT5nC6oJGH1H0WGlHKUUzo9qfMn4+AtCYRD/Jrz6L4=;
        b=Lo/3DnwD1OpGYfkApSSogeQsRUJ6YuqyPKNjBr3P22tyOP8dCOqggpyMAccGT9op9I
         W+1HtLu6VDJm45yB+71YD95m0INkO1pPy+PxVGlT+iKOCf9gfjFdqGzfa98BSZy0D9+s
         VQn7ymnzOX1SkkQTXIiTYLixACKxUVcD5u8GT+d5BanTo7dNR79xzJ+wJAc9CQOqIoef
         utLh7DHBrMbZEVewa6Lj3GVtzJAx3L4+fIodtMqVKS7mgQP0gKOlfbaZuHKuxHqnELwB
         raG5tDlJ0S6wr+cAIn91nTV6UiQRNEti7YT5ONx6A0CCbUqxUrenrtp3OL7yclxe2ZJp
         mYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908052; x=1750512852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgT5nC6oJGH1H0WGlHKUUzo9qfMn4+AtCYRD/Jrz6L4=;
        b=iFq5hbqsEQAx8llOnHozHumvLT3xMVBDh2NQae2Lx4bPBWjZzH4Dk6Ws/FmlKYlB7m
         un3eQWStKxg+0nC6DG5a4pOnNv7R5lLSZt7Q7qAGkiHnkh6FIiXLkIbeZoriPjUQDOOt
         sP8DoHdHt9Jr2va0pxQHjFh/Z6VRYDDmeVcEZomVgFOSpfsHIEoQpnRy5yeaWt6SXZX8
         eZvmCkCEUfnQjEsDfv2vTjhEGkZeclDFB1uv6jK0wNjHV+IsPDK3NkoWKeu0J7lbWPqB
         peS2MH22lNWS8CZjKhbK6/xuZvlJj0uKlT9J2fKTpyUrIt1pkcrF115GCC68xl+QfN6j
         hvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNnh97Chz5EW/8K69gSU6wh9TzL/Gdaqt24vFCwQgryxvCag8ggHbCAIWNHVnJ11gtz1O1EQ==@lists.linux.dev, AJvYcCV5natAK7YHZ2ZVHtIZAoPGWooSsJjETy6/Z7nzqz3vBDrt+RcSfoNxeoeAHmQ50bUtM0hLw3wAEcBRndQkLOloMBa6Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN1+R64CXPd7h5jovrbaioO9tkMJRTeSc4ZMLxeL4uvv0tiLNh
	uCdy62ZnFhw5qDM7msLGtiaHef64RAtFJEKeRCG3tHFi6bCHjvE5GMTVRE4avcyBkaPOhieqor7
	yLZODOWsCifi1ibz0CwS66wYCvnbr2Pg=
X-Gm-Gg: ASbGnctr0EU6Glp3hOcJRP+C+8DF1uODByCnjpIj0kwWJblY0MLV13TM/hR6MVC12ee
	bMElgbyN5AWUykixeIyzxa5xc/3j9T9+NHUVDxtHJIB+lzXuyu+PlsIL9TLbUDlJtEHQujL5B+0
	WujRYWT7G48mXR35L2nEKSB/XZs/Ezp8z9oaKiYwOgszPbahyxotbkMRN6saosP6c8AJpbPdfd+
	g==
X-Google-Smtp-Source: AGHT+IH+YQDn5vJWfQK7J2yXhyuCeLrw9tQMapi0P+p2812s3nfq0JAxLR7ypcmPStR4URHIU5eHzQjr8qvlX60VZB8=
X-Received: by 2002:a05:6870:2249:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2eaf0b860abmr1914642fac.25.1749908052339; Sat, 14 Jun 2025
 06:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
 <440956b08faee14ed22575bea6c7b022666e5402.1749723671.git.mchehab+huawei@kernel.org>
 <m234c3opwn.fsf@gmail.com> <20250613141753.565276eb@foz.lan>
In-Reply-To: <20250613141753.565276eb@foz.lan>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 14:34:01 +0100
X-Gm-Features: AX0GCFtPzI3njkXsRRl6HopHPGjjoi0wzH_2Cw73cHghqFsHQjZh1J4BTEKxRQI
Message-ID: <CAD4GDZwJtrL3uRCXNJ9vdfXAnjL4H5nhSqn3GDSW90Ee22qgGA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] tools: ynl_gen_rst.py: Split library from
 command line tool
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Breno Leitao <leitao@debian.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Ignacio Encinas Rubio <ignacio@iencinas.com>, Jan Stancek <jstancek@redhat.com>, 
	Marco Elver <elver@google.com>, Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org, 
	stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 13:18, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 13 Jun 2025 12:13:28 +0100
> Donald Hunter <donald.hunter@gmail.com> escreveu:
>
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >
> > > As we'll be using the Netlink specs parser inside a Sphinx
> > > extension, move the library part from the command line parser.
> > >
> > > No functional changes.
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  scripts/lib/netlink_yml_parser.py  | 391 +++++++++++++++++++++++++++++
> > >  tools/net/ynl/pyynl/ynl_gen_rst.py | 374 +--------------------------
> >
> > I think the library code should be put in tools/net/ynl/pyynl/lib
> > because it is YNL specific code. Maybe call it rst_generator.py
>
> We had a similar discussion before when we switched get_abi and
> kernel-doc to Python. On that time, we opted to place all shared
> Python libraries under scripts/lib.
>
> From my side, I don't mind having them on a different place,
> but I prefer to see all Sphinx extensions getting libraries from
> the same base directory.

It's YNL specific code and I want to refactor it to make use of
tools/net/ynl/pyynl/lib/nlspec.py so it definitely belongs in
tools/net/ynl/pyynl/lib.

> Jon,
>
> What do you think?
>
> Thanks,
> Mauro
