Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8CB279DC3
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244830; cv=none; b=E5nAAS5c8f1OY98aSVcHvKubGR/IfXLZWqeQFsx5N2Tl487SjUHNeO7DSCmjG0j6UXj20sv7Z0hfMNazKcpl83YyrHiSFRDyLuF0gHaN5S5PJRVzXPIP9qoKdgBuxli/TnaQRTqoH0Ez2TNI4imjE7LV24yXum2qJKWkY5h03AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244830; c=relaxed/simple;
	bh=fXZ4vcmfUqsmt2+CSUmCg841TbZJyBu0/JW402XtkNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS5nmTmtc/jWXMCRxY/uXRtz90av79RwMiJb/IRWEr9CZyaEuS/bGQPjttuGsXsJxSzOfeEZU19tpUYWCBv5TuhfPhimf6ySkeOpBw3GE7hqhZKcJbbk41bZO12GuWsR6CjKqZ8i8dVOBG3GTnYHhnScwHEITwD0pjNSbJH5jZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXYgxVlF; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXYgxVlF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2fcd6fe970so358484a12.3
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752244828; x=1752849628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXZ4vcmfUqsmt2+CSUmCg841TbZJyBu0/JW402XtkNc=;
        b=QXYgxVlFfiJaPGIOjfu4BvGelqZk2dkAKGrWWriaaSd2tm6oK+UtlIzucoZN7EYbmC
         i6dKLf8Mk8eWmjRXu9u+9qw7VaoPQJs/6HOMauRg9gLQkBRFiiOQDwh/eIR77v1wKhZP
         HyuSXMmPyBB/ALV7mMtXqtd2VlLYLhZU82aSGZgG/nxTvNfjQDGjJHEnox7mxC9LfIbT
         0cRBsel8LyKjiy8/Bd+5aSPLhAOU56gLvXjchH3gvIgnas960sEVicVY7CRqzbT3X8C3
         9aitHyhEbR/rsp91QmhBbe+Fg1izjfYXyacCbVujjcssPDz/vWz5jKL2iKYqtIJ1HUPL
         kSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244828; x=1752849628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXZ4vcmfUqsmt2+CSUmCg841TbZJyBu0/JW402XtkNc=;
        b=KPYAef0+B/abDMBVujCteSfDBpcITCPZwGV6SZzGX29XPgYrHDiFIEGENT7p7yHXyR
         qC4S/Q+ufWuicemeAmRYUoN3U/Nm6cemYq9+ibGoEUQFazBdRoUm8LTTVT2eoV8A1saJ
         kzEMY/9WUMdaZLF1VM/GB6ju/4OlickVzmVFgdq6q0ezXbtGC2MGQ/mYsVUZ/6X5X0UM
         PlFuo74DVpMKCeA/YsDi4ioLuLtI6HVxrFu6BnZ1Kqy7XQn7P00eNDzukQSC+RDjLb13
         uxesNanY7ZM14yPh/B5n2JGn6Vu6A9Xs+IgkXTHaSlwC6lbnkNlnz/B4XvOOk2xMvIRB
         NSXw==
X-Forwarded-Encrypted: i=1; AJvYcCV9QptuDj/IpMixmmaz8ER4prIa2Qyl++UsoB7yvXUG9KR6LxgJjF6kocv9ToTcWH+tpwHD@lists.linux.dev
X-Gm-Message-State: AOJu0YxIQ202CiuuH0ha38ljoEW91rjBs19qcjFnTrbwWMegG+fvBaRp
	okHnEZqLzHWQB59lgWTV+A17cc/DBNNmuGsPpFZVNU4ROa4Zh2wi0LW79sV4s3LJAHRYdUH62bV
	zblWgRRywBR0EUFARLlROEc1cttfRfp8=
X-Gm-Gg: ASbGncsXyP42A4NnTV0JMhBncYLLHoSCJqgRiSeTp9jmwbVQSvWloIKl600Vjyn9Ohu
	3tEfIIpx2i0f9haPVhF9os9yYkvjeDLB5kWCzX7SHptuXTFIj94Zy1FoeiaP4UpMDbAvvJXlg02
	gI+ILPIGSkkvoH2uc1mYwMH2r4TW51IVwePd3GXAnMq5Y4NFc2Q/otf3Bmre6B8Im2WfOSi7mjt
	Aqn9zBo
X-Google-Smtp-Source: AGHT+IFYxwtBgMnIfg/xAT3R3GJa8aE3IrhDbXL2I0lvZC+hZp+4ZPopV91pa6CXgeAX/d6BH2F635YQjTdbLIOr0Bg=
X-Received: by 2002:a17:90b:3cc8:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31c4f37b71cmr1629560a91.0.1752244827632; Fri, 11 Jul 2025
 07:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710060052.11955-1-boqun.feng@gmail.com> <20250710060052.11955-10-boqun.feng@gmail.com>
 <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org> <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>
 <aHEasoyGKJrjYFzw@Mac.home>
In-Reply-To: <aHEasoyGKJrjYFzw@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 16:40:15 +0200
X-Gm-Features: Ac12FXybQ3RSq0XqEzQa0Q1OUOc2LkcohPUYOuFRJIKS3VWXUuSmYjCh6kdSjjU
Message-ID: <CANiq72kvZ7-fMoE9g7SBUrBZy4QMbSL1p8KgBqGhOkenrsr=3w@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alan Stern <stern@rowland.harvard.edu>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 4:07=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Thanks Miguel.
>
> Maybe we can do even better: having a type alias mapping to the exact
> i{32,64,128} based on kernel configs? Like
>
> (in kernel/lib.rs or ffi.rs)
>
> // Want to buy a better name ;-)
> #[cfg(CONFIG_128BIT)]
> type isize_mapping =3D i128;
> #[cfg(CONFIG_64BIT)]
> type isize_mapping =3D i64;
> #[cfg(not(any(CONFIG_128BIT, CONFIG_64BIT)))]
> type isize_mapping =3D i32;
>
> similar for usize.
>
> Thoughts?

Yeah, I wondered about that too, but I don't know how common it will
be (so you may want to keep it local anyway), and I wasn't sure what
to call it either, because e.g. something like `isize_mapping` sounds
like we are talking about `c_long`.

What we want is a Rust fixed-width integer of the same size of `isize`
-- so I think you should try to pick a word that evokes a bit that
part. Something like `fixed_isize` or words like `underlying` or
`repr` perhaps?

Cheers,
Miguel
