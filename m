Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811496;
	b=1/9yN0RvtEhXDR5LMmZ1m9DQPYsXVQ6X0oyKG2FopdxF2XIYx24rHeWCdAgnnZGGKrQL
	 DOlLcMJ8TjSQnfvLt3Rn81kZXsIuHhvXv4hY3P3uZPBzRSgkiWmBpPbRt1aedNwCBafyg
	 1GRukkK77Gk1Q4HUqdNoOmzl6vxA533ZJw/+1L9TKTjkdmzjsXX754eSPBFhR0zrVCJff
	 WnwvwL4wcTOysjv2ztaISzHTyGbMuvzwoBXtO0ybnLrYmL3lTftgKL+t1T0RcErJXU+UD
	 ZVFtB+FZwYiXd7rmqFIbgpaQMhJzEGmoe3Uy3Qw4kJY59NuMcpnsm7v48ZM49mQkkBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
	b=bSKnqhjrofcS3QzmXtWVK2mR9n4IF5uIFUgpOBfMT1XmtzKh4XQhN3CLyGlAG98fi3A2
	 tutteNfA140fBhk8M9/WxdYVS1K6rifyBs3reVXP3gKklrnfbJIEGQFHihj5LeDsJPZti
	 V07agF+YDRV7OkGMbi4v6YKUsJNkJSLS8gVW8mSjU0Tou3ycDxssR7kBVbK3hy171DK5w
	 /ZiyOgaAjGa5xHOsobBURkXc6m6XDF6+jsTyV5Twag6f/yZvqKg89G0JOGZ7E3WJeFJJv
	 T4imnpIaH9H2NGdM+jR9dgmrYU5UqYU7SnDGcdeJw2pu5YZydDP8b28KeJIjijBAxWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K26ayp2h;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F69606EE80
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F69606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K26ayp2h
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36dbde64409so285801eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811495; x=1794416295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=K26ayp2hp9DcUvkTUCzFwReybPx2lBOb3qbK4QXtA5qXN+w8IdwUTZ6BFvs4IKb3bH
         17Q84c04x4/bt/6UWdAuiI9ScuwtOn+lDw2Sr71lmgfrbT+WC+KCl2ZqT8bJMxHG0ONa
         LyE4+IpJIoeUgd3LtZ1nzFYWmw+AF2u4o4zbot3Z7OarnSXGrUiar83VXg/Je0n/StpE
         980io0XEls5wfg8GfgCrrBRH6LThKr+RYXsFUzE3/Fv99bb3kEtKCT8lWt43XBlXlAsq
         Cwf5dvKFdeaEI46ZT5uWscRP62/UGK+sYRnC6LkTHIng0/g/chrh2z+WUFzLmG51QszO
         qAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811495; x=1794416295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y7w9zIZGwFreJVwPOaTuHd6p4ZAf4hMC78IhCBOO/FI=;
        b=QNOKdoa5tnmbU0uv9yUY+tcgu8BSealpQl22+JN9WJl0zA/0avIiCsrQi7gZnRM81I
         dXGxd4mHLTtestpwcMCf0twntUs3hQz7wUs8AhjYoF860Ie4zprov8IRuOU28FLo+AVS
         SYsmjNaJd5j1olbaY1jnzSjRO/sZCX9jOekpyCeCY91KNQBbnGCzGwGH2vmDgisv7sUY
         sz481bFHyfxniwPV7Q8C6uDNu9IBUJXC1+PtmM/7WuAo7VrheIblzUZbaKfYiDphFuzA
         ZS8nJjByr9mAg9Rn7JmbirJaC/2v3JXIP7H+F+03z5Zb1GSIy94ydr+BxoLHfDmjWoN8
         ku8g==
X-Forwarded-Encrypted: i=1; AKwUvBz2L4pVfjBKg/J9MJBbzKmn6f41soMHCsz6XhtI4J6B+KOGIhMT2ogsgI5xBI7PTyHZkskQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/7h4MY7azo7tSLcAZsjJUHHQ0XXcflbgRENIRsO0cjINEzgGby
	XPxAMFSnVa+YLslBOEgYUJnbNeyhddcXu612auKyXpEA9q9SrnJ+Wagn
