Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7453A38B
	for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693245; cv=none; b=AaiFQZXNY1WRXPtH42PQX2QYD9pJkDHKAIGnzlPiPC03WcJc3hOjoviGnRKSS6V+CP/AUiielwwM8i1S0mvmZCA2XbW1h9TfZ/rGesm/jlnVUwafnyGpnbd3uSRgMSnaytLlOiiHCXn+XD8kzkU+d0HhafE4caPieFJkecFdRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693245; c=relaxed/simple;
	bh=SLmPCj6Drkarz6MGesiMP1GtPbh4rsUc3J8b1Kcoqwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoCBr/5CylsKuvc6S2sbFFD18919zbIvcroMyvUbn/Ifuqp7YfCWtlYknoBJyezLdIaF3KjeZIHtMNYpZ1VbZCJZp2SaPMsUJVVnmxzKS3v3Rnqq+RKdVHEE0T0AluyjPMbGGZyByV2S58VA7V3sWUoIsvKjj1E1FQPvT8zIRd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gP4XsDMB; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gP4XsDMB"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso553595766b.1
        for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790693241; x=1791298041; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=gP4XsDMB+T6UMNFGWFAUWEG+P7Km5G5V8eadTDuZzhM4Dz5ah1zK7oMjBqRJ2mJVm2
         lCzWgu+ZbpTf53BlYiMRnGdefbA0vO5Y+rxjwAEdawCTzx0Xy216ZBdvzvRAbGws8tPP
         J0/VHBMo3NGDhpApvmI9OtQaH0Rjx2IEzF2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693241; x=1791298041;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=OpYuCI0rRqhI0qe9cxid3C4PZZLd8BurbX7FgLaaraBqb6oUM/uuIq/eUVaLfzHxTA
         JnVuwlrjOt8CLPlt3RPc9gWiNgbmFNi1BhArSLalCxCvLBw5Y8qPSC+nn+vaYA2EsTRF
         SSXHNn3wxARRG7S2ait3NhibFtamOdWWMYm9/SaFgRUBtz8msqpqLofmvL3i7qnBCcHO
         VRNpot72mTCTk8xnR+aW2xdecthgcuflBph1ckJs2Lgm35mJl/YHrRzqaGLkuMxvZoIY
         ZC98RZFO9CmR9fNfEpppjWI3IVnQxNob2+hpN0yTd8R/VcwLQC6HObJtHUeCmoiwnhJI
         VNrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk5kTBPLlBDKuXyNQlNheWtuqHphQGwNHf7Q5pMFo9+MQ0DqCcGdUGWe/YURqYfJdLNLVJ@lists.linux.dev
X-Gm-Message-State: AFq9FYJqMSLJ+iA5AM4lqsfwOR4D+yrPzSig3b1z+tRpAN1XNxursIee
	VT8OZ+NCnRBUbVFTqaHvUKs8fOVg2HW7foJEACjCh5GFLgWxR2rsg9PrHZOtDT/i39NsgJANivO
	c2YG055M=
X-Gm-Gg: AYBFou3vEH7mpms/jp1+lGJyZK2gz6Fm9Up3ZLfMaxFUTdip+mtJLqFs/BIGh0gvG7M
	y+ToJCvDLnFPMZLrpI596SmNx3DGxqTL/9RhQoGJPTKN6zTL9tl6Zj5JQxRWZXEhnL2pXM4xkIP
	kd0CvrHwfWQUyZAwoG1VZs/8Of5XLV3m3aw+DWgmHYIXmagv1aXmfrM8tZf9GAWZ7+zMDqZV9ye
	Db4I8pYMAbAX1O1WZRWnlTBI9Oju72ULAiJCavhja9kdDX81raKdaNP7pKpO5W0RjwWIY/eFBm+
	dpTluc7jedKOcPBALmski4zM647Lh2uNfS396Jox9gQjJtRPh6XUojWDIg5IpMzBP/SjVFw7/oK
	882a2tKz3VBrqgqxmaNaOryAeRZbd92KCJMXPpBhomXT4MNNXQWvH8IzYpu825Se880xxGdbvEK
	tRqjY8k6FrMThVZqVS1YnigX5l37gW+rYabZTr2N8/EWcCZN+DMGjqb0OtGAcBrwU4EDZa4AgYm
	StdOuQtwe7qz1Wq4KVDZSRotTSUEByQGJHQBddF8V3IVYM1ww==
X-Received: by 2002:a17:907:c589:b0:c2d:c765:b790 with SMTP id a640c23a62f3a-c2dc765c464mr667195366b.18.1790693241238;
        Tue, 29 Sep 2026 07:47:21 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e0e1ce1bdsm5886366b.47.2026.09.29.07.47.17
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:47:20 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso575787566b.3
        for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 07:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwisZk7o2FFzehL95Ix6xAr9qILRKCCT3Gvae5T+qYOGxzAKZak4Mqo18htmuvpld15JFii@lists.linux.dev
X-Received: by 2002:a17:907:c491:b0:c26:1648:a06f with SMTP id
 a640c23a62f3a-c2ac253fd57mr1427153166b.42.1790693237251; Tue, 29 Sep 2026
 07:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com> <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 07:47:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
X-Gm-Features: AclHuK-hIyKMMCYq0m6RbVGEdDaE41y87jUOezwgP_JOLXBYBmnHdH3WXkY-n-A
Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 08:51, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> +static __always_inline
> +int ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       OPTIMIZER_HIDE_VAR(a);
> +       OPTIMIZER_HIDE_VAR(b);
> +       return a == b;
> +}

I had to think about why I hate this so much.

It's probably entirely senseless, but this just rubs me the wrong way.
Those OPTIMIZER_HIDE_VAR() statements are hiding the wrong thing. They
are telling the compiler to treat valid information (the pointers) as
if they had changed, so then the compiler will have to just reload
those pointers when they are used later (and "used later" is part of
the whole *point* of this, after all).

But it was never the pointer values that needed hiding from the
compiler. It's always just the comparison. And while the "optimal"
thing would be to just do something like

  static __always_inline bool ptr_eq(const volatile void *a, const
volatile void *b)
  {
        bool ret;
        asm("cmpq %0,%1":"=@ccz" (ret):"r" (a),"r"(b))
        return ret;
  }

that is an architecture-specific thing - and then have that
OPTIMIZER_HIDE_VAR() available as a fallback.

I don't know if it's really worth it, but I really do despise that
"hide the wrong values" thing that generates two new values just to
compare them and throw them away, and adds register pressure for no
good reason.

               Linus
