Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB028C037
	for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294687; cv=none; b=syrSM31Vy1u+TlLZWhHo+TtJxJS5v6KmGKbzoTCcKPeQykP9Q9cWDuvX35xnD8zu67gjh1ut8OYRx1NckT1kxdi2KbM+tnTVPcDzYDByyaMG2aRpXkOiZMY28j4TIdH5G21WUYzwpx3cj7qTmAlOegU9n/XdYwA9vJkve4CmoO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294687; c=relaxed/simple;
	bh=ap/Vm0hYAdUXiirW96C0YiEeTbMgX/cr/ya8hhJoDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQhRLvi/6KI5URXKQv4fEdIGF+jxuECLgmLjpMKoOWbMhI4h/bk+X8tynL5+bcFilg5p8P3RaZcxEhfx1dQ0D4AweA1ZYEU9KiWtIfdMwBHNVWW2pGYDMjutHeLUHbogiVtKtJkj8OYb5tbYIA5ya1INwbyPPuSUiGoCsZoFdPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DjaDgWhq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DjaDgWhq"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fae04a3795so50135946d6.3
        for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751294685; x=1751899485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ2IOsiMdP1IuJhsvJEX3s5TfXtkiU/6UeXHloIPvLw=;
        b=DjaDgWhqnCRe/BV/0QZsT3QxV+En1JgX57l6sopvsqAycwMCy6Y62cWQveOkb44aV9
         zv3dKsLpS3aST/gx5cnSjIdQPU5ONN9/NRGlr6TkBIvNwNvhY9K4DO7Gxj2URaTikBQ5
         Srugl0WTrFH9Dox6IstuNCfZiH0vUIpMo8sva1k7W0N4Plf9JBcDe+gFfBydvFY4+qSL
         I18Kb5e/QqzfoxYAX3cJmAkWmdXyIBp3N5+jWw7aQOOx2jfy2TRA5abSDEkY4wI5Pptx
         D0rLDVD35zZtCxGcw3/nx7Cs9jICbWHbvkhUkS6JCGeZSpuKWk9HfPgEx4mpR2XBoZ07
         WGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294685; x=1751899485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ2IOsiMdP1IuJhsvJEX3s5TfXtkiU/6UeXHloIPvLw=;
        b=snjJs35oKWNxLRILAXHuY1CPvv7HBJcq6YRL+qMYOCV9tPwiGYY9Q72pVYbKxBsEsI
         SnpJHyK4POi2A9SqAbQVmU6zHk0sijMIGddi3TE+/fwjbyawcSSO8BuXxfIMHiraWOsl
         zRV6EXFWSDeIQNGPmusKj62mU3YhXpVwwRb6V51pdkE/jqibJTAd9e0UNpeHEULkXG/h
         Qc5heifrcq5BiwvgfbmzsdPn4pWJXoP5bSUYqIFkHPcDtVdXc30oTvxo5OvX2oquKjd8
         tBguQtGghw2NtAjeW5eWnIV/Td2QNFLInAyNMPKc88V4xJIw6xGXU26NP1QSUV0g+2H0
         jueQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9wdhlEtOhw8jwVNGAqeUg5li1pSMDCjP8Kc/vonIPbU+VfqrEcKyahZf7NbioJFm1WZkk@lists.linux.dev
X-Gm-Message-State: AOJu0YzXh2dqdiabT0GvFMqa9H74hHvItgto08Ihhllw75GgFo7ouyJT
	8PaQyj/TmCjIXFQgcNaHkBb94Nic4upQc7SjJeYOpg7NFGLyG26k11OboDcHAUfA4w==
X-Gm-Gg: ASbGncvycwZBCnvfmIuIZd32DMDNpPG+PvqWfBDQoiBeJ0m1rt+HxWGdRrFL39KNs4P
	fEmz+1kCOPP4ZUS9r+s5rsK/svd0wB4xMEoGw+gJ8LsJ0GgHUg75FgONzAdQiJGUJ+GOEkZ7ghU
	GDZ4x0nwH6vJHFtVut/AFVF6iyf9yaJDYy7JhsNXz6VELBwwmW0em1iBcIeCyVUUqtj/PuC+t7D
	E8VdKY+Kb72U7zAqXCCuLTUo5AE3oyZuxheQVbTlqT3AotrkbKL++pmhFNBvO42T0DyuChiYUZm
	7WffVzYJndKjVNTVGzhjOw7Lq+WiA0f4UyyWMLFMzUdib9QkSBZ1PEPm1z7ZFgD8UumHCFJ2Lig
	c78bV
X-Google-Smtp-Source: AGHT+IHF16aEg/qn8BZbxpWd2q+vfCazqVYFFAdUoh25jEnDHU8nkqKpn5FdbuttMK7eAlC+ciyVMA==
X-Received: by 2002:a05:6214:caf:b0:6fd:7508:9c04 with SMTP id 6a1803df08f44-70002ee7e20mr190732136d6.20.1751294684428;
        Mon, 30 Jun 2025 07:44:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d327sm68783646d6.22.2025.06.30.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:44:43 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:44:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <7eea6ee3-4a9e-4eb5-b412-2ece02b33c6c@rowland.harvard.edu>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <8ISRnKRw28Na4so9GDfdv0gd40nmTGOwD7hFx507xGgJ64p9s8qECsOkboryQH02IQJ4ObvqAwcLUZCKt1QwZQ==@protonmail.internalid>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <8734bm1yxk.fsf@kernel.org>
 <jJqJwkURyr0NjkFdJaF6oYbPGY4LEzZs_sfY9jlmqoK1B9iE8VjqbfINHilEHxKfmpc9co7DmsS142ZWsBQ8tw==@protonmail.internalid>
 <aF6yRIixTPx5YZbA@Mac.home>
 <87jz4tzhcs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz4tzhcs.fsf@kernel.org>

On Mon, Jun 30, 2025 at 11:52:35AM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> > Well, a non-atomic read vs an atomic read is not a data race (for both
> > Rust memory model and LKMM), so your proposal is overly restricted.
> 
> OK, my mistake then. I thought mixing marked and plain accesses would be
> considered a race. I got hat from
> `tools/memory-model/Documentation/explanation.txt`:
> 
>     A "data race"
>     occurs when there are two memory accesses such that:
> 
>     1.	they access the same location,
> 
>     2.	at least one of them is a store,
> 
>     3.	at least one of them is plain,
> 
>     4.	they occur on different CPUs (or in different threads on the
>       same CPU), and
> 
>     5.	they execute concurrently.
> 
> I did not study all that documentation, so I might be missing a point or
> two.

You missed point 2 above: at least one of the accesses has to be a 
store.  When you're looking at a non-atomic read vs. an atomic read, 
both of them are loads and so it isn't a data race.

Alan
