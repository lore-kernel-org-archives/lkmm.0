Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51962F0C48
	for <lkmm@lists.linux.dev>; Wed, 15 Oct 2025 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541385; cv=none; b=FdEffdikE3er8T5pt77G1vBp58B3O6UvzOJnQINRBOGEAF2OhucmQmm+wDAHUHch7n8xaLtYkKLnOjh0C1INJYITTWRnYoP5hTBpdCyuil3DNdO7ykdceLGZGPpaGIJ4MyGpNBcxggLyQzFMrVDSpCwkFkdXsjU6vvKwsI9rPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541385; c=relaxed/simple;
	bh=lmpfn/DkP3K4xfQoydtxx13vyKNJA4/NSr1HVbrF6Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEUqxZvIq/mDcaVcdtD8DJgRYKsAJDh+6MHnSpkGYEyVhoGK5i6RmtJf5R6+6VtDUQyVQiLUJyF5MEc+x+T80rkiMbwy9DR2T1t0WJVCmJSaL7JizznpbVl9G/1sZdwciUCt+zHiSfTEqT1T23eVOpx4iQP+RH65cp59prwubCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXCVxpgZ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXCVxpgZ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-87808473c3bso1215262385a.1
        for <lkmm@lists.linux.dev>; Wed, 15 Oct 2025 08:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760541382; x=1761146182; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1b0J1G5Je076UHWfx+mUwV1mmqcJCq/SSu5M7TFN/I=;
        b=JXCVxpgZ4fXo/Ghm1BuHnv4NPjt5ieFtalaRqiQdWUwEgrBxxvMD6J/nKHKSfTOj2W
         EMvaXDByp6XptjPWa2mWt90F+36bTiZd5PAo2DaeWsDZ5sQ3hO3L7KKC1nnPH5X0x6dG
         4eHNtkWoO+7N+WgwQrbkL8Y/O1xfb7xnPAb084Qj7ZzRMT/FDWNguP3hvU75Dvfn2gTA
         fVAirCetfkN/qclT3L6LqxDMh+S6lVzgHdN0S3c14CkBT/uvCUIvuB6N12ue0COGbHUO
         ZfwhgauYsXSfj/H+6uRFRlacKvSkYCRErXt/4IIv8p025sQMSHxBCrvloZJ8o++PrdFj
         e5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760541382; x=1761146182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1b0J1G5Je076UHWfx+mUwV1mmqcJCq/SSu5M7TFN/I=;
        b=k8RTYrLnpN53+URrBxlD5d7lJ0VTbtqnSDAgK9CZQ8JDNCpzJdlUhZUAiQ1ZhLB2gZ
         cfUmmEblpUm9xja/FllHcHSyI7rbAqL6O1fLJQEC4O5OIo+WiBpvUrMBYf3+uoTx6/Vq
         jq1pN8PsZgBORNGojoo2j/SQQ3WzqipH9x/+YHoKznbFJps5IZ9QB48PbAjIEynlinOC
         Qyz0t8fzLnzWsgh2/7v4pyKlmHCSTUv+yf/spOCzbJiRBcKJzKeXqCoeejTbq2ha+NXS
         D5al1Y1ocftp2VLAKZWCpQoG5HovE16/mOhu3UhXArVi+3fBxAf5rMxzsi0qBlvXaWL+
         7oHw==
X-Forwarded-Encrypted: i=1; AJvYcCWRUcyirbxOCfRcuE1yD6EoCg8Uo+bEBucVb0HnWzge+lUCIZUOnSjXbZDf+gWh9otXbhYs@lists.linux.dev
X-Gm-Message-State: AOJu0YzRiy+gEcbM/W9PS4va+8vgni81V3nWqbS5sPzVSZP2b6b4Dgu7
	LFMPrKUtlW0VJMztFfA8GRa3+vPy5RqVJNxfbpoETZSzyWvDYpE9KiLr
X-Gm-Gg: ASbGncu9NPa0P965eBwPXMH8nYm+f0e60g1oQuk/07zhPA8XuQvlXYEuN00/zkSpP/Z
	AEv/9nR0TNJmgDrVG5sU1GesaseDcGx09eGsp7+EwQzk7e7K9EseGl1nrJITo9GnG+KibJTuLM6
	ki9BKPqBRACZRVaYPT1dDzde7NYfTcaYgyLRilv5V4pVgC9DTXiRdC1XtHK+etWyzOvm/C/cez9
	J14RDwcQIeCIMag35Tb7wyCzid6p9oYSW3SJRmVPZKMTSfCnH2Q235URRjARi+K4CwMNOXPP+cv
	DqZJq7Xi0YkgyFieeloFWebE+WDzKgt6lnGsz1J6wQPfcTOULoJMdNKYh72A6G/WweSITG6as+t
	Fgb5gyP40bFxUrxiUNB9CXeEo3anbMr6bH9mhAnjKMhIy8eKNeQvOnSJl/0ClLqMq+0eL18vWEu
	giunLnPYWVtq0dlY8Fa8kywsdUrEY78BCf8AHeuu3d1mN1kFjGaJ2H
X-Google-Smtp-Source: AGHT+IGbMBv6Zp0dBtQU2MY/WYyHe21/S+lNmhqFeFtOQVIigJfhz/Qmqq61kZu5LBzm/GoppyppHQ==
X-Received: by 2002:a05:620a:1910:b0:84b:76ba:9548 with SMTP id af79cd13be357-883523d6ef9mr3794601685a.24.1760541371038;
        Wed, 15 Oct 2025 08:16:11 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88e536d1f05sm128357685a.38.2025.10.15.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:16:10 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id BE2B1F40068;
	Wed, 15 Oct 2025 11:16:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 15 Oct 2025 11:16:09 -0400
