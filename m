Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00D13C836
	for <lkmm@lists.linux.dev>; Sat,  5 Oct 2024 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728147733; cv=none; b=jJzr16ndawEpIvt5folk66iyoQHGY+0eiCCDre4lrRuzTfgM41WcBXY0Le50mS1fk4cf9tBuvVy5o8YNlOsdgRJd64aWFPISjOSA4KkeL1VrBG92b69HjvPIfGubEkNkAhl0eTF/IqQciI0mz15cN4yi2sy4jp3RrNxsBtIOS/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728147733; c=relaxed/simple;
	bh=npbBU4EB/OXQqg6L/gxKG9dBNz36EJLnuqdFFqttzZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnB5J/hudRGDVmlmlQl1rImY2vUCih/aJ97eiSH96UVWCEAsj1QILvVe6icKl6jzV8zfJas96x5S3Uz0OxZtgGsRvVVS6dl3aKxsY34jcsmmBAP5HXPtW4ID6NBCEh8+qWnawer6/9BRunl8GsMZp8YZSCqeuWRA7F7X2vgrDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hFtHlmri; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hFtHlmri"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53988c54ec8so3612417e87.0
        for <lkmm@lists.linux.dev>; Sat, 05 Oct 2024 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728147729; x=1728752529; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhvgt4CNXD6VdyhO1ydmmdT8s9FGMYClv5PenKYrbxg=;
        b=hFtHlmrirNVmCa9MlgtTP6dg6SWuMC5qPjazUNrEkTfMMI90Gtkl7cd6BH9xVdQhNw
         vIeE8h8tKNBWs2n/GyL0u9KfQvA0xrYsHfX14s99uIZz2XExQjXFsNZY61wlisOTq+hs
         Oby7u8C487Tmq/f9KFE7gcUjkI65YTkXlhbj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728147729; x=1728752529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhvgt4CNXD6VdyhO1ydmmdT8s9FGMYClv5PenKYrbxg=;
        b=hjb8P5I6BbHIKFKrueldwbh2nvLQyxxZNGBBR6XfTGFssoN0hqnkg/8fWktJ738Ayo
         g224rochc7RSDici7C5TgnT5Cxcn8L4eqrCHHa9PFlK0fqQ6Hq2Jt2sPdDW7t7gtmGbd
         9xqFE/RtfNzWBhofkLv8PymFbpSquMDEnPjMxC8aMt1+CCFtbKaPPKOrJ6rekHz1k2Bj
         GzzckhnilFWeeRStZ/nnRqCHE1qVM9l4rwfDxYZ7glSE9aC7Qq8ys/tiNzwf+2x7rTLV
         sqWOYRUfa7a7Ticw5JUwb4XJRZx5JL6wiL8gVuzVEph72yhshnb0ZuGdWfaO6jFGCcCP
         nu0A==
X-Forwarded-Encrypted: i=1; AJvYcCV8TjMwOE28LXQIIoes2TEZqMKAr1GiaR4suq/jDD4WHrfp800WHARDbO2g9yzafRuSFo6S@lists.linux.dev
X-Gm-Message-State: AOJu0YxXbDI+2Tobf4GwLFCPFRkt7MmDQlQXI/n5fmZDq10GB+i6kK25
	LCduZhke/fmG4344j36Ni3tVxAzQU4XNTlKib/FgphrWGXRwiMZieHj5uPDNuqGT9SxzWFKnFPM
	5+Eeu2w==
X-Google-Smtp-Source: AGHT+IESoAZt0t17cE0QtpAcHQUmJ8KHg5Y2kBs40eL6PSfxPks6FD3rcbmSIDrxcpi0HHzOWgd09w==
X-Received: by 2002:a05:6512:3b8e:b0:537:a855:7d6f with SMTP id 2adb3069b0e04-539ab891f52mr3663741e87.34.1728147728846;
        Sat, 05 Oct 2024 10:02:08 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec84ecsm266908e87.97.2024.10.05.10.02.06
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 10:02:07 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac187eef2so37767351fa.3
        for <lkmm@lists.linux.dev>; Sat, 05 Oct 2024 10:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnnfvRcnK952nGydKdIfFJlyDgNc6pdOH3KMUoP325cVox+E+2Q+RZrFoMj0laf6pIylk2@lists.linux.dev
X-Received: by 2002:a17:907:3e05:b0:a93:d5d3:be4 with SMTP id
 a640c23a62f3a-a991bd16c3fmr599542466b.13.1728147401876; Sat, 05 Oct 2024
 09:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002010205.1341915-1-mathieu.desnoyers@efficios.com>
 <CAHk-=wgztWbA4z85xKob4eS9P=Nt5h4j=HnN+Pc90expskiCRA@mail.gmail.com> <20241005161537.GB18071@noisy.programming.kicks-ass.net>
In-Reply-To: <20241005161537.GB18071@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 09:56:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvxq3378vOn++=ZiOQc9=4N-3ejUWr+dXEJ5ti43kT6w@mail.gmail.com>
Message-ID: <CAHk-=whvxq3378vOn++=ZiOQc9=4N-3ejUWr+dXEJ5ti43kT6w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] sched+mm: Track lazy active mm existence with
 hazard pointers
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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

On Sat, 5 Oct 2024 at 09:16, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 02, 2024 at 10:39:15AM -0700, Linus Torvalds wrote:
> > So I think the real issue is that "active_mm" is an old hack from a
> > bygone era when we didn't have the (much more involved) full TLB
> > tracking.
>
> I still seem to have these patches that neither Andy nor I ever managed
> to find time to finish:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/lazy

Yes, that looks very much like what I had in mind.

In fact, it looks a lot smaller and simpler than what my mental model was.

I was thinking I'd do it by removing "active_mm" entirely from 'struct
task_struct', and turn it into a per-cpu variable instead, and then
try to massage that into some global new world order. That patch
series you point to seems to be much simpler and clearer.

Of course, you also say "never managed to finish", so presumably
there's something completely broken in that series, and it doesn't
actually work?

                   Linus
