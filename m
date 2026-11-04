Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811413;
	b=Lmx+EGief1htIemUPGFZfhE66zjdyDMOv/JMoiZS8neWYZDBsIgyM+MEnHT+nEZia2s9
	 vXkXdvjEMaK9oUtZ7ucHmfsLSDM7UgtdwkT6nd4R4FfvAepTSh/BoboCv81a1Op7qave+
	 Go0WMhAshGJeYqbx4t0DRIqMqJmN6eI2hk4zYdE/gLIhP34CFwlTWDSBYnZnUDwNfO+AX
	 7Vhqp8GHTb2GnQ60kyBhLsKWzplf8p5iKN/TmEe3UeadKS+Hwu5R0fhgxepUJZLJILnOM
	 zMShsRa6e7hravOKzr0thKrC/obQ5ImVITpR4MNJSa5kXuG9F6JqqQzuwNd3lhEhO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
	b=x76bSzzlWBDbNEWEaj5VsJxAm/XhvnaLo7oaT+iAuVg9jB2MTr1FT/NWhTe8zeulJxD7
	 VD1xKtEUPB3iboAITubt+JWhFL0WvsBFwE6pVBeRAhr2TzkaySO3j2UKtjudsK4W89u2f
	 GSkAAIEzgV6MP0KBhq1826JZ5GNx8jrJ85hIYtnFlXkj19w8vpmHntv2pnO0eY+O5sv7y
	 MVBzt0CesTCxOrIZ+Wq/phe3C5t2hVJC4b1r4NU0Bf2xLxLSaJvsChkgSPFmZk+ZYn5Qe
	 SMJd0GsaGcJAP7NCwYQfOxcJ9009MFnhs0migkb/D1IKMvtvHoPvuDAgcEQvOY7mJAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaXvSAH;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C038A606A33B
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C038A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yGaXvSAH
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d6765756fso734504eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811412; x=1794416212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=yGaXvSAHIuVx85Y1tokFQy+5fJ9xI5+D+0Q3g9+lpXdCEz79OWU33yNuJNZZHwMK+9
         /uAXVsUrDrHLbSr6S5jQ/gRVPFDcELHo2KUt2ypj+ORsaWIE9c2iilLGIcWYjh170gIx
         61EfK7n6X4lXWcfZ6gAEiU6k1G4B11cDNXGO1kKPCO4YakkRTp/AugurU+LD2RscSBGJ
         L7AgO7AQ/mVZ30d4O3W8VYxoqyithW821hYSJlf9wmLPjOxvXApGIha04GY21xAqpfhf
         n8eM+z0idmto407uVQdCJUTTWj4P81A6eo6R2+GktdUDZncrlakKZoIavoKkMmT5r4jE
         WwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811412; x=1794416212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn7Vn4SwsVH+p5VUqdHL4flc2b/Z4fswSqRV+byEjsE=;
        b=GmsNDCJQvn3BhCLN7rfBxhxLiKlCpLBm4p+b/7WrshvrJi8SexfufqEOjXQ201Day/
         cBt2HKIZlXT26fbjPalmzMqRnlY46dlN0VV7wp1u/yxBoLDc/JucKHlDfeaPkhd/BIVx
         3xMa2BxU2SNzpg7X3HoE6c/ZTI5kz1d6rYBYGVuU9FtxZgKedhxyAVXVDtQlTXISqtxi
         MbUMszGZvkpZwgLUCJdf7ab5ZCbpJ1U5kr6Cp182cFoUDPXfJzxy4kMk0kbEHPSRn6bY
         y3OIHTLwm7nWp0lGg5PArtSCTI+sucaBMPU0GEt7eWhdCHxm9NJUrCa0OcFedffDRR3+
         q9VA==
X-Forwarded-Encrypted: i=1; AKwUvBzYVsCVUkfx+X1HrGdnHZG4HNj/QHq5t2nnJSlncOJSHqLq68bK/rq3SvROu4Y0007AzmQ3@lists.linux.dev
X-Gm-Message-State: APuU4Z/tXPE9URGW343hsC55hmZuFH3j6f+edVBZuM7+tDp0BJElwVTZ
	jRxTkPjtWOfr8XVW6Q9uQVnfO7/oh03UlGZe+Tsv/uVddGMz8Ie+lGb9
X-Gm-Gg: AYBFou0Yr16SlmgjFpH2BurvshR6HinRKLEPGjOBRssYm2+8cuXMV9CWO2ICIzPrRZ7
	Xs7bnW8MpwpVWJQJAU8CCFXQXMb9zgI05KpOjVQvXLmRvM1EizMEZHRMhn1NGkNRkrxsjF8X5dZ
	8n902B7MED3GzadtS1eIe+MPI31VBKv7PJMH4KbvFj7dSmjOLBzBLch/wzORvK/dF7vxCHIHlQK
	CkjKTMXTG9jBz35uLf5y+uPUm9wOb+iZRGlt7KsP8n9wOIg2ee8YMQ2h40zJMfyh0MP5512zWGk
	FzJSXOeKrwysLQC2ksWOBCrDETWcfqfl3BnHz+0lzLAoS5INJucH9RGiwipoRJrP2lul6aHzRds
	du3BAt4p1KwrNn5BvR/9TZR4KINQcvQFDLyQhl9Gk9FjWS+bQ0yMyZF7aEA534IAB6JJ8hX8+Ua
	s/NN6xv0gQ2ufxphfEdAZe6g2UiOZ20jSU1+cpv/Oum9yKY3CBoyTqYSnIfo5fDUaYoR79e1CED
	UHPgJq/ULCodGornEDJMJ5Y5tlipl+F1+wev/Ddb19SlBudNQp6m+kNyuHYTS2hWKwmVB5HLv1E
	GFy23cqzR6a74aFXDts026eyUgNIorcUOEJPOEA=
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr23827711eec.30.1793811411412;
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:51 -0800 (PST)
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
Subject: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
Date: Thu,  5 Nov 2026 00:54:28 +0800
Message-ID: <20261104165504.2430480-11-kunwu.chan@gmail.com>
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

Add CPU128 and CPU256 configs for hazptr-stack torture testing.
These configs exercise the shared-scan path at larger CPU counts.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
 .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
 .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256
 create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot

diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
new file mode 100644
index 000000000000..079b463607e8
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
new file mode 100644
index 000000000000..b00a984977f3
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
@@ -0,0 +1,16 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=256
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
diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
new file mode 100644
index 000000000000..1d09a6446080
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=hazptr-stack
-- 
2.43.0

