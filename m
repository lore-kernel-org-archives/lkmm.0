Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61A1D89FD
	for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 05:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750655992; cv=none; b=fqioGgP9O3P5yeg0si114mBNOy6p0yzr/7rZzJNVdRUyCiCQhgd3w9jEst/sxALn5KPldAqrtR/M5efzYh0vSub5w2NnfjCYpQGLuSb9mHPIL2lgmYrdPBw6ev+mQ7yNmPErWpAIPJwbt0YwF+gRGKA8HxEaH7vqur1kCejCYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750655992; c=relaxed/simple;
	bh=aKgrAEOXNkbld4Ie9Ekp8+h4jmc5lia+a7Els9LYiZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpajnGMJM0wcdshoGKEukvHLIYpEBoalOs046RBI3+WY0xI/vZi15ctM7DmgTcSa1OOcawOxoCii7aq9ZjfWnQjoZTPjyD8PLM7BRu2MHQDr7vCMoWh3Poq75Rb5R/LgxHg5xBXMfZmuf472oHyHZpiC9pQlNME85y5nb4D/ewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhfegGfl; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhfegGfl"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3cc0017fdso450637785a.3
        for <lkmm@lists.linux.dev>; Sun, 22 Jun 2025 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750655989; x=1751260789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73Dr4y2+KJ1iK7WI0eT42/Q1bwAgdohWfah194RDmnM=;
        b=QhfegGflNzUc0P+ewpMDfPeiY45ck1QWCfVdMpUoqzZtHovPr9VXR/pn/ELtZcE09N
         Q10jDxO4TsmqR4W4ClJl7GqJ+x6PuD83TGHfslHgvuDe4Us8LuiayGyyxSmVkiMrNRtX
         DJ4/3hgId4LquIstaMRRIaqBLtlkGL8tjlQiCpZzC9lAdEFzQn9Lx+PT5YOHREjggC59
         iszCqDqeIR4IiB7r5CDle1HoQb6cWt7oC/at2qMNUKWO3PAOZPVvdd0YXjGxijcDOlyB
         yMaxBEU1nyQChVYA9f+853UwKThiQtUWADm9OPg8kxeQj3ZJeYd89XPA/wnvuM8yR5VH
         POZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655989; x=1751260789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73Dr4y2+KJ1iK7WI0eT42/Q1bwAgdohWfah194RDmnM=;
        b=mhgloo+s27aFc7ihv48sHp5NOntVEDKnlv67RpNIzM61j4ewfmPMN3aDmFsUXKb1lV
         /UO28y1FTe9rLx0jFhclBHONhOvUIx3Nn2h3LktquDJbXbwgGUavKuPLDk8En2/HQ5Z6
         6zlk7ic1dCegsvYx7br5am0J+aBNJGkNrwh+3P8tfxkBr7j82PxZ8lB3hscKuZS5VnWL
         Bx+uiNIInQdLjAIaAn0yIywuNosn3QidhkpwXWJWj+hU7+D6HJdPDedFE9/l+YgUHTO7
         hftNpi/6sSOtuYsOm9RBz2oplYctxR1oJp6wIzi53J+uaOlPh7FwblE22qhMXqTY08c2
         26jg==
X-Forwarded-Encrypted: i=1; AJvYcCV0thDm38r+Dd9ME8KCch6j9f5Cn04n5xamPkIbpvcXaJ11452tqMXYqjkhUqDCGSKVrPTG@lists.linux.dev
X-Gm-Message-State: AOJu0YzPGfyojdAH7YJhkJGv0dHH6v+jlnmM4S890c0SbwvjbCIG1ISr
	DaNDbkPKZeZxFa8c02MSFFYelbG7+Cogeo2B51VLkRxxdeysPOTQSVz6
X-Gm-Gg: ASbGncsGZ7A9fUN1sR5NRikPlGajrwIPuMVADwBQYkNXRsnAT9/o39Q2ncyYlZv8Knf
	I70uyZPRxEH/R1Po9GA1OEemrK1D4rSD1kRTv1b5KpaUZhRZerJOCwmCb7vNbpuHqC9htdStRHi
	kuURmsAbJLcnn71HW6R86LAPZhzPqNOCkYSN6hUw4suYeFqYt4oeSI9ptlcKQLJqG5aebUk4h6m
	uPV4KQGKu6pga4Ri8uqH5wQar2LiihOrdC74BZ+XpnH4O1SD+HSs/uTh6HNq5mNEanv1knEB7iv
	l//xTETHGlmpTW/fbGIqJ38DJEj8RCL4W3WnHupi2pnsEmJVYIGDk61ENbDxVlOBlBbXFpwLxCL
	0QoXZZfjdp1NHzmCiV+rM99X0T8ZReXMBKJJb+ef1ohkOCMJvodXb
X-Google-Smtp-Source: AGHT+IFUgu9MTo+o7ZlLXs0n5yagf8iorT7usjWfEJ1eCDQe/qT5Km51R5iMbip3uVonSVRuA+licw==
X-Received: by 2002:a05:620a:3195:b0:7ce:d04a:83c2 with SMTP id af79cd13be357-7d3f9947bb5mr1577684685a.50.1750655989132;
        Sun, 22 Jun 2025 22:19:49 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99ef89dsm350864385a.64.2025.06.22.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:19:46 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFD401200043;
	Mon, 23 Jun 2025 01:19:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 23 Jun 2025 01:19:45 -0400
X-ME-Sender: <xms:8eNYaOY2avI1mY8STzEhUawgU0L0acMogLsfbNoNcWRrr-3579UK4w>
    <xme:8eNYaBYgivwdmI9nd8B6j7DioDjCoQ9iVGxrQvO65dv1Re42XiALEYpfxCOExuah3
    CgNznusMSmJjmmphg>
