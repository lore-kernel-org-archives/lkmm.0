Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B7345ED9
	for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 17:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837631; cv=none; b=RUtwV9np9CBx+rzBmI+t4l0SDEsXtQHfg7RWnJDIuXBKxxt53fPsMCZR0hzn7zQuSRU9lqLiB1O2oCUxbRjPQhr9DdtXP82y6+JQyzpgMKCrjsSb7ti++CaGbTCbvmNEXAKQ5ab43n4YOvuFt8uJvErwjfVIE+5OkmSWh+F1aTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837631; c=relaxed/simple;
	bh=u36MjiEqXs39fNOYa7M2eitiO4tZva/VUMm3woA92yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+NRnvYHKaa5VLqvJxqzeHrqcgQ7DK7PCRkQ9/szV8XM4FsGl7qim9vp2ZfoHO4mg6PVuKZp1LjOfkuodK8b/bnh7F6Vd/mTc4HqyzaqEiI0rq+dsqOOxf0f1H/G7Fxg2xCDVjvfvW4WyE1/EdD6IaXqT5oO9jzNGs6zMYL+Daw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W/8Ec24I; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W/8Ec24I"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1461533e87.0
        for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789837627; x=1790442427; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4EVCCJGMVi/Jgl5olIITsEJ4O030sdS93t+4GDKvrY=;
        b=W/8Ec24IWlc4rOhXpijw5HCJAvhxGzaRQX9dQHM+y6DZVU3dCxLW1vMAJiq1o1/Gos
         wYtlZPxD89m1kqewrEZWBsb9o4lGv+K489nATGI60lb5JQpACEAl9D1gxkBqRSywNVeU
         ozWmBU5ZhH0QCc2Sl/WCjcruI1wWdcIYXSHew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789837627; x=1790442427;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R4EVCCJGMVi/Jgl5olIITsEJ4O030sdS93t+4GDKvrY=;
        b=nUBhQSCWc8XRWZtgZ99Z7fgWcWEVmDJY1d1Cq5cvlBFwsS4whVetGg4/tg+QeXtmBG
         k7HL8I2Wq9BYiKO7KnPaGjNRNinBaUpuPtrBOayGQS6/09dLPe+adsJRqnEO5zZB0id+
         FjrZ8hhMtgTb4ZAxpKDYfP7hqIDtLFnJMr3dlwmET/tWr+CQIHqjhoIHv8D7lW9tSMSI
         NuhkctpXqjATpFyDf15S9RVlLfVjGGTJfcmzFSoP86PJ60AP5DObxT5wY+tyzLyuLAkG
         3LDgIx+aN9ntxEm5dqhhcHuc8Lw5rjoUshYmbsvG6WIeyDhFzjim+/X9yaLk4wCv+QtC
         NHnA==
X-Forwarded-Encrypted: i=1; AKwUvBy8MsgqW+SgVb+MJv/KUHM5KwOBNhaoPje8AXgRsY9PUQQkA6D6pDrWZCQj9GhjKNRrPvFf@lists.linux.dev
X-Gm-Message-State: AFuF++mFQ+f5UvcwEBr+K3vUS5IVb3ohaeiwhhTW7T9zyZlrRtT6F5Sq
	/HV7xTqr7EFMSThQfPep/fcACnF/7e7sxIPEhP02h9YEGOLx+iBoRbgMmSV297Nc9r/v8816i9B
	sfvWcSnfvJg==
X-Gm-Gg: AYBFou1JTvt8g6IGkcunjrRogSx7GdhHbIXViXW3lksceQSnltdBmRM1NOgD3KFNZvK
	EvjeVRw8hoF1kGhMB0mF4170cEA3/Fqa54P7WoZtlDORx7qhQNaKSgl+rUoYdn64UmAbbl4g4cm
	DfyccEcejTVWJl012hs0iauvOmSmGDEXsociGghnRuzjosn9gvME8YhHVQZypjEM3bUX/0RU94r
	KtgaQpBYHv9BE8B5hd7F5SLgkcgHwb2Zv4WZaDQ5RsURtCJVKtEPVK99WGYmX93SXPhA25FdL2Z
	R/EtAcLAd7ukgtaF4FLKkEYujb1O/ymawkgwa+HBN2tZQqaWDWi0g1laC8qzy3YAd59DYzg8knr
	9q0i6Uli79oZFTnESmPjJWA33gqbvBHP+O9wH51PzaVb9IlVy2j490c3Aap5XSaTBFPIk9y/67a
	Hc/srrsNylprEU3MW1lXYFkUnVCSVXy69/dvGRqnlKQJ+qkO7ZLl23cBf0hiFerwExXIhJtvhc1
	tHTFf0aHfEGV2f062C6vzfYV3o2oLrbAxYsPL/KbmgP1qe1hQ==
