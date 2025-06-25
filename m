Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C91EFFA6
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821098; cv=none; b=UK20SBI1EghTLDSxgep5hz+YdjKbql/ua9Fk395c7DtJPFus+E9N3z4WoULXPGCPQJPoPZHd1LivrdnV1bI1Els9umvoiKkWT/n99/pYXigCTmXncIRQJNmQWI9fUJP3Tyqq62/UKaw767Fy4GLaeWMOzFUX7CROe9Fl+3W8Y7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821098; c=relaxed/simple;
	bh=2Zl3n64ENVCvkp3q5SHTf+XFtSOXGOOsCzI/DQkaM/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ext5m+Z18fIDH0tSIp4ZNvrCyNxmJh8i9+f4sVv/PZfl2GS6uvoehFUwt+YglTPXLT3Pxa4skJgaERb1oa3M9K9VRO9NSo6cPyTsHh0JfZHo82RBj/qRW3SrUayQ83aejdVp/SflZGsje4YFByp74049IgAzzx984vm+NNARG9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSjXWa6V; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSjXWa6V"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so55284485a.1
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821095; x=1751425895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/1uL4SnLWRugsWnQE9sdQcVDzQKPklHv+4Xueonr/8Q=;
        b=SSjXWa6VuC+Dv7tK/PIeQDGhgXTvhweHG9ZF2i6R+ymF1oz6vbynC0tsQkZZUQeXV8
         MnwS4HLJsfvehX+3fUSylSfgYcp2Xr7m/QQlm4/iWE1HlfEnGO8LKBZDtkFJ960/V0x9
         3e47B09/pvv9omKn2a/iIlQZIgLiVeZaemfR63lvh2Xve6vkw/nTzC5KFJLfQk4uUvNV
         muQkWnGaACjtQPXSvNIydsGCxSb1FjIeoWmyDc2+t74aPAiImoU3x0hm0H3ApHi6LmR7
         lY4QNvkxse/wCe6H9oBqkZAIqjDxk6mnHrB6bFQN2l7N1z3zunKru8gy7Rv8Q+CS/WQ7
         D4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821095; x=1751425895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1uL4SnLWRugsWnQE9sdQcVDzQKPklHv+4Xueonr/8Q=;
        b=jprF4HzOsftYR3948BQMTixpIhH4wr3aF1mLO9gpQbQ9flaD+q5bepvaQbI5WU7YEV
         pGy8kM9E18nxQAedMBEynjzawgDGZyRc7ONjczuhnsrIM8uWyTCLQOhzjyqGVEKq8qZT
         YnVekY+2KmxUV9HoE+EM5v+wfONrFoRoSA03irVvv6+Aqrf5PKYpn9wgXJFq17YJo6xL
         BaacEdxS403WSFzhR/6ytkHo8bJ0S93Dj8PAH/Oxg5hDmYtaCFxf7NwF9VLBuR1YZ0PY
         7ETbnbTlYgWGsd6pnMz3wTK+kF1HBN0D99wz85Z9WOM5FeoT4sSpqWEcPnhhn8l2aP1W
         iVeg==
X-Forwarded-Encrypted: i=1; AJvYcCXXUxaWC7KteYwkEMlAtidQJKwj1/9AW9/BAfSyRKIv4kMK0k2yKGVk0q9/Om7hClWkDVIi@lists.linux.dev
X-Gm-Message-State: AOJu0YyDOeO0D/ZZtu2ozNmC1kIORmTJW71HYGHA5NGrFHHk7w9EBhEC
	/RLzRIcEphZQsQdQ3YrsvgPiSbkBNfM2bt/z3pM/lK5vAPf9HSoZHnsK
X-Gm-Gg: ASbGncsM1dA/NUxQri/qZ68bvppzfVoFoXRD5WSSjSaQ7SiNzM+G6gxUFelX1EsEsTU
	NHyNt4bSFVPEN84RbsJKqwogdZ7KRlGrPjooiPoH63yeMkW3kPTXH7EEeatohstY2jf/GPLSmpl
	hRcWqylaDzrKofDiTd/TRjrlfCflwnTRhSF3KUQZfToJ5clNzalLf5phkJCojyMFjv8M6/uMIBJ
	f9S/vuU0AiCw3sTRzkqSebWgs/gfQltdBy+4PYJTLZwJCaW3ralmXFfMfQuQq9lLb51QDqfByjV
	cwgY4N4EPMtxwm1aYpp98S+nWDtFnZSvqSJ9sBFrvqDGBWHJrlDr3B7p+P5a5KtlnkEjAGOgP86
	rL4IN06xyeISohZaMNHKWfuyszZNdnW/JFGe/lm0QI1O18jt7oPpH
