Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC172ECE81;
	Tue, 17 Jun 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165217; cv=none; b=Mhez88x0wmpWlo8PKxknggyXs4BpKJ5RQ1O6dHrzHsIKdEoPuRk+390tkXx9jCWIiVcY+/OhykxVuJVkC1DhmEN63PKkzo8PQ4dvH7FT2nxyS9+HPopYf8X7kHknk5vkt9K6oFKvkzz7gqnkrnrjPjyq+B8hKrkgspoEMY2ZatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165217; c=relaxed/simple;
	bh=pY/Rn21IGkkLCho6oeyaQyXDQlKMPUPwymU60FIcdug=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=H0dNGValnmK2HU7rLGMmCJBXtdnfkS/tdo/mPQ93TFiJdVLnh+OLNmlfMRmm9b6L//vYzYew585Gm1hNPDCP0j/ng0WeWDQ1hMfoYQPKaVr2c5OCeag8GfAgRFF2CJiKiA7tCuS1Tbu6HaK7zQGotlZGVgRnWWsrHyePBa5B+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrPN1gHp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrPN1gHp"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36748920cso6678977f8f.2;
        Tue, 17 Jun 2025 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165213; x=1750770013; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pY/Rn21IGkkLCho6oeyaQyXDQlKMPUPwymU60FIcdug=;
        b=UrPN1gHp46fAHmREtGn8aEQmJylLdd5r/CUr1KouZ+YitAlYNmdUL9W68W+SAttNYl
         IR18TkijHL3qEV78exEJrwn8SbOyAz+DYaPZThMqqpX0zX7CAPCpeA72aA6VsPmz4Dl/
         QyS7reSZ9opRL2owKaQt0b9wopdqfQqnMTjKAtf+hGOfgubc1xhc3w/AjYOvKS4QfuPh
         UlGzIIXYHMzjs2ENfoFN3hUketqW9nd0ttZRvZ+6YGUXyHxrSB2Niya8WqSEsfuI7MjN
         gc99VNu1s4rKMbXdSVVBYJFltKQiRADNG9p1POZz4xeLZiJmPz6ZOK5m1P+/5fgAgU3t
         MYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165213; x=1750770013;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY/Rn21IGkkLCho6oeyaQyXDQlKMPUPwymU60FIcdug=;
        b=TT+xKdTEk49pNcBHrigw+00kQpmEtV2UOhzb9giu8GHKl7EXQXsufwwBfmqayW2oAH
         a3kPqHhWIK6S5PMs5OJXau6FWbjtMY6pshYQEQrA4jnN6qbN1Qy4hneY0xLuoNxrHrg8
         WoCvnj8PO2RbyOx6Ps/ZrmAqH3rLQ4CQ1wxqsGKBROXVAG3f1mE09Hoig1Tm8+0YJbjR
         0Uo5Qz93CxLo7KkibVVff95YCk0l777/gZOU6XaxmzjD2TN2RDbWoHXwqKLSf9RmHMSB
         8ypQ7vyxO5JJnfd8vw5fjl1GypkGAMdtripeHAwgbAYZri7WOMN3jqblKzKVkkOzYYNL
         X5lw==
X-Forwarded-Encrypted: i=1; AJvYcCUnK+MTxEAL9PnLCrDXKOJ3bpAc9DUh5wz1qmWfJlqobPabnlPYktDTDngzaCBUDwY0R/+0zQ==@lists.linux.dev, AJvYcCXFDxKxRH9gsCFsmT/KYr6Iy6WLmz+YeRDMk690vzWfGtZpJPU9Kxe0xqf5xM5wZSdRFiAJjaqOdlshV+EOJz0jhN9Cug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFJUdW5VR9IqdIRazXSy0XxtQqyX00TjZstoHxFpEzkIr4sRKD
	lswzoio0OH2HJyyMehD3Ln5gJmB3zMkiHR/eFiwJwQKS1tnjmYdXs8JD
X-Gm-Gg: ASbGncsV/TRLo4m69RmYuT04ls9OgelwXAQh0vi5khQWX15L0Jtzzzeb7o92Ufdb2Tl
	nCG6EyN2JOVhpWLSvo9Nlrd9Wi9UENXOgKBwEJvCnWR5LTzlbaYYi8tGt8hfGpDiWZUfEJLB7QD
	L86QTsCWZm4fJv1RW2IW7J9vryKrKJJA7KQbF33H7Aq88G4EHgV+PXTZxZMQ3wht3OXdfNZKf6r
	gE3Lt0oaJ9tEkQZ3Loy3r1GEINMnmj2ChZ/p8LuxRwWywcvuT5NJKwsGW51dbiApXurshMfcCz/
	TCdPApKOeTnWr7R9xRAqrcW4O7USBibKpgpHsBf/NXjqe7qtPHOrHzwEkvNMytLv/8UxAOMUTso
	=
X-Google-Smtp-Source: AGHT+IEq1lPlDoDfyXuJE4pI16oJ7f1H1YE55AHQrvWa6rEEYagyr3SEracSN4OqrLLHRXfD5li3ZA==
X-Received: by 2002:a05:6000:4387:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a572374adbmr10870066f8f.20.1750165213141;
        Tue, 17 Jun 2025 06:00:13 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm13724617f8f.81.2025.06.17.06.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:12 -0700 (PDT)
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
Subject: Re: [PATCH v5 11/15] docs: use parser_yaml extension to handle
 Netlink specs
In-Reply-To: <f4eecf1c638c0d98369dd16818d5b175e208d138.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 13:45:27 +0100
Message-ID: <m2y0tqiljs.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<f4eecf1c638c0d98369dd16818d5b175e208d138.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of manually calling ynl_gen_rst.py, use a Sphinx extension.
> This way, no .rst files would be written to the Kernel source
> directories.
>
> We are using here a toctree with :glob: property. This way, there
> is no need to touch the netlink/specs/index.rst file every time
> a new Netlink spec is added/renamed/removed.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
