Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255F41B4F0A
	for <lkmm@lists.linux.dev>; Thu, 10 Sep 2026 02:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006608; cv=none; b=u8+RXvKRn0HqQm85qkc70Yts1FeymKw6Er8sF8WSkWin+O4TTWFjplbyVrKwNZMC0JibbEm754JPoCtf6qXkCQ2YrRRVQpHQOmwim0xA1E2DzsFdAD56ZXsgRxwThaKX/POKmfwUd7A7KZiR4tHJBrOHi5MhqJ36BBaPDHnzkwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006608; c=relaxed/simple;
	bh=5ljHyZcSO1WxKxaTORvyB+sKIUebQ25L27nHzTbuhDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCR6JahxrFEgtbwaeF+a6b5GzqvpdEfyEHGujAigRTS3DxMlHl60+pkSl7yD0TUzbttPdhmc9F0YvrPEZQJi3eTAC/EkXvHVacHCJMcbVvPGnqpcLDbCL35A5fumWdC3mmZ7mZ8GUlioB9ekMZwhvr4q5ZGBBJpQ4revzUk4qjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta/C1zp7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta/C1zp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789006605; x=1820542605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ljHyZcSO1WxKxaTORvyB+sKIUebQ25L27nHzTbuhDU=;
  b=Ta/C1zp7aGsV+JNXt/Nf2h8td5DXGWkwzFnXiwsh6VMKgQvnsbD5d+xd
   q1xnhaevPBjrXW/SgaiiY2ogoLEtY2gz0Riy9rKlChszSfDd1MWWdKsdy
   dtCc2etNlAcryJU0pyCVH4jv+kKG9c3As2UFSCLyqTt7xxmcbDMC19A0p
   bNwDS9eOWOjDk6LjnTPN8Gn4rUcfJaqfp13uua2KFfRAg/hk/MqA1m8mV
   WOV+mSG2HEPh4+c83mB6xxciga/nn7xrOV4U1Sjg7UJFzKvXkvTu6BZtK
   Dx2iRS/ne0gy5ppEeXfAGJbnTOWxePDHDvOfVyXEfNLI4XkOMrKY7gRMf
   g==;
X-CSE-ConnectionGUID: ebLeyXmCRNO/Lx2t6WKBIg==
X-CSE-MsgGUID: 3XxP+Yn5Tfm9KD4UJIchZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89487064"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89487064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:16:45 -0700
X-CSE-ConnectionGUID: CwsQasK+T8OeF2JdnFv+aQ==
X-CSE-MsgGUID: 60o9EmkQTLC/ZcHOX9qZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271466479"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 19:16:43 -0700
Date: Thu, 10 Sep 2026 10:16:39 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>,
	Boqun Feng <boqun@kernel.org>, rcu@vger.kernel.org,
	lkmm@lists.linux.dev, yi1.lai@intel.com
Subject: Re: [PATCH] hazptr: handle NULL address in hazptr_detach
Message-ID: <aqITB4oCfaR7vD+G@ly-workstation>
References: <20260908152228.4154-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152228.4154-1-mathieu.desnoyers@efficios.com>

On Tue, Sep 08, 2026 at 11:22:14AM -0400, Mathieu Desnoyers wrote:
> When hazptr_acquire loads a NULL pointer, it sets:
> 
> - slot_item->slot.addr = NULL,
> - slot_item->ctx.ctx = ctx
> - ctx->slot = slot
> 
> And it returns NULL.
> 
> Then hazptr_detach is called on this ctx, it will act on the ctx as if
> needed to be promoted to backup slot, even though it has a NULL addr.
> 
> Looking at what hazptr_note_context_switch() does before promoting
> to backup slot, it checks for a NULL slot->addr, which is exactly
> what is missing from hazptr_detach.
> 
> With this in place there would be no need to explicitly check the
> hazptr_acquire() return value before calling hazptr_detach().
> 
> hazptr_release() has a early return check for NULL addr as well, so it
> makes sense that detach does an early return (no-op) similarly.
> 
> Fixes: 6357ec235c59 ("hazptrtorture: Fix hazptr ownership issue")
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202608130915.62b53936-lkp@intel.com
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Bradley Morgan <brads@mainlining.org>
> Cc: <rcu@vger.kernel.org>
> Cc: <lkmm@lists.linux.dev>
> ---
>  include/linux/hazptr.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
> index 43122c5673bd..d1670121947a 100644
> --- a/include/linux/hazptr.h
> +++ b/include/linux/hazptr.h
> @@ -160,10 +160,12 @@ void hazptr_detach(struct hazptr_ctx *ctx)
>  	struct hazptr_slot *slot;
>  
>  	guard(preempt)();
> +	slot = ctx->slot;
> +	if (!slot->addr)
> +		return;
>  #ifdef CONFIG_HAZPTR_DEBUG
>  	ctx->detach_task = ctx->detach_cpu = true;
>  #endif
> -	slot = ctx->slot;
>  	if (unlikely(hazptr_slot_is_backup(ctx, slot)))
>  		return;
>  	hazptr_promote_to_backup_slot(ctx, slot);
> -- 
> 2.43.0
> 

Applied this fix patch on top of Pual's v2 RFC patch series. The issue
cannot be reproduce.

Tested-by: kernel test robot <yi1.lai@intel.com>
