Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AF51DA3D
	for <lkmm@lists.linux.dev>; Tue,  3 Dec 2024 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239283; cv=none; b=MRqjnOdc0RDHMIQeIHL5eiAoJ5PVH1kCt7sphBqXlrYNntHO6/mxXzAcIHxBFDIKnscyjXcE0aRwP0Nfc4w/hUyW3Rb1bASHb093Ck7vFIUxVyuin2R9yqCkqyiUKCwkzW9ratJvEmauyIBatptb1fsVbNALG3DGx+TReH1T4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239283; c=relaxed/simple;
	bh=t8yscXsYjfpe/1tcoMvCTfOcyi3GhvMr0P2NT0AZHzk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=NDOTvpYXolAMvRnkODBz9ftwwnokmEUXpBuxvbS6IPchbs0U0sR4z9KRDZh/rmdwxf/ZXpmwy8Y8dJmgBcQh6PItk6N1sWvXmKL05ECSuivB7CmsRwJsKfORn82a+b655/pAmfOrRttyoy0MOtUPi0bQ6xNSa5vpkxJjDaG56TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9QVwxn7; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9QVwxn7"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d87ab49423so36058396d6.0
        for <lkmm@lists.linux.dev>; Tue, 03 Dec 2024 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733239280; x=1733844080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqsVHmCOaWiBo6waU1R1vraLU/LK0vRFjavrsVUjZLY=;
        b=G9QVwxn7Lu5nnzJs1IykSfAlHOKLy082OCqzW3UInuNll2l1HjELIt84WU/mnJdXdz
         2MgV3Ftzb9mv+RYm8PPzUO+K9DEifYBErybhKUs0i3Pt9xw3tROII//0Dr6dbWfC5jMh
         C+HIpcd6hKu9TlQogIGJrd/dA4TjiVbixmZN+yJnKNXkyEes0f2aaUL9/DBttDiM2nXr
         aOEULsBsj1PfG5A60k9lQ5wr7wWBWT48C3zSxqqsHULCQPfQf3adc6YNye6bskpMnD1P
         QZoP8u9u9mUBSoBt8okGMAuNGcJtpfTRoH3Y2Dq+v2teSahilu5Jz5UoEVUCRs5mR3Kf
         YdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239280; x=1733844080;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VqsVHmCOaWiBo6waU1R1vraLU/LK0vRFjavrsVUjZLY=;
        b=bOwMFLyhIuo/Uh/tRGhN2RA6ryPWbBTLIt4fSzKldkefGxH2tp2m4tCzhy8ttFW3uy
         /xhsJiShwX00wbIVDSs2w8Ut/F+xB72YS/Nsdsk9Gg4be0xZjApEHeRYNs/k4BzdbBax
         3TMcw47iCUDMU02UQlNWeot6Pb1scuyLBoj2VSRnHGjs8uOvJTP2s0gfQDVuEN3Axk/3
         XmNqsHSLVydmPgzrCv0cpEOInVSm2HEuYRTOfaXFx2qhZSHVH+Zb4T3+yd5ATtbAuBN4
         h2SXiuItgruLSnGs0UENreHvkpd+n01QT9jBhLZ+FFgLUEhbXKl/Kj6if9+nx/grvIb/
         iElg==
X-Forwarded-Encrypted: i=1; AJvYcCW5+fpq46uzgkRNze9PKPWW+9WdnOMy++Pztv9bZazPvh2WhDMJUPpUVVPQpOF+q6oNuhUB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb2v85MWHO6rKHZPbziz0LBNedhW3x5QXVHYa9DnWWZRAWSoMJ
	AnO0HMNeCAk1DKKa6zxdUySWjywpBjt2RUxrJKYjwKbfhJye5tk6
X-Gm-Gg: ASbGnctFXmRHZcrI6sW1IjUyssyBlD5D/K7DHtqg+Px1g8UIXDQDgqtCx6wiKDeWWBC
	pfG18Zg9Moq/lifCpgfUTXnQ5/bk0bl5r4o+7LYbvGKNeOXyE46dPZTWSXMJLwIEWzXXKuRh+MP
	0dAA2mb9D82R/znOpFkt4lJcHa/neDLKmqOssV+fSnmPzDwuV6KITgcB1CnO7seROOEty2MHyyM
	lPMjF7HVHfd/0wm8ThbWCrVFeahT/E0AT4TgxcFLV1ZY1DFAJgI+fsNkCTzSrZBbH+Gd2/wI/p6
	oastzEstDoIdk4MMz1uUVw==
X-Google-Smtp-Source: AGHT+IGPHit5+V6UhQpAx4/BlJFXSsgH9I6LPVgBePoc1CSG05dOym+Yqu7WxRzxJcebBY0CylhigA==
X-Received: by 2002:ad4:5b8f:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6d8b737d8d2mr41162076d6.22.1733239280369;
        Tue, 03 Dec 2024 07:21:20 -0800 (PST)
Received: from localhost (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d875195da6sm61747786d6.57.2024.12.03.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:21:19 -0800 (PST)
Date: Tue, 03 Dec 2024 10:21:19 -0500
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
Message-ID: <674f21ef3048c_19a62294c6@willemb.c.googlers.com.notmuch>
In-Reply-To: <20241202232129.7139-1-nakayamakenjiro@gmail.com>
References: <20241202232129.7139-1-nakayamakenjiro@gmail.com>
Subject: Re: [PATCH] selftests/net: call sendmmsg via udpgso_bench.sh
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

The change looks fine to me, but the commit is missing your
Signed-off-by.

Also, if resubmitting, please mark [PATCH net-next v2].

> ---
>  tools/testing/selftests/net/udpgso_bench.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/udpgso_bench.sh b/tools/testing/selftests/net/udpgso_bench.sh
> index 640bc43452fa..88fa1d53ba2b 100755
> --- a/tools/testing/selftests/net/udpgso_bench.sh
> +++ b/tools/testing/selftests/net/udpgso_bench.sh
> @@ -92,6 +92,9 @@ run_udp() {
>  	echo "udp"
>  	run_in_netns ${args}
>  
> +	echo "udp sendmmsg"
> +	run_in_netns ${args} -m
> +
>  	echo "udp gso"
>  	run_in_netns ${args} -S 0
>  
> -- 
> 2.39.3 (Apple Git-146)
> 


