Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E834A3BF
	for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835450; cv=none; b=gAiYWxa9z6MAwbycbK1Pr6wEnP7STtG/IxLOuyi7GWZlvLSc8U9szwejcnlq61ed24NIj+EqYNjOxDAZebme62add6U6/Mq8wfp88yTP4tUYkESBZYlZglnu1/vNljxLpKgEcOd0hDZb/S0HcDs2CgxKneUN4wqaTI9ItkysmpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835450; c=relaxed/simple;
	bh=nBbiCr4fg61dV4D2oGNu2aR4a7biYiZnhkG7Z99V1Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8CusUlzO/eoNK8eVX2nD06QqY/1X/1dqfVF+7IZehkNHQNA0ivxQvFhLDj8FGxIGyMfpQJtxGj3Asb5Tv7d12F7VQ4GIdz7JUimukUoGqKpbPnZFsaJkERh/Gau3ooNQ9eTPy/CPZ16kVbMay+HpTIo/BQDZ33K6qcuGiGzT8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EjW0zH3H; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EjW0zH3H"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so258210966b.3
        for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789835447; x=1790440247; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGWocLshUzVVG8Rydp43t4CQtO4FrerHAEoPSMI/C8I=;
        b=EjW0zH3HInRm1w9bdLS301e85upCKsEUXx6aNSfnxkoL0U8zzDSnpKgrcMDjYi1wpn
         Z2ayyaMH1r3h9gBjf1V2jBWapMXkXvdaMvYh4i2VDwx+M1Xp2NqpFMVmf6W9+SIF90j7
         G6e8l3OwOdAtK1e4kLkP0thfdtA61C4TTzOMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835447; x=1790440247;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UGWocLshUzVVG8Rydp43t4CQtO4FrerHAEoPSMI/C8I=;
        b=ND1JKUSQ9zRs9YSGmGiAguYkyrb6pRfHAhnEJDbCLqT+3hqRGjyR8FEhmLcSjwJbkj
         55s37N86MEviyc/JmqfHqu9PhJ4LHVKPAQruwPLbsb8V4VsJFYjP9m4ofv034zFNkdTs
         aKKivF77xFEgjRJdvJh+3tHpY0HN18koBKgdg3urmMklTWpD9AkXYZC7ELzWC1siHuRv
         CGqWU/eLl96dDLId3GbYcB77VFbeDwzrEdTmOvR2OXt98btys3DotU3g3qkS6dM3l9CT
         H06wKsSJ0EXGvVvZkgCsqHX0nkMG/2EiKRonh82XBf6HvlQddK9SCBsVrkqGlBUU/yp0
         N2vw==
X-Forwarded-Encrypted: i=1; AKwUvByhjBU3D01Oi1yLbjLEnQ9T6msHxbCfmrVGx9XGb8qRrD+hRerpWP68FWWGWVCO8/Y7J85s@lists.linux.dev
X-Gm-Message-State: AFuF++m25O0OE/kZMKxmh36+0mcx+TWu00Z3+tzLBNMLJMsg/O+aRSDj
	Rpvg6lsO4CTG8GB/kjyql+qkrFxAx480T6tH3As8xctA0n0rHsjj5l8cvF70BVvHEScOfsAUtUQ
	qr6AhC08=
X-Gm-Gg: AYBFou3NKh2hbInBN/WEoQMH4wQgnX00ffa/e5cZDA2HInrQc8ITB5QOe5GX74fCkHe
	qjHsxAicYmXMTIUWc6UVSbzylLumE0npVok0bB/gIJnxMfSsNg9LQA5TBHOfYx+mAYvvyYuJKGO
	E3WwjpMPH675u9T2qq8TCIC++ufgqVqcIdy2AkvlR+hJt+40mKdl2MOvqxIlNOnMKlwnt9YKKch
	UeQU66NZxJzFZEKjwTYjNK/kcexqnXoCSbTLHSuNopkHOVl3+m3ukpW3amTfnIJfDvRgN4YQFgu
	6X/vukAHNNx+R/xCdfmAISJvbr7ev+bngjX9TmsllsJQE4t1DBX6NOE78fybi7nQQOlOmswWr2O
	wXp3vyiaPq7xc0r2xv/+Lio3+PP4BsUuNe3mUUuPWC2Nx/6woG4HxUr768z8VNN0Fooa7KkYlad
	MwX0xV4BSk7wuXLNcEDb4gEfIH3XghwszbkSDT8+wSy4KPbjC4DRw4RJZVrVnmX3SZAzfi5vkQq
	+GNm5pSIXYpSX3waEm2L2om30w/4Kruq5bgQGY3+RAWfqA3lA==
X-Received: by 2002:a17:906:c10e:b0:c26:19de:9ac8 with SMTP id a640c23a62f3a-c2a15e10548mr566061666b.32.1789835446621;
        Sat, 19 Sep 2026 09:30:46 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35700b1dsm95719366b.23.2026.09.19.09.30.44
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 09:30:45 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso277214566b.2
        for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 09:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8UyA3Yg1LGznxUb3rUyOeT5DY5B3gio2XIAfhOUXIspUB8QLunmdXeO3Im1q49/m2H2OY@lists.linux.dev
X-Received: by 2002:a17:907:6d0b:b0:c29:2646:fc3c with SMTP id
 a640c23a62f3a-c2a158569e3mr548265666b.15.1789835444190; Sat, 19 Sep 2026
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e9669b34-12c2-4cf2-a887-315f581f0789@paulmck-laptop> <20260919000056.3132131-1-paulmck@kernel.org>
In-Reply-To: <20260919000056.3132131-1-paulmck@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2026 09:30:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
X-Gm-Features: AcwNN1UfxSUGwclkVhiP1abbV-DjzJIO2ybg4zteTUzmnNfVhojty9fZ436aqK4
Message-ID: <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
Subject: Re: [PATCH 01/28] hazptr: Implement Hazard Pointers
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, lkmm@lists.linux.dev, Zqiang <qiang.zhang@linux.dev>, 
	Wang Lian <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 17:01, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Its main benefit over RCU is that it allows fast reclaim of
> HP-protected pointers without needing to wait for a grace period.

So last time I looked at this was some time ago, but the thing I was
missing then seems to still be missing: actual real numbers.

And no, I most *definitely* do not mean the pointless "do this in a tight loop".

That's just garbage. Honestly, when I see those numbers it just makes
me go "I don't want to merge things that even mention this kind of
stupid load". It's worse than irrelevant - it's an actively
misleading.

So I want to see a real load where this is actually visible not a
"loop a billion times on a hot-cache thing that doesn't do anything".

               Linus
