Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1179134CB
	for <lkmm@lists.linux.dev>; Mon, 23 Jun 2025 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750646895; cv=none; b=amLXqIBdcuU5FYYNQ7F3DKMJLABmQdPks4cw7Mf1rTjdP/kYrzo03svOIP+IYIU5gFjHMObZSb1eAEvX3N83je5p8whxoqee8XNSZ7zevDaImzMGpOcYyfU5N1mTqhuGg6HWHkjd8onrF1u6L76PGSZzyaNpI6dyaqftN5RwY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750646895; c=relaxed/simple;
	bh=9yVcyJBRJnRpt1iF81CbrRUu+UUHjwSxXynZSJdXxrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKbpSCJcQ9BA3toSEuk+rnL1WKMqU4bT6z3qMkK/R3OapK3dhNQYvDjxE+7q4AGUqTpFGoS2yZwIo2kVtQBcG8LH9TNphzREl5zsTjDvuA0SrL2RXHOYeD0hSuQ5muViORyN0B5efSgo4YOeuLmf/cFHOyAm11e6pj2vHYPztFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgC/HkG7; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgC/HkG7"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d09ab17244so394049285a.0
        for <lkmm@lists.linux.dev>; Sun, 22 Jun 2025 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750646893; x=1751251693; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJHmf9BuChhjoB+0hgGrMkj7NgDeDPSjjYZiYpn+uMQ=;
        b=MgC/HkG7FuWCruVNLAjaVS4qPNXIsUtUcUZSv7DoqTbzPzatwkqa0xeJ7Uxd2rv8Ne
         pw6ka0NIAdzI/LOeMBeGn4nUg4lQmuA0vAM5JzJvPeo+boUIgrlWjw0eB98qVhBHbmVo
         k4L3jLoAKOgSEwcQCrtGCol9Apu3q/90A8JxkpZnBG8ZqHqXvV7BqUMprUO6n9bJtHW7
         vIqW0s9eX/w3hKz+m8wpymiHfo4lhqnMwc+C2CK2EfpOQqLS3gMqqbPhS/x0n0Dp4G0w
         IG08fdn2CLVMgCQIs5eGMlhLT6kkrYuh/nP5+FE4ERw3HmxuY1rRlOYL71h1eSD1TD7G
         HfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750646893; x=1751251693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJHmf9BuChhjoB+0hgGrMkj7NgDeDPSjjYZiYpn+uMQ=;
        b=lx8QcjKUy2k4Xoeppcd7J8eigZ1f9G7BenL9JlgGnRp5i5ODsOJ0N3FXS1S/qEvJLB
         Dz9Z6wDFDC6qyeyvS16wiSGj0lCUT29VaW30GOKofKe1IhMFGJMgCL1QPLjCusaCIUXe
         xyRWdpZzO3AgB1efuSxdreF8PRu+8DQ0cmcVofumm2CQV0OS9zmk+fDnhUU0BHOw1Tw4
         beUSLvddbM2BKrkH+8rQLnJwcmu2/oAXeHd5NnRXuiDNmbT6o9JFrBKH2n8rdfE1/JEx
         ZaPFZx8DiGJ4cfrcI8rmldk2A+jst2BwKZAXzEdZFE/hWpXciVAm+MtK1+SJJz718ZUP
         pkFw==
X-Forwarded-Encrypted: i=1; AJvYcCUCjanQ+mEGdWVAhqPRDOiIzlxVcrHI2eAskveW5EkDNaK2VILRThU2IkF40Opk8ToWZenG@lists.linux.dev
X-Gm-Message-State: AOJu0YzSiLxmiWDw9DocK+y1Z9Yt16cbo9JFt87k/GO8a5S6tBB4VQjc
	zNSbNq/5d90Bs8gn0eU13W7gkCbelOZjn1z73lc/unlZvlo2NJ/gGTcB
X-Gm-Gg: ASbGncstjdzDpBVMCI9z7v2CK7AHx2j5RL/2bsLqYnHEFNl1FglNz84Thr+NLFDC+n9
	udI5GIMTxSLjwREQmOOcrmBjwZXCV9IkZkALvOb/1q76jPsr84iHuyOyo16sWsB2wvUO8NrYdCs
	3ZleTxRZ0NApXeos7cUbTSNw7V2uT1PRuyrzXiD9AqaXnQFGQrkgF7Ts1ziMWFLjXtLx/bhCcei
	PgltsN66mQoJNmB9ickrF2n/50WZS3lpxJY+jpk7yk7UtCMbHyalRMkc0q0rs3N9QrvYgNAZqRA
	if60/tzciurNGcYtWCZ6kV4ckNL4ckWUCvfZAUTcrAIzEa/MsZ5Y84PmCvLH2xgX255vvvzBTxQ
	ucrblEovqEuO7pxZ/w96yTqYzgMHHGY+zB8MKRlTgWYaqtL5DC0kw
X-Google-Smtp-Source: AGHT+IEgIIA1mAlgzss/AbRlW6vBFk50Ygy+OJLrrlVrrDryQW9ibya3VqZUGjDidzFElD3ARz9mVg==
X-Received: by 2002:a05:620a:4727:b0:7d3:dccd:4048 with SMTP id af79cd13be357-7d3f99540aamr1889476685a.55.1750646892658;
        Sun, 22 Jun 2025 19:48:12 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d9db4bsm34012431cf.35.2025.06.22.19.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 19:48:12 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 634281200043;
	Sun, 22 Jun 2025 22:48:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 22 Jun 2025 22:48:11 -0400
X-ME-Sender: <xms:a8BYaBlh_9fB2I80ppJGMq8DKx65H_YaYgIQycySnRkvnCGkIbTb_A>
    <xme:a8BYaM3p-uHvF5RzYpOu0SopxYPyJVOmKFbJfzJu2ScgdpIeCop-DZIuQ878X6nPy
    VZfMNC1lnUAtfyK6A>
X-ME-Received: <xmr:a8BYaHoSQOyQEx6ic5HUKRr4J4xH5QMbFHtnNFUekCU26I7Sbmzg0UVnQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduheekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmh
    hmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghh
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:a8BYaBnmPEFJ4d8QKvi-WMEHfFqEuO2FHAvh3xzmaEkcsqYNlGqgEg>
    <xmx:a8BYaP0y-IaM7xqPn_0XfF4xLex-_D_ND-YIHOzDh9m2sQUf7MxvVg>
    <xmx:a8BYaAugn12AZrGcyaRiMgYkQFmjEVoNq_DSkx1kyCdo5ydSnsq4LA>
    <xmx:a8BYaDWYgs1GqJ0VGwXURuyTeV6QE5scxNx6bIbsr9OX2NJlqrJbpg>
    <xmx:a8BYaG055yTWM9iLKHGd0Vj6deBdyhKVufpRtwATfwBRZOaxwvojcxZf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Jun 2025 22:48:10 -0400 (EDT)
Date: Sun, 22 Jun 2025 19:48:10 -0700
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
Subject: Re: [PATCH v5 03/10] rust: sync: atomic: Add ordering annotation
 types
Message-ID: <aFjAarXzLPnv2kHO@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <20250621121842.0c3ca452.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621121842.0c3ca452.gary@garyguo.net>

On Sat, Jun 21, 2025 at 12:18:42PM +0100, Gary Guo wrote:
[...]
> > +
> > +/// The annotation type for relaxed memory ordering.
> > +pub struct Relaxed;
> > +
> > +/// The annotation type for acquire memory ordering.
> > +pub struct Acquire;
> > +
> > +/// The annotation type for release memory ordering.
> > +pub struct Release;
> > +
> > +/// The annotation type for fully-order memory ordering.
> > +pub struct Full;
> > +
> > +/// Describes the exact memory ordering.
> > +pub enum OrderingType {
> > +    /// Relaxed ordering.
> > +    Relaxed,
> > +    /// Acquire ordering.
> > +    Acquire,
> > +    /// Release ordering.
> > +    Release,
> > +    /// Fully-ordered.
> > +    Full,
> > +}
> 
> Does this need to be public? I think this can cause a confusion on what
> this is in the rendered documentation.
> 

I would like to make it public so that users can define their own method
with ordering out of atomic mod (even out of kernel crate):

    pub fn my_ordering_func<Ordering: All>(..., o: Ordering) {
        match Ordering::TYPE {

	}
    }

I just realized to do so I need to make OrderingUnit pub too (with a
sealed supertrait of course).

> IIUC this is for internal atomic impl only
> and this is not useful otherwise. This can be moved into `internal` and
> then `pub(super) use internal::OrderingType` to stop exposing it.
> 
> (Or, just `#[doc(hidden)]` so it doesn't show in the docs).
> 

Seem reasonable.

> > +
> > +mod internal {
> > +    /// Unit types for ordering annotation.
> > +    ///
> > +    /// Sealed trait, can be only implemented inside atomic mod.
> > +    pub trait OrderingUnit {
> > +        /// Describes the exact memory ordering.
> > +        const TYPE: super::OrderingType;
> > +    }
> > +}
> > +
> > +impl internal::OrderingUnit for Relaxed {
> > +    const TYPE: OrderingType = OrderingType::Relaxed;
> > +}
[...]
> > +
> > +/// The trait bound for operations that only support acquire or relaxed ordering.
> > +pub trait AcquireOrRelaxed: All {
> > +    /// Describes whether an ordering is relaxed or not.
> > +    const IS_RELAXED: bool = false;
> 
> This should not be needed. I'd prefer to the use site to just match on
> `TYPE`.
> 

Right, I somehow missed how monomorphization works. I can drop this.
Thanks!

> > +}
> > +
[...]
> > +/// The trait bound for operations that only support relaxed ordering.
> > +pub trait RelaxedOnly: AcquireOrRelaxed + ReleaseOrRelaxed + All {}
> > +
> > +impl RelaxedOnly for Relaxed {}
> 
> Any reason that this is needed at all? Should just be a non-generic

Mostly for documentation purpose, i.e. users can figure out the ordering
from the trait bounds of the function. I will say we can probably drop
it when we find a Release-only or Acquire-only function, but even then
the current definition won't affect users, so I lean torwards keeping
it.

Regards,
Boqun

> function that takes a `Relaxed` directly?
> 
