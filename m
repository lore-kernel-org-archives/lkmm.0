Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811579;
	b=g6mxnhHPNP0JwBD9nE4DFBmmLNgcKHsscJJvd7mkyY1T+TtpiH89bRRK6+ptrmAyB4oG
	 kzvxAF4kqPhLq7UnmAhGPnJuQctNmeUCGHwKfAynGrv5k8UtURWw6OdjUKGpQPpDm17Tx
	 VwNDWQWdfWfSNK/mBzry/CNLEHUbL3QVAobsK0JBoCNvMGXrm3hdeUCZ+d6Xq1Oyk1Iqc
	 aP96ytG+TZ0gTed2UpOmCdWdu94nlSIUdrr4Gmf34lEcQfXd8M/lzlGkTJOB4qc5CnJd0
	 6HVuK0dunzjnCOvkWOUMTD1fQ/g4SCN8RdGRBy8cGmc7erHJYb5XzV+/axFB626mPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
	b=uCj+Mu6QvnBohzVJQgOLcTcgxIhtvdjj8J0oX53kP4YB4+6KcmnEUw133WiM4bJYsM9n
	 qWJm7CTndFJOLgWJAm3dEOefpBn+x5VzCDvhiJ5ny9MP5PdJGDvGJOJKb41ls3HeG61+O
	 3eSOS9ogWjtByRkxDDOmv6G6RVUt2BAwtZROujYHkoNlGgsJpTbf0Z7wo4CbEtBB6K/Ua
	 nD9YcarLKsFFNKVWNTJOxLqyiTgnUB7BengpkQiWInnJsDJIkD/6Qqu5gBAJAGew6bSzz
	 BtrLiX/p8kn4IwO8yNNyia0yt+Wci0at25vthulp+WQYK3cc4FV+HynRE8CZrM2c8bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNVeLz0d;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1F606D82C
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB1F606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNVeLz0d
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535a54bed9so1233370eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811578; x=1794416378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=PNVeLz0dxVw3zzItXhjXC9W/KTqpQccZbP7AkY+L2YnCdLVv3SiEUE4JGl5R6LwdFe
         jEbnTLvhHvt+/vtfg2LOB03yCjrXCal8aKkC8xmS6ez/BNiJuIpZQ9QUQMT2xVoYKEPf
         RCSxwC5XnStM/WSW16s5EbAFiGyts5CRaWXrDDKIhVeWLcNrb/mzYLEl8lNFSRN+ziz/
         Rswje/SPnsiLCUkvOTWCPNL/9U5vDB9yO5KG8fCGbgw8W5xKt8L0qJNok+dFvcMQqzG+
         t2N66mLUMOs+NGSfWwBuLunhnmSHS4jviABlDggv1pcCSLOwaQjoQSvTehc+ztgaOykD
         pnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811578; x=1794416378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cteKSNOPJ5AcN+4sRo9jQDZ7xAOL9wTKiT1G4A5c+WA=;
        b=bEuwgJBC2m+j/2qt+asjNH001dmQUWf8a8CTceTHwbFQsbh2RBZ0+piJIfTsSphtxU
         GYe7ard11swarsAfH6+Zi/P8sZj6UxgS4brWxGXFxDLnm/0tXqBQ6id7BTcCNYmbbGyn
         jdX3pX2JI42XDw6JgB0Vc1rWp4jKzT2jgA1xuEH44Us2oaNOOxc2EARpQ5pLI/K01tWL
         rCuiKGEntgpYuq4FjxWEQ6HySBrdGFA70Idl4SxDuaF8Y5kYvFInOLJpFYKHkyVlJNVD
         bPJYxHPBH2e45i/s6T1UmKBsL79oV+LH85H7eQz8kX6oX3EB/ObkhCRsFAeLLRuycuIu
         s57Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3rY1WKSaQK6IQWXoxfDSHGwhmSmYQyFtA7SqSNULrljfmuWIOuVx3p2Z6P1sMLLd67394@lists.linux.dev
X-Gm-Message-State: APuU4Z/PKmG/6ZYihjkB2imPYqtif/hu+9inITNiRUOMsyJYLvLxC9pB
	WZnf+SkzzjPHbRvp+EoabpK1u5gtiAVccUyViGqrY56RRkSRY4EZCJKo
