Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6A13C9B8
	for <lkmm@lists.linux.dev>; Sat, 21 Sep 2024 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726952857; cv=none; b=tBvenwFLpiQjlK63eyy8cdiTO/WoiNo0nHMCA84+odowkJCMFAOhgXtnQn2GvJVLDKVBwGUXG80i7ELYK1w6uomZNSu67u+sx/oXqag42c06YxcYaxshI5Xt71Jm7uwnom9nJdux3jSFKyfJp0XgJiCiPYczrxMO0UVORX8BLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726952857; c=relaxed/simple;
	bh=lXi96evv14+QCYlApm0+UJoBiXFJ8NjukYfGt9BkWKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rxqcurucy3BlrussftHdqeikOLG+JmK0kmus64i+nZrMQD0MQVDiS0wE4duh08VRcAui1pf8gD0jhga2lfx1TM5xrjepBoHMsfugsa0VLyF/rACDHr7Rv4ybcfLUpNp4pHkyOQVu5LDx87qBVlOhlFuvzG4nzbw0BPsCd4gJ6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd9D4Zh6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd9D4Zh6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d88c0f8e79so2587004a91.3
        for <lkmm@lists.linux.dev>; Sat, 21 Sep 2024 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726952855; x=1727557655; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hp63dP1vIuDmvqlV49DXovWDm3PAu6Ul2JWTXyenPI4=;
        b=gd9D4Zh67eCR3N8mn1oNS2qzuPStfiN9V6T3DIFgRQYq3OLmikzSXYpBAYpKIYVq0z
         KYvOijDSa9wX/7l7qOmDiLDdAqk286R2G6b8OnigcKzDojhAyav1dJCwjlV3GCP4BA5D
         36LQR9qaJ5ZnlPWsrDK04uWTqfs3zVpL1v0N7U605/XwhA3Gyw+E8dQU9QuZVf+N/3jH
         PMXD8RvOuy1hKZLQCLNk7LxCJd16p64Fley/d7dFOL5OPH1Iye3v/Wt32+mINVn8+Sj6
         xGIDyrIOpWW0dQexukM7KRXibkwAwqYi4S0GXFYLRWrjsf98F3mXX7SM1xEwq9jOvdqD
         3XZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726952855; x=1727557655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hp63dP1vIuDmvqlV49DXovWDm3PAu6Ul2JWTXyenPI4=;
        b=MhsDeajnClC1j9BhBv9hZfIbOIV+PjeqICd+W2IzVE3WIxIZGN5GLNciwhdN16XKYT
         YxO7UtZBrY+JntuPy+F9cqSuVcg1alLyOdtiMYjU1DYgVlImS5C4hqCihCHueEhfu7o/
         e7oQ0Ml2sxd8RTU/hdXHrw6QgHFLHZcUB2VoANiUjhDTR+bNIuOFtlds/2mamfaemnDo
         xXTFwM4qNmDvSKFbNrJagwUowclewxo+gYnBuM3wltEitKfcaitGbvYWnvq5kG1+MQdP
         xpnSVPlv1NpN369fGpkVLHBe/A1atcSXdtkOZ4VWOPtpZZkQi7rWUonos0oGjgEpYfwI
         bLHA==
X-Forwarded-Encrypted: i=1; AJvYcCUxO5ztEjZ4IlNH1+IHlCIWO6p3P2ncV9t6Eot11uILmCp9C6MoFiaxYNeiGZjYt0skvZjY@lists.linux.dev
X-Gm-Message-State: AOJu0YyE5jyjGFKYh7x9KwnY42nqk+0W5OZJccrmMXRyv6K4rPq+zc1f
	9rTdEaXMFobIym641o+/hofTGDQ+YXuAvdcUuu+kSvYt1kDVOO4kLGbFUkgFloBdRjjaGX7hXnd
	RV7Uz0RH3UG5mC7I7YMVM4lOfs94=
X-Google-Smtp-Source: AGHT+IFPDomxth+vXXT4e8DSQaPpBIrEW3tjeUXSZGZ0lRBYZWDifbwG+csE5HvRoTEna3+xfdCTpG/AjzzHz8zXHdw=
X-Received: by 2002:a17:90b:a4a:b0:2d2:453:12cb with SMTP id
 98e67ed59e1d1-2dd80c02ad9mr10560062a91.2.1726952855430; Sat, 21 Sep 2024
 14:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Sun, 22 Sep 2024 05:07:23 +0800
Message-ID: <CAJhGHyBOwwBhCW96MyFGPVWed2ko37mLeHzta2BzL6T-TzUnmg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> +/*
> + * hpref_hp_get: Obtain a reference to a stable object, protected either
> + *               by hazard pointer (fast-path) or using reference
> + *               counter as fall-back.
> + */
> +static inline
> +bool hpref_hp_get(struct hpref_node **node_p, struct hpref_ctx *ctx)
> +{
> +       int cpu = rseq_current_cpu_raw();
> +       struct hpref_percpu_slots *cpu_slots = rseq_percpu_ptr(hpref_percpu_slots, cpu);
> +       struct hpref_slot *slot = &cpu_slots->slots[cpu_slots->current_slot];
> +       bool use_refcount = false;
> +       struct hpref_node *node, *node2;
> +       unsigned int next_slot;
> +
> +retry:
> +       node = uatomic_load(node_p, CMM_RELAXED);
> +       if (!node)
> +               return false;
> +       /* Use rseq to try setting current slot hp. Store B. */
> +       if (rseq_load_cbne_store__ptr(RSEQ_MO_RELAXED, RSEQ_PERCPU_CPU_ID,
> +                               (intptr_t *) &slot->node, (intptr_t) NULL,
> +                               (intptr_t) node, cpu)) {
> +               slot = &cpu_slots->slots[HPREF_EMERGENCY_SLOT];

Can @cpu be possibly changed? if it can, it seems @cpu and @cpu_slots
should be updated first.

> +               use_refcount = true;
> +               /*
> +                * This may busy-wait for another reader using the
> +                * emergency slot to transition to refcount.
> +                */
> +               caa_cpu_relax();
> +               goto retry;
> +       }
