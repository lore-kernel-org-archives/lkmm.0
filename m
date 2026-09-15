Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F43B6BFD
	for <lkmm@lists.linux.dev>; Tue, 15 Sep 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461245; cv=none; b=RFHTauKa7bv9bgUiYEeNGrxrzNvHSQRfnD/le6yUC0gTAk4BRWL4E89SH8QUqdBVznuePH4tfnMrtqJWCkQaiT9ecDIK6GCWpAEfw9IGIjtVZChrlCPrtVb1VB3y25pkHkEhoM78KYmpDlvojROgF79g17YcCDHZ7/ZZ0lZqyFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461245; c=relaxed/simple;
	bh=6oazE5lyXKugirOnKSHAnIRQytAaJZ5lnjV8psy6s3o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E3UTZusMuFZAHhUn/QePXWLWbxU5FzuZ+aEZ+heYwXEzy13xD4GgpuXUhg5Lib15qQ0kJVD0nOC2dHkEt5PyQtVfvLyEyOuc4uY7yLOh7PPG0cyNE6PEjvlYTO9zZ5irs6X4+IPC/KA6+RUrI6OsSaRI8RXTfnotQ7LkSsvP7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2Wb7jqX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2Wb7jqX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so17082a91.1
        for <lkmm@lists.linux.dev>; Tue, 15 Sep 2026 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461243; x=1790066043; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hpbLL6EWSOuJK30L0ZNRx6vvSYbzSqSPnWalwqYVt2E=;
        b=I2Wb7jqXNLTv7afOdarCFDuoke1lTH+jDCl3cgMKFxpEYT3VAUaZfW1E++YHbLHuvC
         uZwGUgzHAwUrc2MZ4+TC4YsxGcqszRL6DMEVjy4acKjbbsJcXMXFkrF3KeJcGCUYPsQV
         wxkMYejmA9PQPqiT9r1NEFIQQo/QG962Df0VXtdupANNPm7uD9SPSmDfOLIfakGN6oE3
         CS8fRGVGWKuNGQdhtsIFrxoiIWkfaa/GvIeqm1MqDeS3i3K485Bn4FMdBwt6n/IPmb9i
         58D0EK9TUp8x/5YTJVL8Tvy/A7pnOgiN4CYfbNdiJ/7O+FFfvqplrlxtmsPUdX/JeVox
         EvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461243; x=1790066043;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpbLL6EWSOuJK30L0ZNRx6vvSYbzSqSPnWalwqYVt2E=;
        b=ePzh5v4LWNL0FNpRuPNvmXM1hMffoQB4C5nrwR/xrzzk2xG9WLQkr2vhqfrQsGMSJr
         Sj8UAiJ/l8I3XFbDpR2StJbBvUYjiDTzT0+0sauMNPoUjTZmCv7UVSLA2d1Xbkxmf74h
         R8MgPYKG8JSahdL/X6NSM/8ou5kKrSSEgdQfGd0GWTAh6lPE0Qh8dY8FZmbX/JsuFZnX
         Z3jD4XtR4P78Hcof5GXafwvcuqgBnR4qxXJA2fm67NVYllwvrdfgPahgOAJwRTHZVQBh
         S2lQJJXM4g3a2/nIDYn3xE9/gVfGMaZUxsrwYAEC9V01c1PHlKbyyAZ5Il/hLttHYeDS
         ya/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7Zbk/a1wbZA/zY2r0G8IKrnmm4kYK/yF3ZtJfAclyV7Q7WbgY85VQUYRbYJvMAOBAOP2A@lists.linux.dev
X-Gm-Message-State: AFuF++m3arXWRE8EhbDseBylbCr20+1GBDV3QbQzd+iyoTj8UEvf1IcD
	PubuND/jaC5ng6pXNZr+5rNX0H3qv+ti8lw67c6vFjnZWSYdnieC6Jor
X-Gm-Gg: AYBFou0LzHJsIxowb/DJlfWKCsWo+uCsaHE1j3+ureWqgLKbuDdMn4L+qmk480sqgpK
	8blvmXbMSx6OfuyGfHerWlQW+PKBLJRTUR3UCQggPEovTCIR2o07KcWHi71bY/IFS/piG9pcYV8
	QQEt38N/QTBIE/kS6pgpCSzEmcttSb8F2OxpJfZY8PtD6YDME1kOGUa1ZLo+JQ9VkombJhYtSGj
	fMN4HmK3L81xR/DRXYF6VE5FQyrlldZ+tUiypC34zRCSznDW0uxnYGYxGhjFvpb2pi6F/eO6hJ6
	0yp/SbljerTirgLSqVpKI8kqCEqxRmjWCVV/nE6CLw400BsCzZohoARpBN4Tsx1ph6uaZ+rPw/a
	knNB5Ro6UJp8xDUfqjX+XBB6xptfXS906Il4GZeQi7I8ZMtZxluPiNPY2cZlzlBkZ+JMnzFIRS/
	xgu5Je1JVhglScC6/gWdXqN0omZDTHdrmW9IqcpjnT3QKvfrcuN3BdhQkNEp7I4NfsyA/NV2sh7
	6Beq4uZGZzSqmNQ8p6HZ/vVidOIwqcy4QtWR9zkVY49wA==
