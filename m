Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5642E3704
	for <lkmm@lists.linux.dev>; Fri,  4 Jul 2025 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751664145; cv=none; b=aswgbw8YIVzeQLaEqQe7QLXlmZkcJokdownDwyUvAsyE0v2aeYiIbe8s9K70k+Q5l0s40tdGbUud44y8KPVbqMvrucw4en6fIeb6VHKoeTCjC7FptMnNQOwpkM15jBfK/tmwNnmAMwGikQEB/GZ2yfPKtDld6Y+u8R575jkJp6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751664145; c=relaxed/simple;
	bh=nEaL1d/qgCL0Q1cP7dkEJ83Ce260S2VpV2ACqoM+q3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOmxmkGZYhd8R8TgloDGqxkSRRKrjZXvbiw+FW4DR5mmP65lgL7A5rcemjx0So9zBrGqHOxDD+esRGdC+QTqS4oslh5rqWuNE/uMDZTDT9QucIIOFd2lIdlfJ7PMUhTCCseVKykVOReu2DinbP+GNDDksKLT9D0JWjhsPLpVilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U66w22z9; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U66w22z9"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so13511056d6.1
        for <lkmm@lists.linux.dev>; Fri, 04 Jul 2025 14:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751664143; x=1752268943; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=skDBk1uIw+9b6f6fiqiCtEJpFIHpZm8P5PILwC7Y1+o=;
        b=U66w22z9EfsCFITP8vu2Gm2irboqO8qvq4dB/gpvH9IHmA/yU7fzwjws+UnWEQDfCO
         emwIdChkybd7jreWPL2UjsSwYIr67BMla7nbPJpGmg6V/GBa8BI0voj4eS3BQpnLEONO
         QhnxvyhqPAxfTVtlVcvKn0nRU2lhY2c3Hh6b4G4/3TzMLJqe/kDNMkKuDjhFCoRr/QNM
         MgIyoSsnrzO8ca19z6oaSsn8pOVKoF7y+5oSbqbjzUexSzrxwvm99JpXfVpWSqE03aRd
         ImB/bdxjdcyvyaQxIhv5rQhBFgudBblun9JYwVjFKeHlxP91Y4+MkluOoPJ88yw6D3OR
         HTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751664143; x=1752268943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skDBk1uIw+9b6f6fiqiCtEJpFIHpZm8P5PILwC7Y1+o=;
        b=vsVdgjiVDxa2Mv4aP2tqwdACu/1FAk2/NaxHix1eZmz2B9S9E/QeK4AYrZ+cfqNMas
         wI2YsNsIzb1AJckypsVL8Ny5RglX/iaa58dlcZRZwAntqBjau9mrBnR7CpuY6Skv7Rkp
         wFPIj1HWPLsy7JnifzISa4xmFmq6ctjymA2tv6M+EAnJ26nYftNr1WddXHl3/oHCsMw3
         kyL+Osyv/wt/O3XJp2YrLRv2XpGmRuep3B5832MusNoGHIAirNhn8ImIXZCrmpsJ2eeX
         1fu99UwZIdujKZyJNdy8akvwBJI7zmikeVjNqYNYfWHcwAPwhG2X8LuNBzFmBQm4HiwD
         s9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa6xS1oZXQXoBuCQ5wg9N2AZ+J+5A3jNV39Kf6HJYhGAdt92tl037kCEvBOJnqo9x3L51M@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7Kt88o2yY/210VRAl+CjAPasy66v3nqVrpqc9ukTN/CuhZUEK
	IUihRZ8lrlaUpSQYig91WyXUQr0/ajoJWk2i9PmC/hKFijyy26K1rcDY
X-Gm-Gg: ASbGncsQnltmtQH14fEZL3u6e1v5lqF9MukJA4W27Kr+pDtk00HkW5o+7Zs7Qe9H8p6
	LKYst6UqoX/NVfe7LbspvlwnUlBr4z/bmC8+xJQ1eVIqlk97/biV8ocMewuFBIIeVFa440WpIY7
	JwSY1wh15U8rB8Vmd8TUMsuVLUE+yCbuDZ4TVokmh3dNFLm/m77Nq8S6GJHg/JraqRQMbt/mdMl
	0DCurRPvJmjtQZYYKo/m7uPAUJ/uXAvWKpDCcRTQc8Sh2FOfY4+eQ3GM6ofgrvVWkZA3g833kx1
	kTnv1ajkR0TxThzsSVf8AxFzIZReWUGBtZyCvmc+ME22fIdDsyIZskaSS0YqAkcPkkvAfRQD9uy
	YYlosEhSHnqqq4jQW0lCF6qkYxBd97PrlbgPBNtJUWMHh/RiB4dOY7NYlSdtq13o=
X-Google-Smtp-Source: AGHT+IGunNurUZuGfLKh7RTnWW6InBf9AxO9MfDXUAsw41fRhH2n1BJWnlvbpSiVAlbeQu7yWvUHfA==
X-Received: by 2002:a05:6214:e4b:b0:6fa:fcb0:b88d with SMTP id 6a1803df08f44-702c6d79cf4mr57197946d6.28.1751664143058;
        Fri, 04 Jul 2025 14:22:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d60227sm18418456d6.108.2025.07.04.14.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 14:22:22 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1E79AF40068;
	Fri,  4 Jul 2025 17:22:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 04 Jul 2025 17:22:22 -0400
