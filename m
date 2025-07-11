Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EC288C06
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240746; cv=none; b=Rv3cKfdfr8T5wJUQFqoB9dOykpw13mheklTDz1JYPNKvnh+RxHri56MXpOz7kGODOymqPaKyAfrDve9XtCVusjgXnXvzsI6YoOuGw8IMvhlTBpousbW/12oMMt095eCH3U28ivpQQMhCCsudXUThl1cu1PifHjARyBc3wvabCDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240746; c=relaxed/simple;
	bh=Wxw5H24VaaibQ/B1AnzVCIGcsYhH0gAd7I69PKtsYos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idqdKp5qJTJUfsL6pGvtPJCa23OmzUDIqjyd7vC3JJrBBL6Z/ukHvJ8wSJs0WwqSaHg/nQtkRe2iDXtfLfaANXwM1ixMhIv8qQr7kiErUlZCAoIfVTlRKqpqP/DNO3zqWFS82lHUJlX2ngHGmJ7SdtSbCxLq+7GQ1n1nR1AeTWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT61YQC7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT61YQC7"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a442a3a2bfso30473381cf.1
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752240743; x=1752845543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSfG9eLyOi/7bNvNHBFehmopuc+sjkuQSYmr2u2++04=;
        b=PT61YQC7T4P2E6kIL8T7sa4e0ZYCBMcskZoD1Qpi+zahFjpldzTOzZ8nD43QsAGKl+
         6wCpV5JhTDdaedxOe0PINJtF/3LbRGNiS7++a9RvS41mExCJAcAJjG/fgieeorfD/eK5
         U1gfbGCPyWmZoXHHRQopQhnYctNvcnSdHxqtiEjOXFZ4C6AJNJ4VmEA2n8cIukOGqWdp
         Uv2y2q7N/olTAzJttWNbY9+oQq8zSp8W0lt29dJRsHfz49QfxsmiCZog4XyIl5XuuFZZ
         Ol2c/QQdFY4NXOAW/OUdQNXPKzp0bbOvxNSSWQATnyyiYhkbPOxHqSnobBZybU5awVVh
         i89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240743; x=1752845543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSfG9eLyOi/7bNvNHBFehmopuc+sjkuQSYmr2u2++04=;
        b=f9u+K+HAcTgW6ZlzF5zbetqZsHAr/5Kx6xWe9Lw7PzFJGeQfrtyClgvyDE5mCIC+bo
         40R/gKTIlkiGmAYeV+WEVdFyo7dP44gG97W4iy4mm7glFH7LlfLPJiWgPCZVTR1sp766
         zxxS15RBoJxTfr++kZ4ikJzYWmWgiqK3ZYGuO/8DBah1685Jt9NMj+s5Sk5lxAzAe7Od
         MtcMUHIXfvCUxM6mN+49jCEGsi8prh9HIy9sEtw6x+Y4YFyCfEU7d7azxRfddFi9KObo
         pa4A3DjuRVz9um7hGPVyrv9fw5OFLHfX+Q+A3YlhwlpVnXeZHyXd55lxfI6VxOC7J221
         i9yw==
X-Forwarded-Encrypted: i=1; AJvYcCWBURm4zCkPa4AyhH9Q3dHAAcbnwXrK/lSSPZ+Fekof4O0bdGT7J1ixQTMp1VPZaA5H/lNm@lists.linux.dev
X-Gm-Message-State: AOJu0YylICzbUo3oYUT3jmuxrUqURsVOfE1ij4+ZhAtf8nRU3TfxluGj
	FymiX5a6r5pbF+rCibQEOfGhjzhHILNM7BgnuolLMzjCCKMCnaJEbJca
