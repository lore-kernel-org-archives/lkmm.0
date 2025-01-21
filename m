Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400831741D2
	for <lkmm@lists.linux.dev>; Tue, 21 Jan 2025 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737477547; cv=none; b=bwAY+ghnxNICY66K0J7DKG3oOUyLfBTAr+a7kVdkeB3R77HUxtlAZWjwK7WNkThyT0mgEua1CQg888tqQgOxjLbHfdiNd1eh7lckhawyAPxBLROHd9lQ4qjLzomQ99Gjbhyqi8k6tSv4Y3b/rr4X/YOSHXt2RpJVHuuQsAC521w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737477547; c=relaxed/simple;
	bh=fX8iDiYDht4MmL42iayLzKm8zcRhoIiJFQeCWy0RtMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS2mhr3+sNXKWkCDcEFjw591rI2hsQML6BZo8hjr3PrMY5ruzrp0fkL50Gn3SIgDojweMgR6WueMltE+u7k1TIo5wqbQuOfP5wgJnGX2OcVUjzGPqEkbwevmiCZ1Ye+iW3EYYlFMAkitW1pkrO6nVJ5tLdcfM+kpuUSG/FP7HFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E4gaGF/L; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E4gaGF/L"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d89a727a19so65697446d6.0
        for <lkmm@lists.linux.dev>; Tue, 21 Jan 2025 08:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737477544; x=1738082344; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EQsPKIYuyp+5QyfmxlUeFNpBw+WV+a/8F6P37HrdOXU=;
        b=E4gaGF/LsYcL/H+SmBj5Iej0rfzD0rbTa3UxY29P9n5JNMWC5XJILwFQlLULDtSDSU
         gCcVVBuiuf/Ny3EJyh1slY0ML5kdA6SKB1x1XVfe+1eta5UlMliy9zW3gftS7i6DcSJF
         lLcVz0HGA3Ugq05o6YXkw5RkHOmhk31wvS4DonoB/vLuR4ylMt+Tto1HdW/Voi614PLK
         4nJPBQkU8uJaLkKH0VzSNlighoKa+GB+oOp4h+h+5bUB82FNPn8fKial05edNRFofUZc
         HugPlGaRSFs/Kg9buCrQKzlWpF+wnkNUBNsU9LV18Jaq/qNsB202KeU3RdUH9t2YaYON
         ZgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737477544; x=1738082344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQsPKIYuyp+5QyfmxlUeFNpBw+WV+a/8F6P37HrdOXU=;
        b=ERsAd6+UVPsfyD01ru0yrX+Lyvn1K5akYFf8+uAONwxWQ3QaJ9si+fusQDThEbg6R/
         eUKzAZ6z/ttNHLqqd/xehpGg1FzTs7nPF8RHttBB2VPbkk4A7VLfQ9Vz1zwZsEgr4UZl
         z74CEXT+SGLTrCYrCBWqUXR/SurMKWVvbpjppkBFWDirq1nOSiiKd59k0YZSx2MTGUae
         xYnBn07r67nukk2WX8IWLBHKXb+jrBz5/szmjspqIoa6a683Af3wCj+QHKZ4jj2xAILR
         hi3d4FLxq8FSAByoMtSRr2QQ7mAViTpSgRF2KddY/XjtH/9NzDYDMl3fmFleSoxG4z9i
         zhpA==
X-Forwarded-Encrypted: i=1; AJvYcCUPxedZpFdsk069fbvHbf3lH751QjXUsE5rMbYccecp5+nQKIX0xReIS1UOdrOpfIu/DYY9@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw5+BecDBT7EqirTisAyq9cqEFLbTnOkN5gzU/ZAVdlXd9kCOU
	kyjVKa6gq0cpbjy6qmDoUxjRMMz0V4cFi4AwQVwdW8Eo1IPp+/xXlBu3LZFJhQ==
X-Gm-Gg: ASbGncugNOdmg4nlHZzEYNqfEFNZhZoEXiTIKLHPsRk8V3VU01jSMMXK0Kp/hyaQxec
	1dbVilKGTjw4TPJwBd5PZuWiMXG4ngPZ617jXjz6/egSkXfDy9fMor97PYL3h0wPf3qJqLakq6U
	ghWY6o/zVa6S28dbjMHlGVHer7L1qAZ/zT5X046zr7dmISDtdOXTjPIT23qdxmL+3gaeFHjB0ca
	Kd+ZX4iVLNtarrT9cGBrcg2CJbViMzgMT0Cz70gFt1kxBJUdQmcS7burfxH7w2wspFbHPCg+jdp
	nbeHzoLwG90PH/5qvz50SzbHbdUsKWj9XiwQfJmQV1wAMbRG7lgN/pM2VKmvh7s=
X-Google-Smtp-Source: AGHT+IFcqjWT/4umluLHZaIdwWsQXhKer8er+w7s4QCMbJzHGMH3SMfJGTPr//fBbsWZQSl09oeNtQ==
X-Received: by 2002:a05:6214:2dc1:b0:6dd:d24:3075 with SMTP id 6a1803df08f44-6e192c3dab3mr344093386d6.17.1737477543933;
        Tue, 21 Jan 2025 08:39:03 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afbf38a9sm52945916d6.22.2025.01.21.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 08:39:03 -0800 (PST)
Date: Tue, 21 Jan 2025 11:39:00 -0500
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
Message-ID: <df9de992-fd3d-432b-9758-9fe35cc9b0c4@rowland.harvard.edu>
References: <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
 <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
 <2139f8ce-63fa-4231-864b-500ee2645811@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2139f8ce-63fa-4231-864b-500ee2645811@huaweicloud.com>

