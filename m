Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8871CC158
	for <lkmm@lists.linux.dev>; Wed, 23 Oct 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705672; cv=none; b=BgBPxBfUYo2FemRyVWUIJ4J8OHH1hw3cMCx5R1EnWIEI+fQk9QUvc1cdrO905GO6mBeXo14PNbMXEM+M8gvBecIdq3xF5Q6pIHNZ8CPOSA2TPytzkr5qUPkLgH4R7ITglAm+we8FTepjnx1vfELZChTxtn7hGgkvk93DRIBV8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705672; c=relaxed/simple;
	bh=0JSR/C0aaUKQyCYLqYnEH9NlNoyVdX7cXoEVoQ7gOi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cd4w+3pQ8opM4PZoG3Of8kxhdDbVupY8jUUXAOO5fmjTB6ucL/E9D0N01Bmu5/tEIOOFxu+icuK5298SIFnpu9FvW7ZLYzspclzhD3HzhGEf8Vo3A8pc3ujghZvdmhM7LG2V2xZcHg44vpCcLWK61YhoOZsdoLMtMr4H/bzwo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGTv4Ywa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGTv4Ywa"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so60724a12.0
        for <lkmm@lists.linux.dev>; Wed, 23 Oct 2024 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729705669; x=1730310469; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZr1MAZgkbdeNI4DK+93o1V0wyV+u7PfGU/TxQhTQLU=;
        b=NGTv4YwabGXub7Su2PD4C8SBtI3LQQ3+eKGrhfTuHb4qgfEO66VlUW5EkYe21P1Q9v
         qZs5m9+JWn5cygIL1KtWxLuqUbayTQy9p7AHBlft3x901/7edF1h9TX0OVfEdEEI2S6B
         QIHJ9DpOiADsvYmHd9vSTUbdOLDrnoYABxgM5Coj1Vu5GIveEm5vyZ90LAfYRBpGC8k3
         tzmmpiDwdex86D6lOSBWyUr1T26tRGFxXtKHi7TPt/EiKa1H5nhHCGyGCDjsruEeZ9sp
         ZySJUNmlLyNLOSNb67cPr2zexWPKJMcePCpg99Q2ibSa2u1shauUSv2Yw1+jY6n6nTZB
         BVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705669; x=1730310469;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZr1MAZgkbdeNI4DK+93o1V0wyV+u7PfGU/TxQhTQLU=;
        b=EvzjJDWc1AA4FHQv7duvsHajy7F9e/66cti9e5lorEEXOw5GgfG47hJv/y3meDHzLJ
         L8JpQqOAdhJqoviyV58bthYFSPL0GtpdQe5GPwY3zPmSgyetz2OV99Cm9j6EPGWljjsg
         r5So1j4RgdrkaqY2pGGw1Tk9T+bpzvmsCaND1XmVYQ0LJKD5Sfpkpjb5v3OBPLJbSGC8
         +JG8QtPSp61cBHuNWHsWuzFHMuztIstapVLqsLh9zKuWhZbqWIeLtKll9tzsMKwKjLvZ
         wjXSmPbXwnARD+fjRUZ7l/DAgi5jG2QPyE1/E2hSWs/aVHv+hhHmxXNtYzht1YUJmuPm
         EfaA==
X-Forwarded-Encrypted: i=1; AJvYcCW8phkhMy1ItlF9oYGZOAeR4HXdmi3E5xjM8csNDLfxw+u3GcaIWC1pJdQ/LkU02XGS1kFd@lists.linux.dev
X-Gm-Message-State: AOJu0YyovUxNjX4NBjdW8Nzn7hZh+yhkPU4jhY2OlvHufKg3Hj732l6/
	D79fz9R1khoTDCOBx4Z+IpddO9+P+Bq5izDWU/h9ABDoMVx9cYgVe2jE5UXl
X-Google-Smtp-Source: AGHT+IGTJy7nZOVbGMX0rk+p4LbKdbZhs2O/9xbXpQGbE+31PN4fx6b6Rjj0ExWSH17bFS56yJzvPw==
X-Received: by 2002:a17:907:9452:b0:a9a:76d:e86c with SMTP id a640c23a62f3a-a9abf92cce4mr321005166b.49.1729705668601;
        Wed, 23 Oct 2024 10:47:48 -0700 (PDT)
