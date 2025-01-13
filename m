Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB71D61A5;
	Mon, 13 Jan 2025 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805899; cv=none; b=HVCyxd6ue60yd8E7mX/Osvto3u4hz8HbPVm+j4AkOhP+loTR2TqcPgURp79mSJBmsSZGPAFH78ivdVzNdQybRVA6hXSSRgoiaTbjyPXwH0dht/BH7OZhNiKf95fuFshpRRVySVB88TisL9W60Y61DtluVkw48+5RO8AN8Y2Rv40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805899; c=relaxed/simple;
	bh=zfohkV2FJxwJTsons2iwungXEd4dld/AshaURc2DHaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjzx/eCRYEwDCrz2cwDkO6kFP4VVXURV88q6QkFO7WaNSiHBGfljE0QzVh7lg+j81zzhyQtnEWeTGgiDww94oCvpoph187FXO++tdmuaQ7wkV06C0Ayb4wKuVoCxKH2/WwvsBTGZRXceujE0exQA1OAfUNZvSAfvrLNoXs99jO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEvgd4TY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEvgd4TY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3F3C4CED6;
	Mon, 13 Jan 2025 22:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736805898;
	bh=zfohkV2FJxwJTsons2iwungXEd4dld/AshaURc2DHaM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=YEvgd4TY/YNwxCK1mOfp/pQDdBfP0qsAjtGaoadcqowFjekDVB55e1IsGjhz7+WZE
	 OmBRzHGPNPpN+4A36AEItIAD6GUxCnk49D7vFq9Tcrx6NFpL7exjwgKR0SzGSTgSZW
	 UTXxijfc6UJ29QvhxD9Z0G/Ck+oQN8SeTg+CQ2LGcG9pJdHQUC4505atWbGScR1fo2
	 /2keAaLRo1N9v5+7606kt/FNvpQNfE7aJG6W+JaY+8oMp6vZ2UwCYdFkj/aevvcHRE
	 0ntgkhRopWjUmki5F1+X1hR9glQPAQQoplDgLviMPcZWpFwWxvsWfDxUtxVr3qgm8z
	 sCPY9b3+z7VfQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0E149CE0F13; Mon, 13 Jan 2025 14:04:58 -0800 (PST)
Date: Mon, 13 Jan 2025 14:04:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, parri.andrea@gmail.com,
	will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com,
	joel@joelfernandes.org, urezki@gmail.com, quic_neeraju@quicinc.com,
	frederic@kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
 <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
 <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>

On Fri, Jan 10, 2025 at 05:21:59PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/10/2025 um 3:54 PM schrieb Paul E. McKenney:
> > On Thu, Jan 09, 2025 at 07:35:19PM +0100, Jonas Oberhauser wrote:
> > > Am 1/9/2025 um 6:54 PM schrieb Paul E. McKenney:
> > > > On Wed, Jan 08, 2025 at 08:17:51PM +0100, Jonas Oberhauser wrote:
> > > > > 
> > > > > 
> > > > > Am 1/8/2025 um 7:09 PM schrieb Paul E. McKenney:
> > > > > > If I change the two plain assignments to use WRITE_ONCE() as required
> > > > > > by memory-barriers.txt, OOTA is avoided:
> > > > > 
> > > > > 
> > > > > I think this direction of inquiry is a bit misleading. There need not be any
> > > > > speculative store at all:
> > > > > 
> > > > > 
> > > > > 
> > > > > P0(int *a, int *b, int *x, int *y) {
> > > > > 	int r1;
> > > > > 	int r2 = 0;
> > > > > 	r1 = READ_ONCE(*x);
> > > > > 	smp_rmb();
> > > > > 	if (r1 == 1) {
> > > > > 		r2 = *b;
> > > > > 	}
> > > > > 	WRITE_ONCE(*a, r2);
> > > > > 	smp_wmb();
> > > > > 	WRITE_ONCE(*y, 1);
> > > > > }
> > > > > 
> > > > > P1(int *a, int *b, int *x, int *y) {
> > > > > 	int r1;
> > > > > 
> > > > > 	int r2 = 0;
> > > > > 
> > > > > 	r1 = READ_ONCE(*y);
> > > > > 	smp_rmb();
> > > > > 	if (r1 == 1) {
> > > > > 		r2 = *a;
> > > > > 	}
> > > > > 	WRITE_ONCE(*b, r2);
> > > > > 	smp_wmb();
> > > > > 	WRITE_ONCE(*x, 1);
> > > > > }
> > > > > 
> > > > > 
> > > > If we want to respect something containing a control dependency to a
> > > > WRITE_ONCE() not in the body of the "if" statement, we need to make some
> > > > change to memory-barriers.txt.
> > > 
> > > I'm not sure what you denotate by *this* in "if we change this", but just to
> > > clarify, I am not thinking of claiming that there were a (semantic) control
> > > dependency to WRITE_ONCE(*b, r2) in this example.
> > > 
> > > There is however a data dependency from r2 = *a to WRITE_ONCE, and I would
> > > say that there is a semantic data (not control) dependency from r1 =
> > > READ_ONCE(*y) to WRITE_ONCE(*b, r2), too: depending on the value read from
> > > *y, the value stored to *b will be different. The latter would be enough to
> > > avoid OOTA according to the mainline LKMM, but currently this semantic
> > > dependency is not detected by herd7.
> > 
> > According to LKMM, address and data dependencies must be headed by
> > rcu_dereference() or similar.  See Documentation/RCU/rcu_dereference.rst.
> > 
> > Therefore, there is nothing to chain the control dependency with.
> 
> Note that herd7 does generate dependencies. And speaking informally, there
> clearly is a semantic dependency.
> 
> Both the original formalization of LKMM and my patch do say that a plain
> load at the head of a dependency chain does not provide any dependency
> ordering, i.e.,
> 
>   [Plain & R] ; dep
> 
> is never part of hb, both in LKMM and in my patch.

