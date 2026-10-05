Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE394DA9B6
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220670; cv=none; b=eiekPPYkdR5uQWnP/WKYW2T/4KpopiQoO4VAtgvUL2erKrUA6odX7c6jOxwupej17zzoXEVRB0QWYuSYnHH0kyS26jB8p44kPUejFXmYOXrMDoarQ3vjNuugb6MHYeuWufrH+CYHVW2+UsATq8OGNam0Ln3PKkMDJcQo8AwrHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220670; c=relaxed/simple;
	bh=9oP9VQ+JM/9PdWJ+5+ZGbwB85sJAY1eTAyp/fwZIqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFShccywQ1FF+z+gF9EfeXmup06ur7DFNiAdHEcMTiJogfpJAwWFszlZqu6ZzXl7NrmRlAgF0NWmLxSrZS1ahMEwNAfMYGPX8SekBoSRy9qhQtbt1yIE1KO41F+JluvfVBHIuncpUTlDZ+GQ6mIN84AHYGEn7lXgcJ91xtr4NdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8W/hXZC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8W/hXZC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso757642a91.3
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220668; x=1791825468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=N8W/hXZCmwtitVYpiFnUgAyIBDtmAVv75pPEklScFGKClgfsVG2amXY7IGLzAQmjT3
         mkMHCkgf9kUX7qr9XeEaxrArW6H9PNFFCJRTGT2h8sBAFZ8zZw6m7nIREBp36iQlUSTW
         CyjnPNLnc/4j4zA4UEj1WWaITpyZQlOPsWaRjOcJeN0mrT1xw32O+WiZUJoVDHSwgbFz
         C8dtfDJ/1KGZzl8BCOdiQth9NvR1Y6hcYGU++j2iPpYIX6Y2rcXa4ypSsqBKzBkr/pWr
         BgbfwwO/mnsVb0dgbcTkttCdbRvMYC8REtYm+YmCRu+pUeX+5G9DdsP7+ABUw4UWIEam
         /CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220668; x=1791825468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=pLd5V5DFW7hO4abAoJVwqDxeH41fKPmcp57sM0fQFzb77JCz00IuAzO2v8ewpQVHtn
         C14nh8NL/02NorjhvlENlZUID/CnUAtVDASj5jChj0DtVDX/ONtyh2obB/AZM8vP/D9c
         /w2sczBcwq/LM2xVGde+DAx8nue4s0vhBYNNCLNTDAqu2a2Elk5kVnNtDwnrrt079AE3
         0bbZ+6+TTAedB7z3Yf5JMmeZEEtOiaYLwoFysh058qW2dg+poKMVpOqnb9crg3ex0tpY
         ReAEevXGUU0EkzSF1UgJmmAJ3pp/3dvHbOHAI75Df4lZPTv/5YfqELym0M+Kcw2naNsk
         wqqA==
X-Forwarded-Encrypted: i=1; AKwUvBysow/8Kb5NyGcEaW4wUt0OLdllTZMOCc88AKASkt5IRQsceBKw4k13YZv5+nwq5sZLHJ4P@lists.linux.dev
X-Gm-Message-State: AFq9FYL3YoMh76gRlq73i4VOcTurCYAWeYp7LJwBoyl14rmxPsRKjrpV
	VHyfpmCKa6xfy61NM53B6JHM8aUCfjmjcfN9ob0orP/qwPJfGfNAJaZv
X-Gm-Gg: AYBFou0ULkD8Gd35wky5N9Jkuxnf7X3E8WXf7qSaSh3uRZ9G03h7oYDEm2Vn5tx56ss
	k8ESPhulIoQDtq01zOWW58rIXyYOUoB87vHQYRSs8U5VWN9PIoev8ZuQ5z/evhj82dGr8O6xcSQ
	fkoyGeHqFJoOkJTPmJB9P7cR3GQ8co7t9aAEmTHjWAIn80FdHVdipXuHn7jdagYhQIoimkgj4EZ
	QLX3PvZFD/MARG5IsRoVmUmERL+slw97WmPkEWh/Yz0k7SohSWYWMC60t9EGLCgTpvi+gI3i+Ht
	0sLwB3Axv9F7DQ8XNonD+bvjQLKvaVPndU2aS6SBKF1onF9nDLcG/fLW6Ck9Yy612DvtwjfSbBT
	E+xCP+lj14cCBiaAfFN18xZkz0sz9TuKazjTg9yFQJB7SZ3jYw5DGngfR/4aTUIWmxSaOrWk/oT
	s+wj0yTp0TN9TLDkJ380PJZc/IZF6CWEhqLqZZf0wCisi+PsIuaEVT1UXCx8MeRMxbPhfqzFjYn
	4Ymil5XBL/BXBnKCJkaEGqGS3/JhClQfaVgvzat
X-Received: by 2002:a17:90a:2ce1:b0:3a6:dc2f:f087 with SMTP id 98e67ed59e1d1-3a6dc2ff4ffmr2745576a91.53.1791220667397;
        Mon, 05 Oct 2026 10:17:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:46 -0700 (PDT)
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
Subject: [PATCH RFC v3 09/15] rcuscale: add hazptr scale type
Date: Tue,  6 Oct 2026 01:15:23 +0800
Message-ID: <20261005171529.1378809-10-kunwu.chan@gmail.com>
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

Add hazptr reader and synchronize operations so that synchronize
latency can be measured alongside RCU and SRCU.

Use a small set of objects so readers do not always protect the
same target.  Each reader protects the object selected by its CPU,
while the updater round-robins through the objects.

Use hazptr_synchronize() for both normal and expedited scale
operations, since hazptr has no separate expedited operation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 70 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..5aca31c3c01d 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -39,6 +39,7 @@
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
+#include <linux/hazptr.h>
 #include <linux/sched/debug.h>
 
 #include "rcu.h"
@@ -418,6 +419,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+#define HAZPTR_SCALE_NR_OBJS 8
+static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
+static atomic_t hazptr_scale_sync_idx = ATOMIC_INIT(0);
+
+struct hazptr_scale_state {
+	struct hazptr_ctx ctx;
+	void *addr;
+};
+static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
+
+static int hazptr_scale_read_lock(void)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+	int idx = smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
+	void *ptr = &hazptr_scale_obj[idx];
+
+	state->addr = hazptr_acquire(&state->ctx, &ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	hazptr_release(&state->ctx, state->addr);
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
+	.exp_completed	= hazptr_scale_completed,
+	.sync		= hazptr_scale_sync,
+	.exp_sync	= hazptr_scale_sync_exp,
+	.name		= "hazptr",
+};
+
+#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
+#else
+#define HAZPTR_SCALE_OPS
+#endif
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1110,7 +1176,9 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcud_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

