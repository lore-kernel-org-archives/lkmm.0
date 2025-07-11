Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985B29AAFC
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240174; cv=none; b=EbUEJ8DMTcK+34Qmf6xqkB+Lps6BY8tBmHN8F+qPJLjISqF/OmagcwnZQqhejzWGO2v1fkJYmO/LHPGSj7v0MeTwn+jRaYOF7zEZMz0nA98GJaH9+qCCvkaGEpRArGt6i6+ilYky2O5bMyxVDXEjutpAud3yJAqTnFZZN+PVim8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240174; c=relaxed/simple;
	bh=Z8xQn+iT3A5r4r5jVPej3tH0r1ytgXiZ3ITRDRty50c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YojsqugFBv5Qlb0lx75zaTcMwKfenmiiLmBga4SjDU4aSs/7OVauEla+8bgu+Pifh76NB2AutLndjsOCMl6mkgbrgX6lNlb2fVKMmZdtttKWhOVjvZyaMNSwrwUN7IMW6Q5e0Mv72ATDTIYZmgE0n2gDLgBmZVj9orD+q3QToN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5iJStkk; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5iJStkk"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a7f46f9bb6so23200081cf.3
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752240172; x=1752844972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYtOPsEZ+CQsVOIfnHqDEBe70N1WUVtu0akdEwqTHbE=;
        b=h5iJStkkRLckQtkEuh1Z5gmOIt+BpbCogFlVh0NY+Ti0NxmeZLAPOEjNpyWwVhzFFi
         PDKV7/P3jWhVPDU/WnVG1VFh8fDQncPc7zZspn2cm3TN/km/wFSoo7pWWKYF9sEZfVk2
         hsoXYFJUDDZl1xlZScnqpVdVBUOvVeJSanU128uas5IjfoBlJe9F9T5eJWXE0YVsiKWZ
         iezAdL8y8LbJD/DL0d3fnHq2Sibn6ehusdaKLLelSbagwH+MliK7DqilA08p0oJEQRHP
         QC4RRliL3E0OjRl3/RmzornkTO0Kz7QWmhbbK1FvNf08D95IQ/7npw+LFwy2+H7yIje3
         1+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240172; x=1752844972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYtOPsEZ+CQsVOIfnHqDEBe70N1WUVtu0akdEwqTHbE=;
        b=UQYydNdOAK9eJLCP2z62s5EjLS5PSbSR8cnHxYvUdYoxKxmwVBdUZLjtVYwYohoGVp
         yU93nZ/n0uFmz7BgjP6cjyGJ0ru78b7kKCNC18N0ijXcJZhDsaLVpONyxktGgdaIYV2K
         Vi74X+RJczfFwI62tKY5/0iYyNQDxX+bQni5g3BpyrSK+nMgk8WBO+YnI4it4+s1fcrw
         tiJ55F2b/tM4qWjUl9/lZL2dQViPX+x3WGaKUl852laXTS9Efwj/YjWj7CsuZIEB2kCo
         rQOwci6eCbfMxoKTvFZiv7a0q1uoIw7AHE5m6lnDAiXgFqgeIbpIvO5pdVmKeJxUr6t2
         6qdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDVx5B+aWXQfKnEDgpdQZ5zf8vaXjBFelZcsIpA3KTR92cGUBBEQSuLUQnDUQYP7l895tR@lists.linux.dev
X-Gm-Message-State: AOJu0YyhLCj3dSha1+n3SEWHvLnyVVZ1QqJPXEYIgo5b4he1QEsRRaQu
	wYeqSJEAQh8qjY5PDfqYnzY8cL+h++5o1VSKjIHEbNgLRnQFkGea6pK9
X-Gm-Gg: ASbGncsE1NcMezjSQNVFQZjkVOR/UMVQEEEKIadUY45tT2QAkzb8lKRbGy7q70gxL5K
	8eNXaOJ0jF4TNulQpqu1LariIArym/Zozp+JheKbNh7+aY8GDd5hLEkwzN+TPW+snX/GLAqk0vu
	6RFc+CtqKp+1VL1uMKlDemH5qhibsrTzSheqUEFAkeE4S5h705zPRGIvKniet2XW79CX2cqKq2y
	kqC+Zdx2XHFAtKanVs2wdtauei7hHi/x+lEAxZnxJkoloE/xNzuu7XwtlUSi7bGwatkV4w2FNEW
	pxIxeTxhwjlvPm8+Y9PR78xqor+Uwg54+6Kzlygr0iDloAa6lipTWCKL2+EgIUvYE0NAi7l91iz
	BvDgtrpkYVBUHLdeRWQrqy+r2ZhWSW+0D8atu9PNLCP/9+N51rZqbTEcg6SVjtAmkE/nEPFmYSE
	t5Rmov10CHi5eF
