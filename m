Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4B4FB9A9
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220644; cv=none; b=SZhEL67+RGXgClCijbnEyLF3jJp2AAsBRjrLX22TJTbu5xuEBXz9d2tYfHXOukTSrlnUD8qsQFyVZRbcdL8m56JxXhv576Mu2haJScf7py6CxhOLUjeKIhRmTgPxg4xbnhF4eWMRQa5d9GBp5jRjTPZ3I/pww0GlquatEFJaClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220644; c=relaxed/simple;
	bh=+3MpZXZDrpG3qLkvzfnf9AFNVYrh8OCkchmfy1w7NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nbW4htIqrA1wI3yr8/VUNHrBbjbVJ/xB//8udmJVzyw1LYZ8WSTvmMZ/4uaRcDu+ENwJZiJ9PXw8gLLdN3VNl3IHVLfN7Ise7+N35G8fao9wUMiaRXvHMJIc7y7dytVFNMwDqBO20hcH4Pr61YISTg5SkozjKkul7AnePQ81v4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8O8d9ma; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8O8d9ma"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so561114a12.0
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220642; x=1791825442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=j8O8d9ma0VUBbr2aLeonNfq0UpvzR2vevopTCfPIA1etaLr5lt8h1xLz77qYfcyu/m
         nvNlZE/XcgRPPha7YWFjkCb/fral9usBT7p4pnI/SFzbkXOYOgZPS1SEIfhtJocBkPQF
         ry04mMD910kK0n3F8JjfV0QMSA1PhixP5kOcUvFye8ZFzcDvrNmCddFv4UmAb28xIPtB
         4cPHswsr67qH5wcxtVIG983wjecFppKhMJXw0Tk1ixgaGWTXN6wMEY/of2ery8m0cdzg
         NBZa6lVauXLDu/43JKkAGp3WtXXUxWMIguz8h+P0/5kT8jbHKQ7gaNwsHSEBpdjc23KG
         g2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220642; x=1791825442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgimI6/+2euHwRm1MdlOUoQLnXLe8HSbpGa41J2vK6A=;
        b=yMxU2Gj+5kfSsaUCGcOSlxh3s5uurRNpaDZqOBjcXUji338un/ftYo50UkF/7dX5J7
         PA48qBTDPxnk/kxh1KKuf3cI3KzMUgEvpTQZ3paIzV9bTVqiCzAY5vNCAtkUrejWWEQ4
         r10OxC1K7TLbk+0c0t6eY2Y8/cgaqixLhROS0QZjMp3HsXu4YsqmzRCnBqaUGpIqL1cu
         4eDYiHB2SwhfRBx6I/MfigaYRBjfX1UAN1TQ82msTuAzLb19ouKT4xXjzmk1Z1j3MRBW
         eBH6RgWgxV++Su97CuXNvjfrS6a5O6E8wm9PmmCW8LqEMnAHWEqT4pbkhQyxYXFF7aic
         D4gA==
X-Forwarded-Encrypted: i=1; AKwUvBzEr0k3uWuU7sZOmJE3RO+hpfazodc7FvTvl1Gl3yeD+8mwO3emd54aOxONpEIN+q7Tx7EZ@lists.linux.dev
X-Gm-Message-State: AFq9FYLfz/H28dL8ObssJHOadEi876HwgHljdxCEP0B8Nk946AfVDKBf
	tLTkhM2i3f9TF6+a/a9Tl64wYU5m4LYKXOIaFd53vTSvvpSpMoyh4SBv
X-Gm-Gg: AYBFou2XqUPD510X6YaxoYj7ZrB0q85hO7kVg/J1fl7dYURP8H61lhEiQKE7kSnE6f3
	DnTgG6NKFPJpKHJvPUuhNB1KsBvCjesd4jyU8KkuL4HtjGViTxXdgR9wTBSDFscP1iMs02GMJIF
	L+zVDif0zNzix8ovpKne/BzQN1hjeY2vJk+Og6E6zsTNzOSvpKjap2XBuZV0LBDQiaThob3rtNu
	f/BcpwOS8lcRa+JLQcV+tsbk9RlydXPyKLoVYGxDgsfiloyH1jjeCsd3dL3+GSNdSgF2zWH+qML
	QpAeebqv2jTgAtPi940vgBBzPLBj4CpHaIG5Cs/PW8o5UAZO2ijgwlocG893gqHtmAUR8S7stIf
	O3vqLM/qeYtmb//B9s89ugUa/8HHydtzXPAC9/f1zjq2z6PrXjE2K3hiHpjbHYV+Er+l8HHtGAU
	0hhC7gAiOWik3HX78eMkr9ggwRLPJVttTfCgBzInfVeM5VAfGOzQLQFBxdwPrkV6YZDVIzn/UZJ
	n2DjFxSoV0Hq4krg5IbIctnWflPQw==
X-Received: by 2002:a17:90b:4f84:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a7ee74eac6mr1974037a91.25.1791220641154;
        Mon, 05 Oct 2026 10:17:21 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:20 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 07/15] Documentation/litmus-tests: add hazptr wildcard-flip escape test
Date: Tue,  6 Oct 2026 01:15:21 +0800
Message-ID: <20261005171529.1378809-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a three-process litmus test for the in-flight wildcard window
of the single-pass wildcard-flip scan.

P0 models hazptr_synchronize(): it unpublishes the object and
enqueues the waiter after its memory barrier.

P1 models the scan kthread: it picks up the waiter, flips the
wildcard, and performs the final hazard-pointer walk.

P2 models a straggling hazptr_acquire(): it reads and publishes
the old wildcard, then loads the object after its publication
barrier.

The forbidden outcome is that the final walk misses the
straggler's slot while the straggler still loads the unpublished
object.

Verified with herd7 (linux-kernel.cfg): Never 0 13.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
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

