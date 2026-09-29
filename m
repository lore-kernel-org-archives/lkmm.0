Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229CA53CA71
	for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695474; cv=none; b=ewQYer4OoyoUiRXieH5CKiauGRLhz4AUU90UFTGOKZRi6mXmk7VyywrsV1gMUc9Rdo3hzua54FqXTm5CJDIVxRHd9ESsrAXPwfI2EBHw0VBjWsYBECmK8tOiAeAx24iIiP1lDQZmWTpH02g5y8Y2Po7o/1c3OvYjpFqL7AjznY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695474; c=relaxed/simple;
	bh=UyqxTJzFsBHiwpgeaPtT2Qc3mjNuoQ6QFEr9V0LfDYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2Tg72pdRXfO1OIYMOy8aEN8wvC+BizzWbPyIJWiUs9eND+giPjbXwAIhCkU4ts9JivBwXORtX1bMmQtBdOcVSJw5e+oAaiGJvr7fJ4r3Fla9eigrFzGDrQ09qGmtK+SzeCOuQMstEjwaEGmRU0iDYU2lMuJ1RCKYJOXeLlJtB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OzY4If5e; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OzY4If5e"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d33d80855eso2978244eaf.1
        for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790695461; x=1791300261; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=OzY4If5eIyXZVH3tIe3wZBi7iKOjqrFKaTrGhUB2xIdtJs5ptxuJhkzEzipFqTeM0g
         p9sb7u0wl+uUT9WxTg4yiCaiJeanCYENkA4PPyI6OCOo+GjEUi8onZ1IDGA0RT3EeHUB
         xAhAWD0kO3U4lQpyp/vtgeDUFHgjQdMisqp0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695461; x=1791300261;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=B5LNAO5tJlEOs5zO2RQdEjhuFV/eM2IqBfcvqrDuTPHQazZ7SN7c3a99bvO/td6Eed
         PklN1FPLfGFEsxkfdF70jhcw2vM6nzPV9vC8df/TrWcm1eQKU7X8fqTVRcbeplqWFfEy
         3WbEvUPsg1VJj3xMq7jtDxez1a2nEJ52iqiXlxTnaaNhsbMluAfBl8hWYyxlIetUlyH0
         d00foPmVFhFLjRvu3wOMzFB0LyiRtwDslQJtKVp3H+NpbQmisCBwH6TLHetnSpnMynR8
         wskRAjCdLOjrdcltDajtTInX/3E+JoPAId8XU4YclJ/FDfqyxcecyHU9OVNkUoR3sbQu
         CmrA==
X-Forwarded-Encrypted: i=1; AKwUvBx73Y9xrwM0zZhajzLZA2AlnbZs/7uXobz0raiUJRU/K+JagBeZ2IyXoXSH1UoDBaeFOpk7@lists.linux.dev
X-Gm-Message-State: AFuF++mIh9DjaZSmaDN4Ep/0LCuILhorUezWMKL7pWA8tgQrg9u65FJu
	Jqb8ipNDo9xYzwI+oRNt3dqE8Gd0YQMlZSG6QiWc1SOlUud2uccb9/2hPQGoQiA5Mu7Ey15R4lg
	AeXiykv8uNA==
X-Gm-Gg: AYBFou0ZGy/vFEOHXcbimWNmoKVmR+P50argGjeE1BAjCvPO9zfW+4vAZkWOXQ5DzP3
	Egx8F/AZHmiDoyYRxAaN4VqwZ5IZ6LuSW1O7Yc9BArJmu+ruHaKAOHNT51Ztxb9S2Yd9QyAuqR6
	pdc8lla7gCDxaO9pNvTP+bKqmg+/9oAR5wmhg02C1BapimilODeNVNLJabWqorvyTlWLS/OtHPE
	Os4uBOdJ3l0cXOg8SyXckkLdC0ebCgtItHh98qvCiZK195fJwCKpIVi/jkSQYo9RP4nQy+FbfUu
	trVnCkM+Vvc5EHxmzZSEAQ0/Rw4D/jYrKQD+LEjjYgrp57I3MwgLmGQu4eyj7kzErzdI7eez3b6
	SVTocc7/rzapJEumZflfsz2LHm3oeOELWGCjvzmo1GT422AEgzKF7+CJer7kTmMsyD3wfkjlm2N
	2hYNdSmFHqIqfbNL/m3aV91E2w3bZXyOyre0Uo9fpMGA4W+jlR7BxLdEtNaNWEmTDMGlFCDYImm
	L7bNfBFuKO2NVZ6HJyzLoBokMD4CwJXHbzVrZ+jmo8T+tPwHg==
X-Received: by 2002:a05:6820:810c:b0:6cd:3fdc:6003 with SMTP id 006d021491bc7-6d441c7b755mr13753528eaf.84.1790695461448;
        Tue, 29 Sep 2026 08:24:21 -0700 (PDT)
Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com. [74.125.231.166])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81fac9fc959sm121565a34.3.2026.09.29.08.24.21
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:24:21 -0700 (PDT)
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805c194bc92so5277038a34.1
        for <lkmm@lists.linux.dev>; Tue, 29 Sep 2026 08:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAuU6pmiBN+zakDNTNnpOWVXJWzu8P6lnEFDuilVsWP2r4lFD/3lFTgJns3CYx9SOmNvoW@lists.linux.dev
X-Received: by 2002:a17:902:d483:b0:2dd:ad73:5b68 with SMTP id
 d9443c01a7336-2df7da85639mr143411375ad.24.1790695032383; Tue, 29 Sep 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com>
 <20260927155134.4740-3-mathieu.desnoyers@efficios.com> <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
 <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
In-Reply-To: <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 08:16:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
X-Gm-Features: AclHuK92qcnFUvMDyEty0mgzRt4zpmui3HdPCBaHPsJjfcUlLFRzvquKppDzHHE
Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 08:04, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> I agree that doing it in asm would generate better code. Also, I've
> been told that clang now preserves the address dependency in this
> scenario, so perhaps we'd want to use preprocessor conditionals to
> select how to implement ptr_eq based on:
>
> - architecture (allowing asm implementation overrides),
> - compiler (e.g. if compiler is clang >= version X, just do a plain
>    comparison). Likewise for gcc if it ever decides to fix this
>    behavior.
>
> I think this "hide var" hack is a fallback which can be used as a
> starting point, and then we can specialize based on architecture and
> compiler.
>
> Or do you prefer this in a different order ?

Oh, if there's some sane way to tell that the compiler already honors
address dependencies, then that should be done first and the whole
thing should just become a simple

 (a) == (b)

for that situation - allowing the compiler then the freedom to do
whatever (which can involve not using a register at all, but a compare
to memory, or whatever - the compiler might have reasons to avoid the
'cmp' and use another sequence entirely)

Then a "if we have an architecture fallback".

And then that OPTIMIZER_HIDE_VAR() thing as a last fallback.

               Linus
