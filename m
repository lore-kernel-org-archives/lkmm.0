Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5721B35BDBC
	for <lkmm@lists.linux.dev>; Fri, 27 Feb 2026 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211635; cv=none; b=p1+wpOVff8urInqbneUYeXsXoXWtADlxmL/N6zH/TDksgK6pjhANU32L1TD6HV3ONBwXsWuH571siDNx+w0bPo+NyR8bOrZ3L6Dv+tMDjAOwSYdGKXZmOkomnAzYQVx2DVe4MUzwdm/UW5JAL9BmxUdTFPJ66EQyCzu8cL/2ukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211635; c=relaxed/simple;
	bh=7YD9jAVjWCDsjoaYpV+aypTDMdl99H+ZTL32bN/H+O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjOPvk28epusJ4d4F5FyEUfi4OA/TyQjxLxBRQqJBlfYgMWda69/n0LBR233JwdATtVk1ajiNJyZ/SgwHR+z4mBDt8rP6b2ofG2AEoYASnyh2yoR79f9hnXFkfht/84AMOjiTJOykAtnyXktSryy2E+fJuAtcgV+pnWqN/5qdwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mykLS7Ky; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mykLS7Ky"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-505a1789a27so13995351cf.3
        for <lkmm@lists.linux.dev>; Fri, 27 Feb 2026 09:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772211633; x=1772816433; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q632p5k5HIhX1voseqCzyNwQgf7bQCIjs7aoYu62cBE=;
        b=mykLS7Ky1nG9kXOlgjesN4WLf7SevXnHMjKkeBsfYz7L6A/CcnyrcnFtKskgZQ+Pu3
         Pc9MNam4+zQQfmtmxTxjdUUwC3JRDhqwEtbh/A6dQt0JO0MR4n5k9uk4LRmxNGnr/7IT
         NhwTfdxHTC/lzz/wn5oqsfzq3Hm3AHbi+wCYZin3QrGOlX41vuxDKL1TwOuxNSkW76jL
         U8YO3dUt1CFxDynZ05WNaSyYuvT3jbDXHr01YiOV8mQNYzoxYfM6OHqeigZffH4UWaN9
         ZOC5PXTjsBMwt27q90+lnQqlkNNlPaWcoNW2P5V6q9aeaBKzTA0wbqU/C1upl0chiaK3
         4Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211633; x=1772816433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q632p5k5HIhX1voseqCzyNwQgf7bQCIjs7aoYu62cBE=;
        b=sQzP50EL/q1pT2yzoJHAsgjMcozJLU71XKcd5yIB3IYI6YivDkPK8oGDm5tHP2ClWv
         9qhMGkrI9TQCqvnlSy/VnFZvcpMi8ImzboQUjm39iJxRQxxLkDz5rqgFEQ3RXw9p4kES
         LxzLq/KK5Y+1w1RLPw5+zaZSQpQHHp9DTWEHtU2Hp63SyKXwBWZjD3AjYQGfO1LGwcqM
         1etTWfa+Rp1tZaaZeGkLDRcRI1T8Lz5qVbBTCciWZqGjroW75ufFIZc00uKdS8BDcQbM
         nAeZelRh3W3aGJsQ/40g7ARk01aVdHAsGnDT7oc2WlWCKQYPTuqQ/bM21VxqNhx9Wxub
         YD1g==
X-Forwarded-Encrypted: i=1; AJvYcCVx7ieBIeJjB0DZQQVV3tGZQt1Rbe3hIegirD4zlfF2zWn3k+dfJHq4b+PspOm5snnYA17q@lists.linux.dev
X-Gm-Message-State: AOJu0YyySlJ4g4vmc3rj6yk5xyfj9rqDzXc2xqIEMiexMwSgeWdPCdaN
	QRIjgpAzuCYEk0WgmzcHDWHjbAJkRMHMlrccVEZ0Is6taTCPv8JKYNynuTVwPkwi6g==
