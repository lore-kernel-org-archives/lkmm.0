Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D828D854
	for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295066; cv=none; b=mIPTa2xaCu55sSeg38oruG+Z/OYDMATnfrnCo9NLCyAqMbGgg1eX6NDqcJNOdJlcJDjJz0vT2CloSqrZGZtWnAOq6G51vCBUU2xGQZo81+CU6Fqy22iq6XydTBNrb7GX439eHc9VIUHGEPTl/7fVE7CGiUz+X4W5cZMntRXQ4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295066; c=relaxed/simple;
	bh=AvF4LKagJ5DoTnzOZ0qip/9Tmcll8h+LSAzEXGYGWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m25lHdBjY7/VNdoQZXBo7A0rkzpGT7NdUcNnVVX7+kbbQr2ITcl4nCYd9bgGWqyzHRDT2SFEWL/VbAz3IXSmTkzfCiXVQCJ5mLk5oQxwlt3sH7ZsJaYys14sSi5sRPoD5BH7Kx1oGP2NXBW/ip2fLuSddol5Es6hxE8UMcDF0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MKumXCpd; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MKumXCpd"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3e7503333so316953185a.3
        for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 07:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751295063; x=1751899863; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifhh0Z7U9kfZ8ibHSYCRMf91ur7H8Ree4fiHnfWDjwY=;
        b=MKumXCpdPBZTjhjdIiIhuE9LVxixU52kWFK3i4v54RY6ChiNCLWiSFo6kPuFs6oxZA
         7KMOhp2uls7S+d/GBuF3+KU7vnMtPbungdqKeavtH0xtaIlAjpviJmrT5tXJuAlFWtn0
         OlStOwfvg+RC6VV/OuQmws5y59HOuNVHeQbwsBliMwa9eSX83xDv+V6EnVH4u9TWuX6y
         LZNT/3iRp4ECdvFTWPo0WcDBMu5R5gq+FRi+apZ1Aj0dty4jj8kzwlC6KZ1As7t/zB+w
         pzRCmeLBKFcyb/DOekS+C85h4ojOGaoRX+pQWaYOVqRotQk7xh4FlFT2Lm/Xe8ffW40t
         drlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295063; x=1751899863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifhh0Z7U9kfZ8ibHSYCRMf91ur7H8Ree4fiHnfWDjwY=;
        b=IleQKNYZTbiZPCvEl7Zc2uXpEUQ2GFqoxpcLlF1N48Ply4EilYf55enezrKc3IWELD
         IovThrkEIfgSVTclzUwWCsx2GF/1ke12dNvh+cs/31MEeRpZNAiEcAn5F+Hn6k+4TTsh
         uKuUe+qzeUrGisNSgR+5nZyFzrWjRqqkGRoxDk7umvfdlquleExwjOqFJgckW+oJEkJZ
         3Knrk/C+2DOO8pTHLv3pFRyEbaxcWrgJDqtRzeOZGeTjoqxylYiQtiebLcMmyv9oJ3nG
         RrQ0Xcy3GRiiHfPZmW8RDLn+AR2dTjl24PA8J2GT8JcP730VeRzF2OJgaoafLVMFgRF+
         AOOA==
X-Forwarded-Encrypted: i=1; AJvYcCWjKShkdajH30T5y4z126q/zjfqC7InjQKd68S4c27LTO9ZPzyZokwkILV1uIBqG0MzMjFw@lists.linux.dev
X-Gm-Message-State: AOJu0YxRxD3vBE8NZ9FwRvmsIx2H5KYbhO6ZI2WXG+CSG8SmoWr0e3iU
	55CSB999/BzFmPMVayWo+L3+5ipbl0RpjCD5ub0vD4m8EcdXnktLSiTxCklBtFdGEQ==
X-Gm-Gg: ASbGnctBC/MwM6XpobDCbWm2QcofZz0KjSQSW1HBxaarHwWOBFL9ovs1+b6xHBuw5c0
	C97pX4tTTLcPHyBlfgGqAplV0D1vwATjVlBEhCbLBCGowwCD4CTfLmhfBZV2xUvyhOeF51sS+zJ
	CaRg+Pi4/cUTmVIqDsDhYvbdyzdl6Q5dCZlf4qtbUzMfCCWCTJwLwLmoHeKmt3bnKebLGWM9LrJ
	gb804czDKw2jPtTiP7ardn9ALauCm+3whnm5YNiKM2UJZrAhiQfIQP0dQLk3XMbYmq4dkLERsZg
	4t5ovLw4JpVi9rgh5w2BNSPEvR4SoCgniHIBUwY2LgYN1G/q+rNhSEgcwKuFOY30Oj7Oi9N2CcF
	BXps/
X-Google-Smtp-Source: AGHT+IF1yKNUOiHgxQRl5AX5C7pvK8S70B1QEWwBf8quTZXAN2qBcNb7LkpKzCS9x+idNI2rKNHtfw==
X-Received: by 2002:a05:620a:7004:b0:7d4:114:f81d with SMTP id af79cd13be357-7d4438567e9mr1837297885a.0.1751295063336;
        Mon, 30 Jun 2025 07:51:03 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d053sm67765086d6.1.2025.06.30.07.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:51:02 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:51:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <1cf36f94-7e70-48eb-a79f-ebde218cd716@rowland.harvard.edu>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <jBAtISwM9LKkR7KuCHEnym75NfGOM4z408pMuDfk4U8VzN8PQuk9JJfBc33Usre3YSjbgtFRj8c0ZNeeQMpZsA==@protonmail.internalid>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <87a55uzlxv.fsf@kernel.org>
 <_pLa3zqu-AHBOnxkEz7l13l9W-OsKBtuXIkjRsIJJy6EnYTrM99E8Yr24pzjqwCAj1_qs_PI-cVxRsBsbgiFdA==@protonmail.internalid>
 <aF9bmpX-i6HVMlaj@Mac.home>
 <878ql9zg90.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878ql9zg90.fsf@kernel.org>

On Mon, Jun 30, 2025 at 12:16:27PM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> > in atomic/ordering.rs, I think I can extend it to:
> >
> > //! - [`Acquire`] provides ordering between the load part of the annotated operation and all the
> > //!   following memory accesses, and if there is a store part, it has Relaxed ordering.
> > //! - [`Release`] provides ordering between all the preceding memory accesses and the store part of
> > //!   the annotated operation, and if there is load part, it has Relaxed ordering
> >
> > This aligns with what we usually describe things in tool/memory-model/.
> 
> Cool. When you start to go into details of ordering concepts, I feel
> like something is missing though. For example for this sentence:
> 
>   [`Release`] provides ordering between all the preceding memory
>   accesses and the store part of the annotated operation.
> 
> I guess this provided ordering is only guaranteed to be observable for
> threads that read the same location with `Acquire` or stronger ordering?
> 
> If we start expanding on the orderings, rather than deferring to LKMM,
> we should include this info.

The problem with the word "ordering" is that it is too general, not 
specific enough.  You need more context to know exactly what the 
ordering means.

For example, ordering store A against store B (which comes later in the 
code) could mean that the CPU executes A before it executes B.  Or it 
could mean that a different CPU will see the data from A before it sees 
the data from B.

A more explicit description would be helpful.

Alan Stern
