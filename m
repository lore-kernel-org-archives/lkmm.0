Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73E1C242F
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727465819; cv=none; b=a4I2Eb0EKEPXpe4bVl3KIcWOvCI6+wFaMiATOpRD2QC4/q0j0kFpXUj5/Rjhjz98IxOrxjv3STVQSzdlsBG4Mp4CmU0YPDhBQS4EpZw2UjzZBJYklS1uyyCNJ8RREy9jGKCdEM7TUdp7N794ymBm+564wy1uHBhhBSVk/4b1zuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727465819; c=relaxed/simple;
	bh=kqt5Jntn1aPjnEibEghCyVBj7mxRi2cdnuwUrSdPgVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nr17oo7cAqZQC7QT36V94y1C78P23lENgoGjYvR9GySqhtbw0pQiRA/MkVXGmM/jTdT6xpzEjFZ1Jm3vrwN/B5FFepj31SZL0hpVjhkAfi9SeNnj4UOPFgPvKiLPy9pzbniJCVGiE6az5cp08D2eexNFtC093KBnJi01RjORSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RWfhy6yI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RWfhy6yI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so350086866b.0
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727465816; x=1728070616; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4BYeztFGhrhYHEtsZ/kMOwsZ9Tbjy1c0Mm3O/TMTIo=;
        b=RWfhy6yIIUGjGvux4V7NBMRl7H2PznyxhQZzfTFjwDHGsxTF1fZZcP22zEVuALjtk5
         8d9PRKGMwSkesHUrW7w6ohekcMXb8yFCqvXKljj+noL9GDpVrcuu3LXSVuk7Hlz7uYeH
         yhUUevIOCeVNtFdG5ANMqv3oRJq/c5FzKG1TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727465816; x=1728070616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4BYeztFGhrhYHEtsZ/kMOwsZ9Tbjy1c0Mm3O/TMTIo=;
        b=HjAoc5cleHrkSnTxA3jPwa3PRkiKVtnvuh+l8lucoqyo5kMEQVW2rj02xemyRD1rIe
         Ld6enz4/y/2c/2HzpllvGnakYWkIOyiCkokqEUIuN+fvmlDKMCBnV/pfI4/a+LxcC84h
         wRskb+mzAQ7+1mV98XOg/jGtpkkZiqwqfeZ9F3QulS0LmG9+waGcFmFvVuJMZlczU/D2
         0B+ld52bKlNuvFxo7E1u50YjxV4cPASqjzaQdQQT3lW8u/d/W7zoLjTcZalY/Z4Ha1B8
         nsA7lqhuCxERd1OFH+7RVnOtQdL/l3mvXuqS0q+x7ulMwuE4ZhfB2PRLHjyw+9DqE9/0
         0Dnw==
X-Forwarded-Encrypted: i=1; AJvYcCWcWMHWAAChDgE6qyNcXQIf9vnkFRY3U9gAXoLclhpfU9K0DBq8TZNwK/lHJWb8u4y3r5GT@lists.linux.dev
X-Gm-Message-State: AOJu0YyOuhqxNYqAm/ynksUwCJY44OzfOdCLgutF/GbqTKcEAKH7ow1R
	Gv+2auU2kqRnYLtEa+4PdTLuIIyc9M5vdmwUJh7GLtjC6Hi4fp3Uz1N5dEx6AeMwRIKW6+F+ys9
	2bR5GNg==
X-Google-Smtp-Source: AGHT+IGga0sjUiBTL9eBD1gy4SvNdcbJbYFTzUVZWlkTPYVCyKH1VF/TZYF0ddi1ctvUImNe4MngaA==
X-Received: by 2002:a17:907:a08:b0:a8d:3e67:19fe with SMTP id a640c23a62f3a-a93c4a6996emr406474466b.41.1727465816058;
        Fri, 27 Sep 2024 12:36:56 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bd26sm165507166b.164.2024.09.27.12.36.55
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 12:36:55 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso21569885e9.0
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 12:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkc6yzyrNMy9ffCRZVL5I66ETlGffbRLfEudxOrmVkl5/Ln3ylwwF2QxfbJga5761Pf4NH@lists.linux.dev
X-Received: by 2002:a17:907:36c5:b0:a86:7514:e649 with SMTP id
 a640c23a62f3a-a93c4a69d42mr423065966b.52.1727465337418; Fri, 27 Sep 2024
 12:28:57 -0700 (PDT)
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
 <1b04e35c-8994-48d9-907a-966bb4dfabaf@huaweicloud.com>
In-Reply-To: <1b04e35c-8994-48d9-907a-966bb4dfabaf@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2024 12:28:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgi9vqh6qUpPKSydfdqd3210MnekZ1VxB6aAmfqz2bFpw@mail.gmail.com>
Message-ID: <CAHk-=wgi9vqh6qUpPKSydfdqd3210MnekZ1VxB6aAmfqz2bFpw@mail.gmail.com>
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

On Fri, 27 Sept 2024 at 12:12, Jonas Oberhauser
<jonas.oberhauser@huaweicloud.com> wrote:
>
> I think it depends on which one you hide.

No.

Dammit, people, read the code I posted.

> But for
>
>   z = a;
>   hide(z);
>   if (z==b) { *b; }

No.

I *intentionally* made it an inline function, and only hid the
arguments to the equality comparison.

So the "hide(z)" hides the argument to the inline function - NOT THE ORIGINAL.

> then it would still know that b == z, and could replace *b with *z
> (which really is *a).

No.

The hiding is literally *ONLY* for the comparison. It's inside the
helper function. It doesn't affect the originals at all.

Which means that the compiler CANNOT KNOW anything about the original
pointers when it compares for equality (or inequality).

Basically, the comparison is now a black box to the compiler, and the
compiler cannot use the result of the comparison to make ANY judgment
on whether the two original pointers were related or not.

               Linus
