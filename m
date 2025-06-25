Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A61E98E6
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821096; cv=none; b=M11bF5ad8uhJB7B8U5qBKPC6meuVvGCFhVm6G17WvN7BDE+zMbwECNTRLA49sxMtd3Y0BORVeTs37Q88AgCVWSFpiqctJREvdolCrMpHAtc+vK4NQ0ewIf8Khr3gsUq9XkR0HJoCBrKAlknwiOoFxvyIXfcPyPwYhi20KbdF+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821096; c=relaxed/simple;
	bh=asr5uTUioL/0h5I0aStm17Mh+pOtbR0ofOQLjCqfd+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6CjiCKRPkizY4sEuoweK/zprZWPVpBeRr0KiL9iTWijCxj5BCA2yjUPtlee7HrWVzyhJoamzTeh5Qsu7j6x2+bIjffM2R+bD5diXOrESAJWzVUoSGrLgfKuHKWzCeDqJyls3BOXwMX1ODTLeDGkJ32mFBL0K0ul/JFe8m1NJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gop3eBXJ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gop3eBXJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a58ebece05so53599081cf.1
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821094; x=1751425894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=678FLBRyV/EGtYHAvszDngJJOFd0kRmHfL4yh1GGT0U=;
        b=Gop3eBXJ7hNGx5Lgbrk2pFlJz6eNcv/Tjh9IeATwPOjLLEauTEnUDvdEAEjnLtR9j5
         pedBnIvy0HbVFzI8VpowirWAfY+y3WSvGrcRiKz/T4cpbYe/TZR/VK+2J4X6nItdof4Y
         HhYHhI9u3ZtCHMSwVOzTHUL0nl12kYoFa56ocn1qVFaNs/8rfqGWVsnHLjr1B8WJwR/4
         0ZiJuXpSetAIKX3TlSQdriup/tpo6kytnSZKJKKGtMNEPae/hogfqsz3eOI8/DjmBvIc
         EqA5w7JpxsLm+jtMsgX8hQrm31XA3ns/3K+QvzwZF+bECBoG6QU4Gc9zzBMvygDFumtu
         Rorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821094; x=1751425894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=678FLBRyV/EGtYHAvszDngJJOFd0kRmHfL4yh1GGT0U=;
        b=s/VkU8fXobYFCJt8aT7LLigNI297o9G2/3ZxPNE8g/Os6KQKCCpYyoJOUCsw8e7oZu
         Ys+I0FUCJq5SULZuiN5KD0iBqh6UrrwdVeD1m3N49jaA2NVRfHiFxnI3+qT/SM0iPkoR
         SUjfbhbgc2kM66KpksZO0tphVQSQN5bJG6yF2ZnK5p6v18Pcopr9pu/CEVlsQ2VL+46Q
         aCcdl19MG3BP/DigDWa66sNS5oj2E/q4e4hFq3tQaaBdxWuBJdstRHsnwSjAIhpygY0J
         mYHHwmoH06fO9DOXz43OiNhBuMXihVXXV6eMoubeNHuGuhenTS5D4PGAT1jaCBj902H3
         f/aw==
X-Forwarded-Encrypted: i=1; AJvYcCUYlf5qXu/Mg+r2P4i7k5p9lhHxztmogmG5tUj00Hr3xbLq6ijkTgfixdpRk9jbzSsXEYnV@lists.linux.dev
X-Gm-Message-State: AOJu0YzyIHfBkrb2d9WzbMAqvAn/tYCEA/YpdFaN9lOy0Fx8rpBY9+4E
	nPdNTr+8k/TGPRMs7sb106LtcXZRU5Zrno+4CE52XtBvPg675WaPFkQO
X-Gm-Gg: ASbGnctQrtkmt6+jzTH7dh/PZrQ+LPJ502L1fC/16MPUoe2ndq8ZZhDoFl0ZK/j9Su/
	CsV/5l4ZgqdEZ549PzTkGmLg1FbGIUCeUh/vg7DaifORnAhAGpvKHGsqqnaWOCYz7+jx5jSDC2F
	fGNsaUqIRd5mUEDOe7Fk9V+osSJKitX9HqD40tK0LWhj1nr9vERzw2UAHeGfJtVr+79FWq5gFyZ
	aL1C5lxCuMOvAARqAD30RSki0Kl4N94dhpgKiExgSsvoGYWK7src2SrALF9yfoVHRywTgUYemZh
	HrsnaX5yMp3nATGPfabW0LNYRArROMU+OS9k7bldmXXk1pNj9jHjsnCk53LLCI1QVSKa7F7GTS9
	SrA5PIJfww+0mT3wqJzd0JAtvE54WnF2/XKrydPkoAKUzvruaGf0B
