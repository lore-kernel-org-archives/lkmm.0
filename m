Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811377;
	b=XI1ddG+/iZm0a/qVTagfJi3Lt5N53R8cn+HX8qG8AoaI4zwED2OjUMl2C5YEo3cj04aa
	 HXOcuvp5+1jDglGDt6362JvkWJB9fWc5NmQbXKlEiTsQF28uaWa/2TxXv/I9UZB1/s16q
	 AHdZIX8Va80G6O5JocxlHDjzwHqAdtO/hvywZ7P6jge0jfMTs1K8LZiWpTVE1wwJRbHOs
	 uaxyRiC+ySLnBtWrpPsANOVsU9X6U6s5OJytQ4iAG8u7YDuS+hqQvQxGSms5YF86MW70k
	 WVg91+OyM4Ft6cHIKAeCd8dxPllVdViKtYyXY9Hiqq7OdhNRNbGdP17QGpfWp6ZjZyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
	b=InnLpt7yNlbuOFehjjK25TrX+0W1hRfDXyNjusGM2M4oH43xAMh/vzKb6X+MCEn3EV9g
	 Ldf+p+xAy8degyPvs7/Cune6/vvbnRVTlAq4T0ZO+VcnxzDoPstMXL7BAobLcrUmipp/n
	 JT5REEsbGtTXLd1/Rd3aIPRoiQHtL5RhnAxVQndDkDsMqgghupnNj/rU7iXhPztSG5CES
	 iAnxlIRwsOvwP5uMa1T7hAzkJAB9J3zEadtn14iNvF091gemCyf297Vp/mZhlYuxsTMc8
	 C+TCq8lFJofOwRbtBWAxZs6WwXQyU9+jwXJyWw8ho+uyRosMh2dV09Hi1jjAGvvDXXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6A0oMrb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10BC606D80C
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10BC606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6A0oMrb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36c9a93a1abso854336eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811376; x=1794416176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
        b=q6A0oMrbsnBjRf2J0ZWvzV1B4tpsJWqjMAvNx8O+YyY/5WP8FMbJyOmrXNs0k/qiod
         4SteVxN0NjWW2+LpsGG7D6BnB2Hu3fna3M/K/yondfrftLLv+17sVcOE73BJEP95XVFr
         noqgnVbOy9iaV+BeeF040LD00Nk2NyyW9C44zmQ6ZEfbOp7TBS1OyoTiiLiK6j1zReOH
         9rAHPNCOCG1eEtH0M3b6zphaQccqivBpYHu9KwRWnMIousxcaZFewd92wRhZLfQ2U+t3
         P0XuEj14OspI32DFDVvdUQ/seaykyXwHZU4hzlN1dAZ/Gr+vWV2PFS+dILcA1eXrgWUC
         iSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811376; x=1794416176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKRyKe5HAwN5rnftg1fZEx1NjIirnpES4D9l2YLy3Hc=;
        b=Hemk7EU4AbyExgGxIBmdtu6riSH3EfGMrn2WDzNps/+1Hm7BEFtgf5x3a4DqkuXNLg
         t73ueVv+GynSxo2SDFs0GA8RKAIMnrnKHJrfOqGhZUqQSF9lTY5xh8sQEEN4GpfbVClJ
         4VjkVRk4ic7bp4VykUPt4feEz3zlmYfAFCSgel7NBQ02vgvk86s1jEY/mQxOfz4i8Q+x
         It16pyAjyL0BOPls48GEfRE3M7iBMn7tE18vtN3hj2aWEWnP77MLsoDMbi4lCs9O/fKO
         VbpD09JSeWiXbP3oOC9Sr7cAowTR8uwOcooCv33Bwu0xwivkBJB0d6kh1PPY74mD2r7E
         2R4Q==
X-Forwarded-Encrypted: i=1; AKwUvByYp5cwZ53/n78NONWKriinVAyi11/AqxIqPhk1koQxeBWtlkII/xjzaTdQiO4J26XaLv9q@lists.linux.dev
X-Gm-Message-State: APuU4Z9T10jaHcS9GMCLMhJxoAupYv3WiC21WIH12GorZIw94VoGEM7p
	E6RXQ8KAiwiFRRBCN7kk5KaH4jBcV1CGNul63ozDHN+dQKawB1RWgghS
