Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCE9502D71
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061007; cv=none; b=P9Tfs9QFZf+nVU+9wyLvTMsaynLJJPBPsubntRWrhRSyncjUkctw1wJTJTVZOlka3IA0DWvzEy60R74FZhc1xGfBgvWHCI01+ms57zZW5rkW5IYtzXU+oO/g6SttVc9TITWF4/rX17dDHU/T4kQtYfX/o6y5HCvHK/Uq8bIBI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061007; c=relaxed/simple;
	bh=IT4Omxoh3UL/os4MBcvDO0Y3uwCbEQ/6SyGtTM/wD+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yj8CT5xhhhkO1aVDdA0mHSMcfQypnEpo/osNgOhUE7VkyeLneJydVO4oF30gMd4Eoqt78w3gNkM14c12cZoHKjnW4zc1m/DKSFXk2XxLAQzO1J+vxueI6cXgLvmcBWddbn7yj6IjTdqAUUg7U/uhpBOdWEewo5jrZu2bCjhtEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brnaJGYA; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brnaJGYA"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so2759857a12.3
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 00:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061005; x=1790665805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6nOkseLD4E1uvlk7kwNFkZGEal1mrhs8j7yziX25N0=;
        b=brnaJGYAW2bzqcupZWX8w6ZFBpi7rt+pGKKY3Kp5uz1uqMUDsJlTWheUG/+cgYsbBu
         WO6YG6rnYsLqCEmQUmHjkDHpucLihMH1nOonDtx7R7szHg/StsjpY2aSiSUZObEI/m6J
         6OR6F0tQI18D8h0zTWRWCDlxr2TtoBWm3WPsbHLhb5Q+8bggqZTKREaBs0aHJDbXAmOL
         Fbn2O4H+FD+sFC9lpXKkn+ACUl7kHZa57Y3nILsWpj0rblhEsbwIh+yiHsbDEg4HpcIf
         xncQYV838ebFKSU1iiWtK5FZtvI/YIq8PJ6xEsdt811Y/UfZePOmbHSZzo7w5tiDBcis
         63LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061005; x=1790665805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6nOkseLD4E1uvlk7kwNFkZGEal1mrhs8j7yziX25N0=;
        b=ikLfetC7xi2guGsJIvihNAyg0pRzDoToHN6X0S+S6mVzRFHIbhz3F0TuOdJX5RCbsy
         YEA+0enhA89EtvZWNRr/IQj0XR/8aVJ5Iq18OxsDbC1mYqCv4qCULX68jrJVQEPVS5Jn
         vU8Vh6pbpXNbY6FPpr6x/1PZjMIrALA80GRmPiu7xxojtu5Ifj1at+Qkqbk3vQe4ZqHL
         Y3qy9O9tcD33+ZSxh/CjyD2xC6wPL0bmZpp5I3GLXB1mjqRh/KvmoKp9o6NxQkT82oXk
         xRhNO8iGC4xCAT1XhuNUloFMHs5j1/yhXKfQBVcvXlD/pYihG39Andl8iteXWSbNLagB
         5wuw==
X-Forwarded-Encrypted: i=1; AKwUvBx3LBTDIg3vnqvMKDbIgZlPbDi+tqxkFic8u3sJGudrf3sX9MJDyOJmNwUASCkoApA3e8tt@lists.linux.dev
X-Gm-Message-State: AFuF++m0KtuAtloRMaPbXfTrQ+LJiStY3Uf5XRzbJqQSktm5TykbwaRk
	VZJZTEYGyUJboSLJUHK3KJTlb5+54qqOjoGfPPX3OQauHc8cLetFPg5G
X-Gm-Gg: AYBFou0U01vf+EkXXillBMuV/p8WViCVamKa82ICKY+4dcWmTUwTEVwX/kiXXrJE2SC
	lNFjn4q575/L4Q726YQvp+KvyxEbmZCHzKZncLEK9DHbhdZn1L0Xlz4gnrMGnvSWDHiZw6LrPc6
	SWH6+n0GoxBhxSTMXf+8S9bPZkwadhqRCB5/tm4MWNSIYFjMmiuzlIaJ8EIIASkLJ4RpE7QSFXK
	O8fssKf6GoCr0eGqn2GrjFvleGK6sag8I65s8L041MMXIKBSHuPN2cfXPt4oRamli4vF0kU+wy/
	J8mhkiLWR2mVG5dSNfxfCceqf+ob5ur9fk0hbG/125hX1B/E1mYcAVoZrlomte3Ggvf0gRfgSVZ
	ZuXmpcfRS7GUvj/qbD61RHQCtLU3gC9H/ql2g5lbh3XxYu+7bFEDwV+U4XplQyvgxYLGBaIw5g5
	WS2tw69bUL63ekn31uyfsiEOnZfHEBf38bR0B34UWSMYjtRbqo+LnNJ1lcdRL8ZCY1BD1X6pS9h
	IEFCPKIMLZw56D5CA==
X-Received: by 2002:a17:90b:5404:b0:3a0:2900:f577 with SMTP id 98e67ed59e1d1-3a07324277emr253812a91.51.1790061004682;
        Tue, 22 Sep 2026 00:10:04 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm3079414a91.7.2026.09.22.00.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:10:04 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com
Cc: akiyks@gmail.com,
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
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: [RFC/WIP PATCH 0/4] hazptr: add shared scan path and lockdep use case
Date: Tue, 22 Sep 2026 15:09:46 +0800
Message-ID: <20260922070950.4173245-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This RFC/WIP extends the current v3 hazptr implementation [1] and
adapts the lockdep use case from Boqun Feng's earlier hazptr series [2]
to the current hazptr API.

[1] https://lore.kernel.org/all/20260919000056.3132131-26-paulmck@kernel.org/
[2] https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/

The lockdep conversion replaces the expedited RCU wait in
lockdep_unregister_key() with hazptr_synchronize() for dynamic-key
lookups.

The series also adds a shared-scan kthread for concurrent
hazptr_synchronize() callers, rcuscale support, and an LKMM test
for the acquire-before-scan ordering.

I tested the lockdep path on a 96-CPU ARM64 KVM guest with Boqun's
original mq workload [2]. With a multiqueue virtio-net device
(`-device virtio-net-pci,mq=on,vectors=6`), tc mq add/del x100
completed in 850 ms with hazptr and 860 ms with expedited RCU.
The rmmod workload similarly showed no measurable difference
(1360 ms vs. 1380 ms over 10 runs). There were no crashes or hangs
in these tests.

This is still RFC/WIP. I would appreciate feedback on the shared-scan
design and the lockdep conversion.
 
Kunwu Chan (4):
  hazptr: add shared-scan kthread
  locking/lockdep: use hazptr to wait for dynamic key lookups
  rcuscale: add hazptr scale type
  Documentation/litmus-tests: add hazptr acquire-before-scan test

 .../hazptr/hazptr-acquire-before-scan.litmus  |  49 ++++
 kernel/hazptr.c                               | 274 ++++++++++++++++++
 kernel/locking/lockdep.c                      |  30 +-
 kernel/rcu/rcuscale.c                         |  65 ++++-
 4 files changed, 407 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-before-scan.litmus

-- 
2.43.0

