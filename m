Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811440;
	b=gXcPizSdMQl+jtt4zd3uKlrQZ3JyCRLc0z3FvdPnrIW42JzjvTaKOO6nKHloUP4rx/3h
	 /Lils1T/uB8GOK8UZjeVo4Nj1iFcdECZE0H8h8EOU23R5TBRMLHiL/Bc+2vWB+6Vy9CoN
	 kP9jkn/iXdp9+Xaukflsopxmgh+KE2XDomFWcsBi61EctUFBkHPa5+hy+LG2sXvFnU4tj
	 2YjavYx0QHpH+z/0S10iecOAoZvXb/Iyy2p0glJ0fRnpVIqXHVfVqFB1MAZQ85xp8jPjL
	 a2gcZ3objZnLkzb5y5CKhfDc3Pt0R11wdpa3PokiPDiNPzwoc4gy2QMNFFIHzfGC6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
	b=qnJQUcEr/C1zU32cneFGzRSgdOzb1ErDyQpXEiq1tsn695rIrtHlWt/4JbRUC7NA0vFW
	 rrrXmoUjr/LYNKk+e/yHL2wuXJQo8in7z8t9qSS2kOldGkcyWqxcVX54xr8P4+9FEThvH
	 7npFyfAe/01Ft/IN53RMcnofzmq0Cr3D3tqKUjonnD8xWwRzp0NDpk6HUJj3gE9Htt/rg
	 Zt0e+MN0gS+VfRbJm/4130d4zgzrwKlT9alvCzGSb2z/Y6qFQ12ldA241CudJvQsKKehl
	 VfXDiuTRn5xga7f4YtlwJswX09wSOmcqEXciZXqw54M4gwShNexEFerDVzHwLrQ6Lxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xlZ/uX/C";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5367B606D81C
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5367B606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xlZ/uX/C
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-19305bcb72cso878714c88.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811439; x=1794416239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=xlZ/uX/CwWAMwXzkut4/HZlbf5Cr1xIrp5Usjp+o4DeRaZ+dXSWMFR30D0nfKpEua9
         LxisL3WS1REF8XryNt3w0Stxb0dGA0fuWhc1XurxwgyrPCrpMd7ukkgMJ/DkFNJZqVY3
         pnbi4weCaqX3uTDOaDU0xCl6UA7nnQDN+vQZaKVSzzhmHPesDjyAFH7S4Y6rt2/fV3GL
         Jb6l0XupI7XVFP4Iz48tHYndifYhXjs9Uu7GQH/CWBYD2fsr+KBcq9XvsiaocEzmptZx
         cfh5w/Q0Zr+vHlwgGpbc9YeziU37CHN18dLdLimCxguqSWVe+o1js7gXT2ieiA3NMq8a
         +zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811439; x=1794416239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=ya25I5i+0uKDXh2wl6JbfuQ+SidSSOUwXSRLu8RuXPGaz5tjWm+Zie4S/YU4KW1RYp
         nSSLESF418WQPx2CS/2042i7I001Rk+6uTRKahEotF+iVxdKI7cgkT2j8vvhQjtldDZW
         x5slsrOQL20WcGRzdVUOaluA1vRd4J/hnYFoXgHSsi4tuU7qPJDFYVtNEajs7BT7GHE0
         40k5otdK3ZeECEF93eQ87c5JFUGJQW7Q5qL8tr9t1g0HCMlvo2ymQwMk+kd6x/TdjE9L
         E+J9wh9l/wf0lQMTOOkPLmQYUQ1D6JqCkDkQ1fxlRk03405vWKxSRE544GN9r4vVzFsQ
         nB2w==
X-Forwarded-Encrypted: i=1; AKwUvBwI/KeWSIOJiSgcguN7WWDCTHZQkSFVbW4zfg4c936NBgyRZitxiUg5bEftoxtpEzOC6ABJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+pSFUh9djbIYp1+RzUoAKCTgM3GZdIojWBYLFfSawwtDXVItp1
	utV7hpLIvm7oizJqo4ZR0yK1DN2B3eUFS8QiY/7IGFw/yXDdsbPzN/P2
