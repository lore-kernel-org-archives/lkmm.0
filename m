Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D32E1C69
	for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585281; cv=none; b=g3wfaHB/GZn5+G2Txkqxlkhr5yG82KMUhjqySCPQeQu6wmIjJndgvCsYgsBV8FjQgBe9Bfe1XI4Dk2VS7bB72xMS57gCd4Zex15FGck13gqqurIaOk1VVJfTqy/9+klQ5QW0vn1Nokx2lYBlyflhIu2/o4WFbBeCqcjWRToCqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585281; c=relaxed/simple;
	bh=JSYN4ycsig9LZivmXVfWGvMoxfcpvAh4wdr8Ygxo/AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp8V0T3oVIBIOTs1jDgaBun5FNxRJs+puComjSMP+CNMNf4aUVlcPof8yHu12z0z56OyoGe+TM9Whl18Zeis8C+DSjPlHZXsig4sznIBT/MsRRs8dawWYyilD5oqe55Oh/QU8WE5NZzfgzD/8FCnmF8YQODqEzF4zR76mMcBf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXvtFVr9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXvtFVr9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ab8403b6daso5397321cf.2
        for <lkmm@lists.linux.dev>; Tue, 15 Jul 2025 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752585279; x=1753190079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S68UebDyVH4yE1aPLvT0iYbS3AgRqZmN5s1wid2jJYo=;
        b=RXvtFVr9iut4iLZSNma4DISocnIYjah8MtF5hIj+qGzCuRKq9tI0L+OvpAz1A/RMxB
         L3Zb45RUCMRNiv+MC3sY/DbSs1DgPi99Vij0yMIjrEMLkRJTKwNqCSzdHE1IsYqqF09o
         n5uwailqBC5K69I+qrlrxeVbUK2l1AW/YYv0Wz1q8XNdp+NUWNSPDIzFdjPYb36aSQmh
         bFSmquZd7cfqztxnY2QFzAcKKvyebi7M8AzWpDvWtVbEvgBQyLZdz+hbotGhgSff6Zp6
         Y3Le5xEbnETcq+ZTYQT8xP3ZBJp3NrNWpBbHubMZgC6dMzfQTqkj8VL076U6u+uvleOZ
         sg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585279; x=1753190079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S68UebDyVH4yE1aPLvT0iYbS3AgRqZmN5s1wid2jJYo=;
        b=tkDf3te608fpWhA6rduYSrrvhEbYSI/QY+K7KMH0Oc5/N3IcoX2Pie7N1mr/nJZGgU
         DLfABFcTCl71UnGsTcR0JV9BMWcLy2OkLpmCk3EORySLdPHl9KtSZX5yEwrcGQc7qgud
         DP9DMrWGi6DH+MOpJRH2N512XeCeKSO6OS6ts7z3aRjLUrfcxsj4hDmsvCc2+LyL+Nam
         SHplVokW1PtJC3FAWNLgBVIdtcmCPgC8VMw2zjywlZ2ZhX9sTFwLVRb8D1Ff8h8IPQNe
         VsJ3o6rLCOrceTl8NkLRFwhSOLRfAGOWKtZZqcqyZg+GAfzeMr7AcvlgCPfd0gdRMEYK
         prDA==
X-Forwarded-Encrypted: i=1; AJvYcCVK8X08fF7++CvxF1fiJ90R6Z6p3tKgV5dZudq3CFluoa+o/1xpqpT9k6ckYO1q9mEUq/4p@lists.linux.dev
X-Gm-Message-State: AOJu0Yyj61fZuP1kRDs5dxJP3Uy6eGfIHtMr7fqihhJQ9BnlZiVX/3uw
	8x0784oJSBBXYhQzUblC8hDtFhSwF5fJ4FyLzUrSlcJZIINJUN4SVS/p
X-Gm-Gg: ASbGncvbLSzClgM2+lVqWY3NQYhkjAwvt67H1EaVbEFe2z72+USibnF+O58AW3+AIcE
	hpkkpXgGf+l5wP/TE5903xR4E204F+n+Fb53EKAD4aMLqyct99nMBw9qmNQHCLArJqbdKV+gR+c
	tTME+0BsHWv94mVBwU+LKcg51ZGzANkMdwuqlsVNOPJ0pSppvsiDYl+fo4dpkFlRZCwpw2+OA2Y
	EzMO4WKujEjyHBCaCAHn3Oe6Ixk2ZkxSr+qqyQdcXAiZ8DubIUHOdeNn9lHvT+AcIK0+NbYJEgt
	ewc0Kktz+FA0J8ccVNncrMVI1xK5UuJIMoMV5aNw5E5z04NiGNlzIc5joarhjTh6DnaqA651BDk
	yOMvnqJ7EY5bWoz6DD7i2Z+3T/WZbZY3YfnBIZirnAoVD/DbIHlpw2NlA5py9HGlFa4L0ZuonQt
	/roHKJ6+FWCQ+r
