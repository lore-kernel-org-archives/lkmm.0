Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163784;
	b=RyP7+MocmmaAG6MGsgkWjZ2ZqYWApUOTPoeUx1g0HAn3C/m9wz62nZvYhNlxOw9NhJCG
	 KJ3+UhJnufq1V5HhBQi2ShxzFnpSWzfI/s+1qNCO47OBXIcEBtVWC5fjfcwfwtarGrjDc
	 ThQ9FhpUU3mWD+Xwwhj/kbTyhpFoeW/ePz4eDdkmQD/nZx6lB85O/UTZEFURbxnpsoK0t
	 TNKVhKKC0RYxLZGFemGz1HtWvhlTan+OIdeOvyLCWXG5JdvLRmrtsF8fHGA3pQ+r5T9D1
	 hwOx1oDDUS5xmwbk7+tz00TfFfJxDX+O8kjrSPzVDG+ilQDAACGeumrMAWwZJ9To7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=0lKUc8C/gyZhGaTL2gzUmAz+oRQN67l0txxqZPe6hks=;
	b=AOY5oIal122S7KUV9ohWIvThO02fTJ61u7Raq5Okzg1/PK2vho8RgqBMufvHe6lBY3b+
	 g0MNLC/3fWHog7dF0EOqAqz9qTxkuMkazK0OEswpw2wO5B4OR1qtQHqjkDEeBpGmGT/Zm
	 A4SN5W+sbRhmDO9vFtkgy+6oAJpnyShKRy6kwamaQG5/hnXZDR7fjVC3MAzo+bIWydQ92
	 D76q5QgUI3icDYYQRnq5ty9gvNPAUNVMEhWeEfT74ITcy+fAtOOtLRInHjrgsj7lp5b6W
	 k21FbDVNb7V/2A5gDPPSoc24FYfhkKV5fSDiaxUhlqGdyd7Iz7aML0sTYlF/R+WEGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BCs/I4hk";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE16606A325
	for <lkmm@lists.linux.dev>; Fri, 20 Nov 2026 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE16606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BCs/I4hk
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so5938435ad.2
        for <lkmm@lists.linux.dev>; Fri, 20 Nov 2026 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795163783; x=1795768583; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lKUc8C/gyZhGaTL2gzUmAz+oRQN67l0txxqZPe6hks=;
        b=BCs/I4hkl8ZfQlt2sopIpRLHKmkA4klarSnB4KVcVTkQKWukldfXxC0Gju2DgFLZRz
         WfkrEklSHZ6uoMpxYWnpi+ftXQBu0oC94qZDtW0eCQwPcECPYMJvKwohgCjLGyulamKX
         ZYttjtKtOkbOl/nVt+IyAPDTov7sAR2kd7tPCT9jXQsyInoOVrgRMso3LnrMSE8VqBJ3
         WcjMLafYK1szy3D9ngSmY/4BM332TYum+0z2wtBx5qCpLZVNt/6I8HDDCsMyqfAo1Jzv
         7QGnFlAiR56i25W0GJfRj8W9jC0VovKZPypP47jTF0brnpyLw3Ea5/eR2ptxj5Q+EidQ
         YQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163783; x=1795768583;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lKUc8C/gyZhGaTL2gzUmAz+oRQN67l0txxqZPe6hks=;
        b=uVGOrSBYn/ZVKmasL/bIORcMefw9v0n/u94NBpXe1tqOZtL9J0kZZ4IEJJHP/JuRUh
         kLjQ0RlAeoWVCnCvq7+D6mQAH2ynw6f5lpOxpV1pjvkDaih4N/2lijTcZfeQB+cDEtoE
         CxbmJIA2A3wlM0Un2NC4x+wmM/EFxwvmoExC8Ajq44cxQ3D7HxWTPrCnqKf/VVZdNwMK
         UTMPUaYMtLpNrYN97sLgXonuquOMx5VcXtbCD+0xreyeDeVftpoAOJ7eJ0IZUY6rOnFR
         tL0NJqNpGM/Hi1YGIdL5UNeVBiE1GsLZHViUx8LMm+sVanViJn74NP1v/Fu0tU7he/OD
         Vmxw==
