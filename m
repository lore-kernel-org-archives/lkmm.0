Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811469;
	b=xQYu8yyO3QKe0dBzY3LpMiK1FrfJYlGefQWz73cG3jfG3V8Lb+BYEOnThZzwYSOk3Mo1
	 CcUonxhqzbCVfoHZX73eyJf0Gvp1RGvHdisOe/UUFU/WIdZ/ebYXHRyU/M7EBlFSuUAWO
	 nOOti2wOxvr1oT1Px0uzLAidEyp+wrFKZCoPPR0ODK5+g3JtnaI2IhuuA1fEHoSiZEBdC
	 vF4F6oqCDcc30vU28q7qEARdZqeLHE7NspTOH+KCkUqYtFxOHFm7TWmJAAeB2mu7uZZxo
	 NGWWFBrk5DxJ68n1UzoEt1eaqQM5nuArv/8OTow24FJS8Fwx+iHjxXWBQOGR4hTcDLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
	b=hnrOt4PSq9nDPtXOZys7VB/NTprCazLzSnS71kzLKwCjxZemJglpIMjcaI4pF2kszGGc
	 jqT3nvfnxPRE05DbsgU7PprUrCvOLfOvjJjmUbaIeA5R9UqILDRdubZpqwTYO6MZHVKgJ
	 CaPoSTSr5H2li9moqshTb3U4yCR4Jb//S4ftuDXARlXbAahQdk+yBN7hBx0kcA4xqr92A
	 +3dC94zrBIdsL2KN9ZcRh1sBigkIU3J5d/E7AReQwgD/KyvXfaCWgZpOc3ses78YmzHkj
	 XOBGnZ0CAyuckJr6RDqa5NeyE21vFdqucwgN0PPqIgsW3q9RgeQnyFXul3jqPOt/jjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjKGyYfh;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9037C606D822
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9037C606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tjKGyYfh
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso1208581eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811468; x=1794416268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=tjKGyYfhH5ktA92iTKOv6NkmpFJ6h1LeICM2SG2mrTMOi/ru1OvFkQgXgpYzo4HIp+
         8MuOPwqJFD0lzzkYSlr9KPgfjPZXUAfihbGKxaXxEcdmIYKQ2uiUkvLurR4F6E9lQzgs
         /ZKfwlOgZySItmurXWDNLXykUAOPV9k3REsyeeBcrm56a3seXMFVKl3pIAIyKCa8uiIg
         D7Z0Z8rPjvT2H8RC/2b6DhP2Fshg1Y7LnjaSOWMP+CLufrI/ZAUZwyRt4h0E+613lR9N
         wUqdVA0wFasYh0YE+eEILIE4n5BgEtKm6tYf8hOFsDtamkN/d3XEtdZiqnv9cK4Ue96t
         LMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811468; x=1794416268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=Jy9/uVeAy/whmSsodXApqxF3KkioabOTtr9ZE4EzMmPYIZiMRnwyJk2kWIpv35beLu
         xIz5OZ0SHdl9l8pu7IEDPUC6Sqmf3kVyW49v/BflsB1rNhWpk/ULgNpjO1B/sOhDjjEf
         FljOIqNe8Fv4cfT/ltRmI7plMS6P1YdeIq8Ca0mn2DNDvQ8DZDPlSCWxGYIX+l79u7M+
         zJ8YS4BuFK9BnAkiv2WlOFLHVXVEDVAizRDs4TXYRbvUj2u1ICNpyYkGSeti8cCWZyfn
         u5VJrumSgp+rS84zBEiM1528Gb5FChmq26MXog6RIuPqfEEZg8JljCPc7TMRYU+GZD7w
         Xmrw==
