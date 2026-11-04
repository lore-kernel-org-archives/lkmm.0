Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811367;
	b=t0SELJ9B0HTuUVS6DPJX30GL0NerRjBhq3pmuEkGkxbdJGf6u7BJ1bnKZI26Uz+GYQTC
	 BaVijUpra6CwBjr/BRkGEoxVce2bcrB987mnFAyKZyK+b8saY31cpA1F+3VPNC6vyXBP/
	 G2JkJFpFKuhgX8hxblQHxlUbZCHbzD3Pz0NZERUBDfVxlo2Qgj1trbdYTWkAbfDP8SivA
	 lnYEiaVykwhxDx+1fG5SYyO+ny6T83NZIwq1oCSMMYokcLX4hAv5eGCqMCMGzSr2BtMX4
	 T3NL2ilw8WgoOW5GkBYwqisAJZYWlV6BAwL+SRXJUZ4ZNZ22BTVAQMHWk2Pw0MSBOvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
	b=IyVx2xm/1D5cRYVuTfquzP1tGtOFevC6uJEAW4pEw8JWfaawRtle67Pc8sMHxtiFF+hf
	 Fsy+nEQh1cYmpupe/TZ5MzIDNcKvwACjWLms69bInThVUEzyZsIOkiP1guq4e+YM63loU
	 lZ3FLCC5KkpkL38Y6hthGcWoJC2qeq8c+7LJJqEJElGE8stBxvZ7TFlDHbHK1yTBTLWyd
	 w1G0nklF5xpsCX0QGfRhw+MKVPoM/a578v3wqJJPH0lcI/t01kj5DKwdHHzJMvmP0PHsz
	 nufapl4//dmZtLPNJWoSFddiiEcNh6qMvq8BS33OQ/CNQqJyaH/qlzFRyWL+fUVSOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVeTGEvX;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACA6606A32D
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACA6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVeTGEvX
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so1895019eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811366; x=1794416166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=PVeTGEvXbSjCu/TgTxYY3kBACvL5xmC5wmMwH4rtY8G9JdOPNQLie4h7lKAr/ct20z
         acCrlzyhvS6MsStMclgpxJCL8lK0uQwleRqloFJMF+aWMRRiQhTaf3EFM0AURdA1+A++
         M0W5nvqipULJluF5sl+0w80NoH4GKcHMoAV5NgnjTUEhoxfCoXeu6a56GZ3bT5fW8GAP
         GQsAQRWH48uB5HdmP93DMJ7j7BdfTezevAkKEREyHd7iiIiha8B6jtkd9z++hYBYWBKG
         +33AV3SCHjo4YmOXF/MXgBa1F/wdODfT+H5YzHvizJgPNlHe/q4QOMpbUXAeQXhPQn4M
         xS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811366; x=1794416166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4ahvqtjxwDZW1z/zIOwgCxGi6bAPzcPods0jeXHn0Q=;
        b=N9Vlx7OOcYccyTsYXHm7ih97bEEIxQUrews9q7QNfKqj2PIHqCZwZeYjhOcWMuM4qR
         7lmsg/VK9wGVq294PAhWz3+vqUEV3q8U/KZR2GZpTYM9A23iP+9W2Y0/Ghql4EdN4SRS
         JO51FAOzvJjOuslqpDfs4JqPHF6poH1puNL2hbVN11MlUVIaa0rYWgfftRAPLq5N9aAP
         7nTkiIdDdt8BEhS2Ql8RJ8mFkK9cw5syuipHu6f7jxEjCKJhBnRcbJ14JWUXlREndlyY
         UAFB4/OC9Qp76SOH2UVTGtQ+WPKUndkt6DvIiG6fXbToZEtngD78npa5eS1NquFx4W4B
         BDNA==
