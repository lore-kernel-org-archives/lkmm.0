Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209383;
	b=r0vJf+qxLPTSSmnoPgEsEArOvBhRQjCAHo41FIwYuoibqS3CSJtpM6fsFob/EW9p47Yu
	 6ZASDzfVeeYHA7i9nEi32wMwXOT00mOD7BJ+4knKXi2evUgcbv25xzuyqOAgbV8K1HVmN
	 3qnfsbjXYs+adLUx2CDTwDyfcGhj0BzjNrjyEg2k7SGg8+RkjS10u27YSiXYGOM8iftZb
	 rAGP6KZAXYCmshyx+wAcIKLBCqDdROR04ruZxyPdsxbKVE/jDr9eAsTZvuEqM8mTMhx7D
	 Oa/z/tFjKAFSoD6h9BfBbAWA/Bf6Rl7fXLa89Nd+WhpHEy6/29JFqyqxUN+wXG6ygdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yC48FTMsUgzSk9jBlQCuVA4QoNQ1VfqyYKPOu4/ewxk=;
	b=wyKUxqdw7rDRnN2PCEmg7eyJLYaZgSdL0BZ8s7MjiuylSLC4tsOCM+c6b9xTdRBolWX1
	 B+Q2Q2OppQr4j0vJ2CC8o63qtZfXiq0wsDsZ0Fnr1BV6KtPjshWD3CeBKU58kelh4n+1Q
	 NC2W0EsipiCwaHlzZ2JDtH+8b/l5nbMPdE2yj8lhbUPbgTYatF2e8RkEaFBj2ao8hR8/z
	 eXOOQazLfaBLBbwP7MF1u18/F0QwgChnsuSMlVrk82rVKPN5coHry7bCps2fDRXLRhM0d
	 2LMFXUjhMo3xLFPQOefEsh7Gry3L72V/fdGRUVSUKjSjnNrFmfkJ27Yy8a7MAWfF3Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=SiscPE5+;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB02606A685
	for <lkmm@lists.linux.dev>; Fri, 20 Nov 2026 21:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB02606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=SiscPE5+
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-536c8f958d7so9830001cf.1
        for <lkmm@lists.linux.dev>; Fri, 20 Nov 2026 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795209382; x=1795814182; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yC48FTMsUgzSk9jBlQCuVA4QoNQ1VfqyYKPOu4/ewxk=;
        b=SiscPE5+Ln0jbbboSYSe/BQ9xuoIVzyRB3JvJ+XXA19bZrUK8wDV1+S3PIvLlYNbtr
         iJjvEN+Tqq0c3GEV/TgcruMakt85NKzTuOF5kYzckMrmali3v0kJoJKynGefS7b02y3F
         hotBFxCp+y+FzgIBZ9AvkWETDaiBqKf2Y2970Q3C//TaRnCNc/ZmiAqT0Nmy/0AMFDy2
         Wal7qkrZ1j0+0msNfmYLvNgWtA7XKseq+QbV5mIowP0pOFJE08as505yht1Stne6lpcS
         W0oLE6T4IDfBbWRWYY6NLSp3IQypivB8qCjKrMQ4SoCo8JrSpQYLKFq3h4vRgD9yjzoI
         TQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209382; x=1795814182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC48FTMsUgzSk9jBlQCuVA4QoNQ1VfqyYKPOu4/ewxk=;
        b=zOjO4eQbIJckfKDzCJBzmMd8dbms1bmeg209n5aZa0EtAT+clY6ZfbfVQBZb6am/9R
         wVrFnMRO143ht9OD57H1wuEdZISdvK42XHOSxZfoY0dfEKs3DsQzQZWkkIB29+1rYX0M
         iEIxKGRv/jYTljpQbvIk/vuA6tXrshLcYD1G0tSkArRrudTMok2HxdyClJw1DWOEgyUf
         XQD2WSnYDTKRBN358D/Kvh8Y16vVzmhFWz51W6lLFB/ootGovFewOFdhUWsUAmWsM8aF
         0hPT00c9on86Z3naDtsZnRVBgQLBXOqROlVDQp8JL1OU7Rk/AuVXUkqvy7XpbhJkx7qU
         8ljw==
X-Gm-Message-State: APuU4Z+hyP7J+FuR3sJZop/rKFK4h6FryH2vymK+eT8UeHurTqhYJgKq
	GeX6Zs1f9+J23083bvSn9PHQMh5U9uM/SKmJh0bBpbThJG+5iBe9ND0BLZBD/8h2tg==