On Tue, Jan 21, 2025 at 11:36:01AM +0100, Jonas Oberhauser wrote:
> > What makes you think this "more appropriate" definition of semantic
> > dependency will be any easier to detect than the original one?
> 
> For starters, as you mentioned, the compiler has to assume any value is
> possible.
> 
> Which means that if any other value would lead to a "different behavior",
> you know you have a semantic dependency. You can detect this in a per-thread
> manner, independently of the compiler.

How?  The question is not as simple as it sounds.  What counts as 
"different behavior"?  What if some loads take place with the other 
value that didn't take place with the original value?  What if 
completely different code ends up executing but it stores the same 
values as before?

> Without the assumption of volatile, even a different value that could
> actually be generated in another run of the same program does not prove a
> semantic dependency.

So then how do you tell whether there is a semantic dependency?

> > > Yes. Actually I wonder if you put this "all loads are volatile" restriction,
> > > can a globally analysing compiler still have any optimizations that a
> > > locally analysing compiler can not?
> > 
> > Yes, although whether they are pertinent is open to question.  For
> > example, a globally optimizing compiler may observe that no thread ever
> > reads the value of a particular shared variable and then eliminate that
> > variable.
> 
> Oh, I meant the "all atomic objects is volatile" restriction, not just the
> loads. In that case, all stores the object - even if never read - still need
> to be generated.
> 
> Are there still any optimizations?

Perhaps not any that affect shared variable accesses.  In a way, that 
was the intention.

> Well, I certainly have not put as much deep thought into it as you have, so
> it is certainly more fragile. But my current thoughts are along these lines:
> 
> We consider inter-thread semantic dependencies (isdep) based on the set of
> allowed executions + thread local optimizations + what would be allowed to
> happen if rfe edges along the dependencies become rfi edges due to merging.
> So the definition is not compiler-specific.

How do you know what thread-local optimizations may be applied?  
Different compilers use different ones, and new ones are constantly 
being invented.

Why not consider global optimizations?  Yes, they are the same as 
thread-local optimizations if all the threads have been merged into one, 
but what if they haven't been merged?

For that matter, why bring thread merging into the discussion?

> Those provide order at machine level unless the compiler restricts the set
> of executions through its choices, especially cross-thread optimizations,
> and then uses the restricted set of executions (i.e., possible input range)
> to optimize the execution further.
> I haven't thought deeply about all the different optimizations that are
> possible there.
> 
> For an example of how it may not provide order, if we have accesses related
> by isdep;rfe;isdep, then the compiler could merge all the involved threads
> into one, and the accesses could no longer have any dependency.
> 
> So it is important that one can not forbid isdep;rf cycles, the axiom would
> be that isdep;rf is irreflexive.
> 
> 
> When merging threads, if in an OOTA execution there is an inter-thread
> semantic dependency from r in one of the merged threads to w in one of the
> merged threads, such that r reads from a non-merged thread and w is read by
> a non-merged thread in the OOTA cycle, then it is still an inter-thread
> dependency which still preserves the order. This prevents the full cycle
> even if it some other sub-edges within the merged threads are now no longer
> dependencies.
> 
> But if r is reading from w in the OOTA cycle, then the compiler (which is
> not allowed to look for the cycle) has to put r before w in the merged po,
> preventing r from reading w. (it can also omit r by giving it a value that
> it could legally read in this po, but it still can't get its value from w
> this way).
> 
> E.g.,
> P0 {
>   y = x;
> }
> P1 {
>   z = y;
> }
> ... (some way to assign x dependent on z)
> 
> would have an inter-thread dependency from the load of x to the store to z.
> If P0 and P1 are merged, and there are no other accesses to y, then the
> intra-thread dependency from loading x to store to y etc. are eliminated,
> but the inter-thread dependency from x to z remains.

> > I don't understand.
> 
> Does the explanation above help?

No.  I don't want to think about thread merging, and at first glance it 
looks like you don't want to think about anything else.

> > > > I do not like the idea of tying the definition of OOTA (which needs to
> > > > apply to every implementation) to a particular clang compiler.
> > > 
> > > But that is what you have done, no? Whether something is an sdep depends on
> > > the compiler, so compiler A could generate an execution that is OOTA in the
> > > sdep definition of compiler B.
> > 
> > Yes, but this does not tie the definition to _one particular_ compiler.
> > That is, we don't say "This dependency is semantic because of the way
> > GCC 14.2.1 handles it."  Rather, we define for each compiler whether a
> > dependency is semantic for _that_ compiler.
> 
> Yes, but the result is still that every compiler has its own memory model
> (at least at the point of which graphs are being ruled out as OOTA). So
> there is no definition of 'G is OOTA', only 'G is OOTA on compiler x'.

Our definition of OOTA and semantic dependency does not apply to graphs; 
it applies to particular hardware executions (together with the abstract 
executions that they realize).

Besides, it is still possible to use our definition to talk about 
semantic dependency in a compiler-independent way.  Namely, if a 
dependency is semantic relative to _every_ compiler then we can say it 
is absolutely semantic.

> The example I gave of the tool verifying the program relative to one
> specific compiler is also not giving a definition of 'G is OOTA', in fact,
> it does not specify OOTA at all; it simply says ``with compiler x, we get
> the following "semantic dependencies" and the following graphs...''
> 
> And as long as compiler x does not generate OOTA, there will be no OOTA
> graphs among those.
> 
> So it does not solve or tackle the theoretical problem in any way, and can
> not do cross-compiler verification. But it will already apply the
> 'naive-dependency-breaking optimizations' that you would not see in e.g.
> herd7.

Okay, fine.  But we're trying to come up with general characterizations, 
and it appears that you're doing something quite different.

Alan
