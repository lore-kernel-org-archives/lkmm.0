Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6B1B4231
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821087; cv=none; b=QNIt8OPdIiMAEoRi/aa/cVhdap70Ey3HIMUuae1l2ileAX8LKDgcMb/48EuOHiQyzPSA05fkVexug2oy+NpaPTakm52Mc/yJoRddf5BuKDW8ixYhWIlqgz75PyXJ2Orep+99dR3+anbcbcQ066ct1eQRmSeDbbTkBkzkU8VvaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821087; c=relaxed/simple;
	bh=dmJlZNkGnYr4lMKNh/KeJpM+mdF8w7szhNRQjOFxOSY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pI+iF9r0iTbn++D7P73xi7cDI4j36zvWDNeuHKlLzYLj9xlQ5xBJge7nx1d7O7kmzh5CjjQsnigDDAqS7/JXXugdv1AHAoLRU4y7IVaSOUziDXPolnjoNzMglPQy/LWjJxh9j9lmtD3YdaNx1zXEuTRU9WlVmReWZAIwAGqw0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNFa0XXZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNFa0XXZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fb3bba0730so6209606d6.0
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821085; x=1751425885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=37wLyUOFnEhvbHdZdl11U23f9N/UOWSnFyRj6lojqvw=;
        b=jNFa0XXZFHXtACH4i9EXgvKJnfKWlvPPrDfV+9jKxpdaFIlV+c4Sy9nb0iVea06U4W
         /rjjtVjtQLnpjI8jrzHWTnSvr7V793xcjGAhLPbPQzzt7GlAFP1qcQWgKXJNiApxHc/g
         YK2np5Ic6nXY4AhMFdXIlBCXyPcPOr2n3Jn6DLUjFhxGqGryPGNu5dz7MCxdAN7cSQeU
         +7w7AdgxiKLZe9JuZ3BAQL4CUimkF9odN8zqwaHlsdFwIu4SIz+lLpQ3zkKLbojQTrBO
         h9gsU9KzJVVtyzUiQZCUJ1W+se425aVBj1DN6Jab1s8U68Yq6B5gZCautogGvIeH8muD
         W2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821085; x=1751425885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37wLyUOFnEhvbHdZdl11U23f9N/UOWSnFyRj6lojqvw=;
        b=WR6plV9D0SmjzUSgvpJkU9hKajMfJtoIBRlAwY2wOQTIBZdK5HGehG6cq6DQkdHi0p
         nPIECNkLodGHklNEEKwwhda8MXLzb+dNj+9HT1nnXMFrn9COUKKfxJ3eveye9GNXzA+q
         zP8Mt3WCaUwSR0EG+OTOv8Wl0yi11JV0ELDkgxXTGoIm+lfxo0EdRSgSLy29Es/Dbtqn
         UN0ck5HJHQzEIUuvqG+ws+wtO/pzN1SR9OtzheASFlt67VtOoRyeZZdaWZ/atqnzsa/z
         VJWN5Zl9E3ef+P6ofXXH2Pkk01jN6fycVTBsCTc0ic60IOKfw63D5xu+wYR8LT/1vSH7
         LLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVuDGIyN9+svo7tft42JxXSfRUY//wYJHcc5zCRcfXrinEpIhAvMDa1AHJMl25TWmMihSiM@lists.linux.dev
X-Gm-Message-State: AOJu0YzIpKSThidu8PftgUDHZEjzdNIsV/VgkTYaUfFr45rpsRh2b5eB
	PdH4MRbq5rKLoLBUAxHWt8y3kXZGlCiaLufYUbA9p7VimhBslaGN6cnI
X-Gm-Gg: ASbGncveTIGACFucsAOtrWQI+WfbwXSoZLdll7qz+4pPu5aZ7MxSrti6ktqno730l4n
	8Iuh4jrw6GOJ7XmAVwK5ZzFS+XjJSu5M9yiEm3qFH6h19V+GM5SltUmIO8JJ1UeBwyP23mnOfXl
	Kl6hGJsTtmHGtkQ3cNLKchMp3EtgPF1AZJKc17QmP/SrPvPDK42xpGGcOmuHC7iMxOIXE3h+3jX
	bHQIz7zTv0gPtGnE8t+Yq2DUuAjm1NTYAN9afqaXBcx8Dpjr1VwAEdqsWl3xhkxGZzs4iAWVBXt
	I8MKbqybt7xDGCcj6jTxQ1Y4rBu4k3Uf3/FMwg07kGsrcrUFJgmeurJFqKDetayeC2jjoCBpCLZ
	KHG4pgqwrACsCxWRoLEi5HCP1i67S7ZpjM7nSRXrqMRREuU2oCi5M
X-Google-Smtp-Source: AGHT+IEaKhNkzW0FbV9f70GZpEk7DuWFP3tTqujTO5SU7v0JJSU26+B+8T1tUhbIvgQO9vAEkRQw4A==
X-Received: by 2002:a05:6214:4f14:b0:6fa:edb8:b343 with SMTP id 6a1803df08f44-6fd387ec5b8mr75990336d6.2.1750821085027;
        Tue, 24 Jun 2025 20:11:25 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99efaa9sm567189785a.58.2025.06.24.20.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:24 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9CE32F40066;
	Tue, 24 Jun 2025 23:11:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 24 Jun 2025 23:11:23 -0400
X-ME-Sender: <xms:22hbaLUxtLizeeFIafMYrMGPO6_IUUROpxUeMU-9dXMgPpLVSv5-JQ>
    <xme:22hbaDnkM5oDjL7Fb72WmIxb1SAadqxuznNCFtw914xf2mbBqY4QqpIX-VBMDJXL5
    RbwiyXW6PFZNs0l8Q>
