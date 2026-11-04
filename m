Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811487;
	b=1YdEf0Zwuc4rWFB6P1u/8JjtHLJ8LdWDH8dX0WHTRAd8RCq/Ilkjg07TXWmvo0shQbJa
	 KjQUazLuUuvvsCM7aBOy9JSaelYgelhB4fMQyZMjzvlEz1vYYMievr9HRm9jLOVHV/OHu
	 YTljOJBl/lAJ8ljsg6RkOuJb/LhqqRtjZUB0lRDRU7mOXrTxa5xlR+fSd0orTOLTp+M+V
	 FxWn1NtqsX5ZgWb3vWV5IsT32Kw+DNYhS9QKZtK3+nMGTXr4Utytib5IOHJEtl/Qzzc3d
	 i72p30VFuUWH5FxJbrZ1VBJsxsreE6B4xFnp1xZyFVqgWegLDqzlYdCTXjUMNx8hMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
	b=zwUM4aQF50CrYuBG/jR+/zvnb3lksG9t+dC12t5wyca13HUwmj4DZE98H/caMDLnLFTU
	 ye5sPuGzPiUJ1YPWbvQYNOwIsdAv62/oOsJRrq6+uojM8s8aDnJnaVnRNPNTzlh9VHF8j
	 aGtOL6rMIRwwuGAYOzYW1hMbLB9Ft7t2adqul186b3QnCHZFtchkMfuQ5G1fqjw3mMgi8
	 Z3lAIkWQkVBr5xpODsDglSQZ0Vj3kx0cf9TV75oZB3p72bAhp4lwAdPkugSZ/SzfO+mD/
	 NzdA5xsIsFb5zNz7g0TWlJbhy96EfCOP1FxLjy3XSeyhd06cMdSNLalRDi69NQfb55A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axGyIhxK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62987606A333
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62987606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axGyIhxK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cedf1bd63so973679eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811486; x=1794416286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=axGyIhxK0jnpwPE5tlEIggyzSPTcNaRPZM72abTJx6f5iiw2DDkv8SJxITh+LcrIms
         I1ExcuPQSBbP9quGYpsBZ7QG2PeaL+rQFh1luU/dHedvxeFp2RUmz2IfBYyHjOSzkrgH
         demTgwI39ymXmdGLYSnDhiQM3ev9zZBBVqffN+7/eQJNMBulKUsmqlD93qvWcbqrQIr4
         8dq0Z2kWwsiFiRMXkE70fyLyFLuEhr+xRJ/llX5foEUbF4LK25G4OTCvoh2nO83PoxmB
         ueRBJipj+KLMIniy1JmtKJcGUIiaA7cZZLb9iSzBviunx+Ocm2uUSCiMDVPZuhhQI6hC
         mBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811486; x=1794416286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=hEcSfQ8tpjXRULy8H7+UISqI02P8MMCcwRf1Kj7te6cer7MNl7tCivIMqBO5nhrRcQ
         nrydQjcD9iJXR5i+u/8HoK24nS+jQeAj7RlOID4g/4Gq5s66WtJwEUFQQUgnCHDK82GE
         rXzvVcd7f3bDIjFj0/n9OroLanQyQF09+mOp/K+geSi3Ki1oz2IoiZu9dLSPJePjNIdl
         xlAHMM5UsRJ7Ho078Iwke4OJq8E5DgsnyBbcAWE/0jtexCj4kL6d59H9rVGWs3vHq7iN
         WZ6GXKdhzZSXCZeNRNy83vJ0KOjOL9Wt3sdS7h7gKGad3nFGLEGhiezJAHhUdUdTNSgI
         /N6Q==
X-Forwarded-Encrypted: i=1; AKwUvByclUEbZ3Hku6OYgg8SjJvcWL5nouWLdgo/C47aDR/p3roMnlIyZ7aqdewZiLh7mbqSOlgI@lists.linux.dev
X-Gm-Message-State: APuU4Z/GVTw+iwGD02hmCZ3kf6lLgre/NYhzJMTc94PEHpQ7fF3pYgwy
	6Gp+K3AMr5k54JoUndQP9uuhEF+JW0gdJQldmW83JdyjEjj1OHumb+9m
