Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424C2C0298
	for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054000; cv=none; b=khaSquEQenMnhHHHPmuo5B43aHtBMWmB/V47yDeqn3MhvYG3Pziz0bznHNiORI1IzDQDlChgf9BrxmTD2bJmaxLqOhatGbIepoDWyws9ZWkRqdNCo41zrdbgCLNZuEsQSqDJlQ+zg4FpvF+0vn9g7u56EfovKsai69xDtjO0Bgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054000; c=relaxed/simple;
	bh=HeCVkM3iqa8HMn4hc37pmeFTDnG5eshdU15FHhnYz1E=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Tezo0E1+V4ElRmlPN66daqSeOFKUIZg+hurWRU57LZNmbqzr51Bcy4NqhlDSjhEnsGSaAdhef4sHxZvXUSdph2ArVJKQxFUaT5OkGxs2gpAXDcowhMcydLoEeaxa9BFPpSywwclRZK8i7FNys8JPRjc734AMzYGQWqq9lluRtPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=Hp/1J0lh; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Hp/1J0lh"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-11beb0a7bd6so2133158c88.1
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 02:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1766053995; x=1766658795; darn=lists.linux.dev;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAu1e8FBRNeI62zjm4DDzmRr/lJD1JUOnEjNmLdGRCc=;
        b=Hp/1J0lhrwA6L3nLT65fVZBcGidVgeDpZMNDQliPvr8qtLRoyVpVFkp3qLdo1867tc
         o3GlJ/I0qRAYUHTXJNYYWVjIb0sjwAhxjHNTPeNyvccRCrcnDNUblLbzJxea9N8VjnmD
         ZoJ0uW8C3A9fHDqmtlxXOGMGwHWrJEuBvBNSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053995; x=1766658795;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AAu1e8FBRNeI62zjm4DDzmRr/lJD1JUOnEjNmLdGRCc=;
        b=hPPKmtrxxBfnP8frjifqCa959jHHt1XsnhYx4sD9beeyG4PZzeA+MXArhnkBM1sjL7
         LvHuplJ4cTxqkZhuaINkt4AGxfbAMuanEUgpis/aM+p6rKkcSHHGxnA2UBL/aggaIxEq
         LDefrMueK/SwD5i0StBSbiiA+Qu3Uq9l/She51EJN7cjS4/+1yJVU13OM8VWQlsJn8Nr
         DC+TYelvG4aaaw0ZlKWA4NRIy8LRzG8GLttte4Iaeb13c4kZiVsCiN+J9tiKs1MMuAun
         I9oLl0LWy0F5Y43XJlo9dsuscM26M1Dgiz4jPJ8xBRws727+hWAqn62i91dMmQgcYvz5
         C/mA==
X-Forwarded-Encrypted: i=1; AJvYcCX/M2mu3Y/LGVKieRxG3qjat6gYASkbszHuJ4cedvAMkUS0N6a7Xr3qE1NMLf/Io2HLJz5C@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr+2yCvbt0RnX/8l5jshE7m8/IM+L/tOxwUflO0LGRulMW/Sv3
	MxhfqT+U7kQU3edr/JCJbqOQe2mA8m5BhV454geqFLLH/GR/eWwOiyHAmUoOf8YdKE0=
X-Gm-Gg: AY/fxX5vS3yJpHnaUYrkNt0qjIJDNgW2k/XXk9TJ/BIL2JjJS6rBAkxbHdSYwpPoHdP
	jAxWB7eQQ2qleehhdAPC9HnISSCFQay6HtVjeu5809UhXtCGNEBDXDQvwYEDyN9jOaUV6o5Le7V
	Z+n3qeH2UCttgcHhQSPhVz+/foyFv4k4f4v1/eyX40S7aq8nbwSrNL2ZdeXvTJCtaWLQFzrozAq
	rqR1ZH0prAGRoAqd0xb4kjCpjkUsJQmisfdDu/N6PcTN8QdZ1LbX60MADhJxjZBg1y3T6CYsv2D
	7THJx7coRQsY1Nw2uL6ywCW5BMDNpRpHe3Rq6lwBlz5oKJ9O2tG4OcJtl2G9XFsK10/N2WEaLls
	ob8tJcdNNod5yqc7TW5DOocUv0R3Qt7apGY/d3x11diL6n25HfAlFgERA5E1EszVxSLNuICgtRv
	hdqADaTCD71icZUkB4BR8U+Se+xKliFg9J5A==
X-Google-Smtp-Source: AGHT+IFtqtcMyTzlaYKeDxicEozD/tLr/safKQ9+lAGXo8G2u7+cxfn0zs8VwmeAOGXFGsyxxH+sjA==
X-Received: by 2002:a05:7022:7e8a:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-1206195c6d8mr2015036c88.20.1766053995200;
        Thu, 18 Dec 2025 02:33:15 -0800 (PST)
Received: from smtpclient.apple ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061ef3383sm7327215c88.0.2025.12.18.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:33:14 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Joel Fernandes <joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v4 0/4] Hazard Pointers
Date: Thu, 18 Dec 2025 05:33:02 -0500
Message-Id: <54E94704-92C0-4F10-AED9-46DFCA61233B@joelfernandes.org>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
X-Mailer: iPhone Mail (23B85)

Hi Mathieu,
Thanks for posting this.

