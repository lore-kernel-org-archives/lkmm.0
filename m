Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305042D97B3
	for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032815; cv=none; b=ZLiwUPDQfnXcQ/bSFBRtUtmlX1Mu4P2sv3yPsh14pKIdfJmbvqF+VRYNxSnvnpQ0ZeDwZna+yIZRgiZa6LMH3rSYjFpY7VBYwUrHNAy/0Sb6o2lCiQX1x0d5dkokPl4fDVzBYDFnubQOVD+SdvmA0n9Ap9L3qsrgV2X7kGWQHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032815; c=relaxed/simple;
	bh=MCDW2CnFKAr1DkxQeT4e0c8U1UD9qjT0HJQAEVVIstA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFtmINTcNUC56L18R2IbWwJTVhAjKFfnvd52pSemR157O3n2Na5RoS/zWZsgnjiKHI9RYXqEHmBzUtmQs/3q5DrcNDl1es0baAad4951cJG3LA0qJt8ahP9YV3C6yOHd4DScxMTmYs5dcgwsCvp3jFgK0WiJP0JLzOo41uRJnRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbGyBqqY; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbGyBqqY"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fac7147cb8so36601436d6.1
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751032812; x=1751637612; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHVmGFnuGCc8DLnIxYjeOgCVrpk/B79KTLrditxxX5M=;
        b=lbGyBqqYFQpYlEfpi/ZyyHvW3XGSarUhP9kUlPttOvfmWeZLfpjBtC52b1C3wa33bT
         Z0JgJ1XxGmDviiPvTsxrKAZGtA5yedS4iF7m6ACccLUIe1rr88Obzb8fkECIknyE4rH5
         3zOXdNND0KNJ8wrMxv3qmVk3oyXUgEooB69e2nn/qsZ7k4LPwwSXVsLd4NjbH9KXpAez
         AZM9CfqoVSHaDkJYDrq+/qQIGC5EV+YBsq5Q4ZYxqiWCR2+tErbz67Dw9VpxhVrnrmqo
         jK/WgBeAiolA2hRWYZOwZPSpgCjlVnWNEu0lEcMxHbRFDVl176SyT6LR1HpNAGtlM2gI
         9ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032812; x=1751637612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHVmGFnuGCc8DLnIxYjeOgCVrpk/B79KTLrditxxX5M=;
        b=ObWWFNeZPnuv0MUE3Ja+RffM/prH3zojs0z6fuw74gIdGCXZwCz88DoP5BXvxv+Jma
         3sBQF6X7rxiIOSyukgurGycrCF3r7+pUsD0Z8UBXuzUj7c+Mm4cu+yaYqMvQkcwMFlCp
         szrOL/3WpV5dfdx+gyRFndVc/idXJ6gnzeA9m2fQ2P/tmewsBZrYWWb5dLokAWBBFJCy
         4w8uafIFpB5QGeLkCqOaj5mZddLOd1olCX3S5SknGHd62d7tbyzyfAc4uUjt2ZIL0hJ6
         JKxbVq4Onm4vdQ59FLBkC8NE5z+EKKF1l2jikN4WpREl1smelO3FnnLsy52SkFuJ9qIe
         9FXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8yUa1vfqUQw2hgyKZ27h/isEWWF9STbkq2ZyX2BpZcLhUTBekX0p/e66+Le650FRra4DG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8B0+JFnx9UhBmCvQ8McJjJJBfYbkv78qll0JbfklCHwRXv2YM
	vb2d6O6/fqYXW+UNtEaJieJ0PhVnVRbVBxwf/j2LAifXEyUVCliL2bTW
X-Gm-Gg: ASbGncsXfsmL+UDfs3J0KrB1x/5hHF7BYX84q9Mc2cSikyXSLb9bQnqbjsAtyygKj3D
	evPWavNXjRLLF55GLAV3c0u9LsTaTcFDKZRIq7B7Bj/yS+D8C/aGq7zl3bfYWI9zb8SeZN3eKxN
	pV/5XEnvjtCUoYs21b6rQz4PT5F1haH/64aNnycfJolZ0Nxrch0DhrTsG6AllkSNh1fIbpA9XGa
	7zTNKrTFEdAqlTv3t8wYM6nnRVTlKMZe5E1xSiRsz+LgtcytVrdXWO0mwmcX4rNlfhwf32B60/x
	WKzD1HSrCONfvCPy9e3ZpyRV+mzp3MV3pGSJyQypHGfG6HMLPrbKMVOj0MbM5qND8oyUPN4rbBc
	3sEWMIJeaWrKfn7sXPDJC4CjdC2sJRS+jCbbb8KXdD5CPx6DXtXFE
