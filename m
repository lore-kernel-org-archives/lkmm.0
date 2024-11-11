Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859713A250
	for <lkmm@lists.linux.dev>; Mon, 11 Nov 2024 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731362463; cv=none; b=MxgS2QnAKv9ST/FbRmPqseNin0V1oXoSSWubOGuv2JnaRgQOZj42toDAHbS2/QUzqjJLBAMM64hioi7sr3lhLHCi7G0LgG59+8ycrpMnncjBl+N+T68rinSq50EMCVO0iT0aMMHTD2lFxex/VL4hbujiof0LSaKslzayvvCqirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731362463; c=relaxed/simple;
	bh=o1ZuquSTxhS5616xdtKNJOYl87d15TuDgoYPTqWYoEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ab01TT+ZZDIqnQWEt/6sX6QCJiLmA+XvYBxytmxfcPldYAsvA26l+fnkP7fqtZnKcYnwHcNiAQUFfEG8acpi6mIi13j9iS20x+gERqLvcCulgNVvb7WB0cTnM85jxhx8/J2KMf/He/WDXn32giPii5IyKianqqzN7WUL2ZqM8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P3kOr2Cb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P3kOr2Cb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so691998366b.3
        for <lkmm@lists.linux.dev>; Mon, 11 Nov 2024 14:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1731362459; x=1731967259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nw7jmBqAAuw6PQ4Oic9brWgvBuX8kaVtKrs+xC4V9TI=;
        b=P3kOr2Cbd1JAMU7186MpphYOdHL+GygkT389ogI2M9ArFfe/VM5zXFOkHz/UPECnVf
         tdzLrY+ayQRtg2vVIToWs8iSw+zqz/R5MUHexgAYJ7GVHO8JSNgD1uPlhjEYdnOO4DFc
         72eVUfUgDITjxaH0VcORdbLhPi6a6uCzIsg50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731362459; x=1731967259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw7jmBqAAuw6PQ4Oic9brWgvBuX8kaVtKrs+xC4V9TI=;
        b=KLAT9muw5Ni2VMizanFtVHtN78UYG5fu78k++KYOvFFQf5SfC+Y8XEPvG3PrfnlyEW
         hAL/xSIreOGimGyQ49vsKJtEI1yHVO9yamJrS0vVihmjKQyk4qgEC6hzgE2TwQCmO3nm
         1LB4IWZsB6+uld9KzZf/4tlgCsJshXAWH7GWvFyw1qIdX4cuIYMnM3EKMnh7o/8g22Uc
         GyCd1AFWtxZ5MKTW2b2D//DWIEyu2EYAVG1wSzUn3Cr5gH2f7K2eYtHBLHbTItICQGuS
         Yhi7bP8HIznIgNeZ3WmkOnhza4Da6aW0Gl3kSibgBfNAWBODdVSqfmr53tiUi04r0DoH
         K/4g==
X-Forwarded-Encrypted: i=1; AJvYcCVgT4U0ISHDm17BG/1Bkwrrzz7HKIu3nAZwOXszyDW6ciP0l+oRoQJ6hhkGDu5MojU/5lSw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw19tY2U9j+kSm+/l6khlOMyT57QWi8RNgUsbav/3yWFeRZO7Zr
	gfi4MOuuzoYeRGvuV3mmeZ4ea+7xurYf9/pn0zx4TA5pegjpTH3A009GKAbvLu19LZyuW+CgE2L
	r4dg=
X-Google-Smtp-Source: AGHT+IE9oJ0N4sa9TFPRSK9zr99Z1atv7xKihKvFDCOpsd2TXydnlXB5vNBHA2bMhhi3JPSzogrBog==
X-Received: by 2002:a17:907:a4b:b0:a9a:dfa5:47d2 with SMTP id a640c23a62f3a-a9ef0019726mr1374768666b.59.1731362459432;
        Mon, 11 Nov 2024 14:00:59 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def47esm631125366b.160.2024.11.11.14.00.58
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 14:00:58 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9eb68e0bd1so691996466b.3
        for <lkmm@lists.linux.dev>; Mon, 11 Nov 2024 14:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQwnzMT15A3eiv+mAqtQJfZ8OfANPjvUTjPaafg6whNkX5rQQ42uxFasijKNIgLiT3zljq@lists.linux.dev
X-Received: by 2002:a17:907:7e8f:b0:a9a:3c90:60c5 with SMTP id
 a640c23a62f3a-a9eeff38583mr1475828766b.28.1731362458220; Mon, 11 Nov 2024
 14:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111164248.1060-1-egyszeregy@freemail.hu> <69be42c9-331f-4fb5-a6ae-c2932ada0a47@paulmck-laptop>
 <8925322d-1983-4e35-82f9-d8b86d32e6a6@freemail.hu> <1a6342c9-e316-4c78-9a07-84f45cbebb54@paulmck-laptop>
 <ec6e297b-02fb-4f57-9fc1-47751106a7d2@freemail.hu> <5acaaaa0-7c17-4991-aff6-8ea293667654@paulmck-laptop>
 <a42da186-195c-40af-b4ee-0eaf6672cf2c@freemail.hu>
In-Reply-To: <a42da186-195c-40af-b4ee-0eaf6672cf2c@freemail.hu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 11 Nov 2024 14:00:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiEuh613GjBefTRe-_Eha1X1GoU=1nLt65uccSBC8Ne=A@mail.gmail.com>
Message-ID: <CAHk-=wiEuh613GjBefTRe-_Eha1X1GoU=1nLt65uccSBC8Ne=A@mail.gmail.com>
Subject: Re: [PATCH] tools/memory-model: Fix litmus-tests's file names for
 case-insensitive filesystem.
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
Cc: paulmck@kernel.org, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joel@joelfernandes.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Nov 2024 at 13:15, Sz=C5=91ke Benjamin <egyszeregy@freemail.hu> =
wrote:
>
> There is a technical issue in the Linux kernel source tree's file naming/=
styles
> in git clone command on case-insensitive filesystem.

No.

This is entirely your problem.

The kernel build does not work, and is not intended to work on broken setup=
s.

If you have a case-insensitive filesystem, you get to keep both broken part=
s.

I actively hate case-insensitive filesystems. It's a broken model in
so many ways. I will not lift a finger to try to help that
braindamaged setup.

"Here's a nickel, Kid. Go buy yourself a real computer"

             Linus
