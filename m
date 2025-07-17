Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFC279347
	for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752739624; cv=none; b=oCb5x9xMcd8LQZXy8TktaKpgyxR3zR7oQ3S6Sc5HU5gzWpMQ8+4uMz+ZH7GgfErSx0LULp4ABbuRG0/Yx66L9+ghx+dNliBrAsQhZ+jla0xlZlwYBVcoVTTwJjhoAztZvgPd99+0YJ062EcI9B/b+Zoyqrgo4PfBD71T9hoTBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752739624; c=relaxed/simple;
	bh=pX2EcTfO2rVRCOehEfwLbnYVPG97ExZcriLomj9cUw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLOOktc2dcvaqKMt/yzO4ObuZzn+zlRuLY5maltdmitRDkJoU1Q+BXz7qKTW5ESIKgYkobHj1BajR6Iqdzv/f+UztYLdMc+90FqfhBFpoLN5z8mZ/AcuHmHgRfUa0IvIM2YSIK3dnq2y15afzZeybCPtWKGCycFvzcfFy0WBCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDgUo5sR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDgUo5sR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so757548b3a.1
        for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 01:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752739622; x=1753344422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im5kVo3zSpTE/DJNANRWfM6LSaXoUCrNcMb0usGbVWE=;
        b=XDgUo5sRKPU5+/bl4QNztapaSk/vfwPt3E/JeimB0AnDiQalFPZnzlDrNrVNoH5Heo
         jUnGQigRcAnvO4Qkvt7zxB9mwPDYuze0ViEZlCre4ScR/QDyujIsQgbOQPPWNddPncR9
         GPSxLslOWpyN4uuOR87kpw5Y6fvWEe5uIuu3fvOq4GHh+mnv3AxqR8RfwH7iGw34+4u7
         jFwuu8sXcVUs9Q7IjiWBsOVwFsYI35N/hzySHizgEMkRQ6XuB1th0AGZ9VGfpSnPhzEi
         8pK74lgQkIJdfm/ZY/bc3PG803fnU/vg1eQppYKB7G1zHe7FcaoPF9cIQq/F62zRVna4
         TG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752739622; x=1753344422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=im5kVo3zSpTE/DJNANRWfM6LSaXoUCrNcMb0usGbVWE=;
        b=cdpWFEFrJDCWZNCOQMf2Kgz+xU8CRe5f4zmC9K88acVvk9ch6J6xlAO7m+CEiql18J
         JDsMY7ZJzXa8e+NyQUCvsLv8WDGGP9V1syf7Lp8WLKKgM50OppR9gbigbdwMEQA9czrQ
         h+MBic1ywh/xyPmoymL59p7qAoOj4NEyS4uubvAsIHB3QUMRV1rvv0gIEhURuCWy4MuP
         GOw6YWIngP+NINaXyfVgmCxnvwtK4zOt4F+Vckgtk4wxiaDzIAT+RsEHpQppXa5IQ9jc
         HrYekNKXhQ07fEU6Q0lDuPNG7nrQDpimLxLeeU1/vMitzM9RcsE7llotJo/2OkEsWbGk
         SRRw==
X-Forwarded-Encrypted: i=1; AJvYcCUXacbqGz2PX3EVgSfDtKN7/oepyYZ/CVCMw3RPIgO6nZ1cKVtPBxiYREMXAJjTvUJ27zPx@lists.linux.dev
X-Gm-Message-State: AOJu0YyroNHGveP+8RIEx44eomuPsCzva1ANMgCYfFjkd85e37U1eEGh
	2f/t33ubSEffURSp6m2kt3FM97ImC3Nt9J8b7iBBCWOmCNnHwPl8XDTw
X-Gm-Gg: ASbGnctitoqaIGdmiHfjyK3iLE6hzDP5GEaOGb6TyI1zG+AJ39UipUkokI88PjATYKs
	FGHnUricBsgQA9huXUuIwpNEwoSFoAinjniJqMQzEcdKx3IZGWFOHVnkhT4DiwaYWfUlwPPEIoy
	N/Cqc7yS/hIR1uZC6+NtNInDW6NGiOOWuLYIdcXDjxpTPKGud2jGfn81kJjktClqgMMtHeV4EKK
	0gJhHhBnWg+gTasmmTnvdGbEs5W5w6RoQMzzPjqPUynpb3eVyYx1clqW1epAV6si48SA/EcmBur
	E26novMtpq6jTx+6btRAFW54CmjPhUbNaj2V0My9mJ1YvpJBNHMmnoIzA1YuEpweebDlVpDNsEi
	+Xf/gKLmDLe6VubQHawpD2w==
