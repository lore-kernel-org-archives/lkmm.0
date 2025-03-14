Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BEA1F5420
	for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951261; cv=none; b=MRvNWHtiE6xncawhO0qhT+/teJodIzRofgEQVg7lLG1VrTtPbc52XtioIrKgyxE6HfMjd9xGsXxzRj+Vxf1/cxj11S1j+o1BhVPDndrOqU778Or9wPQrctDBa7Lj4HRP0453qOuRyITAJVoEYThGOvp64+tF8UrQxmMMuQinDxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951261; c=relaxed/simple;
	bh=hDpg3cPvJBrHdJU9q80ibbhvOZO48UsX3/MmT93KAuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxbMr0n3sNYSZ7Txc5RrMBgHQhnDTq/2resDLfQZM2NAKuSEAR7UQbThIjYxnqN8zHGSGwwkpRrJmryyi6kRf8IcE0u7igiECpXvwnkj8piu403ZnpdY4sn0ooExEUt2Gk7n+JIJ6JFxeiRfL/bDuiTBVnRDpkD1NPRZ7MvtBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrSNTeVq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrSNTeVq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224171d6826so48677995ad.3
        for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 04:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741951259; x=1742556059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCvCasS0JeqwKQShTIHvfUTGynEHpe4G3bIa66DP+aw=;
        b=BrSNTeVqw6OD+UC6HCI8MLYxxF6PFiHceWC+UFfIy+zuEnUBVENeUslRx7Ib4+kY+V
         758MlPCL9ZutNCeN432xzL1pePeQCz76+Q+vfQmH753whKEyNQxI3n7gVHZCRGyJfhbL
         3MT0uYaIzHZRKZKhjJgY7C5ktFqeq8FiE+xMjX0TeB38h9snkOdF4E+DTlKeBLwOUNCH
         gxfsY/a86MB4Lyor1jVNlnugVVg1btqxiva7uas1kzEYXDr4gMOF80CeAs1Zx0B3/SI1
         XyG/Q/oCB9But/fkPVEHBXjws2ksV4bLNU2NnOG+ex/LwUni/hTLW/BVEbyHcvc3tu50
         xnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951259; x=1742556059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCvCasS0JeqwKQShTIHvfUTGynEHpe4G3bIa66DP+aw=;
        b=CdrfIXlsngfwDUoivcrI49O8AraGilUp8/Wt/trCKoZYesUAvhlgjWIJtmdGp7ccSZ
         7GqBPs5gY9/N1N65QyW+V5gm64XhKyPrmufjQRVE+V7bJ+PEYd9WBmz5oR282BavaQUI
         ndUYFXPyOCcS/IEbjoMi8kEHIgxwfrNzJY06xDI6QsKUi3lm1JQ6jSjl2DNweT+4qvie
         junZyGthaZRRCCFg1TjCDim4oK2qFKL48oJG2NpNgwKzA4f/tNIcTFgT2bfCTnHgXdL4
         9QRo/sAcEIu3gYe640Cwdp1e7ckFpZg8qmQ1gMHqNVTGbsvja+LcEFjk+ayMdF4HGcdF
         PZzg==
X-Gm-Message-State: AOJu0YxAmVJXielcWa2k9oheuZ6wYTp9vaGnBC2CYSF51wWDYJFFmUct
	m/1a2Cx5kCwjlT9QiWUgyKjICvFI+YSbq7p2hCcVewPIlU2WTY5z
X-Gm-Gg: ASbGncsBZTfNedB0krtTKquJO5KvcHON7LSz0Rm0Pd7x3IMo0uGM4OEevAIdQQ/qILw
	BCvS6DwHa2Y4BVehLl8l3DDC60V/Y4gYmcRiiYR6GP9kyYjcTObhdH46bIL4sN66h5SbSpNKWX5
	8ZIVjcbXqAYKq0ohZA13SFtmVAfUiPcVfv0+9Zq3fh35JdT8xiYx1PdjbyvaihJIt0QzeDQ4RUb
	MLwWYKlw+q8hLcWpXQWsgjatTZRnYFldIW38zLE/NsdYO17fjVkX3MB2ADp6gQiVQCqMefRijma
	huDIjmXfATo6qmiLY/P8Yb/mtZkqnQ8KuRj+Lb9VA8aBgsl5U9MhzQCYLqj+cYuDF5/GpLAQeL/
	lqEx3lzK4BQmzgoqjm3Of2TLrOw==
