Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062623C8D3
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355825; cv=none; b=jVOfoAnh8F8ELJ7WxNLrnwEXRJGxi9xKneSLOAh73Z1723IPpYTSryuEnxYTrNIyazJ7v2QgLe5Ynakg1ESjKxx1UUU/9UY2QJk5PgfoIMYfduFUfG5GoGBvSr2cVeBchSWvHdQ+ZeAAbV/vF1Nnbz8+H5cSoylnuwuEe6FU2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355825; c=relaxed/simple;
	bh=eai0KmAEI/LXOe/M1noE2xH7znIEBHLB9tBGHx4OkBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7wvR7dlhbqcxn6ZvntB9SIEugoRIkVa5capG8+NCv6/HHvmmYIlSyV20zp8FONlLu/Q0Ozmz8pNbKc+M5iSzb2/SISMIYb4JXUqDtortyhiMdUku0xGR/vHaMay1Sf2qua/OoYNqFQmL0VloEHqREs7zU6+ZHWVxOqLZBvvGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=aF2m48Tj; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="aF2m48Tj"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3e5df4785so67090585a.0
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750355822; x=1750960622; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8d2ui7E+uX2eOaUMaNXo/P5F6Y0SfvCqCGd0JgYOPM=;
        b=aF2m48Tj7FLBGrbX/1zSLDLin411JjMvStWcaA+jF7sBnQXNBcfxBSA6Bv4b+XeYEI
         ts7Lqbgr3vj6U2jmLBhfETvLnSkhWSJ6Jk/KuNM7fXV2G7bj8yvOTarbHJTMMrwbUeI0
         vCM2jbY7MTv5OtnbXwzXSUh+f9534YVkH6ICGwZd8x/zYIMzaMPeFQGQJX3ss/fomP2t
         u8i8WqY1dmQo7pn8jAGg6zxh6X3ZwXRd+bjJ6BdTQ8bHudmLFR+0Rifm8WSHNb4yOOY9
         ac8gsuSdiwHXhrFMNkmFNp1cT60COCqGz/LiRGKWOwSUkZgLIj/rXCtryERHWySAUfMD
         0lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355822; x=1750960622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8d2ui7E+uX2eOaUMaNXo/P5F6Y0SfvCqCGd0JgYOPM=;
        b=CMU6gWmW0csYTKSxTWKx8uZTEBlLvz0cfWpC1hMM72sdKT8++1nAZs78wnqpo52Ayb
         hgmdhnDvI3MtRaNGBELO6xJuisj720tztkuKB1jeVq7B5hjluH7AFuFI/88omuFr4Kb9
         k6G0YzcCp691sMKjETGxtNgTM48jRiR4LrvTcc8KJuryKwn0vAemVTxS3W7fSAx1pByL
         UrOY9224pflRLlkp0obILcjlpoUS4dZaS9a/eHgG2lJM2AD3XUHzCeymQFQVIvbb5u32
         k40IgLD6Z+Q3mOfMk7qomLQ6j3IXVjsok+F6wJfjMwWdB+EqayHhMrnL5Op6pZ2X5dug
         KlRg==
X-Forwarded-Encrypted: i=1; AJvYcCX2H9Ms3pqYUadH0hFPxnwYMF5Zsya8SY8gWYus0Ya/IvPfKb5HAO95fqi2f3Vq3p/rsxZD@lists.linux.dev
X-Gm-Message-State: AOJu0YyCfacNu4fj1VbY0+H7Qc8VrT2bJnjJsTtJ66xHT45e2I/R2U/+
	Grl7qFgN/MX27Y7d10/jrlnw+SYtZqa79FYOemn0pxNjfzyS913ICn23Z97UTAtbRw==
X-Gm-Gg: ASbGncs5hHG+DtlXZGDicbbeSYFaBY4D4QXsqn9Kg6rKWQvbTohW3iHS+HD9idcAGgN
	JHnWh6p5wcJrRO9QBf21yyzO1Eze/3NiuTp3qIYFnP03va4ICc6GLgFgDeaexCb5uOL9TeYvKKq
	nTJAJ0ZynqXMamdEe5TLNFZbpOprFu+8WUVEegHUjeACy/9WC3DBjX9nEq6jpYtLb5F4SBnEQvW
	H8jVGYzXISoNh3uYPw1IGfsny37GLODAU53zmzJ/y1RKFztD85HD/D2H2Gtka1CP0U8fKpnx3F+
	BnvVzvaVKJSyVDl1Jb+z3BPnKlTw37TnVuI1xkKzanKo64LltsTgyUxjvd+ocj8=
X-Google-Smtp-Source: AGHT+IFfAivhqC/12RhcVOhHTCkxtn7BPAMKJ8jBgCMvwPH79EHDEwzW7+X8dU3ooMKnx4PjKTOoZg==
X-Received: by 2002:a05:6214:2c0d:b0:6fa:c5be:daca with SMTP id 6a1803df08f44-6fd0a4694e4mr3308996d6.7.1750355822520;
        Thu, 19 Jun 2025 10:57:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09593450sm2348556d6.98.2025.06.19.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:57:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:56:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Haas <t.haas@tu-bs.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <a0887a91-468c-43ff-872e-c4c4e23b26dd@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
 <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
 <aFF3NSJD6PBMAYGY@andrea>
 <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>
 <6ac81900-873e-415e-b5b2-96e9f7689468@rowland.harvard.edu>
 <c97665c6-2d8b-49ae-acc5-be5be04f0093@tu-bs.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c97665c6-2d8b-49ae-acc5-be5be04f0093@tu-bs.de>

On Thu, Jun 19, 2025 at 04:59:38PM +0200, Thomas Haas wrote:
> 
> 
> On 19.06.25 16:32, Alan Stern wrote:
> > On Thu, Jun 19, 2025 at 04:27:56PM +0200, Thomas Haas wrote:
> > > I support this endeavor, but from the Dartagnan side :).
> > > We already support MSA in real C/Linux code and so extending our supported
> > > Litmus fragment to MSA does not sound too hard to me.
> > > We are just missing a LKMM cat model that supports MSA.
> > 
> > To me, it doesn't feel all that easy.  I'm not even sure where to start
> > changing the LKMM.\
> > 
> > Probably the best way to keep things organized would be to begin with
> > changes to the informal operational model and then figure out how to
> > formalize them.  But what changes are needed to the operational model?
> > 
> > Alan
> 
> Of course, the difficult part is to get the model right. Maybe I shouldn't
> have said that we are "just" missing the model :).
> I'm only saying that we already have some tooling to validate changes to the
> formal model.
> 
> I think it makes sense to first play around with the tooling and changes to
> the formal model to just get a feeling of what can go wrong and what needs
> to go right. Then it might become more clear on how the informal operational
> model needs to change.
> 
> A good starting point might be to lift the existing ARM8 MSA litmus tests to
> corresponding C/LKMM litmus tests and go from there.
> If the informal operational model fails to explain them, then it needs to
> change. This goes only one way though: if ARM permits a behavior then so
> should LKMM. If ARM does not, then it is not so clear if LKMM should or not.

Okay, that seems reasonable.

BTW, I don't want to disagree with what you wrote ... but doesn't your 
last paragraph contradict the paragraph before it?  Is starting with the 
various MSA litmus tests and seeing how the operational model fails to 
explain them not the opposite of first playing around with the tooling 
and changes to the formal model?

Alan
