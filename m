Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717D1F4612
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821099; cv=none; b=OnXCR2dnv0rG2AM+8ah+uzSYBYDRHqDaO4h9KN4BB48An8GeBovJx23Pe2uGZhPkSKWceGbea9FUTe8lTKT/8cxxu0B8l6IDPaOn6oR3Ng8A9nAUA0CromRUAOBuzh/W17pfAIYbOYKaIt+LSOglKHuO1cfMmXqAYk8Z+KaybXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821099; c=relaxed/simple;
	bh=A73pes+JuDp33aVXpLNlEeOGjBrNNA3VpTS+s9bm4yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KoSclaRNcZtO7p60HM5+dcakTu6mvBJA6oAHOO7E8Ju4Cq6NgtAk+0SLe9UTl/h3MZcsbeBRPhOqpaT5ofv51+oBdbIpQU9PHrhrFmdLODfZXLmDnpsalb6BE9YLr3lq76G/QhW5G0jaBJev/cEKb6BlGfNhQpgTckSdYrnjcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7IKvnK6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7IKvnK6"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d3efcb9bd6so100789985a.1
        for <lkmm@lists.linux.dev>; Tue, 24 Jun 2025 20:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821096; x=1751425896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zuqVIBjGXQL3Pb0oRS7JXPWUTOWoDxLBBUTqhc/Fk5g=;
        b=N7IKvnK6e22y1yMsR2q4f58n5102j4qnaK7U0COeEn20w3SJ30k/L/D5OVyg9+knUq
         Es+uSWGTsQsREn0jGQDLpRQWnsHEhOUjAjrDqeuZoTbecOoFsvWuQLicWDDoCjqZ2goL
         lXzQqz5ZnSxAaOho266qGKNhrURGuAppe7HIUc3/RdcQ/pCfLbe6iEVF7zpx9GT//gHp
         s7Jd3gScJ1bNR6oVvNCH5vAse1/+CmGCStf7g8v7zlSm5Q4Pr90trH211B+7+THm3ZxH
         eBysnSxNSR+rDvFNgMR66WMMD693yPoMAw9XBuVnpCArzub6PIRZBZGebGk24z0QpERZ
         dJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821096; x=1751425896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuqVIBjGXQL3Pb0oRS7JXPWUTOWoDxLBBUTqhc/Fk5g=;
        b=mXR1mf+BvtlzSOcaLohuXyY6vB8f67bdDyk9mAaqPY7dxs8xOHl+jVO7HOOYa671/k
         5jayWey2L8c+vDt2LY4GYSYt3fV9jcoK8BVNfG6fI8/Slx/VRbe8OdM97Pnz1bqEMOSd
         Atae/R4YR/f1WWHpV7FIvSnk84PaNeeNnjJVtYD6YN2o4YYsQkzggzxmgKGhIRP7tVnd
         KVcNtc2dpkK7rKv34Be+sNrMbBzZG762pfd6Xq1Ej+rX3ABdTpx9Ooe3HtONz3+wLlJ/
         qpTjv+mQ/1xtaWs5UaaUkajaQt0zG/F674uw+Q0z2IRZeSXt2AdPkqIua1W1exRJgVSj
         G+yw==
X-Forwarded-Encrypted: i=1; AJvYcCUfrvvJ2O+nHipm5+F35/DAopuJMGrV/aTBrZjaqve4c5YDSeQP2akd1uJL/IeoW65UOR9R@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0J41uS4hAyVjWqkcM9GSdCHtASKgFYcwZtLCwzsVKNlq0ywXJ
	Sfues1hbbgbWZ9PIfWARQ0ArxT3Q98vXc4QzV/mZbz9CIjnYOsnpVNmj
X-Gm-Gg: ASbGncshaeCJAT4LDBGkU29U7T5nYkGWE7N/9rPua/aY0KTL+MFBSDRvqv2xwV3KyHp
	r9t33PKet+xmj82aM1KyQbl098OtT0029AaMvoJNuKBMF0/elp2LdZg9h4DD72gnBZVonxYZTpU
	kXw8g/HBXoycGQYphjCV1ZY4z7ybMZVM8nS+VQfiFvLEgJ1MIHIBpcCUrSIFzwDrXD6vb5GAQ62
	LOLiiT2sJzHT9HKS7mnuyNFJNdEBxLs8lZOvVle2Zuc3iIflykJIj1NI9DjbthRbpT9txUFclR4
	2IKYjG0vPT1KN7FfswlxBh3+9HLOJCtHWrzPK9owoNf7oT5nHZqIgc9RHa52Na7BnHepZPs/1gb
	Werd2/XbtkVNC2wYPeFX4xF3OsVmExOlCciIe+Mu5DdX87fzeCwHf
