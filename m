Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A931E16FF37
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 04:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752466856; cv=none; b=TFuZrfDo8yH3ubtN3mzJCg4Oys+mPNRJwDlrjiMhNZ/ziICxlCmehTGDAGNPfzGjlwhI2Q/CHHbl0ynY/+HyIKyW9ng5rkKHJ9C3oJJKubbcFLY8OwejgZhTPresT9QFOknEUfI5krNTz70DfB4coU7hH9PgmXJGWs4pmUg5HU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752466856; c=relaxed/simple;
	bh=SuP+qQVi/MxIQB/1CDIRKWnHRBYowFHJSKjU7kuP458=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9N8AT/iKTlwsPSigcYOaUCz6XPAG9Ld7vo0s5z36Go+tm7IDOoR0VnmNNFNqrNPToyhZRXB2qhXbvflfTUSE+8SkZrATc7VphA/ZM155MwZShw9AzMIu0O2dhuucpLmtycgETb5fp4N1sDmamjZYH3g/Q+zUx8FihBkr2zPqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn6Iz8nt; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn6Iz8nt"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a58f79d6e9so51223771cf.2
        for <lkmm@lists.linux.dev>; Sun, 13 Jul 2025 21:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752466853; x=1753071653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7KPUZRfwzKm6vhoXm+OjqDoe1jPCZoU1nC9eh6TlIU=;
        b=Jn6Iz8ntnmXSdMNmZVfJZy8SeZgP8P7/tnSHRc2iwyqC7yFgW9THrn3rsi1uyiY5bN
         chZFcxm/ms3oXa4LOFSYuy3f6CWVh8DmyjkzIwKBcVCuAdiqNXj3oYC0xtXv2vtcDDQb
         N4bzGFISd5LeXB2WL3kf6xUGeVQmA8L++E1UNz2l203ngTK+E2czeWtkY9KdcbXpTg93
         +t1QKL22zCgFjcVzOfo7n8WISMC86SWM1oq092Iy39Z3Dt3hEdedkQm9hSH40iZuKJGp
         Xet9q9yPyhm7FIV/wEgvE53HEc00bv6aU0Bi/W/emEHFTrE08xO19mgmLg3VZOYj7Lr0
         Kd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752466853; x=1753071653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7KPUZRfwzKm6vhoXm+OjqDoe1jPCZoU1nC9eh6TlIU=;
        b=iFnZ+F/qj84NqpO54MmQoWL9RRTkvDhTkKCkpyY9GC/Wvam4U+lWYajlVVnLqasXk6
         UPorWnUWaaRoZRjVwGkqHcGoaNqxSRYhIwC9Boc53K+ntlZaYElDxNEiId/+x0hc/Nyg
         /XoxRk2YrYa9PdRX+QVMkKKKMeOnWdFuPMVbZ1p1c/KHaJOZXzjJbW7NSwqx28BkOWFr
         mmCjJ3LWtw8c1Cfa3sJVLJmSTcckOChREJ+OycR+gDO9q0d+bEuEbPwkZ5mkVTBKP97o
         c0NHVyYb3JUQHHyTaHg/MmpXTxwfsYiig75XjF11AS043YKinCvaozPGM/QomGAuDECe
         qOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS4CGt4xQbj4YTZZdRD6vl79hpxZ1230M0Xwcup4JyVQ6SCoH4NZE15PJa/a72Yh0YJrD2@lists.linux.dev
X-Gm-Message-State: AOJu0YzGiRROZHXr4pP6oD6il4Ff9a5YhlAJ9S25tKXKr6C4XqwRVEcq
	wOzxwdL+8Py1e7fyJc3eVIrrFqZw2qivZpcpkfBkgOIf+Ae5v+VhDWKt
X-Gm-Gg: ASbGncuQGT9VUSIeob5n1m9Eeb4MixmF4K5PxKn33OPy74/Y5iTHxtSh8yggnIChco1
	QLJOA208/1uG5hEPK7Mc/Bx2wMCi0C/EOwM7Ky01Xt4+MKt6PplTQk3t1rm/BTJ+JO19GxATPs+
	qyNCXjzumSCYDi8V2WoQDyn2lR05u/GjcsljqRGDNnGAhSkxtYgK2LCW/exSaXkyukHznaO+To6
	GH3P/I3GMH0LeEnXDAgtPrAaYrPVD+f4Dai7JVt8JKuvNWWwCrSHvHjAiE8Jmeky4h7PloElx08
	e556OV1ST2XulBvisPJPZk98MsZc7pdj3ygz9/5JJU+7AnaaPqNNiQr6NKPzFgdYSrZ/WGkLJRC
	5hUwoMgcATa9v7o1vhyLcQ3vQ/NyZ5bcKPBfI3ZmyUF/WcKJa9Je+KtqiFZmuY2EvwHe2Hh8DZ/
	/q8rbYAIiKe32Q
