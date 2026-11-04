Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811478;
	b=iUrIf8FMsNePRaXwrWUvlHkI0OViKF3xQZUjegojC7ZT6w4hJQ2GThcPirTbaJHBRhzU
	 bSNDxIx4L+Vj40BeiNaRfVoCVFce8NzK1qtvpEbf2g7PhXOH1Qod9j2LlBF3xSBWt+i+P
	 FuyCSKb5il9A/Zed4SzkcFOF7ORCx2q/2RsWbQrRK0y5c5mxvQ0YYlYm3ldJHx2YLATPH
	 FAepyQQCBC2qS7K2UyLqkT7Kr24Us4oUc/Yo/Mx6GGAXWnYsdfAbGk14bhKgIumt9rXRa
	 P1NeCmoxWfD3+curI86FqXmXwO4ugE9hhzmnZv251mlYBjpYur6yyi0IlKkB8WzA3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
	b=Z8qGb10x5+atAgzoy7yjOtkcSjLZfa9OoDsgaG/E+tn0f1ZVL+7gMGiQEbG79QDgRZUP
	 7wq2Z23BZlbbJZp5L11sWE7xAjA4fyBVigNQY0+LWJcyUqfc4ZAypVAbghTNhH/YEOPzc
	 vKivCADbuM01Or+XUh4mz624zPFIGECQoC5qJSql8tlsvv5ROuCL1syCMmtjljMe37jix
	 62h0l8XSxfqgO5Yroo/HKiVMFWRNm14kU40wGWy/dCTj5SbYtjFRlV8YGbc2WB3taV5JX
	 89gVtQM0wTrMhcZBSnODoDLDjGUuaDw/lH0hBWqb0GBlqSqK1R1SttFgL6azYDl0gVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vrj/0ZoL";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07039606D808
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07039606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrj/0ZoL
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so1343761eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811477; x=1794416277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=vrj/0ZoLtfNvOGZ0aYfVtaXEaXP3aOtVkfz0UEKGl3Gfin6ZUc09pCSWTIPWCUetig
         iBkkL4VUY4TCAkEzZh5bCtjWqhUS/8AY2BCnPmdSWtdHxgT6BpvcJ+68EcPSfP5+u5WC
         gHFBlSrjG+keTYTcoNX55mXeQZhkdx1/vUaZm2sFlQW08Kbq4QiYzk5Fh/dZKUH2aavu
         BE3sNa3oCQ/5a84U2hMJqmmtaaKL2JwVZtASywM9aCxfyhDMKAEfPwUE2/nL+Iox+RS3
         P1oC0GqIllaAIJlNtsKhNpabxbXqklW+ddecxyuTSbDi/pmn4FbU99csOCLeZIASAVSF
         bzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811477; x=1794416277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZX2J2F6ScsUN9tYZ3R0cEhAjGjvMCPd+3MYzWgyxI0=;
        b=1J1NmpEYDtbDtCVVAQXJASvpxveFtiJG2UQsN1HD/VBbVjiZShAdm6mLap+WyUd4ws
         8nxDFMdZStB8wOoCVuGOVeUoxArNUgFyeT4MLlZgwjVYvOAWZs6WzoEwAb1Ajwp45anv
         w4QeDn6p3GQXxPztdCgQuqoZVrozWHfzDxmtxocaLIGKTPuSXjc65lmgb1se2tv6f5N7
         IarDuUXLDFILhUHJJQYC+l8eh1v30dCPykq24hgYeGludW6D0EVBe0vSqa/oD8ALibr4
         W3olUegnfOA7xut9zlX/+h7BCrOCp2YQY7k1xwkLKqC4J4Vx8m9ZcfYzOsGYL+BFyXQo
         D7IQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8tF8bKkWRrmfkFloSKJ56/g5WfsfcBo1vE8PZi5zETI1WjEeHsmgiHQl6DYqt9NP2yOJP@lists.linux.dev
X-Gm-Message-State: APuU4Z8+O9Tz+6qoJRs6I54/gCrKWRJHHCiq57wf36yTxenEAsXYUu+u
	l2cuNP626cGNkbn4pTSG7yebPC+w2B0GLZNtzOMXYe7ItMVid/rTUcYS
