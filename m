Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811560;
	b=G4E0abfdKy3DUkicsUBLvAwg0fJQ4qVDqVaSkJu1AA3NGAUUb7DkJIpG6zxsbA7neoJL
	 BbktgMkkldd+diVFkVw6BikMkJ/tb6n3i6mCKEyjcWjtZUiPQi28kMklC/BkvhaAlbEzc
	 rKcaQeS3uuiTZUt5AQxD29sARXrEaI2c9k3BoIeYe5gV+Z3wGk06DgsAf0OeY9KWYLA0Z
	 VIir5fKAZI3Sa2qxfdqGEXELa7zPHgcMx0VeBY12i3RcWkLJbIqt3p1H8M46FSBlxCqeJ
	 NaG8leylNgRH6wb5t9Vv0/Nxqqj4MLip2HXxAkekUkIKymRfsJcEhd2EmuUqygHH2Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
	b=2dyanMJ50I9VRaR79Wd1M0m8G5nrf9TGs569A1/20BDlrRYINAGh/uw3o7cRiUCCwEs7
	 RLunwX2u7z/YxqDvPZPBA31u3eaG9w1l0sNVfkrRmE1CXuIWh2I7Ng72S6AVEXGUA6GSU
	 gvddy7FRye4OKD2rq9QoOvk5vX+7dK7MPSC+cyMN9caVMhsJno7ie8a+rIGX0V/4MOk8w
	 NQtnI79HgUoVTvb+C6I6ZOawlHi9yM9f/S6vPpBmI7ZOPwQT+Sg2zLLlt6rre62NhUa8t
	 HwN529xHbD7ieceuIAf5xdTNxf2R4Ydxmx40Wsco5jD8G9ENNvEt+LNEaWnN/HYXeFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9GVpJjN;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8C1606D801
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8C1606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9GVpJjN
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36d6e342f98so876938eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811560; x=1794416360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=H9GVpJjNfXZGUqsmghp2cKOprnw8Bnvj/UnS5b8MaWqXYKOxNlAWr7bgrLWMFpI+ko
         0oH3YdZfCyADrEJ3wfjqz27Zp7+TYxiGXK31RZhqzC+wH1UIdiRnVAElMGkWhmvd8Uwj
         khR4G8xLxOYIR23K50gGJfq9w++OKpiIvi3ZdQ1JSpJUeAn7bQtiQ4Q83sJdDBAilFM1
         yH7GxG5Ux2ZwhVehwzt5XXGu4/gCx4Pq+i8yK9wPeMDfYGlTu+4Qelk4f5V5J1ypyiH+
         pwHERBWzfFtSYBnriW+BAeASgfvDNdD13mQ8pppGMVU/lcCxOBw4CL4TLjHCsUQem+TO
         yZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811560; x=1794416360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=z8blBP2JpNigmCl/nuBNHplRXH1DuD6R1965LTMq7BAE2TFl2xpSpZG0uU6667XS+5
         +3tZGpapcWqCO4govENAy7fG2oQAQBuJUSbLXX3U/SUFYGwRy58JtVsN+V6UtYI0mkI+
         ieJylp5krUYQHbBnKcTpnhh5bmOe/pq7MOwEHDK2/Q27XT74QfneJ9ZourbUzK+ztHNr
         YXAQC++r8ZP4r2H+FZxbrO5+1qFhyG5Bu1w5ZeiTMRmYcsEk6QI+CsZuhVgs+9B3Wxx+
         uaOhW5oKpidvK1G4xuo+GEAbuqcceeJgv3JACxsLyp4c0raGxPTQVUl4g32VPOC+2VFS
         GqMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlPFbRjZVpzn7KYhUbTf7LJk1P3PCCzTq/PacGMLjS4lK40Bt1eDX5smWm6PO1i+G4OYwG@lists.linux.dev
X-Gm-Message-State: APuU4Z/OXWy93BcDk+612VjfUuJkFTHJZ7sqlTMRwePC9QESM70e7Qtp
	M9oFf8kmlzD557EdmnYpfCLA2b/QsK9fGNzC2VObXH9jA89UhkeqBQN+
X-Gm-Gg: AYBFou3h6aC+xvzS5pv0AIthVdcpFsm4+a2K36v3yEKZBSfH5QCy/lTRhAqmojMsSV9
	WmCXBV++lTyqThCLfFo4xh4j2a3uUjaspHz6mfbpegXl8DfjKy7eRxxVFFkGpEC4WmI8GwlbRRt
	FpRq0to2bmBPQ82lAUj11D63RTRVe1qkbTF0pThsXkDBEZA95gRSrR9Jdsm3Q2FOXl409S9cSOD
	szWT6TLW13vcK5UCjSJp0adqyrJXBSB0yRCEiAYyd+PzmIiL4OAB3IPyEIhehgaSekhOQTQLY+G
	BdN2WGXWZQXFDJ1jA4FIGElouALknK/p0GMfkqrVIVICJc3FQGtGCZAbi7xad0j2+7EsEkde48s
	9LyX6gm/81leQniN9tJ4TMEx6uoVnJAZDeCCdEKiPDQfetVSs4C436U/IVrlD4OIAV26kDqRWlM
	VzzVHSdf3pWxOwgrKYbCFpJVusI6IuJWfCGcwl2yUfGZfVOWJWhiLCvdHHML1StXxdN/eTstLOm
	DtPHDQT+pE/IgMzXid3skyJ7zLe3qDVZRgMpOwb0vAY7KLLT6uKOnk4yrcgNmeCxBhn+n2ZZMVl
	cqZaJWCuYLKGLg2yMqgQ0r1bIgOoXq7l89tP4Hs=
X-Received: by 2002:a05:7301:640b:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-36a42363ef8mr22540460eec.7.1793811559006;
        Wed, 04 Nov 2026 08:59:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:18 -0800 (PST)
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
Subject: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for rcuscale coexistence
Date: Thu,  5 Nov 2026 00:54:44 +0800
Message-ID: <20261104165504.2430480-27-kunwu.chan@gmail.com>
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

When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
the same kernel, hazptrtorture calls torture_init_begin() first
and rcuscale fails with -EBUSY.  torture_type=none makes
hazptrtorture return early without registering, allowing the
rcuscale hazptr scale type to run in the same boot.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
 .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot

diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
new file mode 100644
index 000000000000..c5e9cf0184ae
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
@@ -0,0 +1,13 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_TORTURE_TEST=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_STALL_DETECTOR=y
+CONFIG_HAZPTR_STALL_TIMEOUT=1000
+CONFIG_HAZPTR_DRAIN_ASSIST=y
+CONFIG_RCU_SCALE_TEST=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
new file mode 100644
index 000000000000..e9cca4cf453b
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=none
-- 
2.43.0

