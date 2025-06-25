Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD591DDA0E
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821091; cv=none; b=Jn99fvxkW+oNTcsgWWsmkNbYmHFIOYEMKYDeNUxfZfr/cWmw7rzUByzIRYU1b3TAu3QhqOnVYb/QRMs+23f/dWabhIHJLPvUqp3yugq7XO7AAtgtMGlaADMPZpq4wiW528c0DNhf8+d8nNLwg2K1Rwfk6fxcgraxciDomJmUuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821091; c=relaxed/simple;
	bh=duTW7lZrJNtK7UEEDJSzyS45AgiLLDWdc/06eYlkxEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/AKuW9Ow2r/SZJ99vGkkrS8l5w4V8t+rKYrLYd0a1T8iXSHghifOH0IlSKbbFcRwx+6hQXz35jkmOAbqkQf3Rusw/gCp6dQgmAn/rJdXkkNSTk436I+cWWqCohMhoUgT+u8Vt7INAnjrKbB95NcWyJeMy0HqL7UeC/WTSAtUY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COJyVFLD; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COJyVFLD"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d09f11657cso93788785a.0
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821088; x=1751425888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DK7y8fCnybk/HJabsb4vjDUHN1LvZsSF478PQROiY+k=;
        b=COJyVFLDkm8VMKyV18L57+ImRRGzACUJjs+RJ10wpKrcfe3ZMP0+JWOwrTKByxoTjv
         CuHtSnQ//b06iAdVATutHyztvJIwSEiUOrRXfY4W3Z7GpULKZ2L5Q2QcC7uYX5JTFcDQ
         oG1Cbt4xa+mF+uUYru9xs47spwH0eMs3B7dyxchp6wZZ7n3iMCpCH0Pd9Tk7BaOPRI1B
         53X/4pJUJ6X8+1O2ICgtGOUYz1a3CHB0iVjR4gkZFP+bAYL9c4i2DGXgRu6mpE2EMNec
         Epdojczjj0sHeaeFeebPr+f0AzowjXZTwk+vzhQFu8IQcPvAG0QB06MX8nT5C9JDLC+t
         nDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821088; x=1751425888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DK7y8fCnybk/HJabsb4vjDUHN1LvZsSF478PQROiY+k=;
        b=AQqVwyn9MLcGwrbV/XEfbK/FmzS/qLMgU4m/oxa6TK38noRC8OG7lqYqaPVUeXy/yg
         A3UowRM6Z2OPSBOzkCvj/bOhk9syjgRqP6Cjbh5ENoNRg6UU5ZUWPrVh+3dsQgLNKCZZ
         vXpdGbs15WwJxf+ayBaJVdxc6Fnzl7ME1gFfnFO49TCzo1e8/K//+Wr1bmUAH8tBsC6w
         BXjzzaViYli9Ls4g0b1NYhFMv/YzWCDxH+P56da2bTXN0PBAqMNL60ulV3yQUzWp9roC
         FAVqt46VQL74ytol8oOgM6cOugqpSFh7RUrHmX1W8x1dYrRV3rNfdyjwKZbvk7uweN3o
         7pFw==
X-Forwarded-Encrypted: i=1; AJvYcCUSVXkhxnfUo0r9P6E+1dls1nQm5HX3AUTniF1Ufco7lNr1Z5xprpIOcO8kpqHUeIBYMrC1@lists.linux.dev
X-Gm-Message-State: AOJu0YwGiVZVnmsptwr0rAXi5Sdh9jzqlSxv1UJPI5Uy0CBaY8D2IksX
	KQRTAQg5qdzw5K84wIICDdAUP00Wf1p/wdUUcxIdN4oPreXrH+Woc4a+
X-Gm-Gg: ASbGnctAQ4Q6VG8y39T/3bMHG2VKeNPQgvKtwaimnSftEXiHWc2wd0RmKJOW21e36SO
	e/Up32OCJc1Sndw+83kIVK/PryurcCt2C0ogS9V5cdarJHoK7KSLNXhQFxWzPuClqIEQiOnIA5W
	+wNBI769I6QceiAdCy6zZiA6fhZNVG/Y+8E7JhFHhuu+Hm5P0Cyre2NL8vwV50n2pM5wIBeGPqe
	8YiUFKvFB8szNxxXmZWSP+M2kyd6qZXpKWL4z/H3KQl90SMvErM2e80Euk4H8gVMToIdrNepzEx
	Gx0WTisNxX+D8lc+WoKkcAXSDabIIxXP3C6XmuZyHzujqxmhPkU9/RW8dfV5xm9/m4Mc0qYDWD/
	k++JD+2YQM6AZuzbQLqh759h18ypcoV6fKKLRhBFMndND6NFMijqx
