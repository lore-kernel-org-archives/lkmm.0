Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120EC193404
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129144; cv=none; b=rXAWDI5mU9L767nX6vBz4b01ZusDcW8ErMtLda7rI4SqIFF8W0T2YZGkYVnvL83NvHYGQR31/SBrsYTR+XsNuApg/QVpjaWna40X9mXLzj4QSlQR3WwOLlKalN9kFiWHLK4lJF25VUePwSrMXyKwl0Mdo1m//Sdi0HFLUAzl4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129144; c=relaxed/simple;
	bh=TEoQdfunZVNbfy+pMkPLrOa7hsxqi3KdFD2JEMh3x3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsaR6i7gkvTOt5CnkTO4Yqy4HC5YhYoHQhaonJggmLjIhP2sH1xESCrcZDFYK6p1fM3dirEJjyKOn2JgU4QnU520nLUcD9pTyR0wjzZGMQ+RcWKyQmApR0OpGht5YknLtaPUiQSND9/nJyvN1erGR4xcXc3thfYaimRdGHfBOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AQLRc3gy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AQLRc3gy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8e773ad77so19178786d6.2
        for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737129142; x=1737733942; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5V2zTue6Ca+dYIpYXZ8Zzz7DTG7pcEvzLOTnCjnrGLk=;
        b=AQLRc3gy3dW3KgPcKxpjjWoj7DilhvQhwCjHeYXLKwUlgdFwo9wpqB0zL+g3LZxtco
         ccvxUo58BDYv0A+esY8fnJppOcv/uuKxD4jAOPcHTFJVrlPms3vjyRC1RzV1/8upMcyQ
         R6k8RrD8/+0YtJjZza9fI3mBl3NGIP0LK/XEZ5kk8rGxpb3WNehMZMR8lBohRCMWZ7Og
         w1CzDU/1SmbyDtngcwJwLBzmOLknF6YVH0UgXd1vpUT3wuS0b6RQaIcFKccUHmh8ljtg
         Q2CB0TCddRdNjYA5M7baMHq9ediae93EE1nm8op35BqtOt7kUMg2XAYDLpuna/thK2YA
         HAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129142; x=1737733942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V2zTue6Ca+dYIpYXZ8Zzz7DTG7pcEvzLOTnCjnrGLk=;
        b=tn7Ks7R260ElXw15f3egTGcmJK+xvWulkvIRyipOfQN+0SC5ChIV+YIWblznUnfMvN
         9292tKyzt5hT2ys8P7sFL0K1ndMlAL03YyYP4JeXdj8fgtk+SxJtDPjOqg2l4Zd+M+Oy
         RZ+ZmectJZJPTPk215IvNWdaLNmpbVWgTeyUeqS2mYoVb+M4NooK5O9o1RjN4THfQIhA
         eV0bYjb3QrCT1K8ktzPnK9HBb5qlUKoTDDmlBpx7MGrp9mWrMxfevoWKm6xPFyUzB0Wx
         IpKscxD1RObgY/IYVc7lX698JUf2gKG9Qr2C8FgplhBWsWaDSe8e743gKwGtBOkRHIKZ
         WjNg==
X-Forwarded-Encrypted: i=1; AJvYcCVYVI2tZaFIBE3DLKqLSR3jDEiexnUpfRebG3rQntLzQBu+VSw6+dOC91tEf2TZvFEmb7Tn@lists.linux.dev
X-Gm-Message-State: AOJu0YzHDJexxPCSTSycqYkW9QITF7HV8N89EtzQnvV/Dcy+JqhmnJON
	t7ST4irZTaXSEs8i8gEdh2avAzvCQH3v4ejzEd9nXAN0LMUQcnje4v+LrvE6Eg==
X-Gm-Gg: ASbGnctFvAPdzzdt+iHMiznvgtZakgYEC/w35kAwJJ2zJ3UiBF5CvUBbdzZiWtlN5LG
	CEuElEUcUclIBQ7/aM2vSImPxS1LmkUYj7KVtzRGT7m6wnngwzbkGeRuQFY+VH+tgMdJcu7k3vn
	BaMG0jUpI4Cuu1LnOJNFbQ02oRaKHXgubXporeEn4LD6Dj6p4TClsuL16rTWtibIBj0Yanx3FUD
	UL07UWF3iV3DZydTYQwB6V62FVzVogkhXq+bwOeAcAGisqaTizRLKNZk+vSGviGFDS5UnZ2VE0=
X-Google-Smtp-Source: AGHT+IF1V5QxVxosagubBGVpygNFQn4m/8JDYHFZmfsxsNQS0UiWBPZMokug7aMSvSWGaCJAc4h6mg==
X-Received: by 2002:a05:6214:588b:b0:6cd:ec00:205e with SMTP id 6a1803df08f44-6e1b19e0831mr54752906d6.0.1737129141870;
        Fri, 17 Jan 2025 07:52:21 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcf6ee6sm12301026d6.123.2025.01.17.07.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:52:21 -0800 (PST)
Date: Fri, 17 Jan 2025 10:52:18 -0500
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
Message-ID: <b0bac412-cfc4-4334-8d8e-2fb080fe6e3e@rowland.harvard.edu>
References: <9dec7f8d-16c0-4122-bf03-c16bd616ca15@huaweicloud.com>
 <9a0dccbb-bfa7-4b33-ac1a-daa9841b609a@paulmck-laptop>
 <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>

On Thu, Jan 16, 2025 at 06:02:18PM -0500, Alan Stern wrote:
> On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
> > I would say that the approach with volatile is overzealous because it tries
> > to create a "local" order solution to the problem that only requires a
> > "global" ordering solution. Since not every semantic dependency needs to
> > provide order in C++ -- only the cycle of dependencies -- it is totally ok
> > to add too many semantic dependency edges to a program, even those that are
> > not going to be exactly maintained by every compiler, as long as we can
> > ensure that globally, no dependency cycle occurs.
> 
> But then how would you characterize semantic dependencies, if you want 
> to allow the definition to include some dependencies that aren't 
> semantic but not so many that you ever create a cycle?  This sounds like 
> an even worse problem than we started with!

An interesting side comment on this issue...

This is a slight variation of the example on page 19 (section 4.3) of 
the paper.  (Pretend this is actually C++ code, the shared variables are 
all atomic, and their accesses are all relaxed.)

bool x, y, z;

void P0(bool *x, bool *y, bool *z) {
	bool r1, r2;

	r1 = *x;
	r2 = *y;

	*z = (r1 != r2);
}

The paper points out that although there is an apparent semantic 
dependency from the load of x to the store to z, if the compiler is 
allowed not to handle atomics as quasi volatile then the dependency 
can be broken.  Nevertheless, I am not able to think of a program that 
could exhibit OOTA as a result of breaking the semantic dependency.  The 
best I can come up with is this:

[P0 as above]

void P1(bool *x, bool *y, bool *z) {
	bool r3;

	r3 = z;
	x = r3;
}

void P2(bool *x, bool *y, bool *z) {
	y = true;
}

exists (x=true /\ z=true)

If P2 were not present, this result could not occur in any physical 
execution, even if the dependency in P0 is broken.  With P2 this result 
isn't OOTA, even in executions where P0 ends up storing z before loading 
x, because P2 could have executed first, then P0, then P1.

So perhaps this is an example of what you were talking about -- a 
dependency which may or may not be semantic, but either way cannot lead 
to OOTA.

Alan
