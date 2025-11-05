Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14A26FDB3
	for <lkmm@lists.linux.dev>; Wed,  5 Nov 2025 18:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762366801; cv=none; b=J+0LLaSBSdtj0SWR2kJbmaieM1GHh5R4+WBjIH/WofaLW50bPKDLIh7wcJ+HXYMe6cPewB210sflxnTtQ32QvngGc1cQ+ZrIKVrZpSiC6N/JAU42Ga9cDAr+tMj8oandNqq36HRZPZeZAsRVYrb9DHZDytb7edFinQNrXJ5anb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762366801; c=relaxed/simple;
	bh=j3CaE6j+ozNLo/L/mjpWL2bZXBO8ohn9wDQZMwJVVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjyqioKcpbLw+FvDzJQGvvGbPccDmFFfOC0jSTDgmJoIJk8ADRgbb3jMms2VGUhy4Qm72fUT/dX9ROD0psJWg7yoMRdS+bXJSIEBi1AM2qydQMLbo0MtRcz9hcSPsMSYgCTYa11wW5FcJbf4PDuVepiVECnQaixnMq7CJEEsCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l++JEF/w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l++JEF/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913F8C116B1;
	Wed,  5 Nov 2025 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762366800;
	bh=j3CaE6j+ozNLo/L/mjpWL2bZXBO8ohn9wDQZMwJVVYM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=l++JEF/wK14PpxVbAjPLQrFlAxVnSb+hneUBOeE4EHd/x/pf4wlKfPTnJyZ2h6amp
	 ra9PeVZGKclvo2SBxY6WBirYgVclAiYIVR0kAiCV/4HulXxta3t5iyKF4YPl6/8qlB
	 bUd8eC6b2AGnw5yKSq6cN64xz3tlRu6C22+uJNNDRNr2a7tCA+y+jaMXptje7wvt/7
	 qxMRSTYjh7SPpHD3I12daj6moAlEJ/xqAgNmXBWObTo1v2zRqumOqRaLIrY1fqf9lP
	 JUhEBjN41f4dQ8pKQQmUVWJrpWVGS9r2F/TVL6ECxPnB4iT8Dm/8QchF+KTXBAkCJ4
	 oHE2REX2eDcVw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ECF98CE0B94; Wed,  5 Nov 2025 10:19:58 -0800 (PST)
Date: Wed, 5 Nov 2025 10:19:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Akira Yokosawa <akiyks@gmail.com>,
	"lkmm@lists.linux.dev" <lkmm@lists.linux.dev>
Subject: Re: [PATCH] memory-barriers.txt: Sort wait_event* and wait_on_bit*
 list alphabetically
Message-ID: <f7314b55-a38f-42ba-865c-4a73c52bcea5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <d06d8be2-5661-4926-8734-d12c30c9e03c@gmail.com>
 <5B57FD50-9F10-41E6-8EF4-87577E57DAD2@oracle.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5B57FD50-9F10-41E6-8EF4-87577E57DAD2@oracle.com>

On Wed, Nov 05, 2025 at 08:48:05AM +0000, Haakon Bugge wrote:
> Hi Akira-san,
> 
> > On 5 Nov 2025, at 04:17, Akira Yokosawa <akiyks@gmail.com> wrote:
> > 
> > Commit 88172700423c ("docs/memory-barriers.txt: Add wait_event_cmd()
> > and wait_event_exclusive_cmd()") added two APIs without taking care
> > of the list order.  Sort the list for readability.
> > 
> > While there, make it clear that this is incomplete by saying
> > "for example".
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> LGTM, so:
> 
> Reviewed-by: Håkon Bugge <haakon.bugge@oracle.com>

Queued, maybe even for the upcoming merge window, thank you both!

						Thanx, Paul

> Thxs, Håkon
> 
> 
> > ---
> > Hi Paul,
> > 
> > Looks like there is no pending change for v6.19 in LKMM.
> > 
> > I think this minor tweak is worth having, if it is not too late.
> > 
> >        Thanks, Akira
> > --
> > Documentation/memory-barriers.txt | 6 +++---
> > 1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> > index 1d164e005776..61b7317bcf2e 100644
> > --- a/Documentation/memory-barriers.txt
> > +++ b/Documentation/memory-barriers.txt
> > @@ -2182,9 +2182,11 @@ set_current_state() may be wrapped by:
> > 
> > which therefore also imply a general memory barrier after setting the state.
> > The whole sequence above is available in various canned forms, all of which
> > -interpolate the memory barrier in the right place:
> > +interpolate the memory barrier in the right place, for example:
> > 
> > wait_event();
> > + wait_event_cmd();
> > + wait_event_exclusive_cmd();
> > wait_event_interruptible();
> > wait_event_interruptible_exclusive();
> > wait_event_interruptible_timeout();
> > @@ -2192,8 +2194,6 @@ interpolate the memory barrier in the right place:
> > wait_event_timeout();
> > wait_on_bit();
> > wait_on_bit_lock();
> > - wait_event_cmd();
> > - wait_event_exclusive_cmd();
> > 
> > 
> > Secondly, code that performs a wake up normally follows something like this:
> > 
> > base-commit: 4356abc63687c65a86ab709db96470540441e822
> > -- 
> > 2.43.0
> > 
> 
