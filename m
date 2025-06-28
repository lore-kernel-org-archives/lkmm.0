Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853AA21B9E0
	for <lkmm@lists.linux.dev>; Sat, 28 Jun 2025 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082162; cv=none; b=jAq0iZTnj6xpaKVgmi/BlMZoI1iZmtZmHwdOSSDuVEGz3SQLU9Wi/FH53WAcCcCJt8e7qVRxxe+KbSLBPjf58MOrKERcMH9ec/hwgxRKoY9QXAG3ADl/kF6UFc5CH7DICND68eFeLdoj/da9QlRfa+I3F+90fnDFRXseeqfjoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082162; c=relaxed/simple;
	bh=nhER8ZfvdtY3YByIjG+YMSgQUrFdl2UkZ/cmvNb3MAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVQVE65ylZWSa4RMOEjLIMN8ell1SAGbm7p1nincm6jHSYzftKM/JXU86WgWq5lU5ysFkf9YBviChxy2M1LyyA75kwkESckfDrl2bAlWeKIOHx1LVbtRV4j/mTO8nWQjgJUkeMENHShifWuGlGopBbuh7VTPnN/Tb1xYCnbo1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcYossC0; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcYossC0"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fb3bba0730so43732596d6.0
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751082159; x=1751686959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VEbBp8YdQcFMU69IN4b0pwYAz5X1X8v0Kfm5rjL0u8=;
        b=gcYossC0R2ZYbfzLhJ4BgIs/bv+kEX+KFOJewt0aUJtIWEhHGqzfmrtqTMPB0OF1YA
         EaVbeY4A5DMErUWyiPLmd9Hd7AnMoNEJKOJ9QrUBx2MJENkQ0BBZUJKrALSolddQJSdm
         nbW2hWHLg+ZgHNOC+JECRoEKdccnBHuBGEGxBIMfIeKn+myi7H4zYr3IuiSME9+oUsgF
         r+Q32c1CBHKl36VdbwlQWVt2/wWYdeEtII98EOgfiPgs6B1K+qdZBKrPr9g6FlLwEW06
         c5SbExVhtGh+ir41Tfr9WRF8tKAKkeD7bj+qgDIOwnk5aZhBoCJacOp3tRAgFBNrc/BS
         Eevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751082159; x=1751686959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VEbBp8YdQcFMU69IN4b0pwYAz5X1X8v0Kfm5rjL0u8=;
        b=f6PgGq8Pg6iwIM8l9yRecpg4+Touo8ULEBUcQ4w6rEnUPwhI6krfyYvleGdRHtDLWD
         zO2KIh4/7yweqdkzPFSjUnuYn7hWkYfVR3A9s1SLlx+h6fMk0lON0XCqKgtqE4llhBpx
         F7hVn6fqcIWaMx6DOdHffiWRVidWq0eweavYp9IvEAyaFPhGBkkE3Hvif37qSkYq7rts
         idg/7dwy70aomr+DGFriSgHk+BBaYaVwskQLfEACQIjJwM8X77uc/OxLE79HJ60M9BU2
         QbiJcUXJ/vwZolU1MhS464rBEGN6w/M/9h30P041jjvNvf9yMHhfJA0o/Z0pxC+bMCSD
         yenQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT/eme9TKcH/A2l2McjkhUyp0/0N4wFYKPOHE9J1pIeZU+36AZCeJQel3VKyW+Z40Sda6t@lists.linux.dev
X-Gm-Message-State: AOJu0YyO3rVCYgYXOS62aSS4qlIpk9XTmyZQgwDdZVRrF8cpRCPENdRN
	qumoENluygFqEYwBRFwmDArj6EJfHcDayj3fIi5y9StbFqwvMQJiXOt8
X-Gm-Gg: ASbGncsqqHhLaCkFdWDq2ETfS+AgXR9usAlkK7Uq9N0EoAvLoaHklsXGJmN69pGbYdH
	QP2nFzRDo7wORP917EwkCCDchPnciOuaoHAdBnm/ur06ztdBRQRK11VC/G5BzJEYO48k5GcBx2U
	00pjc6UUkkfQG3neh+WEyT6f4gDndVxVM2wgzXjskDZxNDGj/RlbIVHWCTeiS0QKcXIwKz6MFq7
	lYVPA8mkvOBQPeTrS9tn/Uf0OVO6/SGxZRyjJRYemkFrmVh3zxWP965znuQHLjTi4vx4sDpTBoz
	RRz3Ch4asQJvhPzYLP7G3N9KHXJV9B+t8lmhE3tdTe5AJ5nBDxUDd61YH/UU9RMEsJS3rc8z5GX
	HkFL1ZhlOIelYLmNhj5TPrJJjtMITtZLqaGK4KeZVlGH45a75IO+b
X-Google-Smtp-Source: AGHT+IGedbmHDaqU9GUha1odWRJbVBRQf8bnjo4m+/kurV/RO3ST+RbsJJXnW2tWoSkKHZdD52LSbA==
X-Received: by 2002:a05:6214:224a:b0:6fa:ae40:3023 with SMTP id 6a1803df08f44-7009214990cmr83567916d6.7.1751082159322;
        Fri, 27 Jun 2025 20:42:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771b50e1sm31074116d6.34.2025.06.27.20.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:42:38 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 22882F40068;
	Fri, 27 Jun 2025 23:42:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 27 Jun 2025 23:42:38 -0400
