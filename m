Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811533;
	b=l3X/eYM4sTcCEPWjGVApHzBPjgbNLhozoQQitsq1oJtVQGCiUfrviz/6ALN4XzP83f9j
	 FKmxLcKIcM4dWncKuuWPoVQEoyFygSC51UBxxf2JSjvjzD7cOMtUFftCKBBHqbJusLeCr
	 C6QX5jxpVS7muHmo9do7T7fAoCFLKJl8mJMKUmJyhcHj/iKGzGlTjbwHhlzhf4FfRKR9y
	 b8UDvoYZwrIPUucDxN4h/b/vtJ8jrYDnjgbLWgXHIbtaEO3AJ1xilVqgG2spa3JdairGi
	 6ItlB7HxU0n9pOp7X1WMAAMrxAKKo8j7BVmdtcngLuLDF0Z/uVEvHKnynsu92EMnMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
	b=3hpJX5fadXP7pk2mLiIi19XvhI7SzJfRY8DPh1uXtK4pGekOdzrnyqAEkTui8HsSqxv3
	 yL9ChLYXUQn7E7YaFIASksLe+PZ31NLVfvSAsVNS/lseUq5++C5BFydleS9/GwdV59iLY
	 rXTHn0SgKYHnkCGMMrB7GfGHZZhzEnK3O0QxlU/OfCteoXUrafMSCY/4dj3Z0g46400Ot
	 57K2JHFlOVKDzECgZTtXfA4qhHaLuCmR74/WkjxiW9QwATyi8tPd0sXrRS2xdguimEv1q
	 8os9KQZbPQpRnAWnT1jWM+0CfgVz3hsnSRJ6UP/SmGYq3lP/6oAyiEB5SoPpIChgcfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC8pIGTf;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7D606EE97
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C7D606EE97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC8pIGTf
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-19305bcb72cso881155c88.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811532; x=1794416332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=lC8pIGTffyJvV8sai2XuyZrZtaeRO1Nf2NrsAHsA/Gavh3909A5vZc1sPz0Vgzist3
         k5PP3R2Tkz3M2JI9De5gobZbPAMGQudBvR8sYDDqKqwtQNztvSeB8Pxu8DMeeDWIBnfq
         naXRTJvTzPMhEtKTaQu7KpXG7BmSlBZdEFvT3l7AIAdFk/RZj8Cll7TpB8sUc1sIPI7E
         mQARV0ZsTMUoKoKQ6PqqEEBNppWUqzYWYjqwso+8EV+5fabnCQiGdUjk7BZYUfzkfFfC
         PlR9ilKV6ebfqdDUUhDD88DtIweesMvLEV/reCAhrPzZ+leZ/hGUYSo2I6vwCUPpSqdy
         k8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811532; x=1794416332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=M73/Bc9qXkSEHuMIEcyj5b8ykg7kmkJ/+bDwkTwgz73j6M5flh81nFRNcbOsSAAU+P
         0LB5gfY9MyWtRpI8qHiWzTsiHz2FiEUSqaNmCuqROKim55PvaLQ9dw1MuUT5mJ+dyy/i
         eDpWwQVsfic4zgL56cDTVKASP15WSm8OD2/EmOAw66D9i+neoVLB7cgIM44pdZ09muN0
         8f/IHoFRzoA4LDPYAE0mhIuTtMGK5LY/ji8ix82lwd+JCi+zzr2d5y3Hr09czaDDt9D6
         BfeRfsu372IZx2NtZr0krhsRB7kgNOGt0fG6+B7ySEWk2P6neeVE27p85GPLrR/qKYLw
         kE/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcuhuL0wrNRWVlsvwAfyxSzpgt6N8+klURFZnp5ENPqshbfA3NoSSyuvNUIqGKdy8dUrtq@lists.linux.dev
X-Gm-Message-State: APuU4Z9Wza8GFi7n679YVg4j+YXsidKOe6LFCdtcVS4FrWVQxIh+OTRj
	zXtDiKTybY4UjoBi6L+zXo8gEpEIHGwMokh5equgRBR2bqTKQ+cChKiE
X-Gm-Gg: AYBFou12L2zEnyOdn7uVAsonomTqGaePWWRT4TkOHBZvUFbNeKLpFzwTRKjDnaN15bX
	KUkpdiJ+XQoaPQuWtM/IBVLClR+RgSPpu+VNOvHXwLKJUe8tAB7jmZWDAcfgqyuYL1F11Z4jt4Y
	DbbakHk2AMsWeOHN15OqJadyMUuOpMinBmVob/tQyCJP2RNf8bnnETJdp6di5ScBLKCwXqJbdE5
	AfKckdQQlylSZWMMjpPNXUf0+OJLdD5kmeSeOQVPdb93wgyCc9subl1XYE4I9O4hTdotVWsdi0t
	R4MFUvRrdw2/d1iOCKE0jrgkEOTbRyuIH7zFjw94/A7RQR4ziTZaaEOmTEWB4fmFcgXSL6xs77/
	dGSJH24CD9mR8a2WF7KoM8PirA7U/Nx5LZsXn4wTWKS8hnWz+nZ2xTAVT9kiKbTqplllj9vs+JX
	OLWwp1ZEdAfPXpB/dPoH6SI65o6/sacLiJnMlk86cQGafZo0QyaN6CTnUGVgASCnlaRWazrZctA
	PnhLeGFfOHPBsNf5HYgsDj0mbr+LtUPOL+LxYqehw9ywt/ior0sj3MGEJTt7tkQD6/bIu00t31S
	CLJ6qgvE0GoM+yiCLArwlzSYmfy6sn1UJ0Yr1KmP6acd6TWDu5b/nyiH7WNa
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr37599893eec.31.1793811531717;
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
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
Subject: [PATCH 23/28] rcuscale: Add hazptr scale type
Date: Thu,  5 Nov 2026 00:54:41 +0800
Message-ID: <20261104165504.2430480-24-kunwu.chan@gmail.com>
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

Add a hazptr scale type for per-writer hazptr_synchronize()
cost and per-reader hazptr_acquire()/hazptr_release() overhead.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5659eaebc5c0..6e3e3f296f85 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -40,6 +40,7 @@
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
 #include <linux/sched/debug.h>
+#include <linux/hazptr.h>
 
 #include "rcu.h"
 
@@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
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
@@ -1140,6 +1206,7 @@ rcu_scale_init(void)
 	static struct rcu_scale_ops *scale_ops[] = {
 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