X-Gm-Gg: AYBFou1i2AnpjnEm38CRMfzCDvc5RRXXBUSw4JoWaTtMDPjYs9kRv+8JQh5aM0WluQC
	05udg/AJl5zqLY5Fn11qXp5H/EgZvLoEo8nfFEaLGIA7YqgOZd4UqWa4t/BXJB2HH6ixYWaRH2Q
	jRERFKqDoNgfudXaNYVql54cgyt8sFb78rxC12TUhs8VPk+9z+0gUOskn9sEpX13czyB00H/TkL
	hcNA4IttFKiALlHqk6qOgMTmXdesfkL4kYTsgG1b4e7U1pmW8sHYN721PCkfr0jfqsL86NpgBcm
	8BBRh1tTRDXbDcZWR6YnIUiboeb9/zQ5gZfyaXMYFbmMKIrPsqP2DDO8BuM2cN0ymSM2QjRgaPp
	oJtkvgiVNVvKgIr6pp1FM//cmaDHBlvjl1nD0wnOv0zftWvQ95U0WO/5Vp5Jo+CF0pOlhpgzz9E
	/y0l+PG2wknjX3fQC6+P2X0xuZE80NEzLeKg5LCKOvZ3fzhZBbyUNvU3SLyuqLADK5rNNkHB+Wp
	jdbxtEAh6M1ilwVztazlWtCYddSHGcsyqSIFbreKf3HMz1W6R+NjBwtIiPAZAvha+TWjEMPsQ5o
	wskfb/Wu4YpQAt0G5HZhHbDdKRjsZ1I7pYxUSsLcZjMMxQ5LubOEZEVdcD8s
X-Received: by 2002:a05:7300:f78c:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36de479614fmr127613eec.7.1793811485795;
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
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
Subject: [PATCH 18/28] Documentation/litmus-tests: Add hazptr drain safety test
Date: Thu,  5 Nov 2026 00:54:36 +0800
Message-ID: <20261104165504.2430480-19-kunwu.chan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Model the drain engage snapshot race: the engage may read a
slot as empty or wildcard while an in-flight slow-path acquire
still sees the pre-unpublish head.  The Sometimes result
confirms the window exists; the engage's wildcard check (see
the engage-wildcard test) closes the gap by deferring
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr/hazptr-drain-safety.litmus         | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 02c26d6bea50..604c2c0025d9 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -119,3 +119,7 @@ hazptr-drain-engage-wildcard.litmus
 hazptr-drain-resnapshot-slot-race.litmus
     Test the marker consumption race between the resnapshot recovery
     path and a reader release: only one path may consume the marker.
+
+hazptr-drain-safety.litmus
+    Test the engage snapshot race: the engage can miss an in-flight
+    slow-path acquire, so completion must defer on wildcards.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
new file mode 100644
index 000000000000..a0ec1a063642
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
@@ -0,0 +1,43 @@
+C hazptr-drain-safety
+
+(*
+ * Result: Sometimes
+ *
+ * Models the drain engage snapshot race: the engage (P0)
+ * unpublishes the object (head=0) and reads the slot, while
+ * a slow-path reader (P1) publishes a wildcard (1), then
+ * replaces it with the target address (2).
+ *
+ * The engage may read 0 (empty), 1 (wildcard), or 2 (target).
+ * Reading 0 or 1 while the reader sees head=1 means the
+ * snapshot missed an in-flight acquire — the Sometimes result
+ * confirms this window exists.  The engage's wildcard check
+ * (hazptr-drain-engage-wildcard) closes the gap by deferring
+ * when it reads the wildcard value.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists ((0:r0=0 \/ 0:r0=1) /\ 1:r1=1)
-- 
2.43.0

