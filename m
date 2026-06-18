Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B802DC321
	for <lkmm@lists.linux.dev>; Thu, 18 Jun 2026 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781747091; cv=none; b=Gh0NyQ/U4I8YEjhwQX0FtnoBSKJmZi8fG9PXoDX/h7WnS/WA0vYYEMC4mWYkD4NJBz1OFxQDW7GOAcdiQcWj2W/kHG+IJiHbY4gRZGFBadzghZpxXpGIe5XD6FLMWetcKi2O4XV4dimBvibXNGXVFubs9d3RseWECUgwNCFIPLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781747091; c=relaxed/simple;
	bh=MA97i8ZFd22Ja0P77uimpuoQ4H+PreSlSaN2v78FnYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+r3lskr2JHDyM9Rmkfa6YwDA1MjoAZF0ACmh9/422OeVXIGDO6286NWNkcFxdOSyChZsausiOuNsTt9Q9PsMQ4Zn2b7Mm6Rjr1C5qX+n6jWNaDW+f83ZKgcIsCazPcOPe7nGme/mXhgn3cKnPsIF6vO+qEHQR/RpV9KawE/ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i0T6LV5c; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i0T6LV5c"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8dc09919aa2so7136556d6.3
        for <lkmm@lists.linux.dev>; Wed, 17 Jun 2026 18:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781747088; x=1782351888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BknC521z3j7HYlZ+93y/0lWMWDCjeC/ViP/zZCod4gA=;
        b=i0T6LV5cADfimQxuyate6uDlcUcK5KiPaQGDqdslsVB6pPt2FPqE77w0vp2OOAHBpY
         ps0WvUNB/jR9SeU/MVO7v4S9qeSxrIxVhaCNdOTM8euskrtideB6P5UxBPM7yHktUi/w
         XY3U+qc/pgA9KdS10jHYSgM9oGzBXdWnzC+YYwnYpeY0ElwnePbthH6hpSVZUD46SJRS
         6UEyEaQnxeijG0//6gHBMq6GMGN1s/+AvLKu5UUwW6Ff9ctpRqy+x0KblH+QWRaBHfRR
         j67NrN68l1BKR2R/7oYYDOdV7Cq5jusF2f+xnoJ23ZLBULh/ZGN+cJu34sIXvS3x5jEN
         uHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781747088; x=1782351888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BknC521z3j7HYlZ+93y/0lWMWDCjeC/ViP/zZCod4gA=;
        b=Wv6nKpIx/2irOG3ofHimCzp2iKsbtyaZ7Ol91tdR/Jy9yMbdbCstdidhM02TuOIqGp
         RthEcoE7bHkSBleHyKn2YdOohyEFUlgsgTdW+9BKkryuAXH/Bg/wEq84K97z4hHundcR
         rBzOBkVLwCwSqV36bRroX5mmxvv9rt+HnnclZcN245KG2ICsYkpmuTP0YsnO/RhnrCM0
         k/PahExRYKS7Rk/tTtb69ddmGvPwHW87mM9aZ47dIIw0hXDlirFDcDo2s9+3bCa/jqAX
         psp4CuDHWhWQ2UOB0OAnxnY421bhgZJhSIG4hON+QaBlfDNP4lRAxfJ1WVI+ItrH/lct
         w1TQ==
X-Gm-Message-State: AOJu0Ywxi/yx8R1SfG3esAKBOveVPfkHrdwpg/hxF376mVt88oBs1Z/9
	TMLncYRWlZ1tRBc6Kabw03d70oo6ohqe9+Lcu2he0yCYBTJtw6aqy2ZWpjIgDrcEXA==
X-Gm-Gg: Acq92OHwPBRGqxDlJZmo9SWV6pLNpG/OYZIOjYwHfrR+M3XCLENQTPovElOI6ar2E5w
	bdX9ujZqxXudhFajeXMZn/ggChLqpRV3xEhgzlDxypdy9opfbhXEmzvXExGp0AAl/wLHZ9jBGDU
	65HcKW/dJ6/vu5gqJm7bH0DSTT0fRabNFdR1680kTUMuqBWpO98e1kh8DV834RBOZ6Xyty/p3bX
	bjhbFuLaxDkefM6VfKs+g3+XfkriNzjNtGf6smOTIid7lTM9VZY5kypI78ay19qezzQf6s7wxIY
	Yke1YAJPM/wOFhzSY5+bfBXmnH79cnnbLCbxf82CJa68jJ3PXnE2DEIH+pd1DOTTrsMb2knLdSD
	MbPqEeyEVwD3dNySeX5PznM+UmnyWXL1BUfYqeSwYKEh1pP9zqDbwATfWrubDPx7UKGcDlSohh6
	1+1FBmmv+2XSXl5wWP16rECvX8CXqieqJX
