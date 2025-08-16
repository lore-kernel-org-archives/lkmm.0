Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B16EB79
	for <lkmm@lists.linux.dev>; Sat, 16 Aug 2025 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755360715; cv=none; b=Rh+3kvyeZ0ibpih1cB4C2zyKUhJsJIKl3uAdvalSS0N1vvV60S90NSd6+NR5LCe/smBpLP4r8M56q/NzafDUPYI3aylFmgg9aNI+y/FUstTFt7c22gEpBGs+jVVy8m12u/fkvAx8pJTMfYlqtMBLYgy/nssnQ13BYjjm9reT50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755360715; c=relaxed/simple;
	bh=EtMfV6kWwY7RpKSzy6jCkyzXpqZ6kO6pRgQEXOPNW1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2M6TooMaZaKPJC7OtZ3QnqcCk1iSkptQwtQevdO3QXYXoo5ezX+Cjd2NCGZVCC/V1O+HVvDBLzTHx1qEstpxtN7MUXEMYZPRv5IouxAXMrknU9rXFMm0V0WoY8QyP6+PnJHmHbLoB+gJoj0Cy0mceUy0L6dNGN0HH9cGncMXKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=If3pu0cX; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="If3pu0cX"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e8706df76bso425592685a.3
        for <lkmm@lists.linux.dev>; Sat, 16 Aug 2025 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755360712; x=1755965512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQSAsVXNS1069qI55AjAFU4SUhFAdBWLay5Yhtg6JU0=;
        b=If3pu0cXkID6NrNtlgWpGIGVpaExxEhbB+DeTyFGw8rt9nm1qZXjxKWJhdPPBQtRmv
         CGuDsZx0AA5zs6BRQhP0xFPYFmJorw63+HKGlaqFR2ZhIwEe5mr9Kfd2CVYDHhzOJi+9
         BYKwhmGgoKcKjY3S8eljanUVIGqurv95kXUzDlYFnDEX7mmtUeJeOWqLOmOzREuMOCap
         KGCtSJ2NRbVg46CNIJ+KsZ5SSCGCWwxSYraurNdtoWjybqkRvcEewpqEl0+1A4JGtwfn
         zecpfwk0tfDlvGqNCeSDcBTgIku4Zd78ZQfZuiWubM3m7Pe9t3lI1Nbygn9asECROhCv
         MI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755360712; x=1755965512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQSAsVXNS1069qI55AjAFU4SUhFAdBWLay5Yhtg6JU0=;
        b=NZC4s3GcIT8LMhcipR/Y5jho145FoL0KfdWn+Ollwen3enlhm3DgQj+hOu0O5jm842
         auzcm9Xcn5VP11HHwfyJNUrVIfaefW8CZG2LCaN8OOJ2LIA6M89pVxKQev9r0xEK146d
         8nzYNbtyVbZqAP0vBh/TmOkhxg97CV5oOWH+FssnBlZoUABBQchj9zI5/yuW2CRv3Het
         9a0UXikXHo8cIHhUAmnntHy0ViB40Y6NqNbQtqWc1t4TO+TZoW45CxASb2S6cZMRmJvJ
         EjTsrGpp4VClEwBwRg7F7+rmqdiKhdfGdC75ADUWuQnACUuVxaYPXefbsqgTZJ+tbh4Y
         ks1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgWrlnqBbxtloDzii94H9zWR9BfjPs2IQtbXXZkxW6davDQlmMwqS5bSTcUfynN0ChwZRg@lists.linux.dev
X-Gm-Message-State: AOJu0YxWkIaIlZggjFkekciMBcxi/1OMHc73rZDpN4GYBXr+v0W6emv+
	Uwa1QCVaQaCx2RaJhF/OFmW/LTw4IjkQ1U6n2ov9a5x28HZShSrD/KKm
X-Gm-Gg: ASbGncs78tuCl6f/mUAickFBrClJpX/iAHw4pPzmZc9Dh9GOmXJLkVAbv0Fn0GxQwcl
	kjqpUIRPNnk9QjgOFBWyf18zqIeZPyyQtMObqmyzEc1SleehU+oGRGnA8aHP43kAwXjLnFLA9om
	y9lRonztDVVrr+SflKTGOfIEobvFIrTHunmX6+QJwGiGx3nyUNMqjj069u4YYwtTzEy9k+EcCdB
	k7vY2Dr9UBJTmoydfgGjMQGlFPkFp5c+ns5fRaPGopihAIXhkxPhfXgpbyHhACJIq/N1UbY78ci
	I4TFKNIWq8R4+E6tktbv8F//+GhAcycs2sppQEPuWz71B+m/OiI6HacTv7pyAulwWCy3TKlvNWR
	pc34qTwdGCadyYkH9eGJHw6MeeE9KBSkkf/x4zvepjwkdEpHKB66VKYZm96dJrjDr9M1EJENcER
	+T0e1BzRHat0s+0OvA8M1GmNBZh7HbF00tAg==