X-Gm-Gg: AYBFou1Dbia/i+BQqICCIOL2OjrtV4hdeG8yjHyfnGA6tLm2egBnYH1eEgp7wuOPlUv
	lBZfnZyavC3I9/j0uqQMgyQKqs7LdzYQOw+cGSXMUDhxtb9hB+fUIZ3/re+nQNoRsXPVg0q2YjY
	58lj+4W4qjWp9jMPbZjRdaI8K7BmfBFFFbFMfyulgw/wy6tCgwer1sqeQ52xvlVEtSJpEB23JCu
	7HSy7TvfYcrD22+0RUApbkRwKE7veusmM3fAINL4v6mGhtNbNfC2rTobfLQ7hMmtJ505YqwSoqN
	qv5eGU0hv7DaGpXLQNRSlrFcz82f4YA4q+7q1pGtpsb96CJ+yL2P8LZGXNOs1/AnLx0Z3xtwMeQ
	aSWyUxOKTtHzmEcYtJy7k+Bvoy6oHRyHdIgeQcmAxZnwy03agbkwansxgVQtlJIfKHakrsoKRqA
	g2RlmoWXKvuMbUB9l8zQV61Xan6wXpGUkk3zlyCc6y4S/0aB4ePdLA2upSTQiHGibQF6NLR4PD3
	hMIgynhX8Ob5DxyymRYa8EUepMKQqBLopCIQkjR6nJTJfzJnJDxxroQtvYu9Pb52h4iGUVhgbxt
	BQxopBcm3pU9WykdeiBmZc6dq9C7g1P+3zAx5wk=
X-Received: by 2002:a05:7301:781:b0:36c:a351:fb31 with SMTP id 5a478bee46e88-36de5f6fa87mr70409eec.7.1793811375449;
        Wed, 04 Nov 2026 08:56:15 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:14 -0800 (PST)
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
Subject: [PATCH 06/28] Documentation/litmus-tests: Add hazptr acquire-before-scan test
Date: Thu,  5 Nov 2026 00:54:24 +0800
Message-ID: <20261104165504.2430480-7-kunwu.chan@gmail.com>
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

Add a two-process litmus test for the hazard-pointer publication
protocol: the reclaimer unpublishes the pointer, executes smp_mb(),
then scans; the reader publishes the hazard pointer, executes
smp_mb(), then loads the pointer.  The smp_mb() pair forbids the
reclaimer from missing the publication while the reader still
observes the pre-unpublish pointer.

This is the publication protocol used by the lockdep
is_dynamic_key()/lockdep_unregister_key() conversion.

Verified with herd7: Never 0 3.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 Documentation/litmus-tests/README             | 13 ++++++
 .../hazptr/hazptr-acquire-before-scan.litmus  | 45 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 4d4ec9c6f2cc..c2bf20fa4092 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -97,3 +97,16 @@ SRCU-fastpath-scan-before-anchor.litmus
     period, violating the SRCU grace-period guarantee.  See
     SRCU-fastpath-anchor-before-scan.litmus for the opposite
     ordering.
+
+
+hazptr (/hazptr directory)
+--------------------------
+
+hazptr-acquire-before-scan.litmus
+    Test the resolved-publication ordering between hazard-pointer
+    publication and the scan.
+
+hazptr-wildcard-flip-escape.litmus
+    Test the in-flight wildcard window of the single-pass wildcard-flip
+    scan: a straggling acquire that published the old wildcard after
+    the final walk cannot still load the unpublished object.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
new file mode 100644
index 000000000000..6dc13830c07c
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus
@@ -0,0 +1,45 @@
+C hazptr-acquire-before-scan
+
+(*
+ * Result: Never
+ *
+ * The reclaimer unpublishes the pointer, executes smp_mb(), then
+ * scans the hazard-pointer slot.  The reader publishes the
+ * protected address, executes smp_mb(), then loads the pointer.
+ *
+ * The smp_mb() pair forbids the reclaimer from missing the
+ * publication while the reader still observes the pre-unpublish
+ * pointer.
+ *
+ * This is the publication protocol used by the lockdep
+ * is_dynamic_key()/lockdep_unregister_key() conversion.
+ *
+ * This models the resolved-publication case.  The in-flight
+ * wildcard window of the wildcard-flip scan is covered by
+ * hazptr-wildcard-flip-escape.litmus.
+ *)
+
+{
+int ptr = 1;
+int hp = 0;
+}
+
+P0(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*ptr, 0);	/* Unpublish. */
+	smp_mb();
+	r0 = READ_ONCE(*hp);	/* Scan. */
+}
+
+P1(int *ptr, int *hp)
+{
+	int r0;
+
+	WRITE_ONCE(*hp, 1);	/* Publish. */
+	smp_mb();
+	r0 = READ_ONCE(*ptr);	/* Load pointer. */
+}
+
+exists (0:r0=0 /\ 1:r0=1)
-- 
2.43.0