X-Google-Smtp-Source: AGHT+IExxiStgtde1OhSWnRVxkmvUnW7k/+Lfu1ZBv7pox0OQJqTmpZsld1V4TSwetgR20fZq5Y+Bw==
X-Received: by 2002:a05:620a:1987:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d42971d8acmr177374985a.57.1750821088463;
        Tue, 24 Jun 2025 20:11:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a6724sm562079485a.41.2025.06.24.20.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:28 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7CAC4F40066;
	Tue, 24 Jun 2025 23:11:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 24 Jun 2025 23:11:27 -0400
X-ME-Sender: <xms:32hbaFbwgE2soKavsjsb4U3NtK78h5X_8xwKvF9yXgOxqaRWnlmKhw>
    <xme:32hbaMa0EUO1JZ5XwYCPX2u3KLAQbkLoiJTlJfRTcxKkWFzzmhJ67pfNMbSzLlM14
    Ylh_j3NwILbHpZWAA>
X-ME-Received: <xmr:32hbaH803MgUp0Xms9t70plJieGcRL1ITS5M1F91FNt8oeqfeTKQhAHCjg>
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
X-ME-Proxy: <xmx:32hbaDrg4yhrx3lNkpe2EhnE9fAnVZ3wi58kOe6KQdRzmX7zoOlleg>
    <xmx:32hbaApZNmLUrkJNTI-1dzfdnq2RRQCgJUbMr6S-DBwUg5gQoVXF5g>
    <xmx:32hbaJSBQefksqNTtwWPnLLd55diQld-ltyCxfIunKeFBSS6QqSa7A>
    <xmx:32hbaIq1XJBujOy060Z6qzNZLH0NYFcg-SjLJvvZ5DyhZXu3vctFfQ>
    <xmx:32hbaJ4UfNKnl1hstcIme_5F7Zj_ctVyFRJ2L54fHUld3kf4avR2VY1C>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:26 -0400 (EDT)
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
Subject: [PATCH 2/8] shazptr: Add refscale test
Date: Tue, 24 Jun 2025 20:10:55 -0700
Message-Id: <20250625031101.12555-3-boqun.feng@gmail.com>
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

Add the refscale test for shazptr to measure the reader side
performance.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/refscale.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/kernel/rcu/refscale.c b/kernel/rcu/refscale.c
index f11a7c2af778..154520e4ee4c 100644
--- a/kernel/rcu/refscale.c
+++ b/kernel/rcu/refscale.c
@@ -29,6 +29,7 @@
 #include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/seq_buf.h>
+#include <linux/shazptr.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 #include <linux/stat.h>
@@ -890,6 +891,43 @@ static const struct ref_scale_ops typesafe_seqlock_ops = {
 	.name		= "typesafe_seqlock"
 };
 
+static void ref_shazptr_read_section(const int nloops)
+{
+	int i;
+
+	for (i = nloops; i >= 0; i--) {
+		preempt_disable();
+		{ guard(shazptr)(ref_shazptr_read_section); }
+		preempt_enable();
+	}
+}
+
+static void ref_shazptr_delay_section(const int nloops, const int udl, const int ndl)
+{
+	int i;
+
+	for (i = nloops; i >= 0; i--) {
+		preempt_disable();
+		{
+			guard(shazptr)(ref_shazptr_delay_section);
+			un_delay(udl, ndl);
+		}
+		preempt_enable();
+	}
+}
+
+static bool ref_shazptr_init(void)
+{
+	return true;
+}
+
+static const struct ref_scale_ops shazptr_ops = {
+	.init		= ref_shazptr_init,
+	.readsection	= ref_shazptr_read_section,
+	.delaysection	= ref_shazptr_delay_section,
+	.name		= "shazptr"
+};
+
 static void rcu_scale_one_reader(void)
 {
 	if (readdelay <= 0)
@@ -1197,6 +1235,7 @@ ref_scale_init(void)
 		&refcnt_ops, &rwlock_ops, &rwsem_ops, &lock_ops, &lock_irq_ops,
 		&acqrel_ops, &sched_clock_ops, &clock_ops, &jiffies_ops,
 		&typesafe_ref_ops, &typesafe_lock_ops, &typesafe_seqlock_ops,
+		&shazptr_ops,
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.39.5 (Apple Git-154)