Received: from andrea ([2a01:5a8:300:22d3:88b4:6602:b225:25ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91573645sm499088866b.182.2024.10.23.10.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:47:48 -0700 (PDT)
Date: Wed, 23 Oct 2024 20:47:44 +0300
From: Andrea Parri <parri.andrea@gmail.com>
To: puranjay@kernel.org, paulmck@kernel.org
Cc: bpf@vger.kernel.org, lkmm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Some observations (results) on BPF acquire and release
Message-ID: <Zxk2wNs4sxEIg-4d@andrea>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Puranjay and Paul,

I'm running some experiment on the (experimental) formalization of BPF
acquire and release available from [1] and wanted to report about some
(initial) observations for discussion and possibly future developments;
apologies in advance for the relatively long email and any repetition.


A first and probably most important observation is that the (current)
formalization of acquire and release appears to be "too strong": IIUC,
the simplest example/illustration for this is given by the following

BPF R+release+fence
{
 0:r2=x; 0:r4=y;
 1:r2=y; 1:r4=x; 1:r6=l;
}
 P0                                 | P1                                         ;
 r1 = 1                             | r1 = 2                                     ;
 *(u32 *)(r2 + 0) = r1              | *(u32 *)(r2 + 0) = r1                      ;
 r3 = 1                             | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) ;
 store_release((u32 *)(r4 + 0), r3) | r3 = *(u32 *)(r4 + 0)                      ;
exists ([y]=2 /\ 1:r3=0)

This "exists" condition is not satisfiable according to the BPF model;
however, if we adopt the "natural"/intended(?) PowerPC implementations
of the synchronization primitives above (aka, with store_release() -->
LWSYNC and atomic_fetch_add() --> SYNC ; [...] ), then we see that the
condition in question becomes (architecturally) satisfiable on PowerPC
(although I'm not aware of actual observations on PowerPC hardware).


At first, the previous observation (validated via simulations and later
extended to similar but more complex scenarios ) made me believe that
the BPF formalization of acquire and release could be strictly stronger
than the corresponding LKMM formalization; but that is _not_ the case:

The following "exists" condition is satisfiable according to the BPF
model (and it remains satisfiable even if the load_acquire() in P2 is
paired with an additional store_release() in P1).  In contrast, the
corresponding LKMM condition (e.g load_acquire() --> smp_load_acquire()
and atomic_fetch_add() --> smp_mb()) is not satisfiable (in fact, the
same conclusion holds even if the putative smp_load_acquire() in P2 is
"replaced" with an smp_rmb() or with an address dependency).

BPF Z6.3+fence+fence+acquire
{
 0:r2=x; 0:r4=y; 0:r6=l;
 1:r2=y; 1:r4=z; 1:r6=m;
 2:r2=z; 2:r4=x;
}
 P0                                         | P1                                         | P2                                 ;
 r1 = 1                                     | r1 = 2                                     | r1 = load_acquire((u32 *)(r2 + 0)) ;
 *(u32 *)(r2 + 0) = r1                      | *(u32 *)(r2 + 0) = r1                      | r3 = *(u32 *)(r4 + 0)              ;
 r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) |                                    ;
 r3 = 1                                     | r3 = 1                                     |                                    ;
 *(u32 *)(r4 + 0) = r3                      | *(u32 *)(r4 + 0) = r3                      |                                    ;
exists ([y]=2 /\ 2:r1=1 /\ 2:r3=0)


These remarks show that the proposed BPF formalization of acquire and
release somehow, but substantially, diverged from the corresponding
LKMM formalization.  My guess is that the divergences mentioned above
were not (fully) intentional, or I'm wondering -- why not follow the
latter (the LKMM's) more closely? -  This is probably the first question
I would need to clarify before trying/suggesting modifications to the
present formalizations.  ;-)  Thoughts?

  Andrea


[1] https://github.com/puranjaymohan/herdtools7/commits/bpf_acquire_release/