X-ME-Received: <xmr:22hbaHa6DxExEPIbPJ2_uMAz2a_Hw4xJHrsLKy0mV-dtHV6UMLmrzSfTAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    mhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvvg
    esshhtghholhgrsghsrdhnvght
X-ME-Proxy: <xmx:22hbaGXU4-JtYzfbe7cuBsHYKmE_1xV7XkWwHwwfiJ0JVw1rA7CSlA>
    <xmx:22hbaFnxM-vxVdj0pYO1Kgig0ovL9XbDKLHawDGt-k70AQw5LeYj1w>
    <xmx:22hbaDdV5vwCEe1RFQ5s0JQ_isQr0qpXEQmLRbcmtb5U3JJRmKoazQ>
    <xmx:22hbaPFD81Gef9jXtG6HTgG6fTqC8h8qsh_iZkeVYp6rvJyOD83f1Q>
    <xmx:22hbaHlAexzm1mL7loKjEe67Ld19d_IzmXP54NmhEH7thDh5YDmL9ehm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:23 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	aeh@meta.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	jhs@mojatatu.com,
	kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: [PATCH 0/8] Introduce simple hazard pointers for lockdep
Date: Tue, 24 Jun 2025 20:10:53 -0700
Message-Id: <20250625031101.12555-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the official first version of simple hazard pointers following
the RFC:

	https://lore.kernel.org/lkml/20250414060055.341516-1-boqun.feng@gmail.com/

I rebase it onto v6.16-rc3 and hope to get more feedback this time.

Thanks a lot for Breno Leitao to try the RFC out and share the numbers.

I did an extra comparison this time, between the shazptr solution and
the synchronize_rcu_expedited() solution. In my test, during a 100 times
"tc qdisc replace" run:

* IPI rate with the shazptr solution: ~14 per second per core.
* IPI rate with synchronize_rcu_expedited(): ~140 per second per core.

(IPI results were from the 'CAL' line in /proc/interrupt)

This shows that while both solutions have the similar speedup, shazptr
solution avoids the introduce of high IPI rate compared to
synchronize_rcu_expedited().

Feedback is welcome and please let know if there is any concern or
suggestion. Thanks!

Regards,
Boqun

--------------------------------------
Please find the old performance below:

On my system (a 96-cpu VMs), the results of:

	time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1: mq

are (with lockdep enabled):

	(without the patchset)
	real    0m1.039s
	user    0m0.001s
	sys     0m0.069s

	(with the patchset)
	real    0m0.053s
	user    0m0.000s
	sys     0m0.051s

i.e. almost 20x speed-up.

Other comparisons between RCU and shazptr, the rcuscale results (using
default configuration from
tools/testing/selftests/rcutorture/bin/kvm.sh):

RCU:

	Average grace-period duration: 7470.02 microseconds
	Minimum grace-period duration: 3981.6
	50th percentile grace-period duration: 6002.73
	90th percentile grace-period duration: 7008.93
	99th percentile grace-period duration: 10015
	Maximum grace-period duration: 142228

shazptr:

	Average grace-period duration: 0.845825 microseconds
	Minimum grace-period duration: 0.199
	50th percentile grace-period duration: 0.585
	90th percentile grace-period duration: 1.656
	99th percentile grace-period duration: 3.872
	Maximum grace-period duration: 3049.05

shazptr (skip_synchronize_self_scan=1, i.e. always let scan kthread to
wakeup):

	Average grace-period duration: 467.861 microseconds
	Minimum grace-period duration: 92.913
	50th percentile grace-period duration: 440.691
	90th percentile grace-period duration: 460.623
	99th percentile grace-period duration: 650.068
	Maximum grace-period duration: 5775.46

shazptr_wildcard (i.e. readers always use SHAZPTR_WILDCARD):

	Average grace-period duration: 599.569 microseconds
	Minimum grace-period duration: 1.432
	50th percentile grace-period duration: 582.631
	90th percentile grace-period duration: 781.704
	99th percentile grace-period duration: 1160.26
	Maximum grace-period duration: 6727.53

shazptr_wildcard (skip_synchronize_self_scan=1):

	Average grace-period duration: 460.466 microseconds
	Minimum grace-period duration: 303.546
	50th percentile grace-period duration: 424.334
	90th percentile grace-period duration: 482.637
	99th percentile grace-period duration: 600.214
	Maximum grace-period duration: 4126.94

Boqun Feng (8):
  Introduce simple hazard pointers
  shazptr: Add refscale test
  shazptr: Add refscale test for wildcard
  shazptr: Avoid synchronize_shaptr() busy waiting
  shazptr: Allow skip self scan in synchronize_shaptr()
  rcuscale: Allow rcu_scale_ops::get_gp_seq to be NULL
  rcuscale: Add tests for simple hazard pointers
  locking/lockdep: Use shazptr to protect the key hashlist

 include/linux/shazptr.h  |  73 +++++++++
 kernel/locking/Makefile  |   2 +-
 kernel/locking/lockdep.c |  11 +-
 kernel/locking/shazptr.c | 318 +++++++++++++++++++++++++++++++++++++++
 kernel/rcu/rcuscale.c    |  60 +++++++-
 kernel/rcu/refscale.c    |  77 ++++++++++
 6 files changed, 534 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/shazptr.h
 create mode 100644 kernel/locking/shazptr.c

-- 
2.39.5 (Apple Git-154)

