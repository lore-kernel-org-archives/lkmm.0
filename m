Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A4206F38
	for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736545920; cv=none; b=k5PdbhSyRl0DE8ZZN4S9WLRalLrMfcamew7p3FPBq9H0SI0TcczIwyjL5rKvg2Mm1EprmrQlNYHVrzMg/dd43dTD3tguKuB2lzJp5CuJPuCpCUE4PtBO10Ft3QPqCePpTild30/JcF4fGNw/tu/T2uWe1H9sGrzn2vBD9hoTcec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736545920; c=relaxed/simple;
	bh=pbDcbdQQ5vhTuIXqLMzg9Xg8N+ZJQc3bdCzLUhRcgpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAGcUeKFCTeFKh6PfJEVMM8lNIoiS9whzucMQB807wu2XYofAOONpv+5Si7JgqlnTp3KjKCK0qfEws8k1SynzQsKC66VYW4DbJr+oZntC29xjdR5+BIgmxn0OheyZ4ToihNkaNVieOQj+aMMYUfefcySgmN9aaUAg7X9xu49Xqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OYK8bzls; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OYK8bzls"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6dd1b895541so39879766d6.0
        for <lkmm@lists.linux.dev>; Fri, 10 Jan 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736545917; x=1737150717; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjneKMNTh6LdMguuB+VzLDU2xgdf/DOD3XmLyalT15w=;
        b=OYK8bzlsdKbQv+ZfNFDrpmSFWjnvTutTZSBV74Wo5z802r/B8Ms2c3B2Q9fBTQZxY5
         AZF4pHBFcIRQ2Qw9iuCwuirYldMPPkf3yoYzVnV02s7ib3n3D51dc65vsYkMPjSpdOxe
         HqXybKBgxs8Oj2lL24UA+vu58DuOgJ8I0iSNO7btjeIIKQNAz0YplJoimNJaCzsUJiBU
         6Ly6paPKlSp5JzCJ0MdUlAJFjVk+FX/DwjwW3XmBB3A88zfSN62nmkMzvO0tLC5QqxK8
         iTEaHL1dzSnBoAwiYPR0C/LDWi7gCa5hTCJEHUKgOOzwAuGm2xyKnwdNkFdmZbQfIvvd
         YwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736545917; x=1737150717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjneKMNTh6LdMguuB+VzLDU2xgdf/DOD3XmLyalT15w=;
        b=aCbN8f8bDEEJBkVDeEOY4cqKNxQsfP3sH6jG5x6p5YMDUHEgMxWCBINrFHg18iZsNF
         KtHWoxo+kuJXRwPTmeOFMZOUo+AHE7e9XRw7bcaC18yp28smAy3UOzpEjRlr81FvnuXt
         QMcjKkWbXU1F9WXI0ERY0XoLdP7n58SV4adSuOoRE1KRN1ZyZgjl5zqWIaSweXVVEuZ3
         QriIpjFtHgrSRzeGJYY1/JDd35IQa4UK/SJgvjdkl3dI3HMEtZHI5h4aZgwOP67C7xfp
         ubcjyWr96webf/p73G/PYqxFJ5M1uraF0Dr1fl0TwfxYIb52WP1S8nQaWAkE5eu9zIoi
         aOYw==
X-Forwarded-Encrypted: i=1; AJvYcCXnM1t9j1GnSbUTyLlgO/5QrvQN/vvnRO6qi84QlnXn75miSy1My5q+9WomllihVvlE7yLU@lists.linux.dev
X-Gm-Message-State: AOJu0YwaGW89sOoFhzMC1hXxVXJENPa/KTR43hGKFYNsoz01GKfE62oN
	V+aBHiSLBMASR0TLRICNayC7TCgEcxm4NHF2ppN/jv59nlyk7av6DZ2BEZbrKQ==
X-Gm-Gg: ASbGncvUXGYfcBmZyO+6j8lYtBifIwkgB0Ze2ZQE5W4zs1qOh/zgoZYw0LBc5XGdzFf
	S+QyDYwSV9QhD/s0fA+hsTC8Uj2SJn+WeF0WbsdEt21qezNkD4btKvRiAzK+T9DsUQOnOp/SgVX
	tTx6IK4edo+4hQDdZ8ivmo207nK7LfDwUV3qCD4v4r0SxGWwXI3f6QoZhafqFP9sNQsC2p3RnSV
	k2T7t5+FrUmyC9IOL1Jn1GK20gkXsD/08rgGo519ZgF9MBunxVnzk+g4Q==
X-Google-Smtp-Source: AGHT+IGF5kPPeiV19Uq/j5dqsvTx/pzmrTL1Mum3jmDqdsmFLrBeqo9S70uXy9vhe5C+6/2JHt5QmQ==
X-Received: by 2002:a05:6214:1d24:b0:6d8:821d:736e with SMTP id 6a1803df08f44-6df9b28d3camr225347106d6.36.1736545917456;
        Fri, 10 Jan 2025 13:51:57 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::bfa6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c87222d09sm13669071cf.0.2025.01.10.13.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 13:51:56 -0800 (PST)