X-Google-Smtp-Source: AGHT+IEbJPBHSvbUjLDI/ho9eHxTAS4JXGBSJ1tuasc06odARRqHpanKjW7XTONtNu3DCCjVSio2Vg==
X-Received: by 2002:a05:620a:bc9:b0:7d3:f3a5:71d7 with SMTP id af79cd13be357-7d42973f34emr215814785a.40.1750821096186;
        Tue, 24 Jun 2025 20:11:36 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999a566sm570896785a.8.2025.06.24.20.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 20:11:35 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0826DF40067;
	Tue, 24 Jun 2025 23:11:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 23:11:35 -0400
X-ME-Sender: <xms:5mhbaC01JPxbFccv81BMVkJ4tEmhk31iu2PVX0MTK5fjwwYj8ufJcw>
    <xme:5mhbaFEuozaSCkHCvVzkMQxN7pAUO5HOXV_ldARR8Rnfh5dGH_gsh2TAsdIywT9e4
    RS9DxrxdP7rKVZ8mw>
X-ME-Received: <xmr:5mhbaK7WI8cSYmHV6moATZimuQIToczmFhe4VoW3qhdQt3vA88DZul1j7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgffhffevhffhvdfgjefgkedvlefgkeegveeuheelhfeivdegffejgfetuefgheei
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopegurg
    hvvgesshhtghholhgrsghsrdhnvght
X-ME-Proxy: <xmx:5mhbaD0obg6pyZ0mz_KgIsL4yG6n8dxY34eqykwaRYHoZjCCHsqcmg>
    <xmx:5mhbaFG0jVcxIqP7QCBiHDDXOKqzuG2GndcDI1hDcZX1V4KXq3fWDA>
    <xmx:5mhbaM8o6ZBcRLCXH5fbh1oy3ThmarYDv7A5k0oPkeaWGgrM28h44A>
    <xmx:5mhbaKnrYcFS1OBMgyTZ6bUlKo3Cb_BrPlU40j861bSuk21QkMikLQ>
    <xmx:52hbaNH55ybs0OUzatDJAZEmeLZudbgKUhu3XSgaGlkt1Xt4YPav0t7D>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 23:11:34 -0400 (EDT)
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
Subject: [PATCH 8/8] locking/lockdep: Use shazptr to protect the key hashlist
Date: Tue, 24 Jun 2025 20:11:01 -0700
Message-Id: <20250625031101.12555-9-boqun.feng@gmail.com>
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

Erik Lundgren and Breno Leitao reported [1] a case where
lockdep_unregister_key() can be called from time critical code pathes
where rntl_lock() may be held. And the synchronize_rcu() in it can slow
down operations such as using tc to replace a qdisc in a network device.

In fact the synchronize_rcu() in lockdep_unregister_key() is to wait for
all is_dynamic_key() callers to finish so that removing a key from the
key hashlist, and we can use shazptr to protect the hashlist as well.

Compared to the proposed solution which replaces synchronize_rcu() with
synchronize_rcu_expedited(), using shazptr here can achieve the
same/better synchronization time without the need to send IPI. Hence use
shazptr here.

Reported-by: Erik Lundgren <elundgren@meta.com>
Reported-by: Breno Leitao <leitao@debian.org>
Link: https://lore.kernel.org/all/20250321-lockdep-v1-1-78b732d195fb@debian.org/ [1]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 kernel/locking/lockdep.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index dd2bbf73718b..5c205dd425f8 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -58,6 +58,7 @@
 #include <linux/context_tracking.h>
 #include <linux/console.h>
 #include <linux/kasan.h>
+#include <linux/shazptr.h>
 
 #include <asm/sections.h>
 
@@ -1267,14 +1268,18 @@ static bool is_dynamic_key(const struct lock_class_key *key)
 
 	hash_head = keyhashentry(key);
 
-	rcu_read_lock();
+	/* Need preemption disable for using shazptr. */
+	guard(preempt)();
+
+	/* Protect the list search with shazptr. */
+	guard(shazptr)(hash_head);
+
 	hlist_for_each_entry_rcu(k, hash_head, hash_entry) {
 		if (k == key) {
 			found = true;
 			break;
 		}
 	}
-	rcu_read_unlock();
 
 	return found;
 }
@@ -6620,7 +6625,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
 		call_rcu(&delayed_free.rcu_head, free_zapped_rcu);
 
 	/* Wait until is_dynamic_key() has finished accessing k->hash_entry. */
-	synchronize_rcu();
+	synchronize_shazptr(keyhashentry(key));
 }
 EXPORT_SYMBOL_GPL(lockdep_unregister_key);
 
-- 
2.39.5 (Apple Git-154)