X-ME-Received: <xmr:8eNYaI_FSz-Vcu3KHDcWpVh3TjbEdrWWutWiiFI-h4K7lIYq6GkpCe_Pdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduieduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepudejleelueduvddthfdvheeiueehkeefudeuueejjeffvddtuedtieffveekleet
    necuffhomhgrihhnpegrsghovhgvrdhsrghfvghthienucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidr
    uggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjohhrnhefpg
    hghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:8eNYaAoEeW39R8-LVH2XQRGZ5W-qOkgSJaW1MkjJ7pJyDGGFgvhx-g>
    <xmx:8eNYaJp4o_fKR_jZRzGRJNLlyl1XUiiGcThvaicBXNHKKGd99clZsA>
    <xmx:8eNYaORR04m6kwoJPaYJKJaGiExP94zNm0Q8ny7hASbbJo-ELH-rTw>
    <xmx:8eNYaJpHWjNg7b4yB2tg1MWQqaT7sfapho6ApJzliU6Cyyom9kkgLw>
    <xmx:8eNYaG6lbZBaf_Lsa2hy8Ci7JdL668bLkweWgMr7rNSwLt8YqcQ9F8BX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 01:19:45 -0400 (EDT)
Date: Sun, 22 Jun 2025 22:19:44 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <aFjj8AV668pl9jLN@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621123212.66fb016b.gary@garyguo.net>

On Sat, Jun 21, 2025 at 12:32:12PM +0100, Gary Guo wrote:
[...]
> > +#[repr(transparent)]
> > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> 
> This should store `Opaque<T::Repr>` instead.
> 

"should" is a strong word ;-) If we still use `into_repr`/`from_repr`
it's a bit impossible, because Atomic::new() wants to be a const
function, so it requires const_trait_impl I believe.

If we require transmutability as a safety requirement for `AllowAtomic`,
then either `T` or `T::Repr` is fine.

> The implementation below essentially assumes that this is
> `Opaque<T::Repr>`:
> * atomic ops cast this to `*mut T::Repr`
> * load/store operates on `T::Repr` then converts to `T` with
>   `T::from_repr`/`T::into_repr`.
> 

Note that we only require one direction of strong transmutability, that
is: for every `T`, it must be able to safe transmute to a `T::Repr`, for
`T::Repr` -> `T` transmutation, only if it's a result of a `transmute<T,
T::Repr>()`. This is mostly due to potential support for unit-only enum.
E.g. using an atomic variable to represent a finite state.

> Note tha the transparent new types restriction on `AllowAtomic` is not
> sufficient for this, as I can define
> 

Nice catch! I do agree we should disallow `MyWeirdI32`, and I also agree
that we should put transmutability as safety requirement for
`AllowAtomic`. However, I would suggest we still keep
`into_repr`/`from_repr`, and require the implementation to make them
provide the same results as transmute(), as a correctness precondition
(instead of a safety precondition), in other words, you can still write
a `MyWeirdI32`, and it won't cause safety issues, but it'll be
incorrect.

The reason why I think we should keep `into_repr`/`from_repr` but add
a correctness precondition is that they are easily to implement as safe
code for basic types, so it'll be better than a transmute() call. Also
considering `Atomic<*mut T>`, would transmuting between integers and
pointers act the same as expose_provenance() and
from_exposed_provenance()?


So something like this for `AllowAtomic`, implementation-wise, no need
to change.

    /// Atomics that support basic atomic operations.
    ///
    /// Implementers must guarantee that `into_repr()` and `from_repr()` provide the same results as
    /// transmute between [`Self`] and [`Self::Repr`].
    ///
    /// TODO: Currently the [`AllowAtomic`] types are restricted within basic integer types (and their
    /// transparent new types). In the future, we could extend the scope to more data types when there
    /// is a clear and meaningful usage, but for now, [`AllowAtomic`] should only be implemented inside
    /// atomic mod for the restricted types mentioned above.
    ///
    /// # Safety
    ///
    /// - [`Self`] must have the same size and alignment as [`Self::Repr`].
    /// - Any value of [`Self`] must be safe to [`transmute()`] to a [`Self::Repr`], this also means
    ///   that a pointer to [`Self`] can be treated as a pointer to [`Self::Repr`].
    /// - If a value of [`Self::Repr`] is a result a [`transmute()`] from a [`Self`], it must be safe
    ///   to [`transmute()`] the value back to a [`Self`].
    ///   that a pointer to [`Self`] can be treated as a pointer to [`Self::Repr`].
    /// - The implementer must guarantee it's safe to transfer ownership from one execution context to
    ///   another, this means it has to be a [`Send`], but because `*mut T` is not [`Send`] and that's
    ///   the basic type needs to support atomic operations, so this safety requirement is added to
    ///   [`AllowAtomic`] trait. This safety requirement is automatically satisfied if the type is a
    ///   [`Send`].
    ///
    /// [`transmute()`]: core::mem::transmute
    pub unsafe trait AllowAtomic: Sized + Copy {

Thoughts?

Regards,
Boqun

> #[repr(transparent)]
> struct MyWeirdI32(pub i32);
> 
> impl AllowAtomic for MyWeirdI32 {
>     type Repr = i32;
> 
>     fn into_repr(self) -> Self::Repr {
>         !self
>     }
> 
>     fn from_repr(repr: Self::Repr) -> Self {
>         !self
>     }
> }
> 
> Then `Atomic<MyWeirdI32>::new(MyWeirdI32(0)).load(Relaxed)` will give me
> `MyWeirdI32(-1)`.
> 
> Alternatively, we should remove `into_repr`/`from_repr` and always cast
> instead. In such case, `AllowAtomic` needs to have the transmutability
> as a safety precondition.
> 
[...]
