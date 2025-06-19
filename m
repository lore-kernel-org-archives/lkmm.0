Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5221FF33
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335580; cv=none; b=p25j/DRS1v+FEGl7reBJ39F48sbDc/s3oUpN+sUphNeEUwXyBlLroJaFctSvVh+ymfMGcXMCllIyznyapK7tAI70854K5bNp9ZHDFcE8GhZ5athsOygBSputPAuTdByPyS8X1/T02supeCucluwUz6PLNuRCQmLY9XW8wDuOT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335580; c=relaxed/simple;
	bh=7ac51FHNRIWsyGPsA2cT/OoFSdh1Legd6vLnNQpKO8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6PCTJGNaFCEvpEwn5r7rSLpsl8abz6Ff+l16GfwteALneNZicLQlHOb5BF5dmV6khxtNfOwT1pAdtRICjTKs0lz/+oxBHLY3Os3tljnYbznwm8YuoIGqX+EKJP+WBQD/d6OtOnrG8QGFWuHkz/oKSyYvi512NBU0b/eCWFcxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtSDbI2v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtSDbI2v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so458023f8f.2
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750335576; x=1750940376; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ac51FHNRIWsyGPsA2cT/OoFSdh1Legd6vLnNQpKO8c=;
        b=rtSDbI2vl6w5d+Hg8MtUw3xw39fFtRMsjhz7y/73OC2laHO4s/ybAoaIQtmzCRL5Kf
         1WdBuxZWRNLokZF09/zrPjJLmrXLck0e48AMz6lDxvKp+2vvDgA7K6TiKjFLjQKyZkJA
         g6ybqtwfCCmXgaXt1rCi1rD2p3WqPnlTLRy6EMMQvA6bRzomW+2OotmrpmT2Nb+Fvba+
         luD0pjK5cVNEHulTeenSkVvz6w9COlIV2bUdB9z/ihfAkukZIrXbCauSpB5y90hAZDvd
         fNBrjjjiS/lFpG9xYtbCxLC1m+p+/KMle3aeisLAXSV1ZFbFSSFlTQj3yKvq3gSmfU3I
         JEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335576; x=1750940376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ac51FHNRIWsyGPsA2cT/OoFSdh1Legd6vLnNQpKO8c=;
        b=dOLSKsEZKZWvrMy134YtO+mx0Sue18MA3DbHLlYG8Dz2JuWdldPK1poe5Ajw1IH9c4
         YvLqKftu/PJIy6OJa6WFCeoEUM08AtNuv8t04Tyih788R4zolna5j8qM6ycYeu0O+Ld1
         +I9NQYLUO/TmVoTyMTvbGrwU+jKDrGp3U1irnxZGkKaEONCN2GkD/jKYQqFV8X4czIJz
         mIJPnJvvSipPpsBjOaQkRtvnJyLRJxG9DcgxpDafpVTbgWvPLFAR1u9WY3e8TDefObZG
         1FwSS97hhDY8KJOmmM02C8/9pXMk9otueF7nkXxvmoTK24H9fFL/Kcsy3RXzwnAn+Ic/
         Cq3A==
X-Forwarded-Encrypted: i=1; AJvYcCX6qWLGZYQZm8UNOv9U8FBjP6251iJ3Ze4/zt4JysgF/PVSEUuXJ0pQqxlCdJw9kRBEPHIY@lists.linux.dev
X-Gm-Message-State: AOJu0YwYRgI6fn0P3WGkaVdl263JOqWMVkKneW3uUnmfWQoLYgqIwmFh
	fzHVfrtAsvomJlrMYIVsMLr1/aGi2Y7iB8qt79kBKMqn67eppcuBGCmqQCaIBdp0oCueVyTishD
	AqDo/zgM6L01xEu08tFTpgov7J8ut1bFxzKf8nXkE
X-Gm-Gg: ASbGncv9EuDqyoNSfVi/GcGGmn++RGt9vE2XkaIMHN5W4vYGeuD9oKWvVorpnCvSYQJ
	Ff/bRAEwdbnO59ntahk/ldyjlVuqZG/wthoD8Mm9KD9vHiDZmu54p0ilfjo5G/ekbYlLczT5lcV
	kpE0thR7elexVH39guW5ERT38qWBIaWwLR39dGQ8uxt7OxogdKnKdP789vtY7RWICTnCSbaFuwn
	XYBlLQMVpXP
X-Google-Smtp-Source: AGHT+IEdN1dcFOkm876VSH5eqAcy40nZdytTN0BHyo53UKISb9ybhB6h26VIwqtDwmUT6/7XOiLspK8lUcD/OvMDcxw=
X-Received: by 2002:a05:6000:430c:b0:3a5:3517:de3e with SMTP id
 ffacd0b85a97d-3a572e6bc97mr18896998f8f.35.1750335576228; Thu, 19 Jun 2025
 05:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618164934.19817-1-boqun.feng@gmail.com> <20250618164934.19817-4-boqun.feng@gmail.com>
 <20250619103155.GD1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250619103155.GD1613376@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Jun 2025 14:19:23 +0200
X-Gm-Features: Ac12FXz2t9QSaVzsNj9MSWHyeQZH7QvXWY1Yd25RYMgxbqiHuVm7qkIrRqBSAbY
Message-ID: <CAH5fLgjhdxdFztu_pXLjngu4cD7g7jw16bcQYz=XNmGxKfThsA@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] rust: sync: atomic: Add ordering annotation types
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lyude Paul <lyude@redhat.com>, 
	Ingo Molnar <mingo@kernel.org>, Mitchell Levy <levymitchell0@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 12:31=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Jun 18, 2025 at 09:49:27AM -0700, Boqun Feng wrote:
>
> > +//! Memory orderings.
> > +//!
> > +//! The semantics of these orderings follows the [`LKMM`] definitions =
and rules.
> > +//!
> > +//! - [`Acquire`] and [`Release`] are similar to their counterpart in =
Rust memory model.
>
> So I've no clue what the Rust memory model states, and I'm assuming
> it is very similar to the C11 model. I have also forgotten what LKMM
> states :/
>
> Do they all agree on what RELEASE+ACQUIRE makes?

Rust just uses the C11 model outright, so yes it's the same. There's
no separate Rust memory model as far as atomics are concerned.

Alice
