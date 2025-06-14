Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0D2D9EDB;
	Sat, 14 Jun 2025 14:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910540; cv=none; b=N6caVxfeH19oK5l+AR4UyxizprPG37c5y/EwgluUmcwpFZDiLHTqSMD3Aidl+4IToCL2Ot/06UNlrgGiaA5huZFOtmcR1SNFSyKxRVVSkJREqDeImu9zgIEKgeWJrm5AGkoQq2M52vhtekUIEr7KXKK1WDM8w2tLNTJwWeHeX6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910540; c=relaxed/simple;
	bh=DCmUzencsMsnMaFx/4U/i7fCe25jewj1ptzTPHuZXrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIzMJrNJglEahF5+XPMy4259ltS9FVpq05vPXHB17I46sPzG4H/ZETMED6iLLU7ZVJ70q+if9uULvw1+EmOWJAeIpL4MVbSv+hnBw/QCIYAOfzVEtEis9e0bzpi4pdM9mpzRO8kj1cbGFRawwyr22i85GbQZNsnUwZCyFs7V0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVA2bWda; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVA2bWda"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4067ac8f6cdso2072604b6e.2;
        Sat, 14 Jun 2025 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749910536; x=1750515336; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V212NBLelySDp+6/CyeJaC/8PZkKsYoStFWQx4jyJv0=;
        b=NVA2bWdaX6bYcWTGMj4g4ZRy4Tad/h34+NvZP1u4M14zpq/b1M35GjF9PYe1Cg5ORE
         4TWegPlR0wmQBFRfscs/NgBokBGvwBsc+pyg/tV5vrdOMt7o+o78I0xGddxeBqYz6L1E
         iJ/vzsjMuqYJPsoGZTTu9JLrdMqB0VPjDvggLISAkc+EU7FI2guSeTwqXNPvfFeS7PRl
         Br+8wp5MbsG+GzgYf1GFPXHD/fRXDdg/lQE07g/PcaJ+eswJu3FD36EkOqc5jN8eClup
         3ehf1Js4VUl6+2rVxvF/aRZLW1c8THXFEsJnQGlK3l7YrunUnA2unsYLhIO2hnsMWLsQ
         ZlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749910536; x=1750515336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V212NBLelySDp+6/CyeJaC/8PZkKsYoStFWQx4jyJv0=;
        b=egoXyGFBUCJ805Aych7XYsXTVjFItw/WrV4ewNrmlG6DxzAFNwioMWH1kxSgHc0Ncr
         3TPdLcbc/ZPeRpSIKUzTJA8bW9kEwRvg287ptucZI3Rnoz+hiZk3lNk0u1P8mZRVmebN
         gaskrfN82zJzDpTD2C8b+SBuOFyAP1j2GU33BOAGbKhE+768/5eMx+i21QCP0JtAa24Q
         bnKAAD57FFbYv+rb9q2j0sVk88F9fPeJaAuqA2wEvr9sl8z5XhcgLZrK7z3d619Y4uzT
         O3wAcDonmeIKIhyyJkuxxhyVGHltOC0k5VdndjBeCK5zvMLlkCTk0vqJJDRgy3hnM6GF
         dYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSOXAtT8w8aMwcwiurGxaeh0qsu4tXxO7gE313eEoQldOsJmzGIPtxAVSA5D30rR6UxqD1bellpr5skReqNTFn6P49XQ==@lists.linux.dev, AJvYcCVcdcEuvURPSYijcqlwZIV7TOnUF60283vy33GUhil2kzd1eYs+ZALV8YA+aLm9aXuBGuZOxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxQfodzqcrB1z5yw6dJQDUK+FVUuKFMxIfM9XtNQ/PG+9G8AX6
	E8GqweAP9VWkQyt0zP4pxFQ7CBkBZd/G7yUr4mXi4k4f3H49Bsm98GtrWR5G61EWL4/D0TgVvO+
	8D9oYcDl1aw2k9qvcN3z/eAeUcQ8vv3aOjdfL
X-Gm-Gg: ASbGnctCk3Bjj4qJ11gTCJFLr91CJ/wCRFjRkqlfg7Z9yf+TsUs5GzZCl+vvbb7m+yl
	fw8hZfVJRNt2bKXdpp3NJD4h9e5hctjZ9JAGkTHLBjvBp5QzPHxGeBxr7m4jQXszyGyh0eq26bw
	50feH/BvaadHbqMHObEoXA34aNZkOtZx+N3pD24wh8KdJ3HcrQKFhI725kWOJxIF5p1ygixP38O
	wpDIzay/uof
X-Google-Smtp-Source: AGHT+IE7Id5T+q892mpAZrQTdRJVM/iBsvIslk9IkOAbJoYWxBoUYMFvgoYdDkNU0o3h51zEcveta5gNqzJQn1eG0z4=
X-Received: by 2002:a05:6808:211a:b0:404:1898:1a0b with SMTP id
 5614622812f47-40a7c19e067mr2049349b6e.31.1749910536255; Sat, 14 Jun 2025
 07:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749891128.git.mchehab+huawei@kernel.org> <31466ece9905956c2e1a3d3fc744cfc272df5d88.1749891128.git.mchehab+huawei@kernel.org>
In-Reply-To: <31466ece9905956c2e1a3d3fc744cfc272df5d88.1749891128.git.mchehab+huawei@kernel.org>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 15:15:25 +0100
X-Gm-Features: AX0GCFu7jgqlSlj61VjuypZSCCHHVOKVJwT6Cqt0Oc5ACuVVfK8OEx-nZWS3V3c
Message-ID: <CAD4GDZxPTFmKeNqRZBxW1ij6Gy0L3hrbB6q9G6WdFb8h6Zhr=g@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] tools: ynl_gen_rst.py: move index.rst generator
 to the script
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
> The index.rst generator doesn't really belong to the parsing
> function. Move it to the command line tool, as it won't be
> used elsewhere.
>
> While here, make it more generic, allowing it to handle either
> .yaml or .rst as input files.

I think this patch can be dropped from the series, if instead you
remove the index generation code before refactoring into a library.

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/lib/netlink_yml_parser.py  | 101 ++++++++---------------------
>  tools/net/ynl/pyynl/ynl_gen_rst.py |  28 +++++++-