X-ME-Sender: <xms:DkZoaGN_VEQiaYMQojeuQZfWu0MyO7BGl4xG3rS1l2-qH8HtwA8FFA>
    <xme:DkZoaE9Lp5NSOo6-wEH9E13E8XnezGnywo_xVW4OtkhdcJ8y6hmRGQoF658HzHmnW
    FZr3vESdqNRaf1kqw>
X-ME-Received: <xmr:DkZoaNRiGBKl3c0RKRTLKeOzDMmkXDTpC0cuUEgy992ZZItHss3eKljn9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvgedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsjh
    horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:DkZoaGv4f9Wf8e41z6xQTjDTU69dBwrjAekFgRMSc76ObJV28-eQWg>
    <xmx:DkZoaOerlOm7YTt_jpnVkztHh6MSAKZ2nkDS53NEuLjb-pgePFy0qg>
    <xmx:DkZoaK1XmVKo6HMBkIYzxfZwSntpOTMKa_rZiYxv2tGWoVI4ORmo5w>
    <xmx:DkZoaC9UKTx-yjhnuNgig3QjeyMXJA9zIen7wipn1CIhtK7aWaY4xQ>
    <xmx:DkZoaN_ePyUlcCTEcACuMKAJdmMh4Jpa8p2_sBM02IVNuu3qZfeUYxlu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 17:22:21 -0400 (EDT)
Date: Fri, 4 Jul 2025 14:22:20 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <aGhGDJvUf7zFCmQt@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <20250623193019.6c425467.gary@garyguo.net>
 <aFmmYSAyvxotYfo7@tardis.local>
 <DAUAW2Y0HYLY.3CDC9ZW0BUKI4@kernel.org>
 <aFrTyXcFVOjWa2o-@Mac.home>
 <DAWIKTODZ3FT.2LGX1H8ZFDONN@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAWIKTODZ3FT.2LGX1H8ZFDONN@kernel.org>

On Thu, Jun 26, 2025 at 03:54:24PM +0200, Benno Lossin wrote:
> On Tue Jun 24, 2025 at 6:35 PM CEST, Boqun Feng wrote:
> > On Tue, Jun 24, 2025 at 01:27:38AM +0200, Benno Lossin wrote:
> >> On Mon Jun 23, 2025 at 9:09 PM CEST, Boqun Feng wrote:
> >> > On Mon, Jun 23, 2025 at 07:30:19PM +0100, Gary Guo wrote:
> >> >> cannot just transmute between from pointers to usize (which is its
> >> >> Repr):
> >> >> * Transmuting from pointer to usize discards provenance
> >> >> * Transmuting from usize to pointer gives invalid provenance
> >> >> 
> >> >> We want neither behaviour, so we must store `usize` directly and
> >> >> always call into repr functions.
> >> >> 
> >> >
> >> > If we store `usize`, how can we support the `get_mut()` then? E.g.
> >> >
> >> >     static V: i32 = 32;
> >> >
> >> >     let mut x = Atomic::new(&V as *const i32 as *mut i32);
> >> >     // ^ assume we expose_provenance() in new().
> >> >
> >> >     let ptr: &mut *mut i32 = x.get_mut(); // which is `&mut self.0.get()`.
> >> >
> >> >     let ptr_val = *ptr; // Does `ptr_val` have the proper provenance?
> >> 
> >> If `get_mut` transmutes the integer into a pointer, then it will have
> >> the wrong provenance (it will just have plain invalid provenance).
> >> 
> >
> > The key topic Gary and I have been discussing is whether we should
> > define Atomic<T> as:
> >
> > (my current implementation)
> >
> >     pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> >
> > or
> >
> > (Gary's suggestion)
> >
> >     pub struct Atomic<T: AllowAtomic>(Opaque<T::Repr>);
> >
> > `T::Repr` is guaranteed to be the same size and alignment of `T`, and
> > per our discussion, it makes sense to further require that `transmute<T,
> > T::Repr>()` should also be safe (as the safety requirement of
> > `AllowAtomic`), or we can say `T` bit validity can be preserved by
> > `T::Repr`: a valid bit combination `T` can be transumated to `T::Repr`,
> > and if transumated back, it's the same bit combination.
> >
> > Now as I pointed out, if we use `Opaque<T::Repr>`, then `.get_mut()`
> > would be unsound for `Atomic<*mut T>`. And Gary's concern is that in
> > the current implementation, we directly cast a `*mut T` (from
> > `Opaque::get()`) into a `*mut T::Repr`, and pass it directly into C/asm
> > atomic primitives. However, I think with the additional safety
> > requirement above, this shouldn't be a problem: because the C/asm atomic
> > primitives would just pass the address to an asm block, and that'll be
> > out of Rust abstract machine, and as long as the C/primitives atomic
> > primitives are implemented correctly, the bit representation of `T`
> > remains valid after asm blocks.
> >
> > So I think the current implementation still works and is better.
> 
> I don't think there is a big difference between `Opaque<T>` and
> `Opaque<T::Repr>` if we have the transmute equivalence between the two.
> From a safety perspective, you don't gain or lose anything by using the
> first over the second one. They both require the invariant that they are
> valid (as `Opaque` removes that... we should really be using
> `UnsafeCell` here instead... why aren't we doing that?).
> 

I need the `UnsafePinned`-like behavior of `Atomic<*mut T>` to support
Rcu<T>, and I will replace it with `UnsafePinned`, once that's is
available.

Maybe that also means `UnsafePinned<T>` make more sense? Because if `T`
is a pointer, it's easy to prove the provenance is there. (Note a
`&Atomic<*mut T>` may come from a `*mut *mut T`, may be a field in C
struct)

Regards,
Boqun
