Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB02DF3EA;
	Tue, 17 Jun 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165201; cv=none; b=A8y22tb2isyBne5b9H7BVzhGCr4xKQRa0/B4m26re1IgW3W7fER29kOUXlULT8fm1klLjfokVxMKPkrWTP96d2J1Qmf2gSrBt5Wa/g4EQNzi7xvhZ0b2P9WTpn1giM3nsk9EhhKqsEwybBon1yCWmMsECY7SoGD4+H20VyEpB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165201; c=relaxed/simple;
	bh=zWvxu2gtRwziN0D1uM8YBntQ/sMq9MebxFHK1gkA/iE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=PGYjwyQnWR+T/twZHd5+Zq49VNbmrpbULR4Zls2rMMs5wwcGm0lQmLPo2zbV+10B7noE6ee06pHkgh3t5pf4w9gm9USQwD4VNlOfj1t3TFD8pU6vOBD6bZTmHcwhmB3JksV1zbqJvVVTi35JbzWBHIryFleA9o4xstvnPiEWeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqVI2R0+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqVI2R0+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45348bff79fso29309325e9.2;
        Tue, 17 Jun 2025 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165198; x=1750769998; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWvxu2gtRwziN0D1uM8YBntQ/sMq9MebxFHK1gkA/iE=;
        b=EqVI2R0+yYa7J64ZS4PhDKtHA2Z9K37/WTVS4RgfiZ8ZQn+161EWtQChDfxsGY2ywx
         LDPoIQuKmWt6g+kG792doNJQe23MvxHyIC/f9nD3L4yC5ABDIHlyAuZDa0U44c51IUqd
         mQfyTYdqu9jv+sVLIPiEn3PtR1mqnue+tbbNqD3kz3T0737xM14iCDJ7irJd8xEK7hB3
         aZfYeI+vBtlSm0Y7k8I6jmo6Uz3wYn7NnSEPjwC5h7wpQi8CnroJffG9VtISvkGvDZmn
         uqRUxgX0dQaobjDceHXdAp/NaggChSH+HDam20/6XKa+/s531lfqY0ls4l38RWmWOTNn
         7Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165198; x=1750769998;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWvxu2gtRwziN0D1uM8YBntQ/sMq9MebxFHK1gkA/iE=;
        b=lqOQ/L/rABqF91vsnKIT1kklLlE8ERw5AJIKPlyxM5DWyBcZldWQzy+0xBRcZj3eTX
         JDOFqXpdeE8KybYhRsRcJvvcCk9vO4Ec3zmk4ImVO0KXF0XFFYEK3FzjksmksOhMIvIs
         /r+a+D10ROpOXzv/syP/l3QstAEhpBBCVxvVRcSqpT6X0XZvYekgbYikCJ9HsiHK9Y1d
         JFMuYQ5fxcUNLziFVua+uIo1C4Iw8OxvlEQipgxQttRyJU9CtUyPdqdT72SjoVC4/8pg
         2a5mkklHx3CQo8ZQY/PeNEdJ0+BOj/HJM0YO0RfFyoNfyN2M3vuMKV9TLh/+fXlXPTu7
         6BTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLZxjYyi4XqnWtV6j7RihTak4TG380ebL0a1/Bf5z9iPF9LKgmiP5GdMZpUbm2TaFHfaRcbZA+2rWq8ESTSCO0zi4wjQ==@lists.linux.dev, AJvYcCVTTcQNUHzBYo7hnjmhut36rHvLrMDKDZXC17CBqqaMyOjP55i763OnFtmw4rRcn8Gw8nyjLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoKLFmG1DRlhHJr9+l0uT0PVManHeQDK0W1pWBVchuxDYn7xin
	xYtg88ez2Zocuq+wNH3H7hOv3oYCha3cXTRigrEjU3HASpgJgb7Au09B
X-Gm-Gg: ASbGncvkG64zxXbydoPDhY/f+1f6pEQ9l0n8jxQjfNOT7emy8yhWvJ0i+elm3W6/lHB
	y7dSQD3In5Kf/CkUdvVU1N4kPnCklI3p5QF5W7zfWF/sC3Ue2T2Q05wf9DnhQ/Dnq46/V4syIbh
	0q9FGZoi78GmoKccn85agjUd58D3YTJGqQCfA21ZgXyi9jO3FDTJJNo9/fiqpv+55O3qGLLk69C
	VqmG3s3/f6KoCvvNdd4kDGpv9NOhGLwW7Lrh3lUH0IlsjZ8ZEpyZBQNxXY5RwVY0fnqn0QP/1Tf
	OFofi5vHvMZVAVojcReCUhszWi9QoTe7oEHmg+x6jqRh3DWlsH16TIbp0MyFxEVmx6wRnOk7a8/
	YCpm+UAVFZQ==
X-Google-Smtp-Source: AGHT+IE8AiYw8pPM0MPp2QbRXFeBYuO8zVpjLKhqgwA0D8FzZ7tZ/oOZfwEVscmLCWsCmLOOVvfUlQ==
X-Received: by 2002:a05:6000:200d:b0:3a3:5ae4:6e81 with SMTP id ffacd0b85a97d-3a57238b515mr10306104f8f.8.1750165197492;
        Tue, 17 Jun 2025 05:59:57 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm13723974f8f.81.2025.06.17.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:59:57 -0700 (PDT)
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
Subject: Re: [PATCH v5 02/15] docs: Makefile: disable check rules on make
 cleandocs
In-Reply-To: <e19b84bb513ab2e8ed0b465d9cf047a7daea2313.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 11:38:26 +0100
Message-ID: <m2wm9ak5zx.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<e19b84bb513ab2e8ed0b465d9cf047a7daea2313.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> It doesn't make sense to check for missing ABI and documents
> when cleaning the tree.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
