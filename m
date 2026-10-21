Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573690;
	b=St3tIc4vM1UWvSs/cKwPe5lqua7BIoHCIMe7Ycs78FJULT5cX5ulvzfsJE9hOD5KJS+d
	 7jXxyCL7kfE5CGXKJ42jkZqKkb8r6LtWeX2bpoXCY2jnvo9653NDPBmKRvzXoKUkAWxcC
	 zlU9i0UlHWuiKdQFDQLfRZdF9ULo+GHRDXyyuc/4v1qWXZRTFyEoy8X237FGapOW+REkl
	 3tYl3DgKs75rYOWXZn6XUSHuRSv1IxC/RA8pYcH5Vu7BTakbYqWU9Kan9MP2Wmp6yBnrt
	 uEwUGd0CUprmvi46QvNbDH91AWMX8B8Ud+C0pXQOOsC5pgHxF46X6vO3Jdz6VqZ5Nxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
	b=2j5ljuGpe0LaXRGX8fJBh+0QfdJ/wwMcEabKy/Jog5LWgAzGzB25jweVOlhKe+JPe3oJ
	 RRr2COGEHoSZv4OIhe6/gWh6+FJzZ3TZN7wl7JiI/UX75qe7cfSI6sYB+JfdNdfNh4Lxm
	 o5KFGiz4HZr65Wd7UCixJEo2qbzmMTNPnIuJKA8EW3gk16TzbB1pQor97Zp++S9G4oS2q
	 q2RREbM8Ha0Q8JA9D6XH7t94LlCJisUlmuX0BwR+vbcWn1b1L0P4IBFDF2kpmCid2OokU
	 BHxjApCI62eQnYmIPG5p2fF0Cj+SWyG0NBx9xJ2Sc/CWl11d+ZttZZKjQtOlkPJx3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F+VDmzJj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0B606A31B
	for <lkmm@lists.linux.dev>; Wed, 21 Oct 2026 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F+VDmzJj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso4477435e9.2
        for <lkmm@lists.linux.dev>; Wed, 21 Oct 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573689; x=1793178489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
        b=F+VDmzJj/XvmPamCIbcUMVHflVj/uY1XIHK9G49Y2Ga27qO0d/VHmtYe3pDxyAUPSC
         1w1IAL3d3GuHITLmpvahc4QWXtiEp7Hs5HeyejxGhpbLf65W6ypqDtEgGChcvkvjfeVe
         9X0cIkHCYoX1Oo6qp68kQ9ASTtt1+3Kje3j5EnQ0zhXcczpvzZM7vav5/MKxo5Lzszha
         hF5uS6NjGuUgcDd3hhxhFn4MSPPOokzkb1hLt10NxlF8z7ltdYqp5O0y6oRoNnr1QOTG
         VSDpMK2v+kcEtiNglB1ZGb7BwP7hDRt+tIEfVH1XSt7dcqsaFQndAFFZY5I9MmztTtSg
         C3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573689; x=1793178489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
        b=W31GRbodQ4lRz1pLlOYUTDOTn4/e7Mt/oFgz8zuMGj2ByJ162gITQavinRhaTDKmyl
         JS4I3lZIyWtLp/nIPXByaW37WnmSrCIWjk1CAgzlfS6HKyCJaesLTMVfNhYU7MkhNji3
         HbjDctkELwqoYFxUL41uJ0PsE4pn7PJeUWnumbHRLAa7ta5P8Lgb3mpYWOUZRGzFpg3X
         ErJjJBRi8K3OME/Hcsx/QIa3N2uKRNdTng7ZTKbb+YieHkqejpTii0Z5BiXJ9dhm3dQa
         Z7glnIMHssNjLTQsB/QeU2QF37+o43T/GHOwhnH8mtBxmmmm2STKvNxxoLO1KmYs6fPd
         w92Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1UCqy3LK+4U+7AOiAR+kFczRkAsoTYU+eN5zxMwiy4SPzFV5awjJUAxkERdzdPLtKMZE2@lists.linux.dev
X-Gm-Message-State: AFq9FYIso4BNg6R9rrmSBLX9fWHpGDrk1ijWGbkKfFRAYE62gBHnoih3
	ZF9EHRXcUKKzMXaCvOxahDCrCEawJuY6cpcAUEVzoETjNse7TJEfPXYr
X-Gm-Gg: AYBFou1MkZM6Qo2gTLagPoUvg4Xgkdfa0smScMoLid/3klCfpbnsKY/eQQYqiH5WDSo
	opnZCRaVZODEQTScmqrABW3OzNs4ZUcoqfrnAQ+Mz8MOSnVKfUxAOuTzuGjS2/amM4V/xoF0OYr
	QRkNIEDAcIws8z5fkrrBb93zA8CmEJEh6pqQ05pTziAX33OEKLUrMt+HKroSyGXgkbE7PjTPG8L
	45lppA3y5OZBdeCayR9vZIKCgvmuv5179uoXxjDwAeyKzAPqJYdVerlaH99sn4R/Hot0jmUdH/U
	tYWKOtkaEsgpaxvD4ZhTlHJyhVB3865QIVqph1b4ad3Be0qgWTZdm+CUKCvLE6y5UoktrNob56D
	bIGgnSSBwqdRkt7r5g1SeCAt5a1tIE0sQ951DvKgJt5EkWAgIMTr8b95CxQ90VkIfpabq16PIlL
	bLHyiBJy74FPdVvIHDEVAJ7piejluRWSjLgYXw6gNtnXZttMxAnJ3BqiY8rEoBCpwVjjFFB0gVh
	n/QwZmLrsHXj+asF20zRgsCDZakAqg0LYbJfknqZQZI+JYFTWcKSMz08p0SBnNko+USKSFLlW9O
	SOw+Cxmz0JP87miekqYeaaq+Ygj8+tBB02P1P849xeAsEw==
X-Received: by 2002:a05:600c:620a:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a1fdb1a609mr23289665e9.7.1792573688575;
        Wed, 21 Oct 2026 02:08:08 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm35401565e9.3.2026.10.21.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:08:08 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptr: Record per-CPU slot owner after claiming the slot
Date: Wed, 21 Oct 2026 11:07:52 +0200
Message-ID: <20261021090753.20442-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmck-laptop>
References: <20261019161852.12783-1-parri.andrea@gmail.com> <4defa4de-ab42-4809-9645-100cad68972b@efficios.com> <fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmck-laptop>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 02:12:09PM -0700, Paul E. McKenney wrote:

[...]

> Thank you all!  Queued for testing and further review.

Thank you!

> Andrea, on your KUNIT reproducer, is there any chance that this code
> can be folded into the existing hazptrtorture.c work so that it just
> gets tested automatically?

Yes, though not as it is: the KUnit test relies on a test-only hook
in __hazptr_try_acquire(), which I would rather not add to hazptr.h.
hazptrtorture already has the interrupt side, in
hazptr_torture_acquire(), but its readers rarely reach
__hazptr_acquire(), where the race is.

So v1 of the hazptrtorture series will add, as patches 2 and 3:

  - two CONFIG_HAZPTR_DEBUG checks of the recorded slot owner, in
    hazptr_release_debug() and hazptr_note_context_switch(), and

  - a nest_acquire module parameter (default 2) that makes readers
    take a second, nested hazard pointer through __hazptr_acquire().

Without the fix, PREEMPT and NOPREEMPT then report the race about 6
seconds after boot; with nest_acquire=0, they run 10 minutes without
a report.  The nesting costs about 30% of the readers' loop
iterations, so it could instead default to zero and be enabled from
the scenario files, if you prefer.

Thanks,
  Andrea
