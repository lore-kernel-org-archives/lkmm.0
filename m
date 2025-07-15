Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF241F30CC
	for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595020; cv=none; b=rOi7Kax1CeP/PeN0fJbJ+SFpYQeaHAM9ZCXHyYak3vkC8flD65StkcFoqN70dulHEU0DrDIF2RA2hUOmuu6a3HxY2PUpmlR6MgkfUOgz8lXIf3QxvTwUdteg3ecZHasVkLH7F1Y/SHEXvyLtnYFiL4a0bwiNoveY8g2Px2Mdq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595020; c=relaxed/simple;
	bh=1sqw2pkHcra7qBvQBOEOpvSbudYYS6G02Ezq71UXeDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfaVyX/aWHeLYCICEgVAjKyPRfRUSU2heZZMRy1wZSrGzPmnNPFlxpuVoQbPcqTeGqssKANY2aZjFZytUHvdh1OxeL46xMwvE40Hj8gHIYVqO4kf4ULhdsX8gF2iLvsnqZIv9jSyPNazarxFRWQkLstrQEhdG3D8cze7j1nUdlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYJX2G+z; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYJX2G+z"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a77ffcb795so52643211cf.0
        for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752595018; x=1753199818; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWk7Sv2PKSSaloqy6porpPlM56ertV5vAVDzaiHgJAc=;
        b=bYJX2G+zN792HtfYyTIEMgZNwBqtatFeZL01XCPP6yPdrwaTD/aNY8j1H0BUG9J7SO
         WP9q0DKRDTUi1iv5KGhZv7x+ufeAoqiBxdTSTwL42BITBRgKkqPg4teANGSN+9n0xhnM
         j5JIG97jRYOig40FwNOSPUwsbetc/tsr5Nw1L9GZu5pPfnoaaVxXlDDNUuIUX3pfa16V
         TiTt93Tps1Gd++X+jemKQqfIHLg2aAg6v3FsdKXURJWXx7XaxkAljCOcE+LUrWe5Ijy3
         wMmD+sftj5qhZ5Nd8PpPKL/lhvEgLqfSdbjpgvdKbhROdki7I6q+haDw/NXSE2ZLDasP
         QI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595018; x=1753199818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWk7Sv2PKSSaloqy6porpPlM56ertV5vAVDzaiHgJAc=;
        b=w61luzFG1k+BgM7IrAQKNDHXFg8UlerDbdGGFbeAd6wLhdmqpY/cFu+C5LXcdBWqkU
         /H66qcnvUwguAhXaBwI2zc/E0wyU3Ret8+3+itvLGb22zdkYuDjrfZRC5GsZMTwFDufX
         pr+cXCq8CnefW+QOAiJlufOMt+rjqRdLPDpYtCLzvHD9fwa6XYX1qo/Nedjo1G4wGHl9
         05tSFZex+rl+gnhM3eRx/L4w+RXlQFy/0LxQAa0XdcbPY+h7/xvS5Z7GO4UcIUqntak2
         +9q7LdTRgCTDcr2vNNadayFQpu/rbDqq5Zqdcner+jwgnY4bWqG8aOMcQbVl78ev1gB5
         qSzg==
X-Forwarded-Encrypted: i=1; AJvYcCWkUNajDn1H27T8KUXCFry3Zg0INZ5nwhwtvPNbB8ZMoD9VmGenYIejCdHLv5U3Ye+Evbsf@lists.linux.dev
X-Gm-Message-State: AOJu0YxRpR6x3qnqtycNJuJTmHMSQnUKxl5TNfD5teBE0Js8nSyfWf5T
	VlKHLGtKhTWxtvzsRyS9cBl+P5MZo3/srIAEM+TS3utBBz6ugDFJ0w43