X-ME-Sender: <xms:ubrvaGvTeAqNJ_uXNMrj4jPR4N65SDRrdsji0-RZEKkF7d8BajvR-Q>
    <xme:ubrvaDbd_rddq--aGbhGbgY-5lTkMmUjTztgYqvO33n6NLcynVLkpeDhcMvi0ezTh
    ettaA8vAQ-DqMDubBBsGvIXXkMC4O_GyzIghMV_tU8oEnQRf69RRA>
X-ME-Received: <xmr:ubrvaI-9sCnTqckr0zCHn8ZEG9Z98S4oBPBKIdb22ZtBmootBWxSs1KmrGK6BXGyT4m74PJ_vEko1b8ZnzNdpjvurcBHcVqh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:ubrvaHqNRmEnE0oVLOWCNHv_fy3ZOkrzpfipgrJxyvqvoi84fnmmpw>
    <xmx:ubrvaDErjbgQEZIx4nBsHYJBJBHU4f1pJ-tmr4UOIP-76LAjQWwE9w>
    <xmx:ubrvaPmhy9zwRSncx9ldrozOVQ_ROdBMzNQsCcGryKB21tv9_1Qn6g>
    <xmx:ubrvaH-hJFCfnf7Op-jTRY0RCPbv3VqeEFIOz1_bl_940Xz93F1UKA>
    <xmx:ubrvaIm0loiuwZ1xpe8BeNBC2JVM7xmckDi6kRGyjT75CdzO3ib-ygMa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 11:16:09 -0400 (EDT)
Date: Wed, 15 Oct 2025 08:16:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@nfradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	alex.gaynor@gmail.com, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [GIT PULL] [PATCH 0/4] Rust locking changes for v6.18
Message-ID: <aO-6t4eYgwCdo9Ix@tardis.local>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>

On Fri, Sep 19, 2025 at 11:12:37AM +0200, Boqun Feng wrote:
> Hi Peter & Ingo,
> 

Peter, this pull request was missed during last cycle, and I want to
push it in this cycle, and I have two options:

* I can wait and add more locking patches in this cycle and send a PR
  in -rc4 or -rc5.

* or I can send a PR as it is at the moment (as a "part 1" of locking
  changes), and rest locking patches could be in a different PR.

Let me know which one you guys prefer, thanks!

Regards,
Boqun

> Please pull this (mostly) Rust locking changes to tip. It's a bit late
> than usual because I was at Kangrejos conference this week, however the
> changes are relatively small and simple, so I think it's Ok for v6.18.
> I also try using "git notes" for submission links as Thomas suggests,
> let see how it goes ;-)
> 
> The following changes since commit 17d9f8eaa87d40a2ff66598875a43363e37a909b:
> 
>   MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-15 09:38:36 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-locking.2025.09.19a
> 
> for you to fetch changes up to 9622209360c25d78a81048a9db72f1efef7fbc58:
> 
>   rust: lock: Add a Pin<&mut T> accessor (2025-09-15 22:28:35 -0400)
> 
> Regards,
> Boqun
> 
> ----------------------------------------------------------------
> Locking changes for v6.18:
> 
> - Fix a data-race in do_raw_write_lock reported by KCSAN
> 
> Rust locking changes for v6.18
> 
> - Make `data` in `Lock` structurally pinned.
> 
>   Previously the `data` field of a `Lock<T>` is not structurally pinned,
>   and it's impossible to initialize the `data` field with a
>   pin-initializer, hence e.g. a `Lock<T>` where T is a pin-initialized
>   type is not supported. This encourages workarounds like
>   `Lock<Pin<KBox<T>>`, which is more complicated and less efficient.
>   Therefore make the `data` field in `Lock` structurally pinned to
>   support pin-initialized types in a `Lock<T>`.
> 
>   Since the `data` field is structurally pinned, make `Guard<T, ...>`
>   only `DerefMut` is T is Unpin, otherwise `Guard::as_mut()` is added to
>   provide a `Pin<&mut T>`. This is different than normal Rust standand
>   library locks.
> -----BEGIN PGP SIGNATURE-----
> 
> iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmjNGoEACgkQSXnow7UH
> +riU8ggAnRUTBam8NTmHJpZfVbbNSfx1ndaARxd9Wb/MLEh8OHYKbVRPJwvWGge+
> dafO0VYULku7ho1SeIlLXp4Bbjy3YC6o/J6xOpr9xMmysUky7RHi+Ys0y9gKaSmW
> daPurQEOS8TBUWu5yVxNAfWoRgPEiPULovbzgANKKAV7QsljyoEg7mQCPxLftPze
> Hr22HxU+lr6SDH5Efc8ihGqXJAvwunk+0mkJymZbjWo3ZF3cuhXlTMcIlu1SK14a
> R1VQu5UoX8S5y0T0gkJ84UJ11e0wrSZyT0EqmHWSpVBnyGgWk8H1u284hDiGG2iG
> FvwoSQ9iVuxLhxjhPUSOjq30DzmFfg==
> =MZj4
> -----END PGP SIGNATURE-----
> 
> ----------------------------------------------------------------
> Alexander Sverdlin (1):
>       locking/spinlock/debug: Fix data-race in do_raw_write_lock
> 
> Daniel Almeida (3):
>       rust: lock: guard: Add T: Unpin bound to DerefMut
>       rust: lock: Pin the inner data
>       rust: lock: Add a Pin<&mut T> accessor
> 
>  kernel/locking/spinlock_debug.c |  4 ++--
>  rust/kernel/sync/lock.rs        | 41 +++++++++++++++++++++++++++++++++++++----
>  rust/kernel/sync/lock/global.rs |  5 ++++-
>  3 files changed, 43 insertions(+), 7 deletions(-)
