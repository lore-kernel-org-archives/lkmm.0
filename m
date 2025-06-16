Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20042158520
	for <lkmm@lists.linux.dev>; Mon, 16 Jun 2025 06:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750054919; cv=none; b=GLzRVfH5kq0LF2V5f0ZPY8Py9n1+eWx+BM98QakJb7gHF3EAjs+vdKOxrA3a2hpAe3ju15QWPVe08Hy2tUgboYX2Kr7XVco9WT+s05FgmXp+CmkWSoTGCYM+xWPUEY3OcnIsk7f3BVHki4Uk0oNwimtOo52H5Kx1/HoHOgxFAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750054919; c=relaxed/simple;
	bh=icqJHukmdflxT9C8ejGfp7Xtqb9ufi/MGmKigZ6xWyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLAd8SjonkVy9zso3Ee+RBm7mLQQyhZ32699L2O1GKM1Lbh8MvBGWDt/RkSdd3TYGVBtsQteYXpC7RJC3BNREKy6d+bL+qB8pjXqt8fao2gc8k+a+CIzDw8pY2W5WYL8c6tEUY3DTKv5mKcsg1G2th1HlDOOTa4Fm+bTu913ef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vrm4i9W5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vrm4i9W5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so26305855e9.2
        for <lkmm@lists.linux.dev>; Sun, 15 Jun 2025 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750054916; x=1750659716; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9ZPORgpv1nblhxKmsdSf/LKYwc5iD3Bg9h5qXnwBPI=;
        b=Vrm4i9W5ljBWX/flR4Y3j2MBlwwdFCB8tvo1ZagCU857xu5eIVcJOyP/JNWgCsacC5
         Rp6FLezL5YoThGpUb9uH0qbhsppz1DJlrFPVXea6B1FAGrkPqV35gWRd/BapbNYWJncu
         kii+MU+OBKSTuHGZKM7MnPL3+tUbq77kYp78LVq7IzbX/ySmU/Y4GpYCSY1yGcSGGu6e
         NBvYKzdGtyGXosZzYFxJ9wQQUiJsdyDuuHk57d46l16mKYuKKU9Hyx849PPusZHY7VIN
         EoBoJHlmpJ9Dhv5bPQGCu76eaTMSBc4sZhMXK09bQLPj/w/29biyfF/kpgh49fsjOixX
         qE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750054916; x=1750659716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9ZPORgpv1nblhxKmsdSf/LKYwc5iD3Bg9h5qXnwBPI=;
        b=QAFZIlsJlWzUHHYRZYrWcmeCWin/4MaKYl8T+Lo6hY+sXAPXaJx4xSFKSW6WvJNMyv
         7C/Fqdu9Pjnm6Nq2/SM2r6I70FL/DbfNim0xgQyASFXFmkwmmfgCCBiwm1JO99yeTSIR
         BrrVpcIQizmAAW9A0A5pv0a5gVvj+2EWJ+U+/WP+DpClgd5aQ2omcnkkWpUwcbYoaytX
         fkwZ4s/JAs1budQCG2k9sII9IbuvwuNkDLi432BAA5qslM4RP/UDFcN6xNCBaSVuEkuT
         LhWToPH7A0bFVkLWezvw7oHONpqw2qvUjOPPCLJg1xrBGl5J8wWK7u94KyFDVMSHd2px
         GWwA==
X-Forwarded-Encrypted: i=1; AJvYcCWKbn9B0n7ZDV1iWkFCY3Eh2+DpPJOFWcA98kH2KD2/DAuMnOcFeGW9xMjvL7JP8c8WR4VW@lists.linux.dev
X-Gm-Message-State: AOJu0YyZKDy0hA4QCYAxRMVmXDp+2JB1mIVb+eBZy1cBYW1KSFVDLMb7
	b+VlOwKa8dsYHww91XbeniCzIsAqcrglsR0YCPkuq4aqpWugPRdSu/NR
X-Gm-Gg: ASbGncsvr1LDAp9M21O1OQlVUR9pVaK2H9bZf7bEJ6lZ4U9gISW3AxV4t4LoKl6RJVD
	TNzn1D2Z9vZUBnIdmO/dzBv2pKeWidZP4D6aP7dGIX53gGGeKp47GR/FtHhEAGbjvxXGpE6xp6x
	mm4jsXMpBzxIbJsZEIF0t8JrXUOhADg66ZB6VuXL0Ypn4B3GAAG8tC/kq24za0IHtpumsqMC3KC
	98DqciCgwpE7rkSEdA57p+BYIJSpxhchFON6A/iwLZ8KmRf6rMGx1Gmp14+h1UQP8ubOnVXb7Ps
	AaTFqlAYqGX5gEuzfHsQPo1U9vU6PwHZ4o+YxThGlNHfru0ra46DfSZL
X-Google-Smtp-Source: AGHT+IG9ZWTEgCidrMuLIT5G1uCdLIAIbic32LoaPu3oR82xk4/LzfXaXAvhVp87oo7HGLOl9B4xxQ==
X-Received: by 2002:a05:600c:8b02:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-4533cadf85dmr74581845e9.4.1750054916136;
        Sun, 15 Jun 2025 23:21:56 -0700 (PDT)
Received: from andrea ([31.189.73.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4533fc6578csm65401625e9.19.2025.06.15.23.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 23:21:55 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:21:50 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Haas <t.haas@tu-bs.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <aE-3_mJPjea62anv@andrea>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>

> Thanks for the praise. I expected more questioning/discussion and less
> immediate acceptance :)

Well, the discussion isn't closed yet.  ;-)


> Maybe one should also take into consideration a hypothetical extension of
> LKMM to MSA.
> I think LKMM (and also C11) do not preserve REL->ACQ ordering because this
> would disallow their implementation as simple stores/loads on TSO.
> That being said, maybe preserving  "rmw;[REL];po;[ACQ]" on the
> language-level would be fine and sufficient for qspinlock.

On PPC say, the expression can translate to a sequence "lwsync ; lwarx ;
stwcx. ; ... ; lwz ; lwsync", in which the order of the two loads is not
necessarily preserved.

MSAs have been on the LKMM TODO list for quite some time.  I'm confident
this thread will help to make some progress or at least to reinforce the
interest in the topic.

  Andrea