Date: Fri, 10 Jan 2025 16:51:52 -0500
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
Message-ID: <c2ae9bca-8526-425e-b9b5-135004ad59ad@rowland.harvard.edu>
References: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <3ca45d97-670f-4c9e-8df8-2304a1de32b9@huaweicloud.com>
 <b43269fd-0d4f-4d43-af88-433583ba73f7@rowland.harvard.edu>
 <06854f97-a671-426e-8c73-78214da8fbf5@huaweicloud.com>
 <83b64af7-03b7-4dd8-900b-c57a65479ba8@rowland.harvard.edu>
 <63a462dd-f182-4868-92b8-f33f2dc266f8@huaweicloud.com>
 <d82053fb-2f8c-4196-85e9-8d5a8f25c391@rowland.harvard.edu>
 <582102b0-ee94-4160-95ec-4d44815cc39e@huaweicloud.com>
 <8306ac43-fb00-4e58-bdeb-81ea9993c262@rowland.harvard.edu>
 <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7e59f22-12d3-42e5-88d2-e96beafb78c5@huaweicloud.com>

On Fri, Jan 10, 2025 at 01:21:32PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/10/2025 um 4:12 AM schrieb Alan Stern:
> > On Thu, Jan 09, 2025 at 09:09:00PM +0100, Jonas Oberhauser wrote:
> > 
> > > > > So for example, in
> > > > > 
> > > > >     int a = 1;
> > > > >     barrier();
> > > > >     a = 2;
> > > > >     //...
> > > > > 
> > > > > the compiler does not know how the code inside barrier() accesses memory,
> > > > > including volatile memory.
> > > > 
> > > > I would say rather that the compiler does not know that the values
> > > > stored in memory are the same before and after the barrier().
> > > > 
> > > > Even the
> > > > values of local variables whose addresses have not been exported.
> > > 
> > > No, this is not true. I used to think so too until a short while ago.
> > > 
> > > But if you look at the output of gcc -o3 you will see that it does happily
> > > remove `a` in this function.
> > 
> > Isn't that consistent with what I said?
> 
> 
> Ok, after careful reading, I think there are two assumptions you have that I
> think are not true, but my example is only inconsistent with exactly one of
> them being not true, not with both of them being not true:
> 
> 1) the barrier only tells the compiler that it may *change* the value of
> memory locations. I believe it also tells the compiler that it may *read*
> the value of memory locations.
> 2) the barrier also talks about the values of local variables whose
> addresses have not been exported. I do not believe this is the case.

I checked the GCC manual.  You are right about 1); the compiler is 
required to guarantee that the contents of memory before the barrier are 
fully up-to-date (no dirty values remaining in registers or 
temporaries).

