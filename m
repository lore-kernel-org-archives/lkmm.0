Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45962292B36
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242872; cv=none; b=hzpStt1xdCuaZWkniYzXltPZOXKlsJpuOFW5ZvdLt07zVOpkeRhAYQRLYg+4Q/ZlJKHbUfksUZvfVemcOTsVIUf2+fTlWLXKVvN0bP5CHlKib15kYnSBPw6VoLaUmqJgveLl790cNnitCsrjwd0cDpF7IjaP32AKQpBJcc31k1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242872; c=relaxed/simple;
	bh=BF2OSTIla5z7+/j39xtNnONebboZGK4PpqpWRQ9Eavc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f67FIb19g9J1v52Dr2fGROXSk45m+shl1w7rSwcA00DMME48KNQs1XQ3s5N2StEbOz1Gt2KwickwET+gPf+KBRpWBnv4zNekkQXaZxZGYBhTqHyeeNLdQuGZz8ndsbWXS3/MZBy59gG8XhMy+0BaQjhPYyBzvnAdt8R2kb0Wx1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O77Xc1Zk; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O77Xc1Zk"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d7f2600c17so339534585a.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 07:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752242870; x=1752847670; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1o4QOJvgTDr/+qtVAfA8JyDjjkgNnLqLh+c7VGsh8O0=;
        b=O77Xc1ZkF5Y78kMpIuowOFCCvea7O3wTTSyykwywlRECwYWdo1wKbNt1vqpDtkxk2v
         PXJXT4LoxStMu7TYvtigMKNak1LB4ByQZQ/OP7ql2Y2+Cc18bFttP2iabuQqB9xSa5t/
         dVrt52EsS9MsXaxi19tVz9xXHG8KS3yejm4H+v5/fVk+tiwe/xCbL56y+HZBgCmD8Yur
         /Sl9HVUtxjFPH8m39ZHWv1BK2qxuemX/Ak5Nfh3kV1XV4TAQjNIymgJw7dXbYVg5+RXr
         Svd5L7Iyc0WWdSnhdEOYmp4Ms8MedoBJms2Wrc5q1Iudtpa6i1S6EdxlShHI9MQlgLLw
         jbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242870; x=1752847670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1o4QOJvgTDr/+qtVAfA8JyDjjkgNnLqLh+c7VGsh8O0=;
        b=VSQLUeSAZRqsdAjBpqo2g3pZy4gSjpKogG9yuARuUNPhdNTnFX9173rT01jvHmztMz
         r4t2IdctqD3R4H59ZaKGB/oYihqEqBuXqMQ+uksMIDyRUfxl6m4ZilOo1pYGYkcpvs5j
         0WcYr4Wlrfh6iSlBizRc6jtkiu/OLv94JOftiNTOLIoXo9OUwvvLfC/GbjsVhNmbDfrm
         Oi1PISkciqtUEbVPKOGYpeEvaoVD+AGYgMEga80M1OCCdblDB9l9WsasDa0JINm9Q8P7
         dMn8Fp8ZIY/BfbCJ4wLBpaP1XaRg3j9/hw5eky1Kg4+XzlG83ju5PnIyQfKBI4rkDfR+
         c6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVZP0a4AIeUdrpeJJsFWBS1MMFhVXAG6yFvTJ6TnHW1+h1/ZRzbBntGHfwcjxA+LXbuJg1O@lists.linux.dev
X-Gm-Message-State: AOJu0YyGIWq/YrsMDZ53l8LLnqLkg4HUyvBnjGNFLL5abB5g2oKZLlJh
	DnxqgcMygVF1A1QT3vANflnvIoH2Z36snSi9GZB5mBFITbKjwXwy8bsc96ZakQ==
X-Gm-Gg: ASbGncst2vbegrZIPOYyTjNFIeqiCo+9wcv3PbswoV/DuZmA1+zRLkI+Q98Y2sfyUEL
	ieQE8iJnzqS5HEWBEiiXj6UcfslVNjO0+yit18vEqtcEm9BhwiTocnx6LOjYPPiy8tx9aqTWmA5
	hRjfOf+smNDFdQxcbJ0yBXy08BabbKG6gMb/hO95vLE3F46+FuPNXjm/za77CcFsCEFgujdkZCZ
	xyr3MXHwblOVazmRP1UDsNl2GjXZNCVP2X8QeIS5ux6qz4cCoX2BxJpQX+aCv6YrDGiyaAS7C6n
	DRoXTo5eUonWP5UeqYgm6wsLNVspdqjMMoJm+zwsvXZbwcAKI72vugoX7FOokDvNiTvAB2/mrrk
	J+IPLXhxxwE1OjFrtz6kLxAHYWsKIWwC61UXOzZi8JSL8erTjjE3u05XOGxl+v7W7yPaNaIuFvq
	hFEQOJTNldZjrS
X-Google-Smtp-Source: AGHT+IF6+2c6drwssbbyHedPCqYFE+1P3N4Vq4VaZMC4+LDbN999+fCyzgp647vBzgj+pkwfnRJ4KA==
X-Received: by 2002:a05:620a:4049:b0:7d3:f68c:5778 with SMTP id af79cd13be357-7ddece114camr723075885a.54.1752242869934;
        Fri, 11 Jul 2025 07:07:49 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde421c82sm223903685a.56.2025.07.11.07.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:07:48 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25215F40066;
	Fri, 11 Jul 2025 10:07:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 11 Jul 2025 10:07:48 -0400
