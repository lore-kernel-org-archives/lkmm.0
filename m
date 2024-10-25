Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A41F754F
	for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864586; cv=none; b=jsph7L3bGZbPHlRi73e6GljGc39elI6A6ZoyKCChEXJhKFSxAUbs1duaGKFMMHZgfzljmAcSRxe97MAkJgvTnZGJ2ha8mGrnzQuUKV4besf0QlQfJmMVNnzLh+DGSkiHrUUC7k/qOzFLknkMmsRYv5BSqrrUr1kCidHFtY0/ckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864586; c=relaxed/simple;
	bh=zKEwOFq+EedN6EAwXtsg7YlRMhj47oRVAezZTHhLCuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdDnOYc7wMjVPpfA0Cvn2qC/19+hVR32hh1w18M8eisgeE7oiwRJhh4o80yaNU29pbFdUJvbM4HorqhTLjqSE0JZZ+9gm+fFfFVGay8QYE80xwOzhWCPTORlff1vK/EOCzcE2N1L0DZZ8aC56RHWxg8p9BR1eL/bU4ScFWDjZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFozxC5v; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFozxC5v"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a99ebb390a5so593460666b.1
        for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729864582; x=1730469382; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld/lzUpMzz/O/gUyxVTjcgsBVURqpGeoKpNyId9bOgY=;
        b=fFozxC5vJxH3miGD9ByDzh+KbZPfo31TkwpK2irfwAVnUx8Z22bqn2+ri6oeiChuKz
         inPlPauqVw6EMxmGH3rcx4I8lc6aUXbeH5JsZn3heLLqpIe8nUdyQTaohf/CIzCB5D3c
         QrjNjWOe0bW+iidRukm7dgsQqNE78s39PsPfCVmKyeuwFNIa/vjk8IwG5k2nbscZ0liE
         VHFcxnhpUZDRDUBJ4uwTpvMFVPv5NWbwi7Kvl3chS4q2lmrL/GdEaeo46InRgQaueRNE
         gCiz4/1O91jDDnsklaLiDi7E0+tZcxX6WFP2/P3X7sC30/79R79F0OcLDZgEY+TRyHN5
         a7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864582; x=1730469382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld/lzUpMzz/O/gUyxVTjcgsBVURqpGeoKpNyId9bOgY=;
        b=utjdURtcw4tZCxeSryNRqEFblmQQPRGV2/xrfdn0fev25dCixG6Spf+k5npcRzYQHY
         F9dWXIv2MKDBdin23J3sezJpiV06nwG70HdeCNJzywzV+snaTY/nKshLpa8P4SLEhd3m
         TQnGUnDmQxf9IRCn+9vDHknrTVhrRdkC9XmKH+kJH2/EIWnNBOMuNvaL1wVTs7hn5oXQ
         5F9Gek0LtldvS0p+nQSpVTADKCs9o6uZX0OGGaO1A0gMaWLQ8d+eSofsZm2t1KWh9jqs
         A8P9Ez4p0V/+tMzFBaqOHXktYRqKwcS11x48zJ34H7VXHq0I86spNKpm5bxsRJNrT++U
         jEiA==
X-Forwarded-Encrypted: i=1; AJvYcCX7dTQLsKvbEZfURc6RBWVkFpOxsHIBg76RphmbtLIfLtYQ936Js//4kr6lV2RY9gb4RY+y@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl0fj9KXh0WHadJRTwW/aSxhb6gAyBDCCdQJTgQfDCPtCyzvqe
	+V73ILSTvbP7I+K0IxjT0SVB5GsdIOPOL+vqxdDrqOAy2utvbE59
X-Google-Smtp-Source: AGHT+IHHBPelfDRmV3ElN7dO5ltfgT7F82NL64uGZgXfpVrJ4bY6gR1Y7aYl4TnBcYL8RwxpvjixVA==
X-Received: by 2002:a17:907:7ba8:b0:a99:f5d8:726 with SMTP id a640c23a62f3a-a9ad1a02091mr584361666b.23.1729864581671;
        Fri, 25 Oct 2024 06:56:21 -0700 (PDT)
Received: from andrea ([2a01:5a8:300:22d3:a281:3d89:19cb:ed96])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029559sm73501266b.58.2024.10.25.06.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:56:21 -0700 (PDT)
Date: Fri, 25 Oct 2024 16:56:17 +0300
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: puranjay@kernel.org, bpf@vger.kernel.org, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Some observations (results) on BPF acquire and release
Message-ID: <ZxujgUwRWLCp6kxF@andrea>
References: <Zxk2wNs4sxEIg-4d@andrea>
 <13f60db0-b334-4638-a768-d828ecf7c8d0@paulmck-laptop>
 <Zxor8xosL-XSxnwr@andrea>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxor8xosL-XSxnwr@andrea>