X-Google-Smtp-Source: AGHT+IHLBlxfOfHRIysWYSzviK3Jt4IAeQ/77Q8AVFjgBBxKd1sBVPA9U6rgMUaVbnw8S3yFqLBbuQ==
X-Received: by 2002:a05:622a:40b:b0:4a4:31a0:68d1 with SMTP id d75a77b69052e-4a7c06a01cfmr29966041cf.21.1750821093620;
        Tue, 24 Jun 2025 20:11:33 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e910c8sm55291021cf.71.2025.06.24.20.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:33 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C62AF40066;
	Tue, 24 Jun 2025 23:11:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 24 Jun 2025 23:11:32 -0400
X-ME-Sender: <xms:5GhbaOYlPijW2zGQLp-tci70MsuyqTwoEdGALxVfJMoLAp3uT-36OQ>
    <xme:5GhbaBbjgKSUjtzUVVlOO36QTaobTv2fvXjBt-QNhwIA_SoP3dX4fxIAb9oWQ_dbH
    LnP2vaayRx1N9-c9Q>
X-ME-Received: <xmr:5GhbaI_Mjjo5nerOH4VbQOOe7d38PJ4pEwRqmU4sixv6D4rohAJH2ZoEUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfevffeiueejhfeuiefggeeuheeggefg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhm
    mheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpvghtvghriiesihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunh
    drfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepuggrvhgvsehsthhgohhlrggsshdrnhgvth
X-ME-Proxy: <xmx:5GhbaAr_TBWtPG53LqEuT_uYVB3xz830E-QeXFrrSMMtqYIL0Wk0hA>
    <xmx:5GhbaJpXZ0T4pKU5L1noz9wquu2Qrk4uR6Z_gmWi0VPBwIkA9c_SRA>
    <xmx:5GhbaOREk8cJkb9k-skbfy16FrYP-FxNoEzrQfiMViwc-Z78TVSyIg>
    <xmx:5GhbaJq-ZvZPtwS9S5X4hzz8qcAleb-161Cc_1uDyaWDn0e-EnbLzA>
    <xmx:5GhbaG5QpoNhDgvVmLxLdDnB89yMuLnpmHHbFEakTqiJY-k76XHB64g8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:32 -0400 (EDT)
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
Subject: [PATCH 6/8] rcuscale: Allow rcu_scale_ops::get_gp_seq to be NULL
Date: Tue, 24 Jun 2025 20:10:59 -0700
Message-Id: <20250625031101.12555-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250625031101.12555-1-boqun.feng@gmail.com>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For synchronization mechanisms similar to RCU, there could be no "grace
period" concept (e.g. hazard pointers), therefore allow
rcu_scale_ops::get_gp_seq to be a NULL pointer for these cases, and
simply treat started and finished grace period as 0.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/rcu/rcuscale.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index b521d0455992..45413a73d61e 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -568,8 +568,10 @@ rcu_scale_writer(void *arg)
 		if (gp_exp) {
 			b_rcu_gp_test_started =
 				cur_ops->exp_completed() / 2;
-		} else {
+		} else if (cur_ops->get_gp_seq) {
 			b_rcu_gp_test_started = cur_ops->get_gp_seq();
+		} else {
+			b_rcu_gp_test_started = 0;
 		}
 	}
 
@@ -625,9 +627,11 @@ rcu_scale_writer(void *arg)
 				if (gp_exp) {
 					b_rcu_gp_test_finished =
 						cur_ops->exp_completed() / 2;
-				} else {
+				} else if (cur_ops->get_gp_seq) {
 					b_rcu_gp_test_finished =
 						cur_ops->get_gp_seq();
+				} else {
+					b_rcu_gp_test_finished = 0;
 				}
 				if (shutdown) {
 					smp_mb(); /* Assign before wake. */
-- 
2.39.5 (Apple Git-154)