> On Dec 17, 2025, at 8:45=E2=80=AFPM, Mathieu Desnoyers <mathieu.desnoyers@=
efficios.com> wrote:
>=20
> =EF=BB=BFHi,
>=20
> Here is a revisited version of my Hazard Pointers series. Boqun, Joel,
> if you guys have time to try it out with your use-cases it would be
> great!
>=20
> This new version does the following:
>=20
> - It has 8 preallocated hazard pointer slots per CPU (one cache line),
> - The hazard pointer user allocates a hazard pointer context variable
>  (typically on the stack), which contains the pointer to the slot *and*
>  a backup slot,
> - When all the per-CPU slots are in use, fallback to the backup slot.
>  Chain the backup slot into per-CPU lists, each protected by a raw
>  spinlock.
> - The hazard pointer synchronize does a piecewise iteration on the
>  per-CPU overflow slots lists, releasing the raw spinlock between
>  each list item. It uses a 64-bit generation counter to check for
>  concurrent list changes, and restart the traversal on generation
>  counter mismatch.
> - There is a new CONFIG_PREEMPT_HAZPTR config option. When enabled,
>  the hazard pointer acquire/release adds and then removes the hazard
>  pointer context from a per-task linked list. On context switch, the
>  scheduler migrates the per-CPU slots used by the task to the backup
>  per-context slots, thus making sure the per-CPU slots are not used
>  by preempted and blocked tasks.

This last point is another reason why I want the slots to be per task instea=
d of per CPU. It becomes very natural because the hazard pointer is always a=
ssociated with a task only anyway, not with the CPU (at usecase level). By p=
utting the slot in the task struct, we allow these requirements to flow natu=
rally without requiring any locking or list management.. Did I miss somethin=
g about the use cases?

I did some measurements about the task-scanning issue, and it is fast in my t=
esting (~1ms/10000 tasks). Any input from you or anyone on what the typical t=
ask count distribution is that we are addressing? I also made a rough protot=
ype, and it appears to be simpler with fewer lines of code because I do not n=
eed to handle preemption. It just happens naturally.

First of all, we can have a per-task counter that tracks how many hazard poi=
nters are active. If this is zero, then we can simply skip the task instead o=
f wasting cycles scanning all the task slot. Further, we can have a retire l=
ist that reuses a single scan to scan all the objects in the retire list, th=
us reusing the scan cost. This can also assist in asynchronously implementin=
g object retiring via a dedicated thread perhaps with the tasks RCU infrastr=
ucture. We can also make this per-task counter a bitmap to speed up scanning=
 potentially.

I am okay with the concept of an overflow list, but if we keep the overflow l=
ist at the per-task level instead of the per-CPU level, it is highly unlikel=
y IMO that such an overflow list will be used unless more than, say, eight h=
azard pointers per task are active at any given time. So its lock contention=
 would be rarer than, say, having a per-CPU overflow list. I would say that c=
ontention would be incredibly rare because typically hazard pointers are use=
d by multiple tasks, each of which will have its own unique set of slots. Wh=
ereas in a per-CPU overflow  approach, we have a higher chance of lock conte=
ntion, especially when the number of CPUs is low.

Other than the task-scanning performance issue, what am I missing?

Another nice benefit of using per-task hazard pointers is that we can also i=
mplement sleeping in hazard pointer sections because we will be scanning for=
 sleeping tasks as well.

By contrast, the other approaches I have seen with per-CPU hazard pointers f=
orbid sleeping, since after sleeping a task is no longer associated with its=
 CPU. The other approaches also have a higher likelihood of locking Due to r=
unning out of slots.

Of course I am missing a use case, but I suspect we can find a per-CPU ref-c=
ount use case that benefits from this. I am researching use cases when I get=
 time. I think my next task is to find a solid use case for this before doin=
g further development of a solution..

By the way, feedback on the scanning patch:

Can you consider using a per-CPU counter to track the number of active slots=
 per CPU? That way you can ignore CPU slots for CPUs that are not using haza=
rd pointers. Another idea is to skip idle CPUs as well.

Have you also considered any asynchronous use case where maintaining a retir=
ed list would assist in RCU-style deferred reclaim of hazard-pointer objects=
?

thanks,

 - Joel=20

>=20
> It is based on v6.18.1.
>=20
> Review is very welcome,
>=20
> Thanks,
>=20
> Mathieu
>=20
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: John Stultz <jstultz@google.com>
> Cc: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Zqiang <qiang.zhang1211@gmail.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: maged.michael@gmail.com
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> Cc: rcu@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: lkmm@lists.linux.dev
>=20
> Mathieu Desnoyers (4):
>  compiler.h: Introduce ptr_eq() to preserve address dependency
>  Documentation: RCU: Refer to ptr_eq()
>  hazptr: Implement Hazard Pointers
>  hazptr: Migrate per-CPU slots to backup slot on context switch
>=20
> Documentation/RCU/rcu_dereference.rst |  38 +++-
> include/linux/compiler.h              |  63 +++++++
> include/linux/hazptr.h                | 241 ++++++++++++++++++++++++++
> include/linux/sched.h                 |   4 +
> init/init_task.c                      |   3 +
> init/main.c                           |   2 +
> kernel/Kconfig.preempt                |  10 ++
> kernel/Makefile                       |   2 +-
> kernel/fork.c                         |   3 +
> kernel/hazptr.c                       | 150 ++++++++++++++++
> kernel/sched/core.c                   |   2 +
> 11 files changed, 512 insertions(+), 6 deletions(-)
> create mode 100644 include/linux/hazptr.h
> create mode 100644 kernel/hazptr.c
>=20
> --
> 2.39.5
>=20
