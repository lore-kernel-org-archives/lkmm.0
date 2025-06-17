Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870302E92BD;
	Tue, 17 Jun 2025 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153865; cv=none; b=gtMdm8mSeU+XzTOAtvFTaQqNOdYmEvIwgMIkr11f2X5IIsR47z6wjb0nLmjeq+0hcw3iIiCtF2OnB3T4IX6b76V2uy0jwWEIMM24p3bwKIFDUiQpMLyjsBDVvPHS3rBvMZer0uWQrX+WpQXGf4yNREocMz+WwqK12lO5L5V2UiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153865; c=relaxed/simple;
	bh=3Az7+WRoRgQxE44r1MX8buhcWV382HDxqmNp/BUNf0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQ7RUorQVAc6DXa/eJeErjI8/FzY4+TyIZGuWOlP4AfMvbM2VVLEzHqzkW7cRfvCTd1roKtNo7Up3zWLbBKizQ2xCAzJ0PxenZCFj6m6hTMbpNVU/aleWMCZxo/nbAE4Xn1AyDnK3lzWhjjHVS/xVE1wgD9KLsJ3pXGc26CI5Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-addda47ebeaso1109180966b.1;
        Tue, 17 Jun 2025 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153862; x=1750758662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4ScTAQg3qsgStvKKi5EXq7XLcp8WRSVfKIRIlUrPdQ=;
        b=S6bCu89UUEiUk4qscb2blAxxo/G5wbUHIRY9HmOLZ84lBQSaQk/PBzAWYdZ8b7l9z+
         jfYgoIihRopYIjrZNk6MI08rFfl4BbDnyetu3KzLjCQTk240S4c9xxjzVOdc6dQRMQiZ
         pMlx12WV1Po/UJ5lo4AWSfhhtC06rqoEb3eEQMlkEzS6Nj4D2x4XxmA16pxtOPCGJt3z
         EAQlI2B8Ah9zVtUs29cAKsFmJkcVDhygcP2BJ5vmUsSKiHQFqvHFeFizY9/hkhfrQO0c
         Bypc/RZKeCPA7pi/Ujj73SJqElcWjobFt7nI3YPgbMlQvnwGpTyRTCKZjO3XM+/o3oru
         Xeyw==
X-Forwarded-Encrypted: i=1; AJvYcCU00AnhFY/Vy5C6dSOCQA7uXnfhf5n8evRFQwBgqWY9WYTUUQCT6scY74y3nhOP2Fo5a5yAcg==@lists.linux.dev, AJvYcCXRgXEUMIKWsMQJDZwAtFEhBY+HbAjUY7GwWNcOJkiyWzeSKI4vTc5SJYXphcy2gd0Ux3T+QUo2KrxlwltIsdjLbKX3cA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyBTVW5qbKBDAMXBb/dVjgMjukljwmk6kE6jKMt+pPF0ndGeYh
	mVZkFQyJRxcgVC6oZh554pi8maNDQboO1qeG9GcROCV+Qn0RRqr9Xv/Q
X-Gm-Gg: ASbGncv3pDFUimMdCYVGoGFWrLym76Z66v16oQW9NtzdovzvUY+9QwGltPlgG+DFv9y
	OmKSgNy7kadvieSnwDKxwFgSaRvaDVqgY/Wfd6iwUh87wfqPjGxJTAEs83bwMMguwRJM/+5wlIB
	3R7PS+iIoDOea97yYzB/jY7Lc6RdXEmQry0u36gMNSfgXrChOaX/m/Gx54mFvsgY2eZajrblw1R
	exbZ93NeqiYkJgwLqVdneHpLJgDEvcc2NIhkZqqEos6bgBIeI4Wrvh79DDC8vNHaJax04sG/Oxx
	w7TazBivwBi53s0QqqNZVueGg8mP3oAreYK+YdcjtcHEttspBg0M
X-Google-Smtp-Source: AGHT+IGDmj7MBHIcc9gl9KEt2qeSTfQRtaqJPc6RvWT2tm0MOH6JhNGUifr4uadxP3Qq2QRgezaOpg==
X-Received: by 2002:a17:907:7f89:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-adfad357b6bmr1243524266b.15.1750153861600;
        Tue, 17 Jun 2025 02:51:01 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe57dsm831256066b.73.2025.06.17.02.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:51:01 -0700 (PDT)
Date: Tue, 17 Jun 2025 02:50:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>,
	Jan Stancek <jstancek@redhat.com>, Marco Elver <elver@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>,
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v5 15/15] MAINTAINERS: add netlink_yml_parser.py to
 linux-doc
Message-ID: <aFE6gn6h2g4P81/P@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
 <0db3a4962bfba8eca4a7e0404331ce1398701f5d.1750146719.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db3a4962bfba8eca4a7e0404331ce1398701f5d.1750146719.git.mchehab+huawei@kernel.org>

On Tue, Jun 17, 2025 at 10:02:12AM +0200, Mauro Carvalho Chehab wrote:
> The documentation build depends on the parsing code
> at ynl_gen_rst.py. Ensure that changes to it will be c/c
> to linux-doc ML and maintainers by adding an entry for
> it. This way, if a change there would affect the build,
> or the minimal version required for Python, doc developers
> may know in advance.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
Reviewed-by: Breno Leitao <leitao@debian.org>