X-Forwarded-Encrypted: i=1; AKwUvBwcbIpd1ifEgr6ow9/lEEzw1y0woUDWEXsdUZvMt1DTkLjb8K3UbCeK0nMlZ+1WyqPTSgzO@lists.linux.dev
X-Gm-Message-State: APuU4Z+BC8j14Yezdij9DDBXSKeyJj2tm5vPidIZWzOl9dWjWIDGhdzk
	E2ApGU2VI6JfsC7HI4rquPk0wjDC+jd0ngq01nl1c7Kv9k6TEPIJ1NOh
X-Gm-Gg: AYBFou0LFUt4crtaB792EEGtH9PWDq9wm/IWY6pyDRUSF3EQdOTkOorHlxwxp/BnEHm
	zo+VePVMVuELdcTN168lQvdRUeZ4RJiP9nxtMEJDQeHKmUvPyLzPbJCsdkLiYuIf/1Iuap6e3zb
	kZKpyQeECFbFZhH3Xx4qf0lAuR/TuTHEHisfNdhkHBoQVX6VemUmLd4GzT8DKZ1M9gLNeNjfnAY
	x24jYvPV5FtZ+xl7noo3joaQ8FnZYgIZ5yZfx/nIXJIDKEUPvajl13ttz9lZz4Z+D7GokENhV7S
	fr6sAjaQYHOlMMQ3UJAAjqFtXEyk55LXoKBFGGUcoTvDJDnUrVwmFfSz25owt5HH8hAfoAs7jjJ
	B8WoTy6UxgiZF6SHxle8YrT3u6IlU0+Wg5EcgmJ7JOFhf8mRJs4wGUW0OdoMoH9PH+Xzmc/5FOq
	Qu876J0cSvHKvd19vm4Yy6S8Jekr6kSxE0phIKuTg/RcNRXvPMVxeXhfW0kqTvQY9PKw0kOSa3V
	gjJ0v+kZ/OhOMUx+zPgRGQaz02ePidjTNRQy6MfTRHog3MLykU6P9T1qReKCiBb7QtFdT8Fqrca
	70SB1TL3a39SN54sa9HXttyI5ldY/XxuvvHYius=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr26391236eec.28.1793811366010;
        Wed, 04 Nov 2026 08:56:06 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:05 -0800 (PST)
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
Subject: [PATCH 05/28] Documentation/litmus-tests: Add hazptr wildcard-flip escape test
Date: Thu,  5 Nov 2026 00:54:23 +0800
Message-ID: <20261104165504.2430480-6-kunwu.chan@gmail.com>
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

Add a three-process litmus test for the in-flight wildcard window
of the single-pass scan: a straggling acquire which published the
old wildcard after the final walk cannot still load the
unpublished object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 .../hazptr/hazptr-wildcard-flip-escape.litmus | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus

diff --git a/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
new file mode 100644
index 000000000000..de467bb82d20
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-wildcard-flip-escape.litmus
@@ -0,0 +1,46 @@
+C hazptr-wildcard-flip-escape
+
+(*
+ * Result: Never
+ *
+ * Check that a straggling acquire which published the old
+ * wildcard after the final walk cannot still load the
+ * unpublished object.
+ *)
+
+{
+	int ptr = 3;
+	int hp = 0;
+	int wildcard = 1;
+	int enq = 0;
+}
+
+P0(int *ptr, int *enq)
+{
+	WRITE_ONCE(*ptr, 0);
+	smp_mb();
+	smp_store_release(enq, 1);
+}
+
+P1(int *enq, int *wildcard, int *hp)
+{
+	int r1;
+	int r2;
+
+	r1 = smp_load_acquire(enq);
+	WRITE_ONCE(*wildcard, 2);
+	r2 = READ_ONCE(*hp);
+}
+
+P2(int *wildcard, int *hp, int *ptr)
+{
+	int r0;
+	int r3;
+
+	r0 = READ_ONCE(*wildcard);
+	WRITE_ONCE(*hp, r0);
+	smp_mb();
+	r3 = READ_ONCE(*ptr);
+}
+
+exists (1:r1=1 /\ 1:r2=0 /\ 2:r3=3)
-- 
2.43.0