X-Google-Smtp-Source: AGHT+IHr8ZShzqXQ/i14KU3FBbPl6pX+JdsCK1CS7YltUGPOZFM0P9Gl2uACBr6tjF0lbZaga/qmTA==
X-Received: by 2002:a05:620a:bd6:b0:7e8:1dbc:f126 with SMTP id af79cd13be357-7e87e0e1932mr614435285a.32.1755360712255;
        Sat, 16 Aug 2025 09:11:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b120b96b1asm22149831cf.26.2025.08.16.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 09:11:51 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3B79CF40066;
	Sat, 16 Aug 2025 12:11:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 16 Aug 2025 12:11:51 -0400
X-ME-Sender: <xms:x62gaLW9mWg5ENPTFlfeqfHH5q0WK6mX_5b7JlsdaARKZXDPchChjQ>
    <xme:x62gaFPD0cZJLh-8kRVq_kSBxvC5ig41ogZUtIJdUsUGS0TqMrEohkIE3Ji4r6x1o
    GA-k1p65bomAMp4aQ>
X-ME-Received: <xmr:x62gaGFmQsu6P2BjO6iXiU-gI5EUQoR_gbEeQGzyQpC9-0wrvh15AtyePx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushht
    qdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghr
    tghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjh
    horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:x62gaO0UpGqIo3BWdmBJv-9G1755Figkjske1r3fU73qDhGF6MraEQ>
    <xmx:x62gaGPtySw1amOUiigKhB7DjyrTvd-zGv0XXedLc1-rujtD-HP9Xg>
    <xmx:x62gaOIONn5kFOVqAXTBW-otbE-61KKT1IzAsRAYbg2UkUkf15uqBQ>
    <xmx:x62gaHZDaQBaK99vmsMSYh-sFRte8dLeT4_o1ZelA0LXVJt8Yvq_BQ>
    <xmx:x62gaHkQWYEjKOs74b6frLQhBO9o6dsSetGVu5P1hX_jkCobG9JPN9FW>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Aug 2025 12:11:50 -0400 (EDT)
Date: Sat, 16 Aug 2025 09:11:49 -0700
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
Subject: Re: [PATCH v8 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aKCtxVSm9kYD8NcK@tardis-2.local>
References: <20250719030827.61357-1-boqun.feng@gmail.com>
 <20250719030827.61357-5-boqun.feng@gmail.com>
 <DC0AGT8F3JH1.2PZIXKX9AQBWD@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC0AGT8F3JH1.2PZIXKX9AQBWD@kernel.org>

On Tue, Aug 12, 2025 at 09:59:39AM +0200, Benno Lossin wrote:
> On Sat Jul 19, 2025 at 5:08 AM CEST, Boqun Feng wrote:
> > To provide using LKMM atomics for Rust code, a generic `Atomic<T>` is
> > added, currently `T` needs to be Send + Copy because these are the
> > straightforward usages and all basic types support this.
> >
> > Implement `AtomicType` for `i32` and `i64`, and so far only basic
> > operations load() and store() are introduced.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 

Thanks!

> > ---
> >  rust/kernel/sync/atomic.rs           | 274 +++++++++++++++++++++++++++
> >  rust/kernel/sync/atomic/predefine.rs |  15 ++
> >  2 files changed, 289 insertions(+)
> >  create mode 100644 rust/kernel/sync/atomic/predefine.rs
> 
> > +/// # Limitations
> > +///
> > +/// Because C primitives are used to implement the atomic operations, and a C function requires a
> > +/// valid object of a type to operate on (i.e. no `MaybeUninit<_>`), hence at the Rust <-> C
> > +/// surface, only types with all the bits initialized can be passed. As a result, types like `(u8,
> > +/// u16)` (padding bytes are uninitialized) are currently not supported. Note that technically
> > +/// these types can be supported if some APIs are removed for them and the inner implementation is
> > +/// tweaked, but the justification of support such a type is not strong enough at the moment. This
> > +/// should be resolved if there is an implementation for `MaybeUninit<i32>` as `AtomicImpl`.
> 
> I'd remove the last sentence, as it makes it sound like one only would
> have to add that impl and be finished.
> 

Yeah, sounds good to me, will remove the last sentence starting with
"Note that technically .."

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
