Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582081D172E
	for <lkmm@lists.linux.dev>; Wed,  2 Oct 2024 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727890782; cv=none; b=HKsKTv8H7QGIxnPuYqwf0KSXUyaI9IwTH6Lyxd/E9AUD1p61iwXNZdKZlzhZooQ3UYqG6Q+MjdSO/YKY5WVTUbEyPGeWHEQsOTbm3RtQZ3pV5H0+X4VLmlXeGUSR2aTjKiX2RfOCSg7LYVCLJTZC8qkGK11X2yaveQhHB10AGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727890782; c=relaxed/simple;
	bh=CiGTgCjOlyk3hZM74g8+7FcOFj9hl0bMj4TBEfGDgLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjR50BNYbj1txLlMUew+MSkJcFUMfND/EoAx+s1996JR/Jp0d9E06jvFOynYXwX2uqEMv4C/WxRBHLUa2enV5sBuGyhaH5qT9mc1R8K6PDJ7ND6kxP7cFvR45WUaXkA9gdu2eP/yNhDmJjiqVrBBJE5pDHg/UaaGqP8DFeuULqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=e2QPnx4I; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="e2QPnx4I"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398b589032so3566e87.1
        for <lkmm@lists.linux.dev>; Wed, 02 Oct 2024 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727890778; x=1728495578; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fcw0AUFxqpg2EROaTPkK5EUAJwDwpjeNdNVYK6kfU4w=;
        b=e2QPnx4ILCYbNzApm0iyeEoARW0VfEsEgjRfMNOIKapK1iYynUuECQJvyxSKsLx8nY
         Y6m5mf8JVIYKLmkxWEyQUX7VXTM5XZq/ejeMJYSLDD9dyKcT3LwWUKLSs2vDyJ5IuDD4
         lhwUPDCyUj5CLeGCNdip3pzGBpa5h26xQCY4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727890778; x=1728495578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fcw0AUFxqpg2EROaTPkK5EUAJwDwpjeNdNVYK6kfU4w=;
        b=SQDkH7eAo4vOBssuZnHLvTVlz9ziBCsDTCkwpJMOOFBbqXNSMrlOP5k5Ha98H63Lzv
         3Z+jv19zGezy0ckMzTTowRIqmvHjJCwc91U0VlfW3SoKt0JE5VY5aGcRHUEDrXRs+F2M
         e6cSMRIuqiFUw/g2n8GD/24KG2tqShMXQWvUdhXj3tRmxGty33o4RXneH/bOC5AYrxYw
         7pdxCmt8utJSwFbUxmUmR+KZ7A/HN7BiKjLuFs3IAZxUF6YNV/wxPCE1vvGb1NUMu6Bu
         1ZhrcNCBQ4y/WSaBKHpTGyvbqjjhOhvvLOZXtS1ywX/rB872jQZzchOAhZGTxUPLZGol
         cNaw==
X-Forwarded-Encrypted: i=1; AJvYcCWrO4/xPSgYzSnDCyki2oWPqi6gRm0q0h3ahu2rURHBX4He81+1z3cDTSizhIYqex+5ielD@lists.linux.dev
X-Gm-Message-State: AOJu0YwjaKlPZZHtogPKkedP6QI1pNGSjfThxM1bT4zSazS2hSCcTsfJ
	uaVU8UgVkoXj3D7egtANDtjhlStTdmbdUy/XC+ZD+byDwafs9FLw7BCxzQLuHrCG3qmsoKtKsIZ
	U
X-Google-Smtp-Source: AGHT+IH6lS699iVUktxtFQsymCtolEi7ex6b2s12acayO0+3d21WwTQLZ5ZHoSEmCX9VfgI7NOx/fA==
X-Received: by 2002:a05:6512:e8c:b0:536:a695:9414 with SMTP id 2adb3069b0e04-539a065891bmr3601521e87.6.1727890778061;
        Wed, 02 Oct 2024 10:39:38 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5df91sm1988031e87.82.2024.10.02.10.39.33
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 10:39:33 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso808841fa.1
        for <lkmm@lists.linux.dev>; Wed, 02 Oct 2024 10:39:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2DS422iHLnQEHmmhYOoI9BvcwJCnxUbfSIXmSPVkeXhLB2WrAybIUXKZEfd2cWjHV/CLx@lists.linux.dev
X-Received: by 2002:a2e:a9a5:0:b0:2f3:f1ee:2256 with SMTP id
 38308e7fff4ca-2fae10b46a2mr39398791fa.44.1727890772630; Wed, 02 Oct 2024
 10:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 10:39:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgztWbA4z85xKob4eS9P=Nt5h4j=HnN+Pc90expskiCRA@mail.gmail.com>
Message-ID: <CAHk-=wgztWbA4z85xKob4eS9P=Nt5h4j=HnN+Pc90expskiCRA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] sched+mm: Track lazy active mm existence with
 hazard pointers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Oct 2024 at 18:04, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Hazard pointers appear to be a good fit for replacing refcount based lazy
> active mm tracking.

If the mm refcount is this expensive, I suspect we really shouldn't
use it at all.

The thing is, we don't _need_ to use the mm refcount - the reason the
lazy-tlb handling uses it is because we already had that refcount and
it was easy to extend on existing logic, not because it's really
required any more.

The lazy-tlb activation is basically "I'm switching to a kernel
thread, so I'll re-use the TLB state of the previous thread".

(And yes, it also has a secondary case of "I'm exiting, so I will turn
the mm I already have into a lazy one").

But in the actual task switch case, the previous thread hasn't _lost_
that mm, so we don't actually need to take the refcount at all.

We really just need to make sure to invalidate it before it's torn
down, but we do that *anyway* as part of TLB flushing.

(The exit case is actually different: we are setting it up to be lost,
although delayed - and the lazy count is the delay).

The only thing the refcount means is that we don't actually have to be
as careful when we actually *really* get rid of the MM. We can be a
bit laissez-faire about things because even if we weren't to
invalidate the lazy mm, it does have its own refcount, so we don't
much care.

But in reality, we're actually very careful about the active_mm
_anyway_, because of a fairly fundamental issue: the TLB shootdown and
PCID handling that we need to do even when mm's aren't lazy.

So we actually keep track of things like "which CPU's have seen this
MM state" in all the TLB code.

And even the exit case doesn't actually need the special thing - it
*does* need the "this CPU is still using this MM", but we have that
too as part of the TLB code - entirely independently of 'active_mm'.

So in many ways, I'm pretty sure not just the refcount, but all of
'active_mm', is largely pointless to begin with.

And if the refcount really is this big of a deal:

> nr threads (-t)     speedup
>    192               +28%

then we should probably just strive to get rid of 'active_mm' altogether.

Look, at least on x86 we ALREADY has a better replacement: it's the
percpu 'cpu_tlbstate'.

It basically duplicates all we do with active_mm and the whole "keep
track of old mm state" (the 'loaded_mm' member is basically the true
'active' mm), except it has some additional fixes:

 - it has some extra housekeeping data that the architecture wants
(for PCID updates etc)

 - it's actually atomic wrt the low-level code in ways that
'current->active_mm' isn't

So I think the real issue is that "active_mm" is an old hack from a
bygone era when we didn't have the (much more involved) full TLB
tracking.

               Linus