Agreed, LKMM does filter the underlying herd7 dependencies.

> By the way, if your concern is the dependency *starting* from the plain
> load, then we can look at examples where the dependency starts from a marked
> load:
> 
> 
>   r1 = READ_ONCE(*x);
>   smp_rmb();
>   if (r1 == 1) {
>     r2 = READ_ONCE(*a);
>   }
>   *b = 1;
>   smp_wmb();
>   WRITE_ONCE(*y,1);
> 
> This is more or less analogous to the case of the addr ; [Plain] ; wmb case
> you already have.

This is probably a failure of imagination on my part, but I am not
seeing how to create another thread that interacts with that store to
"b" without resulting in a data race.

Ignoring that, I am not seeing much in the way of LKMM dependencies
in that code.

> > > I currently can not come up with an example where there would be a
> > > (semantic) control dependency from a load to a store that is not in the arm
> > > of an if statement (or a loop / switch of some form with the branch
> > > depending on the load).
> > > 
> > > I think the control dependency is just a red herring. It is only there to
> > > avoid the data race.
> > 
> > Well, that red herring needs to have a companion fish to swim with in
> > order to enforce ordering, and I am not seeing that companion.
> > 
> > Or am I (yet again!) missing something subtle here?
> 
> It makes more sense to think about how people do message passing (or
> seqlock), which might look something like this:
> 
>   [READ_ONCE]
>   rmb
>   [plain read]
> 
> and
> 
>   [plain write]
>   wmb
>   [WRITE_ONCE]
> 
> 
> Clearly LKMM says that there is some sort of order (not quite happens-before
> order though) between the READ_ONCE and the plain read, and between the
> plain write and the WRITE_ONCE. This order is clearly defined in the data
> race definition, in r-pre-bounded and w-post-bounded.
> 
> Now consider
> 
>   [READ_ONCE]
>   rmb
>   [plain read]
>   // some code that creates order between the plain accesses
>   [plain write]
>   wmb
>   [WRITE_ONCE]
> 
> where for some specific reason we can discern that the compiler can not
> fully eliminate/move across the barrier either this specific plain read, nor
> the plain write, nor the ordering between the two.
> 
> In this case, is there order between the READ_ONCE and the WRITE_ONCE, or
> not? Of course, we know current LKMM says no. I would say that in those very
> specific cases, we do have ordering.

Agreed, for LKMM to deal with seqlock, the read-side critical section
would need to use READ_ONCE(), which is a bit unnatural.  The C++
standards committee has been discussing this for some time, as that
memory model also gives data race in that case.

But it might be better to directly model seqlock than to try to make
LKMM deal with the underlying atomic operations.

> > > In a hypothetical LKMM where reading in a race is not a data race unless the
> > > data is used (*1), this would also work:
> > 
> > You lost me on the "(*1)", which might mean that I am misunderstanding
> > your text and examples below.
> 
> This was meant to be a footnote :D

My first thought was indirecting through a value-1 pointer without the
needed casts.  ;-)

> > >   	unsigned int r1;
> > >   	unsigned int r2 = 0;
> > >   	r1 = READ_ONCE(*x);
> > >   	smp_rmb();
> > >   	r2 = *b;
> > 
> > This load from *b does not head any sort of dependency per LKMM, as noted
> > in rcu_dereference.rst.  As that document states, there are too many games
> > that compilers are permitted to play with plain C-language loads.
> > 
> > >   	WRITE_ONCE(*a, (~r1 + 1) & r2);
> > >   	smp_wmb();
> > >   	WRITE_ONCE(*y, 1);
> > > 
> > > 
> > > Here in case r1 == 0, the value of r2 is not used, so there is a race but
> > > there would not be data race in the hypothetical LKMM.
> > 
> > That plain C-language load from b, if concurrent with any sort of store to
> > b, really is a data race. Sure, a compiler that can prove that r1==0 at
> > the WRITE_ONCE() to a might optimize that load away, but the C-language
> > definition of data race still applies.
> 
> It is a data race according to C, but so are all races on WRITE_ONCE and
> READ_ONCE, so we already do not actually care what C says.

