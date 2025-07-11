Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCD2D97A2
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241875; cv=none; b=kwliyGzYILw2dL0NMrNGUc4wxLJ+Iz9cj+uc5xW9cncGju2uLoJGrZHeeoGgI7uydSHgqbuqumOOebKToqrDyj0OASmlorvlhNMGjbkMlbZ9b3Oqe8YWEjUaBOR4kj+mVdxwu9v5SphR33D5zk5882d7nGPwct4mrXUeTUP7mi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241875; c=relaxed/simple;
	bh=VhA4dbbRgYBOcUaTz+c7NrVJIROm/R3rHh4CcKNyzi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUWIibbTp2Hxv/14QpoPhB4UPY867K+jAUbdyQvfZmOF9AV5DQnXi+7J8Lcl5yuSNZDGnLT5hqikLRe1TBZn5wCRFq7gy4Sap8+SAMgT5cMFCIKHCmLSZY7rmz4P1DKEwTzqquYwLZWk+orirjKr0YVC3FTJFV+A4AgqHpJZ3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJtDViP2; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJtDViP2"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so25463781cf.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752241873; x=1752846673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsPSR2XmtkCGfmNXHOX1skWOOfQss8KuN6l1/rksPTs=;
        b=bJtDViP2W4s7Fwls2TRcEUu4wOmJe1SU3fNvtDVuII11ama8I7UlJ8RerlaZkJhDfN
         b6Rv9ILYLFd2Te4rGEMJ4AkLJ/93MnzegTp4+vsn6pi6ZhA12TQG6nI3lBsXsXyS3zMq
         5vg+LHCG3DSdgbgdM8vH60CiT2X2z7Ol6JgiZPCVZ/5Bhv24PsGfyISVZELm8MpopRbx
         sDBgddwIZi6GrU+Crq9/T44PyfRY0YIoi5to7fjRenjkXNwxpoRrZY6V+zZe46Tp8xOZ
         ouhp8psszpeQjCT2ZqUip8K6P1DAbLgPemj4HI9wHVBR+7Fir7rl08fHneKcpptcJiJ1
         phQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241873; x=1752846673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsPSR2XmtkCGfmNXHOX1skWOOfQss8KuN6l1/rksPTs=;
        b=C5zvyRGVcLisDP/2cpqojs3akmCK950jTPnwIxgVBLHjxxcui4LHPPTeHCQ/vD1Mm9
         wDlzfdopIDoEt1s6+XBlupN2c6SVmaRuSkiYa4EQj9oCZYwBzXmy8rP8IC15ACQiwLnv
         nlK6JU16ZDmFEYeKZULNnDwq1+BhvmKl4jQNiUpUj/qHALwSnyST7gxVm4Yz7u6Jl2wO
         G1rtC9VSxf26f3uOmhxWx0FyKI+sIgUGONJggL2Y4Yggd2f6KV/ZAi9M21hPL640k1vh
         rANcKGlm8bg3eiHpkGAe9584tZ9q+5H+WsLN+vgAfdK/kUEfI9JEuUAVGiY4VFG4h2dd
         9PJA==
X-Forwarded-Encrypted: i=1; AJvYcCXzlRpA7aFks+NExGIcJHB6qSjlB1ixNLpMhv54fscyuGBWNtFt4f10k2oRe15q0PCP7j5X@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9sUSe4kr/5zt8F+lvwKsBsjiKEG6ijhVIES0uclSsVnmijLhg
	CLqRUoTgESa4cgksTrJoPB+2EfiTbtE9k/BoaV3E37zDJ50eoTULbOiB
X-Gm-Gg: ASbGnctwR5kw1SYx4D/eR6Z4GHpuvOUBHzRwuvspBy1PEOTpu8wsb9PwHF/s6gsH1xK
	sBMkio2aC2bQrowvFBc4o1OjEO0DImYWKmD7aHZum7vaTwgyugaD21fEwGFGAx6Temn9XqocyiG
	q+Trs04nvcmeF0IjlPOYQbJEmLNPy3T0glI1mt2bQ+L6ijtzhN6kpEvOwsSzHCHtqwe98T4Mml3
	FpdAoV/sjcL9C8D+KcEFYsPJzNf2iOjf1CsQ9QdP4oTEm+05FgttcUe4YSgUhH/lrbFmtmV3B4G
	UP2rgaLSTPlGre8xC4jN5IDy7hkEWM8f18mSij4XUy3+6ca/upLJlH8hDVXg0WzpTgG/i2tvbQa
	FXY5RpQk9MLZ5j2Iv71OCGdLLKZCcS3oyZoI1am4NRzlUy9OCQHpjqT/ggDIST1JqO73HosVOXZ
	WDf+Z42oTbmaSD
X-Google-Smtp-Source: AGHT+IG3j/mYxUHwTH0mxjQzJmi5wM/B/2jJ7NoKNHSKvwfZfcpJKZZ0N//i1HDkgCQ/ZVvMkY8kaQ==
X-Received: by 2002:a05:622a:15d5:b0:4a7:f9ab:7895 with SMTP id d75a77b69052e-4a9fb85a364mr59155491cf.4.1752241872555;
        Fri, 11 Jul 2025 06:51:12 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab04d910desm6281831cf.9.2025.07.11.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:51:11 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E4103F40066;
	Fri, 11 Jul 2025 09:51:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 11 Jul 2025 09:51:10 -0400
