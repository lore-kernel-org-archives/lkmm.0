Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B0822611
	for <lkmm@lists.linux.dev>; Tue,  3 Dec 2024 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191230; cv=none; b=qd6f6kJcXfQnJzZjnjnKB6KKxmqzfDa040BMxyyyXxMsC+kEJiNUUyjT8uJ+/7Kasnw46rV+zm9rwnnw371xIs2IRLhBBHCgtVaYOdt/xd8qAg7Olv45nrA2SXfBQh+RRY2tZjFRynwHZ3X4QqOLHVoYX9t3XuCFLX9bocWhRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191230; c=relaxed/simple;
	bh=EAkYqHxwoA0R0dcqG7W4lfpOriiOfn2sTkhuAvg1mYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW4xV4EJckC4a2a/8wiWz6J/N9f7IlT1jFY2YdX849nFc2M51yz2Z8QDcfrWjSXD/Dc7uWG3rddzfHuC2J6CEoWUJQJXar0wQKW37IvpWvW2HsN+5KC+M1PvKq1cvsW98SjGkdaSHijenwEmhxwwYUyNVy7GQ7zIStyUOAYn/is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnDHcf9i; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnDHcf9i"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724d8422dbaso4134779b3a.0
        for <lkmm@lists.linux.dev>; Mon, 02 Dec 2024 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733191228; x=1733796028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifhyXCPwj2ZS4FThasjY1J6PG/17ZdtDu1I6YUbkxr0=;
        b=OnDHcf9iqMrRZ+GMS5e6Gy5lR3NQbB3mhKt2/Z/4Y89S4TfTL+edgUrWlEVU/loNrQ
         DZesb+rGEyeV/Cl8TkOsImXe6ftSI8MGzHJgfANVYF4OD5+jCwUPOgIpXSAp9eWvF6+d
         ZTlSlBt1mkRJiWSCgM3lQM1MI5CI2L85Qz7Fzkc//FkboQNCOt0QZhgIUCW6kbcJDlqw
         JF5FPP1Pgt1uyJfnzC2+Uu6k7MNabmpoYI38u3CJ4XgiN6C4MloVKu2siXA87yAxE4ZJ
         X3FTX5aRTxQa6cnWKHrwsHUfq9muh6vtxUs+cDh+kYTdt1I5VNw/Pw7yV5m7ybfO8B2z
         E+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733191228; x=1733796028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifhyXCPwj2ZS4FThasjY1J6PG/17ZdtDu1I6YUbkxr0=;
        b=t1x8ZImYaXk8FgCWCuIaRGxYu+J3zYCkB4VZLywM63J3FOUNU2d1QS/gPlj78qDOgn
         F09f3b6IYcl+B15lCUQNYHt6UGGpaHXmZh5tjGx6cFXI8I++roX8LSpD1utcy2Lz+6x6
         F9J+MIHd+/k7cSesWXbnKDobSbuOUyBLLSUGDxzcR5HG2bWVlabYLrbmhe57EqL7RMTj
         Un/CfmP52oKIjvD7ZjqrTOq04jYemPG1qTcEhbXSrrFF6OHdvxOnMAU+E/GpAT4YjGCM
         e8YyXDMZQpprmQNHHWuJv/6KfV6jYAOq8LJ9/r892U04SeELGRFzl8HU19jKXc/1p+VQ
         clJw==
X-Forwarded-Encrypted: i=1; AJvYcCXrlMfX0i4597djSH5QhdOX8IeyiZaF/s1F1505HgPQiF14mCM7PjJkeNidpsqa22rqldKg@lists.linux.dev
X-Gm-Message-State: AOJu0YxEo0d0iDtyx70vFChhRHr4UINDyjf/PgZvsImIxjs3npqMpt8X
	pDWgHil22Qi8Rfx+ZEVEbSu/XBdVyGViIiPE+1KSJvVm+RPZFT4m
X-Gm-Gg: ASbGncsuvAPGqdzMUUP0KrXk3bd0VJVTgfGvGofMpMmptVazT1/XRUIwy26EE7iP/QQ
	6bQA0dp7ixeADZMbDQOO05jtTCAHffGf2dgWqnEL0kq9w/JJ4H2HUHpoGjEAMbcVhO9o+Qx3wQH
	+BzUIQRvLLrbn2q5VTg7rrLBQTLp3x89ACRAdMp65B6642ADEQ73NNvDy/Qc5ui6JK99sF3tAk1
	2oaqtyAPhoQUtPw7KFVnqiufpUvIBkpZJaaxuV7WqbAGY9BOqBLEJk=
X-Google-Smtp-Source: AGHT+IEe0uogUo+ebVsZ0JC4jhKeRE4kCvwTmE8uI2YOgw7JxmzvRPXAWvNj+Oa2WPogiVf++p7dKQ==
X-Received: by 2002:a17:90b:1b52:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2ef012019a9mr1313043a91.15.1733191228010;
        Mon, 02 Dec 2024 18:00:28 -0800 (PST)
Received: from fedora ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eee1591fbdsm1908976a91.35.2024.12.02.18.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:00:27 -0800 (PST)
Date: Tue, 3 Dec 2024 02:00:15 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
	Shuah Khan <shuah@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/net: call sendmmsg via udpgso_bench.sh
Message-ID: <Z05mL1WQHBLRkIw1@fedora>
References: <20241202232129.7139-1-nakayamakenjiro@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202232129.7139-1-nakayamakenjiro@gmail.com>

On Tue, Dec 03, 2024 at 08:21:29AM +0900, Kenjiro Nakayama wrote:
> Currently, sendmmsg is implemented in udpgso_bench_tx.c,
> but it is not called by any test script.
> 
> This patch adds a test for sendmmsg in udpgso_bench.sh.
> This allows for basic API testing and benchmarking
> comparisons with GSO.
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

Reviewed-by: Hangbin Liu <liuhangbin@gmail.com>
