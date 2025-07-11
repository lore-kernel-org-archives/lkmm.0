Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84E28DF27
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258064; cv=none; b=b4ehqvdoQ59LWO6Ki6L7PieAygfs8dPIxGj1xuhLhPKLDPOKNBGH48Tsv23t5IZdmLmixxy5FqWGkV5q7Jv4xhRjAyWYCoJfhe93JS3w246JRkX3gf/HNghGwAOoAOFH0S49Q9jPKP28Cs+6i8gl5L6NEi9jHidah5Ce4p5EDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258064; c=relaxed/simple;
	bh=5+WRseIX7sV1ABSOz3FQOgwgr+hUm9J+m6BFBIFSUKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2B9IDwTZOhlwiK7bH3CtBdvzi3e36tjaRxF/HO8M0q7I4BJ9tsOSlkFU8kN0pOku6K+csYSOeWywmBxbf/oiYcKzacBO5vNpuEQHGCV7mU07ORmFYyqeysTDxCNz6mNk3gFNYkNEKxZ8fSa0+fInLvCxRDjQ/J6tvsBF8KyAXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftLm9gAt; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftLm9gAt"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d21cecc11fso416884485a.3
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 11:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752258061; x=1752862861; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia66QNFe8vhG6RCTBKrhJqFEhohx5sDMdLUqqKQCukc=;
        b=ftLm9gAtzFG1k7WzaNxeI5a+BMqfAkRkErwpyji/dnwh7T/+J2Qm2f4DWgsiJHJ4q2
         kUwjloj0pJ/OPy5BHaQ9WuHsxpRZi93MMlGnVqyrDmv5o61SFQK2CkjtAiMkbSsPexoh
         RYr9abu27BmEfXZuwSy4XpQLdlvB2h9tngSvcAqZ8qugMHSKGZrD+U2U2F1WufN+cSzm
         RRBAG2Rt3cHxRJH/hx98kiwlaTwXJhTaC2JX3nYTFLQ5/aDDtw4claBt5kSjRJ+5irHS
         bQ45ulf0JAfoZcBXXrhU1eQaGO4YRGCba5ea/CyuZQojlz2wHIINcZaEpz+jKBszd2ed
         emZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258061; x=1752862861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia66QNFe8vhG6RCTBKrhJqFEhohx5sDMdLUqqKQCukc=;
        b=PzQ+JfVRacFxxADNnkcReOZL8NiUWbEtAjNchbvh9g6v2g4z9STK6EhWC1KSUtbAzR
         bvJQjompii/f/RUwRH/Py4azXx5ubzDJk7DmFW45IuaIgkIAnCmfrqYfNiOQlL7a/CCN
         OxaAB9XcRV7H8VDOqsm171Fac3j6iGc5bGNnUQR7FxEtxNeMBL2LuIaDBxZagb+jT0B4
         XLu97MH5BvGFdI/6J7aotWW/QMetR2BFaEFQBUexZQjsWImcj7pNUDMfGC8Slbkyn6Ce
         NORZMOaH0HdTI+bp4ZKn5uJdzGpBCIv7RkNrduN7WYcivTnT7ptvb1Ju4AqjsJmSPLey
         9TPw==
X-Forwarded-Encrypted: i=1; AJvYcCWvWj+z8Lq7DFynqwYrhyExI/+K6I+CwkcHH6ETIyTpqgakuhBnVmH6HhyGoVFAXnaA2D7l@lists.linux.dev
X-Gm-Message-State: AOJu0YyPVQK0WrSfmO12+WQbdKwo1InA1edWNrhE7Svg9M/N3KfD9MVd
	pGdacv1XrUX57EqyHXT0koPAJFB5PxAslOIJrbaOziSzM8LvHk08BoLH
X-Gm-Gg: ASbGnct98GLSx0BVXSi0MRCdUWtAWAGqW7PGcHW+jKZWZK+36a/GT5cN7fP6Z4jK6yb
	RHKCYL1MHtyGaelkF34MkMzrgMPhmNMYyyX17ZygXAKUWb4Oj0p6smyWxiIZGOkp8KAbtbtyzDk
	FXlFkF/txuAel+OOPUX2JxRggZMan2lvZhgxGLT0ZZJzcIWGSWa2GypLlx0NrIpO1Noc2tuoG5j
	FH3KuuW7qlt+N609F/bvUcTH8Ig6CBzcted+UOVujy4Uk+Je432GI05uUhvDiMEjdkybNR6uchP
	vzg852rgyfq/q17iCXZHtAonICAomACgosnrozIbM40gLb5Un5rAGgnztiyxipu/aZfx+lN6YbJ
	E+fqEQDjAh053o0jSk+11AuyQixpcZYApIocdSc5NlGUyYNpqbslsDkOv9qxxNtxr5yB7F2YYQY
	D4DOqmxtvq3Er6
X-Google-Smtp-Source: AGHT+IGvju+RNJB6luNnf7Ro13LJcoRMdK6UBQfn+z29hRMsCafaDqLiDBwyRlDvYEkOXMdNOn1hWw==
X-Received: by 2002:a05:620a:404d:b0:7e0:5afb:596d with SMTP id af79cd13be357-7e05afb6b48mr261917285a.40.1752258061105;
        Fri, 11 Jul 2025 11:21:01 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde8fd235sm244492585a.92.2025.07.11.11.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 11:21:00 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DBF48F40066;
	Fri, 11 Jul 2025 14:20:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 11 Jul 2025 14:20:59 -0400
