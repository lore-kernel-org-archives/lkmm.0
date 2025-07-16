Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524085626
	for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670615; cv=none; b=fSLfOO9H6HIBW5YNkBlyW3CBT5Jx0M+bj00/oDHPKZ6pOr3pAbZEVAq6oFvz8druIDocpPjoP6fHZXcRKDKP763bMFo56TYp2YOs5rmUvva9WbzecEIVk7/mrZdtnUCCjt0MFH/QxmmP6cAcvZuTdPZgf7X481wYQlgnMCjkRbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670615; c=relaxed/simple;
	bh=JXFhF7y50LH11OFGXGNP4jEz7JnvQ9mxz2K9JoGfVx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XN5e7mcSedfwfJ6B9DRUkP5YqlnXYehdxCcULV2bEc5WPxs0f5pwiTZIB1fR+Y9oSfcgnutwX/hiSKA6bbqBzXmoUqfw8HDvpbBgCr2VzW4I0Pb8YeEBJwFlnpY+NUGrO84FEtOvlgihn3YrlzNC8IOPIQBuk9kIAFgKq+pgBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JX7J2pI2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JX7J2pI2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553cbe3e77dso1308294e87.1
        for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 05:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752670611; x=1753275411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV6KjEMkjerMX6Ys9+OdIC5+WGtyITwr6vlurratTs4=;
        b=JX7J2pI20avy0DB436nlvr5D1PY7n98zGN5ftsH+6IJwlXl+BpfiF9UHea4ELDp6Ac
         zu8Y2CHuhjlsA6qzbquVw/34VIIjVX9lnVl7xWsdHV0cU1G1BEq2bUUJhs1v0eoRNAGU
         mZc+uDQpvUEQfIuSWV9hqYUJd65cumlhtvsWSgSxvTxu8oIsx5ScWIsigZ/iQP5t9kVW
         8cxrcBusKaw8JrAR3FFpYiW7/wWhP9JXn/aFKupkALaO1VWdMc+5bji3682uHT6OxH1K
         b+zrQ1DuHa2a96cqYfIoksAjbXnu2kFYw2pKDN8PHhL1JOL26gYXUQuKpKmciLqZfZrR
         H9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670611; x=1753275411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sV6KjEMkjerMX6Ys9+OdIC5+WGtyITwr6vlurratTs4=;
        b=cPRxgrIIATl/3ZTmzN8uHz96HSX3GSyIAx0P4lLwla0MtsHwKvLXmFt6F8z3E2eSq0
         +Ilml1p3ZeKMi8j7bwKMDcFLNz0l3qwLwE36x03XYF6qBt/k8bKUxretXiFE3N8EEVFY
         4bx+fmwlte4M+h16iGj+vbDwCQRKHJwo/neLY0/yPlY0KPnP/9Sn6zSxZ7st4yE8mUiq
         wOB0IUBtwrhYVb6BtF91Iu32e5chOmbbAvMhpJtAhc4bUsRxdnGrA1xD/MrhImwel9St
         a1aa1zgZiV1AQa0sxOpY51laPUMj3g62ZojiIspKIkeuDesI5aJOcFY7lk8hNiJN/tsz
         /q4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAuF/nqWxG3SRngRVX2KTbzmpyk/H1kKDlJagwPDazLCuNWfk6op+Zbpk0LSNl7urcUojP@lists.linux.dev
X-Gm-Message-State: AOJu0Yze3SYn8Mr1bCzuLL2Pq+/TJ3UOpLTiga1QLhj7BbKlXpI+MJPk
	MwpJd2kbNkqJ5LTs6xWpgCMdIfnZb+JCRPEumThbXMIfnp7LMfsdioPHuRe24enMSA4BFHvhLBt
	NVKb48BzstYBRRrAxJhP6uLIPdtUV4a4=
X-Gm-Gg: ASbGnctJg6lAcafh//XyvH6JK7GWAa3dwDzWKzLnI0NW2OB+SEuOvjWkFw2u1cnIica
	mYzzYLngttA2X5gMi69Hz7HC0jtGFjXejK9uarWekKjU+L09GHMniMPsytWjUlpU/IPLuBC7C+u
	kyandUniXwi7m3gQH3oxwejaIDxL2ixxUfqvr+U8EWB2l96eHX7mEqi6Z70YDNmUwqC8b0wim/L
	IxOojIIqAGhlvLl
X-Google-Smtp-Source: AGHT+IFB8L+gxRBikQfJzkahGzv4HPkHtLZ/WKBOXCMXHBbA5uchb6f/SmPkczeGbdyYpczvg4dxuhsdDOq3/+sQdug=
X-Received: by 2002:a05:6512:1389:b0:553:6514:669e with SMTP id
 2adb3069b0e04-55a233add23mr375618e87.14.1752670611310; Wed, 16 Jul 2025
 05:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714053656.66712-1-boqun.feng@gmail.com> <20250714053656.66712-2-boqun.feng@gmail.com>
 <2025071611-factsheet-sitter-93b6@gregkh> <20250716124713.GW905792@noisy.programming.kicks-ass.net>
In-Reply-To: <20250716124713.GW905792@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Jul 2025 14:56:37 +0200
X-Gm-Features: Ac12FXymJy4M2DTBP9I0YHojvaWeqyESc3dLQe_rOXV0Z6gmdWn8o4HiedYjw9g
Message-ID: <CANiq72ms11yfBVjfpV9PH6LZ3g72-Wd=5dwda3ULxc0PTnP=NA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] rust: Introduce atomic API helpers
To: Peter Zijlstra <peterz@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 2:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> It depends on the scripts/atomic/* bits. They hardly if ever change. We
> do it this way because:
>
>  - generating these files every build is 'slow'-ish;
>  - code navigation suffers;
>  - Linus asked for this.
>
> Specifically, pretty much the entire atomic_*() namespace would
> disappear from ctags / code-browsing-tool-of-choice if we would not
> check in these files.

Makes sense, thanks. The Rust helpers one may not be the end of the
world in terms of code navigation (since people will use the Rust
abstractions and nobody should call the helpers from C), but since it
is just 1 more script in the list, I think it is best to keep it as it
is.

Cheers,
Miguel