2) isn't so clear.  If a local variable's address is never computed then 
the compiler might put the variable in a register, in which case the 
barrier would not clobber it.  On the other hand, if the variable's 
address is computed somewhere (even if it isn't exported) then the 
variable can't be kept in a register and so it is subject to the 
barrier's effects.

The manual says:

	Using the ‘"memory"’ clobber effectively forms a read/write 
	memory barrier for the compiler.

Not a word about what happens if a variable has the "register" storage 
class, for example, and so might never be stored in memory at all.  But 
this leaves the programmer with _no_ way to specify a memory barrier for 
such variables!

Of course, the fact that these variables cannot be exposed to outside 
code does mitigate the problem...

> For what gcc guarantees, the manual says: "add memory to the list of
> clobbered registers. This will cause GCC to not keep memory values cached in
> registers across the assembler instruction", i.e., it needs to flush the
> value from the register to actual memory.

Yes, GCC will write back dirty values from registers.  But not because 
the cached values will become invalid (in fact, the cached values might 
not even be used after the barrier).  Rather, because the compiler is 
required to assume that the assembler code in the barrier might access 
arbitrary memory locations -- even if that code is empty.

> > > > Question: Can the compiler assume that no other threads access a between
> > > > the two stores, on the grounds that this would be a data race?  I'd
> > > > guess that it can't make that assumption, but it would be nice to know
> > > > for sure.
> > > 
> > > It can not make the assumption if &a has escaped. In that case, barrier()
> > > could be so:
> > > 
> > > barrier(){
> > >    store_release(OTHER_THREAD_PLEASE_MODIFY,&a);
> > > 
> > >    while (! load_acquire(OTHER_THREAD_IS_DONE));
> > > }
> > > 
> > > with another thread doing
> > > 
> > >    while (! load_acquire(OTHER_THREAD_PLEASE_MODIFY)) yield();
> > >    *OTHER_THREAD_PLEASE_MODIFY ++;
> > >    store_release(OTHER_THREAD_IS_DONE, 1);

Okay, yes, the compiler can't know whether the assembler code will do 
this.  But as far as I know, there is no specification about whether 
inline assembler can synchronize with code in another thread (in the 
sense used by the C++ memory model) and therefore create a 
happens-before link.  Language specifications tend to ignore issues 
like inline assembler.

Does this give the compiler license to believe no such link can exist 
and therefore accesses to these non-atomic variables by another thread 
concurrent with the barrier would be data races?

In the end maybe this doesn't matter.

> > > If herd7 would generate edges for semantic dependencies instead of for its
> > > version of syntactic dependencies, then rwdep is the answer.
> > 
> > That statement is meaningless (or at least, impossible to implement)
> > because there is no widely agreed-upon formal definition for semantic
> > dependency.
> 
> Yes, which also means that a 100% correct end-to-end solution (herd + cat +
> ... ?) is currently not implementable.
> 
> But we can still break the problem into two halves, one which is 100% solved
> inside the cat file, and one which is the responsibility of herd7 and
> currently not solved (or 100% satisfactorily solvable).

I believe that Luc and the other people involved with herd7 take the 
opposite point of view: herd7 is intended to do the "easy" analysis 
involving only straightforward code parsing, leaving the "hard" 
conceptual parts to the user-supplied .cat file.

> The advantage being that if we read the cat file as a mathematical
> definition, we can at least on paper argue 100% correctly about code for the
> cases where we either can figure out on paper what the semantic dependencies
> are, or where we at least just say "with relation to current compilers, we
> know what the semantically preserved dependencies are", even if herd7 or
> other tools lags behind in one or both.
> 
> After all, herd7 is just a (useful) automation tool for reasoning about
> LKMM, which has its limitations (scalability, a specific definition of
> dependencies, limited C subset...).

I still think we should not attempt any sort of formalization of 
semantic dependency here.

> > > Given that we can not define dep inside the cat model, one may as well
> > > define it as rwdep;rfe with the intended meaning of the dependencies being
> > > the semantic ones; then it is an inaccuracy of herd7 that it does not
> > > provide the proper dependencies.
> > 
> > Perhaps so.  LKMM does include other features which the compiler can
> > defeat if the programmer isn't sufficiently careful.
> 
> How many of these are due to herd7's limitations vs. in the cat file?

Important limitations are present in both.

> > > > In the paper, I speculated that if a physical execution of a program
> > > > matches an abstract execution containing such a non-observed OOTA cycle,
> > > > then it also matches another abstract execution in which the cycle
> > > > doesn't exist.  I don't know how to prove this conjecture, though.
> > > 
> > > Yes, that also makes sense.
> > > 
> > > Note that this speculation does not hold in the current LKMM though. In the
> > > Litmus test I shared in the opening e-mail, where the outcome 0:r1=1 /\
> > > 1:r1=1 is only possible with an OOTA (even though the values from the OOTA
> > > are never used anywhere).
> > 
> > If the fact that the outcome 0:r1=1 /\ 1:r1=1 has occurred is proof that
> > there was OOTA, then the OOTA cycle _is_ observed, albeit indirectly --
> > at least, in the sense that I intended.  (The situation mentioned in the
> > paper is better described as an execution where the compiler has elided
> > all the accesses in the OOTA cycle.)
> 
> I'm not sure that sense makes a lot of sense to me.

Here's an example illustrating what I had in mind.  Imagine that all the 
accesses here are C++-style relaxed atomic (i.e., not volatile and also 
not subject to data races):

P0(int *a, int *b) {
	int r0 = *a;
	*b = r0;
	*b = 2;
	// r0 not used again
}

P1(int *a, int *b) {
	int r1 = *b;
	*a = r1;
	*a = 2;
	// r1 not used again
}

The compiler could eliminate the r0 and r1 accesses entirely, leaving 
just:

P0(int *a, int *b) {
	*b = 2;
}

P1(int *a, int *b) {
	*a = 2;
}

An execution of the corresponding machine code would then be compatible 
with an abstract execution of the source code in which both r0 and r1 
get set to 42 (OOTA).  But it would also be compatible with an abstract 
execution in which both r0 and r1 are 0, so it doesn't make sense to say 
that the hardware execution is, or might be, an instance of OOTA.

> But it does make the proof of your claim totally trivial. If there is no
> other OOTA-free execution with the same observable behavior, then it is
> proof that the OOTA happened, so the OOTA was observed.
> So by contraposition any non-observed OOTA has an OOTA-free execution with
> the same observable behavior.
> 
> The sense in which I would define observed is more along the lines of "there
> is an observable side effect (such as store to volatile location) which has
> a semantic dependency on a load that reads from one of the stores in the
> OOTA cycle".

Yes, I can see that from your proposed definition of Live.


I'm afraid we've wandered off the point of this email thread, however... 

Getting back to the original point, why don't you rewrite your patch as 
discussed earlier and describe it as an attempt to add ordering for 
important situations involving plain accesses that the LKMM currently 
does not handle?  In other words, leave out as far as possible any 
mention of OOTA or semantic dependency.

Alan
