Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BA1DFDB4
	for <lkmm@lists.linux.dev>; Mon,  2 Dec 2024 23:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733181702; cv=none; b=GdwGFaPUojnEwbd436we2y1kJpCjFRpIjq4J0JGd0tP6CuNhPzaC02KYQ4VIE6jFXQ72fyOiEmgJex396F37MroTUsxj4eiFojrdbSV0LjiN9wTxl6J3P7B1Z49dRFsIZLRdI3xySkCjdf8VedsNBdrcR5vdHsfUKzvF1D2Tiyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733181702; c=relaxed/simple;
	bh=T0fJkNN8lmu0yQW5xDMaUNuwSNQGFIOPmvlds70OAcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VqAaGkXfLpnBhUvBtzSinnyHB/nrktKCBDktht4T83cGXiGoo/VCz2lPeTuCkbCCbEsZ0SeTHvo0aiszlUWc1B776Mvz1cVh+kY6LZslCqbXlI+EQj+Gy31iuVwlqQnEo1BFeff83WiFD1E+YT5GubA5bLyG2nF6brHtOH1ekdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQ3Pq8+H; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQ3Pq8+H"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7251d20e7f2so4854451b3a.0
        for <lkmm@lists.linux.dev>; Mon, 02 Dec 2024 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733181699; x=1733786499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyFnOYNR7/uDCGGXOyxce2KX24RRI2ramvA/qoNn6Mw=;
        b=AQ3Pq8+H/YaRu9nG30t+k/iVHrypbaoBz0UZZHYFUhyQ2zJw2k/KIlgquBEJGfZRKq
         aS5MMxtu3snALUToKTWcT0ZpBZVsCpSrmb0FyKP59tZwIbDOF8Z/vFBCOuvMGv/Coc7m
         Rh4cjVFdaC2QCxgsGnWOd36CtclOIthdYwqbSOxHjelsy1UhPBxO2VmlNIs/jLCFP/96
         xQ3Eb6BDgb5F7qYrMrYpViMo1ebdFShfZB8dcJ1O8K+lxPqSF1jeBMaxpoLsiGnYutSx
         LHFbhB/iknZKalhidCnv6NSh3j4OuRMjbQO7ZF233bt+TpRpcHsBmSgBVnF/L/6RorTD
         9zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733181699; x=1733786499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyFnOYNR7/uDCGGXOyxce2KX24RRI2ramvA/qoNn6Mw=;
        b=tozLLoo5gp53AhJw8mgBS4RqNlOpsEwcGCT1AM5Xm4jqksXo9q4staWbmVPxUbwPjG
         7OgQo6IZ4sODKGBajOr18Px8PRjx2mWpNRXMpZP7O8F0sOUeS3p+VQVmz71tIr4eVXIP
         hT1uB9ec3/2Cd8OK5isZCRJGGo45T0AeumQvdE0tbYbf6vsLTZQuEKG++38OKiTds1YY
         +gkH1bL6wFOKaQlH3X60XkpfTtD3U1Z3QWQlXMnm9nogdIAlGf0AJGXeEuKFJWa3b9TJ
         df9dodkz9iNRYqSymHLePORwtKcSrkGJrvI/0dKX1d0mM/Zht6ny/bWwQP1k+5i2+iOI
         IvYg==
X-Forwarded-Encrypted: i=1; AJvYcCXLL4Vl0AVw6SCRBzqcf6j5kRr1YSZSnU0QNL11iX94vwaZP04qPfDXJyRlRksWZPmr87n+@lists.linux.dev
X-Gm-Message-State: AOJu0YziT3Kyn+mo46fke/5Qn2izA+2U97FLF0scUC2l6dNfbTQfjNAN
	RyArBphKi4YpBYkeCNkHsBfxYUCj3DmKKNaKIhejFuS6FNwpoVeA
X-Gm-Gg: ASbGncuqigco2t09L44lDEjvwLCUt5XJtZoGKZncN4tHSeQJfPbVIbZfp+HP76CRzcD
	DQekfK+VY1q+pppUP/kEACu4Bk+vZBIdabOjgmrbGcouHLPpl5mvrDtXbslh84NBiqGE+FrLfWY
	MBk/j8QCoFp/L4XuwQNUQ0W3oZxYwsyLUD744xLO3RodET0Dsl5R9YNrFB74qYzzxyzaAFkvIfK
	LSy90YMFJitrRtLDVgL6pRG0gJghuyIDBfMkriciS7B/I1S3bygDmMesfK08h9cZpHOAFUW14h9
	rVAAiRWz7eoKl4N3/Q==
X-Google-Smtp-Source: AGHT+IEXS03Fw+wgJGBsVZ94KW7dwGXzAeA8iM26jbTjQebKyiUAt9gwXwClHbNDAS7WWsC0K1AuCw==
X-Received: by 2002:a05:6a00:39a8:b0:725:3fb5:5595 with SMTP id d2e1a72fcca58-7257fa3a10dmr317747b3a.5.1733181699099;
        Mon, 02 Dec 2024 15:21:39 -0800 (PST)
Received: from localhost.localdomain ([240d:0:4a45:1d00:4807:3add:383b:ddbc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176fdcbsm9098432b3a.70.2024.12.02.15.21.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Dec 2024 15:21:38 -0800 (PST)
From: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
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
Subject: [PATCH] selftests/net: call sendmmsg via udpgso_bench.sh
Date: Tue,  3 Dec 2024 08:21:29 +0900
Message-Id: <20241202232129.7139-1-nakayamakenjiro@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, sendmmsg is implemented in udpgso_bench_tx.c,
but it is not called by any test script.

This patch adds a test for sendmmsg in udpgso_bench.sh.
This allows for basic API testing and benchmarking
comparisons with GSO.
---
 tools/testing/selftests/net/udpgso_bench.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/udpgso_bench.sh b/tools/testing/selftests/net/udpgso_bench.sh
index 640bc43452fa..88fa1d53ba2b 100755
--- a/tools/testing/selftests/net/udpgso_bench.sh
+++ b/tools/testing/selftests/net/udpgso_bench.sh
@@ -92,6 +92,9 @@ run_udp() {
 	echo "udp"
 	run_in_netns ${args}
 
+	echo "udp sendmmsg"
+	run_in_netns ${args} -m
+
 	echo "udp gso"
 	run_in_netns ${args} -S 0
 
-- 
2.39.3 (Apple Git-146)

