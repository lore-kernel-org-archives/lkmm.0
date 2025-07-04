Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7150E2E3719
	for <lkmm@lists.linux.dev>; Fri,  4 Jul 2025 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751668236; cv=none; b=ESs5cYK6gUtajU+ELEvCic/Yicw/ShFoc7zJw2GKNtAFL7XeFSOkSgoT+N0YeEwcpM3+iMXIOQHjxocJ4Z/35CervFTvIrdwrxHlNJ3HkiMYuVVR+oMdIn5Xo9Z/xS5QWf1m2W2EChsZKTQ/T9JRGuGX4SkKCzj60LGAOP5TSm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751668236; c=relaxed/simple;
	bh=V3QcC619cgfXh78rzL/aBg2aB9/ohO0hsNXEcmi7jVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfP8DA/nir6YTjzR82qZRfBwvqQXWyhrxF/GxguRpF3hnKI5GBH/bXK6EtQ6ZamVuz7GYAUa5EXoMbZZeVTc3gTtuGnkiX0ooWWe/9jIHvuB/fpjlRCyRQKgDYxBLIA2mT84L7BEqUaDQ62AEyUi6xl2N9/4Rqx2NVf0epdWSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng7jYETC; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng7jYETC"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a97821209eso14913131cf.3
        for <lkmm@lists.linux.dev>; Fri, 04 Jul 2025 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751668233; x=1752273033; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nefZOk+kep9tY/NwNpHy33HLJmnyE2SxXn/pEIOWo0I=;
        b=ng7jYETC0wJCJl9ukFyrufI94c85moH0kJnd2Fg7CejkkMPrx1W7ezNzHA/XqbEc17
         mHxdUT5W5Ahv8QCDEpK/MXHrBU16UpUDwK7XfwYepBVUAkA7NMUaf0ulqzB8GW5Mn1rO
         +031UYhzyG+Hmabvn5IsEI5moO19IfQ+zVI82W06kMXHP/B3Mkn/sNOKAWMogO/ANCuR
         55GknkzWLjhb+gHRUcpDc7d6kQ7aKLL/KqkDswhVR1gR7E3kK7VtJNmI3QzgNqhncCQG
         2VwKG/TaSZq/roZI9nLDCzVOiJt4SsZlEJu4TTvw9T1lt6uUE1GX+oJdR6P7OYpFID0z
         +ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751668233; x=1752273033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nefZOk+kep9tY/NwNpHy33HLJmnyE2SxXn/pEIOWo0I=;
        b=kfekIKc0nLSky7hnXrtabfrk4vJ7gamdfs235m/MUaL8OZzJRmN/wCB+dtujHUUzyo
         LGRUlC4DiNLQhyAdHGbwttQqQb+APxRxOZplwJSBYdKj+i1t/KWtSLPz19b7ENmDRb6y
         cxgL0tj48pw6Y/hwwUE7gSl90wApR1jrWOtFXgmpDH9Bgwp1YGySZwJLF4W4fVdZ3mt/
         W+iPqBnS78JULHFHg+GTotu+/8PJPUFimEnaH0S1SO8x2LbsdHvjwkJx2/BbmX3/pVMR
         +KDKIR5ejc9Lxmywes0Rie+mXitP1ABUv8n9FhIhrzU7fOlAhX7EdhDh58+JfuE2gWkY
         3w2A==
X-Forwarded-Encrypted: i=1; AJvYcCWsILta1lDbJtiyY0FBlwg5UVeLVOdizK7ie+nwKjSqpdWTyDp5jtxWZTQ8HP+xDkn0GXGa@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa1gmzpETCXB8VSB7mz++0XURTXWGKZ4j3vk2TEk3mMgz2/zzP
	Na1DWoQphol6Lsd/EEb8thO626xdt16CoRzhTlJWxiMAP9vfdW6VZ/dR
X-Gm-Gg: ASbGncvOfJB5frq3mnSX5yN6GMDluEknJ7DIxJYNIcvBUkwBrFBIxXPPCZLQBG5VScq
	zOCyEQ7v4ZUmT1ZkdyHj9XNPlmKURgL4sd3lIaUcVdfvkQ33o9lzW5JxnQ72qVZz26x+gHMvxUB
	vZcKBnBZm7qns5IEY0mAGf+jY2Ks7rKWi7SMaFSWFtS5EFhunXxuC828L8hMx2Rnit5Ibf79Eez
	56qEMYJSJf80f7erxnahnO3tWS6OcmUO8tRxD/6WoT1otRxp+bUeEQdtK2Im+J+ug9knrdascKC
	jhkRMmfI8FfYvX7DdIid4RQC/yapcd9LsL97KwcjILjCSPsedWDAauAMGVEMpZ2lB+GNVSIbHN4
	LB0oB4oi572zEefC4ac7BA4nKzOGKkFaqMVET+VRp8tWArzwzeW1F
X-Google-Smtp-Source: AGHT+IFnJ4ct/hxx/mmwZ2bUHzXAYzptMqwal+VpPBqDDwH0PZjIqpb+XOdkgZ9e4wftMhzLVM0iXQ==
X-Received: by 2002:a05:622a:1310:b0:4a7:8916:90a1 with SMTP id d75a77b69052e-4a9a6899b53mr8186101cf.22.1751668233254;
        Fri, 04 Jul 2025 15:30:33 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a8cdc4sm21340451cf.60.2025.07.04.15.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 15:30:32 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 31D3AF40066;
	Fri,  4 Jul 2025 18:30:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 04 Jul 2025 18:30:32 -0400