X-Received: by 2002:a05:6512:2390:b0:5b6:183c:5c94 with SMTP id 2adb3069b0e04-5b8c18593ebmr1931628e87.50.1789837627101;
        Sat, 19 Sep 2026 10:07:07 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c794470csm666045e87.34.2026.09.19.10.07.06
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:07:06 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1461523e87.0
        for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 10:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOz+DNOqNLfEBmOWL4hmnowEyCNF5UX6UIyWdsuRwHOT99xyjghbZWWbbqQfGBm6VO3umc@lists.linux.dev
X-Received: by 2002:a17:907:3f17:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c2a15b4bca3mr522411266b.33.1789837224119; Sat, 19 Sep 2026
 10:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e9669b34-12c2-4cf2-a887-315f581f0789@paulmck-laptop>
 <20260919000056.3132131-1-paulmck@kernel.org> <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
 <6B1FC39D-6EB0-433A-8E49-E5EFC9379AD7@mainlining.org>
In-Reply-To: <6B1FC39D-6EB0-433A-8E49-E5EFC9379AD7@mainlining.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2026 10:00:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyniJy-CX1muCrsZp-i-sLGRYeRYEPN7sw9orRZUCwag@mail.gmail.com>
X-Gm-Features: AcwNN1WCbh_CXATf-FMT8x_ZS8yd9pmRtrkzEOhM9i8GXxqTrntEHha57Im_sMA
Message-ID: <CAHk-=wjyniJy-CX1muCrsZp-i-sLGRYeRYEPN7sw9orRZUCwag@mail.gmail.com>
Subject: Re: [PATCH 01/28] hazptr: Implement Hazard Pointers
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Boqun Feng <boqun@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, lkmm@lists.linux.dev, 
	Zqiang <qiang.zhang@linux.dev>, Wang Lian <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
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

On Sat, 19 Sept 2026 at 09:35, Bradley Morgan <brads@mainlining.org> wrote:
>
> I think hazard pointers are good, what test do YOU suggest we do here?

I want to see a single real-world example of "look, this speeds this
real load up by 10%, and the kernel code was actually cleaned up in
the process because hazard pointers are great".

Not a microbenchmark that tests just the hazard pointers themselves,
but a real kernel feature that has been converted to hazard pointers,
and in the process actually shows improvement.

The ONLY reason for hazard pointers to ever be merged is if they
actually buy us something real.

So I want to see that 'real" thing.

I want to see how easy/hard it is to actually convert a real current
user, and I want to see how it actually results in measurable
improvements in performance.

Something *core*. Something that everybody uses. Because I'm not in
the least interested in a new subtle feature that interacts with the
scheduler and is only used for some random driver or (to pick the only
example I have ever seen) AppArmor.

Now, obviously, the thing that would impress me is something like the
dcache. If *that* can be converted, and it shows real improvements on
some real benchmark, then I'm sold.

Now, I don't really expect that kind of major test-case, but I do
expect *something* meaningful. Not a driver. Not a test module. Real
code.

IOW: "Show me the money".

Because the kernel is *not* some kind of acadmic project. Never has been.

I simply don't want to merge something that is touted as an
alterantive to RCU - which we obviously depend on very very heavily -
without something *major* that actually uses it and shows the
real-world advantages.

The discussion about hazard pointers in the kernel has been around for
a few years by now. If there isn't some real core feature that was
converted to show that, then I think that's already a failure
indication.

I'm hoping that those patches and numbers already exist, and I just
haven't seen them.

                  Linus
