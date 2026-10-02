Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3D4F5E03
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961045; cv=none; b=fHsj8qx8ulXRIy1g3Br/MsNQsUg46+f9hi4EynJMAywJNliP0feWe7Sxo9c7XUiETBpfoDHxiqbSsSOYh67Mxv1ot9iUAOYX10fZCF8q7B1HjYD8svWpfSXu5GVWa4KIlt91OZxrVD4xpYRbYspVPdKfF4hH3+HS3kA5603ok2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961045; c=relaxed/simple;
	bh=9oP9VQ+JM/9PdWJ+5+ZGbwB85sJAY1eTAyp/fwZIqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jvb7QR/R77S79ItQ40EWYr5eCouGC6ABDM27iEWq5D4YKA5/5Q4PDSJgUATp/CpD6KHYqM8HGJlJQLVK4XL0E4WgLDK/QdZ/UPdrMFz8zQLnBXFKIbS4w1c9TE0DnDeAXs0RJUPfb0BytXUQac0V/umjXuUmkVQYvDI1pOrk4T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWKOKWYK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWKOKWYK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso98167a91.3
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961040; x=1791565840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=IWKOKWYKrk+hxTFLWI3ExXxFIZMtzfvHFb+abuc2MgFZG+U+cyJQYTJ8Rmwc0LEPBw
         E/omNTxO9IV2aeTe+JpX+vA+Q3hD8vQUj72o6U570RlDboI3UG/IfyfxCkCJcQ8Rgu2+
         RFZUdb79hKqdlzczmQV7UPK+vNwyS4BQ8t1pM/XLSeZP/9ryz+E1qVrIc0cTgPzLVQP+
         C0psy8QdRDPSIzYKX5caR6blvuQjRzy7HrgY74x0ai35u0Viwog2cgGdHXa1dEItr6j0
         QWDMX/jZyaFRFy12tH/fwxHR26I7ekvxhTCXfquZeU5EtweH1NHx3M5N1HP/zlit/CVE
         +GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961040; x=1791565840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=LdqO+s6iZdqaiPx1ddebkziL2ksmPO5BXZZukRfUvV85nn4KIwpqDP+FX5e2vibpw3
         BrCZYg1+vtQmMfUKNlmap9QVbkItHfuiD4x+s3MlRMvq0mwY2CsT55EtAlb60ULuKZ/y
         sOCsUmWLf4/JshyFB1U8wMU/JKojiUM3PkfVXhQRDT5zG9mp+a5q/CxMwi/YZsDYnCqo
         w5jPSy43Xd3kUApENzCN04CceWH8Wa0Uk5A+nawg27IsbthYXEXiYvETSSq0wIyX+MR/
         34aoMaPxSg+/CaapKnb9W6QW+UYco6sIsUVM4dWAKhBv3t7ru0GTLGNhvlLjx59+NWAZ
         jcKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3Km0JeCrW2SgwNNYFxRzKLOHFysttrc6Arkqa+CPfAjJQU4KSahZMtQPMCsxhMzCG615d@lists.linux.dev
X-Gm-Message-State: AFq9FYKSHHlEF9vF52PGsdFm2ij1hKiN0SrWrxBannWDIhUPKnpWPxa0
	3a+PV89e5g1jSAAO8OTZJYIYZ7i75Zo1GO+YPrLSZPoTSzNGasQBp9Jy
X-Gm-Gg: AYBFou22QiJxDan1I/99TgPShN1pXBFZevrFTeS4ONPoVTVIjEPT2HhfcmMFJLW1exY
	8OmldJ7Aj9YU9JIuXkTcwGGs4IacJxPkBHkvVf059FkBEibYq5BvkGGN/TpUiACIocYiOsg3/nS
	cXX2G/0zOpR1pyHEASr61DSsnGOTRjp340KI3G8+OGju6h2B68MpwY7Vf4faTEZF+Kk+JyaM3s5
	5u3Oi6+vsy30Z2zXM9EgXdcBeeLRkWF3pgmcrJK1dW1G0B6HFsScbADgCuLdRiwGizVciY2Wr3e
	gxLXfA+Lm/h4qgOUcbfjY6KtVsiwyw96ZoS05yKiKPKfYdfE4TwxCHMxkyRc9FH7gYSH3Rhkjfj
	qMnZZGYimpCCOIGDrShblN4Bapsw9S6DvQZ4XK+tkVtNaP4TN+wUm7tItu5ACZu47ys6lCNeYai
	M/l4dQBn9xANUCW2LQDEqcR5EuVOj6NElLDdUqYU8AAXTLmR56aDdNnPIfM2WdXv9KowZNQWgb4
	mPEggesD6KbNS43zO4=
X-Received: by 2002:a17:90b:2fcb:b0:3a7:f45:5cc8 with SMTP id 98e67ed59e1d1-3a70f456851mr373445a91.25.1790961039819;
        Fri, 02 Oct 2026 10:10:39 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:39 -0700 (PDT)
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
Subject: [PATCH RFC v2 09/15] rcuscale: add hazptr scale type
Date: Sat,  3 Oct 2026 01:08:41 +0800
Message-ID: <20261002170847.3653663-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
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

