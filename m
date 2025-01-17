Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C37185B72
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737144085; cv=none; b=NMl+8ncbD27p35P9wLTX8b4k0lC+HDI/LA8FYYletMKU1JBMFJG6NzzYSqDOl00c8Z8kFF6vpK7S3m+URRvfiYJ9TXZsFkQxSPadN+MxWIDFkC546fChqbOmzaEqOhML55RIPfJXs7h21CFxC+YpjeSOo9QNHMuR3yBrQWf3JrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737144085; c=relaxed/simple;
	bh=oXN1fd9n5hi5QvPPOcHBnduQ77JbOJu1RtYI9i0iLH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCAY4L2Ur5ycg09N+UjxZ+jVIwFSAmLrkICvcS122OBAOdhh1X50uJygJDQ0AYIagU/jnil4l7njJsNpBY47OaRuDVT+1PCGcZOgKArVkW5e9F1LltM6IDpkcIbWCau1VzSRAj0BoljN91nPLk65zK9VS/pGP/RHzKgxZZxi4Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aWMLJvty; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aWMLJvty"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467a1ee7ff2so23148921cf.0
        for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 12:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737144082; x=1737748882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DsA6UUShtbfKN1DiFsVA+jPdtiFfFsq3KvzJ6Zzwfs=;
        b=aWMLJvtytLccHRQVWVPISfch5diFSANUzb8bT/8rUmXjd6zVrk4FHmpHummwwwy+Jm
         kkJFw9GY/2GITQ8ouXd3N1XP5GdalT8yeVlvchqY9ImrM0YjkBAaVLsbPjDEXAHRgkBj
         CRRROpF/QhGFnUmYNd7ZV2nx40/XA5WTgcNmTl3jjGmjJlw2H+kONF65Sn+H2Yj9Zxly
         DN0Cbn1x2PY4cq7JiXVHIAPL0vkk0Axnf4Ph4vW9yoLqQiPKGnkgPcIfREE/ijeCvZKy
         94DkmmCXFB3KsbmrKFKbrHxWnhVsVRCtR8s3A+WDzWED48pK4o6/SiFgBwHInqUS9ssF
         jsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737144082; x=1737748882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DsA6UUShtbfKN1DiFsVA+jPdtiFfFsq3KvzJ6Zzwfs=;
        b=CNpajfYyPiTHq22r0Hg8VznCf3gJeB+vZGC9b0sqcYlevTUVdCmnT3bxY3jLksrPoc
         J4k6FA7oxqlw8OX1Vj8OozGARMsi/ZI1hybOkbBfhDBDLfZXic2VKv2WRyVeQu7Al5kY
         ZKltP4KLbhCXXWPfauQcNUgjSLSpD1Us3wXiIgDS+6kW2YXuhuvl7Fp9MewIW38HqM8i
         boUa6XqC9ED3c/vFPOe8RAnIt/AALHzPK7HYcxObEIsqjqxFOfUUaixgc3Wvu+juz4xy
         5a9cfROEElyvAeAk27DtWQCwZtq7P6eXDctXaO4HkjGUmaltNoMTUUhI0axUV/5pOpcI
         zgOw==
X-Forwarded-Encrypted: i=1; AJvYcCVaJ1HQhbxAiCY1oEMvvtLcvqOP62idoSVgGxTVZ8OgrHlOiVMGgI1NVxGfLcA/DwWEKicK@lists.linux.dev
X-Gm-Message-State: AOJu0YyI22uZzhGHD8Hq/aofq+jbzmNaBEhyfOJwplHfS+sE2CFRDdsB
	sFZdxGFb2DPrvJNcFRv2fytEyrMe+NHFWFzEPxWr1S/M0ckyYQ2eVxMmP7VCGA==