X-ME-Sender: <xms:C1ZxaFYp1VQqnVoibjeIYVnT-PeKAsIGezO3f82lOIuwqctXuFPXcw>
    <xme:C1ZxaNkwUY4ZDxAp6Jks-6h8FscK-JgEDL7OUiyhBo9FRzC6AIaJkU7ebjOwKqapD
    WcACoQ6_pb4Ylw3RQ>
X-ME-Received: <xmr:C1ZxaIasO6WXRkFRgQprYF3wYC7n87PTOVINwex3WP3g4KHdm85QrmmGgGtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggedtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfeliedvudfhgfeivdffhfektefhudehjefgveevvedvjefgvdejhfffieejuefh
    necuffhomhgrihhnpehgohgusgholhhtrdhorhhgpdhgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqd
    hlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehl
    ihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegp
    ghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:C1ZxaNBcPLPqcZLuWVlBexTo4DRAMJpR4gsk4SlH7NHZ-Ul3rHIu5w>
    <xmx:C1ZxaGbMO6hxS7eRNZf2tw4vAtdYrHpuVUL7WORhfX8BlLElUpaFoA>
    <xmx:C1ZxaJiLKau3z5SP48LT7APwcwrigHUcn819fP49i0EMRkZgcEzn7Q>
    <xmx:C1ZxaOxdEa-nDCzAoinLCrYahnrBYbFRnzHAIODJO4s47Sg2NA8bEg>
    <xmx:C1ZxaM5ETPbpN0nzxWrba5eo0UZ_u9xV_E1OYOczPJVzTndGtzR_gb17>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 14:20:59 -0400 (EDT)
Date: Fri, 11 Jul 2025 11:20:58 -0700
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
	Alan Stern <stern@rowland.harvard.edu>, Ralf Jung <post@ralfj.de>
Subject: Re: [PATCH v6 8/9] rust: sync: Add memory barriers
Message-ID: <aHFWCsOfcGLSUPAP@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-9-boqun.feng@gmail.com>
 <DB93NWEAK46D.2YW5P9MSAWVCN@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB93NWEAK46D.2YW5P9MSAWVCN@kernel.org>

On Fri, Jul 11, 2025 at 10:57:48AM +0200, Benno Lossin wrote:
> On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> > diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
> > new file mode 100644
> > index 000000000000..df4015221503
> > --- /dev/null
> > +++ b/rust/kernel/sync/barrier.rs
> > @@ -0,0 +1,65 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Memory barriers.
> > +//!
> > +//! These primitives have the same semantics as their C counterparts: and the precise definitions
> > +//! of semantics can be found at [`LKMM`].
> > +//!
> > +//! [`LKMM`]: srctree/tools/memory-model/
> > +
> > +/// A compiler barrier.
> > +///
> > +/// A barrier that prevents compiler from reordering memory accesses across the barrier.
> > +pub(crate) fn barrier() {
> > +    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
> > +    // it suffices as a compiler barrier.
> 
> I don't know about this, but it also isn't my area of expertise... I
> think I heard Ralf talk about this at Rust Week, but I don't remember...
> 

Easy, let's Cc Ralf ;-)

Ralf, I believe the question here is:

In kernel C, we define a compiler barrier (barrier()), which is
implemented as:

# define barrier() __asm__ __volatile__("": : :"memory")

Now we want to have a Rust version, and I think an empty `asm!()` should
be enough as an equivalent as a barrier() in C, because an empty
`asm!()` in Rust implies "memory" as the clobber:

	https://godbolt.org/z/3z3fnWYjs

?

I know you have some opinions on C++ compiler_fence() [1]. But in LKMM,
barrier() and other barriers work for all memory accesses not just
atomics, so the problem "So, if your program contains no atomic
accesses, but some atomic fences, those fences do nothing." doesn't
exist for us. And our barrier() is strictly weaker than other barriers.

And based on my understanding of the consensus on Rust vs LKMM, "do
whatever kernel C does and rely on whatever kernel C relies" is the
general suggestion, so I think an empty `asm!()` works here. Of course
if in practice, we find an issue, I'm happy to look for solutions ;-)

Thoughts?

[1]: https://github.com/rust-lang/unsafe-code-guidelines/issues/347

Regards,
Boqun

> > +    //
> > +    // SAFETY: An empty asm block should be safe.
> 
>     // SAFETY: An empty asm block.
> 
> > +    unsafe {
> > +        core::arch::asm!("");
> > +    }
> 
>     unsafe { core::arch::asm!("") };
> 
> > +}
> > +
> > +/// A full memory barrier.
> > +///
> > +/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> > +pub fn smp_mb() {
> > +    if cfg!(CONFIG_SMP) {
> > +        // SAFETY: `smp_mb()` is safe to call.
> > +        unsafe {
> > +            bindings::smp_mb();
> 
> Does this really work? How does the Rust compiler know this is a memory
> barrier?
> 
> ---
> Cheers,
> Benno
> 
> > +        }
> > +    } else {
> > +        barrier();
> > +    }
> > +}
