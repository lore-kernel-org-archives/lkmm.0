Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811542;
	b=WwSvV0iIT27dszIPr6b6pM9kxn0BlwbydbbgqLW4yHZv1WSksFxaBh9gkXFKFkXKTviN
	 +WJU7TwPzczBlpm3/I1nfCYtc8dy1Q/78HxMVDQi9I9o5K7Zzihl3bD13rl5Kky1hB97B
	 +Y0SAcQQYlKbsKhm1F+N71npJuiF0tfGKLqUeX5F+g7hwVaZRuCkqzojJRtJjKk5kcL4r
	 aaZWPSulBSwCl+8U4TLrdqr4NT2mPz3Rv/P+50zRJK5wH6z8+uW4ktmdpMji6WJPDGs+5
	 h49w+iwx15vyRAPFdz+UYwmGtYesCnunX7LKeCPHpdxVT+iMJ+gagbplWIpaSMoDPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
	b=arrnvGiXVovOB3oIHApsqYHvWGfwinjw8UIF0DRjOFlAJVz2NpN6oikgkjIggHJ4Y8JC
	 smhPgBF+Q7rLvWxWPloxMVEMSlO+PAAPRa0LObe4yBEZnT4DMQTZwJUuAwIFMa0Jd4HDx
	 B2YVLWerLavvzbt7z9uQk+yGHSTOQ/hxiFg7cBglHuRf11napp1n5G4tXpCmZodtiakb/
	 ZmK0P4Mw7VUBO2bFPBnu1+0mYx0mVW1FqN75rzN8MzN+9wxgLxz+zBiUp+pPX6fvUTC6W
	 Ryg0VKlCuWbx6g3jZefLoIqVFloAd3E83/ezXNPnXFXJgah2v0t+y5i9ZXN4CDjdLMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZb2H6cy;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B3606D83E
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360B3606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZb2H6cy
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso2160965eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811541; x=1794416341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
        b=DZb2H6cycIlSVfX/VYadZOMHH2XYfyIipr5/r1mnh3mDn0tMjd3/QHoEh1Cq/q6WhB
         9gndqZFWpbPUPAj5Jrmr9Mnvfe4ovP3//nEMoBqag1YEQxJajI/xFbJa5GyYGfra3ddD
         can7ATIUZqjaQqNVxJXA8acwoJTeT5jKbCYxUWmvNlj3fi7IPFCjmHeTUqGCLqAd/UvW
         ++PVqrxKCgjRntYFnFvif9F9qeAd+DbciSvAGCXLbNyOFmqqTnbb19vstgtMtmX6qHul
         tQlMwBt9Mem79oKJ3HwnDQRaCP5hytX9VhGzoeyKBy2e8wrJyelSzFMEGqCZTa95f03e
         6WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811541; x=1794416341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
        b=cSKtgyqezYaCkMNOwLZhn8FhTSyFAkFV6+7Ljx3EblhPwWkGWgaW6rgzFhH6+vt6gX
         N0I/N8T1Njy3G60MsonXA27Tmr5e1gWTHUmsS5tWgWiTubWb/CF7sliZHaRm0kmT7QCH
         EiK/7z04SzYyaJEQMysQBdVLVuCd7kiyYl1ldHYeZdOa75ZJUp9o1Q7k/EBD/dO2nIKh
         qQKHTVkR8mnBhNLKBWajA6h9mmX7rvOQRrpq+uU+FyUsj9lisco4BFUJOvNtWd0BXgn2
         Hw0Pt9HN5ZvwIZHGha1nosGZmex1fH0GfKl9/bNuQ3M0xcu+Eny6MqkSOcb1xPBTUUyH
         MRnw==
X-Forwarded-Encrypted: i=1; AKwUvBwdHSTjeVoidqXkaby0KYoSfYfnD7nmrTeuUFDQkSu3vQscL3w7U9eqW+XdHmAQyzyIxWX7@lists.linux.dev
X-Gm-Message-State: APuU4Z9mujezRHmrXlGJUuwc8kO+F7gnINQSNrXc8i9YAoizb7b5tGCb
	bwpwWTFGniJbciTPzjzTF592BRY0++gsH9903r7pFIwH+IfInIrOKMAe