X-Gm-Gg: ASbGnctqw7cCMdfkXBr2J4Xx05RWikFWQnINivMmdx0tS8jE0kEWJGJ//cnEpUghzLq
	4cTjK94tnP62iDzLUeuHLFtrrXyY7nKVJKlQrVyKpa44IhasWncaAt4DuO5B5DQVrgKl/KEIGJa
	rgElTHBFqgO0AHptVy1Guz0wqx5GpDQRk64fQz8XmJHPHAAUvHFSaspxG8BXW4hL1uM9janpczt
	TF+8aSoAYaFx4sZTboh81uOwlCIMXFWwRHtxWKjsUx38YwYouwB1H6YurWn9jm64zWCcr/xkbJY
	yl4ygpCWigLxdTEe2w0l4Trvk26VaQ794r22dtvTl1FT5GuCgA==
X-Google-Smtp-Source: AGHT+IGgcFPBoAwN5GAaiDm+JMOx37BGUv9bAb3cSdHNbtpIeuQHTef8FVqkeFR8ddiRWlXU7OBPAQ==
X-Received: by 2002:ac8:5a92:0:b0:46d:d23c:99f5 with SMTP id d75a77b69052e-46e12b56503mr69912941cf.33.1737144080105;
        Fri, 17 Jan 2025 12:01:20 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec4acsm14705511cf.13.2025.01.17.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:01:18 -0800 (PST)
Date: Fri, 17 Jan 2025 15:01:16 -0500
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
Message-ID: <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
References: <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>

On Fri, Jan 17, 2025 at 12:29:34PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/17/2025 um 12:02 AM schrieb Alan Stern:
> > On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
> > > I'm well aware that an absolute definition of semantic dependencies is not
> > > easy to give.
> > 
> > In fact it's undecidable.  No tool is ever going to be able to detect
> > semantic dependencies perfectly.
> 
> It depends.
> Firstly, let's consider that the tool only runs on finite (or "finitized")
> programs.

A program may be finite; that doesn't mean its executions are.  Programs 
can go into infinite loops.  Are you saying that the tool would stop 
verifying executions after (say) a billion steps?  But then it would not 
be able to detect semantic dependences in programs that run longer.

> Seceondly, your definition depends on the compiler.
> 
> So in the sense that we don't know the compiler, it is undecidable.
> But if you fix the compiler, you could still enumerate all executions under
> that compiler and compute whether that compiler has a dependency or not.

You can't enumerate the executions unless you put an artificial bound on 
the length of each execution, as noted above.

> But as I mentioned before, I think you can define semantic dependencies more
> appropriately because you don't really need to preserve semantic
> dependencies in C++, and in LKMM (and VMM) you have volatiles that restrict
> what kind of dependency-eliminations the compiler can do.

What makes you think this "more appropriate" definition of semantic 
dependency will be any easier to detect than the original one?

> Yes. Actually I wonder if you put this "all loads are volatile" restriction,
> can a globally analysing compiler still have any optimizations that a
> locally analysing compiler can not?

Yes, although whether they are pertinent is open to question.  For 
example, a globally optimizing compiler may observe that no thread ever 
reads the value of a particular shared variable and then eliminate that 
variable.

> It rather seems the other way, that the locally analysing quasi-volatile
> compiler can at least to some local optimizations, while the global volatile
> compiler can not (e.g., x=1; y=x; can not be x=1; y=1; for the global
> compiler because x is volatile now).

In the paper we speculate that it may be sufficient to require globally 
optimizing compilers to treat atomics as quasi volatile with the added 
restriction that loads must not be omitted.

> > But then how would you characterize semantic dependencies, if you want
> > to allow the definition to include some dependencies that aren't
> > semantic but not so many that you ever create a cycle?
> 
> I don't know which definition is correct yet, but the point is that you
> don't have to avoid making so many dependencies that you would create a
> cycle. It just forbids the compiler from looking for cycles and optimizing
> based on the existance of the cycle. (Looking for unused vars and removing
> those is still allowed, under the informal argument that this simulates an
> execution where no OOTA happened)

At the moment, the only underlying ideas we have driving our notions of 
semantic dependency is that a true semantic dependency should be one 
which must give rise to order in the machine code.  In turn, this order 
prevents OOTA cycles from occuring during execution.  That is the 
essence of the paper.