X-Google-Smtp-Source: AGHT+IHDDJtu8kjLF/zH3u5N6Plv3lcX73uCNtxm0f/WjVKubUEQQc4jhA6eH6Rs5519YEmB38XtbQ==
X-Received: by 2002:ad4:5945:0:b0:704:9618:51d with SMTP id 6a1803df08f44-704a7065aacmr172694506d6.39.1752466853319;
        Sun, 13 Jul 2025 21:20:53 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39450sm42915536d6.75.2025.07.13.21.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:20:52 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id C2CE5F40068;
	Mon, 14 Jul 2025 00:20:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 00:20:51 -0400
X-ME-Sender: <xms:o4V0aKiB1Yw7Ddrs-kWGfndprpgdgr2L4ZwzQ1bpn3xOScxnW6O2kQ>
    <xme:o4V0aMiNFkqdufkeyTRzHerJ32MkF7t-qTIVUX8DLu3rg7sM6jRmbbBVMvhspcwOI
    VJwbZM5_uDHTD6gmg>
X-ME-Received: <xmr:o4V0aGptazfK8y3G3bHmO2t0DIBwc0Ognkz1pQIMmEt5dYQJaZYAULhgcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehtdelkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgt
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:o4V0aCx8tIrHfRplnrskijHUbnjmpbNmW6HQXSp3MqqCbl2dGVu6Sw>
    <xmx:o4V0aFy-744haymfbCRLccCE2OUtfmYIzSVyeymjGwgmyHIbByiZIg>
    <xmx:o4V0aKbLjg8NsprenSkNmhPeXiNXzO378ZXxij6O6bhpTn9N15w8jA>
    <xmx:o4V0aGnjfOsVAqLEaOGud3_0YQJQHJ1DbIekyMfBTdy0tpC1dB3OkA>
    <xmx:o4V0aPEK9yjyqaJ155JtUU2KwuH3hswo_x5ZsYn5jREZow-089i7qi-2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 00:20:51 -0400 (EDT)
Date: Sun, 13 Jul 2025 21:20:50 -0700
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
Subject: Re: [PATCH v6 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHSFosU8tS1Oqj4l@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-7-boqun.feng@gmail.com>
 <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>
 <aHEiE0OoA3w1FmCp@Mac.home>
 <DB9GDOR3AY9B.21YFXYHE4F0MP@kernel.org>
 <aHFrUa3VWaKTe0xr@tardis-2.local>
 <DB9J3GBDB2UK.2OHWT5AI5DXFD@kernel.org>
 <aHGAhbmgsb9f3ImR@tardis-2.local>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHGAhbmgsb9f3ImR@tardis-2.local>

On Fri, Jul 11, 2025 at 02:22:13PM -0700, Boqun Feng wrote:
[...]
> > >     pub unsafe trait AtomicAdd<Rhs>: AllowAtomic {
> > >         type Delta = Self::Repr;
> > >         fn rhs_into_delta(rhs: Rhs) -> Delta;
> > >     }
> > >
> > > Note that I have to provide a `Delta` (or better named as `ReprDelta`?)
> > > because of when pointer support is added, atomic addition is between
> > > a `*mut ()` and a `isize`, not two `*mut()`.
> > 
> > Makes sense, but we don't have default associated types yet :(
> > 
> 
> Oops, we are lucky enough to only have a few types to begin with ;-)
> Maybe we can use `#[derive(AtomicAdd)] to select the default delta type
> later.
> 

Turn out I could give `AtomcImpl` an associate type:

    pub trait AtomicImpl: Sealed {
    	type Delta;
    }

and then

    pub unsafe trait AllowAtomicAdd<Rhs = Self>: AllowAtomic {
        /// Converts `Rhs` into the `Delta` type of the atomic implementation.
        fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
    }

(Yeah, I named it `AllowAtomicAdd` ;-))

and I only need to provide `Delta` for three types (i32, i64 and *mut
()).

BTW, since atomic arithmetic is wrapping, do we want things like `impl
AllowAtomicAdd<u32> for i32`, similar to the concept of
`i32::wrapping_add_unsigned()` ;-)

Regards,
Boqun

> Regards,
> Boqun
