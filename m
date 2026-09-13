Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DC3812EC
	for <lkmm@lists.linux.dev>; Sun, 13 Sep 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292903; cv=none; b=La2INJFeA6I+e2aeGoUnrDnBtyvnTvMoWPirtlzZWgw0P3vwnEokPlKyt+scxVCWiCqbRD8kZnQqWijWQOT7Q4inxZBIOe2Z8AM8epk8++ah0WsWUxtcW19AMTj14GJ7IglORDCEgigRbfcqDWm1lp03YS1cThCtaOB/wHu6zmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292903; c=relaxed/simple;
	bh=owsxUV26+TugNfbC4Bz0+KGKiRcbdSBwVMp6oIjgyi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGUuUbsLKGwgc9vFIvNtESLrKbKpgrd4bF2JndxKkkwgbkb4974P7c/COmlvitLqZC3udHWqUanK2Q08fvl3lZbn/SF0d1Wc5hwOzDYPjlr9IaN4QZrjDX5Nd8dyB1j02beYiH9SEiXczuS8cw9u1zutxFLa9lDAFjgxNCTWcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6+4ROmB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6+4ROmB"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so664226a91.0
        for <lkmm@lists.linux.dev>; Sun, 13 Sep 2026 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789292901; x=1789897701; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6u+Sjb8r7xjY6JptTsujS7yPcyjNk7vFPdDqkz69nM=;
        b=f6+4ROmBQr1bGzGG/oFimf+A3u7dfsYkRJponc6mOYbSezpWbSOBAbyLeAyvhUfPo/
         XZqhhNQ2DWpiF6DsqrjRJK9+r39P2rTj3Mfq4H8AWAqWmH2hRvUZEMpZTbYVSUKOFYd8
         sigyI8OTfop1/4FGsYNdD1k5Zf0epWTKjpCLl0m9pJy/esw+e1f2HxQX7NOmTtmV0k5g
         t2+e6xBkRltrYMIQMhPIovKYNcfMS04g2LLbO5JDsQo9WGlvATitN89itEededVFdFXZ
         TaxuyzHMEoZ5/11lTzxP8yCpcqexJqDwFaT7RfCO/nctd4YDmI6ve2CWqq9MbsXfd4Kt
         6E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292901; x=1789897701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6u+Sjb8r7xjY6JptTsujS7yPcyjNk7vFPdDqkz69nM=;
        b=Bm1glwGBFNM0yhHt6X7VNWx+y5rD+X2yGfzheHW0MOw59SXr7w1nOupOCOoQWsjSxV
         cpdvjUVcq3nmbWSoR+7Vrj+5nNuUytAFwAm32sin/7Bfnu/XMomkKxg7kfEgsfszEkYH
         HYXHzMQ7M8QCTb6BSkFlfeO/bwdCOyeRPuNe7gkcZne4y8u3V8tUAp911UAUSBYV4hAQ
         eCV9xRS7e8rr5sSgyC26x7zI7c9EQEkbbWHgf0c65rkSPjOAdY5ok5vXl2wrdNFOpmp8
         RWbVdMPle6vx8zBzWGqzihnvMsCjFh7g9BjLh24j5+OEBEUZAmVw/stR+Cz2fi3Xh7Ec
         62fA==
X-Forwarded-Encrypted: i=1; AKwUvBwBKZRsszBO18iwjsHGUubzIf2nMvcxfllrau+kL/6f3C4DlkgDJ7of1e0e+HWQQJsbXbmF@lists.linux.dev
X-Gm-Message-State: AFuF++nL8wYfgr9Y5/5YtxOZGDPfCt8eBbN0ySSoOYdX0BtvVFwmTI7q
	JlFelLw0C6q/l1Dg/nsLg2DrZMU69rv/BBU62ZVTWVbSmM+PzojPwRoi
X-Gm-Gg: AYBFou0WSFEopmpynUSiZRMAAYZZiWtS53nTJzOJBH0CaxDUwV8shVWkK9A2yjYfHcD
	AiJOJ19Esp1XHztyrFCWoeuKFOvts2pF+WYDHRR9fNq8bhfKkabLnmDHSna7/1UaIvdPFx1WSTC
	JCSYo57+woPEBOFh8PtLoe8jFnVin1pU5WkNZ5+rj/wDNwSk/3KUiN8AhASmslf+1cpbKGzu+8W
	uEx/QWsk9lB77kyu+MALdNsvoYgNPF95BhmEFJvxWgxe9xeANhGCIiGT9H4a5YMuqD8CsFw0q2r
	3h4Cc5+YsEX4ZI5VJEiQU7ItHe6ElPq0yHdRJSCPmYOwgxg6RqxwdiyxrnCqypwO9RAKuAvJ192
	yG0bwkb1aB4VfBp8st8V5MiOWzxtRdoGWS6PvYO5INNpciXXMgSQMFI9vOD1PsPLldK/uDpEmFS
	GbWrC69wGRktb4WtlCBtYKDy1Yf8lMUEbMbsHSknIJH/Ek12TddP9sxTWP3hfReo4ZESRw/rNQi
	A1uH6lOjAGpuZJLBNy9TXSFqVgxXegtCDR6jCl5Igoo
X-Received: by 2002:a17:90b:53cf:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39dbbeb3c67mr11040631a91.6.1789292901241;
        Sun, 13 Sep 2026 02:48:21 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cf9a6sm14389647a91.10.2026.09.13.02.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 02:48:20 -0700 (PDT)
Message-ID: <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
Date: Sun, 13 Sep 2026 18:48:18 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath
 anchor-before-scan test
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: linux-doc@vger.kernel.org, lkmm@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, paulmck@kernel.org,
 dlustig@nvidia.com, joelagnelf@nvidia.com, corbet@lwn.net,
 luc.maranget@inria.fr, j.alglave@ucl.ac.uk, dhowells@redhat.com,
 npiggin@gmail.com, boqun@kernel.org, peterz@infradead.org, will@kernel.org,
 parri.andrea@gmail.com, stern@rowland.harvard.edu
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
 <20260912024225.2872265-2-kunwu.chan@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260912024225.2872265-2-kunwu.chan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

This is more of a knee-jerk reaction, but

On Sat, 12 Sep 2026 10:42:24 +0800, Kunwu Chan wrote:
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
> increment, with the smp_mb() of __srcu_read_lock() following the
> increment.  P2 models an observer that sees the reader's increment
> before seeing the anchor.
> 
> The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> which permits this outcome.
> 
> Tested with herd7 7.58 using linux-kernel.cfg.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> 
> diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> new file mode 100644
> index 000000000000..efa9c0c4e047
> --- /dev/null
> +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> @@ -0,0 +1,57 @@
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
> + * increment, with the smp_mb() of __srcu_read_lock() following the
> + * increment.  P2 models an observer that sees the reader's increment
> + * before seeing the anchor.
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
> +P1(int *ctr)
> +{
> +	WRITE_ONCE(*ctr, 1);
> +	smp_mb();
> +}

As P1() has a single memory access, this smp_mb() can't have any
effect on the outcome.

The one you see in "__srcu_read_lock() following the increment" is
there for other ordering requirements, I guess.

Ditto smp_mb() in P1() of 2/2.

Thanks, Akira

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
> -- 
> 2.43.0