X-ME-Sender: <xms:zhZxaKTEY5U6c6-_3YyteOJniubYemra0aIgWHSprXHT3_pZzke0aw>
    <xme:zhZxaBR7JwdG7QGEZOBQI4QeI9TSQ3VKT4i9MVx9JGDDrq0MbjsFxfUgnOXTO8AcL
    5MNKyRYtqHSvDSqiA>
X-ME-Received: <xmr:zhZxaMa-4paHWzWkXrjNawC6kruDLPCCMKQJhprkgO3ptlwOjTdGkobVFQ>
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
X-ME-Proxy: <xmx:zhZxaFjIaiy3xPKeX89dY2CnVso02CcRHAZ6H-bY4j5chU29C0n1Fg>
    <xmx:zhZxaBi1jZJ7WSKFHml3JNgnciAGNRFFk0_a2NGpKqyJNE1l5Pm_Vg>
    <xmx:zhZxaLLBzQItEUnD5qoXsWMEqjwIuNI7l76Sj1l9YNPFmYb_9ySjgg>
    <xmx:zhZxaIVuakmfosevnFBxyDrY9TH7fm6Jz4CqAjyqJ8JD62rYJZq2zg>
    <xmx:zhZxaN1t5hd4nS0wzZcm9R61A2WLCP-yZjx72mnuzcXa9yl5_uellnkB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 09:51:10 -0400 (EDT)
Date: Fri, 11 Jul 2025 06:51:09 -0700
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
Message-ID: <aHEWze8p40qeNBr_@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-5-boqun.feng@gmail.com>
 <DB92I10114UN.33MAFJVWIX4AB@kernel.org>
 <aHEQKBT68xvqIIjW@Mac.home>
 <DB99JZ3XMHZS.3N0GLG94JJSA9@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB99JZ3XMHZS.3N0GLG94JJSA9@kernel.org>

On Fri, Jul 11, 2025 at 03:34:47PM +0200, Benno Lossin wrote:
> On Fri Jul 11, 2025 at 3:22 PM CEST, Boqun Feng wrote:
> > On Fri, Jul 11, 2025 at 10:03:07AM +0200, Benno Lossin wrote:
> > [...]
> >> > +
> >> > +    /// Returns a pointer to the underlying atomic variable.
> >> > +    ///
> >> > +    /// Extra safety requirement on using the return pointer: the operations done via the pointer
> >> > +    /// cannot cause data races defined by [`LKMM`].
> >> 
> >> I don't think this is correct. I could create an atomic and then share
> >> it with the C side via this function, since I have exclusive access, the
> >> writes to this pointer don't need to be atomic.
> >> 
> >
> > that's why it says "the operations done via the pointer cannot cause
> > data races .." instead of saying "it must be atomic".
> 
> Ah right I misread... But then the safety requirement is redundant? Data
> races are already UB...
> 
> >> We also don't document additional postconditions like this... If you
> >
> > Please see how Rust std document their `as_ptr()`:
> >
> > 	https://doc.rust-lang.org/std/sync/atomic/struct.AtomicI32.html#method.as_ptr
> >
> > It mentions that "Doing non-atomic reads and writes on the resulting
> > integer can be a data race." (although the document is a bit out of
> > date, since non-atomic read and atomic read are no longer data race now,
> > see [1])
> 
> That's very different from the comment you wrote though. It's not an
> additional safety requirement, but rather a note to users of the API
> that they should be careful with the returned pointer.
> 
> > I think we can use the similar document structure here: providing more
> > safety requirement on the returning pointers, and...
> >
> >> really would have to do it like this (which you shouldn't given the
> >> example above), you would have to make this function `unsafe`, otherwise
> >> there is no way to ensure that people adhere to it (since it isn't part
> >> of the safety docs).
> >> 
> >
> > ...since dereferencing pointers is always `unsafe`, users need to avoid
> > data races anyway, hence this is just additional information that helps
> > reasoning.
> 
> I disagree.
> 
> As mentioned above, data races are already forbidden for raw pointers.
> We should indeed add a note that says that non-atomic operations might
> result in data races. But that's very different from adding an
> additional safety requirement for using the pointer.
> 
> And I don't think that we can add additional safety requirements to
> dereferencing a raw pointer without an additional `unsafe` block.
> 

So all your disagreement is about the "extra safety requirement" part?
How about I drop that:

    /// Returns a pointer to the underlying atomic `T`.
    pub const fn as_ptr(&self) -> *mut T {
        self.0.get()
    }

? I tried to add something additional information:

/// Note that non-atomic reads and writes via the returned pointer may
/// cause data races if racing with atomic reads and writes per [LKMM].

but that seems redundant, because as you said, data races are UB anyway.

Thoughts?

Regards,
Boqun

> ---
> Cheers,
> Benno