X-Received: by 2002:a17:903:b88:b0:2da:e967:7953 with SMTP id d9443c01a7336-2dd8384d004mr1520765ad.12.1789461242775;
        Tue, 15 Sep 2026 01:34:02 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm34165946eec.29.2026.09.15.01.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:34:02 -0700 (PDT)
Message-ID: <9106d07e-a8e5-4379-bec6-eb4ee9f0df5c@gmail.com>
Date: Tue, 15 Sep 2026 17:33:59 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v3 1/2] Documentation/litmus-tests: Add SRCU fastpath
 anchor-before-scan test
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: linux-doc@vger.kernel.org, lkmm@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, paulmck@kernel.org,
 dlustig@nvidia.com, joelagnelf@nvidia.com, corbet@lwn.net,
 luc.maranget@inria.fr, j.alglave@ucl.ac.uk, dhowells@redhat.com,
 npiggin@gmail.com, boqun@kernel.org, peterz@infradead.org, will@kernel.org,
 parri.andrea@gmail.com, stern@rowland.harvard.edu
References: <20260914143943.1503066-1-kunwu.chan@gmail.com>
 <20260914143943.1503066-2-kunwu.chan@gmail.com>
Content-Language: en-US
In-Reply-To: <20260914143943.1503066-2-kunwu.chan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/14/26 23:39, Kunwu Chan wrote:
> synchronize_srcu_atomic() may end its grace period immediately when
> its scan of the per-CPU lock counters finds no readers.  Correctness
> requires the grace-period anchor written by srcu_gp_start() to precede
> the smp_mb() ordering the lock scan.  This ordering ensures that any
> reader whose lock increment is missed by the scan cannot have
> incremented its lock counter before the grace-period anchor, and
> therefore cannot be a pre-existing reader of this grace period.
> 
> This litmus test models the key ordering between the grace-period
> anchor and the lock counter scan, where "seq" models the
> grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> smp_mb() and the lock scan.  P1 models the reader-side counter
> increment and its smp_mb() from __srcu_read_lock(), which orders
> the increment against subsequent critical-section access.  P2 models
> an observer that sees the reader's increment before seeing the
> anchor.
> 
> The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> which permits this outcome.
> 
> Tested with herd7 7.58 using linux-kernel.cfg.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> 
> diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> new file mode 100644
> index 000000000000..e0492a4d8e07
> --- /dev/null
> +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> @@ -0,0 +1,58 @@
> +C SRCU-fastpath-anchor-before-scan
> +
> +(*
> + * Result: Never
> + *
> + * The synchronize_srcu_atomic() fastpath may end its grace period
> + * immediately when its scan of the per-CPU lock counters finds no
> + * readers.  Correctness requires the grace-period anchor written by
> + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> + * This ordering ensures that any reader whose lock increment is missed
> + * by the scan cannot have incremented its lock counter before the
> + * grace-period anchor, and therefore cannot be a pre-existing reader
> + * of this grace period.
> + *
> + * This litmus test models the key ordering between the grace-period
> + * anchor and the lock counter scan, where "seq" models the
> + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> + * smp_mb() and the lock scan.  P1 models the reader-side counter
> + * increment and its smp_mb() from __srcu_read_lock(), which orders the
> + * increment against subsequent critical-section access.  P2 models an
> + * observer that sees the reader's increment before seeing the anchor.
> + *
> + * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> + * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> + * which permits this outcome.
> + *)
> +
> +{}
> +
> +P0(int *seq, int *ctr)
> +{
> +	int r2;
> +
> +	WRITE_ONCE(*seq, 1);
> +	smp_mb();
> +	r2 = READ_ONCE(*ctr);
> +}
> +
> +P1(int *ctr, int *x)
> +{
> +	WRITE_ONCE(*ctr, 1);
> +	smp_mb();
> +	WRITE_ONCE(*x, 1);
> +}
> +
> +P2(int *seq, int *ctr)
> +{
> +	int r3;
> +	int r4;
> +
> +	r3 = READ_ONCE(*ctr);
> +	smp_mb();
> +	r4 = READ_ONCE(*seq);
> +}
> +
> +filter (0:r2 = 0)
> +exists (2:r3 = 1 /\ 2:r4 = 0)

Another knee-jerk reaction with exaggeration  :-)

Why does P1() have an access to an un-shared variable x ?
smp_mb() in P1() can't pair with any of other thread's smp_mb().
This doesn't make sense!

Let me rephrase.

Litmus tests is supposed to be minimal.
Every memory access and memory barrier is expected to
have some effect in the outcome of the test. 

In this case,

P1(int *ctr)
{
	WRITE_ONCE(*ctr, 1);
}

should be good enough, I guess.

(That is, IF I understand what you are testing here...)

Regards, Akira

