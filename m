Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DF52C030D;
	Tue, 17 Jun 2025 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154021; cv=none; b=s8iAoev5z1Ae1FQ2SB2zxuQ5i+SKEEdsfPnH4ED2cWqZUQmZ3ElyiYkmrf5fBPmgiMcmZBPZ5UxyKMbN317CabJpPTBM1v77le3bumUEdcNlMvZMXUr3Du1xcxQ6OTCWI6GIG7gOpo7aQNsH/3Qe7I6jnn2+JFkgnZYWXfLhC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154021; c=relaxed/simple;
	bh=WL6I7/r6sNbE9eFLNAU4GntpNQQRjynO7bqQU6HoHyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYa51/ZEoHPTSyuuk4PHYm0kOUPVjWNmWiCOtA/IyoARo1oaOW/jgfFs6+2pGvNi/mACp3FzYRlP/WUedJR7hKNWj4V+KNJ+Lu4AFyYdPgMlYFMvtO2f2MFFjDRO//1dGFvOApsONyltc6UcvLPtfi16tSWfRIQhBc4g1i8Au9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso10157404a12.1;
        Tue, 17 Jun 2025 02:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154018; x=1750758818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+K8ncmCqlfnbPRcbjEYAOBr5Th8ous3tA4EXtfwmck=;
        b=vTp3ioMfhjv2zK7F3D0O9Qyd4x8UoKIItLF/pmF6nNvgww4QNR9lyiIHnm/far9sc3
         GIXIzvwFKGGkdK7vSJC+y4unsCmJOeypGorvgNX5uP/HjCZLEHFVIHEMEp3orwMOjbmq
         kZaLXPGzKbK6m8/P4zizSPNtfO7RrGRBkUJ/1v/4lr47ywS31d7fKhQpiKn2dJKfZbiu
         pozEAli47EWd5mnpdvVCJN5FLFdgrZjehvWh/GGjsMG2kHV5n4et1AsHd8knDVoLaJ3f
         IC6LNuhjDQemCiiqpicHTp9JjG1R7OCQ8C74p7eA0yfre/nicEKZGrg5aBoG0yoPv8He
         Yn4g==
X-Forwarded-Encrypted: i=1; AJvYcCVTX45MfIv1pa6j2cS6ieoF2cs4hMx/IoLkK23J5dLFSrQgKeFZpE6/DkuXGbyYHqssHvYH0SoS4PjFIVxuu+lM4t68PA==@lists.linux.dev, AJvYcCXJVAXzLqvEOsrziaL+A8oic6yqyNPNtTb6BKDBrmokSGa4WjLCIU4w5Xd3G5V4dvqWaF2H8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjbyTRJPW+XFuZcyXoL67yvfcFOl9wOyq9Il7x3tuU0vjC2Yl/
	HvpQ/GfjvfcRQhCbhLkAntWBky43KdrYTTCc6Y5d6l+oS+Q5uMwBXnk3
X-Gm-Gg: ASbGncsvekYfY3UwmhRjYE7BBY2wVeM9rMDKVZMXulPQyjDYMEUrFg6ikvCJ5BFTggD
	ZL0GsKq4dFzYC/sFdl9yj+xt7WHlQhi7JMTapFk1fg16/k1aM7U/0zV311gxpj3h0zU5FYr7Y4F
	DkYrFpiEPV1laoJPMS4g6xdWLHy/6CvyzbUlh8lAeumwoob1dUBQwG7Qlix5xf3/h6j3S4JjQAi
	KTd1JhC85+aXPzp3VtT+cTMB2MUId9fa4uH/QZoDsW3baoEEhLSChBwNvsolrEyj0RPVNoITeqP
	eW1tewftDGPefEr54DpmeGhQ/pr075or9/N0fxwul9D1Um7ARp38HA==
X-Google-Smtp-Source: AGHT+IHs1DZGdF2vTkLpE9hLEA1NqgxZRhxpTQtWLuCQj90mpyRn/L82SIn9CCi2NK5rH/zn1p5jYw==
X-Received: by 2002:a17:906:4fca:b0:ad8:9909:20ac with SMTP id a640c23a62f3a-adfad596675mr1145289666b.50.1750154017358;
        Tue, 17 Jun 2025 02:53:37 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:73::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf7cd4651esm713459166b.6.2025.06.17.02.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:53:37 -0700 (PDT)
Date: Tue, 17 Jun 2025 02:53:34 -0700
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
Subject: Re: [PATCH v5 02/15] docs: Makefile: disable check rules on make
 cleandocs
Message-ID: <aFE7Hj7+3zq1/CqT@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
 <e19b84bb513ab2e8ed0b465d9cf047a7daea2313.1750146719.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e19b84bb513ab2e8ed0b465d9cf047a7daea2313.1750146719.git.mchehab+huawei@kernel.org>

On Tue, Jun 17, 2025 at 10:01:59AM +0200, Mauro Carvalho Chehab wrote:
> It doesn't make sense to check for missing ABI and documents
> when cleaning the tree.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
