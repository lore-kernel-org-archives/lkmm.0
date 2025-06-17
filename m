Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57EE2EB5C6;
	Tue, 17 Jun 2025 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165217; cv=none; b=BjBY+VATf1xs/prxuRg9RuQXQyxEgckt+thJwW3GdGIZF1S3cOyM3qyajBFqezgjfvm5n5JEZLnTn7zIEDm+nwtYN+nv/5vykQEPVdjEZXOda0vK1xJxUmzw//MFE9n9YOZOpg7zpbT0RwBrzXXq89Rj1XrkiIwGONtzSnDx8sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165217; c=relaxed/simple;
	bh=U+2BrFcs/WNvZ2BeNf0LFR/mmC+ALZlnCYcOkB3I+lo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=J0Vp21sgO9vgK8EIyOkdu+AxbrTJHy7XOq03B9KA70pLwzzuqId2e4qKrfHMroN6pwiH93aJFosNT3xBnj68eJ0iKfjjdVY/VsEISsQUvM7np/WDSOJm/SNIbNXdMZgbsrsds1piXmhsYC9rZ3yTnxBEpHeHLBcx9SqccPXSngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjJl4Pta; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjJl4Pta"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a51481a598so3328456f8f.3;
        Tue, 17 Jun 2025 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165211; x=1750770011; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+2BrFcs/WNvZ2BeNf0LFR/mmC+ALZlnCYcOkB3I+lo=;
        b=CjJl4Ptas4OvnFBZ1Kq+c+BA4t9u3W6VkLNDIu16RnTUiIiTg+p1J8Cyufp0A0x+Hx
         w0YYw99OkYu+rrgbuhXPe/oY6rdVD3C3j8kjgx8FvSwEVHCcFFKriF01MxsK3OYvOXb8
         L89wMHREewE6iiTWZKTYIOjlicy2U5cpAM2zxAfI8dPXqzYQNLlhWFYURk5fXzVvcd0V
         J01oqia0z5ktJrqISXn8IZuX9THPYe00Agsm/CyUnXcoXO5mDmDC/WSCUnLFMTDO8B3e
         XzRmf99YIMvpVb0zRB4+IwiWcImuVY5IQvvPKD8s8y28sYMfJj0YNjYO+fuMhywVgc0i
         8W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165211; x=1750770011;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+2BrFcs/WNvZ2BeNf0LFR/mmC+ALZlnCYcOkB3I+lo=;
        b=OVRg2gY05oX4gaIRMqW+lrZnaHRy8DDaxuLj7kg7od33BJpg+SUGlcwla1MxlyirDr
         2Y9gcx+PSv7b8Lt0Cw0ZHTdHZc2JuCqJjXvMAVww1PZ1/TTIfH9rKysoO1bdQOELFPWp
         jyn6sIlDiXy3hCV02Zk268vSvNvQR2WgmZ3rvufr0UX9I4BXYwPCr5qh7UYlSof//VT2
         PciPqHSaB42SW7GcE7AKAehDX5ftZ+vWf/5zv3HwfcQmbo4a9gOOcl/65tCkekZ4veWF
         ufCQO9ZPbYqtYT03l7szUk8MbUFU+Q5MmgeJ4ZT5w68yQnRGe3B7ydj+hxew9p/sujOi
         YR1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8T9jS2aRmsyJEhPxY7ov0Hlp4qxEcA5+vbohb2cxrYp+Fn0Dgdd7qjet1XEEI67ejGLDZ2InYSeuzgd0/aMXYsuPpaA==@lists.linux.dev, AJvYcCXKwleED6kumjRbFke0ZXLWeKBhtQURLfRSRrlL81CwhLDXySyuigdPOGuiAHcexFM848GqAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfAEbZ8EpaEXdrBQzzKE5KECJP+TY1iaKmK3PJay0HymmHJL+H
	kG8aFALSW8GmkFFsE0Q64c58WYidOCBFRR5444P0ZunGOhvkw6OBLbSh
X-Gm-Gg: ASbGncuhbSZzZrNv4LTV4puGtRlmtxeIbcVlJxOvM+R+rjTISGoLCn0tkt3JttomH+T
	+qzIA63fe0pGZsq5s6LooqqDv/phLl1IrdauCzU5WzGfE0sEsarvb42UaZzd+/hWFCZQvqaQk4C
	1zuIo+Doj4IwNsrQNzvuq8Xx4y+KWubfiuDbMptT848f6mwCXTW1YYpeVsnDt4i2pXIkwoP9NpO
	1IqugXyA1ptx/PDEAMg8ixeeO0YC3Q7o4d8FD/J4BZETeXEJ6bctRTmhRpYwor17uiZwNCmu3ax
	qRm1XURNDvrPlqj9uqohLgdvRpmQ683GZ4H0nz//XwNcAffVt9J7jX1928lHbdadpGeDJUVHv0M
	=
X-Google-Smtp-Source: AGHT+IFAOftRNr9UArvb/ayDqecb5pQMF3c/jd+7G9PdWPODKXwcXgkgZu8aWMDVJ40l2sMdirRwTA==
X-Received: by 2002:a5d:5f84:0:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3a5723af1d2mr10004080f8f.39.1750165211307;
        Tue, 17 Jun 2025 06:00:11 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e09c21esm174344585e9.17.2025.06.17.06.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:10 -0700 (PDT)
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
Subject: Re: [PATCH v5 14/15] docs: netlink: remove obsolete .gitignore from
 unused directory
In-Reply-To: <073835aa035718b120971b7a53e0f270d146fe87.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 13:38:11 +0100
Message-ID: <m234byk0gc.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<073835aa035718b120971b7a53e0f270d146fe87.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> The previous code was generating source rst files
> under Documentation/networking/netlink_spec/. With the
> Sphinx YAML parser, this is now gone. So, stop ignoring
> *.rst files inside netlink specs directory.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
