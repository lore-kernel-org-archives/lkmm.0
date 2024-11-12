Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D61E884
	for <lkmm@lists.linux.dev>; Tue, 12 Nov 2024 01:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731373361; cv=none; b=pDgg7XMY8EkkjuxrTFKiOVoXE23rxhQueUrx+cdZbKZO4ryvoE+6tk5So6csCJFL9fQMRULxd8S8wd7nam/M6+2jM4LpzgfVOWhNfjd45bjE0GZNF1pY4bkRIwdxrOuVvJIxzW0O1HURX3jr5HBC5OKKkLmJkWRdruhmAJCu+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731373361; c=relaxed/simple;
	bh=fyy2IM9XG9szxI/PWCnUonVVBEE2MInbTFU3884NMY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS6WBVBQ7G5AHIRKHyiZq8QQgCOWxAlImJc+y7gryUCV1RDa53Cr1yO5tw3+6YHUnCRo4jkOVaVUWChQYjJ5z5gz87HkyS1IUZYuho1P5Bj1v48/KzQ4qGPfG5AXjLr+LvSeMIN9Fq4JWuOgigq3h7lEAkUU3WuzNK10aNKerDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BolsQj6h; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BolsQj6h"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cbce9e4598so32238586d6.2
        for <lkmm@lists.linux.dev>; Mon, 11 Nov 2024 17:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731373358; x=1731978158; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vGvxjMuzZiaW48tpjOWF97MsJFZ160bBlUK8dTgJsd4=;
        b=BolsQj6h7OdijGdds8O8OVXmkwe+F5R5P+QUOgXrYWVYamdSI6eTUYO8j1uTySb97C
         0BgtMp6E+nDcxz7I3/wftV5H2X3ZEpMqE5PrQ0yTgLPP7thM2mGeFGzD+RNqsUTBOBVB
         ojKwFZ7tnG5VDrxON+i9iZF7D9Y1f+bwQpJOhVnhb0spLRaVJ7VGAMfyj4rz14KDCXFt
         3vJ1W5yJxKcItHMrGvEArZziMoE+SoByAdgIkRK1wSrCrh10XSSuzcbs0VVu2u6Ca3F4
         LdtO2Y/ehzQh6ZztlNN3bkKUq9Ix0vKCBlzGs+Bhwx1un1DBNoiTcvYx2+pjd30GgOqX
         izjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731373358; x=1731978158;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGvxjMuzZiaW48tpjOWF97MsJFZ160bBlUK8dTgJsd4=;
        b=qQNAwF8/ZhSvWYcJEHDauWw3SJSO+dlZMPQ8vLOENhQL6gAfeapTiIH4bdPScM12Nc
         cF7CJaImpwjkrdyV+Iq2Sf4YNxw9KxMTI+Al/9A2M6ug1z6yiju04PuPPPDy6UrsXxeK
         z5Oth7vZkzTVjTgERZCjH03PJV1YrFPTnAXn+R4d09DozYW426SIbC3NQj3do4q7r/Xn
         YsyGqJhFL2s8wegb+iO6H04Co/I5CvVh79tUsf7zLAWinxkkNlGnjDjhS16OkG8V7ma2
         OtV3vaaf0SsHcABQMm7Kq6UZSdJ/GoTlmu29CVrFUh9ugxhNuJfbusg3p2Ou3Ea7lN3d
         6qCw==
X-Forwarded-Encrypted: i=1; AJvYcCXF4Iksf0hSpfo73AZ1dGGCV7K1ZfQoU+u7GcS4XZeOzZZBgJ8NCP17u7qxG5Htj05L0aFp@lists.linux.dev
X-Gm-Message-State: AOJu0YyPGccXbzJb5FFC7c07Kc4a0PS+aDRsyUmwkNIHe8Xdq3ijrP7O
	uILRVH/qaKRFMri6zVSD37cQ+lN/0LlImjG/kjfQ51YL28Y9LAMS
X-Google-Smtp-Source: AGHT+IHbawZVmkJAnbWWrDKnn13ZvXKyOgmM/LS2hzHpfFeXjCEgw97KH2J2rTKMuPJ1LvMlrPoi7g==
X-Received: by 2002:a05:6214:570e:b0:6d1:8ebd:d181 with SMTP id 6a1803df08f44-6d39e117fc4mr201095716d6.20.1731373357729;
        Mon, 11 Nov 2024 17:02:37 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef085sm65595486d6.48.2024.11.11.17.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 17:02:37 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id A8AD61200043;
	Mon, 11 Nov 2024 20:02:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 11 Nov 2024 20:02:36 -0500
X-ME-Sender: <xms:LKkyZxyUp2Y65uiTMstbSJUqJQCgOwMR3rcaEvFVBFuc2Eos-5bxeQ>
    <xme:LKkyZxRUMV6hyxhhaW1j1QRlKCgGytIEWT6D52Wn4IYUiEKZ8PZaHxUxwRumlNsJJ
    MHbDh86ZbEykGuM5w>
