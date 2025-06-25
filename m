Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C6262FDB
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866733; cv=none; b=LGe9fA01zLy4w7nTwkJUiwmgF4w2UCKYEx0OwDNIG0jHNe8ugSuJtNQuE4b27AoyRdKgUA8uS4XcXyHsN6lY4bFXxlzbNCH1S8mml5czo2RePUzUsTps+QirZNa5jL4pA9lBVB8i+PruQpC57QhD7+nxFDR/dUw/TyhODxSDbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866733; c=relaxed/simple;
	bh=2dEZxA9znoi4/j5ZU/wsEM4CqiVDW+cT8z82gn8Ynjg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KZkpJ+o4Qn0OGc7C3jaqUdFqS6blZ9A2DpV4zOiPL8Z12058SRxfzGYJhtbsbJSRXibWEcN7fVhwCi8w+qLOLCby7OJxlOW4xCQT0k9lQPH3br1DlEXF6Nksx0cX1VL4ivLeN8WXsE3AFshyOJkZ/HvEdkPn1iXAyeygufttgV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AroxS4Xe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AroxS4Xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750866730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UprNKi29neeOtDuoBhXpguAmiHeVIiz0UMx6QLlk6uM=;
	b=AroxS4XeeMZYXFDXFXjRw0Vxbsvs3qtGYGbyQMtNCsXu60Mimi/k1SQm+KuA1+kCJcjvQO
	6moXOgdHAxqh3UDE4TYNo9Rqp1K2d82WvgDYZWA+D/1jAXRqVO8rrO1vszinlHBE3Lugo+
	VXglqUs/zO9lbShzO95jmmfcUVyImQk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-K8tMrXVXPf2W6b9Hojf6NQ-1; Wed, 25 Jun 2025 11:52:08 -0400
X-MC-Unique: K8tMrXVXPf2W6b9Hojf6NQ-1
X-Mimecast-MFC-AGG-ID: K8tMrXVXPf2W6b9Hojf6NQ_1750866728
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so5763047a91.1
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 08:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866728; x=1751471528;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UprNKi29neeOtDuoBhXpguAmiHeVIiz0UMx6QLlk6uM=;
        b=B8bgJeaoQZjQvYan1RZ6teImueAlQ/m5J5+ftFFDr36GpM26xvOC+XI1vLGy11BI9E
         hZFmzDm0yEiQzmYDh2pkwfhKszXm6973eg5iNpvMsVeYmqd0SgdF45BL476wYCIGxT5x
         YsVhzfvMS8fR4SsC3lYbkDoCUD1suPv7sckF7vMtQR8QDUGNrxr2GnEbREBZIqgmtGlc
         3c7++PwCbaXH6Cz0ybpouffDGBGybHtiiCakqv4xYnAbW+3ZZzRJdFGsYoap/5goYAWz
         LXtslW1oFJG1B3c1rwWqjEiZ8fPTM7127CUEgTJq9rOZ9FTpsTvdlNZPQhOZPD/8q/s1
         y30g==
X-Forwarded-Encrypted: i=1; AJvYcCVj2LzFgldyFSHd7xjKVkIs4QCElKtiWsihqAJ0Tiyf7S8a51XtYrrfRt7QHgBLb0a3v+bb@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/M22oYrtAlXsLhLm3cLu/RQzvvCY5E30Wflw24fyuO5IVDFMG
	MjnLLn1cE6yydqLu53BISsSXOfIovb70ytxXg29HUXQ3rzCwmcs3q7ler5xwmE3VcFYHuR49QTk
	IWAldZAuJNdqb1+mISe9oG1C12V6DLNeg5+cxdi2qNumLWnMlqHrOfHo=
X-Gm-Gg: ASbGncuG9WfbqeoTPyRp+untTZoKTtlsvzQoSh4gK0jZWjeXf1wxCoLhbAmjAyEbMsf
	ybumIEH0OwnIVTlwg9LpXg6zJdcvqBS+u16Y8R3EWuYZMgVE+dzjdwNBzTHdpGgPMUEVQhHP/Ez
	uXman3eHb/r8CwLhaWzE2wedYn4oVBcU3UkeberDoWwIllIa/Qu1RfD5OGh0CyodSDslr51BkIw
	O9ZTgl8f14H6EhjoJdOSceeOxpIvO0ERH/19KComVR56UjvOxj0/NF+D92VPxdgxQPASacaOZUd
	jwk8cuXGpZ5az65ffKtQ7089v37QAbN8ENUr38oJhJcnSqFmjP4fXR3RBcAGn8i2AqID
X-Received: by 2002:a17:90b:1fce:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-315f269fa68mr4355068a91.32.1750866727513;
        Wed, 25 Jun 2025 08:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGglaSDui+roskZocwG9xuSyfP0Kpa0z0xiQ8gfEl8NwUolpzM/PIXW3EJfCfspj5HFPWW0bw==
X-Received: by 2002:a17:90b:1fce:b0:312:e731:5a6b with SMTP id 98e67ed59e1d1-315f269fa68mr4355024a91.32.1750866727029;
        Wed, 25 Jun 2025 08:52:07 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53ea827sm2146576a91.41.2025.06.25.08.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:52:05 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <c649c8ec-6c1b-41a3-90c5-43c0feed7803@redhat.com>
Date: Wed, 25 Jun 2025 11:52:04 -0400
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] Introduce simple hazard pointers
To: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, lkmm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
 Breno Leitao <leitao@debian.org>, aeh@meta.com, netdev@vger.kernel.org,
 edumazet@google.com, jhs@mojatatu.com, kernel-team@meta.com,
 Erik Lundgren <elundgren@meta.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-2-boqun.feng@gmail.com>
