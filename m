Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB72E610C;
	Wed, 11 Jun 2025 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641847; cv=none; b=nU1PIcWpMnM6oSeQfAVYRm6N5sqRVzDanXFwuzddnfQU16V2SZVlufxuAMYOcViujywX7Cc91eIN7aPlItS1XWjKM2zxKxEpsYXOiAepv4pmipXSiakePDN/B8vMI7sWFPVujJcpNbS0pHZDb8RAxLZFF0Gi/9c9rL2WJv1jyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641847; c=relaxed/simple;
	bh=t70ZVM9B9jXNQcg1tWA3G669RPWCqOTJ7o+RRmiouFQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=sxMbS9pIOigfEUu5ZIoRlBQJN+ZqkMvSSOUS5KGMt1ovf/HAc+MDaVpCRtfuIzJaAcPVj++X6oVEpdy3oZQWWnEidvSz91eIrnoFsSDZWYOGgPJJRfNtk9D502AId6mNKBI06AnvFBOvl+ZrzmfH05IhI1726mMhGOvv3s/vJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/2E/bfm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/2E/bfm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso61153755e9.2;
        Wed, 11 Jun 2025 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641844; x=1750246644; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qR6faLEKEsL2HBhlXQ2T+G160lb/jVjJORZfNDkjTgo=;
        b=S/2E/bfmd3mXUl3OzVYWWsMbraueualltmdERLTy4mNewcqqYAxtscSALdsRCc12sF
         igovagWfys/crEfWTcQhm5UiHuVFisbQGkaC7RWKSfixyClqYF7xZ3ocfxkvdvFtt9r8
         GoK2+N8yzMamZI7nDIbD8II2hiUhloIrnLOYuSWhpkcjJWJOCeQmNrmpPXc2gJGEfBJ7
         HzdR3oEUa6dW10rz6yJG2KvPdLNB3UyiOjGe7y8YBY14po7Xbqaz3yYbIW33NOj8k7bb
         gcQ2OVtL5eQOxdX57/8iQNGHN9gA2vJn0Iw796XwTkkaNqv73cYBwyKkwuBKc/cBIX/i
         p4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641844; x=1750246644;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR6faLEKEsL2HBhlXQ2T+G160lb/jVjJORZfNDkjTgo=;
        b=Bbccjyyc/Xa0Tsw4pG5lAFQpttVY+fKHwdXULOiuoxrgbP32P2EVTosYtSWUOpJ+M2
         UykNZF+ua3ScHssajWfFIvyHHyPFM3wxdJprEVPTThTnZxiQOIqyG/XT5Wnu8GifZTWY
         bcRp52Ib7BukCBVJUcpRzmj7D6419Umjs31uU9WDAbnlp7jR/m4kFmI55MvlRwzznHOr
         mKvWRHMNqmVQgc6ZD53Ydo8wMfEMVf4Oh9j/t+GFQ6FqJZBvjpl1mhNdLu+byckYO/cN
         X37XwuSCGZWXI+y8nwd/S2xgyNbWg3mMXQlUygFjEkb/LQPaGQAF2way8T9W9e9n/Mt3
         TTEg==
X-Forwarded-Encrypted: i=1; AJvYcCVr00MqE4WJb0+aAPgx60YzghMZqBCF8Rq/SqYwknSKJqrA85+cwOxgrxLCjh0fo2c0Ab5VBbjP+dcmmS+fAeISUsS2hQ==@lists.linux.dev, AJvYcCWuH5yWUdDQwVk/se9S5LnTRpgilqegN8UOtSOYb47b58xlC4xrVoirE92jmCWM2QKxQA1U4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwonhxiOdd71tCd+3qAiyaqxDsifI/S6heKiKfXoeh6iPNmuWxy
	7AY5fVhTugUipVD4FBpsPLVFBEWA0wGNkmcxNDWWCTKEd+8II5oNyqbg