X-Gm-Gg: ASbGncvpJoaklYrLxJzORAZAp+zxiGRP/OhfZcRXUDcjRCanNbHKHt+JZkon/I6uUWa
	e9Ncm6nTs9nZQEMx1MMPz7Dphx3NrD5+KClUqsfRS2HrHidaVL4N6VC8+KP/PALBvlPMUjKQVrQ
	DNoEe/r37H0rNQV8cBsf7Sflv2LMc7ZS4adSYWmTgftZycgP82OqEgJbwSMBTcEd51PBp/x8hAk
	MAJ3blnc1Ca5LJGS1OoSKrpPZOQvYZ5cmoHorbE7hml+BlrDknuRIkFyIwY/x2J8WZ7ZpRvgxJe
	8MucQSzfYD+Zglpyki/SGXTMnRmBKGKZmcTNMPDDspCTGE+Dai3KzRtLJd7P15siDYpcihVSade
	OWXyRK12tMqNE1hJWO0T2O7qCpwtDNZz2cWPM8G0gkgNjJdN9BlyAOBRYu9lo6UNdGb6mR8mnG5
	4DlCF/WGqovZ7uQOiMXhWvy4c=
X-Google-Smtp-Source: AGHT+IFDfRZ4RIKw/SlakkBbL6/8f3AZHC9ifkHIbIa7xAhG6kRUBEoIlhqhKzsrk8JXUsDFwH9KIA==
X-Received: by 2002:a05:622a:1206:b0:4a9:9428:6f01 with SMTP id d75a77b69052e-4aabb9f7914mr244627201cf.51.1752595017379;
        Tue, 15 Jul 2025 08:56:57 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc13c35sm61316141cf.8.2025.07.15.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:56:56 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2BB63F40068;
	Tue, 15 Jul 2025 11:56:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 15 Jul 2025 11:56:56 -0400
X-ME-Sender: <xms:SHp2aLGKWJ3SBn--QA6k7owXbZ3bvWLcIWpaeNXLkU9TQH1F7Yd9ww>
    <xme:SHp2aJn0J-IdtFLKFSt87Y7u61ONhtLZ_dIZVZG1EDwZbwTJd-GGYeAPWavpyKFCf
    hvdk6SRU3R3noaOIw>
X-ME-Received: <xmr:SHp2aGDu85iKaT68MN-Bn3vUgKYBwpMWdyBdbm2UUZRetH5gCK0X5B9nkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehhedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepudejueekvefgheegiefhffdtfeeukeehleekhfeffeegjeeuueejveegteekheef
    necuffhomhgrihhnpehgohgusgholhhtrdhorhhgpdhgihhthhhusgdrtghomhdpuggvph
    gvnhguvghntgihrdhinhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthi
    dqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghi
    lhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphhoshhtsehrrghlfhhjrdguvgdprhgtphhtthho
    pehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhr
    qdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmse
    hlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:SHp2aAGpQS0UQvHgQT_cwEUqokvH-4iyyjJv2LWHwE-_M472WEFpoA>
    <xmx:SHp2aC9fA2qY85CjgDG51xxrWlIJ4Fy7zRJ_XEyvDn3papcL8zGGQw>
    <xmx:SHp2aNkordjHTpJ_kR1gclBZB9r71byHqQmkR-IgSt98HPoT7fmK9w>
    <xmx:SHp2aI86gRhOL5yUj5bcmagFGuvfCtM82kJRrR_2YzfDHxbFx-9Y-A>
    <xmx:SHp2aBfHTIJZq44FTWHO4pfoyqr81Ko_PGr5IWHlddWiiWczaEreAFqh>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 11:56:55 -0400 (EDT)
Date: Tue, 15 Jul 2025 08:56:54 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ralf Jung <post@ralfj.de>
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 8/9] rust: sync: Add memory barriers
Message-ID: <aHZ6Rp4qdCXUoIZy@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-9-boqun.feng@gmail.com>
 <DB93NWEAK46D.2YW5P9MSAWVCN@kernel.org>
 <aHFWCsOfcGLSUPAP@tardis-2.local>
 <4d373b56-0f36-4f8a-9052-cee38b90f59b@ralfj.de>
 <aHZyC4xr7jgN6Mgv@Mac.home>
 <371882d2-3c31-4c5f-a12f-22945027ee33@ralfj.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371882d2-3c31-4c5f-a12f-22945027ee33@ralfj.de>