X-Gm-Gg: AYBFou2MWCXD4/dB5eRSjZoymL/ZVh8Og+v57RgpuakV+Mcg9hqEwj01yoIpIuhI7Yh
	zG+sKYVw51C6QXJGaze92KSq3Es9PrNIONVX9ZHib4UCYWUj7QinzctWcYVIGgJs/C5Piz1QhsZ
	VFNWG5vbXX1BnOAIDamWr5h1nINo6GTFziSxNJtzpUPAP8yqovLL+sGbFnoUpwyfHu4lGEeM/E9
	hL4x1PQ7wJLvZrXPKu5yQBZ3TTEQ1Ub2BjUsK5mT3WmQLM3aIwSNsdPi8NuamtfWOsJwguQwsn3
	P1gs3BH700+wAt7qGHDn7GHQNyl2EUgXPRmmI+rtMD/8E7RrodSXlArXMUV8WuHnh67K0Z47B0t
	EegnxuNTFvWpfe/N8Lec12NkDMkHh+XR5auKPsS1/ygp/t4e9Am9JOmrmd1c79AlvG/fbgO/1v7
	JTbjTeVK+gozjCAVeRbLh5ralz4nvCYSNlp+omlzQfIkg4l6Y/FhveaiTEqdPY1i9lMSyzaQb0y
	7p704v7jPk51cySAV3SqJx2ProEB6YzmXBp+OwfnsdZprCgItenP8+54760NlDDTug5D507NHNC
	n2BsHoZw9aNnNj/Iui/43+kRqZgNuNYKk4nUH4g=
X-Received: by 2002:a05:7301:fc81:b0:36c:d29e:668f with SMTP id 5a478bee46e88-36cd29e694cmr3306314eec.6.1793811494826;
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:14 -0800 (PST)
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
Subject: [PATCH 19/28] Documentation/litmus-tests: Add hazptr drain generation-visibility test
Date: Thu,  5 Nov 2026 00:54:37 +0800
Message-ID: <20261104165504.2430480-20-kunwu.chan@gmail.com>
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

Prove that the drain engage's smp_mb() publication ordering is
correct: a release hook that observes the new drain address also
observes the new generation counter (herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr-drain-generation-visibility.litmus | 41 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 604c2c0025d9..79b0634ddb13 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -123,3 +123,7 @@ hazptr-drain-resnapshot-slot-race.litmus
 hazptr-drain-safety.litmus
     Test the engage snapshot race: the engage can miss an in-flight
     slow-path acquire, so completion must defer on wildcards.
+
+hazptr-drain-generation-visibility.litmus
+    Test the drain generation ordering: a release hook that observes
+    the new drain address also observes the new generation.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
new file mode 100644
index 000000000000..d5c1ca247d71
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-generation-visibility.litmus
@@ -0,0 +1,41 @@
+C hazptr-drain-generation-visibility
+
+(*
+ * Result: Never
+ *
+ * Drain generation visibility: the engage publishes the
+ * generation counter before the drain address (separated by
+ * smp_mb()).  The release hook reads the address with
+ * smp_load_acquire().  If it observes the new address, the
+ * subsequent generation read must also observe the new value,
+ * so the cmpxchg compares against the correct round.
+ *
+ * If this were not the case, a release could read a stale
+ * generation (from the previous drain round) while the address
+ * already belongs to the new round, causing the cmpxchg to
+ * succeed against the wrong round's marker and falsely
+ * decrement the new round's backup_outstanding.
+ *)
+
+{
+	gen = 5;
+	addr = 0;
+}
+
+P0(int *gen, int *addr)
+{
+	WRITE_ONCE(*gen, 6);
+	smp_mb();
+	WRITE_ONCE(*addr, 1);
+}
+
+P1(int *addr, int *gen)
+{
+	int r0;
+	int r1;
+
+	r0 = smp_load_acquire(addr);
+	r1 = READ_ONCE(*gen);
+}
+
+exists (1:r0=1 /\ 1:r1=5)
\ No newline at end of file
-- 
2.43.0

