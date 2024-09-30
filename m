Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72418DF80
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693900; cv=none; b=IE0sJ4GheHo2euUtQk3PPVGwps+z9taNtVYC4bs7ZyzcbevNmH0tBue7TTEC9b+OwTveZaBKfRitghRldk5RhAU/of8uj3yT+3/uOfW4hel6Kc2BG3vDNE8wcKT4lZaBSGeFZF0FWWmKjYEVHpKooInbC1pvQMwPk9gVMGTwZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693900; c=relaxed/simple;
	bh=egXyVxlCp7V+BcMGAwfT8yfxThhwzBbOhSpZAw68HRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P7a5UmLbJZkidjFHD7iqB1nqiYuh01Gm3WCN3/AwpaD1F5a+MifxR77+/909pZHiO/dvH/QuvlinCML+HkHWj8h1nFNO8EIatXZs5i54kbbSSsPlI6KYB2FxAnbjB+bECEXYkqckJ2XS/MX7HqO7P+CIdNQddQP5LLjnh9yVFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.29])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4XHHSv4GYqz9v7JM
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 18:32:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id E40D61402A4
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 18:58:10 +0800 (CST)
Received: from huaweicloud.com (unknown [10.206.133.88])
	by APP1 (Coremail) with SMTP id LxC2BwAHmC8OhPpmdITtAQ--.60189S6;
	Mon, 30 Sep 2024 11:58:10 +0100 (CET)
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
To: paulmck@kernel.org
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joel@joelfernandes.org,
	urezki@gmail.com,
	quic_neeraju@quicinc.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Subject: [PATCH v4 4/5] tools/memory-model: Switch to softcoded herd7 tags
Date: Mon, 30 Sep 2024 12:57:09 +0200
Message-Id: <20240930105710.383284-5-jonas.oberhauser@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
References: <20240930105710.383284-1-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwAHmC8OhPpmdITtAQ--.60189S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWxCF17ury3Xw45tr4UXFb_yoW3WrWrpr
	sxXrZrtr4UXw1UA3ykJr4UC3WrWw40y3yUGr1vyryrZr12krs8A3W8Jr1vqFyUJry8Kw48
	Xr12gFyjkr1UJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
	cSsGvfC2KfnxnUUI43ZEXa7sRiHUDtUUUUU==
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/

A new version of herd7 provides a -lkmmv2 switch which overrides the old herd7
behavior of simply ignoring any softcoded tags in the .def and .bell files. We
port LKMM to this version of herd7 by providing the switch in linux-kernel.cfg
and reporting an error if the LKMM is used without this switch.

To preserve the semantics of LKMM, we also softcode the Noreturn tag on atomic
RMW which do not return a value and define atomic_add_unless with an Mb tag in
linux-kernel.def.

We update the herd-representation.txt accordingly and clarify some of the
resulting combinations.

(To be) Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
---
 .../Documentation/herd-representation.txt     | 27 ++++++++++---------
 tools/memory-model/README                     |  2 +-
 tools/memory-model/linux-kernel.bell          |  3 +++
 tools/memory-model/linux-kernel.cfg           |  1 +
 tools/memory-model/linux-kernel.def           | 18 +++++++------
 5 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/tools/memory-model/Documentation/herd-representation.txt b/tools/memory-model/Documentation/herd-representation.txt
index ed988906f2b7..7ae1ff3d3769 100644
--- a/tools/memory-model/Documentation/herd-representation.txt
+++ b/tools/memory-model/Documentation/herd-representation.txt
@@ -18,6 +18,11 @@
 #
 # By convention, a blank line in a cell means "same as the preceding line".
 #
+# Note that the syntactic representation does not always match the sets and
+# relations in linux-kernel.cat, due to redefinitions in linux-kernel.bell and
+# lock.cat. For example, the po link between LKR and LKW is upgraded to an rmw
+# link, and W[acquire] are not included in the Acquire set.
+#
 # Disclaimer.  The table includes representations of "add" and "and" operations;
 # corresponding/identical representations of "sub", "inc", "dec" and "or", "xor",
 # "andnot" operations are omitted.
