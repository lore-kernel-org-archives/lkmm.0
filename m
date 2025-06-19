Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982B28682
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343574; cv=none; b=Cs0GLF284DxVFvrc6waM6hmF2o1s/7Xw9ONJ7Vp9BeqL42k3Z5m2OSdmx1J2ByCoIEbG35GhMh7WDOu7KFNskdFtgDmccaVayBdjDQdBMCeWb1nNrz1dTdsvMbSMqe3wluLhYVgAOlfx3GSokOcAQB7g4DXqv6HUF3FE8i1bMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343574; c=relaxed/simple;
	bh=f9InoU/zIyvqU5XW8HXwiQiJTHhL6rglkSPoRNyO+GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9HakoLgDp+i6rvwq5vTkdXuP9V/MvUA1SbZbW83189o98xFJPsqTemYXKUGvteYVsPmFIxPG/FEttru2sAtrOxgJa9w5opImzkJVdrD22xSWvQHxRh0zmy0UfGR3BREYaugRpCDOE4uiV1/qf5NrqC14iwE5U9BUVpXcccTadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ORyTbMzc; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ORyTbMzc"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fafc79bca8so10360596d6.1
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750343571; x=1750948371; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOkFLnrJzZMHzNUSh+Y/TNE7FFzC3Os6Y5olMIbxKDs=;
        b=ORyTbMzcDOLqzfHiaNm18079/4ZOwVrHi3W9glnBMhmgvJ7lRKS4tHEXcIChnEye4h
         a4ZSYQ5RacG5/W1+odeIfryUBA9QxbQZ/fVo1BVFqNsFk0stLUQNQQAOHPu8Eap29L/Z
         A1VuzwtrWKVv93goi93AhadlVTvHchrQHLqwGgAaHxrzlpT8PKHmYFt896YPxnnJHHmr
         0elSMV+RLXTtcIwacfrH67cpQ0FYoecjdwm8dGs8KTSttudHy+meuUMqVjk//p+xcAnj
         7rsWYXnrY9Uy4om/pzS4hxWPE5K4rScllgpKhkWRvk8v2bmAS2FkP5QxpfbEMVD6qy59
         VvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343571; x=1750948371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOkFLnrJzZMHzNUSh+Y/TNE7FFzC3Os6Y5olMIbxKDs=;
        b=hdZtZl/5Fq9cFvA9Vw3+pXLGrXKqleoRCJ1IC98najfaPk4efd60S/kDefpPUBhrzf
         reTl/NnMvHKZvoFDOPdS7S1lc1nwrzZmBhftgAS9zjVZmkELkk8paWIdZf54ANd1Cwqp
         D0mU//1XCqYfogngqS29c+TmIiG2RSxJ54tUNPdFH9Krf+U/DaDou308G7GuZ5indGJR
         HYEAUrKw8+XJhgJAFdQZPJGcZtF+t88GAwRHm/lLcbwaJb9rbvTjK0qYwOh+G5JRdswO
         yatqxKKfnVzsXSXb542nfUDDlkbxP/2QlhwV1qrYnYdR4UMm4bf7j3vwp6darDbNvo/C
         rYpg==
X-Forwarded-Encrypted: i=1; AJvYcCXuV81/cVt5b1Cdf3LnaF2a2I3uxJ8nbUutX/k1pkaxYgSuHasDBdwSh9bE/oLdbBWZxxDn@lists.linux.dev
X-Gm-Message-State: AOJu0YztJxjorPPjbGD+qbJZjCj512HqPHl08Wls4VvF4cuSzARIU0mC
	rwOUh+Z2OQeR+sSgnfXtZJAqQq+hIujm57le8tCtX71qoxmN0YJHqg0kwG0363EaWA==
X-Gm-Gg: ASbGncsAm92nQRXCGAwTLrqOFjeIhMelEoBGB5B6LAcu9TMf1eJE3FW+rIE1Wi8zjD2
	9gDwm4XbUyUZxGNUi7jubT7kgNUiCg+C7Qj7X1a7+En61qLc+evCITEkUosz4jqMoBV96I5wZfi
	t143w7jOQot5ih2D9wQuobS++mSkzKpmFb1MBxAaBbCHuwjsYVU4gqq+hOqBytgu+IOTerqDITF
	4zT4YjgaAjhAemvbNEh730I4J0gmCZB6gLp9TspKDbbNc7C7sHlzh6+BM66ni9s+SmC5VFihQKH
	2wmvHNPUoJohdD94gKsCbCKMEjfBUV8gwjwZ+5H5z20VQuiNHjrUCf7KRzfcWqo=
X-Google-Smtp-Source: AGHT+IHxQnCf/LYNTmc/z8v+E308ymSUGqUyJ6EPuGPk72H+rJoxyGsRQCNrsDtAHmaoQiC2Ino8aA==
X-Received: by 2002:a05:6214:19c2:b0:6e8:98a1:3694 with SMTP id 6a1803df08f44-6fb47772defmr361361336d6.8.1750343571359;
        Thu, 19 Jun 2025 07:32:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095ca02bsm243696d6.125.2025.06.19.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:32:50 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:32:47 -0400
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
Message-ID: <6ac81900-873e-415e-b5b2-96e9f7689468@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
 <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
 <aFF3NSJD6PBMAYGY@andrea>
 <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>

On Thu, Jun 19, 2025 at 04:27:56PM +0200, Thomas Haas wrote:
> I support this endeavor, but from the Dartagnan side :).
> We already support MSA in real C/Linux code and so extending our supported
> Litmus fragment to MSA does not sound too hard to me.
> We are just missing a LKMM cat model that supports MSA.

To me, it doesn't feel all that easy.  I'm not even sure where to start 
changing the LKMM.\

Probably the best way to keep things organized would be to begin with 
changes to the informal operational model and then figure out how to 
formalize them.  But what changes are needed to the operational model?

Alan