Can your ideas be fleshed out to a comparable degree?

> > > So for example, if we merge  x = y || y = x,  the merge can turn it into
> > > x=y=x or y=x=y (and then into an empty program), but not into a cyclic
> > > dependency. So even though one side of the dependency may be violated, for
> > > sake of OOTA, we could still label both sides as dependent.
> > 
> > They _are_ both semantically dependent (in the original parallel
> > version, I mean).  I don't see what merging has to do with it.
> 
> Note that I was considering the case where they are not volatile.
> With a compiler that is not treating them as volatile, which merges the two
> threads, under your definition, there is no semantic dependency in at least
> one direction because there is no hardware realization H where you read
> something else (of course you exclude such compilers, but I think
> realistically they should be allowed).
> 
> My point is that we can say they are semantically dependent for the sake of
> OOTA, not derive any ordering from these dependencies other than the
> cyclical one, and therefore allow compilers to one of the two optimizations
> (make x=y no longer depend on y or make y=x no longer depend on x) but noth
> make a cycle analysis to remove both dependencies and generate an OOTA value
> (it can remove both dependencies by leaving x and y unchanged though).

I don't understand.

> > I do not like the idea of tying the definition of OOTA (which needs to
> > apply to every implementation) to a particular clang compiler.
> 
> But that is what you have done, no? Whether something is an sdep depends on
> the compiler, so compiler A could generate an execution that is OOTA in the
> sdep definition of compiler B.

Yes, but this does not tie the definition to _one particular_ compiler.  
That is, we don't say "This dependency is semantic because of the way 
GCC 14.2.1 handles it."  Rather, we define for each compiler whether a 
dependency is semantic for _that_ compiler.

> (Of course with the assumption of atomic=volatile, it may just be that we
> are back to the beginning and all "naive" semantic dependencies are actually
> semantic dependencies for all compilers).
> 
> Anyways what I meant is not about tying the definition of OOTA to one
> compiler or other. As I mentioned I think it can be fine to define OOTA in
> the same way for all compilers.
> What I meant is to specialize the memory model to a specific compiler, as
> long as that is the compiler that is used in reality.
> So long as your code does not depend on the ordering of any semantic
> dependencies, the verification can be cross platform.
> 
> And although...
> 
> > I'm not particularly concerned about OOTA or semantic dependencies in
> LKMM.
> 
> ... there is code that relies on semantic dependencies, e.g. RCU read side
> CS code. (even if we do not care about OOTA).
> For that code, the semantic dependencies must be guaranteed to create
> ordering.
> 
> So you either need a definition of semantic dependency that
> a) applies in all cases we practically need and
> b) is guaranteed by all compilers
> 
> or we need to live with the fact that we do not have a semantic dependency
> definition that is independent of the compilation (even of the same
> compiler) and need to do our verification for that specific compilation.

Add the qualification that the definition should be practical to 
evaluate, and I agree.

> I think for LKMM we could give such a semantic dependency definition because
> it uses volatile, and verify RCU-read-side code. But we currently do not
> have one. What I meant to say is that using the actual (whatever compiler
> you use) optimizations first to remove syntactic dependencies, and then
> verifying under the assumption of whatever dependencies are left, may be
> better than trying to approximate dependencies in some way in cat. Given
> that we want to verify and rely on the code today, not in X years when we
> all agree on what a compiler-independent definition of semantic dependency
> is.
> 
> I think for C++ consume we could also give one by simply restricting some
> compiler optimizations for consume loads (and doing whatever needs to be
> done on alpha). Or just kick it out and not have any dependency ordering
> except the global OOTA case.
> 
> Sorry for the confusion, I think there are so many different
> combinations/battlefields (OOTA vs just semantic dependencies,
> volatile/non-volatile atomics, verifying the model vs verifying a piece of
> code etc.) that it becomes hard for me not to confuse myself, let alone
> others :))

I know what that feels like!

Alan