X-Google-Smtp-Source: AGHT+IHaP3XKGWTcZQS+qEIbRFFCyc1LSl3VeqAfWuxEd35LiJVIw2wW0os2Ca4eE+HV+lsnnnL/lw==
X-Received: by 2002:a05:622a:646:b0:4ab:5fde:fb86 with SMTP id d75a77b69052e-4ab5fdf012emr142744101cf.48.1752585278813;
        Tue, 15 Jul 2025 06:14:38 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edcaf939sm59682111cf.33.2025.07.15.06.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:14:38 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 43FECF40067;
	Tue, 15 Jul 2025 09:14:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 15 Jul 2025 09:14:37 -0400
X-ME-Sender: <xms:PVR2aNLiU7K7sxfWhcmA7iYKN6y-LO2pTfQt0ylzdpXsP3lTymLKIw>
    <xme:PVR2aKqo6cr1Ps7xWht2ISl2jz3-2RKj3UscPaS1Mt-nlixL6GIukWVzzRWx1SVdD
    Oea_R_vPEc7jvJlCg>
X-ME-Received: <xmr:PVR2aKTrzH-5KPNLlcx3LkpDW2Y2NilZHTV_XsWBbqUN2Ir2X6pRqSfbzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehgeelvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:PVR2aN5WF52i8brHqvF3hn0daqOolm6dmEDyD-j_CwaEXyys_eVtCw>
    <xmx:PVR2aCbImitqL7xcqjJ8w2FcybdAvho6K3HkXt7mXm2bB0AzS20EjA>
    <xmx:PVR2aKhyZaG1YRTF9vA26VXSX_-YOBneVDADb9WLlBS18mdGprZWtw>
    <xmx:PVR2aEPLxY9XdrtN-3YhZDBc7tGvrEf-pVI5jiknz3w66wvkzQoqTw>
    <xmx:PVR2aMOeR2UC1SmeWK6q-zGZ82MfkoNUMrtsAhmyFJqPmfrBly9R7GO4>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jul 2025 09:14:36 -0400 (EDT)
Date: Tue, 15 Jul 2025 06:14:35 -0700
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
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHZUO4NwMlw-FsnZ@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>
 <aHUSgXW9A6LzjBIS@Mac.home>
 <DBBVD70MASPW.2LUTJ51Y6SGMI@kernel.org>
 <aHUjIQlqphtgVP2g@Mac.home>
 <DBCIZY29JWTD.1G6AKZ08ZWBQG@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBCIZY29JWTD.1G6AKZ08ZWBQG@kernel.org>

On Tue, Jul 15, 2025 at 11:36:49AM +0200, Benno Lossin wrote:
> On Mon Jul 14, 2025 at 5:32 PM CEST, Boqun Feng wrote:
> > On Mon, Jul 14, 2025 at 05:05:40PM +0200, Benno Lossin wrote:
> > [...]
> >> >> >  //!
> >> >> >  //! [`LKMM`]: srctree/tools/memory-model/
> >> >> >  
> >> >> > +pub mod generic;
> >> >> 
> >> >> Hmm, maybe just re-export the stuff? I don't think there's an advantage
> >> >> to having the generic module be public.
> >> >> 
> >> >
> >> > If `generic` is not public, then in the kernel::sync::atomic page, it
> >> > won't should up, and there is no mentioning of struct `Atomic` either.
> >> >
> >> > If I made it public and also re-export the `Atomic`, there would be a
> >> > "Re-export" section mentioning all the re-exports, so I will keep
> >> > `generic` unless you have some tricks that I don't know.
> >> 
> >> Just use `#[doc(inline)]` :)
> >> 
> >>     https://doc.rust-lang.org/rustdoc/write-documentation/the-doc-attribute.html#inline-and-no_inline
> >> 
> >> > Also I feel it's a bit naturally that `AllowAtomic` and `AllowAtomicAdd`
> >> > stay under `generic` (instead of re-export them at `atomic` mod level)
> >> > because they are about the generic part of `Atomic`, right?
> >> 
> >> Why is that more natural? It only adds an extra path layer in any import
> >> for atomics.
> >> 
> >
> > Exactly, users need to go through extra steps if they want to use the
> > "generic" part of the atomic, and I think that makes user more aware of
> > what they are essentially doing:
> >
> > - If you want to use the predefined types for atomic, just
> >
> >   use kernel::sync::atomic::Atomic;
> >
> >   and just operate on an `Atomic<_>`.
> >
> > - If you want to bring your own type for atomic operations, you need to
> >
> >   use kernel::sync::atomic::generic::AllowAtomic;
> >
> >   (essentially you go into the "generic" part of the atomic)
> >
> >   and provide your own implementation for `AllowAtomic` and then you
> >   could use it for your own type.
> >
> > I feel it's natural because for extra features you fetch more modules
> > in.
> 
> The same would apply if you had to import `AllowAtomic` from atomic
> directly? I don't really see the value in this.
> 

Because generic::AllowAtomic is more clear that the user is using the
generic part of the API, or the user is extending the Atomic type with
the generic ability. Grouping functionality with a namespace is
basically what I want to achieve here. It's similar to why do we put
`atomic` (and `lock`) under `sync`.

Regards,
Boqun

> ---
> Cheers,
> Benno