X-Gm-Gg: ATEYQzx77a7d9laysQttZfnNDgh0/njwUcU7PqpbwQ6n1zr2+vyJIDrrfZdmn2piXh+
	IaxWCKqY5MncaX+7QQjSWtdc74On0bErw6DEXgWDssAqEdmrziWa6JjGICXSNoe7RkyEUIIloel
	BfY/WCpL5s3PsqcWc6nihBtws92zXO+Tfs48zvdr2e/GduVL9X+LRsA3cYpQdNgBelsZF0HzJ2f
	9Z8nh8OgTxXf5VqAPByg63SA5k+OoPxVZG7FgrNXUxfcmBA2NtRl42lRBF+aM8CixbRJoRa82qr
	j2yrIkDW2H0jqcmCRD+aQUZqUidTDFtQsLthrr7PhgqTaSMzhhDDiVGC3xwitWdgv3rkRYwdcaI
	l9s1lSavkVKilZ3Zt8vLgT86dCuaSelHtBPyxYFg0aNBQhYxy+aWDdc4tdIJPgx8vVKYIgKgB1G
	WGhiSHUB5hPbpo8U3Olrv//wTu
X-Received: by 2002:a05:622a:204:b0:507:358a:2b11 with SMTP id d75a77b69052e-507529dc2e0mr45494721cf.67.1772211632498;
        Fri, 27 Feb 2026 09:00:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda0asm53695991cf.24.2026.02.27.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:00:31 -0800 (PST)
Date: Fri, 27 Feb 2026 12:00:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: linux-mm@kvack.org, Dmitry Vyukov <dvyukov@google.com>,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Akira Yokosawa <akiyks@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Luc Maranget <luc.maranget@inria.fr>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	David Howells <dhowells@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>, Boqun Feng <boqun@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Pedro Falcato <pfalcato@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>
Subject: Re: [BUG] Memory ordering between kmalloc() and kfree()? it's
 confusing!
Message-ID: <556c5caf-c453-473e-ba92-f49ac34053a0@rowland.harvard.edu>
References: <aZ_lJAqxh_hNGr_v@hyeyoo>
 <9dcd02b9-42da-455d-aa08-165e6ff0b921@rowland.harvard.edu>
 <aaByMLSAIJM8HdbO@hyeyoo>
 <d8308828-ed28-4650-8c8f-22a7e5cfd1a0@rowland.harvard.edu>
 <aaB-1e1LoxkcYl2f@hyeyoo>
 <9240040d-598e-48bd-b802-bf91cce92d0c@rowland.harvard.edu>
 <aaGP1Se8vkBhn9uj@hyeyoo>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaGP1Se8vkBhn9uj@hyeyoo>

On Fri, Feb 27, 2026 at 09:36:37PM +0900, Harry Yoo wrote:
> > Which is: The same mechanism that the slab allocator uses to ensure that 
> > CPU X and CPU Y won't step on each other's toes if they both run 
> > kmalloc/kfree at the same time should also be able to guarantee that the 
> > metadata changes made by CPU X will be visible to CPU Y if Y manipulates 
> > a slab that X just finished with.
> 
> Within the slab allocator, I believe there are sufficient mechanisms
> (either spinlock or cmpxchg) to prevent CPUs from interfereing
> with each other.
> 
> My earlier statement "Because the slab allocator itself doesn't
> guarantee such barriers are invoked within the allocator, ..." may have
> caused some confusion. To be clarify, the slab allocator of course uses
> proper locks and atomic operations to avoid CPUs interfereing with each
> other, and yes, those mechanisms should guarantee that the metadata changes
> made by CPU X will be visible to CPU Y e.g) when the object is transferred
> from CPU X to Y within the slab allocator.
> 
> What I meant by the statement was that the slab allocator doesn't provide
> enough barriers to ensure correctness when a user performs a drive-by
> free on a different CPU w/o proper barriers.
> 
> Hopefully I'm not missing your point this time :)

You got it.  :-)

But since I don't know anything about the details of how the slab 
allocator works, can you explain in more detail what the locks and 
atomic operations are and how they prevent CPUs from interfering when an 
object is transferred from one CPU to another within the slab allocator?

In particular, which part of the mechanism fails (or doesn't get used) 
when the object is transferred by the user with no memory barriers?  I'm 
trying to learn exactly how these two cases differ, because at first 
glance I can't imagine how you could accomplish the first without also 
accomplishing the second.  It seems that transferring an object from one 
CPU to another within the slab allocator should be very much like 
transferring it from the slab allocator back to the kmalloc caller.

Alan Stern
