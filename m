Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F925A645
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503695; cv=none; b=VyFsqixL8E4ohFez1kmxvYS7AoLoYoLNkJL3l4OUfUmTqqxGskcWByZLHhRqjkPfJr/tP1DlRD1ztKc1LlymSVexh5uzZRZTzfcPIhmphxA/qJ/voMMffqYj439K1ngMVlSLkskzmgDZ1bMcBMFVecbL+d02ANo/LAJvAxPcdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503695; c=relaxed/simple;
	bh=mF3qRqePN5gnZ8MStWoEp89ODWeu5IRb/uRaK7APojg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usQiUZi//U+8ven/hHC70b1SxYR3Acvce5Ra87qFyl26TXz/7157wubH7fWLceU6k6EpmZQ+XonPm5OQOzBycADBOKCYeepr2C02R36PSc79sSZVZeWGbMWtXnd5mMnJ+PJw5RBC+nqoa0l26BvHW0eUqlZebqaz73Zqfe6PdO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQNLL7ls; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQNLL7ls"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-312efc384fcso681461a91.3
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752503693; x=1753108493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF3qRqePN5gnZ8MStWoEp89ODWeu5IRb/uRaK7APojg=;
        b=VQNLL7lsVwEgBmkZjcPPXrew9Xg3+QQJ5hcYilzvcSwwbpSAxNp6SEW3uy0IE/J0hI
         h/t1EUPVfEjAP6ZUn4M9wYceFSrIQ8bauZ/P8bq/VnfdbUphLvPI9xgz/njWhNBoMDr9
         1xBiE6xdBtG40NQF3nVfe5yQQL7KNNhvMzm8KdE1sxrITYeC9mwv+CAk0CL1uCM0kVIA
         w4DPymujMwu1dqKIabP7JjkTyFft79sWxZEL8fYlLfUrHg0u8HK+/hX64bzMKX2P3Qro
         d4+99bVyp6dp632cG6Agejzoq/yHVY0fLo5JFVgAwBEnF+UV8SFuZEHM7TxMv+jPgY7r
         /yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503693; x=1753108493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF3qRqePN5gnZ8MStWoEp89ODWeu5IRb/uRaK7APojg=;
        b=lP4w9K+ghkqYFnWFkxBcDZpj843WNU6FRXjpVm+te2AFCpTff/jxvTQZs7EEfz6Xk8
         iEdq3WVcosJlrv8uc5+Rpx/J0uf+jlKfk7NzctxUZwCJqheC5UVjAndzuC1RVC694zFN
         Sc6AZrnQX1lJfzGgoayQWUqH43ZqL5ShtW3SA5pVfUZvBYiPNdbRzyhbE0fb6PA15Kjd
         et78erd3QrlI5pwUu/X7BKiiNjif+zK62pPrl4cluGvoIvsBKj+jKxQA4LZ/o7frDLad
         9CQztgumrIPz5jSut5zU8HUiqFBpFtmlO1gzX5+Q1Oly1RvqIl1tkXu5eTT8H/z85+rg
         LwDA==
X-Forwarded-Encrypted: i=1; AJvYcCUm6ha+HJKDNW4l0wTPHM/8N064ja/DVPcrpH61sJtmsjNrgTN00ty9BjncmecLRvaLBz+S@lists.linux.dev
X-Gm-Message-State: AOJu0YzZr0fqfrysu/4kp+zdcBs3FhRLjK7Sdib0JuvkAnyuNI0Tau7U
	MVGTXcsyfZMY2nRTz4cRCWBWba+IMTQavuHL6cKgpH4MUBiuxD2rrmSN8j2yPuvUrCx5VtIwxcL
	6K3x80PAD2LTtkv3N9rFVE5QVGXbl9F4=
X-Gm-Gg: ASbGnctqtHxrLtHnpjg3WbPJF82YD0CHg+VYagf6QGZE9Zc0ASVTbv3Uefp3ywP7H/X
	j31fEsMlEblYpGvNQclq86yUjK3ZGkUhpyBVH29+jUi7QSBttRdhw/Q3uTlkDmbBsVbVCkQZX+M
	8FfCXbl3GAzl5i89nHHqJnc7nrFEjixwmCp4PmaCUgDsUQ8xG3bFaU5FtyY0J/s4qsoYewRN/2X
	lcQr7LQ
X-Google-Smtp-Source: AGHT+IFoHk5jjWFWj2oU0bOYyeJP/eIsZ9IWh9rMq8AQzMClOPCmhJDbvXOLbquXElXUXPlBEPNn4yN7x8jDS3qcJEU=
X-Received: by 2002:a17:90a:d407:b0:311:9c9a:58e8 with SMTP id
 98e67ed59e1d1-31c4f568682mr6380610a91.7.1752503692830; Mon, 14 Jul 2025
 07:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714053656.66712-1-boqun.feng@gmail.com> <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org> <aHUSgXW9A6LzjBIS@Mac.home>
In-Reply-To: <aHUSgXW9A6LzjBIS@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Jul 2025 16:34:39 +0200
X-Gm-Features: Ac12FXxkgaL6r2gvTrv2PgM8CpWlTlMhBK68CPg5GyVvkjv7u-DyRww_DjHEeO8
Message-ID: <CANiq72mFa0bM_DZV2tHViU0SKqNG_tX6AxBWz4AQ=2UmBrt=nQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
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
	Thomas Gleixner <tglx@linutronix.de>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 4:22=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hmm.. why? This is the further information about what the above
> "Examples" section just mentioned?

I think Benno may be trying to point out is may be confusing what
"this" may be referring to, i.e. is it referring to something concrete
about the example, or about `from_ptr` as a whole / in all cases?

Cheers,
Miguel
