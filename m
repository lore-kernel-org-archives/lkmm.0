Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290A1DE4F1
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821092; cv=none; b=SsPhCm3ZvBCb5LSvd2YdwBie1q+NfTaRTZzotf/0tj1iW6llGnyYS9ozjU7TMLLUgQxFKufocdbu/c+01DPJNEvD8nbf6qBxm6qxAgMJlQFgyfOi4H+CTmYGH6aHHRYa2NEPYMWe7RTpksK5RxcZ9n2jZ5oU4msadJttuiasoj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821092; c=relaxed/simple;
	bh=TZOtCUxplLpVZwlulyF2AdR7IutlsKFrx5aA44BpK6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ILwfSoZpWY8Ykk7P3WtQmfwyDa92QOyvl5e70vq99ZsYdWvu/V4ke7KAv1qAA6fOom6F/b67oYREforyOoNf98pckgeneDvuYDugBs8tqlQsVbDYNbGtxg/s+LV/Q60UT4onA8ELC5niB/XXbv/zWquFzhSCNaVkB4M+49eVz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dojuspiz; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dojuspiz"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3862646eeso398543185a.2
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821090; x=1751425890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qhQXR4q/1FKoBNWknRJmtYgN/63wc+pb7z14qfrzMOI=;
        b=Dojuspiz+xLx9zRCG6NhNT17o2dwKUzhWAnRN6GO4IABxfxzl1ipgZyuU420JkPWlV
         vS3bu5tc8fq35YFRTnoBiZrpCapu1RMi2wqUMocwR6lcuO7joWsrHh7FIXgEG4QGKAnz
         eqisc6IU/DxT3uXPXzVHcDlPD9nTTzYRwC8epl7tIq3Uy02MujEFTTxDa8pVapf4ASGA
         n6XKy3bfuol3kArvVn8/hFrU0dg4kW0c0mLlfa+VGWgs7WrXiw+jW5jAObIK2hYLTb81
         exKLRIS8MGqBouISp+8F3DEMe2WeKkM70olQpdylp514+WoNxf28s6n+k3QJyI+EhqyO
         zOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821090; x=1751425890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhQXR4q/1FKoBNWknRJmtYgN/63wc+pb7z14qfrzMOI=;
        b=W7a7Tgp4Jrbx3U+LNhNJDRN2A/NutbMnn1yxYUmDTvVRAzGhG2PaDEem00cKCm0sdb
         b7OQ3AuQMPvbc3W/OrK9uDBc0cmOpVvB4Ll5LYFPkhJqCQv1Sw7xasH0fx8cRceJdB3d
         Q1nBXqjBauZcjLCy5fF5INitiCFv46aW9BVrszRRihoxkTkG9aej7CoMoAYoIHAdoHOa
         N0GOz2V2wL09ICBDgAIrh+q6wW8v+9qWs2KOyD/+R+d9/Z/sThP1s0KnxmUeHk8Zyqja
         z0a/eI7NfJPHA1naZEb0eNELrlPUy8x57hVQX1aPK5CIFgkVGY8Hyxk4+X+aJajdLst0
         hmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWA/MK+RZR07+09wS+OCECOvNlla3pOAidTmjA/C6k5DT0cddjgXHqQ81f3iklqJ1TfpxP@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1Xs9m12kyu9/8aJ3HnGpMl3XaF6PPmO6nP3wSffhtyTTvU/aD
	7gWc6P6zG8hHdfMae/R+nER0Md36yI2Yijw4t8rPxm7KxllAEVqy4szR+BDQAA==
X-Gm-Gg: ASbGncvlYEZEq8WPh0qeBQ5Sn9+G2rb+osLh3jiFu7ZqlDRKOKpG7qfkZIPEHibJRfx
	IP4GCJq/idVN6kn4hTU7EYj0LpzKMYCgeeLj2AcrsoU9BJpxu6itrCRBY6CUhhcoakQ7F73xRbF
	E8Hkj+/pAm7P6v5sGwInJdICN7S/dWtUpBVe5kCyd6qYcpLnFEOi3C4AtYKCOrVpT+mz4guoDzg
	zp4U3hc7MQIRU3QGxaLfs63oG6shjNQlXL1YHCXvsPizdHigWd7oacIBmFGNCN9mXHsZlDovWS/
	JAzAAIy3EIzijpj3zg+x6lfPRSemrA2bUfFOrLgWIZqnuw4leQXZxTmtdr82Sduk+LBSOWUGFjA
	pBKKJMyNvT8gTkaUx5miOpz1ub2NZbVpAXkUKS2QiritrYqOvrCKc