X-Forwarded-Encrypted: i=1; AKwUvBylbeIIfuM9c3H9qfg5z6IXzDexfIi0rvkuk9jnsr/Z3CYzqpLdGQZ47NL7gyMEMZwbWo0Z@lists.linux.dev
X-Gm-Message-State: APuU4Z8QOjfQBqzbNd+CMo0VBiHoieWXrQi3sMd3PLqU3WHHa5krgzQR
	vhOjsqN8xswVdLwiFcaaVOA9k4IHyM0NXcWe49Ai5wKgfSlxgbDm1ME3
X-Gm-Gg: AYBFou2aO3E3JaTkp3L7rpEij2+MiFt78HvE6AJnW8K9IE/n92br1hxpAj08axnTTO9
	e7k4iMyiBgZEBvb4M9nDWNxeULvJg7zdPDC6zOu8x/v5q6Qaqgeg5Krzn5U0Yn0Fgkq2O4lvtbx
	b9tBM5MlMxQvtfXRgKXug6JDJSKobCsHyjTFtMqq4g8JgH8EpCkceHQSdfy0w7TyNHTsqofdFga
	ocmRc8CsGvXmOLFXVCTeKLqsvkcqZo5lL3zvu9XAgP7ll8bjxTio5VgHS8e4uU0ZK0mHpvHyzSU
	A2VpuzzusgZMesnT12lPdnYEeDlbhVflt/MBHQLkm+cA3lhFNO1L+tCyddfG7OMmY30sAfQE16M
	SUO0ELvpDb0Q/9EJfgPzZ4Zf3G/7MycLGeqZ63LYKSVTK3TwqhvSX9f6erMZ7/SRsxTokGIOmVt
	LOjEE1gz60qSFix9uOiTJOpoXU3WxBGjf0cCDCF9OI29Wq6NNX5jEOconI/MMmQIx9RQQJRtSoW
	lAv8EZIsUNA0G3O0a1Rp1jTXr7kedlR4xQheK7eGThJ+P61jrhZR8mR50u/b2nYhzLeO7ounrj6
	IW8sY6usOXIs5X+c08/6aOv36zdciPWpi4tU+iw=
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-36a42425470mr24210020eec.40.1793811467022;
        Wed, 04 Nov 2026 08:57:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:46 -0800 (PST)
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
Subject: [PATCH 16/28] Documentation/litmus-tests: Add hazptr drain engage-wildcard test
Date: Thu,  5 Nov 2026 00:54:34 +0800
Message-ID: <20261104165504.2430480-17-kunwu.chan@gmail.com>
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

Model the drain engage's wildcard defer: if the engage reads a
slot holding a wildcard (an in-flight slow-path acquire), the
engage must not complete for the target address.  The smp_mb()
pairing between the reader's wildcard publication and the
engage's slot read forbids the completion interleaving
(herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  5 +++
 .../hazptr-drain-engage-wildcard.litmus       | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index c2bf20fa4092..daab126e45a2 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -110,3 +110,8 @@ hazptr-wildcard-flip-escape.litmus
     Test the in-flight wildcard window of the single-pass wildcard-flip
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
+
+hazptr-drain-engage-wildcard.litmus
+    Test the drain engage's wildcard defer: an engage that reads a
+    slot holding a wildcard (an in-flight slow-path acquire) must
+    not complete for the target address.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
new file mode 100644
index 000000000000..0cee89893dad
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
@@ -0,0 +1,44 @@
+C hazptr-drain-engage-wildcard
+
+(*
+ * Result: Never
+ *
+ * Models the engage's wildcard defer: if the slot holds a
+ * wildcard (transient value 1) at the time the engage reads
+ * it, the engage must not complete for the target address.
+ *
+ * P0 (reclaimer): unpublishes head, then reads the slot.
+ * P1 (reader): publishes wildcard (1), then replaces with
+ *              the target address (2).
+ *
+ * The smp_mb() pair ensures the engage cannot observe the
+ * target (2) while the reader still sees the pre-unpublish
+ * head.  This verifies the publication ordering that the
+ * engage relies on to defer when it sees a wildcard.
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
+exists (0:r0=0 /\ 1:r1=1)
-- 
2.43.0

