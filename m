Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119137;
	b=5S1P/enKIgKMvFVn4HLTCLlhIMJ55MjkXflrsNZ2k8phflBbWiLLRnIdZGHvt1BUHZPZ
	 EqPGUDuYD1XbYFzuEwqzLND87WtKHFRaHV3H8h6gH0yqUcj2iqT6bbJTHa1lqJE0j2uLl
	 SIti1cPjIKnMscT1PLJjauFMpI6DLuSKLjVDJEDYy0fjpTCML0JfncpUAqnM+FjRPhPwo
	 uvHlZGIDAx8y4l+U5XEexLKv2kezrCRGGsl30E8Tvq6chyWFPSfzT0Pfd93lxksr14zpW
	 UtypBcNzokuk2p1s27UgSHuCREiPpPnbxeTJLx6dxTFKLLqqMMCFQYXjDqjMA1qS08g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
	b=OxdDSkOpcTfcYdTbSbP6Rg5Efi7Zm7aXVKDQLHO35pUjtMvQldjz1cPotBP91TCr4NvL
	 mPd4cX/atNuM8NVbK2LywHsFHsLdjqDGoyfcgAc2UbXIbpp8TMr40z4NW3rO27eexKswA
	 hjASW1IM27iNf2DNmj6qOb3ounQo7ugAm7WhCgB0BhrUGbHUgJKzyuilXP/f/Ua6vh5BK
	 76xMY6hstQ+kFLZ9u1DUlvNe8wsyVcolvGFG/K9Bj/ITMfkaHfNEhnUbttQC5Relao3hO
	 FpKeUnCuxAjRoXpcD1E2jtLB5AnlNJXVJ3ECNBuV+DNmTdiTwoQwtA8v9XUPBGow52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkDQcW5I;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4960A260C
	for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 16:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C4960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gkDQcW5I
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so598105e9.0
        for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119134; x=1793723934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
        b=gkDQcW5Ik+WSYDMl5mBgHRcysrGM7ftWMB9+UAz0c1ndVFma0Q06d2HEIGHHpEm6rw
         MebmHQbGhqL2SgauZfpqMzLJm5A4ApS+VsbAhE5XX4XbVEFd39tMLcRljhEMV+qelhI1
         PjXvZ7a5VPeHuwc6h3MxVrH/TEI08WIzYjg5vCNeCTi2c6eGOBJYiA/9PFL2jN9NWTny
         NHg5pkwUEDsKEqTVPiPFhVF1IGTI/cHTGfgzJFvIAHqvlIDvWfrLFIM+v73/fRjtLtQ8
         HwJHtmwKPrXMQ0t2loyrCZbg7l72isp0PCQfDB6W4auLnnTierscohEOKVxz00zRELP1
         URcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119134; x=1793723934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
        b=TlZeqnQ3QDGkh+T46Pu/ftGnrSDjqOXYiaML5F16PVU1UryrAU35OApUtcVoNhGUzO
         +OXoLZyaPd3qrC3frM8CvwZMeGr+aOO1j7U1l595802LJrreh1Qfefdaj6nnlrXIctAG
         OJD8Ml/7UVcwnXYVzNTgcGPFT4WlBpxj6CEtoMKKRBri3+zH4P7+K9Y4OamLOgkCgfhS
         iaRhbgVrYNHQ1Qqz1L4fB1dRsvlMiJrhgHrC5pUqmp9uwBfw6naTkPHfq4sm+Ma4SZL9
         qA+Wp+W9rBRAS1hgG8z1Ac3u9LwPfNwWzwq5iGASEGCfrFVa/wNckYq41gOS2LZGC9UJ
         BjKg==
X-Forwarded-Encrypted: i=1; AKwUvByfosgl3wQDtKFA3f/BuV/aa4HqW0M/4iInLQSiBClIAQpDqSeecYrujMxCnZn+kDUw6uNR@lists.linux.dev
X-Gm-Message-State: AFq9FYJXyfg4wNC+NnslE7422m0r6IYHL4sp+qGzCJHFV7ck2jRvLLOb
	iqyUkpcyOSDmN+jkd0HW+H4c2OLqhbEAdlJt/2LgLzkK3DVjqWWYW6Eq
