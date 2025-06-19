Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEE3085DB
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346147; cv=none; b=Y4AFFcY53/7iw95m17mVJLngBWAGTf0DxMwfO5mzIVENBgQDL68r4YlBlNhwmranW5s7/elkybV4F7Htb+aRke7XJTmK/AKyS+xBsffEgZrPIs9JRQOgRJ/zgvmAkhATjgFw4cVi9dF1ECWSC44BHSZ69hz3AW2v46ydUtOMhRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346147; c=relaxed/simple;
	bh=zHZPU0pQVvtvELT/A0DnUl36QCSDJghMFFVkTWTaZUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6M14oh442YbHgRRu/UEZbODUGUFkdv16enoeYd9NdLcbnM4GbOquqlDBCMdWLrGwDfJuUU0h+EvF4fjw+rly/0wdB6ziXYHGrIFAviRtS77kr80YueauNXc7ZL8vYcuEWSZSm+y60i3LWOTuGoPuBYr/OFKGUWD2p9O/ZtqibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfrHaslq; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfrHaslq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a58ebece05so7711211cf.1
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750346145; x=1750950945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB6NBWoWO017Q/yotmTxC8XiQqyoYl9JmICEhhvlvHU=;
        b=XfrHaslqyTvYHWk3W+3FoaCiFJv1U7tAUVVyXbJFmVsEVhTXBO3gL7Qyl7y3tIV+z9
         +Vy85OMyW1bjNhbqR+uXNBoGhbGRdsTwXuohDsObIlfFiLDnqOCmLMUP045Lb1S6EqRJ
         VpDEsfA4gTjfLXfSVjoNaPNZRFKh/eI2Yx1ebIDiDTtcGHMby9JoL2RE462Dq4KjcWKm
         TXtC9EOupNHKr87zTZCPLIfTM+GYx3Gocb6sOApIn82oQ8Hh4YcH7pZI7jlTEYXi9/ro
         ixSDsZsRLq2SzeDiXo8pWR22Ra9iXbmyf+Nbb7GoqIjhl2hFSJnWUHkgwFDvW96hQBeU
         Yntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346145; x=1750950945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iB6NBWoWO017Q/yotmTxC8XiQqyoYl9JmICEhhvlvHU=;
        b=WWLWsf6R3l90NEEmU6ZNDZNLXgDaTQKBd8ujuygX7ohK7zJaFhwaIUSUTur4ewt2nT
         vCaWkYhKw75J5AicgXlAOVQlgVVR+63fKiOG4OsSkxcOYLAcpgWrVhZrC8d/QBjEjVq+
         nm7YSlkD3mq5yHNOaNM08oyCZCwe2SClYPq2INPU2/wPHE325ls7/NUyug0V50wd/Myu
         iQD9oaCaT7vP1GMX8uZZrIraTg+4pf+k/wU88oaJkfpa+ONhLH9woTRsim2VX+uvjsix
         oAyta+gY4to/UXPVjlSn9V3r4Z7AM4frOBXhnqoytEDf+dAL0nMIPnU3fdG5Cajw4+Uz
         4YZw==
X-Forwarded-Encrypted: i=1; AJvYcCVoCOc2OPKlKfh//gGb9wh8dHmTQiydqCTvoxZEWS5xD15hpPKeF6LPTex/Dbvuj6LSbgGc@lists.linux.dev
X-Gm-Message-State: AOJu0YwVLz7g2JZYyso6gZKD7K/6Q35Ds7dWyH4tyQlSPEV0ngP+U0M8
	4M4Qra4iGbkf/V6LSiigcpcMiWwt8vV4XFl+cTO/ZtyFnS5vJg2ufySM
X-Gm-Gg: ASbGncskV6B9iNqkgw0GCclm5v9NkIRtnudW49n/4MweHLc8xCNBroql9fmZu4hkClO
	VQrl5vC/OPPAhmSbO39gKxFDp7y5qv3+/qv81L3fFAPhICXEI7ghGv6JlQfMM5n0TpE0bDA69Wq
	guT0J0WqIyx0JLKCS7cTo5fJjceDHppjxQpL8jVb3s7RAGG4XYc01l1tGgx1UBwtELJhgG4PeTN
	Hjqb+vFH0i7hN0M4cBTxF8W/cA9Rl0qlbAqXFI+CAb4DwcSICNZB+70ST/6UbaY7gk0n5+dtYiZ
	/MB4Nzn8Aj+jcNFd7YhT+LLTVs5lZ/y9B7MRk5Jt67nCbkm4EnN0KIf/qyyxe5ZkIIKvGE3fLeE
	5wp0PJ6sNfCmFoBvxlFSockdvQr2LYUAxPv0dEhn4IzSzGxGughcQ