X-Google-Smtp-Source: AGHT+IE08tSUk8BSkHFbd4EGRS/BqZYs0+NRXRJzu2DZCsZqn5s44suw+fSLDKaq/HOZ137Bw55IqA==
X-Received: by 2002:a05:6a21:329d:b0:234:21aa:b538 with SMTP id adf61e73a8af0-2390c744e99mr3819001637.1.1752739622119;
        Thu, 17 Jul 2025 01:07:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4c9c4sm15629003b3a.126.2025.07.17.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 01:06:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 856104225A33; Thu, 17 Jul 2025 15:06:53 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux RCU <rcu@vger.kernel.org>,
	Linux CPU Architectures Development <linux-arch@vger.kernel.org>,
	Linux LKMM <lkmm@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xavier <xavier_qy@163.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/4] Convert atomic_*.txt and memory-barriers.txt to reST
Date: Thu, 17 Jul 2025 15:06:13 +0700
Message-ID: <20250717080617.35577-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=bagasdotme@gmail.com; h=from:subject; bh=pX2EcTfO2rVRCOehEfwLbnYVPG97ExZcriLomj9cUw0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkVa2M/tu4s3Xpl4sbdZkmuW5Qqp9kEnCyP9S1w2WXJs U2L9V5sRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACYyNYDhf62nQ93kRfOvPbKN OMnziueC1RTZmFdnGl9cyH//c3r+hK+MDI8L1Bt0UudIP/yqzsbAcrghOLhiuUrjAw4zvpX9K59 MZgMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Atomic types, atomic bitops, and memory barriers docs are included in kernel
docs build since commit e40573a43d163a ("docs: put atomic*.txt and
memory-barriers.txt into the core-api book") as a wrapper stub for
corresponding uncoverted txt docs. Let's turn them into full-fledged reST docs. 

Bagas Sanjaya (4):
  Documentation: memory-barriers: Convert to reST format
  Documentation: atomic_bitops: Convert to reST format
  Documentation: atomic_t: Convert to reST format
  Documentation: atomic_bitops, atomic_t, memory-barriers: Link to
    newly-converted docs

 Documentation/RCU/rcu_dereference.rst         |    2 +-
 .../atomic_bitops.rst}                        |   43 +-
 .../{atomic_t.txt => core-api/atomic_t.rst}   |  211 ++-
 Documentation/core-api/circular-buffers.rst   |    4 +-
 Documentation/core-api/index.rst              |    6 +-
 .../memory-barriers.rst}                      | 1594 +++++++++--------
 Documentation/core-api/refcount-vs-atomic.rst |    5 +-
 .../core-api/wrappers/atomic_bitops.rst       |   18 -
 Documentation/core-api/wrappers/atomic_t.rst  |   19 -
 .../core-api/wrappers/memory-barriers.rst     |   18 -
 Documentation/driver-api/device-io.rst        |    4 +-
 Documentation/locking/spinlocks.rst           |    5 +-
 Documentation/virt/kvm/vcpu-requests.rst      |    4 +-
 13 files changed, 1000 insertions(+), 933 deletions(-)
 rename Documentation/{atomic_bitops.txt => core-api/atomic_bitops.rst} (54%)
 rename Documentation/{atomic_t.txt => core-api/atomic_t.rst} (67%)
 rename Documentation/{memory-barriers.txt => core-api/memory-barriers.rst} (67%)
 delete mode 100644 Documentation/core-api/wrappers/atomic_bitops.rst
 delete mode 100644 Documentation/core-api/wrappers/atomic_t.rst
 delete mode 100644 Documentation/core-api/wrappers/memory-barriers.rst


base-commit: cae58415830f326822593ec01deebe5fdaeb33a2
-- 
An old man doll... just what I always wanted! - Clara

