Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C8525A92
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220740; cv=none; b=CskSiYXJ1hPKpHnU/3Ffp+AP9FFcXWJSMIc0CDr+AXzCPRcPAdogKJE1k3wZ76B0qm1/jcvq/M0mjMTBamX5wT2zHkyDt/P/qoESQ4fV7N3OfXr6GIxCo922LyKUF0ajGs6DOqpbcDfifWkVoOKL/63LBhgUEPK93ZKZlm2r4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220740; c=relaxed/simple;
	bh=ikRDPvJS94ZCR7PUsAAuEp28RxgBvB/t5DdR/IX8Lk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G93QLJ3Sc8KjTYCpBjZieQv77KJltsypyBS7HVzpTmMqvuoOryyyD4jtTXr5CYzRyGKwzjpayhupME4Ya2MnaAEYpOH5J2Gm2+9a3N+6DDUBycZAUCh/yzbwc9JfM1tUCrsaYItLS470qz2I429RiKBCIaCmFTQFwm2g7VUX68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inMQlCZB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inMQlCZB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e4af975346so12635655ad.0
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220737; x=1791825537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=inMQlCZBP1263b0MZc9zy3R6zlEfjVYkU0kEthyrC2VwuYVV2Yj04qTQa7fYHnC4rM
         1WV4JmO2MZDN9hcGKuFU85m76pKnPWat//g0lAGLUNB+ZH0F7jJcDSDfBJTn0h+S2CPl
         HeUVYExQ4VLoHadIkWfV9mqWhp1MSfMyc+AnuxyS0P7+vO9PqPLLiZMaToSnIjqbGxb9
         yg9b++y3lvTvOJPR1/A/ODO8b4WJBmw3L3obviKqMfOsBhON7rNGFYlN9ae9+ZbxP/qX
         pCK4R7oGa2UDEM7MDm8vy1sA4VNVWnxwNZhn2igVcpuUJlmBMzBBUuiHoW2vLs6rkC+W
         VEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220737; x=1791825537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JGfeM05iMohWhPKcbFv96DJOpIFn77eSNSRuB4K3d4=;
        b=QfFipObWwKEZ6kxHOGAmH4W7L4LIccecjmlq6ylvdecDPTyjuUc4Eni24BKVRqQ7Bj
         mpgWyinNqC1vwQZYEvH49bA0hKEbWcqu3gXTjTixDMPzXnZcXGsMZKFHbdninozx7R6I
         f8kFj4yhNA9QeoOWhTsHFzJ4SzpsXX8ekLzNiuUz/zL5m6f5oEd06eJDqYWNRNINAg4b
         jJpObDjODWKoDWOkog4V+REGMnJQ6DIUXiqP6UmLYPp0ZShby6EJNWFtcBrfb7rr26Aw
         Hj3iEJB84sioq0hWNCaxF+B2JqD1xF0z1wOwNo2apX264iOcwh9mPUGatCJRdr4ryTeJ
         rp5Q==
X-Forwarded-Encrypted: i=1; AKwUvByQzSYcvBw6fbg2k7plt+GIOWjCwZCvaeI1XRjHF0fWZpv8O8iV8ssyqanCu6DoebIcyxIp@lists.linux.dev
X-Gm-Message-State: AFq9FYIFKFx0uGH4c/rgNn9aegUgYPuAthxxoxKldDHMv8T+6Wf84IuN
	HaXw+0Reh46VTYjoAZCQlCnGLMJnbmu04GsYosS4CF6tnuPQNfUNfcwc
X-Gm-Gg: AYBFou2oG+m/2Gyh9KaE3L0jsVK7HzQUywKZoa8c8MTrqOJSdalB/vYadSwrm6PdSen
	IWPRu6CI415NUq8C1A0iT8CoyGAAGG5fUfLp5aP0ro2V9VEkTEgR84AQViXWPmImrT4mqZKt3Xz
	EU1MzTJ2+54swVYmOxFMRtFacGzJKG7cm6FhUTDyJ3N/rNfJ2wPmJs5YrVgGPtuUX4K+L+WlS/K
	bC42jmPZbUFp4wWfAxZah7RnduEL9BF0+N9N+FWSTLi25AYOjoMrNzga/+AGhyHN3mMqj/PSV/x
	bbEIspQcHMDMmpC4wwMgtBXeBXijSKD7TRbn0lYUMWMnK+2ZaihvyF+2MFp1PXbrsrble5JaZvo
	6oRFaW+ucM8kmfN59Y3pisIJEv24gallViLl1i17ZusgnoezIPt9qOHgW90pWKLSS2w6YGl2GnL
	ejDlV9UUvxqGRZkb8UJ80fT4O9Q18QdtbZlK2T0VjXKe6VUMSAC09NlawWORCwUwmKPCfALWmNH
	OL1doHnyXKebrVPGJFFf2aC3F5JBQ==
X-Received: by 2002:a17:90b:540b:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a787182b90mr6948956a91.14.1791220737102;
        Mon, 05 Oct 2026 10:18:57 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:55 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 13/15] hazptrtorture: add READERS4 and READERS0 torture configs
Date: Tue,  6 Oct 2026 01:15:27 +0800
Message-ID: <20261005171529.1378809-14-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/hazptr/CFLIST   |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 5 files changed, 38 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
index 380b8402ccc9..1826be30c066 100644
--- a/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CFLIST
@@ -1,4 +1,6 @@
 NOPREEMPT
 PREEMPT
+READERS0
+READERS4
 SLOWPATH
 LOCKDEP
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
new file mode 100644
index 000000000000..f5564c218902
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=0
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
new file mode 100644
index 000000000000..c5b12f3bef74
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=16
+CONFIG_PREEMPT_NONE=n
+CONFIG_PREEMPT_VOLUNTARY=n
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_NO_HZ_FULL=n
+CONFIG_HOTPLUG_CPU=y
+CONFIG_SUSPEND=n
+CONFIG_HIBERNATION=n
+CONFIG_DEBUG_LOCK_ALLOC=n
+CONFIG_PROVE_LOCKING=n
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_DEBUG=y
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
new file mode 100644
index 000000000000..0d0df3f7dca4
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
@@ -0,0 +1,2 @@
+hazptrtorture.nreaders=4
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

