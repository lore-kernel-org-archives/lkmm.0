Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA46207A33
	for <lkmm@lists.linux.dev>; Tue,  3 Dec 2024 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733264977; cv=none; b=C9iKwLIRGK5h9EwH/ZjLQw+5vsJa3AuacsQxIQsN0AIoQgZi22oG+iorwJ20Yq5w/4AkbbUqATEiiC/hegM6wAF3jAVkH/q4lYBvZl+ghcfcaVdCSZErR1ogKX2vSRqwjBAGWK0sS2aBR4D6udtKn04bWFATjLikKQNJQC1w4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733264977; c=relaxed/simple;
	bh=v1NJNp5Tk7wpwinjGLDTU4LArY+PKjGPBb1DekJ1O6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WAlcCL537VM+zJJ73QSdiGeifHjGx2QL2Fpo6LDnks8TrTarzy1s5SwEKB8Nude1oUtleaykav4ilbsX6OnusNoxNzvUCH83qPfVXmb8yWlk6of4DrI+NrvwOMD5tOswRjGifmAda8gWfx49J8/wvMSk9mVdW0NJLnEk5iPttz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieFfLWlO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieFfLWlO"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so6096217a12.2
        for <lkmm@lists.linux.dev>; Tue, 03 Dec 2024 14:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733264975; x=1733869775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOQqhZdgI8+JB/qh1dFLYIuDBxbHyOD15IWWEIuDAMg=;
        b=ieFfLWlOI0PMupPl8bVH1KIaFb6HR4qhpOkFJV05uWzi8gdIq01SaByRZIT/Y+q9mF
         DvhmB6uDn88lRoMzBOO6jKaBj5k7ERfjCwiPXZmd6tEQ5iZzLaZGKyFM//AjNXeuNBsZ
         pDUovPdut2iND53AtZp0tmoXYXz/lWvQyR6kRwt1Lr2g+Njg4C7zQo535wufWbTPRGVF
         z7U+g5pXtm1kEDjxOn0hC6wN2hXOWPH2TrbL5oVvJGU3q5qu9YmgGiSkQtPGq6nfP1gu
         KlYaV9sZkEmjN52TXssCqH7zFkxt003YzR0unCilb3YQIK5C6wI/6HAAOBEsHLNnLsRs
         G+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733264975; x=1733869775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOQqhZdgI8+JB/qh1dFLYIuDBxbHyOD15IWWEIuDAMg=;
        b=ZVSgNBKjD7qDNiTvDvAXO+jfKUfp2zjiduj59Zn+oOv9Bph4aH7Yt2FzNN6w7xrLZ8
         HwEPVyxoNW1b/cL9i20i8YA15Z9hfdlX97h58gN3IwZzmV3n2F4JhCox0RrWUn6YvRYM
         al49jj9j2AsmpT4OJxaKe368M1iwvjvezICKpnXHV6uZrhrBPflOTvGrRs/FFHKJUErA
         mETLvC0SR5ssZ6SmotW0xAjZxoI2otIKO1y4XND2/kpfrtbUK87X9nXxN9iS4Nty57Zl
         4kUA6yWGY1FGVLeh9wsp33tROZVzbgsRst+HyvJE2gw3+ktq77H6ESQmuZf1uZgBdBkO
         +tRA==
X-Forwarded-Encrypted: i=1; AJvYcCV5wOGI3rMtvlkQjLmmUHb7ph0b1afJLPZiRPBv0pV/Nu2dKs4waDDpTsKPo6iawDuwCJec@lists.linux.dev
X-Gm-Message-State: AOJu0YxMqKWZkkL0eZbxXZMmV6LXBpN43IaYrKgNTttSl6aTC7P4L8bO
	0IDGckGwL9gCzucYxSzV8JgQ7eGwk4TGztVV5JGYhvgbvbZSETFd
X-Gm-Gg: ASbGncsIfVzR275NRjnq0rQeYE9Bdk5/0wIsmh6OGJbhuKjWNUprqwui0LAhemYuhA7
	Fty7Nlf3XL4ptjy+qlHsQq6iFd6n0smH67gIQoKkrwpaJWKgLoFt4L5zhD5DINfZAgrevuyCc7S
	sFUAZtCAt4+YqtmkwGfgnpS52LTzlRwsK/GIklISgfzT/jj+7qjcJ+QNNfilcjqONTJC6yhCyCA
	qRLOAX909NKDyLKZD990PIotZtYSYQao+xqk9rITn7mpDewbyrckMZuBYuz8J92JQWj+fGE6sMV
	NaifYJkLwcucSaZwcg==
X-Google-Smtp-Source: AGHT+IGvaKP6B5Mct/zhxb1Oq+XpVrniUhSuQiZr/lzz3hOewfIePelGBKpMi3jZHY3N98/XDM2qYQ==
X-Received: by 2002:a05:6a20:841f:b0:1e0:c5d2:f215 with SMTP id adf61e73a8af0-1e1653b7c37mr6146784637.12.1733264975288;
        Tue, 03 Dec 2024 14:29:35 -0800 (PST)
Received: from localhost.localdomain ([240d:0:4a45:1d00:61fb:e21e:f97a:dd9c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3b6ee3sm10055175a12.85.2024.12.03.14.29.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Dec 2024 14:29:34 -0800 (PST)
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
Subject: [PATCH net-next v2] selftests/net: call sendmmsg via udpgso_bench.sh
Date: Wed,  4 Dec 2024 07:28:44 +0900
Message-Id: <20241203222843.26983-1-nakayamakenjiro@gmail.com>
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

Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
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

