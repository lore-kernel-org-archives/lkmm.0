Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099341D7E54
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752172375; cv=none; b=QOEFHRU2Up10ixzp5kvQlGjDfw7qoqRuZNwOOlXs51OZeXt12OPeiWu7kvM7rfWi+IU1c1jEtqOrQZBYMUef/vVNZMxj2NGnFmq+mdnFBpMgxbGCHQdXFj8yX4AlwkMf1cvqNczK8DLBbJ9x658uIxznB2CVI7BtV2TvPWYkw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752172375; c=relaxed/simple;
	bh=WepPI1QEsb7KVPco0eNErLMr0WYuLRbteu135zLMSYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knCVVmgpW+LFKTXv/HbPOoWta+uwP4gxXvTXZJnG/7UXCLB1mnra1/0ecBHvaZX4hAmwjvmJcuTJ9RvqetUVGypSuFIiyijSm79KoZ41E3oBOQdTeq/QYV6CCs5znKBzDHTl+hWLvJlFtgLbxWB8OY9Zw02b//70lca1BBC40PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEGBNfGk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEGBNfGk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23c71b21f72so1729805ad.2
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752172373; x=1752777173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WepPI1QEsb7KVPco0eNErLMr0WYuLRbteu135zLMSYg=;
        b=UEGBNfGkbSktGleK/siumhgAfg+4DtcoMU4SBDu3Iu2pDBV4zJKA4Edm19SFFb8U3t
         JcrwpS3xx3S56P+3vMRUrWB9dSIhy+6EgTEfEYs1ap04GWnR8CF6/ZJjwc131Pa+qHx/
         RK29qm8w90z2BMrnYYpmWnTmWv09SH7ogS/4qjE5yYh3itTl1+6wo2LGv+GA7x3mC9nA
         KpstlEskEefuU0JjxjS/oFWMCetBGVtIA0/89aO5EycLl39zNrcdo8vXWw1AohB0ckrM
         2+2oL80ofPsgLndy7xJXx6Ra1JiKS5/M6XhCmlKKzwaLDvmM4Iw369qIRPjBZKfyULdI
         U0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752172373; x=1752777173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WepPI1QEsb7KVPco0eNErLMr0WYuLRbteu135zLMSYg=;
        b=ReaOC01OVkOH3Ufc5b1AJopSDutM4f7+HP8F53X0CIlBfxennMEGFsTgkPEJWH6XSB
         Kz9wOGHD2wpT5r7QwRwEbeVb6GR2gDR1nZyUJ+V15zWc7Xcwl44eZZlmXIhbj/KfsheM
         gH7uAZgZDpLczcbeQcm7PHTHsDLF8AsQ2F8XpYe1S99RWtEByALgWlENinsFzrijsoOR
         dqbd+Xxs2btnewmPg8HMnk4bjw5cz1JBQlWdohIHSxXjYElMYb4Vf8dj9ipKAi6SegRO
         QcQXtrCva1JugeW9aFXCbJzg3yL5sT+Y2TW6F392Ko3blZDu+oGo8YkjNdNkjfiCo8gb
         oc2w==
X-Forwarded-Encrypted: i=1; AJvYcCXj81eyTEyZpZTHiRDovO2fqrIAAygogM6jr8YiEnZI2j3XgE+96tjIAakjYX4WKAR9lVhp@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdcq+kH6pBNiVbcDTQ/qorjzFWoEU+672dMADuMr8lf3CzDhVZ
	+s9r69Uwo8Cw3O2E8+jA4YVIYsYMVAH+leT7vPIJ7eL19OwpnZTtMLbmtBGgNm/uc8xcmvy6DRC
	8jGCx56cD3AR3pt7usYweyvyJ6kg+1i4=
X-Gm-Gg: ASbGncuujycwypSOSIkwmbOSKBX4bjdAlsVzrIGhVohwFKXVNv4TKkV6wYb7qhtXFEi
	f0yvfrjMZ+KwbDSQ71oeCJzeodIKqfQ/buPZBTuUjqrAAAoQPanifjeOZi2/bHzG6fNI99whyHX
	6hT80AtuhhQ5Ap1Matc08BRcEXOpjt0YoZheVjBhM4
X-Google-Smtp-Source: AGHT+IFTkKMM44D0WTx8T2njTBo+Lj4fPVbE0SyMH8GHthy2NxnMMGZoDLNlGDght6fNtjTJq1SCULKC7PXatR5fYYs=
X-Received: by 2002:a17:902:d504:b0:236:9302:bf11 with SMTP id
 d9443c01a7336-23dede81473mr1222765ad.13.1752172373216; Thu, 10 Jul 2025
 11:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710060052.11955-1-boqun.feng@gmail.com> <20250710060052.11955-4-boqun.feng@gmail.com>
 <4Ql5DIvfmXBHoUA428q2PelaaLNBI5Mi0jE3y3YPObJLRgY73zNZzQ8Pdl2qq25VWsMQFKUpYRHHQ1e7wFaGUw==@protonmail.internalid>
 <DB8BTA477Z2V.1J7XFLDXHMN2S@kernel.org> <87v7o0i7b8.fsf@kernel.org>
 <aG_RcB0tcdnkE_v4@Mac.home> <DB8GUTJA9QU1.X112WTV7ABZN@kernel.org>
In-Reply-To: <DB8GUTJA9QU1.X112WTV7ABZN@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Jul 2025 20:32:40 +0200
X-Gm-Features: Ac12FXxC1iNg6z30MULXJfC5bntwimdqt0Ot5Oz7qXD1RzXTBtdQy9P9OvPMxcw
Message-ID: <CANiq72=Oq-JHkBuTAZPVYO5omuXswgGfLXu+nAGwEdRdgkU-0w@mail.gmail.com>
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

On Thu, Jul 10, 2025 at 5:05=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> I don't think we have a lint for that, so I'd prefer if we avoid that...
>
> Someone is going to just `use ...::ordering::Any` and then have a
> function `fn<T: Any>(_: T)` in their code and that will be very
> confusing.

I guess there could be a lint that detects a given item being `use`d
which we could use in some cases like this.

I took a quick look, and I see `enum_glob_use`, but that seems global
without a way to filter, and it doesn't cover direct `use`s.

Then there is `wildcard_imports`, and that seems fairly usable (it has
an allowed list), but of course doesn't cover non-wildcard ones.

Cheers,
Miguel
