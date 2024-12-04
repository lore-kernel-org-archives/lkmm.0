Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B51F9AAC
	for <lkmm@lists.linux.dev>; Wed,  4 Dec 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320992; cv=none; b=Qa3b1oK0FCIWQRM7OpD8Um9/i8Hwum2UZAEu+tW+OPOzteU4Y1If50xvtpcV8S/5ORB4nxBKYDISKGn0bw7DqenA4U9BjqQp8GImP7SSxfJg0CXvwv6xDXa48/+honiRaDIEbs89OjG6c+cegb1lzxfWQPuTXZdtMdbNL8Z0lgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320992; c=relaxed/simple;
	bh=wiR5htVN+22hbXfWg7ML4jVM0P0Y7+RaaSQ2h6rUHR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QELAXsS77jSSlrDiZOrwRPZyr+sPArBTbMlVCCdT8MRMLCum51geS2riRCluqgwhTY+7X99/dVb3jXe4Gh0rwtUFIqTaLmCnniZWhxmRk0coyAFOF8Xo/OLdhhTFpuFjQUG5KHL8GQfmjBK3kUpdMXMDaMVGIW6/q7484h7liEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eh5Zt00c; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eh5Zt00c"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so5253569b3a.3
        for <lkmm@lists.linux.dev>; Wed, 04 Dec 2024 06:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733320991; x=1733925791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0SkLnU8JcXk82S6VfOwZc1CCUFMw4TrFjPFHV116tyI=;
        b=eh5Zt00cbEAuntfWNKljlTcO5IpluUYYISb/DoDvlwqYFlmRuog8mfYP+/bND/wNEk
         Yoo1XfzT4BJCp8czPZU/gNIgtgqsZrzG/Yvlb3M5NrOkEkFNpCFFWDEfPHC/5FgQIpe2
         n0yDiJcdv3MzedvwhTxaOFRe5xs7qbOcIvZ+xnzktW/lNT5H7fN7PzWd5sAz+ZOSpIdA
         AD0nHWIZGJfPZDUkqOe307OW7iZO8iEXFI9r7w1ILAQ7x/06nB9a8XW8nsqq5RMAmd1t
         VDiJiFjfDzqQQO/Hy2ajbJownMVN+q+KkVXN/ZhIXiYreEkBevYTsZzFJMULY9uMPaVs
         hJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320991; x=1733925791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SkLnU8JcXk82S6VfOwZc1CCUFMw4TrFjPFHV116tyI=;
        b=sihguDuuLVHL1vPcaTCRezCL7StU84FayZm/9u2L0s1twq6LkyGy5hySSWCMB9lnQU
         AZkgXSJZ/f4FxX5wU44L4JFnJznkk++FDqoHQsDGCfquaaIcfcrUQ8YNPvUKS6v/T7LN
         KUh5K9wb0Aww2BjiCmc05yu9gkw1i1/1pO8WAJ50YBeHLFa+GWQnbZ0uh+2l8ZAv2pRA
         QSsR833w1Ry1Pn71UhecUS0lEzyOFrCVMZ//yj99hW4qsrUr1aZbiTel8GNEeLP4EWbI
         YlW4o8knoQiKrqRAkKJdk66LH34Tq7psMKzP876TdVdYFavBzuFCrvicVwv6/GnvnhGn
         tguQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXiP9/tnN2wbEB5W26XVvJXMNkRGoLwhbYpKisHlqr9wQ87npf1t02LdgfIOCUs+cE1owi@lists.linux.dev
X-Gm-Message-State: AOJu0YyXZw8rIO+prBIiytei3q/Wy0WYX0Gl0uURa7PDnABYvmvhUtpB
	7880oia9k4e8S07+gzstxMHH8UxvYLHf18UYyk/sRNmaASnDhMKT
X-Gm-Gg: ASbGncv4vPnAkKqfWF6/HUzwaTPR4H7SHZEcBYBUxmdvMuHz690Fb08MTIwhRioYjVo
	0YarBKXTBSTlxIEaMZ4VLTGfP3unbFbMFPEXsyjZK+OZESkveg7zpVSKuqXSlLhCFx0HAEMSJ59
	4OLerSYeR8/kTGK+74M4sA1wwyMUQt5mXWRbBp1XX3AS/qA4ae9Zi0tzaLLjyFTE6NlWqMreXYF
	mvTYnX+5AWnY+9XokVHxs2sn5Qf6LhAYaYGbbA9TQTw8IqHBFum+Lk=
X-Google-Smtp-Source: AGHT+IEUKdzmeAo1eoMyTnSkc02brGe/K04CdFfkaSutlwK1ABZqZrvFGOq8UuSIGqZcRz48RNbWJg==
X-Received: by 2002:aa7:8888:0:b0:71e:41b3:a56b with SMTP id d2e1a72fcca58-72587f9083amr6136440b3a.24.1733320990387;
        Wed, 04 Dec 2024 06:03:10 -0800 (PST)
Received: from fedora ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417612b5sm12374317b3a.30.2024.12.04.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:03:09 -0800 (PST)
Date: Wed, 4 Dec 2024 14:02:57 +0000
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
Subject: Re: [PATCH net-next v2] selftests/net: call sendmmsg via
 udpgso_bench.sh
Message-ID: <Z1BhEQ5RsJqB2ugr@fedora>
References: <20241203222843.26983-1-nakayamakenjiro@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203222843.26983-1-nakayamakenjiro@gmail.com>

On Wed, Dec 04, 2024 at 07:28:44AM +0900, Kenjiro Nakayama wrote:
> Currently, sendmmsg is implemented in udpgso_bench_tx.c,
> but it is not called by any test script.
> 
> This patch adds a test for sendmmsg in udpgso_bench.sh.
> This allows for basic API testing and benchmarking
> comparisons with GSO.
> 
> Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
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
