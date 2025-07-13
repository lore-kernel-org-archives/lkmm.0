Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A7A48
	for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752436295; cv=none; b=dRv40ShAdY2U4ejrpjH8b8UUsQtDdfNN2up/tgkjydCRIVS9VvWZ6MMdWOKO1nbfkV1InYDc+WmcgEatSt29CVV3lYdguTkauM+A4L7Gbj1Jk7lswXG/x+pkYqxKZ2HHy73uNTOR+zwfsXq/EmWuqs8fkyHuKbQY65O5jmJ5SVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752436295; c=relaxed/simple;
	bh=nPQlDFSW9RIxdadQENtLULpU4fV5OoVXBUZbBVLLTY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScbbPIqCt03k2uYXQYa0hTfe+168BdEi1yan61ZYK4rJnTW3adUNC9MwoUka2wON2sXwsVeOHD92vP5cAASCDVFy1PHmpa7ZsGX//QXU/8NLCwKIyqVcJyHspsUkL9Rs/ziBSgU5kbzZp91AM8xrULHl8jmptBkR94YkeWVooro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdaln1rL; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdaln1rL"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab3802455eso24332071cf.2
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 12:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752436293; x=1753041093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiYEGXk9WPqZkAOxoDJG4bxHhit6SmV7DwavSK2behs=;
        b=fdaln1rLwt5lUQcxrEHwhRqb6fAAHe9B03P8krChZQ5c0aqXNoXsKxy1NkwKw0nwAI
         Cp3KhyA00MrUy+YMfgi7CZxcFiAvrPi57X2Jwct/SbycSPhLVwmEx11nzcsMLP/Sa0L9
         uOJFHqqEBca/9GzFWEPD6nVBqpZzZ27WMljcAQk/imq/6zO2Z8Mv+bdk2YSvW19Bf8dm
         brmpAO44ok8bbxWbiFjxrYfdVwpyrgswPGP7otY8sgDOCmljsfM/3CQV0iFJ6roif6oX
         8WlJijYXBSLYkYMBJnJMb6kke8OxqKkXcIB8u+YRGD9aGP2GgGVV5EXo9lnABxIBhn6x
         apkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752436293; x=1753041093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiYEGXk9WPqZkAOxoDJG4bxHhit6SmV7DwavSK2behs=;
        b=hIRcX+CSjxYRTpHa6CI60NB/kS2FNk7Vsq2IaHdA3G6U68qRR42WXZ/igecIV6tYFP
         V3cvvqLtcOYvy1/zsq0V3xNuMjZEd2/SJTF2Zbo1OAvsLVKPdvF2xHoF+/tuusaHhQeO
         vBBFADZnOH34Q62wn+y4lHxePj/jroPUZgZpYXAzDAWHAnFRRXLxkePyIZLpQmsa2/2p
         w4WVhXza0m6WXiesNerzRJuAqvP//gpr7z81qdjMvkxwG/s7sJu0FmFX5bya8Z62dc3t
         5Mt2ZYdUlKf16FdaYZ4zwAfpFQFeh/k5Yo49rNjh9x3aQqwUt+vSMSIMHfJU9k4mVrc9
         Agtw==
X-Forwarded-Encrypted: i=1; AJvYcCXOBUbptuWona1ZpcZfUEhvVoVCjmgZIMm9gJh4toC3T4g0fZMGWavOe+BoZxpL6GULxb1X@lists.linux.dev
X-Gm-Message-State: AOJu0YzjNWwGB/sSQir/sc3JWKTGmMNS75SY9IZGL8j7IYLUYlp9Onbq
	QEq0abFaItKSsFQb7yr39jqLRjafqX8hfLDSeR/Dth8XDy4Ax8Gwj1jQ
X-Gm-Gg: ASbGnct2kdK7dllwi8B5DA2L5y7Yd4k3UN3tnBPq3ZxsskCGR36sDmP/98DqgiEmV0L
	gDViwvwdAdJcSMYkfOXzsrDtq62ggrhsUZt5pR4/H9LzfVL22XxIwweap8Bc/VzOKhgZ46Af8my
	9SAnCnkbZMog/3xTp2w1ihYJyiwjOewwaeDn11jb23Ymdn2KYHemm0pw0ImMNQulLtJ1jH6DA2a
	lohPWLYWSRSb8zY7Zv3/Coil9U8XJGFcdwnV43apvhadRXr1dXd254UWsKcxQ4KTGgLSvaQDp3s
	I6/9zvf58pCQQperoILlBHb30GfN5gVPWB2haspbwS6UkY3Mj1byXyeJ0frYzc/ln324ShBNQmi
	rjZRV82wvxesn6NeKXjM3RvBQP55u3AaYk7RQ2BMZGq25BbGB4TyOr5Ot2Fik71mT0t6yWi484Q
	nn1vPSYht6vEhciJMJP81gU/w=