@@ -60,14 +65,13 @@
     ------------------------------------------------------------------------------
     |       RMW ops w/o return value |                                           |
     ------------------------------------------------------------------------------
-    |                     atomic_add | R*[noreturn] ->rmw W*[once]               |
+    |                     atomic_add | R*[noreturn] ->rmw W*[noreturn]           |
     |                     atomic_and |                                           |
     |                      spin_lock | LKR ->po LKW                              |
     ------------------------------------------------------------------------------
     |        RMW ops w/ return value |                                           |
     ------------------------------------------------------------------------------
-    |              atomic_add_return | F[mb] ->po R*[once]                       |
-    |                                |     ->rmw W*[once] ->po F[mb]             |
+    |              atomic_add_return | R*[mb] ->rmw W*[mb]                       |
     |               atomic_fetch_add |                                           |
     |               atomic_fetch_and |                                           |
     |                    atomic_xchg |                                           |
@@ -79,13 +83,13 @@
     |            atomic_xchg_relaxed |                                           |
     |                   xchg_relaxed |                                           |
     |    atomic_add_negative_relaxed |                                           |
-    |      atomic_add_return_acquire | R*[acquire] ->rmw W*[once]                |
+    |      atomic_add_return_acquire | R*[acquire] ->rmw W*[acquire]             |
     |       atomic_fetch_add_acquire |                                           |
     |       atomic_fetch_and_acquire |                                           |
     |            atomic_xchg_acquire |                                           |
     |                   xchg_acquire |                                           |
     |    atomic_add_negative_acquire |                                           |
-    |      atomic_add_return_release | R*[once] ->rmw W*[release]                |
+    |      atomic_add_return_release | R*[release] ->rmw W*[release]             |
     |       atomic_fetch_add_release |                                           |
     |       atomic_fetch_and_release |                                           |
     |            atomic_xchg_release |                                           |
@@ -94,17 +98,16 @@
     ------------------------------------------------------------------------------
     |            Conditional RMW ops |                                           |
     ------------------------------------------------------------------------------
-    |                 atomic_cmpxchg | On success: F[mb] ->po R*[once]           |
-    |                                |                 ->rmw W*[once] ->po F[mb] |
-    |                                | On failure: R*[once]                      |
+    |                 atomic_cmpxchg | On success: R*[mb] ->rmw W*[mb]           |
+    |                                | On failure: R*[mb]                        |
     |                        cmpxchg |                                           |
     |              atomic_add_unless |                                           |
     |         atomic_cmpxchg_relaxed | On success: R*[once] ->rmw W*[once]       |
     |                                | On failure: R*[once]                      |
-    |         atomic_cmpxchg_acquire | On success: R*[acquire] ->rmw W*[once]    |
-    |                                | On failure: R*[once]                      |
-    |         atomic_cmpxchg_release | On success: R*[once] ->rmw W*[release]    |
-    |                                | On failure: R*[once]                      |
+    |         atomic_cmpxchg_acquire | On success: R*[acquire] ->rmw W*[acquire] |
+    |                                | On failure: R*[acquire]                   |
+    |         atomic_cmpxchg_release | On success: R*[release] ->rmw W*[release] |
+    |                                | On failure: R*[release]                   |
     |                   spin_trylock | On success: LKR ->po LKW                  |
     |                                | On failure: LF                            |
     ------------------------------------------------------------------------------
diff --git a/tools/memory-model/README b/tools/memory-model/README
index dab38904206a..59bc15edeb8a 100644
--- a/tools/memory-model/README
+++ b/tools/memory-model/README
@@ -20,7 +20,7 @@ that litmus test to be exercised within the Linux kernel.
 REQUIREMENTS
 ============
 
