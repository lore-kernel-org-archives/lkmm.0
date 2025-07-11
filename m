Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A32D77EB
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242328; cv=none; b=qHgNyhauEPvS0RI4V8HZy8FJeicafT6fZGAQgTZs7ry0SMZDFUuy9p0JZ/1Rqih04GDlt3el/50XL1NegPZPni5rGu6oZFPz/padna2AXZVJ1QWVi6XPKVT1HjR1vTu3jmqrTMjUCP5rjV+OSRA91Z5SqAzR4Kf8bniG8It1KDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242328; c=relaxed/simple;
	bh=OMImzd5St3+4oJum8FOTYfx97qpQjt+/rd8JkDqKBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH5gAlAXYS3b8CVzu5hoDERcn/mxNiJDx45vESHS0dy+cHdl9vJGV2BeS0VJ92LHyaMggLhiKE6EKP2d1pZ0B3b2BBaQvBXI/SGAUnk6mh2B+QyfY3u8JyVLLcGT1HujEz4fEbbfvkevlLfj2brimX8ndftOMUqJpY7nroLtrmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Ig3EOy; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Ig3EOy"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7dfd667e539so58018385a.2
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752242326; x=1752847126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbB1R0UF+o1ox6MiAWxgQBqNVgm6z/q3Tj8d+69HVOg=;
        b=D7Ig3EOyFpIU9kRpv1BJVdVB54gd9ywlEM4zkv97+6+kTrLJj9PFHoay0Mgcekk7/r
         80Qh64GE0029H38cQwZXOqxnw1K2ZxFr/um8RCIztDVdfyjDni+EmFf0ysKwuFLawEgs
         Ry8FCJ4eVej+lMVj7NkTghoSZMYUzkEXvdhBHjfkci23Lb5TnHMEDh6w23mr2K8vfNCW
         k8ZqyUvlR966G0ZQR0v55cpK71BxtxtgFi3Fl151ipnsawWLQ5bBDAp90Skok5xNjluJ
         xBEZ37iCIgkWit2Cr2d6h9YO/mbAUTz4Abtx32A8Z+G8W+9CPOCy5/9Zx5IOaEmBDkIN
         avmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242326; x=1752847126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbB1R0UF+o1ox6MiAWxgQBqNVgm6z/q3Tj8d+69HVOg=;
        b=YmxrVLMTZIJHnzSaDAWDyXxSvXoK7BsepgF7rT8HsT/eu/u6oY6WmIvmg6Dp7MSUZS
         RBX95SdOoCHIpZBC64MHkTA7eX4XERfBb39THCC1HZQ2+/NTu967Z74XYJj0ECT4bCtI
         9mDKp5kehVBforFenaPtdum6C/iJZUFOa2mK6HzAeBk5iNlgnfTNL2ZgS8t0dcIRLugb
         mcqfpfrPQ1++AcrB0MrA6QG4iTezDKgBHZGwndwSqS9xWCyzai2b99O3nUz2JkuSQ1lv
         F+LJybMFSnO4HryykdiL3fqmqnD0hfKqCTsqbaUg5ACc5pmICxJqa9Uuvt6DkoCep790
         Xl7A==
X-Forwarded-Encrypted: i=1; AJvYcCUJHSSmZyhjEKEpelHXFlEJ8RROUc3Aulj7SIdu1leFKwUYBPFx9hD3anw8QKuOxCZXTXJ2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcg8bF4Lhqbx6xi/B9YyGxmvFY+v9eYDEeezv2ol/vl7OCU/5y
	Ia/EARZxFiSDkAJsYFd+1ar+yKa2YgetO+BFlwfl5fI9HiiTZ3Ta5HuA
X-Gm-Gg: ASbGncueT5L4aK4/16Qa+cd0iCkeI4E7u31hS4oCgRb9rdXB0d/fTunQrjOozsEZ/d2
	aBkH/8TBGSBBQh779UOYGFrMgLsGmNJKo1bo9orlhtF9LTis3y2kK+JstPpOEmaqsNB6qDHwb6b
	SjidvNvJUDpXlc28LqI0xbloxkMKTGtZY0GLyomu6ODiHpGlotixbsCj9NInU444RUhkNlAjp9s
	Ti5oRPhZJqBiCXXt8yOC3rTjIaZaqV4hH7liQjZgwxPrbOLB+NAHJt7uUCh2Z4q+3MhqJQBxr7t
	8KDEXD8dUFQvtMSRpE1FwKfe4lNElYfAqAEjP4uT1/5iPAmCZAKa1VkrRilEg8GQ6jpRliINV1S
	mMbF83mPLs6Ln5A2TcwpYjg0QstCkEt360jQ+RqYme7WXUKmCQ0NRK1sRfj0DycmyBzKe8m0q6O
	upkCstzVCwMDQ5gm058INDqHY=