In-Reply-To: <20250625031101.12555-2-boqun.feng@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2KhjcHJX8uA03lIun5LW0J9rDb0GM_2G2asz7tyBQ9I_1750866728
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/25 11:10 PM, Boqun Feng wrote:
> As its name suggests, simple hazard pointers (shazptr) is a
> simplification of hazard pointers [1]: it has only one hazard pointer
> slot per-CPU and is targeted for simple use cases where the read-side
> already has preemption disabled. It's a trade-off between full features
> of a normal hazard pointer implementation (multiple slots, dynamic slot
> allocation, etc.) and the simple use scenario.
>
> Since there's only one slot per-CPU, so shazptr read-side critical
> section nesting is a problem that needs to be resolved, because at very
> least, interrupts and NMI can introduce nested shazptr read-side
> critical sections. A SHAZPTR_WILDCARD is introduced to resolve this:
> SHAZPTR_WILDCARD is a special address value that blocks *all* shazptr
> waiters. In an interrupt-causing shazptr read-side critical section
> nesting case (i.e. an interrupt happens while the per-CPU hazard pointer
> slot being used and tries to acquire a hazard pointer itself), the inner
> critical section will switch the value of the hazard pointer slot into
> SHAZPTR_WILDCARD, and let the outer critical section eventually zero the
> slot. The SHAZPTR_WILDCARD still provide the correct protection because
> it blocks all the waiters.
>
> It's true that once the wildcard mechanism is activated, shazptr
> mechanism may be downgrade to something similar to RCU (and probably
> with a worse implementation), which generally has longer wait time and
> larger memory footprint compared to a typical hazard pointer
> implementation. However, that can only happen with a lot of users using
> hazard pointers, and then it's reasonable to introduce the
> fully-featured hazard pointer implementation [2] and switch users to it.
>
> Note that shazptr_protect() may be added later, the current potential
> usage doesn't require it, and a shazptr_acquire(), which installs the
> protected value to hazard pointer slot and proves the smp_mb(), is
> enough for now.
>
> [1]: M. M. Michael, "Hazard pointers: safe memory reclamation for
>       lock-free objects," in IEEE Transactions on Parallel and
>       Distributed Systems, vol. 15, no. 6, pp. 491-504, June 2004
>
> Link: https://lore.kernel.org/lkml/20240917143402.930114-1-boqun.feng@gmail.com/ [2]
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>   include/linux/shazptr.h  | 73 ++++++++++++++++++++++++++++++++++++++++
>   kernel/locking/Makefile  |  2 +-
>   kernel/locking/shazptr.c | 29 ++++++++++++++++
>   3 files changed, 103 insertions(+), 1 deletion(-)
>   create mode 100644 include/linux/shazptr.h
>   create mode 100644 kernel/locking/shazptr.c
>
> diff --git a/include/linux/shazptr.h b/include/linux/shazptr.h
> new file mode 100644
> index 000000000000..287cd04b4be9
> --- /dev/null
> +++ b/include/linux/shazptr.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Simple hazard pointers
> + *
> + * Copyright (c) 2025, Microsoft Corporation.
> + *
> + * Author: Boqun Feng <boqun.feng@gmail.com>
> + *
> + * A simple variant of hazard pointers, the users must ensure the preemption
> + * is already disabled when calling a shazptr_acquire() to protect an address.
> + * If one shazptr_acquire() is called after another shazptr_acquire() has been
> + * called without the corresponding shazptr_clear() has been called, the later
> + * shazptr_acquire() must be cleared first.
> + *
> + * The most suitable usage is when only one address need to be protected in a
> + * preemption disabled critical section.
> + */
> +
> +#ifndef _LINUX_SHAZPTR_H
> +#define _LINUX_SHAZPTR_H
> +
> +#include <linux/cleanup.h>
> +#include <linux/percpu.h>
> +
> +/* Make ULONG_MAX the wildcard value */
> +#define SHAZPTR_WILDCARD ((void *)(ULONG_MAX))
> +
> +DECLARE_PER_CPU_SHARED_ALIGNED(void *, shazptr_slots);
> +
> +/* Represent a held hazard pointer slot */
> +struct shazptr_guard {
> +	void **slot;
> +	bool use_wildcard;
> +};
> +
> +/*
> + * Acquire a hazptr slot and begin the hazard pointer critical section.
> + *
> + * Must be called with preemption disabled, and preemption must remain disabled
> + * until shazptr_clear().
> + */
> +static inline struct shazptr_guard shazptr_acquire(void *ptr)
> +{
> +	struct shazptr_guard guard = {
> +		/* Preemption is disabled. */
> +		.slot = this_cpu_ptr(&shazptr_slots),
> +		.use_wildcard = false,
> +	};
> +
> +	if (likely(!READ_ONCE(*guard.slot))) {
> +		WRITE_ONCE(*guard.slot, ptr);
> +	} else {
> +		guard.use_wildcard = true;
> +		WRITE_ONCE(*guard.slot, SHAZPTR_WILDCARD);
> +	}
Is it correct to assume that shazptr cannot be used in a mixed context 
environment on the same CPU like a task context and an interrupt context 
trying to acquire it simultaneously because the current check isn't 
atomic with respect to that?
> +
> +	smp_mb(); /* Synchronize with smp_mb() at synchronize_shazptr(). */
> +
> +	return guard;
> +}
> +
> +static inline void shazptr_clear(struct shazptr_guard guard)
> +{
> +	/* Only clear the slot when the outermost guard is released */
> +	if (likely(!guard.use_wildcard))
> +		smp_store_release(guard.slot, NULL); /* Pair with ACQUIRE at synchronize_shazptr() */
> +}

Is it better to name it shazptr_release() to be conformant with our 
current locking convention?

Cheers,
Longman

