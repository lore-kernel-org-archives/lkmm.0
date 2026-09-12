Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190037FF53
	for <lkmm@lists.linux.dev>; Sat, 12 Sep 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180968; cv=none; b=Sv7NkDQnGNOBcSFN0Uhrw4bMHIKPLNV/Sxacv2N+h1hiS7xfKUKliDeBxYhwAC5Y7dbsHJcF45aEMBZcqDS/A5iBWn9pnYK+F4jgLjpStdojZ8RlmgtOGh9BGGEZ6Ra+5KVlJyxMy/aLuktsmZJvz2zV4PrwxMpcn64/HpWnuNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180968; c=relaxed/simple;
	bh=9f7h9PLAGNr5QREiP4rXwCLceZZ+OvQlKMgj7JBEccA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksnX/ud3ZP+4ao5l2ZKes0Yac+PgeA32zNdmvrGqADpZI3/wYqjljO/Zha1AGiWz+TVu9IxJp/PMag39EFz5AhFyvg627Hm2N5Ep4jDmjYf8h46/YCwFiUhI0FkEOCyoLoMguJ6FYS8KBiY1ugqTz2YayP04CMtkqcyHZPpYvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1hFhQgY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1hFhQgY"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso167778a91.3
        for <lkmm@lists.linux.dev>; Fri, 11 Sep 2026 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180966; x=1789785766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsxAOkX7Z0gktBYPmfGgeg8Ie2GzO8n+hdt9t2tFXNY=;
        b=T1hFhQgYn5ZFY6AXKoJNz3yyCsmMsXuW1xS+7oPqW2wm81clGoc4fNWZ70bid7zf2M
         hohoiRsNttnyt91o6r0awHHACBQh/jPyIUIm2Lwo1q99oll1XCvH+lTjDZDr/FC1DJpY
         wzIeSf1cjrPiMkNh6r1XLHejHqTUwwu0PNtEhoUM4F5S1T64LvCP4IBtyOUp4eqoHOCH
         /0z7e6QRW8JbwzyaZ2MLuohro9sonCrR30oRbqWxuQ6vSnXjJEFTqHicGa/6tzoUw9pf
         eICJTsKBe3PHecgfKIcYxxulyLL9InC4+OSKle2kSavK3tDjM/LCUfx+j26Q5F2fLrSn
         yucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180966; x=1789785766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsxAOkX7Z0gktBYPmfGgeg8Ie2GzO8n+hdt9t2tFXNY=;
        b=Lm8RAqthclbD1BYGmJMVXpYmkxfaCiW8ahaXTHtQ8OgWHr868sab1MlqY0AYZ6uAGo
         nlAzHwVlclPKXVEyJEvQ3ukYbG3dEaqvCo4Rwf8b3TKtoZp/6r6bpalvCs+/leOHmF+B
         ssBspAhJRdyfgndn0duZmHAcMS0/j+CZwmUThhP+qpVV6+9iFqEEHBUfOtxU5hk7MBeH
         O6x8MsOJg7pDlUYgT+O3gQ/P9IDIn73wFGTAD6LMM5+pNSdS+Kr7dA5kw46FHiwrBi3z
         i4WLDCvKpwz9DIc5KuzHR5KR2xzdZeFNnIUUfusq3Lioz/HlOD9Psp4cPelWZ6WW+UE0
         MHLA==
X-Forwarded-Encrypted: i=1; AKwUvBxE3Iu5To8WTdLyQIhrIZVbNl1IDSMSzivSbndP8sgNpti8u4jIjDBWtofUmEclnv4D8Erg@lists.linux.dev
X-Gm-Message-State: AFuF++kSaYZ8vCewkSnTfkkPqcci7onFhjiF+KGaAoq3piTtldgLHwCb
	sg8T7r1Nllw9eF8JUp+A8EfPlUI3c0ua4aUQykNf9LaRbP6i/r0Ck4fFVH5GkQ0bKq8=
X-Gm-Gg: AYBFou2/r4CZyl05Y9jh//yxC5Psv9fcKKM4OzMFe5QjTuVraCRL224XktC5zUsHekX
	kFtS74YLJQtU5ygNQRdDbfz/FHN1Zk950fmsjcoZtKl/Lchqd2AJR13SL91b4Fzw0ZUMbew6Orf
	zPwJQ9gkleV/i5Mp9u0n1hGTL8nS6WvXjfBazAAEW8BEVrj2lcUq8fhBk0K3x1aaZrzt3pUP24p
	hFcPBb1oxzOKVESg4vnjyh1Foh7rftgHUWkS/fH8rJrF2TIOQ5vESasavUmt3+98XjfBAhdGrxW
	UTg8zGdEoCeeN94ISQYSdQLYmIG6xEOX0PBH6O+9PCh+m8SKYQv3R/tpwJqfcCxfu0IMkcE4N2F
	kB0cJGU2G1tIKBYKyWivJv0O2ov61uTlhr025Pbzi9QiU1RRxQIgxgfZXVEL5oH3/1cD1QgkHLx
	kCf5sAvPZEmknKza2uNQ0c0NgrmPzLYKxq4iHJGaVjSxh8gPm/Vw1xgDJ5pPb+74g5VJtGQRhCn
	pjCkMZa/yfuOYUX0w==
X-Received: by 2002:a17:90b:2588:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39dbbe87b09mr1694147a91.2.1789180965146;
        Fri, 11 Sep 2026 19:42:45 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:44 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Sat, 12 Sep 2026 10:42:23 +0800
Message-ID: <20260912024225.2872265-1-kunwu.chan@gmail.com>
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

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.

Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 54 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