X-Gm-Gg: AYBFou14YB7tdD2VaKUEATJizZsJUz34BobC2b5t4Sq1CkINscaB1tDj8abM9wX06Jp
	VUtBL1wx7cWL/F8pMAELhns6EMFL01laVnbcBU0ZaOzzeStVnVxn79X6gp/8+NE5QYv1XaNZsYf
	toFvAKLfIJlcxiNEnVkXBcd4MVMpdhs5YOkMBIizaJQtpcB8wCMeMM0O+4EmHgJf94UbB92DbRG
	BERboS/9wXUZbeIZp6nexb2/f15/xG1TfibuNIeIBhbcjwOeue3lUjznLwfTpkPHVg21YpSCfaH
	cTBRE/pcqf8HACb8DPK8aVeUH2EO/URTiaAOLwBMzs9r1d5eaZglzrRax9xkK7nGO/dEzXssnrv
	lqcEylSja2K/bCLWGlXtkj5lUIL3EhWmSSOMR+8HH4VMCCXphJufKDP2h5dsomC7nW/zkWmYEsi
	kbC0mXDRmJnRT94GvAS6RDgFCY062kyUjaMwt8RtGYPZ27XEtS0wZunt/x/wRNEHdqf5JqQDBwF
	QJj+9yJH95hEbRQPkNJb+tB91YZxA5d24tu7uU+Ea/XmnMMv+yTEgOpwztLJIDjIfjZTyLGhl8r
	2qZNzAJP75kOmJr7uY2Ln9uOUnY=
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr173697125e9.22.1793119134362;
        Tue, 27 Oct 2026 09:38:54 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:54 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 3/4] hazptr: Do not warn when a backup slot is released on another CPU
Date: Tue, 27 Oct 2026 17:38:05 +0100
Message-ID: <20261027163811.2470569-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_HAZPTR_DEBUG, hazptr_release_debug() warns when a hazard
pointer is released on a CPU other than the one that acquired it,
unless ->detach_cpu is set.  hazptr_detach() sets it, and so does
hazptr_note_context_switch() when it promotes a per-CPU slot to the
backup slot.

__hazptr_acquire() can also put the hazard pointer in the backup slot
directly, when all per-CPU slots are in use or the pointer changes
under __hazptr_try_acquire().  Nothing sets ->detach_cpu then, so if
the task is migrated before the release, the check warns although the
backup slot can be released on any CPU.

From hazptrtorture, with CPU hotplug and readers that nest a second
hazard pointer, as "hazptrtorture: Nest a second hazard pointer in
readers" makes them do (without the nesting, 30-minute PREEMPT and
NOPREEMPT runs do not hit it):

    Hazard Pointer (addr=00000000e2979b1e) released on remote cpu without context switch. Acquire: caller=hazptr_torture_read_lock+0x43/0xb0, pid=80, cpu=0. Release: pid=80, cpu=1.
    WARNING: ./include/linux/hazptr.h:293 at hazptr_torture_read_unlock+0x80/0x160, CPU#1: hazptr_torture_/80
    Call Trace:
     <TASK>
     hazptr_torture_reader_tail+0x88/0x250
     hazptr_torture_nested_reader+0x6c/0x90
     hazptr_torture_reader+0x2f5/0x550
     kthread+0xdf/0x110
     ret_from_fork+0x179/0x240
     ret_from_fork_asm+0x1a/0x30
     </TASK>

Set ->detach_cpu when __hazptr_acquire() falls back to the backup slot.
The remote-task check still applies to such a hazard pointer.

The false positive was found with the help of an LLM.

Fixes: 3d48872eb74f ("hazptr: Introduce CONFIG_HAZPTR_DEBUG misuse detection")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/hazptr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index b15b84ebd4ceb..b06164aac3a70 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -112,6 +112,10 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	 *   synchronize forward progress.
 	 */
 	slot = hazptr_chain_backup_slot(ctx);
+#ifdef CONFIG_HAZPTR_DEBUG
+	/* Unlike a per-CPU slot, the backup slot can be released on any CPU. */
+	ctx->detach_cpu = true;
+#endif
 	WRITE_ONCE(slot->addr, HAZPTR_WILDCARD);	/* Store B */
 
 	/* Memory ordering: Store B before Load A. */
-- 
2.53.0