X-Google-Smtp-Source: AGHT+IGmUHLQtt4/Ao6E8L4tLE0MefjpXF7XEULDetINGFZ/Jy/Bf0GiAFzHKLdLVH4nwoSXYOFI1w==
X-Received: by 2002:ac8:5d47:0:b0:4a7:6215:37f5 with SMTP id d75a77b69052e-4aa4158b43cmr37499891cf.48.1752240171472;
        Fri, 11 Jul 2025 06:22:51 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edea8e66sm21040151cf.54.2025.07.11.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:22:50 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2C2E8F40066;
	Fri, 11 Jul 2025 09:22:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 11 Jul 2025 09:22:50 -0400
X-ME-Sender: <xms:KhBxaMQbn9roFh1stN7y4wNzPoAgB95S-EdDhrqKjYKglgHvAlMd_Q>
    <xme:KhBxaLRTMuOkOdpunXWir1nZHZsn1A5_oOIr2DoFDAoMQsOP_j8PdIXrnzUFjiUyn
    12tmFklFsttZ8rdDw>
X-ME-Received: <xmr:KhBxaOa6oHlf5rEjRYt0nrvYKuR5mtCpa0sNhbfyyfzF8ZeJzY1GJzKZLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeegfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:KhBxaPjhU5V0uxs42b41h0X8L75Gg_ZolvNTIBBShC26NW4v-xGHgg>
    <xmx:KhBxaDheUwpn0JHcg24jSRJwCN0JgA2-PGMr4y76DqB_FOe35e0w3Q>
    <xmx:KhBxaFKEaUG4yGuG6kPbY8dPU534TRt6meUhVxf7sNuvyERonwi_fA>
    <xmx:KhBxaKUMGA7aQBjZp8woKmSUqsC8ZKPDCJMqrVPZ_ebGh114O4pgLw>
    <xmx:KhBxaH2BY1eZZSH11TvWrxvNYITjGxmmvqOF7Lb2l40y42pf5aIJVXms>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 09:22:49 -0400 (EDT)
Date: Fri, 11 Jul 2025 06:22:48 -0700
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
Message-ID: <aHEQKBT68xvqIIjW@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-5-boqun.feng@gmail.com>
 <DB92I10114UN.33MAFJVWIX4AB@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB92I10114UN.33MAFJVWIX4AB@kernel.org>

On Fri, Jul 11, 2025 at 10:03:07AM +0200, Benno Lossin wrote:
[...]
> > +
> > +    /// Returns a pointer to the underlying atomic variable.
> > +    ///
> > +    /// Extra safety requirement on using the return pointer: the operations done via the pointer
> > +    /// cannot cause data races defined by [`LKMM`].
> 
> I don't think this is correct. I could create an atomic and then share
> it with the C side via this function, since I have exclusive access, the
> writes to this pointer don't need to be atomic.
> 

that's why it says "the operations done via the pointer cannot cause
data races .." instead of saying "it must be atomic".

> We also don't document additional postconditions like this... If you

Please see how Rust std document their `as_ptr()`:

	https://doc.rust-lang.org/std/sync/atomic/struct.AtomicI32.html#method.as_ptr

It mentions that "Doing non-atomic reads and writes on the resulting
integer can be a data race." (although the document is a bit out of
date, since non-atomic read and atomic read are no longer data race now,
see [1])

I think we can use the similar document structure here: providing more
safety requirement on the returning pointers, and...

> really would have to do it like this (which you shouldn't given the
> example above), you would have to make this function `unsafe`, otherwise
> there is no way to ensure that people adhere to it (since it isn't part
> of the safety docs).
> 

...since dereferencing pointers is always `unsafe`, users need to avoid
data races anyway, hence this is just additional information that helps
reasoning.

Regards,
Boqun

> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    pub const fn as_ptr(&self) -> *mut T {
> > +        self.0.get()
> > +    }
[...]