X-Google-Smtp-Source: AGHT+IEd9r5s1fnXpoG01dbVdt03H4HfKlf+nXWdSHDs3RHqDgvG/mKgmy92mv9tB0zyvfPMzHQ/Ug==
X-Received: by 2002:a05:620a:1a02:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d41ebf3aa2mr831583985a.6.1750821094938;
        Tue, 24 Jun 2025 20:11:34 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99faaacsm564338085a.87.2025.06.24.20.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:34 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id C51FAF40066;
	Tue, 24 Jun 2025 23:11:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 24 Jun 2025 23:11:33 -0400
X-ME-Sender: <xms:5WhbaBdbc3ebMqMa_Bx5AabOJz4XUu28qlQMWB9kHsREzuKPDotXVw>
    <xme:5WhbaPOOHrPTEI4uZYy1U7SC_vj_Zqo0ASAlNUBxz5KY2qb8lrBFot3-LilsWJdfO
    BSyzKIfkP5BrG3FFw>
X-ME-Received: <xmr:5WhbaKiH1THxO67IXJ2w391OjPu33nlfg3snlCajrWjwYWLRi4vGUiYnvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhm
    mheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvghtvghriiesihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunh
    drfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepuggrvhgvsehsthhgohhlrggsshdrnhgvth
X-ME-Proxy: <xmx:5WhbaK8ejxPBA17BuJ-xkR7bfVQ58OITl9qFY3L2If4O3xPRaAQozQ>
    <xmx:5WhbaNsOGTH29Oh53q5wUi4ddL-n3QXCOS74-YPDbUm5oEZKrj2YEw>
    <xmx:5WhbaJGxzofUBhVZptdMnMsV8JVMLKR6b9QQ0ZCWzVBP_WnHI7MsTQ>
    <xmx:5WhbaENy02itaB1tvf_fLM3hrry2qJ3_i1dBBOibIgCopcYv8QWBJQ>
    <xmx:5WhbaGOlJBOGSohLur4hAOpqiBgNigg-Lom_-8e7tIhdrPBED9EDYhyR>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:33 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	aeh@meta.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	jhs@mojatatu.com,
	kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: [PATCH 7/8] rcuscale: Add tests for simple hazard pointers
Date: Tue, 24 Jun 2025 20:11:00 -0700
Message-Id: <20250625031101.12555-8-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625031101.12555-1-boqun.feng@gmail.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two rcu_scale_ops to include tests from simple hazard pointers
(shazptr). One is with evenly distributed readers, and the other is with
all WILDCARD readers. This could show the best and worst case scenarios
for the synchronization time of simple hazard pointers.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/rcuscale.c | 52 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 45413a73d61e..357431bf802b 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -32,6 +32,7 @@
 #include <linux/freezer.h>
 #include <linux/cpu.h>
 #include <linux/delay.h>
+#include <linux/shazptr.h>
 #include <linux/stat.h>
 #include <linux/srcu.h>
 #include <linux/slab.h>
@@ -429,6 +430,54 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+static int shazptr_scale_read_lock(void)
+{
+	long cpu = raw_smp_processor_id();
+
+	/* Use cpu + 1 as the key */
+	guard(shazptr)((void *)(cpu + 1));
+
+	return 0;
+}
+
+static int shazptr_scale_wc_read_lock(void)
+{
+	guard(shazptr)(SHAZPTR_WILDCARD);
+
+	return 0;
+}
+
+
+static void shazptr_scale_read_unlock(int idx)
+{
+	/* Do nothing, it's OK since readers are doing back-to-back lock+unlock*/
+}
+
+static void shazptr_scale_sync(void)
+{
+	long cpu = raw_smp_processor_id();
+
+	synchronize_shazptr((void *)(cpu + 1));
+}
+
+static struct rcu_scale_ops shazptr_ops = {
+	.ptype		= RCU_FLAVOR,
+	.readlock	= shazptr_scale_read_lock,
+	.readunlock	= shazptr_scale_read_unlock,
+	.sync		= shazptr_scale_sync,
+	.exp_sync	= shazptr_scale_sync,
+	.name		= "shazptr"
+};
+
+static struct rcu_scale_ops shazptr_wc_ops = {
+	.ptype		= RCU_FLAVOR,
+	.readlock	= shazptr_scale_wc_read_lock,
+	.readunlock	= shazptr_scale_read_unlock,
+	.sync		= shazptr_scale_sync,
+	.exp_sync	= shazptr_scale_sync,
+	.name		= "shazptr_wildcard"
+};
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1090,7 +1139,8 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcud_ops, &shazptr_ops, &shazptr_wc_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.39.5 (Apple Git-154)

