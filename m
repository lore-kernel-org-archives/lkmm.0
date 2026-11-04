Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811404;
	b=ThuNN0sh0cI5f6aAi7eI6AgCB18fG1q+qvyp6lAdrBZN7dwK+nI3jUVRowTHDOOBieLY
	 LYlGoeqfnu1KLp1ACVDa3o/ZEpHUrVYEOMmrQKWCfrpbt5KYQqUE4p+OgZZVcqwbVK6QA
	 ovri0bZvURVldkY6KklQlYAk4gUvAiUjwBkd1nIeJ4H4jf24+3ILuH8a80ePGIoPt1xII
	 Sjmby4mb95+qthHsvOi4mouB06mDwa2ANZk6Y1UdqUwpK7homui34RWa25rfPMtfqzrdG
	 +M/81pwqmJphOJ4pALYQtpzXb+8KB8ZUliBw+lxoYpYv15BK5czmN3S7tt20lCTErrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
	b=1iC742g4u5z+n5arIQ2nUCfyuBQ8WFnndr0EAh3jGhER/4NgwqSoavzhx9JiE6L37Uo5
	 S7tcid4mSRn+oBCnNsgWshgQ3KtjdBUDi+4aPgRHXhMBDWuNb6jPqyk5BdxFTjEdzXcAU
	 SMWDHQiSow+gcqvdzzwWXhHa+MYISL/CS4eMIeJ0a5IiOwdGwwin8dfp6IrwlXLW/GppD
	 AWhicv5VezhoXcdnJHGt9t9RDkoQlv8GfaMKm17ET6BVwC4qbKHsRUzSdWmnD1EV6T6vd
	 aRJ/ccOiKeMzHPqt4wLKE4ePrVb1j0/RqUrbBJAOtXOSxShQC5+M2miwTHkp/Ljbu8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjjm2YuL;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A5B606A33A
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A5B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjjm2YuL
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so1229004eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811403; x=1794416203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=gjjm2YuLx5gDqJ6LsDk0zjO26SGeJ+PtxupeXyqAsxr9G/ulfqf19vvGw0iUBC+M70
         rMMGJSX4tBi/DaH8BNUYBNs5/9s9wGqQ8NFdmeXlRd4mTjGpPwu4UROhVGnz/kRvVzPN
         xmy/Dne1AS455H3C4sV20t3TDeyLBk6IW1QxaOBhb/u1jrwweSSHWIcI3YlSs8hZINCI
         kX9E0YalWX9KZKKa/x2oRkSLvvtp77l6fOBkAddKMaarg8SrMZXb1D9tDky+AB+3uA/z
         4SHgvu/LSnCNlg77J8/XQnEZFh3ED60evvPMmSiMbKMRszGxFtPuucniqhcLzGODTPzf
         Q3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811403; x=1794416203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QREUsxQO+WlzAGZqj6P+b11EFcbYycJK2BqXbXpSFQw=;
        b=yJUr6N9qbf2xB9Vi4uZmuUsL4dtcIveQzrY+6LI68JnqHPwLgkXgVLrNmo33ksp1Qq
         B8sPYlzRUtUtpt0COH3Ek8DM3nI/yESLRjEAyKjmEuGkNCcwqBvw2pF21oq+Ux1wvGjM
         aL4h0rhRDpR9FO3HxfTF5ip4CHUgAKn750oN8zeJ6Q85lGnW69UUsGPkxAh1xhWSDA7Q
         tS6OW+/uhZOmhPVbpEsuWY7mcRvQPfsEFXjslQ5ydhKQ+hkYL1+dO/Aj+Jmp4J5CC52w
         GEv9mhZ91UHcv7ZsIjmKE0esceFlOqmasEglAtnvVDQMQrAcTXbiLRW9Poks7y3DA7xE
         sbBg==
X-Forwarded-Encrypted: i=1; AKwUvBxghbBaRFBbDmhA2rXewpeXJPI0GtwS6qUPTgx2rtsYTYTqk8PlGFnFtROxzYUDw5sD0x1j@lists.linux.dev
X-Gm-Message-State: APuU4Z8il2aXYhzcKX0Jfh9GzZb1m72g7vdJHefsA8jZpRIje8GScSiD
	6ldTJ/wS8zlsTj8eYoR2WYyev3xZzL292Yg9phvsMjsq7DrHwgtcdZ42
X-Gm-Gg: AYBFou0OZchGDTzd0A7j+W5y4PEH0pVCUxDgTE8rP1zDnITE4m6D4W519w5JWXqnGWV
	mtjDlHVgNr9uV30fnUEMoQg24U1+a272QHRS5HxmGapZMPE9G8zP00eN2BLTwCiU86TxERDfi8b
	OFvXzgOwWwUj9TeEKUL2yyGmitJSuqEatz+z5dnS7gIrosalkPyPEt14z0u7niqdoUovJd1+PGF
	X9Rg2UKP3mvgv6ri3VzL7uWHDCAPoYu3IJ5a6z5phQL91mEZ9Ra/vw9jCe5+wzSrQ66AzX6AY1M
	1EFVFWhNsuNjIlSNw6DO6rlVZr4Q2MDrg0ulooROJWBvm4jDpaFZzZnUHRFVcswzw29lE07qhNB
	Yp813PC7EcL7Afb8JgHX4eRTPxg6OUPD6v7/g6PUK8F531+0uJCKv1TCESN3qCEqqWxaOus/9t2
	YUtGegy2MqMUCOfUsN8LPGm4jU0kEUvx3DFwWnefA9LfpnYu4u4h2P+pxUT98/86mD4sFjf8X6k
	xoe8FYF9WLk4zzH6XmYsDa3qU7BtQd0tshhDZ3we3SWZVXYlWbdNrs9X1JtVK1UKpwWaoJ5HFnU
	z/oHpVttKDzP9YJsjaPkrAGCrrH9QRI131kZtbU=
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr24794481eec.17.1793811402488;
        Wed, 04 Nov 2026 08:56:42 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:41 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
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
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
Date: Thu,  5 Nov 2026 00:54:27 +0800
Message-ID: <20261104165504.2430480-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add READERS4 and READERS0 configs to cover reader-active and
reader-free synchronize paths.

Both use the PREEMPT baseline and hazptr-stack torture type,
with four readers for READERS4 and no readers for READERS0.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
 .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
 4 files changed, 36 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot

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

