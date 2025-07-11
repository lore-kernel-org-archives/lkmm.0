Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF21A1FDE02
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752269701; cv=none; b=fwTyVZxF5LJF3J7a0oIGJ1/zb4581cSOwmdz1DDW3ZREwLXsCvCxolrxvlDFd5EIIb7qXiglyarRcXVItOq8VBh2Fnb74YkWM4+13LqEq5Je/yLX9x9dIhBEHVnMkXFRs9kbBhF8GGm793JyLCmuOSkd+Km3W4885onkK5Aonkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752269701; c=relaxed/simple;
	bh=8V8ejNYB3QXOIEBL61iMBdPzyE+6vjhOjCy9tOR4HWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OorZHFjNaDhsZ89Yl0YvrSKSm5twJWAr06DTlCJHiOhHmFxXITezmEPtI0Vfln87+OL5bFV44C19Bjkh9w/u3RAStzrafmu1YnQAfE+oiid8iRLa6GQuaJRCoR6m4ksivnG3rhtxsih0CZLngQN3VKA6AfLwV0/4SluaTNbziz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVGWRSL8; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVGWRSL8"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fafb6899c2so24277976d6.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752269699; x=1752874499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lxb4wH8x/KAvU0TG5QbcaePRN/pYWDrgWrEuOMXDQ90=;
        b=gVGWRSL8/Gmb7Jx4/tXTs9u36gKV7dFr0JRfoRCZhZ2EXLJ4ftIgiu3G1puFroRLvH
         YiAqUflHAMHZh/sVl1yReQSEyr/dDNHC4mNn842YUqxqgb7VN9daF6hP93H1RsdlLj2u
         PAzCqRZgBmeClhDxLCJH0cgz1Nqpr2bf4Qm+RYzww54Jn/gO+272WPYefOoxMCCoZs5x
         gzmmgrXXurhBW7PivW9kZkalwk46TAodw5dhz7UW/3tHKMOBUOhQzWpKmKaDpucnnLB/
         bGULb5Aug1bDnYLiSLZeAttYFf7UhsWlFgFT49zvi/9Z7Tmqm4GuoCDzmZfG9Rr8LbgY
         YyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752269699; x=1752874499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lxb4wH8x/KAvU0TG5QbcaePRN/pYWDrgWrEuOMXDQ90=;
        b=bJH+XeLSyx0MP1oJYX3FPDFPbNFIjyY20FdbL41hUeeeeagNX7w7HEMYaXowbzAXS+
         AeTgYFGyYP/wR5Gs6nfiomZ1G3VSvAQ7kh/G4EaKhUT6nElv2CM61CBdRnD/XwyFviCj
         tG6H4xii739ZT+t2c20qpHv1aW1qK40n5odbBVDU3uBsYNxlAZ5LKkR4ek2FuoCVDv0f
         LicZpcU4AwzMGD0so5tSSG4rYDuGMMidmvMweKLQQ9pM4MAEQvM3+JbysmYVDWoCVgXP
         sbF3nAXv/8pJeaN9M/JYtn5gz7Qpi3dNXRYZETBBTE5nmEl0NWcgeV3W/Y0RleFkd2wg
         5zAg==
X-Forwarded-Encrypted: i=1; AJvYcCW8Q22kXW36COfgJYO5D1MO4f3H4YDv3EdNnt8Ltv56jkt9OkiBPlcc5ZKmE3aztUczcaHU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2qjh4QQ9e+9+HxA9HcPs2PnexYerfwiTZoAyseHb9QDBI3RWe
	iy/ueoVrYDmaNI+htVYw0brow9lCa+roQD7KojYG3nBf6wLhdWet4Kbp
X-Gm-Gg: ASbGncs80LKHwR2ULD/5///i6yyVZF3uy1VjcqHbN7jj4N4SNTICqJk9Tli7zXLzI+V
	QfC72gyOZT69ws8On4t/La1dGLawzYQllBQdf1FZZ0TSr+LiwX/EJU18bqUipTr9NE4wBOh5Whv
	APYVL3NepaqqeYyzhbGb2nRj5KVXb6/8oyJMybXnBgV8wHbXxoSYLNQ48aBgTjsiO1Ey3ksQOcQ
	NUX47g6jhm3WuH0TfkiitogihRm0hUoZB/AJNot9L9ViczS+37LZucCT/iNVA/v6afRMUnYlu6z
	dSZfPWrXYHRaBusAXjm+y93Oa6rPrTf/wTD/1bOFHk2pP08MMnDnE+3zH9JTp/IC8B2hmKL7Vbr
	aVcVFNhX6gqXnaVnMorBSb9+pMOjZuz9ffu8MsQ0vy6mM5eUDIOs5FPiQYlZVvb7G+fNSdR6xMd
	ycBW3A5RmxUUJa
X-Google-Smtp-Source: AGHT+IHMED6K5lGCMSJ0yq1rcoBeti2f+RCAxN+T/qCub0Cjg/418vwbxIe/+Pn9uN9IhYOad0ZNFQ==
X-Received: by 2002:a05:6214:2f85:b0:6fa:b468:caf4 with SMTP id 6a1803df08f44-704a37c07eemr78816456d6.0.1752269698538;
        Fri, 11 Jul 2025 14:34:58 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3d3b0sm23705646d6.80.2025.07.11.14.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 14:34:58 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77DC2F40066;
	Fri, 11 Jul 2025 17:34:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 11 Jul 2025 17:34:57 -0400
