Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3367218821
	for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278159; cv=none; b=VsJwH5jjt6moy+kmgKgz/mPEosAtZiPJs5NR0TxX5RhDo2BMxBgF7LUsXEjB25s5hetvXKQSmqVEwN3fOJxPB+dTImGzA662AiEHlnOBQIQfxglQaSCEsHprjhtbbVOR2P1wT/Ko1nt82SC+YqF33hD3A5htoTTFUGFifCV29iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278159; c=relaxed/simple;
	bh=wfVliNvMFww4ALoq9h28dDUu/++ZlpOwHD/5kA5/dSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuPYx9x/TmeQ4KriIXyySvd8TWXeEFkN1zOga7dG0/i4huMsHOnRjEZHlcZ3Gldj9z7dbzDays5b9TMubgcYsamKSFCm4zhixEBL8+L/5RDfHPmzYUD5s7SHGCiJKVWmzLDayL8tH9/aFsvf4i5r1KeK7CwKuy6OEcNZPd771FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=swQQVkpu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="swQQVkpu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a35c894313so94355f8f.2
        for <lkmm@lists.linux.dev>; Wed, 18 Jun 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750278155; x=1750882955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpNCGTbJaA4N6AQDacC+X23mlTsnB+mbIqH/SioL/Y8=;
        b=swQQVkpusLtgB5jRJA++RZtvleTlDQrFP/bHU6oRyebsdjai6MnJ7fr4AdSjVSJPpV
         uu7iplPiRIK+NNZ3HlNOWSpgTSrVg0xxgy+5RR+lFhvtlynsmuMiVDOWnkGt3I4Ss/7c
         IdYoTUeBVdZet5RCoxIEwGlfhC73Joueofj3ymgc9fFr2AnRbDaYY0xDjIezBIrNWilV
         Ero35x61qcIFedMkkAxN/BbBk/T0Wkhl6jveS5lPvoFPkfYF06zOCMYi8FiHQAqWNDhm
         KptdL4sZLwfgLOLCZvEszGRCjrLVtztPG0SMpto7nRM68IEqeTKw9bYmzetpxqZ41CsM
         AO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278155; x=1750882955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpNCGTbJaA4N6AQDacC+X23mlTsnB+mbIqH/SioL/Y8=;
        b=eFIyj8EjiBAQqPY2LjS6MMPWqaLsqasU1Gtljq9rR6aJr3/wmjP4A6SsjB3ql585Vz
         02flGKjX63nkFJNay4HT3R5IT2ZNVyoRnraum5Y42PCLyzaaBvuKHFHX2OMrLtVAE8tN
         fzcE+Sz5/f5O9ohUULMrGYzQE9uV6iCjNPiG3YoHFZlj3pp9ZEesiF30uyUlKf6g/Hg/
         sSs3LI9sgH0qRxE95hvOUgbONqSqSKoecqFLin0jwiUF5mJ6J0r9NV+njG+k7HZhrFzo
         FkdgM6aDYCtjMwqx9ny1PCyNri9JeINpboTboToHofwRM5QdL3O7Q4ztha3B1Us07KJp
         m6ng==
X-Forwarded-Encrypted: i=1; AJvYcCWZ12qGUkmjENFuX0QOpYuK0fadVbI06lbXli1vIH4Qg+8pLunqyca5n7u0/RdF0gU7JlAa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zgEUQYUWNFgdkEbhN3MBdcZjQzOE59RI/Tj8sV8uwTrjbiCw
	6f2tyyzu+qd80cUsOote2kFyjE9s5g0QT72Uscu+jWK699/r7r1Ie584Ode2Z/tBsxkbZV+jCGX
	gFXe+jTCcna47eGCNNpKdCuwoVWLCo/H+D5+0IKFy
X-Gm-Gg: ASbGncsd4MeVoTw8rD3QBmCP6hefMsi+hfyXXvEnl6887LwFH9lssLilXSl9axFrWVW
	ECAr9IPhERgNW4Xuk6OCFeR+SI92x9iZQsFQOjb4ZIFamL+jESXRA+KkfH5Av5MXq1Gnea4vLJY
	eenrjk7/PAvTN8ZFxGIILAfY5cEU+PqXQfaDyOgHfIL8ek
X-Google-Smtp-Source: AGHT+IGEoyOBlFKES6zAZ/D/8d3NjWy3PFbM8XH1FjI+hWn88pAjWrG3DkriENwDPgzuguMIRV9uDCxNXc9Cb2JGPm8=
X-Received: by 2002:a05:6000:4408:b0:3a5:8934:4940 with SMTP id
 ffacd0b85a97d-3a589344d14mr4512138f8f.50.1750278155203; Wed, 18 Jun 2025
 13:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618164934.19817-1-boqun.feng@gmail.com>
In-Reply-To: <20250618164934.19817-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 22:22:21 +0200
X-Gm-Features: Ac12FXxUZt-wdvp6IAMzVaJLyh1S-ip7vrrFm_I0iVPAZRuZ3XE-nvLs77lmkZE
Message-ID: <CAH5fLgi1FbCc0euts_e4BmAayE2MtK+AUWiOfswd-qo5+L+VnQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] LKMM generic atomics in Rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:49=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hi,
>
> v5 for LKMM atomics in Rust, you can find the previous versions:
>
> v4: https://lore.kernel.org/rust-for-linux/20250609224615.27061-1-boqun.f=
eng@gmail.com/
> v3: https://lore.kernel.org/rust-for-linux/20250421164221.1121805-1-boqun=
.feng@gmail.com/
> v2: https://lore.kernel.org/rust-for-linux/20241101060237.1185533-1-boqun=
.feng@gmail.com/
> v1: https://lore.kernel.org/rust-for-linux/20240612223025.1158537-1-boqun=
.feng@gmail.com/
> wip: https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun=
.feng@gmail.com/
>
> The reason of providing our own LKMM atomics is because memory model
> wise Rust native memory model is not guaranteed to work with LKMM and
> having only one memory model throughout the kernel is always better for
> reasoning.
>
> Changes since v4:
>
> * Rename the ordering enum type and corresponding constant in trait All
>   as per feedback from Benno.
>
> * Add more tests for Atomic<{i,u}size> and Atomic<*mut T>.
>
> * Rebase on v6.16-rc2
>
>
> Still please advise how we want to route the patches and for future
> ones:
>
> * Option #1: via tip, I can send a pull request to Ingo at -rc4 or -rc5.
> * Option #2: via rust, I can send a pull request to Miguel at -rc4 or -rc=
5.
> * Option #3: via my own tree or atomic group in kernel.org, I can send
>              a pull request to Linus at 6.17 merge window.
>
> My default option is #1, but feel free to make any suggestion.
>
> Regards,
> Boqun

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
