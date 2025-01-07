Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057656A009;
	Tue,  7 Jan 2025 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736275664; cv=none; b=Gyv8OAmO10Q2p4hPqPvtinqPP4PNY/Pv2iIpSD3cel7StNdI7CTwhoLO8ZEylvLc/JpMk1Nd08HWS4glAx5zo/lPrEDGDIcuMsRDKPhas+SmQJeS/uYC57IweYcvpiKrzKFa5hGI7X2rnlygvWWDELCIbqR020RXRtfsAjjRD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736275664; c=relaxed/simple;
	bh=Z9pFGb38CPHtYjZ68H9idCYEgdN20HPHj2Z82lRUC+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCqm74QcpdfPz3WMe0jn3RPwAR/rwLeNQd6nscyyANtgx1Mi+8MPR9rvlorjMZWjzwxcgAPng06RNaLQUI8eTk8sLB9HX75NPjFDGIO288pUK5TL65g+DEltlwlqi2XnfeZ3ez9rZ6MGlv5N6DsWl2JECrNjT7GvmGYJ3ZVYh2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKMUnSXN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKMUnSXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8624CC4CED6;
	Tue,  7 Jan 2025 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736275663;
	bh=Z9pFGb38CPHtYjZ68H9idCYEgdN20HPHj2Z82lRUC+o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XKMUnSXNpcoLVik1gKBUmf5aVgfZovrnz4HNTyxpWUuZvhUgT/gSpo9oC8wMCRMVs
	 YlrN5LNOtgwnVflWtZ0Yd8cORNYXuLuR/OIS5k4OxQfJ9/+fWEH3TUgegjW9Jwr1Cc
	 XQxzL1kHlxz/tbT5+eZKiwk9CYjHr076mQFT5lkseLF/EstXIU4Llp13/zpNklVlDE
	 A22HBwxRgp2aR+QGBN395+UvEfT8bUOgmgTb7zlHxY5sdesYq0ofCsnDsX40Oj6w1i
	 3OVk0lV8TJKZL+B0IhBQLsxtM/Fflvi9i/nn1fxLm+wUWl03BTMeQgXaNZ4KRTBZT5
	 VDG6mBi9rDlzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2BFCFCE09CC; Tue,  7 Jan 2025 10:47:43 -0800 (PST)
Date: Tue, 7 Jan 2025 10:47:43 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
	dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
	quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <68f98254-daf9-4197-a7cb-ef9fca0ef158@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>

On Tue, Jan 07, 2025 at 11:09:55AM -0500, Alan Stern wrote:
> On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:
> > The current LKMM allows out-of-thin-air (OOTA), as evidenced in the following
> > example shared on this list a few years ago:
> > 
> >   P0(int *a, int *b, int *x, int *y) {
> >   	int r1;
> > 
> >   	r1 = READ_ONCE(*x);
> >   	smp_rmb();
> >   	if (r1 == 1) {
> >   		*a = *b;
> >   	}
> >   	smp_wmb();
> >   	WRITE_ONCE(*y, 1);
> >   }
> > 
> >   P1(int *a, int *b, int *x, int *y) {
> >   	int r1;
> > 
> >   	r1 = READ_ONCE(*y);
> >   	smp_rmb();
> >   	if (r1 == 1) {
> >   		*b = *a;
> >   	}
> >   	smp_wmb();
> >   	WRITE_ONCE(*x, 1);
> >   }
> > 
> >   exists b=42
> > 
> > The root cause is an interplay between plain accesses and rw-fences, i.e.,
> > smp_rmb() and smp_wmb(): while smp_rmb() and smp_wmb() provide sufficient
> > ordering for plain accesses to rule out data races, they do not in the current
> > formalization generally actually order the plain accesses, allowing, e.g., the
> > load and stores to *b to proceed in any order even if P1 reads from P0; and in
> > particular, the marked accesses around those plain accesses are also not
> > ordered, which causes this OOTA.
> 
> That's right.  The memory model deliberately tries to avoid placing 
> restrictions on plain accesses, whenever it can.
> 
> In the example above, for instance, I think it's more interesting to ask
> 
> 	exists 0:r1=1 /\ 1:r1=1
> 
> than to concentrate on a and b.
> 
> OOTA is a very difficult subject.  It can be approached only by making 
> the memory model take all sorts of compiler optimizations into account, 
> and doing this for all possible optimizations is not feasible.

Mark Batty and his students believe otherwise, but I am content to let
them make that argument.  As in I agree with you rather than them.  At
least unless and until they make their argument.  ;-)

> (For example, in a presentation to the C++ working group last year, Paul 
> and I didn't try to show how to extend the C++ memory model to exclude 
> OOTA [other than by fiat, as it does now].  Instead we argued that with 
> the existing memory model, no reasonable compiler would ever produce an 
> executable that could exhibit OOTA and so the memory model didn't need 
> to be changed.)

Furthermore, the LKMM design choice was that if a given litmus test was
flagged as having a data race, anything might happen, including OOTA.

In case there is interest, that presentation may be found here:

https://drive.google.com/file/d/1ZeJlUJfH90S2uf2wRvNXQvM4jNVSlZI8/view?usp=sharing

The most recent version of the working paper may be found here:

https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2024/p3064r2.pdf

							Thanx, Paul

> > In this patch, we choose the rather conservative approach of forcing only the
> > order of these marked accesses, specifically, when a marked read r is
> > separated from a plain read r' by an smp_rmb() (or r' has an address
> > dependency on r or is r'), on which a write w' depends, and w' is either plain
> > and seperated by a subsequent write w by an smp_wmb() (or w' is w), then r
> > precedes w in ppo.
> 
> Is this really valid?  In the example above, if there were no other 
> references to a or b in the rest of the program, the compiler could 
> eliminate them entirely.  (Whether the result could count as OOTA is 
> open to question, but that's not the point.)  Is it not possible that a 
> compiler might find other ways to defeat your intentions?
> 
> In any case, my feeling is that memory models for higher languages 
> (i.e., anything above the assembler level) should not try very hard to 
> address the question of OOTA.  And for LKMM, OOTA involving _plain_ 
> accesses is doubly out of bounds.
> 
> Your proposed change seems to add a significant complication to the 
> memory model for a not-very-clear benefit.
> 
> Alan
