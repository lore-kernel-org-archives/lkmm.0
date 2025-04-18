Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A6186E2E
	for <lkmm@lists.linux.dev>; Fri, 18 Apr 2025 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001050; cv=none; b=uVFipz3UUi84yizwq+YUUb7OPJ7O9SVYC97IMAX7XQrNzI7L48t1Gfjj+Tvz7xR6psLxLRlw68PeUgyBH0ibTZkcRZS7zXLsMAOzYkBvDOZ6IlVKgDqEC6U3ga8hVtS9EGRUo6DntUzjnx6WOfWhFMvmyQL7pw7kpCpUykYwe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001050; c=relaxed/simple;
	bh=c0CB/DXF9gNgqSz9i4xYW55k+UT3LJPOcOwZZ95mDpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jv6EH0MIMmA3H/oN5DE4OFsDuSkAIVH9NEkV/lbw/1fP6FiDzy2CniUpxutaskRz6yvETmC0DZDO+K+3zpvK9DQ/BwkloYbcIz16+k3RY6cbsApklJhdIHLvHOAiW+wtNFLOsCfpCauG+c4DpW2QWuSO5onyJ1KVduBZW+MwXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vth4Tmck; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vth4Tmck"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so24006605e9.1
        for <lkmm@lists.linux.dev>; Fri, 18 Apr 2025 11:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745001047; x=1745605847; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EM2y7Xj/ptDYmV6jJYUrAv1l7drHOgK9Ux557VTdNY=;
        b=Vth4Tmck7irubAyfRISwBh5W0/pEQ3CoINwVInugCDYcgSB5EYQiqZPGNR1PJmo6Es
         6U2oc54YSdSia70bqE0Nf0/md+QzyCoEI6d8ejQNZGPGjmW9VAI+6lqNe3WjPv4xttnS
         2Pg5o/LmgJv5P4srlwDbhZfJQ2+m70gENa4/KjWhRHF5V1iGhGYC/ZOdTGraxZ2ihTGZ
         eKgE1rwNVPLv5ICx5zP9xd8265hIFlQrxRbf69sDTTSAqo+Tzn15wRfYpeH9nJpjjLMs
         Lmu08OYMdtJAv/UV91gC9uu2g0fCfufw0pjxfu4cDfmNhJlLMD/hRKSXXPs/fMPkkTSi
         lZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001047; x=1745605847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EM2y7Xj/ptDYmV6jJYUrAv1l7drHOgK9Ux557VTdNY=;
        b=Kp4UqadhWBZ35ol1ggtE/YdnbcQmrmW0m+nUbrC9XqTR+giDvCxB+RmgyQKRxcPqYD
         ezB/zufRHf28mDI4+O1FMLijtRcU3KmgLfQjHuXFUf4t/jGi+d7PBN4xsjK+YyXB1L63
         pUIU6goK84TsnpUuyH4l37qvw2QE9jpaU/1oopnFNseFJvojHYqvhOPJa8Z9rsVlhzaQ
         XpmOOnZWXhSVv1r0iYbjdK3y3rXu6muhsLmRdjaqeF8w/ZJfWrJlKgwWbGGhX5N1XbQw
         lXsz/THDU2VcH7B5gLm5P6OdKdxoDYwuv9EdctIfavrRwBuP9X0x/FqH2PQg9VAsGCvY
         TLQg==
X-Forwarded-Encrypted: i=1; AJvYcCVu6sbuEWZmZL/9c23Mbv3uF+E6HWhriyw44BjR7eyZg7gUmImGsz+AjgIoIy+Iq7I+ENNk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf7keErR7D4M62qGB4z3sKArUkbi6fX3ADLtSEBJ6eu9LC3c5/
	NOK8VOi44vqOvxnJoQayyEzrHDDIgf6bqzmCISEPeaOVawIGt8AE
X-Gm-Gg: ASbGncutcEZJNaY9m3/wiSz3cUplAuG+BS+oWTA5AssuGu3AOgp1xz7xuLEQzWE+5gI
	ZLEEoeIoAGp9OpROq+IBYcDkSQauYFb3zEEj+8H4n1MQeejeTpjJPP0nywbZ/z4wo5VmEANDQpr
	2hDc4Kkg53FSsKkekO02FxeAGfwARaMvro4WivyFpOX83tfOI+qUawGJmlnHuv02BxTQOR8fZsh
	uBdJXRaBbpQ1EZTaQwPR8SU5P78BXFzV9hZwjts89v5x9kOzIQE7hLFBp19KLtF2NOIAvLPwhmJ
	Ghz++ieo0P7453n843LNGF4DUbrcmsob7d2j
X-Google-Smtp-Source: AGHT+IEw2DgG4Fznx8yp5fVzK7z/tYxtlhO2MRgAoo21zkKMF8tUl96AfuzvkPw8EiCzvjOVZ8EXrg==
X-Received: by 2002:a05:600c:1549:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-4406b235409mr26940785e9.9.1745001046789;
        Fri, 18 Apr 2025 11:30:46 -0700 (PDT)
Received: from andrea ([151.76.46.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acc9esm32078575e9.13.2025.04.18.11.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:30:46 -0700 (PDT)
Date: Fri, 18 Apr 2025 20:30:42 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, kernel-team@meta.com, mingo@kernel.org,
	stern@rowland.harvard.edu, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com
Subject: Re: [PATCH 0/4] LKMM documentation updates for v6.16
Message-ID: <aAKaAXQApP8JoQkL@andrea>
References: <cd7fb2c4-1895-455c-84f8-8ed7252b93ff@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7fb2c4-1895-455c-84f8-8ed7252b93ff@paulmck-laptop>

On Fri, Apr 18, 2025 at 10:29:53AM -0700, Paul E. McKenney wrote:
> Hello!
> 
> This series provides the following documentation updates, all courtesy
> of Akira Yokosawa:
> 
> 1.	docs/README: Update introduction of locking.txt.
> 
> 2.	docs/simple.txt: Fix trivial typos.
> 
> 3.	docs/ordering: Fix trivial typos.
> 
> 4.	docs/references: Remove broken link to imgtec.com.

Thanks for the updates; for this series,

Acked-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea
