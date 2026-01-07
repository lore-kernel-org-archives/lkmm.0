Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6E38F234
	for <lkmm@lists.linux.dev>; Wed,  7 Jan 2026 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808125; cv=none; b=lMZOYYesxC3Y98KvJQrIGoBp3D6MFHlW/yf+7QrR4KUvj3fZSJXVETSBaPSJK4IwnnDB9yBJAthSc49udj3gJjTX7LU8rQMID8gYIg1ZDMzUbaO4K7c8rMrdra3BTgpsGiWuKIQwjxWEsKSJ8wxn1zFe2IqpvqZ84VRnrgCbQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808125; c=relaxed/simple;
	bh=NbfQ/er93j+YTx0G2wL4cfyKLnqXJwMQXHVMvmBud9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUAMS+HALz4cexk5xfnheRmINF+u6x1tVtfcWVH/s+xKowLsm5LJOYGj2kbRJkatBRnJYgZiKygY4A+mHXLhclRo8utCJhmLKTVk28hoNq3ugfjlxOt0UrZVNlgLCJz73snCcThy1PqwbOBzuvLvK0yfAZMRF682XIb4ISW6yx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFOXfhg/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFOXfhg/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCB1C4CEF1;
	Wed,  7 Jan 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808122;
	bh=NbfQ/er93j+YTx0G2wL4cfyKLnqXJwMQXHVMvmBud9I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZFOXfhg/q9nwFrqzImOqWLcX03sCwO+oDrlonQQ6YspNXmoeHJHi0duL+J22gcr5d
	 PGuq6GJ14JAUm9RTY6hNfqvgmfAxZL6Gkkl5/EkfmVBXstySl54tuNlFtHg8oGPTPw
	 l6WzvCHcQ3AMwZwMT/64IYfBWk8Z1gZuihbPaGbS385iXRrHen04iRvYRAeKdP3tvb
	 ccgDeuDYDyLlSc0OP2zVYctqOk50MWPzdC02flVqbpdCJ4vrdMuduF1OHm1fj46RZK
	 0T/b4+WEitkHL9DCWOZAnrkllAjflOMfqzoN8nqW0aN4L2NBb8pwkxm1woQx+LKG4r
	 /HfBWj+EXo5Cg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id CDD6BCE04A5; Wed,  7 Jan 2026 09:48:41 -0800 (PST)
Date: Wed, 7 Jan 2026 09:48:41 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jonas Oberhauser <jonas.oberhauser@huawei.com>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"lkmm@lists.linux.dev" <lkmm@lists.linux.dev>,
	Olivier Dion <odion@efficios.com>
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
Message-ID: <c284bd91-c27a-4e12-8d7d-82def9798fc8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
 <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
 <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
 <c7464e0027f9403191d0d3638558bccd@huawei.com>
 <9b839ad6-eeb4-4b95-b471-ff1058e1ecd8@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b839ad6-eeb4-4b95-b471-ff1058e1ecd8@efficios.com>

On Wed, Jan 07, 2026 at 09:40:56AM -0500, Mathieu Desnoyers wrote:
> On 2026-01-07 04:38, Jonas Oberhauser wrote:
> > 
> > > liburcu uatomics and "cmm_*" API initially aimed to replicate the LKMM in userspace (note: this was done circa 2009). However, starting from liburcu 0.15, we extended the uatomics API to support the C11 model
> > 
> > I expect the C11-style-semantics will have a lot of friction with RCU (at the least because of missing dependency ordering).
> 
> * RCU publication guarantee:
> 
> C11 has the "consume" MO (which we call CMM_CONSUME in liburcu) for the
> dependency required by rcu_dereference. AFAIK it is implemented as the
> stronger "acquire" MO on most toolchains today though. For those who
> really want to keep using a volatile access for rcu_dereference in
> liburcu for performance reasons, we introduced the
> URCU_DEREFERENCE_USE_VOLATILE define in liburcu. This pairs with a C11
> store-release on rcu_assign_pointer.
> 
> Note that the CONSUME MO with store-release pairing is required to
> let threadsanitizer know about RCU publication guarantee ordering.

Sadly, memory_order_consume is being deprecated in both C++ and C.
Given that (as you say) it was always promoted to memory_order_acquire,
this is not as much a tragedy as it might be.

Yes, I am thinking of replacements, as I have been for more than ten
years, but this is not an easy one.  Lifetime-end pointer zap and OOTA
have higher priority.  So if you have ideas, please do not keep them
secret!

> * RCU grace period guarantee:
> 
> For the read-side critical section (rcu_read_{lock,unlock}) pairing with
> synchronize_rcu, we've updated the liburcu read lock/unlock
> implementation to use either atomic thread fence as full barrier or
> SEQ_CST stores. We've also introduced a urcu/annotate.h header to help
> annotating memory access groups. This helps threadsanitizer track the
> dependency ordering inherent to RCU grace periods.

The atomic thread fence is for threadsanitizer's benefit?  In the MB
rcu_read_lock() and rcu_read_unlock() case, is barrier() or a light-weight
asymmetric fence still used?

> > Things like rmb and wmb may also not have a clean formalization in a C11-style semantics.
> 
> Right. We've been moving away from cmm_smp_rmb() and cmm_smp_wmb() in
> favor of explicit C11 acquire/release dependency chains within the
> liburcu implementation as of liburcu 0.15. This facilitates integration
> with tools like threadsanitizer. The rmb/wmb APIs are still there for
> legacy reasons, but users are encouraged to move to a acquire/release
> model when it makes sense.

Sounds good to me!

							Thanx, Paul