X-Google-Smtp-Source: AGHT+IFXE/l8eU+Egs69shCDq4QAM3fZnrpjTty04tjN4x3OOfrENAKk55eZ1smHlDgJzsPtnenKHg==
X-Received: by 2002:a17:902:e5cb:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-225e0a62f94mr32849475ad.4.1741951258880;
        Fri, 14 Mar 2025 04:20:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688858asm26730935ad.46.2025.03.14.04.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:20:58 -0700 (PDT)
Message-ID: <e7390d0d-7157-4f9f-b8c9-6011cb6fae45@gmail.com>
Date: Fri, 14 Mar 2025 20:14:15 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] tools/memory-model: docs/ordering: Fix trivial typos
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
References: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix trivial typos including:

  - Repeated "a call to"
  - Inconsistent forms of referencing functions of rcu_dereference()
    and rcu_assign_pointer()
  - Past tense used in describing normal behavior

and other minor ones.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 tools/memory-model/Documentation/ordering.txt | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/memory-model/Documentation/ordering.txt b/tools/memory-model/Documentation/ordering.txt
index 9b0949d3f5ec..96587646d0cc 100644
--- a/tools/memory-model/Documentation/ordering.txt
+++ b/tools/memory-model/Documentation/ordering.txt
@@ -223,7 +223,7 @@ The Linux kernel's compiler barrier is barrier().  This primitive
 prohibits compiler code-motion optimizations that might move memory
 references across the point in the code containing the barrier(), but
 does not constrain hardware memory ordering.  For example, this can be
-used to prevent to compiler from moving code across an infinite loop:
+used to prevent the compiler from moving code across an infinite loop:
 
 	WRITE_ONCE(x, 1);
 	while (dontstop)
@@ -274,7 +274,7 @@ different pieces of the concurrent algorithm.  The variable stored to
 by the smp_store_release(), in this case "y", will normally be used in
 an acquire operation in other parts of the concurrent algorithm.
 
-To see the performance advantages, suppose that the above example read
+To see the performance advantages, suppose that the above example reads
 from "x" instead of writing to it.  Then an smp_wmb() could not guarantee
 ordering, and an smp_mb() would be needed instead:
 
@@ -394,17 +394,17 @@ from the value returned by the rcu_dereference() or srcu_dereference()
 to that subsequent memory access.
 
 A call to rcu_dereference() for a given RCU-protected pointer is
-usually paired with a call to a call to rcu_assign_pointer() for that
-same pointer in much the same way that a call to smp_load_acquire() is
-paired with a call to smp_store_release().  Calls to rcu_dereference()
-and rcu_assign_pointer are often buried in other APIs, for example,
+usually paired with a call to rcu_assign_pointer() for that same pointer
+in much the same way that a call to smp_load_acquire() is paired with
+a call to smp_store_release().  Calls to rcu_dereference() and
+rcu_assign_pointer() are often buried in other APIs, for example,
 the RCU list API members defined in include/linux/rculist.h.  For more
 information, please see the docbook headers in that file, the most
 recent LWN article on the RCU API (https://lwn.net/Articles/777036/),
 and of course the material in Documentation/RCU.
 
 If the pointer value is manipulated between the rcu_dereference()
-that returned it and a later dereference(), please read
+that returned it and a later rcu_dereference(), please read
 Documentation/RCU/rcu_dereference.rst.  It can also be quite helpful to
 review uses in the Linux kernel.
 
@@ -457,7 +457,7 @@ described earlier in this document.
 These operations come in three categories:
 
 o	Marked writes, such as WRITE_ONCE() and atomic_set().  These
-	primitives required the compiler to emit the corresponding store
+	primitives requires the compiler to emit the corresponding store
 	instructions in the expected execution order, thus suppressing
 	a number of destructive optimizations.	However, they provide no
 	hardware ordering guarantees, and in fact many CPUs will happily
@@ -465,7 +465,7 @@ o	Marked writes, such as WRITE_ONCE() and atomic_set().  These
 	operations, unless these operations are to the same variable.
 
 o	Marked reads, such as READ_ONCE() and atomic_read().  These
-	primitives required the compiler to emit the corresponding load
+	primitives requires the compiler to emit the corresponding load
 	instructions in the expected execution order, thus suppressing
 	a number of destructive optimizations.	However, they provide no
 	hardware ordering guarantees, and in fact many CPUs will happily
@@ -506,7 +506,7 @@ of the old value and the new value.
 
 Unmarked C-language accesses are unordered, and are also subject to
 any number of compiler optimizations, many of which can break your
-concurrent code.  It is possible to used unmarked C-language accesses for
+concurrent code.  It is possible to use unmarked C-language accesses for
 shared variables that are subject to concurrent access, but great care
 is required on an ongoing basis.  The compiler-constraining barrier()
 primitive can be helpful, as can the various ordering primitives discussed
-- 
2.34.1