X-ME-Sender: <xms:tBpxaFdOOFeX2emfJHq_7At8LNuoLKEFgX6g3IEz3ITtzny5Syy08g>
    <xme:tBpxaD_jZV53gl-IBhcZs5meDWin9TxwdqwOi8MQKdjY9P7jYwOkMyjp9F6FwhSqC
    gpfcMdK4uJWX8RY1Q>
X-ME-Received: <xmr:tBpxaCWblW_K-9L7XgpYdL_09wzIXNDsll--LMwKiLanjZSA7kazqoVxfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekrodttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejjeeuieegueekheekffejgefhjeeuvdetfeefjeegfeeigfdugeeujeduvdek
    gfenucffohhmrghinheplhifnhdrnhgvthdpfhhfihdrrhhsnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqh
    hunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgt
    phhtthhopedvledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrd
    hojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehlohhs
    shhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthho
    pehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:tBpxaAj7S2IUdaCBj_ThkVwBhYHUTMmVxGpCgg4tCKCJqsptuBra9g>
    <xmx:tBpxaAwGySgKEYdOtkMBZdsdTdAwCljuasEVb0D7Ghxgh47OJ2CtIg>
    <xmx:tBpxaGqBiNeR6cExwZDLESfXb0TGlPR3XWUStzBr1hUA4cPgZclHzQ>
    <xmx:tBpxaLlXr5znpt8fwYHhCaFjXtlmoSXXO1V7OuZYWvNM-3iuOKkVHQ>
    <xmx:tBpxaBo7xRdOCOPtvWkcy7VczTrNKVHJBf-hbzHgMpuNpPjjYcqTcT8n>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 10:07:47 -0400 (EDT)
Date: Fri, 11 Jul 2025 07:07:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,	Lyude Paul <lyude@redhat.com>,
 Ingo Molnar <mingo@kernel.org>,	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
Message-ID: <aHEasoyGKJrjYFzw@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-10-boqun.feng@gmail.com>
 <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org>
 <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>

On Fri, Jul 11, 2025 at 03:45:32PM +0200, Miguel Ojeda wrote:
> On Fri, Jul 11, 2025 at 11:00 AM Benno Lossin <lossin@kernel.org> wrote:
> >
> > Do we have a static assert with these cfgs that `isize` has the same
> > size as these?
> >
> > If not, then it would probably make sense to add them now.
> 
> Yeah, according to e.g. Matthew et al., we may end up with 128-bit
> pointers in the kernel fairly soon (e.g. a decade):
> 
>     https://lwn.net/Articles/908026/
> 
> I rescued part of what I wrote in the old `mod assumptions` which I
> never got to send back then -- most of the `static_asserts` are
> redundant now that we define directly the types in the `ffi` crate (I
> mean, we could still assert that `size_of::<c_char>() == 1` and so on,
> but they are essentially a tautology now), so I adapted the comments.
> Please see below (draft).
> 

Thanks Miguel.

Maybe we can do even better: having a type alias mapping to the exact
i{32,64,128} based on kernel configs? Like

(in kernel/lib.rs or ffi.rs)

// Want to buy a better name ;-)
#[cfg(CONFIG_128BIT)]
type isize_mapping = i128;
#[cfg(CONFIG_64BIT)]
type isize_mapping = i64;
#[cfg(not(any(CONFIG_128BIT, CONFIG_64BIT)))]
type isize_mapping = i32;

similar for usize.

Thoughts?

Regards,
Boqun

> Cheers,
> Miguel

> From afd58f3808bd41cfb92bf1acdf2a19081a439ca3 Mon Sep 17 00:00:00 2001
> From: Miguel Ojeda <ojeda@kernel.org>
> Date: Fri, 11 Jul 2025 15:27:27 +0200
> Subject: [PATCH] rust: ffi: assert sizes and clarify 128-bit situation
> 
> Link: https://lwn.net/Articles/908026/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/ffi.rs | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/rust/ffi.rs b/rust/ffi.rs
> index d60aad792af4..bbda56c28ca8 100644
> --- a/rust/ffi.rs
> +++ b/rust/ffi.rs
> @@ -38,11 +38,43 @@ macro_rules! alias {
>  
>      // In the kernel, `intptr_t` is defined to be `long` in all platforms, so we can map the type to
>      // `isize`.
> +    //
> +    // It is likely that the assumption that `long` is the size of a CPU register/pointer will stay
> +    // when support for 128-bit architectures is added, thus these will still mapped to `{i,u}size`.
>      c_long = isize;
>      c_ulong = usize;
>  
> +    // Since `long` will likely be 128-bit for 128-bit architectures, `long long` will likely be
> +    // increased. Thus these may happen to be either 64-bit or 128-bit in the future, and thus new
> +    // code should avoid relying on them being 64-bit.
>      c_longlong = i64;
>      c_ulonglong = u64;
>  }
>  
> +// Thus, `long` may be 32-bit, 64-bit or 128-bit.
> +const _: () = {
> +    assert!(
> +        core::mem::size_of::<c_long>()
> +            == if cfg!(CONFIG_128BIT) {
> +                core::mem::size_of::<u128>()
> +            } else if cfg!(CONFIG_64BIT) {
> +                core::mem::size_of::<u64>()
> +            } else {
> +                core::mem::size_of::<u32>()
> +            }
> +    );
> +};
> +
> +// And `long long` may be 64-bit or 128-bit.
> +const _: () = {
> +    assert!(
> +        core::mem::size_of::<c_longlong>()
> +            == if cfg!(CONFIG_64BIT) {
> +                core::mem::size_of::<u64>()
> +            } else {
> +                core::mem::size_of::<u128>()
> +            }
> +    );
> +};
> +
>  pub use core::ffi::c_void;
> 
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> -- 
> 2.50.1
> 