X-Google-Smtp-Source: AGHT+IH5xDylD/6MZCspt9o4GAG8jxcNA6PZtUrSOr3+k0K3lrw0sxOp16rSOwxUVU5CIJaT09n7Kw==
X-Received: by 2002:a05:622a:10e:b0:4a6:f416:48b6 with SMTP id d75a77b69052e-4a9fb92e587mr186226371cf.28.1752436292525;
        Sun, 13 Jul 2025 12:51:32 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9ededcd5fsm42418971cf.68.2025.07.13.12.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 12:51:32 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 39322F40066;
	Sun, 13 Jul 2025 15:51:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sun, 13 Jul 2025 15:51:31 -0400
X-ME-Sender: <xms:Qw50aDyQsGYzFN43RjiBN1oLYKEL1H9n3OLwQ4tHNN6VZDivnKHXgw>
    <xme:Qw50aMy65KPpd0jrB-Zrf03GOwr7o1Kw5QSdulxhr6wpYY9tTJzp4LCrO2hemwXeG
    rODEhGtnN0hGD39LA>
X-ME-Received: <xmr:Qw50aB4wVqiDti74aw21J6npBQJbyYRFrEU3LlpimRjZU1fP3lybfEH0cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegleeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgfffkeduheeliefhkeehfefhueefffevleevkeffvdfhvdejgeeggeevieetjefh
    necuffhomhgrihhnpehvrghluhgvrdhsrghfvghthienucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlohhsshhinheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:Qw50aNAahx-9azlJQvPLFtMp7OgKC8pVTXQpcMJeeRBzRI0zno-nyw>
    <xmx:Qw50aDCiVJ50W0sS6E_53UE-6sPPEOzX0V67DVpjhEQq-cpd4zCSww>
    <xmx:Qw50aOpEpCGAvR9EsZpH-Ag3m23HDOBNpGXJKvDGBf9xqi4fIMHxIA>
    <xmx:Qw50aF2dRKwWV5bRVPmNAOv3PtFef-_PfjfpjiXdMoHuTBFuWoj1dw>
    <xmx:Qw50aNVvArT2iKsw2cWK16gvHiBWPc5sWIL_HmuqW-enS28Rsqc4vjvZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Jul 2025 15:51:30 -0400 (EDT)
Date: Sun, 13 Jul 2025 12:51:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHQOPPhTRI2mcEKq@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-5-boqun.feng@gmail.com>
 <DB92I10114UN.33MAFJVWIX4AB@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB92I10114UN.33MAFJVWIX4AB@kernel.org>

On Fri, Jul 11, 2025 at 10:03:07AM +0200, Benno Lossin wrote:
[...]
> > +/// # Round-trip transmutability
[...]
> > +///
> > +/// This essentially means a valid bit pattern of `T: AllowAtomic` has to be a valid bit pattern
> > +/// of `T::Repr`. This is needed because [`Atomic<T: AllowAtomic>`] operates on `T::Repr` to
> > +/// implement atomic operations on `T`.
> > +///
> > +/// Note that this is more relaxed than bidirectional transmutability (i.e. [`transmute()`] is
> > +/// always sound between `T` and `T::Repr`) because of the support for atomic variables over
> 
> s/between `T` and `T::Repr`/from `T` to `T::Repr` and back/
> 

Hmm.. I'm going to keep the "between" form, because here we are talking
about bi-directional transmutability, "from .. to .. and back" sounds
like describing round-trip transmutability.

I also re-aranged the doc comment a bit:

/// Types that support basic atomic operations.
///
/// # Round-trip transmutability
///
/// `T` is round-trip transmutable to `U` if and only if both of these properties hold:
///
/// - Any valid bit pattern for `T` is also a valid bit pattern for `U`.
/// - Transmuting (e.g. using [`transmute()`]) a value of type `T` to `U` and then to `T` again
///   yields a value that is in all aspects equivalent to the original value.
///
/// # Safety
///
/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
/// - [`Self`] must be [round-trip transmutable] to  [`Self::Repr`].
///
/// Note that this is more relaxed than requiring the bi-directional transmutability (i.e.
/// [`transmute()`] is always sound between `U` to `T`) because of the support for atomic variables
/// over unit-only enums, see [Examples].
///
/// # Limitations
///
/// ...
///
/// # Examples
///
/// A unit-only enum that implements [`AllowAtomic`]:
///
/// ```
/// use kernel::sync::atomic::{generic::AllowAtomic, Atomic, Relaxed};
///
/// #[derive(Clone, Copy, PartialEq, Eq)]
/// #[repr(i32)]
/// enum State {
///     Uninit = 0,
///     Working = 1,
///     Done = 2,
/// };
///
/// ...
/// ```
/// [`transmute()`]: core::mem::transmute
/// [round-trip transmutable]: AllowAtomic#round-trip-transmutability
/// [Examples]: AllowAtomic#examples

Thanks!

Regards,
Boqun

> > +/// unit-only enums:
> 
> What are "unit-only" enums? Do you mean enums that don't have associated
> data?
> 
> > +///
> > +/// ```
> > +/// #[repr(i32)]
> > +/// enum State { Init = 0, Working = 1, Done = 2, }
> > +/// ```
[...]
> > +pub unsafe trait AllowAtomic: Sized + Send + Copy {
[...]