X-Gm-Gg: ASbGncsZyUA1mXEdFxjGJvRORCMHIgM+uX50LvdGVIUGKd6poZtTQSmjmzUnQA9CnTf
	6/GMNl6KaTTM8lwE2Vk56OQxAJjVpHKZ3YHa2alquH6oYlZBQZ8cDEezfxujMgyPlMnx9mq7ug3
	ewGeck62DVl3GeUbS/TzCtYzw4CQmzCOemI3CcV3/ktncBH2Q2g6IMnYQu6PXZPDS/TuGI/HI2c
	WEAvitbNnEVxzYdZcRNt/X7JkLPM4I3VuBIkwbVAWtckmiRFkNkFxv6TYpbRfFQaaBCSyjNWkJe
	WzcwJhG6mihPMLpzGI5y4O9uICrri4bseNBzcZ4XKI+cVUfQWs6R1RFK+HQO+uWiKsnyVwGA868
	=
X-Google-Smtp-Source: AGHT+IHUSDusP78EOPiscyfG6WpAmC3o9BMOaRGloOtLN/xk/Tr/sY0jXpO68pJur2TvBqN/0kmB+g==
X-Received: by 2002:a05:600c:4687:b0:453:aca:4d05 with SMTP id 5b1f17b1804b1-4532a2e8b84mr462665e9.31.1749641844216;
        Wed, 11 Jun 2025 04:37:24 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:acc4:f1bd:6203:c85f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532513e758sm18852815e9.5.2025.06.11.04.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:37:23 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  "Jonathan Corbet"
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Ignacio
 Encinas Rubio" <ignacio@iencinas.com>,  "Marco Elver" <elver@google.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  Eric Dumazet
 <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH 3/4] docs: netlink: don't ignore generated rst files
In-Reply-To: <1cf12ab4c027cf27decf70a40aafdd0e2f669299.1749551140.git.mchehab+huawei@kernel.org>
Date: Wed, 11 Jun 2025 11:44:09 +0100
Message-ID: <m2a56epngm.fsf@gmail.com>
References: <cover.1749551140.git.mchehab+huawei@kernel.org>
	<1cf12ab4c027cf27decf70a40aafdd0e2f669299.1749551140.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Currently, the build system generates ReST files inside the
> source directory. This is not a good idea, specially when
> we have renames, as make clean won't get rid of them.

You're right that it's not a great idea, but it's the least bad option
with sphinx because it only supports 1 source dir. It doesn't have the
concept of a generated-sources dir and the alternative is to pollute the
output dir. See e.g. https://docs.kernel.org/media.h.rst

> As the first step to address the issue, stop ignoring those
> files. This way, we can see exactly what has been produced
> at build time inside $(srctree):
>
>         Documentation/networking/netlink_spec/conntrack.rst
>         Documentation/networking/netlink_spec/devlink.rst
>         Documentation/networking/netlink_spec/dpll.rst
>         Documentation/networking/netlink_spec/ethtool.rst
>         Documentation/networking/netlink_spec/fou.rst
>         Documentation/networking/netlink_spec/handshake.rst
>         Documentation/networking/netlink_spec/index.rst
>         Documentation/networking/netlink_spec/lockd.rst
>         Documentation/networking/netlink_spec/mptcp_pm.rst
>         Documentation/networking/netlink_spec/net_shaper.rst
>         Documentation/networking/netlink_spec/netdev.rst
>         Documentation/networking/netlink_spec/nfsd.rst
>         Documentation/networking/netlink_spec/nftables.rst
>         Documentation/networking/netlink_spec/nl80211.rst
>         Documentation/networking/netlink_spec/nlctrl.rst
>         Documentation/networking/netlink_spec/ovs_datapath.rst
>         Documentation/networking/netlink_spec/ovs_flow.rst
>         Documentation/networking/netlink_spec/ovs_vport.rst
>         Documentation/networking/netlink_spec/rt_addr.rst
>         Documentation/networking/netlink_spec/rt_link.rst
>         Documentation/networking/netlink_spec/rt_neigh.rst
>         Documentation/networking/netlink_spec/rt_route.rst
>         Documentation/networking/netlink_spec/rt_rule.rst
>         Documentation/networking/netlink_spec/tc.rst
>         Documentation/networking/netlink_spec/tcp_metrics.rst
>         Documentation/networking/netlink_spec/team.rst
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/networking/netlink_spec/.gitignore | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 Documentation/networking/netlink_spec/.gitignore
>
> diff --git a/Documentation/networking/netlink_spec/.gitignore b/Documentation/networking/netlink_spec/.gitignore
> deleted file mode 100644
> index 30d85567b592..000000000000
> --- a/Documentation/networking/netlink_spec/.gitignore
> +++ /dev/null
> @@ -1 +0,0 @@
> -*.rst