X-Google-Smtp-Source: AGHT+IGYsuwtcaD9p2qDFZIxYfEles6z9LH1aIfFLJPEix8UE5nR53U/JeQa/L99WJAyA5fMWvRKnQ==
X-Received: by 2002:a05:620a:454e:b0:7d3:913e:802e with SMTP id af79cd13be357-7de0709ba58mr438503285a.41.1752242325406;
        Fri, 11 Jul 2025 06:58:45 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde32bfa7sm223207085a.55.2025.07.11.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:58:44 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id BAC67F40066;
	Fri, 11 Jul 2025 09:58:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 11 Jul 2025 09:58:43 -0400
X-ME-Sender: <xms:kxhxaLlsV-anhNMiiyUlFT22U9-9LUCCQZNTr4woWaphIem-uTcXzA>
    <xme:kxhxaAXqRJHEnyBVsTvZkqos9D2BzY_CwrKC4JwQHOMcOSHC8kM7L5OpgG-790LN5
    fNsr3zuwMnjjmxMHw>
X-ME-Received: <xmr:kxhxaGOBQxt9FWosXRZ_hg6wfSWqBhirRoMMWi4m3dgHmjPvTyTJ6hSvvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepjeeihfdtuedvgedvtddufffggeefhefgtdeivdevveelvefhkeehffdtkeeihedv
    necuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsihhnsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhm
X-ME-Proxy: <xmx:kxhxaDGzMgemcgwMEXssPgVR4J4mm63RviZPLA2049MJNzFnHKlcUg>
    <xmx:kxhxaH2ptwQuN7CKH-2WJ8OdcFC21z16fjUyZJFPxmAXoMnW2y9C3w>
    <xmx:kxhxaLOOWTN36ezpGe6XeIrguqFKu5iAs7doiq57r9UcZIdnOyNUwA>
    <xmx:kxhxaPKdC2pDWJPM2kY1dui55WKKi0Ay5NPfbut5g-3-CmuWmT_Fww>
    <xmx:kxhxaEaNnwsDaJILvhrkG4sW7x2jetU14s0hhM4uy53WktXBz_oNSdnZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 09:58:43 -0400 (EDT)
Date: Fri, 11 Jul 2025 06:58:42 -0700
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
Message-ID: <aHEYkg5K7koUohRo@Mac.home>
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
> On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
> > new file mode 100644
> > index 000000000000..e044fe21b128
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/generic.rs
> > @@ -0,0 +1,289 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Generic atomic primitives.
> > +
> > +use super::ops::*;
> > +use super::ordering::*;
> > +use crate::build_error;
> > +use core::cell::UnsafeCell;
> > +
> > +/// A generic atomic variable.
[...]
> 
> > +///
> > +/// # Guarantees
> > +///
> > +/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race,
> > +/// this is guaranteed by the safety requirement of [`Self::from_ptr()`] and the extra safety
> > +/// requirement of the usage on pointers returned by [`Self::as_ptr()`].
> 
> I'd rather think we turn this into an invariant that says any operations
> on `self.0` through a shared reference is atomic.
> 
[...]
> > +/// unit-only enums:
> 
> What are "unit-only" enums? Do you mean enums that don't have associated
> data?
> 

Yes, I used the term mentioned at:

	https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only

> > +///
> > +/// ```
> > +/// #[repr(i32)]
> > +/// enum State { Init = 0, Working = 1, Done = 2, }
> > +/// ```
> > +///
> > +/// # Safety
> > +///
> > +/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
> > +/// - [`Self`] and [`Self::Repr`] must have the [round-trip transmutability].
[...]
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_read*() function:
> > +        //   - `a` is a valid pointer for the function per the CAST justification above.
> > +        //   - Per the type guarantees, the following atomic operation won't cause data races.
> 
> Which type guarantees? `Self`?
> 

The above "# Guarantees" of `Atomic<T>`, but yeah I think it should be
"# Invariants".

> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr()`:
> > +        //   - Atomic operations are used here.
> > +        let v = unsafe {
> > +            match Ordering::TYPE {
> > +                OrderingType::Relaxed => T::Repr::atomic_read(a),
> > +                OrderingType::Acquire => T::Repr::atomic_read_acquire(a),
> > +                _ => build_error!("Wrong ordering"),
> > +            }
> > +        };
> > +
> > +        // SAFETY: The atomic variable holds a valid `T`, so `v` is a valid bit pattern of `T`,
> > +        // therefore it's safe to call `from_repr()`.
[...]