X-Gm-Gg: ASbGncvD3mXkeirrAlnKSgoTLtWk27HbEmwhUUStTRmJcxl0lCZ4MekyjaSYzZQbyRv
	1pV/tiJR47pqNNSL8rwnJy8Cz6ArNcp1UNclh/qbY5S2C+HZNEw/kxDwim4Cbkh199IOzvLNe2t
	L2ey/buVng4uc3Dm0Cki5P3ywRkZbzfI6Zwf6dm2qtx+2J0g/0YK+EbGYl78oLNQIPq9mHehefI
	87FlzkD/s4/T5AgX1+nCxF6ySMmt5QKy2ooGMgBpig/AuCgz9Cyq3/tYdM5QW5Xpu6oXNJkYMyp
	hy21F2EqCQ4FTdUvBdl0Ix1cg+VdB0x6wGkfpDu0yEQu00fz3Jh9ewu9ZxiFKMQsxTANU5OkjjT
	4WDF357KB4X3IPV2Umd6N58iZRYeAU6bP0BZw98cH5EsAIkRZjVgm+I3r4XWWy1zxyJHcP0uOzL
	6OSFu1xArY9pn0
X-Google-Smtp-Source: AGHT+IE8g/Wz22Mbl5u7b1Isnoz5jC3U3lWrtV2cFcRVjV+feIy/MaQqLmfKYsYi5oWJEoDkn3WEEQ==
X-Received: by 2002:a05:622a:429b:b0:4a9:8852:7b95 with SMTP id d75a77b69052e-4a9fb94759emr49988901cf.26.1752240742758;
        Fri, 11 Jul 2025 06:32:22 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc13e3dsm21020411cf.16.2025.07.11.06.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 06:32:22 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6870DF40066;
	Fri, 11 Jul 2025 09:32:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 11 Jul 2025 09:32:21 -0400
X-ME-Sender: <xms:ZRJxaBt2QCH_vkKfoK1orHXvvFocrb86BTkxOiAUUAwMlJ7jJculSg>
    <xme:ZRJxaL_0Q6e8-Wc9HmtpvoiVA_8jIdXb8uJQPT9UbIkXRsYWYB5oqsgd61wPYi_gJ
    WlPCXX_PaR5ixjldg>
X-ME-Received: <xmr:ZRJxaJUu9su4P7gcU70Qyuf-_e6OnKPkYODbQNMn63CYJXZSEhMwL3hAAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedtvdetvedv
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
X-ME-Proxy: <xmx:ZRJxaHtd-dDi8Ww2nZ2iwkrXpbyiF1zaKmDoP2PBJeDFJi9q7JyOvg>
    <xmx:ZRJxaP-mhJNz75WZ-Q0HNoNKmJli4gBRCrFwgMJJDvkdcXEPXcw-Ng>
    <xmx:ZRJxaA1LPJyHiy-MfO91kd0zI0Sn7jDX52wnjUCnlnzELrfqkgWwDg>
    <xmx:ZRJxaESsxnZ9Gf-KUY10cUZ3XWSAfX_rlA6RT0JIzRLrSfX7eC6Wew>
    <xmx:ZRJxaDBSutXyP-lXRrWqEM5Lzd9WiujFqe5GkjylWj7rkiqrB0F-3VP3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 09:32:20 -0400 (EDT)
Date: Fri, 11 Jul 2025 06:32:19 -0700
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
Message-ID: <aHESYzVOTCwADqpP@Mac.home>
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
[...]
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

- Without INLINE_HELPER, this is an FFI call, it's safe to assume that
  Rust compiler would treat it as a compiler barrier and in smp_mb() a
  real memory barrier instruction will be executed. 

- With INLINE_HELPER, this will be inlined as an asm block with "memory"
  as clobber, and LLVM will know it's a compiler memory barrier, and the
  real memory barrier instruction guarantees it's a memory barrier at
  CPU reordering level as well.

Think about this, SpinLock and Mutex need memory barriers for critical
section, if this doesn't work, then SpinLock and Mutex don't work
either, then we have a bigger problem ;-)

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > +        }
> > +    } else {
> > +        barrier();
> > +    }
> > +}
