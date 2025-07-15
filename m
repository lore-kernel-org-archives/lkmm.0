Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92592E4993
	for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586429; cv=none; b=sMalOUc36+MWCDAvTWf914P9uDxI3C5sGo+hjVGLhmtx09uSo6HTIda52OiTU3y8ErwKhI0qB6RtdVQbbY0cfMGj4mc0oKxvVWB1gkP+7Icxga8vNsD8QopJ2xQe9xUjcJtxZOY9/ux8UQ/YGO09VGCfN/Wmh3ibRl+qZ3VBUmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586429; c=relaxed/simple;
	bh=pVE5YnjCSPErRIluAjIvy/UtsReHKlr74mAmZRFiN9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfwFrd6e5DOsQjb65vK1TqDKV9bCsxsxsb1Xy15JnZIEg6QzwZ8gBd9OrDyK1bOyOQyaR6hLaarm2LcaFEXsY6aLGu4s+nyoJLM09L9EuN44bM9v4M+i+RAhMzawnxCPMxq0AKVCOa6efcwMUkUTLueTP/ePtvFFbgfZX4FATqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXTnVOCZ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXTnVOCZ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d95b08634fso345345385a.2
        for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752586426; x=1753191226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2oaG9QbGpOsofvR1kED/97aI+p4RU3s8x/wrVWRQvs=;
        b=OXTnVOCZ7j9TkEh2UJo/CRFqXhRYgpPeJM/PMxNDV43XlqsALIxVXbJTPKj38uDgaI
         wEkLaTDa1TwiiRWmL7Gb3S/PjcaPiao7QKEio/HTIzed1E2YCPfqAmadiqnxa4NGgi2v
         pofDQyHSmJMYC2TUJM6epJXX+TQrwnINfseox73QWRM4abNlwPL5gRn3FfarHYDFf3Aa
         HcyQL/1gQck84LJJFI/2CBv+p4lOPkvQFc2snYLYD9lg2T5AoDjxMRUJeeJ40LMlB5NY
         2KF1dJKz98GWTD+PzMGo5fBlPtp/ZkfE5SkLmpvOWuDoeP79Y6qfyX+7Zr49A90/jcAD
         tJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752586426; x=1753191226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2oaG9QbGpOsofvR1kED/97aI+p4RU3s8x/wrVWRQvs=;
        b=rO4pzyLnvJlTqa0xWJ/+PXL8RTknJsQjy8+NveAWyNe6fwgqEM0QBZ6dEQo9lGzUB7
         QeXcRHL7n0jHhUNCj/tKP1nlORSkUaJLRaxXdND2a9CIiZWvrl8b78Zh2yGRgGvaNh7t
         nJW1QsoRz6Uaydn/R8tcAMkFNtn0QS1kN/Mj8bMa6SeFrmEHu+5mezuSjzLvZmS4Gzen
         OdiNg4wU5JIXylWMkxS8fVjw/BuHbWp5XvSgujRzyCdL8buaX273MVyMrawD7aUmtM+w
         defqu55qOXhWXtZtFkPismMR4OFp2dHLGx9U/utZOgDTIsMvzAEZQwmmF9tcK5TPGMtS
         Hbiw==
X-Forwarded-Encrypted: i=1; AJvYcCVPjyG9sDs1zymnmAeSMdL9I9GQW+keu2tDshiCbEzZJ7dclLfIcY/JU51DDy2MqGl7VVZ4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn+AQZT9Kbs0u2C2IX2s+QMjkHAIgXTbzY9ySvfoMgRrFa12hN
	8XUfqYeBGjlk3k2yXoXQM/b241A5rjzpinPHq2+jmzJau3u15zghWms2
X-Gm-Gg: ASbGncsGl/SBJpqY32rni4UKUEdKwux4KFz6SW/ekXICeD0W7hGa2IUsxGvXmtFf6tW
	d7altIFSDbNTAcgrH+Tdvy/LaMP0uow3LOwwJMDokBjBmGFAoOAdkmq242jMnabG8A+NCMjteqs
	F3Fmo+BgZLJ6Bd6mc5ENYFj+LKRWXEwiUpvFehS7kbOj+Ezt3AgvNMDalbg5cIyRiqX47TnxPEa
	/6gYOanZzOxXc3WXEWuFI9FtEfH/DC7M4omVXBFYzajvaBJbF3ozakOAWjti+8n8cSY7lvr0rQF
	ZHROaD93fim4yScGwHz8m7M6s4N3PCL/ZibYgnTXo1QF1uZN8Vrnrv0XSHI2TAIVnZlm5lyMWNR
	QiZ7vepdNs/O7IMU8O2Zuog7rVeWuaGNwydWSZmz5Ai5HUpjgYiAoCdQ24u+mfoInf2qmZdASeT
	9f6B4J0fAaEMhI
X-Google-Smtp-Source: AGHT+IGtEc1parY4FUeNpX2+Bcp/b0sdIePYdFNZiOG5zXg79PFDIVIOA5PlCc8JtvGRJOYeJUl9qg==
X-Received: by 2002:a05:620a:454b:b0:7e3:3aa0:f458 with SMTP id af79cd13be357-7e33aa0fcb8mr285334785a.28.1752586426150;
        Tue, 15 Jul 2025 06:33:46 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0f7d06sm623142785a.40.2025.07.15.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:33:45 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id AC8FBF4006D;
	Tue, 15 Jul 2025 09:33:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 15 Jul 2025 09:33:44 -0400