X-ME-Sender: <xms:gYNxaGdBvTM2s0Cwz0fafm6GKM784HD_5eeJRdKuYE9mPCRcnZIy2w>
    <xme:gYNxaBvMHPdbNOmnyVNPtQdPtQq3qN4VWc5chnt765TQDk9Bjb9U-fGQvJLleFwQY
    GS4H8SsnlNSI4EfPQ>
X-ME-Received: <xmr:gYNxaMGIlu2mFzSUvC0MC5YgUisahE0Xrv42czcc7lJz4eLvF5dQJscyG00K>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeggeegudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:gYNxaDdK03s5QNpo2cDyrHAsP8fp3x0TejBuUDEihB_RRTg3Sqq3uA>
    <xmx:gYNxaAtbT2KVKtTimwFiV8DkQkVW-wjD09WBKFaX8LW5AQanefDXXQ>
    <xmx:gYNxaCm8XSnaeJD0UodY7h2R6CNrSOmBpCjmoL538_vaF53_cDsejg>
    <xmx:gYNxaDD9cidslKocyagtnuUA9V_raJr4OQhLPREwhdQFwFV9LRv4pg>
    <xmx:gYNxaKzOXCGgQDgcNDWR25KxBuPJQwO9H4zaj24T3gCLLh1ydye-9qK1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 17:34:56 -0400 (EDT)
Date: Fri, 11 Jul 2025 14:34:56 -0700
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
Subject: Re: [PATCH v6 8/9] rust: sync: Add memory barriers
Message-ID: <aHGDgEFXIx-aPQ_V@tardis.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-9-boqun.feng@gmail.com>
 <DB93NWEAK46D.2YW5P9MSAWVCN@kernel.org>
 <aHESYzVOTCwADqpP@Mac.home>
 <DB9GF0U3JJWL.3FQFMRTBO52C1@kernel.org>
 <aHFlS96FTRgS0dH_@tardis-2.local>
 <DB9J417F3XRT.1XGPA6VLF9T8K@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9J417F3XRT.1XGPA6VLF9T8K@kernel.org>

On Fri, Jul 11, 2025 at 11:04:09PM +0200, Benno Lossin wrote:
> On Fri Jul 11, 2025 at 9:26 PM CEST, Boqun Feng wrote:
> > On Fri, Jul 11, 2025 at 08:57:27PM +0200, Benno Lossin wrote:
> >> On Fri Jul 11, 2025 at 3:32 PM CEST, Boqun Feng wrote:
> >> > On Fri, Jul 11, 2025 at 10:57:48AM +0200, Benno Lossin wrote:
> >> > [...]
> >> >> > +}
> >> >> > +
> >> >> > +/// A full memory barrier.
> >> >> > +///
> >> >> > +/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
> >> >> > +pub fn smp_mb() {
> >> >> > +    if cfg!(CONFIG_SMP) {
> >> >> > +        // SAFETY: `smp_mb()` is safe to call.
> >> >> > +        unsafe {
> >> >> > +            bindings::smp_mb();
> >> >> 
> >> >> Does this really work? How does the Rust compiler know this is a memory
> >> >> barrier?
> >> >> 
> >> >
> >> > - Without INLINE_HELPER, this is an FFI call, it's safe to assume that
> >> >   Rust compiler would treat it as a compiler barrier and in smp_mb() a
> >> >   real memory barrier instruction will be executed. 
> >> >
> >> > - With INLINE_HELPER, this will be inlined as an asm block with "memory"
> >> >   as clobber, and LLVM will know it's a compiler memory barrier, and the
> >> >   real memory barrier instruction guarantees it's a memory barrier at
> >> >   CPU reordering level as well.
> >> >
> >> > Think about this, SpinLock and Mutex need memory barriers for critical
> >> > section, if this doesn't work, then SpinLock and Mutex don't work
> >> > either, then we have a bigger problem ;-)
> >> 
> >> By "this not working" I meant that he barrier would be too strong :)
> >> 
> >> So essentially without INLINE_HELPER, all barriers in this file are the
> >> same, but with it, we get less strict ones?
> >
> > Not the same, each barrier function may generate a different hardware
> > instruction ;-)
> >
> > I would say for a Rust function (e.g. smp_mb()), the difference between
> > with and without INLINE_HELPER is:
> >
> > - with INLINE_HELPER enabled, they behave exactly like a C function
> >   calling a C smp_mb().
> >
> > - without INLINE_HELPER enabled, they behave like a C function calling 
> >   a function that never inlined:
> >
> >   void outofline_smp_mb(void)
> >   {
> >     smp_mb();
> >   }
> >
> >   It might be stronger than the "with INLINE_HELPER" case but both are
> >   correct regarding memory ordering.
> 
> Yes, this is exactly what I meant with "not working" :)
> 

But be stronger is still "working" ;-)

BTW, replying you made me realize I should make these function
#[inline(always)] so thank you ;-)

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
