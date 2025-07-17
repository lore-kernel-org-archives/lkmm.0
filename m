Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D493277CB0
	for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 08:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752739622; cv=none; b=gl8Y7lbGuHfucAhb2E2mccLwe6SOms2OTa6iB26uNVl5I6jcnkPdy4z22WvwexzYXFptN0nYNLe0FO0yOYQ4+7oF++x4/kVGnq3xq+6UymNXxfFoBKVnv+pJes91Wla2mHsHu1XJzFM1S6SSHk2inBycF5N5gL/PlTR1PjzVjXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752739622; c=relaxed/simple;
	bh=U3rEHkMFDVqeYNM1YK+WP0qvm2uVyLOr+spTs97POZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFqOB3SaRkNbl7FKj2pmzgtiJ+IMYeWDlJ+M35/SJjkFYSkSBhp7FDqw3PnCLe0Mzo/4MPJhHMb3hGVR8xbK8c67f2un63ikS61vET6BwRStqwria216tI7m5mUus3s2JeIqQlH9lSO7pORVc5cZvuBVNUAceCexBEJFZK5OuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yq04ufnE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yq04ufnE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234bfe37cccso5311745ad.0
        for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752739621; x=1753344421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tsmt0+LF0mgELoIzcxHsmAHqp6eKZ3MWd8Pt639i0Q=;
        b=Yq04ufnEDprHsN0gsdjeKadbEZ7uHNwxIWhDkaqXTeg30sE/Cpx3Bnge7CtHH4jauR
         9xPfrV58VwmC2NlGYJE0aRCoELpS187r1G/W3qds1YECMEL2gBYwCpgcmj/OTi/kDVp2
         LB1cBoCNELb064udwVM/Pcpbbpz2ndHHdpkpOXwmQS6UMwLyQHbD3GYLQ8NkKPukzzC8
         Hzc+g5c1eV/fLye7ajilIkTJCsWHMCe77JKrZJtMDRxknoqP7riiPBYrEIIeoiltRyUu
         zsnf3o2e6FfyQnjos+HmPNxNreQRUqSPNA6NxPv+9NC+oM79qQnBkI6J/1nBhspwjL8/
         iT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752739621; x=1753344421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tsmt0+LF0mgELoIzcxHsmAHqp6eKZ3MWd8Pt639i0Q=;
        b=vhxCGtwRy2PVPQoFnQKAGnolXP5A2HYPry/lPRAUJU7HGcKux9KbQLcTDMt5iGhA9+
         PiQtnDsq9KeH214G6Ut8+nMnd6LlOTCVe1HtjI9AXVaj2/XldHeOj1XBvSJ6CEqJcX1L
         KieyzN7fuKL02ghFQoxwPC237QXv+RTgpphzcxX7Uo0A3e/HpufXkkOUmGXh24UMJZ9f
         EhoSJEJhNkwHhhqfDDWzHT75SJFOBU59Z3IjCTn58OWlBUgmqk2SGH3AatE/3BTLPwVc
         +GyKN/jqXw2pgF5KP/f8zPuPhX1D7ROGmBL4sv8k/p6zigotbHPqnwK83yyTu3/TZAce
         60Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVgzDGGrQAnE6bwA+hVrvqNQDYUUQqFA5UHgWoVaRqmNBD5K98QsskoZkajnkTrwvJRWH7A@lists.linux.dev
X-Gm-Message-State: AOJu0YwdY4wRVOTXxsXiKOOl13U9L6teNVR/aWP+IZFWzB3fVBsWCinx
	8LxZmvgb0WdheqYa7BrUJx4Y4Mhgly8BzxZp/aiJ3ID/WKa7itvlTg4G
X-Gm-Gg: ASbGnctqBKtonUUJJoYfFL7g/H4uo5/JAUEgFjFNyzrAQ9NZ0jyB8B1OYf1lYwSbjWV
	HD76w717yTebqIgjFejWcirQObuRBNy0LBOy8CBY0GpjimzTteFBsy4ShR6s782ieWNmNKXI7/t
	ORnlaZ2ly3YITrtqt+k16HJCvHVNpf37DNwX/sQbX/eps2nv71AAP6eqDeLZml0NiWhD8AHWk1Z
	ZaNlZuLJX84JK7hIWm6OvSwAf4/TESVRFNOK1yU9okZfwodVoOxEWguRvrWdyoSijzOJZr0fDRe
	soNZRLzgdMYRAkKYIatBOi+IeqT+77vgvBdtkKaiBwBhto1kHTR5yN9cXfG6fdrPltaYY66wA33
	Eic/zjnpZ8p+ZiYOhDJ5+3Q==