X-Gm-Message-State: APuU4Z8alSOQYjYMShbQeuC7FaOAqMWioaOX5SnMgDfQNoy3zZvAF5sl
	wdJSsX26OWBFKbm5ifL8Ci62QOcs/VzREyGI//BLfB7Kh6Pwq8pXCaSc3kQ9j/gpseveVhJ+D9E
	ffj7+xVRcuA0pgN17KovGQXZYaNKH6OL2cP209WfAXediB3rYfIsdjyQZEprQsha6wbfYg9/sUB
	SZymd+fzbBfmneE0+xDfCdxS2lCZHSyL3t1YwKBRyKaQED
X-Received: from pllh10.prod.google.com ([2002:a17:902:748a:b0:2f0:31d5:4411])
 (user=wayneyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:db11:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2f03ef870c8mr26725135ad.2.1795163782800;
 Fri, 20 Nov 2026 00:36:22 -0800 (PST)
Date: Fri, 20 Nov 2026 16:36:20 +0800
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120083620.2186353-1-wayneyan@google.com>
Subject: Question on (prop \ id) & int excluding non-trivial self-links
From: Wayne Yan <wayneyan@google.com>
To: lkmm@lists.linux.dev
Cc: Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	Mars Cheng <marscheng@google.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Wayne Yan <wayneyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

While experimenting with extending LKMM to model MMIO semantics, we
noticed a subtlety in how hb uses prop in linux-kernel.cat:

let prop = [Marked] ; (overwrite & ext)? ; cumul-fence* ;
	[Marked] ; rfe? ; [Marked]

let hb = [Marked] ; (ppo | rfe | ((prop \ id) & int)) ; [Marked]
acyclic hb as happens-before

Because every step in prop is optional, (x, x) is in prop in the
degenerate zero-step [Marked] case, and hb uses (prop \ id) & int to
drop those trivial self-links.

However, \ id removes all self-links, including non-trivial multi-step
paths in prop from an event back to itself. Semantically, such a path
means an overwrite of A must propagate back to A's CPU before A
executes, which should be forbidden as an hb cycle rather than
excluded by \ id.

In the current model, this seems harmless because any candidate
execution with a non-trivial prop self-link is already rejected
elsewhere. In our MMIO experiment, some of those self-cycles were no
longer caught elsewhere and leaked through because prop \ id stripped
them.

Defining a non-empty variant of prop and using (nonempty-prop & int)
in hb avoids dropping real cycles. Is this a semantic issue? Would
patches for this kind of issue be welcome?

Note 1: Here's an example where A ->prop A:

C prop-self-loop

{}

P0(int *x, int *y)
{
	int r0;

	r0 = READ_ONCE(*y);
	smp_store_release(x, 1); // A
}

P1(int *x, int *y)
{
	WRITE_ONCE(*x, 2);
	smp_store_release(y, 1);
}

exists (0:r0=1 /\ x=2)

In the candidate execution with 0:r0=1 and x=2, A reaches itself in
prop via coe ; po-rel ; (rfe ; po-rel).

Note 2: Here's an example fix:

  diff --git a/tools/memory-model/linux-kernel.cat b/tools/memory-model/linux-kernel.cat
  --- a/tools/memory-model/linux-kernel.cat
  +++ b/tools/memory-model/linux-kernel.cat
  @@ -99,14 +99,16 @@ let A-cumul(r) = (rfe ; [Marked])? ; r
   let rmw-sequence = (rf ; rmw)*
   let cumul-fence = [Marked] ; (A-cumul(strong-fence | po-rel) | wmb |
   	po-unlock-lock-po) ; [Marked] ; rmw-sequence
  -let prop = [Marked] ; (overwrite & ext)? ; cumul-fence* ;
  -	[Marked] ; rfe? ; [Marked]
  +let nonempty-prop = [Marked] ; (
  +	((overwrite & ext) ; cumul-fence* ; [Marked] ; rfe?) |
  +	(cumul-fence+ ; [Marked] ; rfe?) | rfe) ; [Marked]
  +let prop = [Marked] | nonempty-prop
   
   (*
    * Happens Before: Ordering from the passage of time.
    * No fences needed here for prop because relation confined to one process.
    *)
  -let hb = [Marked] ; (ppo | rfe | ((prop \ id) & int)) ; [Marked]
  +let hb = [Marked] ; (ppo | rfe | (nonempty-prop & int)) ; [Marked]
   acyclic hb as happens-before

Thanks,
Wayne
