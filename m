Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9795314884F
	for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727369698; cv=none; b=JtZNZTb/10uzAo0gENjyGc9yGOXSFvbpHQmxdjz2pdD9fXcVATXGpk42ALOJZioogRK6fA8KjtH3SSTDMUhT3XpdFkX+KPmUUTDZ9yYauBbAygcobqnPWu8bqlQgQnuzIHLStPATne0OVZaWqiGkI7PlAuS/5WVsN7ZeePYqy1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727369698; c=relaxed/simple;
	bh=oYtKQy2mnfH6RR8gc/exy5qEImd9nCXyRPhlO+Cah6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgb22/2a6gyc6XS8hyTFIBAQ2gQvMx8TAjceeUef1uIY9Q8HLL96IIGrzLBKLoLXVueCtfvtPUG83FwE69n+9lZ5qvXDFyj4oW3cLq1H8+o2GqYa3gcJV2l3D/ozmPOnV7fqwwO9MJEKbWETsy4SUikK3r6V/uB2H0bndZ1Ter8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Hh/f1NsS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Hh/f1NsS"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so1525365e87.3
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727369694; x=1727974494; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8hoqDI+tC5eLbqfHqUDQ9CgvU+UFuqg7aCqYwQjuRVY=;
        b=Hh/f1NsSq9dMuG/q56RQOtBjTlkP6MnyJUnznU0F4azi+NfYMMRyr1Ds5TC+98JgeB
         yQxqRNm21jVn52JCJ0L0u2IeqzNfgIlJ2AuEvuUAt/UEVK2Ol9WHI6melfgbb+igKx3Z
         ejw48HZCIMfqBPFcB1khOLdA5Kpljfin7/HSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369694; x=1727974494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hoqDI+tC5eLbqfHqUDQ9CgvU+UFuqg7aCqYwQjuRVY=;
        b=IM0o7vHGSFQDeI8S+Lk8seH/bP+1jriApCaahUd1Qyf4E83FrVvPnQbVHdaqaxnXX1
         4+wUwgoKO9xUcabjOUwSYbRvFxendVVaEl/WwTFbB6xqmzBg6FS9ZW+cfR/6Skvc62Gm
         /ZRzaqwfPsdFHK2lEAdlZKXSsGCfJN3reij3yNZkb132l8eIfU8eDyJKf5eCLt9OW5Jf
         KWPHWrYC9yfr0JPl2vy7kl7KJ6OQoI6mxUT/nVXHjNcNPnu1Bvn2N8d4Y65O5uL5GdGk
         xjb3kKjQ9/++B6/JYKeedUPW/E+aDMGOO0sUQrNsRnyZtrHRv0CL1I3oFUswNN5VWTVR
         zpZA==
X-Forwarded-Encrypted: i=1; AJvYcCUcXh9ElrDJqQX/x1xBtndTgTeyEiBntAC9q38mHffMQIbqtrjvdSDAebS76+xNg2mYjhXE@lists.linux.dev
X-Gm-Message-State: AOJu0YzcWs44KfiVs4Y6R3tXPLhC40RvjMNqgPNLhpKeAU6V2SNZKoML
	RCHyG3Yj4ox8iWEjuF+kRr02vqUce37MWJBOUF8yd7M29mbjFR9TbzQwg3Ix48nGM+5oSc+xoDO
	OBAkl3g==
X-Google-Smtp-Source: AGHT+IGmdItlWH/f/mKv78SgGvmqfaMNopEmZlkPR9CIN6UUFN1FYogE6do5x9sfZ6uO3g6Kla8D8A==
X-Received: by 2002:a05:6512:280e:b0:533:43e2:6ac4 with SMTP id 2adb3069b0e04-5389fc81051mr186470e87.49.1727369694303;
        Thu, 26 Sep 2024 09:54:54 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a86sm17313366b.124.2024.09.26.09.54.51
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:54:52 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d24f98215so166575966b.1
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 09:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVhA8d/WvOfHzLXnOdC1DKm/g/1b+kPIZL65wnJuEmyS0tITTxOgR5O31EuK2V7Y9JsGqJ@lists.linux.dev
X-Received: by 2002:a17:907:7e8e:b0:a86:9d3d:edef with SMTP id
 a640c23a62f3a-a93c48e8c12mr13943566b.12.1727369690656; Thu, 26 Sep 2024
 09:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917143402.930114-1-boqun.feng@gmail.com> <20240917143402.930114-2-boqun.feng@gmail.com>
 <55975a55-302f-4c45-bfcc-192a8a1242e9@huaweicloud.com> <ZvPfmAp_2mDkI3ss@boqun-archlinux>
 <f5aeeeda-c725-422a-9481-4795bd3ade0f@huaweicloud.com> <ZvPp4taB9uu__oSQ@boqun-archlinux>
 <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com> <ZvP_H_R43bXpmkMS@boqun-archlinux>
 <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com> <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com> <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com> <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com>
In-Reply-To: <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2024 09:54:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
Message-ID: <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard pointers
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 09:40, Jonas Oberhauser
<jonas.oberhauser@huaweicloud.com> wrote:
>
> Boqun seems to be unhappy with a barrier though, because it would
> theoretically also forbid unrelated optimizations.

Well, doing a "barrier()" is kind of a big hammer thing, but honestly,
I don't think we've ever seen any real situation where it makes a
noticeable difference. Yes, it can pessimize compiler output more than
strictly necessary, but the kind of code generation issues it causes
tends to be the non-problematic kind (and particularly the kind that
even a trivial OoO core will deal with well).

We do have some more directed compiler barriers available, and this
code might be able to use OPTIMIZER_HIDE_VAR() for example. It's kind
of a "single variable value barrier".

Honestly, we don't use it much. It just tends to be _too_specific. But
it is there if somebody wants to use it.

> But I have not seen any evidence that there are any unrelated
> optimizations going on in the first place that would be forbidden by this.

Compared to something like "smp_mb()", which is not just a compiler
barrier but also generates typically very expensive instructions that
completely mess with an OoO core, a regular compiler barrier is a
complete non-issue. When you have those two close to each other, you'd
have to make up some very odd situation where the plain "barrier()" is
even noticeable.

               Linus
