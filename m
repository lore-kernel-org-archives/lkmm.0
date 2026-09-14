Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699E47F3DB
	for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396801; cv=none; b=c/RTrZH87syFljRQD2WNj1Sccd35Z3jHrqEpGqIvaq4x6KbnU9SEjeAyWtt6lGufm9IcCrA0kPXLQK4bPXwlTeH9Vwo2VBcnZ380wLuXT5ItunL527aElyXEOlI6MTdcvd2ro7XnZs+WI6MAgQ1rupLeZykFXi6uQeldueBbC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396801; c=relaxed/simple;
	bh=k5pbw3gWXkD+2lSDgyawLTDWIcAys0OeL71nHG/+9K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8cMboPo/C/+t+/+5Ob5ACm42Oln+m1D9e/wbycyTBUuGIRUNgHMBJAg5pOaIGg1EnC9xBggsND2pilyLhttJwwRmQYYHGkrhbWg+fuan+OxfLEaKUh7IyhAcc7H/mWHvC3JZl20feDZp8vUiRGWGyTYB/igZ7ANs2cKS+Y+v/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npgIBC9d; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npgIBC9d"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2823100b3a.3
        for <lkmm@lists.linux.dev>; Mon, 14 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396798; x=1790001598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=npgIBC9dgKmIvpNfufP7Z5t1MjskrhTrdHLsTAyELYPSB8vV9LQlLVbOVlmCLoE0Sv
         2d3NvLkEKmbmQam4OqV7MOrZZnPelk7houBHUzWwvVM3Eng89OYL4j3phJ1hY00fVlNu
         YuJfbKK+fz+3C9wfp3PDzD+2dtCpUpkmlRgJPxKic84GwkTwMVmRzVINBNcih4aMvUcq
         GeNowPDi673CJhkDLjycaJzcdAI8CcWUyce2W51vp3Yf63ZOuepJFpFW7s8CcUBNKibb
         hcBJM2/i4N+hpkAivIpDFghN1lNntc55HNZOpD0Aj7+L91MraUf1phsFEvobx8/gK5dk
         lGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396798; x=1790001598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=pacJ3freigOsgkpzpHuqkSMlVHVltSYA7lykw7xJGQ1OoZuCq7rxdgqhU/nZ1gykKB
         /fcEPUyKd0nPXLL5NOkJt4/PCjswbDFbb4kMRbW66nBwxlD8HFQl6QrZHZhu5LoCtQig
         /rfx6A35cZT4hzvdIva3mjT34CyDz1VuszL6R3LvR1hdXNzjAPyixo3GbDaMTVCdoOxC
         bbB57MtQeuMmztDSuvZRBxuo885avB7WALE/MFAvH3xDFqeMosq3df/eveLxWKXi6p00
         Bf5GX06Cu6Z9IEEASsKzQDLlmGAi58qO706b+TXZd+FFaOC0qyKX1WaY/hO4gnZKm0Mw
         SYJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9WCXvV8jht0nH7WW25Ug1o6Zmh6OE8QfoaY0KfkgRfJj/FO/Kc6aydUpHpxHRpaeNjsF2@lists.linux.dev
X-Gm-Message-State: AFuF++nZ6UhvZ5NO8aoJqv606JnVCNjNnAnJcXbWCbyomgelImlfLDie
	WVu5/b3Ok3yujnJguNtP4o/Z/Kusblfswk5dnnaekdOvl85Bqn0dlCIc
X-Gm-Gg: AYBFou2lT8kbjVK0NgDIBdmaoqchFQgna1Xi9qnO12H6myrY4kfu3XCkB/o/Rtqp1ew
	wNj36biEAvYG/R3QgQDMhRsBSz3JyxSDg9Lnv8wqHdsmpGlgfiMzZQVXIuZFTSIsnJdSYUuSGRs
	lOm5bnmWhWZcAO2Et24r7Wq2E/KOylNQStkyT8rZmoB3J7iT1f4jVBXVRVrZD99n1c+Y4i9gIN1
	ng0IqgWq/hy3peZAQUfqGYDDzvADJDfc8Z+t6oT7ZfMrTmMBnKkCGcH0GSXm2DFcU0cDs1ZYTdE
	kgQsksm3pSsBa0tMtckUZEMDCr47YXUrub/tSsLzek1jaB/fNYSm+gxC+wgt4dleUE5S7OM6fHc
	0KbhPrq000tfWjGM0quJZYUxjJNFi+MNJH8iLtuiQRXbh1E1fOh2hJMGm/xlsN/Wzpf20gsD0s1
	OK+UuU9jCzli9uOa88ihpSqqh2XALGXzB7WOQECdo16bb1U50D5BImtXJmb9vbuhlCbEuz5jvlK
	wEh0h3wKQGb5+C3Vg==
X-Received: by 2002:a05:6a21:3383:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3db40733007mr7430953637.24.1789396798408;
        Mon, 14 Sep 2026 07:39:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:39:57 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Mon, 14 Sep 2026 22:39:40 +0800
Message-ID: <20260914143943.1503066-1-kunwu.chan@gmail.com>
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

 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 56 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

