Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8A23B623;
	Thu, 19 Jun 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335602; cv=none; b=h0d7CEKbej3zJ7uAUxwezP+cTnSsC/U2+CrX3IKDuldz/ElJEKgcd8DbUOTG85ZwwkvPg8q6En6I30eWdOJE8xsXlxYrMFt/+bL+aKBMUboPTQDmb0G5QNbknO42P59MK/F4pCcSkvFPCbxjKNEf99i/lOFYPzv2J0MYjO1+tJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335602; c=relaxed/simple;
	bh=mMpmDwlVnVcBmBvBNhvaIsBGhbhK9i0z1cU1YrEQtbg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=fSKySXRol0M6rB5XPv7PP/Plb2+qZKd0Z3mkGztEKnmYfG340inhZskosOpx6A/naP8zR2k3+WM7yhPO5ivcz52UR1OR6ltaxYNyMApZMrUVr4QkbUxrWMED8CYYavsneKf+1+8cwgxmnCAljJ+MP+zDbJs18kydpTVc0F1S210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRALlT6S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRALlT6S"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a54700a46eso444139f8f.1;
        Thu, 19 Jun 2025 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335599; x=1750940399; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMpmDwlVnVcBmBvBNhvaIsBGhbhK9i0z1cU1YrEQtbg=;
        b=gRALlT6SNbMdCsse8r9xqMuYKNDlHxbq8GiUdV/X4ARfQ2t164soq42OmDo3h0Dyv3
         kwB8q6pjxSO0emEnxLmhs5jyrhEFSSEiqmjRqGXXdfDGxKfCBUXH+Fs0Aug0X/kfufxd
         EYLP9LU1M4iqhra07sTD2a4rmh/tJofGVjGM46a2EwZ4i+8AKDyUgHvJ/TcVrziwZKzU
         iIRjbGYhco09aNPr/IjGSr9Pk7ub5891tdZGKKbk0elGw13m7eAXigqGmFNgaxwPuny3
         D1GcA9kY88EbSDtf/QGLsKpHlkTVpLfarxZiCQAyl4jdYdzS7vB8NLIlRrIpxnCzY/K5
         2MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335599; x=1750940399;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMpmDwlVnVcBmBvBNhvaIsBGhbhK9i0z1cU1YrEQtbg=;
        b=vpj+/hSSUshPo/OYF2RE27JqcLJmGeykuNPEHEt9ICKkQkQrutANiFJVXo7IGW8xOC
         41a5pvkNHQTAnniwBCw2/dI7xWZBTGaeSc8UZTjCyI0Y/xbnVf+tA9GVxvFEURDnV4/U
         u8L7YX83tXJnTml7sLAmmnyPoKTL2Q1ag8pAR/vyKhmADP2AjIqFmgRj1RJCof4VrbBi
         dGuvw9Wk1/+zavCRS05o7QCEOSsq1+BeJ43BXjMr7nVRCxzH1qqZ8pNuzIWjyo8r7yIv
         TKB6odpP+IlRJyxy+5rrt31DiHmgVwgFgyIyy6mAuyvAVOsjvyMjoXk3RJ2RYyffqXc/
         x6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ljMjiJbd7iJzRsWpJGXqiRybCczVTgUYJodZuixxLfOrs2D7bO20ZDzuRw5+Yf6nFJWXm5HNcpajqYLwPT58LcnVjQ==@lists.linux.dev, AJvYcCVhUZzwMAEOF2H/uyQhVYTBYo9DvOYeP6Z1o1Z8iH6wmGw4WzW8TM1ppAq34rVPXfIgob+r2w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6azXtTI25/X52yWKsP20+n40k9CiQ4HI95AR4OcvBAduUW64y
	pQlGAQGrSBDtG3SgXoKfaaZ2OX76c9dfu+zW/KoAbVdWEXvuINPxLPyF
X-Gm-Gg: ASbGnctE6CeLg/TXhHyUTYO/e/yTMInFHJdWou5QscLS9EVrZ8DC8P2l1s0ST2MAem6
	+Q7KLbTS0aqZGGKWliiow/JijgdBQY8mSZWFdkGUkVkEFuz5zntQYCdoIyUl558swcAoGCBRK8e
	dYzv4Onjwdy2mVE3EhKyZouvluFWhriSaR/euYG4RI9kJ+hcQsXwZn4XrCaii8APdVmUYvJ0vaq
	5cWhhF8E7hMQ2Y8UGoU6nF9YxFK0kWDh1H81ZKm4v0JqPRIZxj0yK5PVu1+p5dQT8/2UWXa3T3V
	VsEwXztVh7AJTeuYqycf0UlrWtiNC564otIKoe4VfH4o6z95ZYL7IoOC74dpIfwYdIw5DLP2
X-Google-Smtp-Source: AGHT+IEuKF+bQ5gYYFetxK0YaeITBhBK6iH+oKo+esDonRaTES/WRQtRuQDWIQVznNNZ71YFKx6LZA==
X-Received: by 2002:a05:6000:290a:b0:3a4:f520:8bfc with SMTP id ffacd0b85a97d-3a5723a3b03mr16583899f8f.36.1750335598730;
        Thu, 19 Jun 2025 05:19:58 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:ad83:585e:86eb:3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b5c372sm18955395f8f.89.2025.06.19.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:19:58 -0700 (PDT)
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
Subject: Re: [PATCH v7 03/17] docs: netlink: netlink-raw.rst: use :ref:
 instead of :doc:
In-Reply-To: <205e2b0baddabf47ab23ed08fbddd3fdc0cdcc58.1750315578.git.mchehab+huawei@kernel.org>
Date: Thu, 19 Jun 2025 09:57:40 +0100
Message-ID: <m2tt4cf6rf.fsf@gmail.com>
References: <cover.1750315578.git.mchehab+huawei@kernel.org>
	<205e2b0baddabf47ab23ed08fbddd3fdc0cdcc58.1750315578.git.mchehab+huawei@kernel.org>
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
> Having :doc: references with relative paths doesn't always work,
> as it may have troubles when O= is used. Also that's hard to
> maintain, and may break if we change the way rst files are
> generated from yaml. Better to use instead a reference for
> the netlink family.
>
> So, replace them by Sphinx cross-reference tag that are
> created by ynl_gen_rst.py.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
