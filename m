Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E2214204
	for <lkmm@lists.linux.dev>; Wed, 22 Jan 2025 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737573092; cv=none; b=Y//shnvO22BB0eaUdpOHHygK6AVads96HXKuLZ8sx4Y4BhebRFh9n9va8xMMuIPZWjF9rcnTQ5duiDDR8RilAgejeTiwJrKN9QuaWS1kILPL/j0T3oLlBnGwd8MXtWNYAl0ocf0NjLJJ3MSGH7D4ILKeksAhNWVhBsf1DPo+x+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737573092; c=relaxed/simple;
	bh=Z1yqNPZlOeRExYM4QTHz8AnmHzshpip7umUeC08sWaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFAVS8KFeGkcbHdMPzt/5WiJE8WbjXPr/m+cEvcU7csP/lF7ExVAqrRkpqgUKOob7lcsSNqa6MP1BjSEnkDuVtilr5I2k36uf6f7jJe63L+cAj+j35Ko4N3tRGxHF0JeL3I8v8QLYeGwvYLR8l2/tn6PLVR6ODYcMa5Jjio0cGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PwaoUMSH; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PwaoUMSH"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b7041273ddso2838985a.3
        for <lkmm@lists.linux.dev>; Wed, 22 Jan 2025 11:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737573090; x=1738177890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GMK9+KLD3vkM1I8BSPYO4/dY05c/HFcM+aj2IVm+X2U=;
        b=PwaoUMSHly1PeXNq/R82rRLnqp8MM/2zsgFkAUVzLFDKBTfOtAGfYao3JJO1xi2igT
         5tGxW9sM5dQ11x5W6nvag6lFSksqT5wY/RCqe3O6slS7tMsOnoZHlCGgh2ECQqQaRwG/
         UJwMZo2+TZ2yxGjp6/NHhUuXqjPwTHpWEjsgulcCad6DvwG+SrnqQZU4CYBMU3dKrTqi
         QtcQgRSgUL/ekhxNIkOM7VjMR43FpTZsHWduKDjur1bVuW5BBqLpO6Uv8Hz78vFNCi0B
         UITvfxBqwLerSa4DOiUG+2sr5F6p7KTHsZ3bh9YYUTLLe6s1rtq3UxdLa6GdpSBr62Oe
         IvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737573090; x=1738177890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMK9+KLD3vkM1I8BSPYO4/dY05c/HFcM+aj2IVm+X2U=;
        b=DDkj949NHP3xPREiPLRwjWUh1pn1+udUFcYf02LTt2FhGgSWjzmhaXr3imQAnCfiN/
         053IjNhf+7FzUiNPaNfVPTsiKSJJKHbmsmpSQyVJIwPMBj6tax8GXyRZytyrFnJp88+w
         8tKuOEtrycc/oDx9F+qnJFD9xl2p1G8po/mLZyjbaSF63I4hORQD5o84VHxLoNOw0g0q
         u/XiEuX8Xnq9Asw6Vnl69u3Cj1sI2+a4vVNeBTOMik+ELjEcUn2wV+zFPycaOb/O+gQv
         9ZCTJZhcrn40PjGlGNOveyCk9K6JQKdSqYKD28fX1tSPNM/irBbuQykKsPrG8X/2hMnJ
         Wwxg==
X-Forwarded-Encrypted: i=1; AJvYcCUlFjNXC2wrKfMGmPqYBdbBpc4ruq/V599CKUqzo2vB/D+A6z6XplW0AEHtx+rmn6vlE0IB@lists.linux.dev
X-Gm-Message-State: AOJu0YwrzuXaJggSxWoFEfH7Eg1E7ZagCFq23jZf8XuBea03gpo+8c2e
	pd+fWrwCiyno55t9Z9eKh2ed5GPdRwF8hXs6LAV03q4p+48KaJNGImuw/4hYyw==
X-Gm-Gg: ASbGncvMoy63uU3x70XYC+L8JrSKDIMoUNimcdsxGXTTea7WV7RLzN5qWliCdRLPHJe
	hRbpKer44T6RBX2vScZe5Z/ELDBCkuZUgfaWWSfRi7OpWCG78mr7hLlvV4ZF2cqHHpBsivoAX4E
	d5Hy4Z0baL3seon+YHyHdPVJWOuAlQmM8kfdIpkm9S0MY4KXOqUqkDvYf2DPT+WsJvT5rbNXIp5
	21zLOud6AwwgT+vn+etgUxdgN6vnUpPexIznU2rHWpMpKxC1kxTOBxtP9oJ3KOltr8I3sX6z4nH
	6muE7Rv+7H9FnJ2JgN3G6aB3YlmNOWRWZ/swwBqlxNFFo0bmewRcMEYUE5ClIAs=
X-Google-Smtp-Source: AGHT+IHL5mVDMgQlokSRrg14Grt/a6zCGRAUDF87pLjqVh8P9AlGpiW9ekWgTiH8jWlNxokqwkWomQ==
X-Received: by 2002:a05:620a:1916:b0:7b6:dc74:829f with SMTP id af79cd13be357-7be6320c0acmr4144838485a.7.1737573089761;
        Wed, 22 Jan 2025 11:11:29 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be61473bd7sm686884985a.23.2025.01.22.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 11:11:29 -0800 (PST)
Date: Wed, 22 Jan 2025 14:11:26 -0500
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
Message-ID: <b77902dd-d17f-4e09-ac52-35a6ab1e78e5@rowland.harvard.edu>
References: <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <e35c40e9-ccc8-43e9-a676-1ea8dd925718@huaweicloud.com>
 <96059c09-3993-4f41-b3c2-54fe767c073a@rowland.harvard.edu>
 <2139f8ce-63fa-4231-864b-500ee2645811@huaweicloud.com>
 <df9de992-fd3d-432b-9758-9fe35cc9b0c4@rowland.harvard.edu>
 <a2057858-fd7c-4458-96fc-0c3f52eae5fb@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2057858-fd7c-4458-96fc-0c3f52eae5fb@huaweicloud.com>

On Wed, Jan 22, 2025 at 04:46:03AM +0100, Jonas Oberhauser wrote:
> > > > > Yes. Actually I wonder if you put this "all loads are volatile" restriction,
> > > > > can a globally analysing compiler still have any optimizations that a
> > > > > locally analysing compiler can not?
> > > > 
> > > > Yes, although whether they are pertinent is open to question.  For
> > > > example, a globally optimizing compiler may observe that no thread ever
> > > > reads the value of a particular shared variable and then eliminate that
> > > > variable.
> > > 
> > > Oh, I meant the "all atomic objects is volatile" restriction, not just the
> > > loads. In that case, all stores the object - even if never read - still need
> > > to be generated.
> > > 
> > > Are there still any optimizations?
> > 
> > Perhaps not any that affect shared variable accesses.  In a way, that
> > was the intention.
> 
> Yes, but it becomes a bit strange then to treat the "globally analyzing
> compiler" as a harder problem. You have made a globally analyzing compiler
> that can not globally analyze. I understand that makes the argument
> feasible, but I am not sure if this is how compilers really behave (or at
> least will still behave in the future).

There's still an important difference.  A globally optimizing compiler 
is allowed to generate different object code for a thread (containing 
the same source code) in different programs, depending on the source for 
the other threads.  A locally analyzing compiler is not allowed to do 
this; it will always generate the same object code for threads 
containing the same source code, regardless of what the rest of the 
program does.

Alan