X-ME-Sender: <xms:CFZoaO-GPh2fHHcQH6PwAcrkEaTf2_aSUscH4mdq942y39pacroItg>
    <xme:CFZoaOtJJI_srAMpWdVsT6wsd-HXsluANWMCMX5XDZwmv8pMo1lzDTIJJqhS_DPsY
    KtWF_GRVHsmVXFlzw>
X-ME-Received: <xmr:CFZoaEDz4HLthLma9NjK3wJt0iH_B1gWteAR36KCEmykdbVLKIfwuUxMBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvgeefiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:CFZoaGd-Ngg2J_is3EvlOnZa18DL8bnwZO8Y7qRgI3TC8LBTiwcIsw>
    <xmx:CFZoaDMg_IkoqL9ztSvx9tdEyOtZWp2QETvrWmEtu7MXTDT8EDdEmw>
    <xmx:CFZoaAkkMq-iq10o_2KZv49PDGjG2v6Hm7NOIVc4fjqFTThdhmaiPg>
    <xmx:CFZoaFv_oh1m9T3oVhqQ0ctzKz7NH3w_3CEFCx7EMidGeDikzjrY9A>
    <xmx:CFZoaJtIZ2rsI4xuMUpWSQcaYtNqDguzJiAycPgXWyyTLmFXxNPAVyfb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 18:30:31 -0400 (EDT)
Date: Fri, 4 Jul 2025 15:30:30 -0700
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
Message-ID: <aGhWBp3IhfJDhPOs@Mac.home>
References: <20250618164934.19817-5-boqun.feng@gmail.com>
 <20250621123212.66fb016b.gary@garyguo.net>
 <aFjj8AV668pl9jLN@Mac.home>
 <20250623193019.6c425467.gary@garyguo.net>
 <aFmmYSAyvxotYfo7@tardis.local>
 <DAUAW2Y0HYLY.3CDC9ZW0BUKI4@kernel.org>
 <aFrTyXcFVOjWa2o-@Mac.home>
 <DAWIKTODZ3FT.2LGX1H8ZFDONN@kernel.org>
 <aGhGDJvUf7zFCmQt@Mac.home>
 <DB3M1FEMKVLN.1BDAD6WHDR7HG@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB3M1FEMKVLN.1BDAD6WHDR7HG@kernel.org>

On Sat, Jul 05, 2025 at 12:05:48AM +0200, Benno Lossin wrote:
[..]
> >> 
> >> I don't think there is a big difference between `Opaque<T>` and
> >> `Opaque<T::Repr>` if we have the transmute equivalence between the two.
> >> From a safety perspective, you don't gain or lose anything by using the
> >> first over the second one. They both require the invariant that they are
> >> valid (as `Opaque` removes that... we should really be using
> >> `UnsafeCell` here instead... why aren't we doing that?).
> >> 
> >
> > I need the `UnsafePinned`-like behavior of `Atomic<*mut T>` to support
> > Rcu<T>, and I will replace it with `UnsafePinned`, once that's is
> > available.
> 
> Can you expand on this? What do you mean by "`UnsafePinned`-like
> behavior"? And what does `Rcu<T>` have to do with atomics?
> 

`Rcu<T>` is an RCU protected (atomic) pointer, the its definition is

    pub struct Rcu<T>(Atomic<*mut T>);

I need Pin<&mut Rcu<T>> and &Rcu<T> able to co-exist: an updater will
have the access to Pin<&mut Rcu<T>>, and all the readers will have the
access to &Rcu<T>, for that I need `Atomic<*mut T>` to be
`UnsafePinned`, because `Pin<&mut Rcu<T>>` cannot imply noalias.

> > Maybe that also means `UnsafePinned<T>` make more sense? Because if `T`
> > is a pointer, it's easy to prove the provenance is there. (Note a
> > `&Atomic<*mut T>` may come from a `*mut *mut T`, may be a field in C
> > struct)
> 
> Also don't understand this.
> 

One of the usage of the atomic is being able to communicate with C side,
for example, if we have a struct foo:

    struct foo {
        struct bar *b;
    }

and writer can do this at C side:

   struct foo *f = ...;
   struct bar *b = kcalloc(*b, ...);

   // init b;

   smp_store_release(&f->b, b);

and a reader at Rust side can do:

    #[repr(transparent)]
    struct Bar(binding::bar);
    struct Foo(Opaque<bindings::foo>);

    fn get_bar(foo: &Foo) {
        let foo_ptr = foo.0.get();

	let b: *mut *mut Bar = unsafe { &raw mut (*foo_ptr).b }.cast();
	// SAFETY: C side accessing this pointer with atomics.
        let b = unsafe { Atomic::<*mut Bar>::from_ptr(b) };

        // Acquire pairs with the Release from C side;
	let bar_ptr = b.load(Acquire);

	// accessing bar.
    }

This is the case we must support if we want to write any non-trivial
synchronization code communicate with C side.

And in this case, it's generally easier to reason why we can convert a
*mut *mut Bar to &UnsafePinned<*mut Bar>.

Regards,
Boqun

> ---
> Cheers,
> Benno