X-Gm-Gg: AYBFou39x4m2fns2DyX0v9FmP7FgBO1uhnPlE2h+mqbxcv/MfVrVjSZIYdugmM+Uqj6
	HQFnBwuGXi7hS3lnpgur3ujJ61re3kSMtk3EoG4XpIu9E7SuOEd074dcAI/oanjaYHzBRzq7m01
	je2N9CZ859MrgjzTy//u3ExP5wMraQ3zplxXEdsLt970vc0Ttw99a5M0XV5kotYsHzQFSgrBsoY
	3MWO9iQr2Mno5zva/zHeb1n64gwBYuAzunfwmb1SkmHNBcb+/+n7tLArNr/pZFbJOTXy3bKje8O
	gvdtu+twYywiEMfy9p5TyzTdGctXJ3ujCiOTrPqk1OoiNW/ss3SeMPJ0aTGOqJcOavhrrTB2J/7
	ctI028GrnTR9bxWiUcajja1DlKywuIrkJCz/WNCTmN6zurSqx7G7DWPGTvUsOV9UG3y8Ul13+9G
	XcqDoWHNv/pLbcdwuOr0M8544DzA/MO1b+khMYVYbB+zP0G4NY0HxW7Emw9FLhBysVca9GfsiJb
	6tqzdDBSdxW/8t9bA6IG0FzakGfuBuNhIWC5YO3f4bcuMp+uDQVIN66JljJpxqz3kJdlCrASCIj
	OFIR9zbPUeZlo6aC/F4EzQkKoNmWzaKBIzkh3qw=
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr24847940c88.8.1793811439033;
        Wed, 04 Nov 2026 08:57:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:18 -0800 (PST)
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
Subject: [PATCH 13/28] hazptr: Add waiter-enqueue tracepoint
Date: Thu,  5 Nov 2026 00:54:31 +0800
Message-ID: <20261104165504.2430480-14-kunwu.chan@gmail.com>
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

Production tracepoint fired when hazptr_synchronize() enqueues a
waiter onto the scan kthread's pending list.  Downstream users
include hazptrtorture's staged hot-address scenario, which uses
it to confirm enqueue before running its controls.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/trace/events/hazptr.h | 29 +++++++++++++++++++++++++++++
 kernel/hazptr.c               |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/trace/events/hazptr.h

diff --git a/include/trace/events/hazptr.h b/include/trace/events/hazptr.h
new file mode 100644
index 000000000000..1eed4c9fd682
--- /dev/null
+++ b/include/trace/events/hazptr.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hazptr
+
+#if !defined(_TRACE_HAZPTR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HAZPTR_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(hazptr_waiter_enqueue,
+
+	TP_PROTO(void *addr),
+
+	TP_ARGS(addr),
+
+	TP_STRUCT__entry(
+		__field(void *, addr)
+	),
+
+	TP_fast_assign(
+		__entry->addr = addr;
+	),
+
+	TP_printk("addr=%p", __entry->addr)
+);
+
+#endif /* _TRACE_HAZPTR_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 4784df78be4e..16f6e2acaf87 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -19,6 +19,10 @@
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/hazptr.h>
+EXPORT_TRACEPOINT_SYMBOL_GPL(hazptr_waiter_enqueue);
+
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
 static DEFINE_MUTEX(hazptr_phase_lock);	/* Protect the list phase flip. */
@@ -411,6 +415,7 @@ static void hazptr_synchronize_queued(void *addr)
 
 	mutex_lock(&hazptr_scan.lock);
 	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	trace_hazptr_waiter_enqueue(addr);
 	if (!READ_ONCE(hazptr_scan.wakeup)) {
 		WRITE_ONCE(hazptr_scan.wakeup, true);
 		swake_up_one(&hazptr_scan.wq);
-- 
2.43.0

