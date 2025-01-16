Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4A11A8F79
	for <lkmm@lists.linux.dev>; Thu, 16 Jan 2025 23:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737068545; cv=none; b=bqBz1Qr320PL3E2shfSDet6U2C+YMIprKmEF/LXHj0N69VwjUvdSZ3bNvc7Xx4CvwJ8+0DMPYtXJoi/XmOw+/J/7mCeo3bzbLsl8zYWIUD4ouRbvES4TwAwB2z8SOm/gDzlUYS9HkqmYFzZdgFm93aX+K7DWegsfOUw2DRyy8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737068545; c=relaxed/simple;
	bh=3/wATh0f8JjnPmGUw1S2OUYR792Z4ImEYMRE/SF+PCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzO5IX6xoEcF5Nl6uPfW0D7kStIjtkfOVXbey1gGSQcorEbOhCTyajzFRzCU1c4IhQ1WXPnO4P1ZT2rM17yAIw2SGiqQoux86bDs6OGJvpwQer6d+DA+/FKWhL0Hdt9/0BfT7h8yDgM3BI4qCxHUrMkJsDgfYx9adn2yVGwCNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RT6ajztw; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RT6ajztw"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ddcff5a823so13797716d6.0
        for <lkmm@lists.linux.dev>; Thu, 16 Jan 2025 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737068542; x=1737673342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPtN5YCpTGgyKTHJC6P+luqlrUohAKwuhvC0egbSZv0=;
        b=RT6ajztw+VlPRrejXejoaUfQt3jehaL2thDb+VPBOEpFMrteRvoXBsFo22yvAoefFX
         hGuzRX5NMI4gL6UVjQP6ZhGoiqzdFd7ys/ntOWz8zqJJ1GI++pKlcMyl+qhLAj0HiqZN
         xrKSXhzSMSkhwJZeN7YSZqZVw+20Mz3aHg7rcHs+L/oy7ArZQY97OV8BUg+QhdjEWNmR
         v2B5LwQXHL2cQgYLRQjFmEWCPCiWHLCarvysSTL/0vQDJoNcrUOz8xiy2UMHXey8oUH2
         nQmE5u/99R4OViJRocaiWFSuMbbYeE29JVxBBdPesvIPsKumvbGhyZfz++FXc2vk/Ltz
         jj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737068542; x=1737673342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPtN5YCpTGgyKTHJC6P+luqlrUohAKwuhvC0egbSZv0=;
        b=nz+3CM82KnW8m8PPSR3Zd3HxUbV1ki5DYzkxqvRV+janujTKUp3RRYelyT8OlxZfzc
         nRBxWNK4yr3voYX+6cr7V6gKIxGWcl3nwlfkyntNFGRQwh3r0EP00HCSU+xq9BA+SX5j
         4rlWyHUQ7ghf3v7BOSy+FMU8YF++LPf4GF/5zxW41HDUP+Y4S985UInUWNIhvzsqH4kc
         ZXBrqb26PQp8Iti05gA30wbUjeOhpYKcgbubg/Q+kp+Q/+mlQageqvhG3DVa0WIQUar1
         /MwgP05ZOsO8aVU9gsTUpXattjoZsVCOCd/fdiohh96+PF6F9LDC1np4S9qVU1PGPRa8
         GFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUi/aYbSEjcVNBXwD62C+byzaSR+Tz2z8PmoM3JCuMJRpR3hJr0OIc46VEcMqxXFa+g6Xh7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo7PVKcxAwmm26pY1SA6f/tp8LFKtYf0EasycTIaQgRJZoEqQH
	RCgULS1430W47QHVqQoaJd7havIeEQKz7q09IKIuKsZdiXDeGsWZvuMWg425dQ==
X-Gm-Gg: ASbGncvkbUuDSZnIX2cUWjlsrN/xw+lvnPB2QMp2Qm2A/ZAf2IudRV0uarWEU8bsnEw
	LDow6OfktZuPhvY03U7Flc2IL/M00THn0N/87CfA5WYryefpdQeLZcmRjJD7rD23HuMmWQtbNmr
	SmYuWx7mEp87YpiXknBpKg8kDJ+yKNbXwPmx8d90UZOsEo5EHSD3FvV/+wb4SB25wp5SayvbOLh
	l+IIzLQ1pIVxKpX6P288+/L5jKedXzu5+1Ep1S/LSnymkWtj/D6SusNiw==
X-Google-Smtp-Source: AGHT+IGZ++V7sc0bFG9s614g2OtoEML+yUwn1xGTlG2kvc2KM8ON89npnWE+eZ4NgfvbO7v+r4SfoQ==
X-Received: by 2002:a05:6214:1c8a:b0:6d8:890c:1f08 with SMTP id 6a1803df08f44-6e1b21ba554mr10543816d6.26.1737068542208;
        Thu, 16 Jan 2025 15:02:22 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5bb3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc0f7c3sm5243276d6.28.2025.01.16.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:02:21 -0800 (PST)
Date: Thu, 16 Jan 2025 18:02:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
References: <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>

On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
> I'm well aware that an absolute definition of semantic dependencies is not
> easy to give.

In fact it's undecidable.  No tool is ever going to be able to detect 
semantic dependencies perfectly.

> Btw, I'm re-reading that paper and here are some comments:
> - I agree with the conclusion that C++ should not try to solve OOTA other
> than declaring that they do not exist
> - the definition of OOTA as sdep | rfe is not the right one. You really need
> sdep ; rfe, because you can have multiple subsequent sdep links that
> together are not a dependency, e.g.,
> 
> int * x[] = { &a, &a };
> int i = b;
> *x[i] = 1;
> 
> here the semantic address dependency from loading b to loading x[i] and the
> semantic address dependency from loading x[i] and storing to *x[i] do not
> together form a semantic dependency anymore, because *x[i] is always a. So
> this whole code can just become a=1, and with mirrored code you can get
> a=b=1, which is an sdep | rfe cycle.