The situation with WRITE_ONCE() and READ_ONCE() is debatable.
The volatile accesses are defined more by folklore than standardese,
and they do seriously constrain the compiler.  Which is why many people
don't like volatile much.

> What we care about is what the compiler says (and does).
> 
> The reality is that no matter what kind of crazy optimizations the compiler
> does to the load and to the concurrent store, all that would happen is that
> the load "returns" some insane value. But that insane value is not used by
> the remainder of the computation.

Yes, but only as long as your properly constrain what the code in that
read-side critical section is permitted to do.

> I think the right way to think about it is that a race between a read and a
> write gives the read an indeterminate value, and a race between two writes
> produces undefined behavior. I vaguely recall that this is even guaranteed
> by LLVM.
> 
> That is why sequence locks work, after all. In our internal memory model we
> have relaxed the definition accordingly and there are a bunch of internally
> used datastructures that can only be verified because of the relaxation.

Again, it is likely best to model sequence locking directly.

> > I am currently not at all comfortable with the thought of allowing
> > plain C-language loads to head any sort of dependency.  I really did put
> > that restriction into both memory-barriers.txt and rcu_dereference.rst
> > intentionally.  There is the old saying "Discipline = freedom", and
> > therefore compilers' lack of discipline surrounding plain C-language
> > loads implies a lack of freedom.  ;-)
> 
> Yes, I understand your concern (or more generally, the concern of letting
> plain accesses play a role in ordering).
> Obviously, allowing arbitrary plain loads to invoke some kind of ordering
> because of a dependency is plain (heh) wrong.
> There are two kinds of potential problems:
>  - the load or its dependent store may not exist in that location at all
>  - the dependency may not really exist
> 
> The second case is a problem also with marked accesses, and should be
> handled by herd7 only giving us actual semantic dependencies (whatever those
> are). It can not be solved in cat. Either way it is a limitation that herd7
> (and also other tools) currently has and we already live with.

This is easy to say.  Please see this paper (which Alan also referred to)
for some of the challenges:

https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2024/p3064r2.pdf

Mark Batty and his group have identified more gotchas.  (See the citation
in the above paper.)

> So the new problem we deal with is to somehow restrict the rule to loads and
> dependent stores that the compiler for whatever reason will not fully
> eliminate.
> 
> This problem too can not be solved completely inside cat. We can give an
> approximation, as discussed with Alan (stating that a store would not be
> elided if it is read by another thread, and a read would not be elided if it
> reads from another thread and a store that won't be elided depends on it).
> 
> This approximation is also limited, e.g., if the addresses of the plain
> loads and stores have not yet escaped the function, but at least this
> scenario is currently impossible in herd7 (unlike the fake dependency
> scenario).
> 
> In my mind it would again be better to offload the correct selection of
> "compiler-un(re)movable plain loads and stores" to the tools. That may again
> not solve the problem fully, but it at least would mean that any changes to
> address the imprecision wouldn't need to go through the kernel tree, and
> IMHO it is easier to say LKMM in the cat files is the model, and the
> interpretation of the model has some limitations.

Which we currently do via marked accesses.  ;-)

> > We should decide which of these examples should be
> > added to the github litmus archive, perhaps to illustrate the fact that
> > plain C-language loads do not head dependency chains.  Thoughts?
> 
> I'm not sure that is a good idea, given that running the herd7 tool on the
> litmus test will clearly show a dependency chain headed by plain loads in
> the visual graphs (with `doshow rwdep`).
> 
> Maybe it makes more sense to say in the docs that they may head syntactic or
> semantic dependency chains, but because of the common case that the compiler
> may cruelly optimize things, LKMM does not guarantee ordering based on the
> dependency chains headed by plain loads. That would be consistent with the
> tooling.

Well, LKMM and herd7 have different notions of what constitutes a
dependency, and the LKMM notion is most relevant here.  (And herd7
needs its broader definition so as to handle a wide variety of
memory models.)

> > [1] https://people.kernel.org/paulmck/hunting-a-tree03-heisenbug
> 
> Fun. Thanks :) Duplication and Devious both start with D.

In reference to the performance and scalability consequences of
eliminating that duplication, so does Devine!  ;-)

						Thanx, Paul
