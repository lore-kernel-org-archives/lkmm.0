Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178048665D
	for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550205; cv=none; b=rOBy03UfVyeXS1tZ9QfVWbmOUO5d6p5cZPEdDZL31DjpZmoaKnLO8vj26+mOZ6h6aR0tMq9nq82f+eFvfxKATqRCQO1084wmI4W2cyY6hjIOP4SiFXbIk9Ildi8ar1uWHAX3pxyYXQZxlW/IDt9Z+0S+xUgjoOwiP5xJIQvYXqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550205; c=relaxed/simple;
	bh=Cv3GiW+cUXijnfwKcWCdwib/ps1bMkQSsnmAAjeLFWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbwlr85xsYBWFdQdWGS6TPsACR6xanBgR8bPZWy+Qkh9MrOK76fzmGmIvU9o2tdJkchMzJmO3Gd70AccBqjpoRYYbW1ficW0zw1JL+BbLuG2bLSTXwjbtnIXhh/YdLMF+cM+pD6mMyzj+/4d39d/hUbCtxPjfpre+r+V/rvX4us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCX+/Rci; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCX+/Rci"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c6920so698926a91.1
        for <lkmm@lists.linux.dev>; Wed, 16 Sep 2026 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550187; x=1790154987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzRkWt2VZCbdlSo+rjm4taEDOl7SYR+tdxu2b2xJF3M=;
        b=rCX+/RciZqQUIhtyd/mlpPs/oZgT1TsdscpUwTcpW7PUUp0d1MX2e8hSGrxeQkmGbb
         LIGSa4QWCR8skX5FgXMts4Hri/VgRqjDqvGBGjzfPxVSMAKEfQu22daq6qeVfVY5iy8c
         ZwJnaLO0+wzjQ04c7rvBpqavVYRuAlZImr53SnVG8dVjm46tGUkSPmJstgE6o8bJkGGV
         h49pS70xSgFCMMjwncLByBaMyGFHmqvrblBr6p/9wR8/jCyQ1jvIpQ3+zfG0VykbLmlo
         td8Evtc+knGr/uoMrHTFKLKbQQmNl2R8aoljMj5utr9HHydnooTRZp1NVoW8vOsNlHWX
         /jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550187; x=1790154987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzRkWt2VZCbdlSo+rjm4taEDOl7SYR+tdxu2b2xJF3M=;
        b=UoqpM3Zj7MMm8B+XYveUrEYwIBJsmUxcARojEJKUMKncdvR4zdGpkRx49KZB0alw3q
         ABOt/Sb162CQx5DTY54isAv4ajRbn5PGYulo13KVfJjZi9o/pQF5RIqoVz+LWx4U9lqo
         FNoPBEWsOWk2aIDFgf3umyP1Wll7yQrpFB0cVJziY1YOoElT/Vg0aqsropUbfympW+GK
         IZQ5vcvQBIZQaZ/QrJAeVQHzbN1Zm6bfWGEQW3VCIA8+6UYfXpgcPbdTLYY4UKyGeF+T
         brTt9GVBskuFCuhzWiOx5aoLkDaC++PAOwq7iePSQ2rUDy8hbUkBsMF9sMt+fOOTvqEn
         /cew==
X-Forwarded-Encrypted: i=1; AKwUvBwoXncckfvf2spKQ8UAWnuzxwL6xHJUwgb5Jv9O27WJpD3AIFPIxH5UYBPJ5wVjf+13sGB6@lists.linux.dev
X-Gm-Message-State: AFuF++lvWKkoNRsSrPqXFulUdjcAO9MttNkLD5N7qVE4iNeJP/WpU+7Q
	ufj2ovDQ/D+WKuDvyi361Bj/8ES9y2EGr43pxF0JVlPJSymuwqCpTvsv
X-Gm-Gg: AYBFou1aIs9FrmPFBKboUzAs7e7c1v2XnYz3XZhzdnErbaup+jlqsmxl7jUH5fm6K9r
	h9T/tICbc9okFL1iZ8kt+w1uYu2NbqD5VPUA23IMKa7dN8V4bYfhkF91wxihIEPwVJP4+fNifI+
	Z2aoLTdmeTyihzRkednwQ8/Oyov0/i4VD3DzkehRHPlbNvqJFkWBMfoCvYbtqSjUKA8ujK+RGmp
	HjlNjjR85Wp//GsnJ16y2ObKwORd/KUC5N4zVwzN5zwR8SSLikAwOO6Hz5kUoGiVtxhRkcbD97q
	0lgMUbzazcTJavq2WktIOMyPnCODHfTDtRORqKW+ktPRVV+2X3LYyUmj/Z6gWVj4bSv55gXvFBF
	SXewAbJ2KiTkBhF9usyt8aECDvcXNVvSoGacRKkWv0/jNhmfPKtMxdNSA+YD8+mfOiziBrxWnCy
	Va3zIKeNHx3A94gr861vzfbG7l2I+HTnZCyKkRhKDYDzjUAeYbcmNCP0XSg7SVA7wvNyeEDIu52
	h2ZEl2a3c4Cw1aK8g==
X-Received: by 2002:a17:90b:4ecf:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39e1e49a802mr4752714a91.16.1789550186814;
        Wed, 16 Sep 2026 02:16:26 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:26 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v4 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Wed, 16 Sep 2026 17:16:11 +0800
Message-ID: <20260916091613.78352-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the SRCU fastpath litmus tests from
tools/memory-model/litmus-tests/ to Documentation/litmus-tests/srcu/,
as suggested by Paul McKenney.

This series splits the two litmus-test patches from the earlier
[PATCH 00/13] srcu: Round out atomic SRCU support series:
https://lore.kernel.org/rcu/20260907075829.2073224-1-kunwu.chan@linux.dev/

The two tests verify the memory ordering required by the reader-free
synchronize_srcu_atomic() fastpath: the grace-period anchor must be
ordered before the per-CPU lock-counter scan.

Patch 1 verifies that the anchor-before-scan ordering forbids a reader
from being missed by the scan, while patch 2 shows that reversing the
ordering permits the problematic outcome.

Changes in v4:
- Remove the smp_mb() and critical-section write from P1, 
  keep litmus tests minimal, as pointed out by Akira Yokosawa.
- v3: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v3:
- Add a critical-section write after the smp_mb() in P1 of both
  litmus tests, so the barrier properly models the lock-increment
  to critical-section ordering in __srcu_read_lock().  The smp_mb()
  was previously vacuous because P1 had no subsequent memory access.
  Suggested by Akira Yokosawa.
- Adjust indentation of the SRCU entries in litmus-tests/README.
-v2: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.

Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 19 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 55 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 52 ++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

