Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E42E8897;
	Tue, 17 Jun 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165205; cv=none; b=pOAALhfyaXMVdVnSxHo4GVepxXff1puk9ZSkBo4FR1dMGvddBZUaq3qRtwYLLrjmQUv+Evk6g5tROglXYX4ATZs5ub714UwCkqC5ZB3CJs1siaWzLUDMiIiG8+Cws6eslJy+F2IIthl8NfUX2edkFrBKvNNVk3pvCLqMzO7VsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165205; c=relaxed/simple;
	bh=oOGH7JrUTQsVKaPTed6EUUmZzVLb9azQu8wIKI3QOHs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=a4CN2BNjtAECjOKhiB95BImXWgjAVBb3a11dqbW6Mhs3tvF0Ji9fWKfl5NzPRePU9r+YSLjnArKDf+jaFM00H7x4nYPgBjqyue3obiSiSo7x4TXIWdHKLTeOlV/29r4lt6vZZhVZgsSIodvjo6JIY+xe8gp+byZygxQ4/YDDXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf+ILOUy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf+ILOUy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45347d6cba3so6704615e9.0;
        Tue, 17 Jun 2025 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165201; x=1750770001; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOGH7JrUTQsVKaPTed6EUUmZzVLb9azQu8wIKI3QOHs=;
        b=Mf+ILOUynujApT6jHuOU1XGkA2ZHs4L5Ifk8xFmfL59a06HNxr+cXzXg0yQ2k/+KIx
         j25T8ZnT2pvJrOF3t/1UJKt4HiRxEt1c1UUVfoF4l+H+wdSZDG8yIUIRFfilqMF90vCE
         iuDMuajq8XsLfstBaydbf9Gt9qgmtmUVtVWGzRKyLbrk1q4N0HKQgSzFLRatT4HaYfn+
         saTiwXnoqJS6uZBSHkIYJCl/qHxKlHnRfcIbiwIkUOOpy9lAEVGxgvLvqRAfZ1b520VI
         RH17M1eufiqVkLWcYlJ0H0AMZhbFrKQK+iR/vWE0nJxlOW7OhoHSHnV9FaVDtpFgInMp
         xznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165201; x=1750770001;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOGH7JrUTQsVKaPTed6EUUmZzVLb9azQu8wIKI3QOHs=;
        b=IkazjbXhuJknvveCdy8Do+eykX7j7iempvH7uPcJVqEt771uFNLt2ARsQyliZIv3J2
         oBu1bnpAyGZD+nudkx/QdZ+ZKOnjOHI/efovNwhnegkmYErn7Nqb9mZOyi7ujACqQ4l0
         wmXknzRE7fFnE1Ci2zugi0NkxAkzgFvnUzsuodWb4RU1FZPQUDzDaMhn0F6idIeo8v5j
         KMZJklvOQjySqcEVCwNfuSXCrj37g71TUFoHkQtXYESNuMNURl/Mua9Xp2+wwvNLAWZq
         3V3jwNJuXxom/Qo4gqleRNbbb7KlOiMw06Vu4g19i5JmYLVYpldaHqxsJTQxohhNpVWc
         CM3w==
X-Forwarded-Encrypted: i=1; AJvYcCWxf6AgVloanjDsBvDXwd1/jnuk6NBJjH2vebmdtUtYbGwbAw5OWyiGRJHA7d7b151gRkBe8w==@lists.linux.dev, AJvYcCXuNZS4lhu1an+AzugFUUvgX8gLlsEptLs04WOxmS2HGRSx6VZClkca+U47U2AFOqTlnqYTtloliSSM8H3h+CFFmLoxUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdCxGcS+eR8JQnsK0Xb+aMeoTrf5EoUeQ+tT+PbPAfgU/nr+Kp
	9S0E0iJkUjmqb1uFI4u0CmaE6wAQ4IzJrTAzqQiBg8vcbqQEg5JnQs3Y
X-Gm-Gg: ASbGncvGD24RLjwNw4XiYjI+ohrLOG6yuEJz/RG/4sxHJR+5GKrIfsfKw2llDW6Pd2X
	i7g+xqJEJZ9PBbk+Wx438VVY+pW45BfthQkRD5CJlRDjrQIkge7hTVtMtl1Rv6YugJtIHppSFFo
	+76gbpZPWe3VlKbalk2tyawl50RQ8bSIyzHUB+brrdzoRExEawQeODfjJeuPXoT6eEuLf6hzscI
	H8vkNhXJiHnQ2CUu3MMwpPVG9TWmpOt5/6gYTzX8yn8AD6/hBofl9sG0dg6KDhh/8sSbxSx0noL
	Auz0+qZABfjUJQeB+AzjcB3/fCfV+1XzTuYbSPiBTAJI6N1KY2eKVpnn30gNHAVtVGYG3nKsipe
	de9wTSqS0vA==
X-Google-Smtp-Source: AGHT+IETuY2veNgQQqSIB3Ky6YQwB5mMQ2rh+RHx+Fzcqage9RO7z8pdqYCPHjlEHVhLI1hObHSabA==
X-Received: by 2002:a05:600c:4f14:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-4533d05d802mr129289755e9.0.1750165201251;
        Tue, 17 Jun 2025 06:00:01 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e259108sm173519385e9.32.2025.06.17.06.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:00 -0700 (PDT)
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
Subject: Re: [PATCH v5 08/15] docs: netlink: index.rst: add a netlink index
 file
In-Reply-To: <4d8a16864767c1eb660cb905dbc935a3d0df8d9a.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 11:43:03 +0100
Message-ID: <m2o6umk5s8.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<4d8a16864767c1eb660cb905dbc935a3d0df8d9a.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of generating the index file, use glob to automatically
> include all data from yaml.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