X-ME-Sender: <xms:uFh2aC30q6AKxLqUKbhQa0YHAlIL9HJ6MlAvsViswuuGvF21EqDi6w>
    <xme:uFh2aGnO5E8J2lVLK3O36iYH6dXYJVkPq-mOMADZxCmPXiueDi3vxaI2zfGQUVP93
    36YF_ePJjt5_Uv0zg>
X-ME-Received: <xmr:uFh2aPeXuTDJDUIj8Pq7tuR1qQubWcHHhwkLAIAjJj8ln0wBewkNR9nkNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeeliecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:uFh2aDVIM2vpqHVADDaHSRic9-6M0HWQ6ZFuNQh-XD3HwPvEiQi6zg>
    <xmx:uFh2aDG0iPYRmRa7efCozL1CydFxXcrrN7JUeSWP6TNbRRs2gTqsog>
    <xmx:uFh2aFfV6O4Cw88rIW1163ExYo-M6RQZCYeR9J6mKD88SnEsxkvgPw>
    <xmx:uFh2aMYJtFY180locnCXo7UTK6UCeuqQjUeXn8rcFQtOEoB5UbYAQA>
    <xmx:uFh2aIrupV_NKBTr9cgufyeZ3hOKr_qFzUNsvJhJk7reSgbe9-qU-zhE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 09:33:44 -0400 (EDT)
Date: Tue, 15 Jul 2025 06:33:43 -0700
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
Subject: Re: [PATCH v7 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHZYt3Csy29GF2HM@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-7-boqun.feng@gmail.com>
 <DBCL7YUSRMXR.22SMO1P7D5G60@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBCL7YUSRMXR.22SMO1P7D5G60@kernel.org>

On Tue, Jul 15, 2025 at 01:21:20PM +0200, Benno Lossin wrote:
> On Mon Jul 14, 2025 at 7:36 AM CEST, Boqun Feng wrote:
> > +/// Types that support atomic add operations.
> > +///
> > +/// # Safety
> > +///
> > +/// Wrapping adding any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
> 
> I don't like "wrapping adding", either we use "`wrapping_add`" or we use
> some other phrasing.
> 

Let's use `wrapping_add` then.

    /// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
    /// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
    /// yield a value with a bit pattern also valid for `Self`.

> > +pub unsafe trait AllowAtomicAdd<Rhs = Self>: AllowAtomic {
> 
> Why `Allow*`? I think `AtomicAdd` is better?
> 

To be consistent with `AllowAtomic` (the super trait), if we use
`AtomicAdd` here, should we change `AllowAtomic` to `AtomicBase`?

> > +    /// Converts `Rhs` into the `Delta` type of the atomic implementation.
> > +    fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
> > +}
> > +
> >  impl<T: AllowAtomic> Atomic<T> {
> >      /// Creates a new atomic `T`.
> >      pub const fn new(v: T) -> Self {
> > @@ -462,3 +474,100 @@ fn try_cmpxchg<Ordering: ordering::Any>(&self, old: &mut T, new: T, _: Ordering)
> >          ret
> >      }
> >  }
> > +
> > +impl<T: AllowAtomic> Atomic<T>
> > +where
> > +    T::Repr: AtomicHasArithmeticOps,
> > +{
> > +    /// Atomic add.
> > +    ///
> > +    /// Atomically updates `*self` to `(*self).wrapping_add(v)`.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    ///
> > +    /// x.add(12, Relaxed);
> > +    ///
> > +    /// assert_eq!(54, x.load(Relaxed));
> > +    /// ```
> > +    #[inline(always)]
> > +    pub fn add<Rhs, Ordering: ordering::RelaxedOnly>(&self, v: Rhs, _: Ordering)
> > +    where
> > +        T: AllowAtomicAdd<Rhs>,
> > +    {
> > +        let v = T::rhs_into_delta(v);
> > +        // CAST: Per the safety requirement of `AllowAtomic`, a valid pointer of `T` is a valid
> > +        // pointer of `T::Repr` for reads and valid for writes of values transmutable to `T`.
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // `*self` remains valid after `atomic_add()` because of the safety requirement of
> > +        // `AllowAtomicAdd`.
> 
> This part should be moved to the CAST comment above, since we're not
> only writing a value transmuted from `T` into `*self`.
> 

Hmm.. the CAST comment should explain why a pointer of `T` can be a
valid pointer of `T::Repr` because the atomic_add() below is going to
read through the pointer and write value back. The comment starting with
"`*self`" explains the value written is a valid `T`, therefore
conceptually atomic_add() below writes a valid `T` in form of `T::Repr`
into `a`.

Basically

// CAST
let a = ..

^ explains what `a` is a valid for and why it's valid.

// `*self` remains

^ explains that we write a valid value to `a`.


So I don't think we need to move?

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > +        //
> > +        // SAFETY:
> > +        // - `a` is aligned to `align_of::<T::Repr>()` because of the safety requirement of
> > +        //   `AllowAtomic` and the guarantee of `Atomic::as_ptr()`.
> > +        // - `a` is a valid pointer per the CAST justification above.
> > +        unsafe {
> > +            T::Repr::atomic_add(a, v);
> > +        }
> > +    }
