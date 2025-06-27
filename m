Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B52DA754;
	Fri, 27 Jun 2025 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022304; cv=none; b=vF/Zmiya30k7AYCcPeJJyVh6PpuqUQ/XTraww/0dZcN8SNDmt1av0pJQ0XWiclHfIhgnvxkZvO4nNvxo96jLSPiKslz5kLIoi/0xv/WJywux0jRMUi5z896cDXodt7JX72lUyOUaDG+N98E/7EdlNuJP/qWdemlOIo+emeRazgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022304; c=relaxed/simple;
	bh=4hfOjU+Xu/htgbnrO/6j06ZqG2i0jYGSE9EvifTKQ48=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=n/Dg1zWkkVA5Xd6j5LDOlCTZ3kypYGoYV+93xESzpXfRzvzPw5A75cswQzzPFBESKM0QACIYSC1jtrCUMj1htQ8uVqDBDFSuvlnuy/+G+0opCxfS1hEu7tKLkz1v1RBigyvSDiPV1TWLFFeoaKaOmdPHS5KaCPRKfXud24VrWkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naoNNtHq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naoNNtHq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4531e146a24so10683425e9.0;
        Fri, 27 Jun 2025 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022301; x=1751627101; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hfOjU+Xu/htgbnrO/6j06ZqG2i0jYGSE9EvifTKQ48=;
        b=naoNNtHqjHtSPF1r8yAHSuE2tYIDEdHXV9Wt+m+xn+CwjAmAzK0WMD2VaXBezWTXE7
         I2PSdHS5gA+rSIajfOjLnDmvMNWJVXW7h0ZuExtMM4HL6L8QQ7xwOWodIgWF4sE9DiOL
         L4V7eCshhf6gwMBu1SvsunAxDGvsffVKzWL4rUvOrdyRRT1jGBThwJOf8maAGlgW3foz
         iIiSQTHQkAJG5qPXCS2YvSO9bQ95JlnOS2Kf+XeLVhPQI+lujZqPUdNmu4RLPycrYL54
         VjPWVOu45xakPnTl4MgXc/qWaot1B98cmWwZHRUSTwB5jmKVxLh0UsMB5Dyb5cMTDaMv
         cgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022301; x=1751627101;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hfOjU+Xu/htgbnrO/6j06ZqG2i0jYGSE9EvifTKQ48=;
        b=wPbVekFXRt/PwN4hAFwgutAigRr5REV7p+V/Mu+Cm3mLj16LAssWhq2L1NpnHd2Ny3
         8XLTrab9uhTzyi6IvxXzd6+jO+nb2aZAwUFGRyY6lo/X9dRWdu0eO1WphJV2nBiv4c3L
         8AiHCkzqsmKPEXPpJO6y9KcxQwzb39z7+sToq8PuYSowNfZ9hoDoJHzVA9e1MVSzi6th
         ghFVNAf8+tGXklkLD+G8wiAmfLVycoMoBAm9wbfSTyXhKc4bbnDIlJesmIzp6Pkcgm9G
         SrYYQziVkCvFMHOZB+8PxCpbmjJN40mAgaxY2AcHQ6AgIU3J1j4MD8+tO5YYd01hOprB
         DbGw==
X-Forwarded-Encrypted: i=1; AJvYcCUg05Xyl63Z154UCPnHVFdj4dp4yIPaN7l9nT8feXoX94DDYcWq+XwdNNcTbyYyH0vis2VY0ivYFWF9cinywe4WRVmiGw==@lists.linux.dev, AJvYcCXNFNjZUtmQUKQ6jIiBE01WdpKWFFjbNNeNlygFtE03zhzkc+ktkGvqRc5IeMlE9KbRaefeDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkrqXDA2bNWL2xz2+cg5QIGZWD8yZeKSYKkFG9mGwTdo494/HA
	uds+vPA+FwfXfXbzgm3JPS/gLjbbyyFuwPQpBR9+FoDIDIRgq0rdIAlv
X-Gm-Gg: ASbGncsw8SKS6HehutvVi5h2l7MigGgTxRkuKM278Ry9TXpm2u2xoq1YOGoNWi1a5vF
	29DLdBQc76wHBvHePivzGa2zJn8AyWYBIAfGhfFas/As8iN5QHMyFCvs4iY093QzMnMH4oryt3F
	vO2Tom0vwP/fnXua+pioApB3eLGXjMm1E2n5acssPa8A6YM6eKNegGE1L5Ue1Cbsn5WejS4ji8+
	8O3KkD2/NtxhI1IfxH3Cy4+SGY0jt49b1X5LzyT/kxQfcWhAJnlFCqsQ8+6dwpfNTJgtLmwJt72
	fCNM5JO9W6kM0prIb6qWCa8f0gpikX+T6Z1ePq6vrqNfCtyXH6U7FU998UiXLaDZ9SREXeph0g=
	=
X-Google-Smtp-Source: AGHT+IE73758IwYSE3gwQCVr5ocOcoostGM/uXpiZKDoUYwwlxSUMV3h6l1nDvdN1/+koG3pVg3tqA==
X-Received: by 2002:a05:600c:8712:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-4539341e446mr4257555e9.27.1751022300978;
        Fri, 27 Jun 2025 04:05:00 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:40b8:18e0:8ac6:da0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c4acsm75833275e9.1.2025.06.27.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:05:00 -0700 (PDT)
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
Subject: Re: [PATCH v8 08/13] tools: ynl_gen_rst.py: drop support for
 generating index files
In-Reply-To: <95d1ed00026acbe425f036f860f7bcd1a18ce98b.1750925410.git.mchehab+huawei@kernel.org>
Date: Fri, 27 Jun 2025 11:49:28 +0100
Message-ID: <m2jz4x8nnr.fsf@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
	<95d1ed00026acbe425f036f860f7bcd1a18ce98b.1750925410.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As we're now using an index file with a glob, there's no need
> to generate index files anymore.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