X-ME-Sender: <xms:rmRfaGAnsA9ZcFPvQvGW7kVxBmDIVwhSAWAqJ5pCQacQTWq2iDaR6A>
    <xme:rmRfaAgg18U4xIY1DXpBc04zVu23doqBBddPj1S_y4FD-20PcSDUk764kysF3KO4e
    djHi9O0CohrthY9fw>
X-ME-Received: <xmr:rmRfaJkrIPIm2UoztFGciaxrH7RB0gyxoqpDdWHe1pi4a7p34aRp1tKOQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhu
    shhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    rghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:rmRfaExyzSKlE6o4bZZiZnfTo3QpT8W0UBqMrwFQdntBYBO21p76IQ>
    <xmx:rmRfaLS2fegfgQ9M_iBXC6iNBcDCoC2pEYqPlYWe155j7GZrKFz9zw>
    <xmx:rmRfaPYeg_auaZ-A-TzBsWTnKeF74UzdFxxkjGWPICI0CsFeY_LV0g>
    <xmx:rmRfaETEChVCo8tiClrKe5pygw-8sdQRhtMLRMPUjG34dyv8F7NdkA>
    <xmx:rmRfaNB1S5EfWisrzswXOrsWiG3ZtIGTj6u7398Uz9EOAloXHofjQSEQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 23:42:37 -0400 (EDT)
Date: Fri, 27 Jun 2025 20:42:36 -0700
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
Subject: Re: [PATCH v5 10/10] rust: sync: Add memory barriers
Message-ID: <aF9krO0nVjN0yoEC@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <A-SZkzm2EzwbPsG5Vm5qfT1BIGijzoQ7zQI6ExgXZbSXf8ZfIMw6fe-Z7xWgvKnr0BPylikGRuhEfiKfXx5xTw==@protonmail.internalid>
 <20250618164934.19817-11-boqun.feng@gmail.com>
 <874iw2zkti.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874iw2zkti.fsf@kernel.org>

On Thu, Jun 26, 2025 at 03:36:25PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
[...]
> > +//! [`LKMM`]: srctree/tools/memory-mode/
> 
> Typo in link target.
> 
> > +
> > +/// A compiler barrier.
> > +///
> > +/// An explicic compiler barrier function that prevents the compiler from moving the memory
> > +/// accesses either side of it to the other side.
> 
> Typo in "explicit".
> 

Fixed.

> How about:
> 
>   A compiler barrier. Prevents the compiler from reordering
>   memory access instructions across the barrier.
> 
> 
> > +pub(crate) fn barrier() {
> > +    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
> > +    // it suffices as a compiler barrier.
> > +    //
> > +    // SAFETY: An empty asm block should be safe.
> > +    unsafe {
> > +        core::arch::asm!("");
> > +    }
> > +}
> > +
> > +/// A full memory barrier.
> > +///
> > +/// A barrier function that prevents both the compiler and the CPU from moving the memory accesses
> > +/// either side of it to the other side.
> 
> 
>   A barrier that prevents compiler and CPU from reordering memory access
>   instructions across the barrier.
> 
> > +pub fn smp_mb() {
> > +    if cfg!(CONFIG_SMP) {
> > +        // SAFETY: `smp_mb()` is safe to call.
> > +        unsafe {
> > +            bindings::smp_mb();
> > +        }
> > +    } else {
> > +        barrier();
> > +    }
> > +}
> > +
> > +/// A write-write memory barrier.
> > +///
> > +/// A barrier function that prevents both the compiler and the CPU from moving the memory write
> > +/// accesses either side of it to the other side.
> 
>   A barrier that prevents compiler and CPU from reordering memory write
>   instructions across the barrier.
> 
> > +pub fn smp_wmb() {
> > +    if cfg!(CONFIG_SMP) {
> > +        // SAFETY: `smp_wmb()` is safe to call.
> > +        unsafe {
> > +            bindings::smp_wmb();
> > +        }
> > +    } else {
> > +        barrier();
> > +    }
> > +}
> > +
> > +/// A read-read memory barrier.
> > +///
> > +/// A barrier function that prevents both the compiler and the CPU from moving the memory read
> > +/// accesses either side of it to the other side.
> 
>   A barrier that prevents compiler and CPU from reordering memory read
>   instructions across the barrier.
> 

These are good wording, except that I will use "memory (read/write)
accesses" instead of "memory (read/write) instructions" because:

1) "instructions" are at lower level than the language, and memory
   barriers function are provided as synchonization primitives, so I
   feel we should describe memory barrier effects at language level,
   i.e. mention how it would interact with objects and accesses to them.

2) There are instructions can do read and write in one instruction, it
   might be unclear when we say "prevents reordering an instruction"
   whether both parts are included, for example:

   r1 = atomic_add(x, 1); // <- this can be one instruction.
   smp_rmb();
   r2 = atomic_read(y);

   people may think because the smp_rmb() prevents read instructions
   reordering, and atomic_add() is one instruction in this case,
   smp_rmb() can prevents the write part of that instruction from
   reordering, but that's not the case.


So I will do:

   A barrier that prevents compiler and CPU from reordering memory read
   accesses across the barrier.

Regards,
Boqun

> > +pub fn smp_rmb() {
> > +    if cfg!(CONFIG_SMP) {
> > +        // SAFETY: `smp_rmb()` is safe to call.
> > +        unsafe {
> > +            bindings::smp_rmb();
> > +        }
> > +    } else {
> > +        barrier();
> > +    }
> > +}
> 
> 
> Best regards,
> Andreas Hindborg
> 
> 
