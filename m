Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A7F201018
	for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 14:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866465; cv=none; b=FIp9XGFafISRmTNd/fo2EPeXU1v9XXFIgA2rFnl1IzIy9k26bbXAcagt65/v5T4es7I+KgLEjI2OAGwgE//4zao9jpYmKDYeVGNjOe8qFbCl7GeWo7KFbqS/P/A2cGBe1tzkVzywE0ErLN5NCs1A3UNHN9MiPEZVQpk4yoPFBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866465; c=relaxed/simple;
	bh=SNOT2iG1uo43SZFt0GZqyBwcm+SiJ5JmL6rlhz0NOv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzEwvsoA8Rx7rI4tUvc0vQYp9w/nt1z3KWMmUIXKQdTDOSWXwkeIpTQ4kIw9q6w8FmWquE4TQy1NX1Tpf842cpgPp0zpSI8Vu2H0pg6bdxLBZq6UW8SajahsSQRP2ZgQoxkGj1CXLbkZeT1+n1Yaw7DY7R9Z40k2pB/iwWc615U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIqdkArN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIqdkArN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so3109535a12.1
        for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729866462; x=1730471262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fR5hzdpK0KAXZdWFhkN0m31lZEsfiSfvLl8lR/kVQKI=;
        b=IIqdkArNbkHEuAqPN9qpa2a5IFf1Ai8KoDmHBUS70gTtqj9aDliQ0ZpvNyMcEwHqIa
         j2yrqnXUXDUUPOAvitWQTaGGTjr6nhW97hKTWFbTJJdrUOfwMGPzRfWtjGDtR3h7SQaR
         zofLOHqtRB6eL7cyXP0LH5+5GBNKntaYNRaxKFoBmtLAntabb7uRH5ADYvJvNEA8hbu5
         0TZhY9mopklxFVg8aMJ4lzUZThfqylLVQfMGqgfX3DD4zeTLyu3RGX8Z9Tf0bEuXrfXg
         pk48yoFq4PT2KTFUbSQhdYvlCYseFdvmXU8RcV0T2avmAypKk2I4Ja9/pha9Ea9jHVC+
         6bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866462; x=1730471262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR5hzdpK0KAXZdWFhkN0m31lZEsfiSfvLl8lR/kVQKI=;
        b=Eztipq+luy1j53pv+03unqfthyo/SsSfAY/F94LmTlI6MWx1IQAWgbVSR9ML8tiDD4
         P5oaKEC/hd5jL821HVV1f2B9F8P+hKoPWh7qvVt2ACBMAg/f9WYyGY+GOwTGJpzrVhFv
         cTFckbX0ejqfDH1RROSS8+rEz1ojiY/oZOUhxoy8WrpWS/z7MzlEczO0XTeztUghe00f
         NZ/YqTbup1IfSCSN5Z1Vg+5LEU1OtHICgp8AD3hstabSrlu13DZvxCs+eK0T6lKXzI3i
         s4pXDwh9k7gYbMZoT1KZ54EdlguSoYChYMDgC2aqzcUd0H85D6S7gMRsEp2n0GQHWmJL
         2vUg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6bRh6vP6UO1jtbFt1ucB7UOVDwa+pn+WBvCd781HDc23WYlsFLzzI2GX/OVN5KR0jQK3@lists.linux.dev
X-Gm-Message-State: AOJu0YzafnUF1ZLY27rnRX+JRN0fQq3J0zzaobUXfSQEddN1OaomLTsH
	kKPdvwd5qucFJUVaI1yKTMWPivd6NpNt1kOxnlI9m0OPgAUH4bpY
X-Google-Smtp-Source: AGHT+IGPQeVt+Ho9WeKCaan/AgLgjEin4LNAeAKET0Nw1qGl80K+N4Zeg8GXUkU+/j6Y1Rr/fpdcmA==
X-Received: by 2002:a17:907:6d24:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a9abf887496mr901934066b.15.1729866461696;
        Fri, 25 Oct 2024 07:27:41 -0700 (PDT)
Received: from andrea ([2a01:5a8:300:22d3:a281:3d89:19cb:ed96])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a088ae9sm75669966b.217.2024.10.25.07.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:27:41 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:27:37 +0300
From: Andrea Parri <parri.andrea@gmail.com>
To: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
Cc: puranjay@kernel.org, paulmck@kernel.org, bpf@vger.kernel.org,
	lkmm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Some observations (results) on BPF acquire and release
Message-ID: <Zxuq2Zvpn7ap4ZR5@andrea>
References: <Zxk2wNs4sxEIg-4d@andrea>
 <daa60273-d01a-8fc5-5e26-e8fc9364c1d8@huaweicloud.com>
 <ZxuZ-wGccb3yhBAD@andrea>
 <d8aa61a8-e2fc-7668-9845-81664c9d181f@huaweicloud.com>
 <ZxugzP0yB3zeqKSn@andrea>
 <8360f999-0d64-3b4f-e4b8-8c84f7311af2@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8360f999-0d64-3b4f-e4b8-8c84f7311af2@huaweicloud.com>

> I am particularly interested in tests using lwarx and stwcx instructions
> (this is what I understood would be used if one follows [1] to compile the
> tests in this thread).
> 
> I have not yet check the cambridge website, but due to the timeline, I don't
> expect to find tests with those instructions. The same is true with [2].
> 
> I have limited experience with diy7, but I remember that it had some
> limitations to generate RMW instructions, at least for C [3].

Oh, I'm sure there are, though I'd also not consider myself the 'expert'
when it comes to diy7 internals.  ;-)  Here's an example use of diy7 /
diyone7 generating lwarx and stwcx and reflecting the previous pattern:

$ diyone7 -arch PPC LwSyncdWW Coe SyncdWRPA SyncdRRAP Fre
PPC A
"LwSyncdWW Coe SyncdWRNaA SyncdRRANa Fre"
Generator=diyone7 (version 7.57+1)
Prefetch=0:x=F,0:y=W,1:y=F,1:x=T
Com=Co Fr
Orig=LwSyncdWW Coe SyncdWRNaA SyncdRRANa Fre
{
0:r2=x; 0:r4=y;
1:r2=y; 1:r3=z; 1:r6=x;
}
 P0           | P1              ;
 li r1,1      | li r1,2         ;
 stw r1,0(r2) | stw r1,0(r2)    ;
 lwsync       | sync            ;
 li r3,1      | Loop00:         ;
 stw r3,0(r4) | lwarx r4,r0,r3  ;
              | stwcx. r4,r0,r3 ;
              | bne  Loop00     ;
              | sync            ;
              | lwz r5,0(r6)    ;
exists ([y]=2 /\ 1:r5=0)

But again, I'd probably have to defer to proper herdtools7 developers
and maintainers for any diy7 bug or misbehavior you'd have to discover.

  Andrea


> 
> Hernan
> 
> [1] https://github.com/torvalds/linux/blob/master/arch/powerpc/net/bpf_jit_comp32.c
> [2] https://github.com/herd/herdtools7/tree/master/catalogue/herding-cats/ppc/tests/campaign
> [3] https://github.com/herd/herdtools7/issues/905
> 