X-Received: by 2002:a05:620a:2b43:b0:914:9bed:9443 with SMTP id af79cd13be357-91f2b7761d8mr250318985a.25.1781747087645;
        Wed, 17 Jun 2026 18:44:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm1923222385a.21.2026.06.17.18.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 18:44:47 -0700 (PDT)
Date: Wed, 17 Jun 2026 21:44:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Usama Arif <usama.arif@linux.dev>
Cc: lkmm@lists.linux.dev, joelagnelf@nvidia.com,
	linux-kernel@vger.kernel.org, marco.crivellari@suse.com,
	paulmck@kernel.org, rafael.j.wysocki@intel.com,
	rdunlap@infradead.org, riel@surriel.com, sshegde@linux.ibm.com,
	tglx@kernel.org, ulfh@kernel.org, yury.norov@gmail.com,
	rcu@vger.kernel.org, shakeel.butt@linux.dev, hannes@cmpxchg.org,
	kernel-team@meta.com
Subject: Re: [PATCH] smp: Use release stores for csd_lock_record() state
Message-ID: <831f9fb1-82a5-46ba-9541-b82c94e43639@rowland.harvard.edu>
References: <20260617212001.3658605-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617212001.3658605-1-usama.arif@linux.dev>

On Wed, Jun 17, 2026 at 02:20:01PM -0700, Usama Arif wrote:
> __csd_lock_record() publishes per-CPU CSD debug state that is read by
> csd_lock_wait_toolong() on another CPU.  The remote side first reads
> cur_csd with smp_load_acquire() and, when non-NULL, may then read the
> matching cur_csd_func and cur_csd_info fields.
> 
> Use smp_store_release() when publishing cur_csd so that the preceding
> cur_csd_func and cur_csd_info stores are ordered before the pointer
> that csd_lock_wait_toolong() acquires.  This replaces the open-coded
> smp_wmb() plus plain cur_csd store with the release operation that
> matches the smp_load_acquire() in csd_lock_wait_toolong().
> 
> For the clear path, use smp_store_release(&cur_csd, NULL) so that
> clearing the diagnostic state remains ordered after the preceding
> callback/unlock work, without requiring a full barrier before the
> store.  On x86 this removes the locked full barrier from the clear
> path; on weaker memory models it uses the release operation needed by
> the smp_load_acquire() in csd_lock_wait_toolong().
> 
> The old code also had smp_mb() calls around cur_csd updates. Those would
> only be needed if cur_csd were treated as an exact live-state marker whose
> publication had to be observed before callback execution or CSD unlock.
> CSD stall warnings do not currently have RCU-style stall-ended checks, so
> they already allow the stall to end while diagnostics are being assembled.
> The cur_csd record is therefore best-effort diagnostic context, not a
> precise completion/stall boundary.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  kernel/smp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/smp.c b/kernel/smp.c
> index a0bb56bd8dda..5ba4a20ba77d 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -182,16 +182,12 @@ static atomic_t csd_bug_count = ATOMIC_INIT(0);
>  static void __csd_lock_record(call_single_data_t *csd)
>  {
>  	if (!csd) {
> -		smp_mb(); /* NULL cur_csd after unlock. */
> -		__this_cpu_write(cur_csd, NULL);
> +		smp_store_release(this_cpu_ptr(&cur_csd), NULL);
>  		return;
>  	}
>  	__this_cpu_write(cur_csd_func, csd->func);
>  	__this_cpu_write(cur_csd_info, csd->info);
> -	smp_wmb(); /* func and info before csd. */
> -	__this_cpu_write(cur_csd, csd);
> -	smp_mb(); /* Update cur_csd before function call. */
> -		  /* Or before unlock, as the case may be. */
> +	smp_store_release(this_cpu_ptr(&cur_csd), csd);

Isn't there a general policy in the kernel that memory barriers should 
be accompanied by a comment explaining what other memory barriers they 
synchronize with?  Including such comments is a good idea in any case.

Alan Stern