We regard sdep as extending from loads (or sets of loads) to stores.  
(Perhaps the paper doesn't state this explicitly -- it should.)  So an 
sdep ; sdep sequence is not possible.

Nevertheless, it's arguable that in your example there is no semantic 
dependency from the load of b to the load of x[i].  Given the code 
shown, a compiler could replace the load of x[i] with the constant value 
&a, yielding simply *(&a) = 1.

There are other examples which do make the point, however.  For example:

int a = 1, b = 1, c = 2;
int *x[] = {&a, &b, &c};

int r1 = i;
if (r1 > 1)
	r1 = 1;
int *r2 = x[r1];
int r3 = *r2;
q = r3;

Here there is a semantic dependency (if you accept dependencies to 
loads) from the load of i to the load of x[r1] and from the load of *r2 
to the store to q.  But overall the value stored to q is always 1, so it 
doesn't depend on the load from i.

> - I did not like the phrasing that a dependency is a function of one
> execution, especially in contrast to source code. For a fixed execution,
> there are no dependencies because all values are fixed. It is the other
> executions - where you could have read another value - that create the
> dependencies.
> 
> Perhaps it is better to say that it is not a *local* function of source
> code, i.e., just because the same source code has a dependency in context C
> does not mean that it has a dependency in context C'.

Of course, what we meant is that whether or not there is a semantic 
dependency depends on both the source code and the execution.

> In fact I would say a major gotcha of dependencies is that they are not a
> function of even the set of all permissible (according to the standard)
> executions.
> That is because the compiler does not have to make every permissible
> execution possible, only at least one.

The paper includes examples of this, I believe.

> If the compiler knows that among all executions that it actually makes
> possible, some value is always 0 - even if there is a permissible execution
> in which it is not 0 - it can still replace that value with 0. E.g.
> 
>   T1 { x = 1; x = 0; }
>   T2 { T[x] = 1; }
> 
>    ~~ merge -- makes executions where T[x] reads x==1 impossible ~>
> 
>   T1' { x = 1; x = 0; T[x] = 1; }
> 
>    ~~ replace ~>
> 
>   T1' { x = 1; x = 0; T[0] = 1; // no more dependency :( }
> 
> which defeats any semantic dependency definition that is a function of a
> single execution.

Our wording could be improved.  We simply want to make the point that 
the same source code may have a semantic dependency in one execution but 
not in another.  I guess we should avoid calling it a "function" of the 
execution, to avoid implying that the execution alone is what matters.

> Of course you avoid this by making it really a function of the compiler +
> program *and* the execution, and looking at all the other possible (not just
> permissible) executions.
> 
> - On the one hand, that definition makes a lot of sense. On the other hand,
> at least without the atomics=volatile restriction it would have the downside
> that a compiler which generates just a single execution for your program can
> say that there are no dependencies whatsoever and generate all kinds of "out
> of thin air" behaviors.

That is so.  But a compiler which examines only a single thread at a 
time cannot afford to generate just a single execution, because it 
cannot know what values the loads will obtain when the full program 
runs.

> I am not sure if that gets really resolved by the volatile restrictions you
> put, but either way those seem far stronger than what one would want.

It does get resolved, because treating atomics as volatile also means 
that the compiler cannot afford to generate just a single execution.  
Again, because it cannot know what values the loads will obtain at 
runtime, since volatile loads can yield any value in a non-benign 
environment.

> I would say that the approach with volatile is overzealous because it tries
> to create a "local" order solution to the problem that only requires a
> "global" ordering solution. Since not every semantic dependency needs to
> provide order in C++ -- only the cycle of dependencies -- it is totally ok
> to add too many semantic dependency edges to a program, even those that are
> not going to be exactly maintained by every compiler, as long as we can
> ensure that globally, no dependency cycle occurs.

But then how would you characterize semantic dependencies, if you want 
to allow the definition to include some dependencies that aren't 
semantic but not so many that you ever create a cycle?  This sounds like 
an even worse problem than we started with!

> So for example, if we merge  x = y || y = x,  the merge can turn it into
> x=y=x or y=x=y (and then into an empty program), but not into a cyclic
> dependency. So even though one side of the dependency may be violated, for
> sake of OOTA, we could still label both sides as dependent.

They _are_ both semantically dependent (in the original parallel 
version, I mean).  I don't see what merging has to do with it.

> For LKMM the problem is of course much easier because you have volatiles and
> compiler barriers. Again you could maybe add incorrect semantic dependencies
> between accesses, as long as only the really preserved ones will imply
> ordering.

I'm not particularly concerned about OOTA or semantic dependencies in 
LKMM.

> So I'm not convinced that for either of the two cases you need to do a
> compiler-specific definition of dependencies.

For the C++ case, I cannot think of any other way to approach the 
problem.  Nor do I see anything wrong with a compiler-specific 
definition, given how nebulous the whole idea is in the first place.

> BTW, for what it's worth, Dat3M in a sense uses the clang dependencies - it
> first allows the compiler to do its optimizations, and then verifies the
> llvm-ir (with a more hardware-like dependency definition).

What do you mean by "verifies"?  What property of the llvm-ir does it 
verify?

> I think something like that can be a good practical solution with fewer
> problems than other attempts to approximate the solution.

I do not like the idea of tying the definition of OOTA (which needs to 
apply to every implementation) to a particular clang compiler.

Alan