X-Google-Smtp-Source: AGHT+IFDRHT5gKk69iHNgFOk4RqIEj9LmjlaBFo7IYhVrJNGWIeWcgsmkpyoZXnBkXuTx/sDripipA==
X-Received: by 2002:a17:902:fc43:b0:234:f15b:f158 with SMTP id d9443c01a7336-23e24ed60f5mr73096245ad.13.1752739620354;
        Thu, 17 Jul 2025 01:07:00 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e527sm142131915ad.187.2025.07.17.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 01:06:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E0828401640C; Thu, 17 Jul 2025 15:06:53 +0700 (WIB)
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
Subject: [PATCH 2/4] Documentation: atomic_bitops: Convert to reST format
Date: Thu, 17 Jul 2025 15:06:15 +0700
Message-ID: <20250717080617.35577-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717080617.35577-1-bagasdotme@gmail.com>
References: <20250717080617.35577-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3923; i=bagasdotme@gmail.com; h=from:subject; bh=U3rEHkMFDVqeYNM1YK+WP0qvm2uVyLOr+spTs97POZ4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkVa5MTHyX29kj/kI2qCgg0q/lUFHmwhit6pT9jlmLez YUFX+d1lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCIp1xgZVvSb3tv6Zh3vIYZL 82sr7tezqahkng65dqrq902+n6fe7WNkOLPqpLfAjdMMlme+n+0JF5yQ7jrL5c61eUlnF5yfMm/ CXQYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Convert atomic bitops documentation to reST syntax:

* Sentence-case headings
* List API functions and their semantics in bullet list

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../atomic_bitops.rst}                        | 39 +++++++++----------
 Documentation/core-api/index.rst              |  2 +-
 .../core-api/wrappers/atomic_bitops.rst       | 18 ---------
 3 files changed, 20 insertions(+), 39 deletions(-)
 rename Documentation/{atomic_bitops.txt => core-api/atomic_bitops.rst} (60%)
 delete mode 100644 Documentation/core-api/wrappers/atomic_bitops.rst

diff --git a/Documentation/atomic_bitops.txt b/Documentation/core-api/atomic_bitops.rst
similarity index 60%
rename from Documentation/atomic_bitops.txt
rename to Documentation/core-api/atomic_bitops.rst
index edea4656c5c05f..b93c388fd9bdc4 100644
--- a/Documentation/atomic_bitops.txt
+++ b/Documentation/core-api/atomic_bitops.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =============
 Atomic bitops
 =============
@@ -11,53 +13,50 @@ API
 
 The single bit operations are:
 
-Non-RMW ops:
+* Non-RMW ops:
 
-  test_bit()
+  * test_bit()
 
-RMW atomic operations without return value:
+* RMW atomic operations without return value:
 
-  {set,clear,change}_bit()
-  clear_bit_unlock()
+  * {set,clear,change}_bit()
+  * clear_bit_unlock()
 
-RMW atomic operations with return value:
+* RMW atomic operations with return value:
 
-  test_and_{set,clear,change}_bit()
-  test_and_set_bit_lock()
+  * test_and_{set,clear,change}_bit()
+  * test_and_set_bit_lock()
 
-Barriers:
+* Barriers:
 
-  smp_mb__{before,after}_atomic()
+  * smp_mb__{before,after}_atomic()
 
 
 All RMW atomic operations have a '__' prefixed variant which is non-atomic.
 
 
-SEMANTICS
+Semantics
 ---------
 
-Non-atomic ops:
+* Non-atomic ops:
 
-In particular __clear_bit_unlock() suffers the same issue as atomic_set(),
-which is why the generic version maps to clear_bit_unlock(), see atomic_t.txt.
+  In particular __clear_bit_unlock() suffers the same issue as atomic_set(),
+  which is why the generic version maps to clear_bit_unlock(), see atomic_t.txt.
 
 
-RMW ops:
+* RMW ops:
 
-The test_and_{}_bit() operations return the original value of the bit.
+  The test_and_{}_bit() operations return the original value of the bit.
 
 
-ORDERING
+Ordering
 --------
 
 Like with atomic_t, the rule of thumb is:
 
  - non-RMW operations are unordered;
-
  - RMW operations that have no return value are unordered;
-
  - RMW operations that have a return value are fully ordered.
-
  - RMW operations that are conditional are fully ordered.
 
 Except for a successful test_and_set_bit_lock() which has ACQUIRE semantics,
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index a0c3749c655b05..4bc132fefaab7f 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -49,7 +49,7 @@ Library functionality that is used throughout the kernel.
    timekeeping
    errseq
    wrappers/atomic_t
-   wrappers/atomic_bitops
+   atomic_bitops
    floating-point
    union_find
    min_heap
diff --git a/Documentation/core-api/wrappers/atomic_bitops.rst b/Documentation/core-api/wrappers/atomic_bitops.rst
deleted file mode 100644
index bf24e4081a8f4c..00000000000000
--- a/Documentation/core-api/wrappers/atomic_bitops.rst
+++ /dev/null
@@ -1,18 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-   This is a simple wrapper to bring atomic_bitops.txt into the RST world
-   until such a time as that file can be converted directly.
-
-=============
-Atomic bitops
-=============
-
-.. raw:: latex
-
-    \footnotesize
-
-.. include:: ../../atomic_bitops.txt
-   :literal:
-
-.. raw:: latex
-
-    \normalsize
-- 
An old man doll... just what I always wanted! - Clara