X-Gm-Gg: AYBFou2/8L11wPsx5rtwItJmPTKcGRQn7aS5r7VXx/2qBLFKsKyPQRbELKv8wNz7ep0
	V8jKvPOoTuJ+68N57lTAhXC2iHN0mKZAdbMfsaeL27Jw4s3ZYVdTYpbk7P+q4icOaGXBz8Fh0hN
	/CQKTqzGfyHVBxECMSIiKEFtzh98A3u/8DHdxnmpUiLzAwygSv3tf35499jBSbtWTXz1YbqMC62
	3juA5rz/j0fa/jPYXmlGmBDsLOF32UxXx1pjjTFkQHfPjsnPD/GKpg/l4oQfPKV//rRFVU/A1U2
	/w7lIqd6Mlvllk8pzqx86gOsTOkmFffl0jbEoJpGtEFByDn7kkvAx0KTIg08dgbjvN45ADOFxQ1
	eopC7nJwOTV5X2+RvlgaQuIhcjWIUjv/qEaM/lPz4gOiRPDOttbbtry9tvaawYdurosN6Q6h7+o
	XCBWgO6Zf5kp+Ke/CMui7c+33Sd1ee0uZo3gIqhD+8UMiCsXVLjVHytRq54xXr0CVnD6HONt3YG
	BFJqJZK36WKipcaR0NvpkKdzS/NJJP4ZSxrUB17x3wP2auk3GKNZbgqqtWWJt5TqUJHJpDR4S0c
	jEqggw1cxqjfPX14Vf5wAPX4Ds1dK3VJrI5Vz0c2AA6Ffjpvx8tv
X-Received: by 2002:a05:622b:cc:20b0:55d:8485:d5b0 with SMTP id d75a77b69052e-55d8485d62bmr25446151cf.70.1795209381619;
        Fri, 20 Nov 2026 13:16:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78811fd5sm33943201cf.8.2026.11.20.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:16:20 -0800 (PST)
Date: Fri, 20 Nov 2026 16:16:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Wayne Yan <wayneyan@google.com>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Mars Cheng <marscheng@google.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: Question on (prop \ id) & int excluding non-trivial self-links
Message-ID: <e14d32d9-1734-4e55-8ad2-9c8aa0b49c9a@rowland.harvard.edu>
References: <20261120083620.2186353-1-wayneyan@google.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120083620.2186353-1-wayneyan@google.com>

On Fri, Nov 20, 2026 at 04:36:20PM +0800, Wayne Yan wrote:
> Hi all,
> 
> While experimenting with extending LKMM to model MMIO semantics, we
> noticed a subtlety in how hb uses prop in linux-kernel.cat:
> 
> let prop = [Marked] ; (overwrite & ext)? ; cumul-fence* ;
> 	[Marked] ; rfe? ; [Marked]
> 
> let hb = [Marked] ; (ppo | rfe | ((prop \ id) & int)) ; [Marked]
> acyclic hb as happens-before
> 
> Because every step in prop is optional, (x, x) is in prop in the
> degenerate zero-step [Marked] case, and hb uses (prop \ id) & int to
> drop those trivial self-links.
> 
> However, \ id removes all self-links, including non-trivial multi-step
> paths in prop from an event back to itself. Semantically, such a path
> means an overwrite of A must propagate back to A's CPU before A
> executes, which should be forbidden as an hb cycle rather than
> excluded by \ id.

True.  But consider: How do you (or more accurately, how does the memory 
model) know that the overwrite reached A's CPU before A executed?  The 
answer is that there is some load B, on A's CPU, which happens before A 
and reads a value that reaches that CPU after the overwrite does.  Then 
prop would establish a link from A to B, as well as the link from A to 
itself.  This link from A to B, combined with B ->hb A, is enough to 
rule out the execution.  The memory model doesn't need to know that prop 
links A to itself.

There are other cases you can consider, such as when A and B access the 
same location.  But then, even if A and B are the same access, the 
execution would already be ruled out by the coherence axiom.

> In the current model, this seems harmless because any candidate
> execution with a non-trivial prop self-link is already rejected
> elsewhere.

More or less as I said.

>  In our MMIO experiment, some of those self-cycles were no
> longer caught elsewhere and leaked through because prop \ id stripped
> them.

As Jonas asked, how does this happen?

> Defining a non-empty variant of prop and using (nonempty-prop & int)
> in hb avoids dropping real cycles. Is this a semantic issue? Would
> patches for this kind of issue be welcome?

There doesn't seem to be any need for them, especially considering that 
the memory model is not meant to apply to MMIO.  In fact, you would 
probably want a completely different memory model if you had to cover 
interactions between CPUs and I/O devices.

> Note 1: Here's an example where A ->prop A:
> 
> C prop-self-loop
> 
> {}
> 
> P0(int *x, int *y)
> {
> 	int r0;
> 
> 	r0 = READ_ONCE(*y);

Let B be this READ_ONCE() access.

> 	smp_store_release(x, 1); // A
> }
> 
> P1(int *x, int *y)
> {
> 	WRITE_ONCE(*x, 2);
> 	smp_store_release(y, 1);
> }
> 
> exists (0:r0=1 /\ x=2)
> 
> In the candidate execution with 0:r0=1 and x=2, A reaches itself in
> prop via coe ; po-rel ; (rfe ; po-rel).

But also A ->prop B via (coe ; po-rel ; rfe).  And since B is linked to 
A via po-rel, there already is a cycle in hb not relying on A ->prop A.

Alan Stern