X-Gm-Gg: AYBFou3purDzK2ytAiudmpP3AveewErSIJGvyNGMw2hEuQPx/xoKPf1VDnCgB1kldAf
	edtlnnPTSyjl/3dOdS8xFDFIndOLAHfubzUjUNQgDgMgjEzlejvZFC6KLfOgM0rmqVPEgoItEbI
	HM6/zXNWhiUTBIALctTw1CmTOR98CziF6mq876+7oAvco9S24DXpubfHGIOoysBU9oCVx8oVxoa
	RtkJUbpAVVZ0irduy4RjqZdYd8DbfKS09CJasmxLKeIAhCIoG1tAJM2WujQEVt2XbOirEBlKfoP
	mknVBs23kBywWKKhBLU5HgsW9fGxRGS1fvjI5Z7K6iAX9uVvdbXANXljrSXeNlqRwnObARyvTQk
	0thWX3PLiPlEutVP9ErvyrWJdTYs9ollIaKsq6uZ+9fgsBKvdyoiGW+SikRGQ9BAA0gTQoUtzKb
	p6Plw5NBnz0FRvDoKWsyhkwIh65731KF7bPyAcsfcnIHJnPaNPmdLFST8fPeAOLHaNt+nGSbk9T
	c4bE2Xg3balXk8/AZb4zyYIRb8yy41Si4jZ/idXFo9vSWqWX+xhR7NY+vA3+zx4hSj6GGBkp46Z
	2LBOF0GS/Gn518hFkXQfSvvpvqVK4IbDlYTHnG8=
X-Received: by 2002:a05:693c:8110:b0:36a:1088:fb2f with SMTP id 5a478bee46e88-36a4236d027mr26652229eec.14.1793811540869;
        Wed, 04 Nov 2026 08:59:00 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:00 -0800 (PST)
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
Subject: [PATCH 24/28] hazptr: Add runtime sysfs controls for stall detector
Date: Thu,  5 Nov 2026 00:54:42 +0800
Message-ID: <20261104165504.2430480-25-kunwu.chan@gmail.com>
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

Add writable sysfs attributes that let the administrator adjust
stall-detector behaviour at runtime.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 7d4273a44183..66954251c332 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -423,6 +423,10 @@ static struct hazptr_scan_state hazptr_scan;
 
 /* Sysfs counters, cf. RCU's rcu_stall_count. */
 static atomic_t hazptr_stall_count = ATOMIC_INIT(0);
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static unsigned long hazptr_stall_timeout_ms = CONFIG_HAZPTR_STALL_TIMEOUT;
+static int hazptr_stall_suppress;
+#endif
 static atomic_t hazptr_drain_count = ATOMIC_INIT(0);
 
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
@@ -1115,8 +1119,12 @@ static void hazptr_waiter_stall_report(struct hazptr_waiter *w)
 static void hazptr_waiter_stall_check(struct hazptr_waiter *w)
 {
 	unsigned long now = jiffies;
-	unsigned long timeout = msecs_to_jiffies(CONFIG_HAZPTR_STALL_TIMEOUT);
+	unsigned long timeout_ms = READ_ONCE(hazptr_stall_timeout_ms);
+	unsigned long timeout;
 	unsigned long deadline;
+	if (READ_ONCE(hazptr_stall_suppress) || !timeout_ms)
+		return;
+	timeout = msecs_to_jiffies(timeout_ms);
 	w->cycles++;
 	deadline = w->reports ? w->last_report + 2 * timeout
 			      : w->enqueue_jiffies + timeout;
@@ -1275,6 +1283,46 @@ void __init hazptr_init(void)
 }
 #ifdef CONFIG_SYSFS
 
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static ssize_t hazptr_stall_timeout_show(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  char *page)
+{
+	return sysfs_emit(page, "%lu\n", READ_ONCE(hazptr_stall_timeout_ms));
+}
+static ssize_t hazptr_stall_timeout_store(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	unsigned long val;
+	int ret;
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val > 3600000)
+		return -EINVAL;
+	WRITE_ONCE(hazptr_stall_timeout_ms, val);
+	return count;
+}
+static ssize_t hazptr_stall_suppress_show(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *page)
+{
+	return sysfs_emit(page, "%d\n", READ_ONCE(hazptr_stall_suppress));
+}
+static ssize_t hazptr_stall_suppress_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	int val, ret;
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+	WRITE_ONCE(hazptr_stall_suppress, !!val);
+	return count;
+}
+#endif /* CONFIG_HAZPTR_STALL_DETECTOR */
+
 static ssize_t hazptr_stall_count_show(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					char *page)
@@ -1291,12 +1339,24 @@ static ssize_t hazptr_drain_count_show(struct kobject *kobj,
 static struct kobj_attribute hazptr_drain_count_attr =
 	__ATTR_RO(hazptr_drain_count);
 
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static struct kobj_attribute hazptr_stall_timeout_attr =
+	__ATTR(hazptr_stall_timeout_ms, 0644,
+	       hazptr_stall_timeout_show, hazptr_stall_timeout_store);
+static struct kobj_attribute hazptr_stall_suppress_attr =
+	__ATTR(hazptr_stall_suppress, 0644,
+	       hazptr_stall_suppress_show, hazptr_stall_suppress_store);
+#endif
 static struct kobj_attribute hazptr_stall_count_attr =
 	__ATTR_RO(hazptr_stall_count);
 
 static struct attribute *hazptr_sysfs_attrs[] = {
 	&hazptr_stall_count_attr.attr,
 	&hazptr_drain_count_attr.attr,
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+	&hazptr_stall_timeout_attr.attr,
+	&hazptr_stall_suppress_attr.attr,
+#endif
 	NULL,
 };
 
-- 
2.43.0

