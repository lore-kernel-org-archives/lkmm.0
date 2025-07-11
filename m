Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A6A2F0E59
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255686; cv=none; b=acdwhyXrtXUV6G0CqPVU5gSWzddKg18gveqAjIURcTHx8Khue0+ZHyHXQoYnpTuY8CvLnsMCHBQIaotu+wIpTdmsoSv5Ph/ZJKe8dKF/fqTWfRA0VB7qKGXO6qx2GpBnjaz7TYMT733NSpGmNOWtkXANutsDjUfDExqKkQ+rjz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255686; c=relaxed/simple;
	bh=cLCnHVj8+ljirWOQd9O5cfG0RwK/Ng5yYUvNiegINwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=payXZ89FNK1XD+Tu2Jqq4/+yRzSoKTlfisrb3TMDUSHmoOaJwBsOFf6XA0BIZ9917jc4g9hSLFOl6YF/LDgcAjK3/5R9R2MPXqB3xjndM3+izsn9ke25b+b9peiJm1Szuvw4m22ipVEoPL8yai7ThhgSD1BKXlneNaIHiQo4jV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9YI8XsS; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9YI8XsS"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d3f192a64eso239585985a.2
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752255684; x=1752860484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJrUSlSVEvMRxwYdMNbEMJhgahQGA2PT4SXVfE7Jw6U=;
        b=A9YI8XsS9JIlrqHCs7JXkmqz5++hK/uY9ux9+LDveE6f4NpBa8BbcHen/nhjcjds2v
         PRct/+Cy76vz6oDxOxDrThbP056gEiLOKMs2Ut7DzkAK7I46TqnvySVSQGXqAo91YgNi
         Ci9c+naMjf2fmIAuPO+gX8EhKgPvkioAo10XEYgETBsnWQGC+D3FuV7tWV4TdpF1RT7P
         s7Z6ZfogwFxFd2hmEhnBruxlY9nk74qER+OcU9Vx9utbVIjJ+JpQihh74nGTAiJZg2C0
         LuQ4OArGn5m3BUoSAZxdQvPo08QqSQ91knbgJ1ZuGPA6dJp6TZGlH/FDGj2kUjgOk92D
         S87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255684; x=1752860484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJrUSlSVEvMRxwYdMNbEMJhgahQGA2PT4SXVfE7Jw6U=;
        b=APOavmlDVcOwiwbUnC+b9PgX4HZKy6cGyKf0HRwJbd0MPay3UumaZHLRLraflcYhHr
         POO0UGYv+qKo09ZgzJG6f/IU8L2m9ccj9RF+KXCKgSfjnB1l779qZ9eIwZHad3OheF/G
         ZddaNSuZ/iYPro0G+1n4s4EzxgSlI3lDHA4aih1ldwL79F3l4W+uORcv0kBMuuKnQOWm
         cAJ5ZditgNyaDqnXZb7GI+Z4SQ5CMWajKj5kn2cYJfrFnkmxFwwjN4MURB5gdDl1Qa20
         sxsEDzq8J99YfnDsFPIT1HHBnA5a3jjnmn/ig/jexBl9UKiYmW7nwUMYqapnHIR0bhOM
         EThg==
X-Forwarded-Encrypted: i=1; AJvYcCU6pOFiyTD6R1zEb1P1rwV6gZA/d4aSZXs4qA3NHhjFMZXvGUCdyCGp+rYF7wL1EMEBXFa3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx008ELLe6v5jwqWrA9M2S97J5sYOyx5CxcJwQTR9nm73HicBu
	dnO+WNU8eEIOOawOdPjJ3kZSUOogoGQn7GWzyvgAZw5c78S/FNbNgEnz
X-Gm-Gg: ASbGncv0JPOAG1X+SkZXwSn5DblPPsV212wDMLiwYtLpSTHXNOEnYCwUnw3p+zHEOyZ
	GCoU61NE8HBqFl6PWXyMceAh0K7frIDwojeD4AGBYkhWO5paxTfARDASwGAWiPaoRqz6na3O2kz
	8REcWy9Q1zAP42dAedpQO+IXlaY7bpRAPxR+RPcQ9fITExinzHKwD2+k6xMx+LhMq4TPXNLoMiY
	UptbJ2/mvq/EPIjgBUqMiSVn2c5VdRR2f6OKEAMdfJ8EGgJ7UmlaMlG7m3s5OB4rZJUlQTtP0K2
	qDyQiAfcYrdF1wTCw5ZyscZA7y62U5nbvQAgYQ64I9TSj6fhdh8awfdywDGwOqe9w04trs3+jNJ
	sLRILDWPPeokbX2h4Ok3bLIminv84U3hhNcEl0ofpqTjs2KYb/+HMB8+I1X6fC1CWvzRxqMP9kB
	2Rz3iXdSpVZzDK
X-Google-Smtp-Source: AGHT+IEcFHrrYSnrwFhqhrk9tfxFNzDW4C13SuHJUTonHuOx1CvcqAtuBC6NXdqwFyUvNyOH4KWBcQ==
X-Received: by 2002:a05:620a:708d:b0:7d3:ed4d:f865 with SMTP id af79cd13be357-7ddebc9346dmr618146085a.32.1752255683529;
        Fri, 11 Jul 2025 10:41:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0f7d11sm242440585a.38.2025.07.11.10.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 10:41:22 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1FBECF40068;
	Fri, 11 Jul 2025 13:41:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 11 Jul 2025 13:41:22 -0400