> But the subset of the LKMM which deals with "strong fences" and Acq &
> Rel (limited to so called marked accesses) seems relatively contained
> /simple:  its analysis could be useful, if not determining, in trying
> to resolve the above issues.

Elaborating on the previous suggestion/comparison with the LKMM, the
"subset" in question can take the following form (modulo my typos):

"LKMM with acquire/release, strong fences, and marked accesses only"

[...]

let acq-po = [Acq] ; po ; [M]
let po-rel = [M] ; po ; [Rel]
let strong-fence = [M] ; fencerel(Mb) ; [M]
let ppo = acq-po | po-rel | strong-fence

let A-cumul(r) = rfe? ; r
let cumul-fence = A-cumul(strong-fence | po-rel)
let overwrite = co | fr
let prop = (overwrite & ext)? ; cumul-fence* ; rfe?

let hb = ppo | rfe | ((prop \ id) & int)
acyclic hb as Hb

let pb = prop ; strong-fence ; hb*
acyclic pb as Pb


For BPF, we'd want to replace acq-po, po-rel and strong-fence with
load_acquire, store_release and po_amo_fetch respectively:  Unless
I'm missing something, this should restore the intended behaviors
for the R and Z6.3 tests discussed earlier.

A couple of other remarks:

- Notice how the above formalization is completely symmetrical wrt.
  co <-> fr, IOW, co links are considered "on par with" fr links.
  In particular, the following test is satisfiable in the above
  formalization, as is the corresponding C test in the LKMM:

BPF 2+2W+release+fence
{
 0:r2=x; 0:r4=y;
 1:r2=y; 1:r4=x; 1:r6=l;
}
 P0                                 | P1                                         ;
 r1 = 1                             | r1 = 1                                     ;
 *(u32 *)(r2 + 0) = r1              | *(u32 *)(r2 + 0) = r1                      ;
 r3 = 2                             | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) ;
 store_release((u32 *)(r4 + 0), r3) | r3 = 2                                     ;
                                    | store_release((u32 *)(r4 + 0), r3)         ;
exists ([x]=1 /\ [y]=1)

  (On an historical note, this wasn't always the case in the LKMM,
  cf. e.g. [1], but be alerted that the formalization in [1] is
  decisively more involved and less intuitive than today's / what
  the LKMM community has converged to.  ;-) )

- The above formalization merges the so called "Observation" axiom
  in the "Happens-before" axiom.  In the LKMM, this followed the
  removal of B-cumulativity for smp_wmb() and smp_store_release()
  and a consequent "great simplification" of the hb relation: link
  [2] can provide more details and some examples related to those
  changes.  For completeness, here is the BPF analogue of test
  "C-release-acquire-is-B-cumulative.litmus" from that article:

BPF ISA2+release+acquire+acquire
{
 0:r2=x; 0:r4=y;
 1:r2=y; 1:r4=z;
 2:r2=z; 2:r4=x;
}
 P0                                 | P1                                 | P2                                 ;
 r1 = 1                             | r1 = load_acquire((u32 *)(r2 + 0)) | r1 = load_acquire((u32 *)(r2 + 0)) ;
 *(u32 *)(r2 + 0) = r1              | r3 = 1                             | r3 = *(u32 *)(r4 + 0)              ;
 r3 = 1                             | *(u32 *)(r4 + 0) = r3              |                                    ;
 store_release((u32 *)(r4 + 0), r3) |                                    |                                    ;
exists (1:r1=1 /\ 2:r1=1 /\ 2:r3=0)

  The formalization sketched above allows this behavior.  Notice,
  however, that the behavior is forbidden after "completion" of
  the release/acquire chain, i.e. by making the store from P1 a
  store-release (a property also known as A-cumulativy of the
  release operation).


I guess the next question (once clarified the intentions for the R
and Z6.3 tests seen earlier) is "Does BPF really care about 2+2W
and B-cumulativity for store-release?"; I mentioned some tradeoff,
but in the end this is a call for the BPF community.

  Andrea

[1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/LWNLinuxMM/StrongModel.html
[2] https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/LWNLinuxMM/WeakModel.html#Cumulativity
