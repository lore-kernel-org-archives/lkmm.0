Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B01C3C07
	for <lkmm@lists.linux.dev>; Wed,  4 Dec 2024 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339777; cv=none; b=YKTtCzgHKtcEchU89rh4mtqwjaiyvO5qO23uyVjkObNfHIAtbMh6Sl0zPtWMnHU1sn2FW/vNbN82z1xQ6ML+k6hNIOQ6Of0CwbRLd8ym0fUkgm7oHGlGXeJqN8q+3DNlkua0G88T6QG24ZghoPSlOsCz4Zt0gq6UjheNUwghYRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339777; c=relaxed/simple;
	bh=riFR1uFph0+nEzIzgS8wLwTUnFjsEBS3WhqWQhLswo0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=IJ/sQtyEqHjxGRctShdTyX8ZSTAe4GAbceXvqg4omhFoVvya3CpNku3REOOtGIANE33OfYWO7wOsc0t3MRUh6UEb1zYn8rSmwvajCU7+5jQxiIqLVANH4KFzHl7TYQPcumTGWSboXy7lOHZHcJu0V0y28jHzErBNygUKAKnyIZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkDL1Nhx; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkDL1Nhx"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4668d7d40f2so545901cf.1
        for <lkmm@lists.linux.dev>; Wed, 04 Dec 2024 11:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733339775; x=1733944575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr0hdtkXWBz6Deg8rD9qqpfL9wDCS2J4zLJaloBbbT4=;
        b=mkDL1NhxhSNQPfVUD8Pga/Z6M+0g3vgM48tArKKBP7GH1W4wCNN6TxfIZvWveFGkt6
         u/lHEQhHa6LZ3SBHCrNcdOhCt7uFeoRnjnvepabXldcGzi6fMGYVUrmhvPWfR2fxZjlY
         ZXF4r7KG/7mlV89J9/LyGkl89rA6pmE2tUjKktmOBNppUoUYTe0ZuaPE4idSYAipw568
         F9JFctj+JJwsJCB+jsuauuPANLmusTc81plenr+XRy5OwWuEuRM2ILBPwNIjGdNAnFPZ
         JY1cFtUs4h5EBkGoQ/vmGg/tpMWCN9EVJIjqRqHrDqsZzHbo21hUyX5y8/0nC0F2ZlKc
         g/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339775; x=1733944575;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pr0hdtkXWBz6Deg8rD9qqpfL9wDCS2J4zLJaloBbbT4=;
        b=phld76bPJShLe6qb+eoidhSfLai8b99RqobWdEjQPaVvccgDHU6Hlr8yw6Qxzbw2pD
         Lt2v9bHnYhqtDDiwR77SIbZQhCamKBP7L5D3yk72YmQsLCSMQnNZVyvzuP2qFaIa86iq
         qfHMExqM0wNCLKZ2Q7SjdGG9RbBBDkbwfTesC1d9szXSm/huPx/RY8AIgdBKGRV2lDxE
         rbYrzcPN0D0hBrW9bPG2HfucdE0bTivA4prVHWej0M0fU9niML7HYTJORWXNQnnMcodO
         vgtDVoSUOngc2DVTDlxpRyyd71tECKbQjTBOu3a8TqKfr1Br6/9ZaL62cCGMbhYC3ihc
         c8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIcLcbTXA2WYZss4xV65IV2SimxCLnMKC886ASrqsl39mz0rI6Pv+Ttp/a6aXL606OkTZX@lists.linux.dev
X-Gm-Message-State: AOJu0YwANBXKQgZoOtoMpbUUMnL9xbpTcFSvHXqxGZQlZFqOX8eie+Wd
	sUbVSGcLjMpTbUs/lnahxSV1DTHl5bl5GORWijh8c+SFKeVbVabQ
X-Gm-Gg: ASbGncur+XWDtNjpxRB0uCmOjk/llvfWgQHhovEyDAq+utCDziUCmh1msq/tJ+qVFt6
	4cbD1Mf6xy+ctKKy23CklCVdVR93/E0MtzRR+c/NFNIO5fax5uGtoV7S7nL7hG8Y+m42Gxlceew
	t/BNhx9KgrjulfbxAQg1sNSvmz+vWt4QTlAMTm4akcOUsOSIFlTJw3HNJHYDCRSxGNvEFxL0xSn
	3bhvCF2eG1Ju6mXKbuJq4QOEf67r3MVQd5ntW0XfgYK6daJ12Cti+OTzgSU6+3q1iJzVDk3EDzt
	N181/n3ywFl3XYLfRd5/kg==
X-Google-Smtp-Source: AGHT+IGvHGN7TJ0teVYRi09OToFGV/F78Y/ZVg2hNhJyImOWe5fuNzGtXanUUzFhOp4XNh/yEmEP6g==
X-Received: by 2002:a05:622a:50:b0:466:9938:91f6 with SMTP id d75a77b69052e-4670c6c5422mr109547961cf.51.1733339774925;
        Wed, 04 Dec 2024 11:16:14 -0800 (PST)
Received: from localhost (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c3fa58fesm77103941cf.0.2024.12.04.11.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:16:14 -0800 (PST)
Date: Wed, 04 Dec 2024 14:16:13 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Kenjiro Nakayama <nakayamakenjiro@gmail.com>, 
 Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Andrea Parri <parri.andrea@gmail.com>, 
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 David Howells <dhowells@redhat.com>, 
 Jade Alglave <j.alglave@ucl.ac.uk>, 
 Luc Maranget <luc.maranget@inria.fr>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Akira Yokosawa <akiyks@gmail.com>, 
 Daniel Lustig <dlustig@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, 
 linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-arch@vger.kernel.org, 
 lkmm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, 
 Kenjiro Nakayama <nakayamakenjiro@gmail.com>
Message-ID: <6750aa7dc6dfd_b1fe52945f@willemb.c.googlers.com.notmuch>
In-Reply-To: <20241203222843.26983-1-nakayamakenjiro@gmail.com>
References: <20241203222843.26983-1-nakayamakenjiro@gmail.com>
Subject: Re: [PATCH net-next v2] selftests/net: call sendmmsg via
 udpgso_bench.sh
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Kenjiro Nakayama wrote:
> Currently, sendmmsg is implemented in udpgso_bench_tx.c,
> but it is not called by any test script.
> 
> This patch adds a test for sendmmsg in udpgso_bench.sh.
> This allows for basic API testing and benchmarking
> comparisons with GSO.
> 
> Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