-Version 7.52 or higher of the "herd7" and "klitmus7" tools must be
+Version 7.58 or higher of the "herd7" and "klitmus7" tools must be
 downloaded separately:
 
   https://github.com/herd/herdtools7
diff --git a/tools/memory-model/linux-kernel.bell b/tools/memory-model/linux-kernel.bell
index 7c9ae48b9437..8ae47545df97 100644
--- a/tools/memory-model/linux-kernel.bell
+++ b/tools/memory-model/linux-kernel.bell
@@ -94,3 +94,6 @@ let carry-dep = (data ; [~ Srcu-unlock] ; rfi)*
 let addr = carry-dep ; addr
 let ctrl = carry-dep ; ctrl
 let data = carry-dep ; data
+
+flag ~empty (if "lkmmv2" then 0 else _)
+  as this-model-requires-variant-higher-than-lkmmv1
diff --git a/tools/memory-model/linux-kernel.cfg b/tools/memory-model/linux-kernel.cfg
index 3c8098e99f41..69b04f3aad73 100644
--- a/tools/memory-model/linux-kernel.cfg
+++ b/tools/memory-model/linux-kernel.cfg
@@ -1,6 +1,7 @@
 macros linux-kernel.def
 bell linux-kernel.bell
 model linux-kernel.cat
+variant lkmmv2
 graph columns
 squished true
 showevents noregs
diff --git a/tools/memory-model/linux-kernel.def b/tools/memory-model/linux-kernel.def
index a12b96c547b7..d7279a357cba 100644
--- a/tools/memory-model/linux-kernel.def
+++ b/tools/memory-model/linux-kernel.def
@@ -63,14 +63,14 @@ atomic_set(X,V) { WRITE_ONCE(*X,V); }
 atomic_read_acquire(X) smp_load_acquire(X)
 atomic_set_release(X,V) { smp_store_release(X,V); }
 
-atomic_add(V,X) { __atomic_op(X,+,V); }
-atomic_sub(V,X) { __atomic_op(X,-,V); }
-atomic_and(V,X) { __atomic_op(X,&,V); }
-atomic_or(V,X)  { __atomic_op(X,|,V); }
-atomic_xor(V,X) { __atomic_op(X,^,V); }
-atomic_inc(X)   { __atomic_op(X,+,1); }
-atomic_dec(X)   { __atomic_op(X,-,1); }
-atomic_andnot(V,X) { __atomic_op(X,&~,V); }
+atomic_add(V,X) { __atomic_op{noreturn}(X,+,V); }
+atomic_sub(V,X) { __atomic_op{noreturn}(X,-,V); }
+atomic_and(V,X) { __atomic_op{noreturn}(X,&,V); }
+atomic_or(V,X)  { __atomic_op{noreturn}(X,|,V); }
+atomic_xor(V,X) { __atomic_op{noreturn}(X,^,V); }
+atomic_inc(X)   { __atomic_op{noreturn}(X,+,1); }
+atomic_dec(X)   { __atomic_op{noreturn}(X,-,1); }
+atomic_andnot(V,X) { __atomic_op{noreturn}(X,&~,V); }
 
 atomic_add_return(V,X) __atomic_op_return{mb}(X,+,V)
 atomic_add_return_relaxed(V,X) __atomic_op_return{once}(X,+,V)
@@ -144,3 +144,5 @@ atomic_fetch_andnot(V,X) __atomic_fetch_op{mb}(X,&~,V)
 atomic_fetch_andnot_acquire(V,X) __atomic_fetch_op{acquire}(X,&~,V)
 atomic_fetch_andnot_release(V,X) __atomic_fetch_op{release}(X,&~,V)
 atomic_fetch_andnot_relaxed(V,X) __atomic_fetch_op{once}(X,&~,V)
+
+atomic_add_unless(X,V,W) __atomic_add_unless{mb}(X,V,W)
-- 
2.34.1