X-Gm-Gg: AYBFou22XvJ1yYRVt9qjiKOnQJoJ6mJy9xgdaljHCtMjyZ8noHdog0/KzhpqKobpwIa
	lnHw01wC7Z3r6jX+r7siodU+egB3Il+uEa9pjNAe4pzyeVzs/QVvb/sMrv80bySIEr2Eig0DqUI
	HQIke5UnSRgXwfOM/FO45I+rKJdaoYHCjktYC/iXcWwNLqxzet/YDuFf6JhgrhDxEY26NWZPycI
	LSB0ZlcnFWAshWNGRW4l/FLEG6EJbcWi1DCSL9dyGzDcQ7/0Av9MNI65dSUqWt67NWk0C3b/i13
	z5AMRZ2LL9aUITX1caVRH7cV6r5EzUNIjLtttuMHQ6llpYZgA9OaDufQKxG0QVdF4mj9tO775OC
	yPeSH65ywbqL6NknGvng4m3T9MtqJ8TMAQrJiixNVnQ4t6H0j85vYsSuXIyPUnKlyteSdFU4PII
	omYUm/XAE5AH85t1ERADUiMA0/hgeDCnzBt+hz/bBmxSpN4LBbLmGZmfY/FGIiHg0rrIfQ7nYVJ
	bppgOdMz95q3k1Uo2aensdJodL53weISUW8S4peAg6dNFMEXYy46W3myrB7IX/JiLmnYzwyMXVv
	LP2V6auG33514HelvKpE73sfnUH/UDI2uGNhgPvDciDcfxdjipmXX7GLmGkm
X-Received: by 2002:a05:693c:42d3:b0:36a:1452:8dad with SMTP id 5a478bee46e88-36a4244dbfcmr24088619eec.20.1793811476479;
        Wed, 04 Nov 2026 08:57:56 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:55 -0800 (PST)
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
Subject: [PATCH 17/28] Documentation/litmus-tests: Add hazptr drain resnapshot-slot-race test
Date: Thu,  5 Nov 2026 00:54:35 +0800
Message-ID: <20261104165504.2430480-18-kunwu.chan@gmail.com>
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

Model the marker consumption race between the resnapshot
recovery path and a reader release: only one path may consume
the drain_gen marker (the cmpxchg in the implementation).  The
Sometimes result confirms the race window exists
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 +++
 .../hazptr-drain-resnapshot-slot-race.litmus  | 36 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index daab126e45a2..02c26d6bea50 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -115,3 +115,7 @@ hazptr-drain-engage-wildcard.litmus
     Test the drain engage's wildcard defer: an engage that reads a
     slot holding a wildcard (an in-flight slow-path acquire) must
     not complete for the target address.
+
+hazptr-drain-resnapshot-slot-race.litmus
+    Test the marker consumption race between the resnapshot recovery
+    path and a reader release: only one path may consume the marker.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
new file mode 100644
index 000000000000..699cbf0e3d7a
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-resnapshot-slot-race.litmus
@@ -0,0 +1,36 @@
+C hazptr-drain-resnapshot-slot-race
+
+(*
+ * Result: Sometimes
+ *
+ * Models the marker consumption race between the resnapshot
+ * recovery path (P0) and a reader release (P1).  The shared
+ * slot_gen represents drain_gen; only one path may consume
+ * the marker (cmpxchg in the implementation).
+ *
+ * The Sometimes result confirms the race window exists; the
+ * cmpxchg ensures only one of the release hook, resnapshot,
+ * or unchain path decrements backup_outstanding.
+ *)
+
+{
+	slot_addr = 3;
+	slot_gen = 1;
+}
+
+P0(int *slot_addr, int *slot_gen)
+{
+	int r0;
+
+	r0 = READ_ONCE(*slot_addr);
+	if (r0 != 3)
+		WRITE_ONCE(*slot_gen, 0);
+}
+
+P1(int *slot_addr, int *slot_gen)
+{
+	WRITE_ONCE(*slot_addr, 0);
+	smp_store_release(slot_gen, 0);
+}
+
+exists (0:r0=3 /\ slot_gen=0)
-- 
2.43.0

