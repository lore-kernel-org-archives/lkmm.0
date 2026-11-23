Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408397;
	b=3rS+IfDMt8ICkxGSwIKfYuXrAPpS/FhQ/MInbEUd7XuDjLafKahOW3hlsdWgrC9CZM7f
	 mX++RxMMQyEI2lL0uf35wAFaTwU/HTnbnmGDU7BHsoF4eq3J7CAV2SJoMBAHodjSdTRaX
	 UXFjKlpBYZ/bHSBPli6WHkRiCZip+y6tB1j3PInZgqiEBjfm9Alq87O2PG/0SDyEEypJu
	 s8VyXC7xgLz71+c2JdYJOO7nt1tLsCs7HrT9dY5bpsEL0+Pyp3VfqA7FDXCOMzz4E+Q4b
	 xnxlOCSu7pLXuTHUJ9+zNK7F7iuojerkf73ArfU/Pcwk81T1kcdCp+ZWqMLgE5dvOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2igfz4o64f3h+SJ6EV7b3a22Ao4Z+RGhRptKFvD0FuY=;
	b=MbByOAzATEMdaV03qasxLqHmAnbBfPyGf6HvZ779FTwyZcWhUj7zQH304l6DIGQD568j
	 icSo2evp5aI/xKS9yLo36Hzo2fX4lI66LJ8W9S94urLM9I2Yrfl1I3eWemfvl4H4zanUW
	 nuk2634m7+7oA17KaDXhjXfZ9sH/fGbEGBH3ciCUEAxqIZiHL/vyK97I1YNeWeP1AZo1U
	 +65SZub+sMt4pcoltiZfe+jPzMW+955nxmf3brJ8nFE52GrDCIprXIFnMJGRdtsP4MXkX
	 VSvI6AbKCC/a9nLZBWUb5n2eBxU4/ZmP6ZtDEkrpz8f24BGnsjuHLlaNCWIl1XDlKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bScARQu2;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F87606A31A
	for <lkmm@lists.linux.dev>; Mon, 23 Nov 2026 04:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bScARQu2
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b45655b428so1723386a91.0
        for <lkmm@lists.linux.dev>; Sun, 22 Nov 2026 20:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795408397; x=1796013197; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2igfz4o64f3h+SJ6EV7b3a22Ao4Z+RGhRptKFvD0FuY=;
        b=bScARQu2Z7t1TD8l07ie1bWVaKLBNZgcWGvoU5/rwrtchHBrpnPKyLdN/62+DS10jq
         3W0V7eLjmED7mFRBTBnmgbD0FpOmrsrtEk8b3W3rKl8gcRGI3uWus3ATXZljDfMuogrR
         lqmYBv6o74IQfUzzwFby9dertH2q0WKbKtFY8CJkmsD1c9bHAyIeDkaaAu9M57JN5JK/
         npCWg7Ih+Y70Myi+RHQ4/Yk202TzCnNNVVs8560fsok73FoumYecc481UgD/vJqrRvLz
         ykOQ1FR5Qeb7aXdGNy4sxwnUWgQkQ49WRB//gGa50khIgUcUDzjCplFAeiq4AOnubFp9
         zP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408397; x=1796013197;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2igfz4o64f3h+SJ6EV7b3a22Ao4Z+RGhRptKFvD0FuY=;
        b=ptX6vauAher9DaMklMF78mwPDZy07Vo4uCGpUV3kN8cvKLq5rSDfiGFV5MR7loLNwa
         FrixlIoVSLVgWCDxTJn3z/cviAC5DmvRs9XnaTZ72kGzmsIqpPJRqwejB9D4D9ArIYRB
         Pum/ONQf+evCpCJl89W3A1Ql8EcuOhyNy/1GDXBSHJIJzkzeCkGk1tIvI4pIDH9WZjih
         /JxduyjRQ0WQfvlufk+e1t/4IREKcHfscwwk+YCO8oe+Tv+TM6O3ccetnqwdE20rueLR
         bk+04VaMZeUM4Mtc4BaIX4J4N0/chXX3/iYjGd1E8HtLLT9N47PslrJbllOOLvfZPgyL
         Fy7A==
X-Gm-Message-State: APuU4Z9s6pk57s4gfJKGEUSbQmYXMWn+HAdZW3+LdxZzjndocv0JqA9U
	VcOKT4SrQ6v8NInLAAH+OqPh47n5Hl/3w5rfQzrcoRinRVZTxF3xBQaDN0NbcwDMLg/SCCTXj2e
	3VINx7RR+c0jOeA==
X-Received: from pgfy29.prod.google.com ([2002:a05:6a02:851d:b0:cdd:ad4c:6247])
 (user=wayneyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1649:b0:3b1:2810:dfd6 with SMTP id 98e67ed59e1d1-3b41cb50c4fmr10169858a91.64.1795408396621;
 Sun, 22 Nov 2026 20:33:16 -0800 (PST)
Date: Mon, 23 Nov 2026 12:33:14 +0800
In-Reply-To: <e14d32d9-1734-4e55-8ad2-9c8aa0b49c9a@rowland.harvard.edu>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261120083620.2186353-1-wayneyan@google.com> <e14d32d9-1734-4e55-8ad2-9c8aa0b49c9a@rowland.harvard.edu>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123043314.819493-1-wayneyan@google.com>
Subject: Re: Question on (prop \ id) & int excluding non-trivial self-links
From: Wayne Yan <wayneyan@google.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: lkmm@lists.linux.dev, Jonas Oberhauser <jonas.oberhauser@huawei.com>, 
	Andrea Parri <parri.andrea@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, Mars Cheng <marscheng@google.com>, 
	Kuan-Wei Chiu <visitorckw@google.com>, Wayne Yan <wayneyan@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 04:16:18PM -0500, Alan Stern wrote:
> > In our MMIO experiment, some of those self-cycles were no
> > longer caught elsewhere and leaked through because prop \ id stripped
> > them.
>
> As Jonas asked, how does this happen?

Jonas is right: I put an ordering relation in cumul-fence and didn't
put it in hb in an earlier draft of our model, thinking that since
cumul-fence is a stronger guarantee, putting it there was enough.

Specifically, I was modeling Rule 2 for readX()/writeX() from
Documentation/memory-barriers.txt:

  2. A writeX() issued by a CPU thread holding a spinlock is ordered
     before a writeX() to the same peripheral from another CPU thread
     issued after a later acquisition of the same spinlock.

as:

  let in-spinlock = ([LKW] ; po) \ ([LKW] ; po-loc ; [UL] ; po?)
  let mmio-lock = [Mmio-write] ; in-spinlock^-1 ; co ; in-spinlock ;
  	[Mmio-write]

and put it inside cumul-fence after restricting acq-po/po-rel to
normal RAM, per the rule that SMP acquire/release and spinlocks do
not order relaxed MMIO accesses.

Once we added the proper MMIO hb edges, changing back to prop \ id
changed nothing, so no upstream change to prop is needed.

> There doesn't seem to be any need for them, especially considering that
> the memory model is not meant to apply to MMIO.  In fact, you would
> probably want a completely different memory model if you had to cover
> interactions between CPUs and I/O devices.

On this point: our goal is to model the CPU-side ordering guarantees
for MMIO primitives mentioned in memory-barriers.txt. Since driver
code uses them alongside normal RAM accesses, spinlocks, and RCU,
extending linux-kernel.cat seemed much more practical for our use
case. Do you think it's wrong to put the CPU-side subset on top of
the existing linux-kernel.cat?

Thanks,
Wayne
