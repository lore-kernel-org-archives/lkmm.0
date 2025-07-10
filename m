Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035F2EFDBE
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752174409; cv=none; b=Rn0uVz4Tjd0pvr7n3+S8hZsuf008vGhtWsn8TFnI8tzdCwYlrhFRSh2wE2+/ToCZ7FYVOEIG1EPuaDIotwbJXrPZGcVKFP8X6YN9j9Q39xDQLyYuFZM4jhDPM6zZkhMPmnjc30pNgfJ8NEIWbk/dkzFlt6DSJWtOFLUfN2vN7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752174409; c=relaxed/simple;
	bh=d1TgekxlM1F6cmtjM39Ek7NrGs4UiAhKYGCORsJeMDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQjT8WjznQvMrTr+W9nC0+6N5U+JPcmJPiBO04hCw0zXV9Wi1iKIbwda8VkcqXMKXzHAIVwrHr0caU7y9fVQd9OJFfsCZvK4JjMhrU9iLJZJheP7ud/QXqahgubCKdAdkI7ljfuLy0WL/aiO1fgEiUB+UNa3trWoligC4969eQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpxsC9La; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpxsC9La"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2355360ea88so1960295ad.2
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752174407; x=1752779207; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1TgekxlM1F6cmtjM39Ek7NrGs4UiAhKYGCORsJeMDg=;
        b=NpxsC9LatKUAPlACN4E//jmLtvJJ0vhceBEG+nnijuMjYzv58/LKrNUbFI8rlYgDk9
         qMwYpT7QR+lB9y0pkEcqS12g0XndI0OdegeXxHwV088HX1btG1nPUy/dKFsFTnvpkhsP
         brRvqJRmxN2tChqF2RnxsGanScYAwFWQXylnmfDltgm9di+9qGp2O+GA99PHlDGeAeD/
         P4FWUcw58O3uxrCFwWHEdirQMXKX3w+KOgcsccFMx6Mj2Ph2lVtIv/DKOIXhjbGf5GwQ
         ioI6xj46vGhCjiq5+jXr+pCNhIoMdQToRWWZifAeR/pdiobIIoczOLKLsCMg6RJoc1zS
         ZX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752174407; x=1752779207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1TgekxlM1F6cmtjM39Ek7NrGs4UiAhKYGCORsJeMDg=;
        b=BjQ1A9vpNn8n+32jenbi/Q/tth3naxD5Jbn08vpAPGqnztnA7pzrZI0EcJXbZbymco
         us5eFCwaReIpDtSarTq1Ysw5P0aMIzciSJ4U4wLR1OgrD5XcfDsCrJjSAiomR5MdiJrt
         mwTj6VVI/Eam0auifwkIwFL6RRbzV6j4HdD3Q2iGlhFgFWgx8BXUP3YmiwH9PD0p1vZG
         HKntv8MDK2ml8FvKl/SP0NydVb/ZUMf2zHqHYHIEVFYBU6fgAKJMNSpNh7VFk+mm26O6
         t5CuWxetsZoepsceI1A4iC8yaoBiEuQcU9Gv09LMlKCrFta3VSIi2dVSJiU81BEhkjHB
         BAFA==
X-Forwarded-Encrypted: i=1; AJvYcCXBLnRPIHbAzcKymHytOxgmIpL0oMzVTgMxW3WmyIR3pcciZKMuLGcHTLfBQZ8E4O2sZOh7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnb7oNpdBIySXEeFoExT8RAV9K1GB+kE0/UT3AusF8SxvioeP4
	vjgT8o6/KBol5kB/SJBbTIn4C+CB4lnEelUgwOFxyQHO+P0dX74oj1eufUxUZmXRDr3QsOfKmir
	I+PeUe8svvdKXUE8mDBgvkazHdTg/zH4=
X-Gm-Gg: ASbGncu0b2E4uniX9V59hRSP6r5Z2yUAqJb+//k/Rx5x3gfkxluBERpulKbL3g+2Ght
	OSnTnNKdeaL3cJBmady+73dY0bS8OWqvj28G+qnWPfHmV5cluqtXfDG7Ns8OwgwQ/Cr5PrYTqrY
	EC2HlQYNpCAvaKqsGrIcb+zYeZ1cnbqMrnnmshInjF
X-Google-Smtp-Source: AGHT+IHkEFYCa3ATI/QIEvvVfoRX0qcKn6U4rLVncaPPUJONzR3iCGpU45qxH8NuVBQIRr9ulvGNtoRqwfRpZl1JiFI=
X-Received: by 2002:a17:903:1245:b0:236:71f1:d347 with SMTP id
 d9443c01a7336-23dede76501mr2207985ad.10.1752174407365; Thu, 10 Jul 2025
 12:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710060052.11955-1-boqun.feng@gmail.com> <20250710060052.11955-4-boqun.feng@gmail.com>
 <4Ql5DIvfmXBHoUA428q2PelaaLNBI5Mi0jE3y3YPObJLRgY73zNZzQ8Pdl2qq25VWsMQFKUpYRHHQ1e7wFaGUw==@protonmail.internalid>
 <DB8BTA477Z2V.1J7XFLDXHMN2S@kernel.org> <87v7o0i7b8.fsf@kernel.org>
 <aG_RcB0tcdnkE_v4@Mac.home> <DB8GUTJA9QU1.X112WTV7ABZN@kernel.org> <CANiq72=Oq-JHkBuTAZPVYO5omuXswgGfLXu+nAGwEdRdgkU-0w@mail.gmail.com>
In-Reply-To: <CANiq72=Oq-JHkBuTAZPVYO5omuXswgGfLXu+nAGwEdRdgkU-0w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Jul 2025 21:06:35 +0200
X-Gm-Features: Ac12FXw1CiwqDgqRLKnAYlHxWPBCV-YdBB3D1UT2TjwRBmWnZYqiMVSnF3Wqfxk
Message-ID: <CANiq72=K8+Rx_3yDXPxsTMftg6Kabg=_O3voMKNoQ647wznGpw@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] rust: sync: atomic: Add ordering annotation types
To: Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lyude Paul <lyude@redhat.com>, 
	Ingo Molnar <mingo@kernel.org>, Mitchell Levy <levymitchell0@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 8:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I guess there could be a lint that detects a given item being `use`d
> which we could use in some cases like this.

Filled: https://github.com/rust-lang/rust-clippy/issues/15244.

Cheers,
Miguel
