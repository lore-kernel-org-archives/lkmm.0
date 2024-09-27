Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4771C0DD7
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468670; cv=none; b=sG5T12r/D2343BopQj7GDIpn9voGCDkg5x7kAfyWlRBjiTrtYXku0nGaGU+f1jMK21NMh3RnFhARHOWkJJ/evBtPhC9xy3OZjpB4EpTGgTJf4U8lfDfJS19l2JIHeR1aEYcwro07gpWEQv/7SWnaqTOqPRLCzwtmOs53EEfAnEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468670; c=relaxed/simple;
	bh=DktPPQWVliv9sw4BrPAGhW6J9QwXUF8Rr4uJcTFsAy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLCinAxdyd2V9lH54vprM5n3cOP+j2QgUD5xM7JE1WBOJHDoM1PFMr5QCGI2QaG9QhZs/yDltgQo3vj3tBzEJWdjVF2zZOpdFPJVUTyGfUjeUkgiqY98XlkvvRfeibp6LnsLRItoPHZxVwSSnKsSqY9CSrUXKSBfqBcTMwm1MAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aB/g7rms; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aB/g7rms"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398b589032so761425e87.1
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727468666; x=1728073466; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y7HnKDJ0lmmcY7Bm5NjvF8jzj2uLye3yGTiI+8Ax554=;
        b=aB/g7rmsISeVpyM0pm2dYELH0+SHa+705EGpdx9HOKvJnzwTMHWmdrAIgypTd9m1lU
         hxE8haL7WLRfY+pXieUfsafIkODiXmP2F7bwsz4vPW1tmzWc8tPUyCpQUKoBM3UarBaB
         a/yHuvuE61KMbzlo9ZPP8yRmphK2kgMlET7Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727468666; x=1728073466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7HnKDJ0lmmcY7Bm5NjvF8jzj2uLye3yGTiI+8Ax554=;
        b=SI887EurFnjC06TQpY9pSS0vefdjt/hy7A2zu1oUshpSlzb3iUyh5xBCPQBetyeX1+
         WDGWfVY44uQaa6FhvP3glRVLRxlZZQaasDt5P2jck+7hdtdZENaRZxMI7uBwOiP72Jdd
         lF7C+AvEM+2vHAMp7L6aCZQKT3bCCxg1RKYSN3OUmUSyk2MX4ERRqoI+dXxdRY3wN02J
         ym4JcHf3/JrzJpxOlWfVQF4lS1ZJNgaVmjUz7HvFBMWECagk/bedMeDXLTPCgS4foupl
         8jKTw1pGSFI8FR3j3btpVacQMF+aUIYcNODKB7aKO7CRb5zOOLumJAHQg5Jt69EWCKqO
         3yig==
X-Forwarded-Encrypted: i=1; AJvYcCUxiEeLOeDBTycuZn9YaqvWheG1lDs7qp+mq+qAWgZM0mMc0cdNTphj9RCJqhJz75bEDeJS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1qdgfDV63oog2rvKlhJuEFDTaClY3iG3N2y9Ug484wJ4O6PEQ
	eqpHESO+1JkC943O4Xqgzy5kxHaR4M4X05vxz7Te6wOTGG1GHDneRPQlr4l4gpXwU72nc+iTRv8
	UuZWxLQ==
X-Google-Smtp-Source: AGHT+IHaCUUW2d6ibIHYM1YTLeTLKsqBVm/vYxbEvNBCifqa+aPn9lvCKifNoAX5br/owYNBqo2Z0Q==
X-Received: by 2002:a05:6512:2207:b0:537:aba1:16be with SMTP id 2adb3069b0e04-5389fc7d1a0mr4197212e87.46.1727468666336;
        Fri, 27 Sep 2024 13:24:26 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5384fsm416642e87.33.2024.09.27.13.24.24
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 13:24:26 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398b589032so761346e87.1
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 13:24:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa2rKMm36eOXx1l9S/2n1ZxXR5o1OlRSJKNZGBfneAW8fTBDp5rE6OVKPMbOgs/sqMcWGY@lists.linux.dev
X-Received: by 2002:a05:6512:3095:b0:536:a5ee:bb75 with SMTP id
 2adb3069b0e04-5389fc3f106mr5002054e87.21.1727468663689; Fri, 27 Sep 2024
 13:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
 <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com> <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com> <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com> <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com> <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
 <ZvX12_1mK8983cXm@boqun-archlinux> <0b262fe5-2fc5-478d-bf66-f208723238d5@efficios.com>
 <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com> <CAHk-=wgQyXOt_HjDZHNqWMmyvv74xLAcMw88grfp4HkKoS2vLw@mail.gmail.com>
 <7e1c8a5e-c110-414c-8fb2-022eacc2bd4a@efficios.com> <CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com>
 <34ec590c-b109-44a0-8bfe-8aafc6e7ad64@efficios.com> <CAHk-=wi_hz8Whs2ogRUQEfMBk=OkZ3usmvJkzb5YyEKwqEJBmQ@mail.gmail.com>
 <1b04e35c-8994-48d9-907a-966bb4dfabaf@huaweicloud.com> <CAHk-=wgi9vqh6qUpPKSydfdqd3210MnekZ1VxB6aAmfqz2bFpw@mail.gmail.com>
In-Reply-To: <CAHk-=wgi9vqh6qUpPKSydfdqd3210MnekZ1VxB6aAmfqz2bFpw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2024 13:24:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=whteT=CDW09TMk4wwwYs+qvcAKQUfw8+1D-e8H4XhFs3A@mail.gmail.com>
Message-ID: <CAHk-=whteT=CDW09TMk4wwwYs+qvcAKQUfw8+1D-e8H4XhFs3A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard pointers
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>, rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Sept 2024 at 12:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Dammit, people, read the code I posted.

Actually, no, apologies. You were right, and I was wrong.

It does need both of the sources of the comparison to be hidden,
because while even hiding just one side makes the comparison result
"meaningless" as far as the compiler is concerned, the compiler will
still have generated a pseudo for the hidden value, and might decide
that it can re-use that pseudo for the non-hidden pointer if the two
then match.

So yeah, the example function I posted should be safe, but my "you can
probably make do with hiding just one side" was actually a bogus and
invalid optimization. You do need to hide both sides. Not just for
clarity, but for correctness.

             Linus