X-Google-Smtp-Source: AGHT+IEqQS5iM14Z1smx60jxtHPv4QQEOHjWooOFkrzJ0K7uY9/B7eV3dnb2aGlFi721dnAJ0nOyyQ==
X-Received: by 2002:a05:6214:f2a:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-7000215068dmr67740936d6.23.1751032810419;
        Fri, 27 Jun 2025 07:00:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ff8d8ecf6bsm13042156d6.30.2025.06.27.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:00:09 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 19C94F40068;
	Fri, 27 Jun 2025 10:00:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 27 Jun 2025 10:00:09 -0400
X-ME-Sender: <xms:6KNeaLLAjmdIinLC9QilYqN2CBFZmGqZlZo4pKckMRLvDa6jVt1jrA>
    <xme:6KNeaPIT9qAhHicAuAYQeAFqRGiTs8zY56PKXcf055z_fwzdMNdCxA1p86rVpXepI
    FDjsLq9-V-kogO9pA>
X-ME-Received: <xmr:6KNeaDtCKtXWikmfiq_2yE78BiSy8Lq-wboq4YSeGBMpa2WstyOikh6WGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdehtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhm
X-ME-Proxy: <xmx:6KNeaEahxje0nUSNuIvIqVraIaJrze5xOuiad_ZbKwotnxnISHBHhQ>
    <xmx:6aNeaCZTQ9EPP7RLe96slpJz9Y1YH7jL20YNAsJ3YNw3lNX0QyS0Jw>
    <xmx:6aNeaIAnTbJ5cZWa9GHaZCZpvKHzqZC4EmDXtgWN8Zbqn5m048iiYQ>
    <xmx:6aNeaAZj9Bg0pF94onEbn-Owp5V1JwsgUextTDLq0NA0UZZupf8NWg>
    <xmx:6aNeaGpaPrfh4tw7sAsYDq7FywKZ6lKAxs_hNq0u7WsXyRxFIYx4As9s>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 10:00:08 -0400 (EDT)
Date: Fri, 27 Jun 2025 07:00:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v5 01/10] rust: Introduce atomic API helpers
Message-ID: <aF6j5158xC_mEAHM@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <Uqju6u2xO_vCzY1ykGKU72OTQDzH6QgCbUFbq2e4ibAiXgKNzQRBv5IMVNEaCg9zFQpebc65KefA6rzhLNQ9xA==@protonmail.internalid>
 <20250618164934.19817-2-boqun.feng@gmail.com>
 <87jz4y28pu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz4y28pu.fsf@kernel.org>

On Thu, Jun 26, 2025 at 10:44:13AM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
> > In order to support LKMM atomics in Rust, add rust_helper_* for atomic
> > APIs. These helpers ensure the implementation of LKMM atomics in Rust is
> > the same as in C. This could save the maintenance burden of having two
> > similar atomic implementations in asm.
> >
> > Originally-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
> >  rust/helpers/helpers.c                    |    1 +
> >  scripts/atomic/gen-atomics.sh             |    1 +
> >  scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
> >  4 files changed, 1105 insertions(+)
> >  create mode 100644 rust/helpers/atomic.c
> >  create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh
> >
> > diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
> > new file mode 100644
> > index 000000000000..00bf10887928
> > --- /dev/null
> > +++ b/rust/helpers/atomic.c
> > @@ -0,0 +1,1038 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Generated by scripts/atomic/gen-rust-atomic-helpers.sh
> > +// DO NOT MODIFY THIS FILE DIRECTLY
> 
> If this file is generated, why check it in? Can't we run the generator
> at build time?
> 

Greg asked the same question, and it has been answered in v1:

	https://lore.kernel.org/rust-for-linux/ZmrLmnPz_0Q8oXny@J2N7QTR9R3/

I'm simply following what we already do for other version of atomic
APIs.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