X-Google-Smtp-Source: AGHT+IF8vYUaxN9IXHpKW7pA/QJMa955Hnx3mIGzGHZgpjKqaBXYX9dt9SNO06zJEdxRolqCx+PzwA==
X-Received: by 2002:ac8:58ce:0:b0:4a4:2d64:a7e4 with SMTP id d75a77b69052e-4a73c608616mr347986811cf.35.1750346144930;
        Thu, 19 Jun 2025 08:15:44 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7784ce4d1sm443131cf.27.2025.06.19.08.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:15:42 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BA82F1200069;
	Thu, 19 Jun 2025 11:15:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 11:15:41 -0400
X-ME-Sender: <xms:nSlUaIskrN58R8pfL5HcUXbdEiumOwJqeuesDalCGA3HVarVvmyARA>
    <xme:nSlUaFeNOvpNck2jrzCPWg4LTetKM-aQVMaK8C29bgMk9ofYorlSYilskBbtliwyw
    3Gmn_LeOdbJVgUfcA>
X-ME-Received: <xmr:nSlUaDywfts9qXJkAqSPEMQoe1SVaa1E4BW_p8tiC1i2t22isfspKuYbeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefgledvudfhudfhhedugeegheekhfeileelteffgfekleegjeetueefieetudehueen
    ucffohhmrghinheprhgvlhgvrghsvgdrshhonecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhig
    rdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:nSlUaLNdegtaf3xa6TtwhaE9QVx0LOLdxrxkjQsJumnZV9M82BoMFw>
    <xmx:nSlUaI97kKqOW3Jz1ZTEl1t1OU9zu2-JXHQ7WwsMcfFCSFGvg1MkrA>
    <xmx:nSlUaDWyQdmWn8GXYlEn-B9jFQd6bol3p47FB5jr87ZtyMi-7Vjw5g>
    <xmx:nSlUaBcQjjgb1RuxLQIQq9W7jb-vnzoQorE84AInrV4M6SHYASavZg>
    <xmx:nSlUaKdQ1obqpDC4h0bIwoMZVevMyR3SsKD7oaRo9lMngoUJv_RfiWfS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 11:15:41 -0400 (EDT)
Date: Thu, 19 Jun 2025 08:15:40 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <aFQpnBGrOrd3rtbF@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <20250619103155.GD1613376@noisy.programming.kicks-ass.net>
 <aFQQuf44uovVNFCV@Mac.home>
 <20250619143214.GJ1613376@noisy.programming.kicks-ass.net>
 <aFQmDoRSEmUuPIQG@Mac.home>
 <20250619151050.GN1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619151050.GN1613376@noisy.programming.kicks-ass.net>

On Thu, Jun 19, 2025 at 05:10:50PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 19, 2025 at 08:00:30AM -0700, Boqun Feng wrote:
> 
> > > So given we build locks from atomics, this has to come from somewhere.
> > > 
> > > The simplest lock -- TAS -- is: rmw.acquire + store.release.
> > > 
> > > So while plain store.release + load.acquire might not make TSO (although
> > > IIRC ARM added variants that do just that in an effort to aid x86
> > > emulation); store.release + rmw.acquire must, otherwise we cannot
> > > satisfy that unlock+lock.
> > 
> > Make sense, so something like this in the model should work:
> > 
> > diff --git a/tools/memory-model/linux-kernel.cat b/tools/memory-model/linux-kernel.cat
> > index d7e7bf13c831..90cb6db6e335 100644
> > --- a/tools/memory-model/linux-kernel.cat
> > +++ b/tools/memory-model/linux-kernel.cat
> > @@ -27,7 +27,7 @@ include "lock.cat"
> >  (* Release Acquire *)
> >  let acq-po = [Acquire] ; po ; [M]
> >  let po-rel = [M] ; po ; [Release]
> > -let po-unlock-lock-po = po ; [UL] ; (po|rf) ; [LKR] ; po
> > +let po-unlock-lock-po = po ; (([UL] ; (po|rf) ; [LKR]) | ([Release]; (po;rf); [Acquire & RMW])) ; po
> > 
> >  (* Fences *)
> >  let R4rmb = R \ Noreturn       (* Reads for which rmb works *)
> > 
> 
> I am forever struggling with cats, but that does look about right :-)
> 

;-) ;-) ;-)

> > although I'm not sure whether there will be actual users that use this
> > ordering.
> 
> include/asm-generic/ticket_spinlock.h comes to mind, as I thing would
> kernel/locking/qspinlock.*, no?
> 

Ah, right. Although I thought users outside lock implementation would be
nice, but you're right, we do have users. Previously our reasoning for
correctness of this particular locking ordering kinda depends on
per-architecture memory model reasoning, so modeling this does make
sense.

Regards,
Boqun

> 