X-Gm-Gg: AYBFou2D8Swt9F6iuTIyHkj4bv6S67tVRO6JgvYWRwInmw763C1dDmj1d1/smNV8x8u
	C0hayAgTsWMpY6RNVvyK4rv//h/xIYYqbuco+tI63AEX6XaB+Bbb9gbFHZfN1kV0LoaktxHU2OR
	Rubyr5iTe4XOMjIM9qmS4DuWHNIpLoeY0aZJc2hrMLfq5Cy0zH4ZK96Naj08eZ8zsTCfwG79fWW
	MKAsCaJ56yYTJ+crthSiw2jbf+aZDs2pWXNfZvobKmFSCEeKTSLQmDOF0UNbr9xCqegnuBTU1Qz
	IC6pxeGmC5dkRScU8qhs2G22vhMZIVmRipWmEo4GEvBb7i2y9mpXm7zOX+oAGzwIP5tJn6GtVUD
	a/5AMqVAx+lHnGisKXmeiA0VIiBRwEB9ygNaDAmPJBjm4pWkdWTBmYFuFcfGGGdbmW8PsO4vFJA
	rTCEtp4jEeB7AR5eOSJhKu9Ag7m/84YE4bydCpQbdHUqIXYnzYYmJhZ8y2jXV/nfbu3gQMLxFfH
	NeF5LC3hFKTl/5FmYj7+pjQG+ZF6JzeIaYNYOeRFRGaF9krlZBhT70pTMAM3+NGufzfACH7ZXC1
	i00kBLIQAV68zVvU84cLskriVG013hKwK6zCa/jXZRJ+jgED7o9zuLl2g0C8
X-Received: by 2002:a05:7301:fae:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-36a424596c7mr24456857eec.23.1793811577443;
        Wed, 04 Nov 2026 08:59:37 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:36 -0800 (PST)
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
Subject: [PATCH 28/28] Documentation/litmus-tests: Add hazptr bloom wildcard-hole test
Date: Thu,  5 Nov 2026 00:54:46 +0800
Message-ID: <20261104165504.2430480-29-kunwu.chan@gmail.com>
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

Test the wildcard-deferral of the shared-scan Bloom walk: a
slow-path acquire that published a wildcard to an overflow-list
slot cannot be missed by the kthread's post-wildcard slot read.
Verified with herd7: Never 0 6.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  7 +++
 .../hazptr/hazptr-bloom-wildcard-hole.litmus  | 49 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 79b0634ddb13..561319404126 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -111,6 +111,7 @@ hazptr-wildcard-flip-escape.litmus
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
 
+
 hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
@@ -127,3 +128,9 @@ hazptr-drain-safety.litmus
 hazptr-drain-generation-visibility.litmus
     Test the drain generation ordering: a release hook that observes
     the new drain address also observes the new generation.
+
+hazptr-bloom-wildcard-hole.litmus
+    Test the wildcard-deferral of the shared-scan Bloom walk: a
+    slow-path acquire that published a wildcard to an overflow-list
+    slot cannot be missed by the kthread's post-wildcard slot read
+    (completion is deferred until the wildcard resolves).
diff --git a/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
new file mode 100644
index 000000000000..28a2bc1206c7
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-bloom-wildcard-hole.litmus
@@ -0,0 +1,49 @@
+C hazptr-bloom-wildcard-hole
+
+(*
+ * Result: Never
+ *
+ * Wildcard handling in the shared-scan Bloom walk: a slow-path
+ * acquire publishes HAZPTR_WILDCARD (Store B) to an overflow-list
+ * slot before loading the target pointer (Load A) and publishing the
+ * real address (Store C).  The scan kthread observes the wildcard
+ * (r2=2, its walk loop keeps waiting) and defers completion
+ * decisions; the model captures the final post-wildcard slot read
+ * (r0) that gates completion.
+ *
+ * P0 models the kthread's post-wildcard read: it must not complete
+ * the waiter based on a slot value observed before the reader's
+ * Load A.  P1 is the slow-path reader.
+ *
+ * Question: can the kthread's post-wildcard slot read (r0) miss the
+ * reader's Store C while the reader's Load A still saw the old
+ * pointer (1:r1=1)?  The smp_mb() between Store B and Load A, paired
+ * with the kthread waiting out the wildcard before its final
+ * load-acquire, forbids it: Never.
+ *)
+
+{
+	slot = 2;
+	head = 1;
+}
+
+P0(int *slot, int *head)			/* scan kthread */
+{
+	int r0;
+	int r2;
+
+	r2 = smp_load_acquire(slot);		/* walk sees wildcard... */
+	r0 = smp_load_acquire(slot);		/* ...waits, reads again */
+}
+
+P1(int *slot, int *head)			/* slow-path reader */
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 2);			/* Store B: wildcard */
+	smp_mb();
+	r1 = READ_ONCE(*head);			/* Load A */
+	WRITE_ONCE(*slot, 1);			/* Store C: real address */
+}
+
+exists (0:r0=0 /\ 0:r2=2 /\ 1:r1=1)
-- 
2.43.0

