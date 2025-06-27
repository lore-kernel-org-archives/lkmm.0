Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B732D979F;
	Fri, 27 Jun 2025 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022303; cv=none; b=s99R9TvGeREn4Xk6Mp6hFU4vXDWTSPlZWG6kkPHQrk2hFbIr3NtZj+GvOsC9sVNxnZ/v1PC8vJjB6/nm0bgk14YrhI4W4Kt7fLX5vzpEdvmKhYwhptWy/X5XDIx/lDwDhmIat2F17AEQ5xdxOt9qY1XU8jAkcPXb4Wk/GJzFlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022303; c=relaxed/simple;
	bh=IzhzSlg+a6MNT6mp9a166nnlPRXDawCSwrvw2zas3ys=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=Gu7STOiseRwmK8PlrbhMz6k3vQsxbXokc79YxLIq0rt712mmChixaZRMTCw8rvhYgxBgiSNoOEQft12QJDdU18GS9RJH9rWUKNIgJWQg6fEwPWaFKGfH2r3Es/vV5pcwTmKihbiuqWX7x0OtnT/nbRpSsMHRaqy9saVR5NlJeMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4wkQSjt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4wkQSjt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45363645a8eso14334115e9.1;
        Fri, 27 Jun 2025 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022299; x=1751627099; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ArfsTLmwxi9yd3k6+gxg662TPkYeEIsTSNfN2sfzizY=;
        b=V4wkQSjt5XeDy9I1dqLiDzSmHyUfe1QEDlWH/GgX56QzENmlPO/t9wgUyBjcKQWNcO
         TO+7vuA3DSgX9s4LIEe9+RX1c4ijusiD9C1MxCp6H1Pi5SvHWKXdqKiTt5WMfwQB3HLN
         CJeRcBX3yyvK8Yz5RWaUS3oahO/+SgiBGO0GUDFVUf5vJ3enPHXETGqzRWRF7DVm0df2
         9wc9LNzIG3BhaGzsN7TVfH8oST/6qrvwHGFVMqXyx2gReht+PhqBuM3yqT5ns7GcH/O6
         PTEci7/oFY9qZUxwr68KGAbfQ4xb7ridp5uukWjTNX/63t9XWkJNlYV0zOfVm+MSo1eR
         LORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022299; x=1751627099;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArfsTLmwxi9yd3k6+gxg662TPkYeEIsTSNfN2sfzizY=;
        b=blKTzXkC9BYXND6jEeenJbNEHOuiPVltCUrXj/Oj7OggZZGZf1BODu9RqJvi/GKUXv
         uTOaqVjod3Vh+VtliBaGqJEq19FTN1TatTVrtQH0Qh/H4zLNC0fLCDZqCPp0wegVofwG
         9Unks18k0NUc/R8h4koPTzvEXz+6FtYAACaLfDJ650pjwtVu+b+ofX1SLt38KjqEcE6n
         o10DQwmPJ1ADWQKP2vaRQYVUaQZYUhvxN5GlzqYqRIr1U8qgN0w+1XStNIDxKrJhKgnW
         25nIAWHZyCMqBewd3qt7jV8LK/gxx5R9YboeUlDkUyLa6fwQFMpXtokCMluhXvvalNFF
         QNRA==
X-Forwarded-Encrypted: i=1; AJvYcCVRh7FzSbNZBLm/c1fT4dgd3qMjcSVeRgegvtB/3dWE5r9pTY3g67Ijy9xU6A/c1Hmll2zWvg==@lists.linux.dev, AJvYcCX8Lz+xHtcOjeMZ+IkcZZTDkozWw1290Btf22jF5nza5b2bEzJWEJmqgC1lhMUxOTd9BZH78QR9mY1B0zOYvjmpdTff0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbs5Z52ugL8Zk5b0VR5ULK+wjcIDk+HKX6VvDjMHR45xQO7frA
	pBmboMGPViNg+pAlX9mCO7s2SOwb9pzLu9ulzPKp5EMJ3bqyJGP+LF/m
X-Gm-Gg: ASbGncsrvZzjvEiKd4wKOZZGFP6CoU7Rlq0PJ+rtnCtLV/rf6sVA/Ae7ZXyqSGRRbIy
	KmczzI7wDBFkabgu6HoPTOB2/j2zuL52FdUZ6pbrYCkTg+jgOQjGpOv3zw5dbrh5LLiCo3FKpvw
	xsTlnO/S7pFEhS8OyOZekEBv8XAXmc6CBsawJBbXsYmrfJqpgQPvJ4DIk/bzHnVE7aexCYDl76p
	3sztlbNiJDVxqDWTPDzw9qK+dgllBfthBEA6LdVLQuTCFx9zvcsJeEM79lWAsUiJ4D9Q3CaEXmG
	Jq4chxgO882+AyRsmwA+AixPUsk0XzwabPBBffXXM8sbmXb+J1VjCZ032eJzxyavL2X5+XcXmw=
	=
X-Google-Smtp-Source: AGHT+IEpM1ETIrENyCAnUIBLSlkPLHo3rmCFmpZ0/Rq7Eqh8Z5kuTci5QCowTov1lw+939ExHok2Bw==
X-Received: by 2002:a05:600c:8118:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-4538ee62b0dmr27939015e9.29.1751022299269;
        Fri, 27 Jun 2025 04:04:59 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm81053325e9.40.2025.06.27.04.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:04:58 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Ruben Wauters" <rubenru09@aol.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  joel@joelfernandes.org,
  linux-kernel-mentees@lists.linux.dev,  linux-kernel@vger.kernel.org,
  lkmm@lists.linux.dev,  netdev@vger.kernel.org,  peterz@infradead.org,
  stern@rowland.harvard.edu
Subject: Re: [PATCH v8 04/13] tools: ynl_gen_rst.py: cleanup coding style
In-Reply-To: <398c4d179f07bc0558c8f6ce196e3620bf2efdaf.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:41:38 +0100
Message-ID: <m2o6u98o0t.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<398c4d179f07bc0558c8f6ce196e3620bf2efdaf.1750925410.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

>      @staticmethod
>      def rst_ref(namespace: str, prefix: str, name: str) -> str:
>          """Add a hyperlink to the document"""
> @@ -119,10 +100,9 @@ class RstFormatters:
>                      'nested-attributes': 'attribute-set',
>                      'struct': 'definition'}
>          if prefix in mappings:
> -            prefix = mappings[prefix]
> +            prefix = mappings.get(prefix, "")

This gives me a sad face because fixing the erroneous pylint warning
makes the code look worse. I'd prefer to either suppress the warning
or to change this:

        if prefix in mappings:
            prefix = mappings[prefix]

to this:

        prefix = mappings.get(prefix, prefix)

But IMHO the intent of the original is clearer.