X-ME-Sender: <xms:wkxxaICFJ46BxfQFwqZtzFxeTeNAilTvmuVO-4QAqttNLn8I-bQHAQ>
    <xme:wkxxaMBAlmRcN8Xjcw10oA50F-WGycKcv9gtD0Ky1zkkgSo-nYKDySdRkQEP2e9wG
    2_roNOOZXim6qyYcA>
X-ME-Received: <xmr:wkxxaAJxNUfuvPRGZGYu24Z-oKjyRhTMBknx6X8uuWfagOkQFUyJA_uJMhZi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeelgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:wkxxaOSTEuPnQhYpOqi7fLV7VbzHWxLG5CGVoBsQ2lPk3sqmSCC5hA>
    <xmx:wkxxaLQn7yXgpOYzqzLbhg-5g8ZQ7HdRVbgqvg3gx2rCyXzXMfuRTA>
    <xmx:wkxxaB62E0DsNYDK1Wn9uvODd414YWUPab0U4a6p1ZVFvVyxZu3otg>
    <xmx:wkxxaIGIXDX85jJHDtw4fKSFA-cqUcZrxsSTWzfWRaPPxna0jduSiw>
    <xmx:wkxxaCnmo40D1mtQOvNhFdKkstEwx7sI1oGb8HQA7L4npbpdBCj_NSXE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 13:41:21 -0400 (EDT)
Date: Fri, 11 Jul 2025 10:41:20 -0700
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
Subject: Re: [PATCH v6 6/9] rust: sync: atomic: Add the framework of
 arithmetic operations
Message-ID: <aHFMwB-aL7Lj_twN@tardis-2.local>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-7-boqun.feng@gmail.com>
 <DB93KSS3F3AK.3R9RFOHJ4FSAQ@kernel.org>
 <aHEiE0OoA3w1FmCp@Mac.home>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHEiE0OoA3w1FmCp@Mac.home>

On Fri, Jul 11, 2025 at 07:39:15AM -0700, Boqun Feng wrote:
[...]
> > > ---
> > >  rust/kernel/sync/atomic.rs         |  18 +++++
> > >  rust/kernel/sync/atomic/generic.rs | 108 +++++++++++++++++++++++++++++
> > >  2 files changed, 126 insertions(+)
> > 
> > I think it's better to name this trait `AtomicAdd` and make it generic:
> > 
> >     pub unsafe trait AtomicAdd<Rhs = Self>: AllowAtomic {
> >         fn rhs_into_repr(rhs: Rhs) -> Self::Repr;
> >     }
> > 
> > `sub` and `fetch_sub` can be added using a similar trait.
> > 
> 
> Seems a good idea, I will see what I can do. Thanks!
> 
> > The generic allows you to implement it multiple times with different
> > meanings, for example:
> > 
> >     pub struct Nanos(u64);
> >     pub struct Micros(u64);
> >     pub struct Millis(u64);
> > 
> >     impl AllowAtomic for Nanos {
> >         type Repr = i64;
> >     }
> > 
> >     impl AtomicAdd<Millis> for Nanos {
> >         fn rhs_into_repr(rhs: Millis) -> i64 {
> >             transmute(rhs.0 * 1000_000)
> 
> We probably want to use `as` in real code?
> 
> >         }
> >     }
> > 
> >     impl AtomicAdd<Micros> for Nanos {
> >         fn rhs_into_repr(rhs: Micros) -> i64 {
> >             transmute(rhs.0 * 1000)
> >         }
> >     }
> > 
> >     impl AtomicAdd<Nanos> for Nanos {
> >         fn rhs_into_repr(rhs: Nanos) -> i64 {
> >             transmute(rhs.0)
> >         }
> >     }
> > 
> > For the safety requirement on the `AtomicAdd` trait, we might just
> > require bi-directional transmutability... Or can you imagine a case
> > where that is not guaranteed, but a weaker form is?
> 
> I have a case that I don't think it's that useful, but it's similar to
> the `Micros` and `Millis` above, an `Even<T>` where `Even<i32>` is a

Oh I mis-read, it's not similar to `Micros` or `Millis`, but still,
`Even<i32>` itself should have the point.

> `i32` but it's always an even number ;-) So transmute<i32, Even<i32>>()
> is not always sound. Maybe we could add a "TODO" in the safety section
> of `AtomicAdd`, and revisit this later? Like:
> 
> /// (in # Safety)
> /// TODO: The safety requirement may be tightened to bi-directional
> /// transmutability. 
> 
> And maybe also add the `Even` example there?
> 
> Thoughts?
> 

Or since we are going to use fine-grained traits, it's actually easy to
define the safety requirement of `AtomicAdd` (instead of
`AllowAtomicArithmetic) now:

    /// # Safety
    ///
    /// For a `T: AtomicAdd<Rhs>`, the addition result of a valid bit
    /// pattern of `T` and a `T::Repr` convert from `rhs_into_repr()` should
    /// be a valid bit pattern of `T`.
    pub unsafe trait AtomicAdd<Rhs = Self>: AllowAtomic {
       fn rhs_into_repr(rhs: Rhs) -> Self::Repr;
    }

Thoughts?

Regards,
Boqun
