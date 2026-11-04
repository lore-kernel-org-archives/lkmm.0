Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811551;
	b=jaX7HJOco4Zdm073qJZrBMhsdOCWE5/XGk6sGW050+YuQ+8n8tjbe9uuWyU/mhCV6coD
	 WNxIxRrnHZhEDx4zVJ46eMcJIqMgwdL7zNMmBF9rqh3wQN6PbV5WhgmLwH4HV7bFCtbNr
	 2sQGapDJoaTW3Ivxc/TWKYCk5mOXqXrlnwBBjsSM9QxgK0cN2EinZdpZVyhsMgkhApbno
	 V072REWW5/iGVis7mDss4QuigJPiVHsmeF+iOiZuK7RIVqf8uivxNkEQ97UA2H6zMkeVT
	 YaxmNUUtdm7cUAIbhRpImj5miMzrf70MTsL2voR+E5+XZUj4347hujg0RQt5mUyc1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
	b=Cee2SErsnukCNzwZrt97lFI/SxFquncapUD1AXAXOmjg2yp8LFmMebPAkcrGH7ubUBei
	 DY7YDAM2finkitfiqs3Gu8gCv6L2AWegGCc6ETRIAZsg44MUg1NArqzR/VtXGuAXFFNPm
	 YIlLhG2Rhb3lTu62LIBPC+kqCcueJcLVaFWx4/WlyXdDdLI9mduPDyMYIHKf+edGUiFMZ
	 KUIuLb8TXsDk3aE2zuZsT+QVWY2DDxT6ap7PhWNflMuNoT1LfxxtS+Z2BynIKMBZs/+YM
	 rM5u9+BAGSGKspeRFUj1YgDV/lVaR0zo6sMNBy4LNReUdoWzJm0tsuiliVDV9vIIBTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8Nf1acW;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574D606A333
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6574D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8Nf1acW
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1603308eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811550; x=1794416350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=m8Nf1acWOYEFhW7h/jJFoy/UHeU2W+uKnVsyAQNLp1mYYeZU8Egg9Yyn8VBh3Rfnu2
         NlKetwfZzwWIt7WchaEYsr2vejsqnL5YtXz7mzdVRMBdnxs3hrw2LmPQ4UkRYAS73K3h
         Gw79QZPt5XrO11hAt7cKT2rpePgzFDnFdd5cqao8JRpTlrnQ/7kcok0k8ze8j22WExNV
         TMeTGT/TqqzfhBJA3BEl7TH/uFqhCXqZV7UbrqcQuHbMIqzjF5IA8Mkl7YRJjqmwLeBF
         8l0PpcoMHdFrrT3vdxo1FTlWWX+SHz0EJPiprW7YFvy07tIRnDPdYmvCgmtiQb4I5kuU
         wgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811550; x=1794416350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=eOtnwkEvXziH4ev+VLEurZUBoBmDpFJ0SBYSvRV3E6QYfSjuKJtq5V93mL4h3sewAN
         MeeUVx0va5qGIY96OQdOZmFuN3RKPULqk2+P4RIPv1GCiwcxQzhm2mQIzZfgmmIIMxm8
         5POB5S/hOi3OTR/TxN4oUNARuoeBZ2cq3v8Cffgy6hSiy11QXDNSdrFRMA9+u06qfafM
         AoztmMdr32BXMsf99P6uEtOMsKNVOsH7NBr7P7kosdx/n9/9IcAkWxkhpeORnaITeaae
         3LHK9OORAOYO01LwDlqSrrdWcvwWieHq8FKCpC84siMq3qDt35whMxT48hZQfF2ibKp4
         jvrQ==
X-Forwarded-Encrypted: i=1; AKwUvByEV2K45njClXF5TBG1A9EVR2E88UEtXCWZaXlQOJznSctAP96N29wg1ydyQ2OVwDSQgtow@lists.linux.dev
X-Gm-Message-State: APuU4Z+/mm4l7EG20BDSnn3JB6NTdL6M69vCq0QYItWC1V6I1Wn67NmF
	YBLraz1wIQoP7cmPr8n+jv75/mOECD+egT1BVJEqEM42YLA7Y0JGitEh
X-Gm-Gg: AYBFou1oakzN1po9/2LUw1rouMds4EJSbXUtdPaOfiBvwtZHlnN9E40t/4LFKJ8LIkK
	8QgZ7lA4JCL8Y4o+Jbx0w2tvscl9HKJd0SF+MFZ7w0h8y/tvjLnRinbEzg7bzE13FMYeuNvm4L2
	JWUNgltYEqVGJfy3LsNpK5gcFF0Eyf4pr+BKVpVsZRADzlMmZBBgFcCwmTsd/mOZxHdwdd7cbz5
	kkdExkOwKciErHD4/ZJm28EeaHzbjxpOxZPyjYT2FXJXGCd4NhB15ZtcUfAGbFh571BXNI/AQTN
	ouZdRKVOzRl3DXCH3FfA6x2odscSu18LAFbvgacIvq0/yk5+L6lpZsg49sfql3Gz8DYkrWEsjFE
	OMQ+PF+FJlscZ5cNmP3haVuDtrX3TSpIDvTdwHBgnuV+LYLinsxQDbslPQt/9UX7qeAnzJ5Zhd6
	BjrfNeHxBHzY482sizlPbtgk8nXQRY9SbAyZLU43kCY+dxtpEN6fOambWcKpbcsjnY6f3uBG+m1
	hd9KrIfoU9cyZPkg96u6ZmNI8KenkmtYzz9z5Gdru6Ds9cmcDs90sB7bHv3i+oVCqdvI4E/1hqi
	7cB/MBYK0SpRi0fs7sI+3QiOS5GRmPEL7spRZEA=
X-Received: by 2002:a05:693c:8945:20b0:36a:2999:ea9b with SMTP id 5a478bee46e88-36a423c346fmr24991222eec.23.1793811549996;
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
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
Subject: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to enable tracepoint
Date: Thu,  5 Nov 2026 00:54:43 +0800
Message-ID: <20261104165504.2430480-26-kunwu.chan@gmail.com>
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

The hazptr torture test registers the hazptr_waiter_enqueue
tracepoint for its hot-address scenario; select TRACING so
that the register_trace_*() API is available.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/Kconfig.debug | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index b500e96ea1c1..8fc6434a05d1 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -27,6 +27,7 @@ config RCU_SCALE_TEST
 	tristate "performance tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance
@@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
@@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
 	tristate "Scalability tests for read-side synchronization (RCU and others)"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance tests
@@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
 	tristate "Torture tests for hazard pointers"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides in-kernel hazard-pointer stress tests.
-- 
2.43.0

