Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com [14.137.139.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBD18E343
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693879; cv=none; b=hwxK9WWx1KYIcgl6iSSjmT+oVvS3k+nsnz2vZnK4G3k8x8c4wOoASOtJeatNt2ZYgeLA83j76M6MLk0h1fOAUe09gyqRrO/m0GS+gLdD29LUZIGOFHpKEBdlnReBHERKS2VeJ+4tKqMWyoZDGUQBVWP2lr2UohY+5WHqKaEFR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693879; c=relaxed/simple;
	bh=n7vHJunraoWpFYOQuQkGDN97hPkUyRPMLDP5Ffnl8Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dP9KnpHS7/hiFmkYblAjz6e+lhFUnq9sl7grMCwmlFXFUE0DPAz8Psg2+tplETuZyDtV/OAdNz9Zbfyhs5sUHTBvcKqv2Aa+NXPkfdxxqFy/s1zH/MBwDIAHSha5uUogYt/nhTbIDqs6HUrmbsrpGUDpGuTHHRhkVERwL12WK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4XHHbG69THz9v7Hk
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 18:38:02 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
	by mail.maildlp.com (Postfix) with ESMTP id 4B3F3140451
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 18:57:50 +0800 (CST)
Received: from huaweicloud.com (unknown [10.206.133.88])
	by APP1 (Coremail) with SMTP id LxC2BwAHmC8OhPpmdITtAQ--.60189S4;
	Mon, 30 Sep 2024 11:57:49 +0100 (CET)
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
Subject: [PATCH v4 2/5] tools/memory-model: Define applicable tags on operation in tools/...
Date: Mon, 30 Sep 2024 12:57:07 +0200
Message-Id: <20240930105710.383284-3-jonas.oberhauser@huaweicloud.com>
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
X-CM-TRANSID:LxC2BwAHmC8OhPpmdITtAQ--.60189S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF48tr4xXr45XrWDJFy7ZFb_yoW8WFW8pr
	WkX3y5Kr17tw1Sv393J34fuFWrWayrGFW5Gr92y3sxZryDJrn2y39Fg3ZxWF9aqry3Gay5
	Za1jgFyqk3yUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0pRHKZLUUUUU=
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/

Herd7 transforms reads, writes, and read-modify-writes by eliminating
'acquire tags from writes, 'release tags from reads, and 'acquire,
'release, and 'mb tags from failed read-modify-writes. We emulate this
behavior by redefining Acquire, Release, and Mb sets in linux-kernel.bell
to explicitly exclude those combinations.

Herd7 furthermore adds 'noreturn tag to certain reads. Currently herd7
does not allow specifying the 'noreturn tag manually, but such manual
declaration (e.g., through a syntax __atomic_op{noreturn}) would add
invalid 'noreturn tags to writes; in preparation, we already also exclude
this combination.

Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
---
 tools/memory-model/linux-kernel.bell | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/memory-model/linux-kernel.bell b/tools/memory-model/linux-kernel.bell
index dba6b5b6dee0..7c9ae48b9437 100644
--- a/tools/memory-model/linux-kernel.bell
+++ b/tools/memory-model/linux-kernel.bell
@@ -36,6 +36,17 @@ enum Barriers = 'wmb (*smp_wmb*) ||
 		'after-srcu-read-unlock (*smp_mb__after_srcu_read_unlock*)
 instructions F[Barriers]
 
+
+(*
+ * Filter out syntactic annotations that do not provide the corresponding
+ * semantic ordering, such as Acquire on a store or Mb on a failed RMW.
+ *)
+let FailedRMW = RMW \ (domain(rmw) | range(rmw))
+let Acquire = Acquire \ W \ FailedRMW
+let Release = Release \ R \ FailedRMW
+let Mb = Mb \ FailedRMW
+let Noreturn = Noreturn \ W
+
 (* SRCU *)
 enum SRCU = 'srcu-lock || 'srcu-unlock || 'sync-srcu
 instructions SRCU[SRCU]
-- 
2.34.1

