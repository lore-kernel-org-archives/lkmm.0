Received: from frasgout12.his.huawei.com (frasgout12.his.huawei.com [14.137.139.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11411DF725
	for <lkmm@lists.linux.dev>; Mon,  6 Jan 2025 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200724; cv=none; b=e26PiDdwcuX/n9LjCxzxeKhwh2qyRaUkv+VEv8NYxjRy6/wEjBlEDXFNO+bXzlZxwVlvwfl/anAjUkdE9TfEdIkvkumS8WzqFbsROqopxqizHPxkRZVrqs/FPkcI/RiagIapVnQiggKHtntvBs+sklgQscCQuvGjwaQ9HGVeleM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200724; c=relaxed/simple;
	bh=ty5J6/w9vucBelY7qtCoceSmLa3h239wEBd5f7xhoI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UASJOg0/Xmoygto7J+Ci8UcIgLMJqayVt4QTbckfGc7VBbtIziY8zuOojvQcy8WUWEF0HDzoEnIeamenOa/2GRB2pL+ju4jJNYFEkh+34dKPYxSHGCfcLroL8KXIBa6wLijn7SH+k13lur3PWom1plDNkTL/38Gk4vjpUl6FmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4YRn1V3QWDz9v7JM
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 05:11:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 17BD5140410
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 05:40:25 +0800 (CST)
Received: from huaweicloud.com (unknown [10.206.133.88])
	by APP2 (Coremail) with SMTP id GxC2BwD3reC6TXxnNigoAA--.22570S2;
	Mon, 06 Jan 2025 22:40:24 +0100 (CET)
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
Subject: [RFC] tools/memory-model: Rule out OOTA
Date: Mon,  6 Jan 2025 22:40:03 +0100
Message-Id: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwD3reC6TXxnNigoAA--.22570S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF18KF4xAr13tr15CFyxGrg_yoW7tw18pr
	Z8Ka45Ka1DZrsavwn7Gws7ZFy8Z3ykJF15GryvkryUuw15W34Fyr1xtry5ZFy3CF4S9ayY
	qrWYvr98uwn8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/

The current LKMM allows out-of-thin-air (OOTA), as evidenced in the following
example shared on this list a few years ago:

  P0(int *a, int *b, int *x, int *y) {
  	int r1;

  	r1 = READ_ONCE(*x);
  	smp_rmb();
  	if (r1 == 1) {
  		*a = *b;
  	}
  	smp_wmb();
  	WRITE_ONCE(*y, 1);
  }

  P1(int *a, int *b, int *x, int *y) {
  	int r1;

  	r1 = READ_ONCE(*y);
  	smp_rmb();
  	if (r1 == 1) {
  		*b = *a;
  	}
  	smp_wmb();
  	WRITE_ONCE(*x, 1);
  }

  exists b=42

The root cause is an interplay between plain accesses and rw-fences, i.e.,
smp_rmb() and smp_wmb(): while smp_rmb() and smp_wmb() provide sufficient
ordering for plain accesses to rule out data races, they do not in the current
formalization generally actually order the plain accesses, allowing, e.g., the
load and stores to *b to proceed in any order even if P1 reads from P0; and in
particular, the marked accesses around those plain accesses are also not
ordered, which causes this OOTA.

In this patch, we choose the rather conservative approach of forcing only the
order of these marked accesses, specifically, when a marked read r is
separated from a plain read r' by an smp_rmb() (or r' has an address
dependency on r or is r'), on which a write w' depends, and w' is either plain
and seperated by a subsequent write w by an smp_wmb() (or w' is w), then r
precedes w in ppo.

Furthermore, we do not force any order in cases where r or w could be elided
due to a store with the same address either being before the read (which would
allow r to be substituted for the value of the store) or after the write
(which would allow w to be dropped).

Even though this patch is conservative in this sense, it ensures general
OOTA-freedom, more specifically, that any execution with no data race will not
have any cycles of

      (ctrl | addr | data) ; rfe

This definition of OOTA is much weaker than more standard definitions, such as
requiring that there are no cycles of

      ctrl | addr | data | rf

These definitions work well for syntactic dependencies (hardware models) but not
semantic dependencies (language models, like LKMM).

We first discuss why the more standard definition does not work well for
language models like LKMM. For example, consider

    r1 = *a;
    *b = 1;
    if (*a == 1)
      *b = 1;
    *c = *b;

In the execution where r1 == 1, there is a control dependency from
the load of *a to the second store to *b, from which the load to *b reads,
and the store to *c has a data dependency on this load from *b. Nevertheless
there is no semantic dependency from the load of *a to the store to *c; the
compiler could easily replace the last line with *c = 1 and move this line to
the top as follows:

    *c = 1;
    r1 = *a;
    *b = 1;

Since there is no order imposed by this sequence of syntactic dependencies
and reads, syntactic dependencies can not by themselves form an acyclic
relation.

In turn, there are some sequences of syntactic dependencies and reads that do
form semantic dependencies, such as

    r1 = *a;
    *b = 2;
    if (*a == 1)
      *b = 1;
    *c = *b;

Here we would consider that the store to *c has a semantic data dependency on
the read from *a, given that depending on the result of that read, we store
either the value 1 or 2 to *c.

Unfortunately, herd7 is currently limited to syntactic dependencies and can
not distinguish these two programs. As a result, while our patch is intended
to provide ordering for cases resembling the second program (but not the
first), with the dependencies considered by the current version of herd7, we
do not get such an ordering.

There are two more caveats of this patch. The first is that just because
there are no subsequent writes to the location of a write w (until the next
compiler barrier), does not imply that the write w can not be elided, e.g.,
if the location of w does not live until the next barrier (as pointed out
by Alan Stern a while back).

Unfortunately we can not currently express this in herd7's syntax.

In fact, to avoid OOTA, it would be sufficient to provide order only in
cases where w is read-from by another thread. But that is a rather unnatural
formulation.

The last caveat is that while we have done a formal proof that this
patch excludes OOTA (in all data race free executions), we did so with a
different formalization of compiler barrier (formalized in this patch as
w_barrier). I suspect that it may be possible to almost completely switch
over from w_barrier to the normal definition of barrier, +- the fact that
a marked write together with po-loc is also a compiler barrier.

But I currently do not have time to investigate this deeply, and I thought
maybe there are already some comments on the main parts of the patch. The
epsilons and deltas should be resolvable.

Have fun,
  jonas

Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
---
 tools/memory-model/linux-kernel.cat | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/memory-model/linux-kernel.cat b/tools/memory-model/linux-kernel.cat
index d7e7bf13c831..180cab56729e 100644
--- a/tools/memory-model/linux-kernel.cat
+++ b/tools/memory-model/linux-kernel.cat
@@ -71,6 +71,10 @@ let barrier = fencerel(Barrier | Rmb | Wmb | Mb | Sync-rcu | Sync-srcu |
 		Rcu-lock | Rcu-unlock | Srcu-lock | Srcu-unlock) |
 	(po ; [Release]) | ([Acquire] ; po)
 
+let w_barrier = po? ; [F | Marked] ; po?
+let rmb-plain = [R4rmb] ; po ; [Rmb] ; (po \ (po ; [W] ; (po-loc \ w_barrier))) ; [R4rmb & Plain]
+let plain-wmb = [W & Plain] ; (po \ ((po-loc \ w_barrier) ; po ; [W] ; po)) ; [Wmb] ; po ; [W]
+
 (**********************************)
 (* Fundamental coherence ordering *)
 (**********************************)
@@ -90,7 +94,7 @@ empty rmw & (fre ; coe) as atomic
 let dep = addr | data
 let rwdep = (dep | ctrl) ; [W]
 let overwrite = co | fr
-let to-w = rwdep | (overwrite & int) | (addr ; [Plain] ; wmb)
+let to-w = ((addr | rmb-plain)? ; rwdep ; plain-wmb?) | (overwrite & int) | addr ; [Plain] ; wmb
 let to-r = (addr ; [R]) | (dep ; [Marked] ; rfi)
 let ppo = to-r | to-w | (fence & int) | (po-unlock-lock-po & int)
 
-- 
2.34.1

