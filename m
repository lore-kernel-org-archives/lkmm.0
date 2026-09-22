Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12664511E97
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061038; cv=none; b=So1JFFmrQ0XGTQUy2z0vZjkHQO/oJuAIyzVwoNuZniwz9FSzUtwJtnHsanew/qmWLPPaz3+4XVlTiSMppOtp0GtFtnv2ZE+HIo/7Ula4Kdx3E9w/RoZtKLl6cd8HaIYQ2zzUUXVtPQibqkcddapqLNyduSP/XZg1xkB5i7xqgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061038; c=relaxed/simple;
	bh=m4OHMwMbzXlh2XQ6c0Igw8Fqh29mNUw6HniKWr6Zo5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0POIwhQm3nr5uSEw35gpVD6mgX77oB/z4YNeLM0f906cTdK1eXiJK23re6QeilKB2SsrrBSpQv/2RJUzYTYC03FMc6Zuif7/AorHH9X0vZ5Sg7SQNAmzIhQl0XMdvGSjyQzaJPkXSVkL+pxauu3TtT+bHJOiBShFzvN5EJX2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=si6Hc0bg; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="si6Hc0bg"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2621384a91.2
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061035; x=1790665835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y92+ar2Zyy71HW4Z81q+yVXNw3aTL5K091H9SB9aDmE=;
        b=si6Hc0bgvhUMVIZnyLZr3sSvK3q9apEmxUrxKDTmY8qyyN7SdOLN6Oz+cmmqxHrP4Q
         0+hA1rJxLz+RZRhSUw2mCGOM6U5MQJB64qPvo2Oo9PWzq6FxIzNPVbGvGmaHMvhEQbfk
         9X8bQEJHUxfmRgC05NxaAeIL83jgZbSc6l2PDy6pjE5vYCR1IVqrB9F7St70af7gZp56
         RGa2t8E7w3xcIE3VcwnG5vGUQoYAcJCGNVYdbCN1rSMjpjdkRGJNR0OYq/wMMiBWD5Nz
         JeMlgLIgcIZ3PWOXlS8VYhiy28qxLHwRkfxihevuHeCzEe/bVygGARcOlkV+ODlWOnM1
         kKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061035; x=1790665835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y92+ar2Zyy71HW4Z81q+yVXNw3aTL5K091H9SB9aDmE=;
        b=AYpPlaEhpHPdp3E/mTddgb8p/MjqMzq8ETwyQLBQwSxt6pfmR2XYU09sFAjnS2oIG6
         CBMzkAanUUuUFDfLoOb2egCo+/QaLTT1qvkFQbz7S+pmX89DrMvpDzr2RFSp4Nm6cL04
         Hrw1Iuaf3SVcKvN3lJYcP5DK43c8vlU0ncWE5V3URPom5iY4bUJcHzzMCjQcqYmkxcui
         cl9pxxm7memCjQXTic3OktHsv/fMjcmLruOVoorR0gVzjiVASBFTK+cOxy9TheOtkov1
         Mt9bUIujQi1x8ujEbE7mmMHIq5vU1Vee9WkYUtWyvfQOgJNv6dYCS84ODuZcz5LiFNZh
         YfhA==
X-Forwarded-Encrypted: i=1; AKwUvByjY6hbQYR5ke1CJaL+jLXbjtEEYifBh1IhfcUD0KwSsV//CuFeQ4eNvPZBswr3UAhYNGJQ@lists.linux.dev
X-Gm-Message-State: AFuF++nU+bAPNn+sXfSou4mO+W8JF3aE3wOSMBPwg/H9nUnb/XHq2Dza
	KarqsEE4EK27ZuDyaC+V1ms6vaetbpGq6LZUVXoMDRUKf7rB1/QiSWsl
X-Gm-Gg: AYBFou2F3gftmvKkEXftMugNQm77PpIUZYV7twI7A625AFQ0NpyA+gLMsF83H5CFZLh
	My0Mq9yojfe6N0GmBNH54RcNItsZqXD+gxWb/U2tw6qVvqsiyjB4nmbpCz3OEIy/Mp1+/n4zgM/
	w/DlO54B6WNhZ0dQGmkLHcfiy2UZw4tvIUMQHY0hhkNxgtQ8cIBa2r+U9MoSaoIdSNcQ9KRz8Wn
	nM+wHXYZ1s5cGK7/HQUY+VXVeIPZ90xchmUuIH3uLhMJmhhXiDcSLinEuImjQ0JyxAyV5r1GCwC
	YLC1RMLFmjOa3Z39inbkB2tGOgSNp2GqDItbeLYpf/19jK481pWPz/KzPNtLWhN5TrGhWack/fQ
	oI5lBcvc6yLh0Y9Qr40UdW60PduqcZDfd3Y9Kqb7rAzjVXwt0LpchhTNlqhIRFDXTU2q+MzwLvV
	W7IITNa7qKDU5WOHWoVkJ5t/QGAFfdquxIILIiPlvOhRX2aV9CfgS13lD5G1rbHceehDiKnx4yM
	A/KrtSVltIq7FWTiQ==
X-Received: by 2002:a17:90b:3806:b0:39e:6c6a:2091 with SMTP id 98e67ed59e1d1-3a073235b91mr260254a91.50.1790061035059;
        Tue, 22 Sep 2026 00:10:35 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:34 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
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
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 3/4] rcuscale: add hazptr scale type
Date: Tue, 22 Sep 2026 15:09:49 +0800
Message-ID: <20260922070950.4173245-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070950.4173245-1-kunwu.chan@gmail.com>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hazptr reader and synchronize operations so that synchronize
latency can be measured alongside RCU and SRCU.

The read side acquires the hazard pointer in readlock() and holds
it until readunlock(), matching the RCU/SRCU reader model.  The
address of a static object serves as the synchronize target, which
is stable and never reclaimed.  Both normal and expedited sync map
to hazptr_synchronize(), since hazptr has no expedited concept.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 65 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..072ddf9526c3 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -39,6 +39,7 @@
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
+#include <linux/hazptr.h>
 #include <linux/sched/debug.h>
 
 #include "rcu.h"
@@ -418,6 +419,66 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+static int hazptr_scale_obj;	/* Stable, non-NULL, never reclaimed. */
+static void *hazptr_scale_ptr = &hazptr_scale_obj;
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
+
+	preempt_disable();
+	state->addr = hazptr_acquire(&state->ctx, &hazptr_scale_ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	udelay(10);
+	hazptr_release(&state->ctx, state->addr);
+	preempt_enable();
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	hazptr_synchronize(hazptr_scale_ptr);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	hazptr_synchronize(hazptr_scale_ptr);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
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
@@ -1110,7 +1171,9 @@ rcu_scale_init(void)
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