X-ME-Received: <xmr:LKkyZ7UcWz4H79d5k0WWP5Zw7tywzff_Pg0ZOYsRDYxMDX2i3MpjgBuPci6WsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtuden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleekieei
    feegveetjedvgeevueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegvghihshiivghrvghghiesfhhrvggvmhgrih
    hlrdhhuhdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhi
    ohhnrdhorhhgpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshhtvghrnhesrhhofihlrghnugdrhhgrrhhvrghrugdrvgguuhdprhgtphht
    thhopehprghrrhhirdgrnhgurhgvrgesghhmrghilhdrtghomhdprhgtphhtthhopeifih
    hllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtph
    htthhopeguhhhofigvlhhlshesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:LKkyZzhDVRoBB0apoaj_cWef-CFidf91cMnCjxL8GOKrsKaZBs4RRA>
    <xmx:LKkyZzCzlZR8tMOlnTJjb_UOKu6HKF-rjhiSUVE9Fx3OJc03pEOFOA>
    <xmx:LKkyZ8IH4RNJKhNNPHV-L5xI3UBgoaeCRJZezR1upBs3FMnRdZgElg>
    <xmx:LKkyZyArPnnYfr3ohpwsmc1UkO16Ou09sb0sHwc8izzFym_zrYMY6Q>
    <xmx:LKkyZ3zpZwT_vxFgAbdMd8IfZMfCX4LdC8wPsoU3ykecMupYt1cGDsEu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Nov 2024 20:02:36 -0500 (EST)
Date: Mon, 11 Nov 2024 17:02:35 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: =?iso-8859-1?Q?Sz=22oke?= Benjamin <egyszeregy@freemail.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, paulmck@kernel.org,
	stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
	dlustig@nvidia.com, joel@joelfernandes.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev
Subject: Re: [PATCH] tools/memory-model: Fix litmus-tests's file names for
 case-insensitive filesystem.
Message-ID: <ZzKpK_9nxh4Qg6mW@tardis.local>
References: <20241111164248.1060-1-egyszeregy@freemail.hu>
 <69be42c9-331f-4fb5-a6ae-c2932ada0a47@paulmck-laptop>
 <8925322d-1983-4e35-82f9-d8b86d32e6a6@freemail.hu>
 <1a6342c9-e316-4c78-9a07-84f45cbebb54@paulmck-laptop>
 <ec6e297b-02fb-4f57-9fc1-47751106a7d2@freemail.hu>
 <5acaaaa0-7c17-4991-aff6-8ea293667654@paulmck-laptop>
 <a42da186-195c-40af-b4ee-0eaf6672cf2c@freemail.hu>
 <CAHk-=wiEuh613GjBefTRe-_Eha1X1GoU=1nLt65uccSBC8Ne=A@mail.gmail.com>
 <705daf58-dd30-4935-9864-6489b9b90a35@freemail.hu>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <705daf58-dd30-4935-9864-6489b9b90a35@freemail.hu>

On Tue, Nov 12, 2024 at 12:21:51AM +0100, Sz"oke Benjamin wrote:
> 2024. 11. 11. 23:00 keltezéssel, Linus Torvalds írta:
> > On Mon, 11 Nov 2024 at 13:15, Sz"oke Benjamin <egyszeregy@freemail.hu> wrote:
> > > 
> > > There is a technical issue in the Linux kernel source tree's file naming/styles
> > > in git clone command on case-insensitive filesystem.
> > 
> > No.
> > 
> > This is entirely your problem.
> > 
> > The kernel build does not work, and is not intended to work on broken setups.
> > 
> > If you have a case-insensitive filesystem, you get to keep both broken parts.
> > 
> > I actively hate case-insensitive filesystems. It's a broken model in
> > so many ways. I will not lift a finger to try to help that
> > braindamaged setup.
> > 
> > "Here's a nickel, Kid. Go buy yourself a real computer"
> > 
> >               Linus
> 
> 
> In this patch my goal is to improve Linux kernel codebase to able to
> edit/coding in any platform, in an IDE which has a modern GUI.
> 
> Chillout, i am not so stupid to compile kernel on this "braindamaged setup",
> I just like to edit the code and manage it by git commands.
> 

Then you just need to create a case-sensitive partition, no? What's the
*technical* issue of doing that? And that cannot be more challenging
than testing your kernel changes, right? So it won't raise the bar of a
potential serious kernel contributer.

> So, this is a tipical Braindamaged setup in 2024 for Generation of a half of
> Y (like me), Z and Alpha developers.
> 
> Windows or MacOS system
> - Visual Studio Code for coding
>     - Git for manage kernel source
>     - IntelliSense in coding
>     - Live coding with other developers
> 
> Linux remote server
> - Visual Studio Code remote SSH extension/connection for Linux server
>     - Sync kernel workdir with remote Ubuntu/Debian/RHEL Linux server
>     - Remote SSH compile for X86_64, ARM64 etc ...
>     - Download the build result
> 

How do you know it's "typical"? I just googled it and confirmed I'm a
Gen Y ;-) and I'm not using vscode or any IDE, a lot of Gen Y, Z and
Alpha developers I know either use Linux on their desktop/laptop or they
don't use IDEs. May my experience suffice to say it's not typical? Or is
it the case where I thought me and my friends are the whole world? ;-)

> Instead of Visual Studio Code it can be possible to use JetBrains, Eclipse
> and so on any other modern IDE. The actual limitation is only, that there is
> a filename issue in the Linux kernel source with
> "Z6.0+pooncelock+poonceLock+pombonce.litmus", why git clone is failed to
> work well in this case-insensitive OSs.

They are not "case-insensitive" OSes, they support case-sensitive
filesystems, and they support them for a reason, so just use them. With
your changes, it may be OK at clone time, but as soon as you do some
serious development involving `git bisect`, you might be very frustated
that your setup doesn't work.

So your solution is incompleted (not handling the git history), and your
goal is a bit personalized: it's only useful to people who want to
read/edit Linux code without running it and don't want to use a
case-sensitive filesystem, and that's not very persuasive. I don't think
we can accept the solution or commit to that goal.

Regards,
Boqun