On Tue, Jul 15, 2025 at 05:35:47PM +0200, Ralf Jung wrote:
> Hi all,
> 
> On 15.07.25 17:21, Boqun Feng wrote:
> > On Mon, Jul 14, 2025 at 05:42:39PM +0200, Ralf Jung wrote:
> > > Hi all,
> > > 
> > > On 11.07.25 20:20, Boqun Feng wrote:
> > > > On Fri, Jul 11, 2025 at 10:57:48AM +0200, Benno Lossin wrote:
> > > > > On Thu Jul 10, 2025 at 8:00 AM CEST, Boqun Feng wrote:
> > > > > > diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
> > > > > > new file mode 100644
> > > > > > index 000000000000..df4015221503
> > > > > > --- /dev/null
> > > > > > +++ b/rust/kernel/sync/barrier.rs
> > > > > > @@ -0,0 +1,65 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +
> > > > > > +//! Memory barriers.
> > > > > > +//!
> > > > > > +//! These primitives have the same semantics as their C counterparts: and the precise definitions
> > > > > > +//! of semantics can be found at [`LKMM`].
> > > > > > +//!
> > > > > > +//! [`LKMM`]: srctree/tools/memory-model/
> > > > > > +
> > > > > > +/// A compiler barrier.
> > > > > > +///
> > > > > > +/// A barrier that prevents compiler from reordering memory accesses across the barrier.
> > > > > > +pub(crate) fn barrier() {
> > > > > > +    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
> > > > > > +    // it suffices as a compiler barrier.
> > > > > 
> > > > > I don't know about this, but it also isn't my area of expertise... I
> > > > > think I heard Ralf talk about this at Rust Week, but I don't remember...
> > > > > 
> > > > 
> > > > Easy, let's Cc Ralf ;-)
> > > > 
> > > > Ralf, I believe the question here is:
> > > > 
> > > > In kernel C, we define a compiler barrier (barrier()), which is
> > > > implemented as:
> > > > 
> > > > # define barrier() __asm__ __volatile__("": : :"memory")
> > > > 
> > > > Now we want to have a Rust version, and I think an empty `asm!()` should
> > > > be enough as an equivalent as a barrier() in C, because an empty
> > > > `asm!()` in Rust implies "memory" as the clobber:
> > > > 
> > > > 	https://godbolt.org/z/3z3fnWYjs
> > > > 
> > > > ?
> > > > 
> > > > I know you have some opinions on C++ compiler_fence() [1]. But in LKMM,
> > > > barrier() and other barriers work for all memory accesses not just
> > > > atomics, so the problem "So, if your program contains no atomic
> > > > accesses, but some atomic fences, those fences do nothing." doesn't
> > > > exist for us. And our barrier() is strictly weaker than other barriers.
> > > > 
> > > > And based on my understanding of the consensus on Rust vs LKMM, "do
> > > > whatever kernel C does and rely on whatever kernel C relies" is the
> > > > general suggestion, so I think an empty `asm!()` works here. Of course
> > > > if in practice, we find an issue, I'm happy to look for solutions ;-)
> > > > 
> > > > Thoughts?
> > > > 
> > > > [1]: https://github.com/rust-lang/unsafe-code-guidelines/issues/347
> > > 
> > > If I understood correctly, this is about using "compiler barriers" to order
> > > volatile accesses that the LKMM uses in lieu of atomic accesses?
> > > I can't give a principled answer here, unfortunately -- as you know, the
> > > mapping of LKMM through the compiler isn't really in a state where we can
> > > make principled formal statements. And making principled formal statements
> > > is my main expertise so I am a bit out of my depth here. ;)
> > > 
> > 
> > Understood ;-)
> > 
> > > So I agree with your 2nd paragraph: I would say just like the fact that you
> > > are using volatile accesses in the first place, this falls under "do
> > > whatever the C code does, it shouldn't be any more broken in Rust than it is
> > > in C".
> > > 
> > > However, saying that it in general "prevents reordering all memory accesses"
> > > is unlikely to be fully correct -- if the compiler can prove that the inline
> > > asm block could not possibly have access to a local variable (e.g. because
> > > it never had its address taken), its accesses can still be reordered. This
> > > applies both to C compilers and Rust compilers. Extra annotations such as
> > > `noalias` (or `restrict` in C) can also give rise to reorderings around
> > > arbitrary code, including such barriers. This is not a problem for
> > > concurrent code since it would anyway be wrong to claim that some pointer
> > > doesn't have aliases when it is accessed by multiple threads, but it shows
> > 
> > Right, it shouldn't be a problem for most of the concurrent code, and
> > thank you for bringing this up. I believe we can rely on the barrier
> > behavior if the memory accesses on both sides are done via aliased
> > references/pointers, which should be the same as C code relies on.
> > 
> > One thing though is we don't use much of `restrict` in kernel C, so I
> > wonder the compiler's behavior in the following code:
> > 
> >      let mut x = KBox::new_uninit(GFP_KERNEL)?;
> >      // ^ KBox is our own Box implementation based on kmalloc(), and it
> >      // accepts a flag in new*() functions for different allocation
> >      // behavior (can sleep or not, etc), of course we want it to behave
> >      // like an std Box in term of aliasing.
> > 
> >      let x = KBox::write(x, foo); // A
> > 
> >      smp_mb():
> >        // using Rust asm!() for explanation, it's really implemented in
> >        // C.
> >        asm!("mfence");
> > 
> >      let a: &Atomic<*mut Foo> = ...; // `a` was null initially.
> > 
> >      a.store(KBox::into_raw(x), Relaxed); // B
> > 
> > Now we obviously want A and B to be ordered, because smp_mb() is
> > supposed to be stronger than Release ordering. So if another thread does
> > an Acquire read or uses address dependency:
> > 
> >      let a: &Atomic<*mut Foo> = ...;
> >      let foo_ptr = a.load(Acquire); // or load(Relaxed);
> > 
> >      if !foo_ptr.is_null() {
> >          let y: KBox<Foo> = unsafe { KBox::from_raw(foo_ptr) };
> > 	// ^ this should be safe.
> >      }
> > 
> > Is it something Rust AM could guarantee?
> 
> If we pretend these are normal Rust atomics, and we look at the acquire
> read, then yeah that should work -- the asm block can act like a release
> fence. With the LKMM, it's not a "guarantee" in the same sense any more
> since it lacks the formal foundations, but "it shouldn't be worse than in
> C".

> 
> The Rust/C/C++ memory models do not allow that last example with a relaxed
> load and an address dependency. In C/C++ this requires "consume", which Rust

Sorry I wasn't clear, of course I wasn't going to start a discussion
about address dependency and formal guarantee about it ;-)

What I meant was the "prevent reordering A and B because of the asm!()"
at the release side, because normally we won't use a restrict pointer to
a kmalloc() result, so I'm curious whether Box make the behavior
different:

    let mut b = Box::new_uninit(...);
    let b = Box::write(b, ...); // <- this is a write done via noalias
    asm!(...);
    a.store(Box::from_raw(b), Relaxed);

But looks like we can just model the asm() as a Rust release fence, so
it should work. Thanks!

Regards,
Boqun


> doesn't have (and which clang treats as "acquire" -- and GCC does the same,
> IIRC), and which nobody figured out how to properly integrate into any of
> these languages. I will refrain from making any definite statements for the
> LKMM here. ;)
> 
[...]