X-Google-Smtp-Source: AGHT+IEcTWAIOOFSCQca6pLktm0oe2Iu3mQqxK8tubUlzRS0uHFLS6o5cXHt4DbBg4x47R2Z4s8MFw==
X-Received: by 2002:a05:620a:6a14:b0:7d4:29ea:a9a7 with SMTP id af79cd13be357-7d429eaaaf9mr113733385a.49.1750821089756;
        Tue, 24 Jun 2025 20:11:29 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999a5a8sm566908585a.18.2025.06.24.20.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:29 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id C0A4CF40066;
	Tue, 24 Jun 2025 23:11:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 23:11:28 -0400
X-ME-Sender: <xms:4GhbaAshV837yyRgI5hdabuiYaKWvA_nvNFJmqlobWwl9tCokX65oQ>
    <xme:4GhbaNcP4_0MOtrRqIOpydv_z6G1DehWZSwA_E7IyC_VU1rMh5P7fISi6SulWE1gL
    C7oHH4DuKDtq8Ff1w>
X-ME-Received: <xmr:4GhbaLxAfR0ZZalGGBpcGRV4qqXUHimwSKdWEhMQm3JywMO3OufFpHlLaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeiiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:4GhbaDPksBCZcfdzklDTbpZCJJfDMAodPdwNrA9nvfTPNMrgytKeAA>
    <xmx:4GhbaA_Ant31p09B8hgfPf0aE9RYp-hJtzjb3JXqA1QcSfQkrCNuRw>
    <xmx:4GhbaLXc341HcEi4epQd4K-xNuxskJhw1xwNpW_hlXmW-SzKcGhj1A>
    <xmx:4GhbaJcoFWjVIYzOt-i0ZLYUK2hz0XxL6EEBVKPrSY1_wUXMhbkZ2g>
    <xmx:4GhbaCe_XrlQZGP6mDaJ2vhS0NlJc_kteqtLcHRvcqiw4W34gkl9CZN1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:28 -0400 (EDT)
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
Subject: [PATCH 3/8] shazptr: Add refscale test for wildcard
Date: Tue, 24 Jun 2025 20:10:56 -0700
Message-Id: <20250625031101.12555-4-boqun.feng@gmail.com>
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

Add the refscale test for shazptr, which starts another shazptr critical
section inside an existing one to measure the reader side performance
when wildcard logic is triggered.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/refscale.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index 154520e4ee4c..fdbb4a2c91fe 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -928,6 +928,44 @@ static const struct ref_scale_ops shazptr_ops = {
 	.name		= "shazptr"
 };
 
+static void ref_shazptr_wc_read_section(const int nloops)
+{
+	int i;
+
+	for (i = nloops; i >= 0; i--) {
+		preempt_disable();
+		{
+			guard(shazptr)(ref_shazptr_read_section);
+			/* Trigger wildcard logic */
+			guard(shazptr)(ref_shazptr_wc_read_section);
+		}
+		preempt_enable();
+	}
+}
+
+static void ref_shazptr_wc_delay_section(const int nloops, const int udl, const int ndl)
+{
+	int i;
+
+	for (i = nloops; i >= 0; i--) {
+		preempt_disable();
+		{
+			guard(shazptr)(ref_shazptr_delay_section);
+			/* Trigger wildcard logic */
+			guard(shazptr)(ref_shazptr_wc_delay_section);
+			un_delay(udl, ndl);
+		}
+		preempt_enable();
+	}
+}
+
+static const struct ref_scale_ops shazptr_wildcard_ops = {
+	.init		= ref_shazptr_init,
+	.readsection	= ref_shazptr_wc_read_section,
+	.delaysection	= ref_shazptr_wc_delay_section,
+	.name		= "shazptr_wildcard"
+};
+
 static void rcu_scale_one_reader(void)
 {
 	if (readdelay <= 0)
@@ -1235,7 +1273,7 @@ ref_scale_init(void)
 		&refcnt_ops, &rwlock_ops, &rwsem_ops, &lock_ops, &lock_irq_ops,
 		&acqrel_ops, &sched_clock_ops, &clock_ops, &jiffies_ops,
 		&typesafe_ref_ops, &typesafe_lock_ops, &typesafe_seqlock_ops,
-		&shazptr_ops,
+		&shazptr_ops, &shazptr_wildcard_ops,
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.39.5 (Apple Git-154)

