Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811570;
	b=Vd1fEUZWnEabcM5UAFz/9Q/uYTzF8nLORUv0ucRIlhE78HFXCvEmIvoJ0xv2wvwta8tL
	 o+DfgPzOVc/IuZX8yoc3cJMPicrp1lBHSLQLigS1qPXS/dbPNFwEUOAZoGIpO1Udff8qP
	 CSnHsih0PiagoNiAvjXDTQQFL/0vpumaVlO0kMJ9bciBILxk6ZXPvieVM5jPLcqMw3A/6
	 TP2+DjKn2PlakxMUna6unTA4ea71VU0Sjh60xR38DzeWYOw0Dtu0PLi6K0dgCyIrMGLNR
	 wiZptZLKGG3TWwDuYdbPXseqHTeq0aaI92xL7pWwF1w42eIQatXRB4kqv/z2uj0foBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
	b=FulPcf2QRwsJC7VWV1xIZ+lRr8JYZjsstfvg0eS5ffSLtv2dftthkysRjiM/nl2UhzpD
	 LjKQ2X4ll+s1D7BRbnHEksdsKC5W2pd8xDe2m2xN6B+f+pej9ZB58V7Ge0GKxp8B/It1h
	 7s9Vz5oUKEMda7wWWlWhyxca1NflNHuh7dY3fiQ2eagQfZA/gK8X/QZOCo9y+IC/jw5vc
	 wby+21TY8h7E4VHUrJ/5vZIDAfq48acWw+62jkUq2QVAbGTQPuv7tpD2K6OCDiQvnBMnX
	 YBSkRI9YUQds00rIic4eesJZleBGOGWu0F2V0/MB1qVJ+gdJYFwFocf/2Me1H0yF0Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWp0pdNa;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8D606A33F
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF8D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWp0pdNa
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so1262258eec.1
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811569; x=1794416369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=lWp0pdNasyWlDV30sTpgWDkz6bgE454a97nYFCqNuwNusRIYjNdhmzGtqizVvKWptW
         E5EI/w6VlkfqoEibKX/yIaH/wO60YmJZAHBRjjZhM04pO9g0l8IMUCq8FZCOgn+ZJcSS
         Cj536P83IveDAcn5xlZ+3KUF1eAd+EIMUrI1Pu52PdZmYbRA+57zDtRBYHbmZwEy5Z2p
         B7IWmnp4/rqq+VWTYw6sXnl/ALqjbeY7rEEfcuL81A04ufIep7wy+jtC8RpZ5eYHYYUG
         B6aIC78kSs8Od8/n5WWHkxvEhOma0hA58CIm0ir1mL1pPQDTSD4vO8FNslZ6hiECQNjW
         StJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811569; x=1794416369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2kyCpxYn7quzffs+glqhT99zkVyPPhwyZ9QmptjaK0=;
        b=gXK4YkEfwV+UtlFWdtfoWr9UKST3BhFztMv2bWaUsXDUNPBe53Vb6LXGWvIeTWBIq8
         5ZOPwZBp7LX83+6hw0ucL3NTphErrI2xAwpJYWIPppj/ut/gICPpgMEbrbm+qpKajXu2
         x0MBnlxE5p1FRjB+6QPwPYIgYzYfPLLit+1XFzoskzih8O0eV4HvvswGmW6jM+1Ewf4N
         90E5KWePwcImhwqtcR5A2nGkP1hyu0GNHIRaqlNL7p5D251Yw5y8Jg3CBbMseb4wm8UC
         OGmW/bxGt8qxcJwQ4KVOKqAjOgSUlGmBHLWVid65DAFclDf4hioGH2nXW3A/8PwUO7W9
         fEKg==
X-Forwarded-Encrypted: i=1; AKwUvBxM2wFnS49bwbrAUvfhaDO+NuuTf0yvKp7YXZE2l8IHeVqD+DH9tHKSg9QCvv2xKxZcffQv@lists.linux.dev
X-Gm-Message-State: APuU4Z+A9xw6hzFVmPi/tn+uQL+VdmSCPV9rmPhcwi1mGwB+FtTlqt18
	qGNwQoEOeU1HUE4hUQfJLTc57leX5O8KM8nYeByB1QwffYFsEvtaD4PP
X-Gm-Gg: AYBFou19M/hCTRn106RaVRstwQHx4dFEFiQW/gpn9olv7hbBuGi0eD4FOGJAGxibp+J
	oHBsTyd54yVwpZZYnwOhyB0+LoVl2RPOr42mtf7muOkimN5Nisu8Q9qamVwzYbugpfBpr+YXlXz
	emXo32Ohr0dYpXsnDqPw0gnvxs8N0A+CWkAUj6twpUDW4gIfVfSIQVN1oydqakRCHu1Q5wadEvJ
	juWBssGMdHLUS2ATMuUx7L5oo4IKBdkhCTjsOAwsr7abm+xP8TS059GxNriKg5gKuIR6X67t/Bk
	gaB5zuRX1lF2sRJrfmXRrbo8+BaBfg9C4F7Y9tO+W5O5YRFA0Nac7o8HEHmzFjqAy+ZGfPMpDM+
	ArbfsgyGJJf0wP/S4yW/2BJx9J8qVG4fV5yLmOCMagjAL/XPSvuv6oiEjQfKSYho3rWyonpvvAO
	caxyYnt6aty1lRhv2ABLcTXWrN/oeqjWYsA8ScqNVd3zKee1pLvkF/O0s7iL4fZ/2G/UPeCasMQ
	FLyjMpfsD+dEQEl+rsvSaFJSIfJqQTtReemgtxEZfhlHpabAnoiZWZv5aKjem2hu2lAxQFXt6oE
	Svrk6DWufoK1Nzuj/LvUze5MIaBKl0OtxCzfkiU=
X-Received: by 2002:a05:7301:1a15:b0:369:a113:756f with SMTP id 5a478bee46e88-36a423f980emr22997970eec.34.1793811568303;
        Wed, 04 Nov 2026 08:59:28 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:27 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 27/28] hazptr: Add Bloom false-positive exact-match fallback
Date: Thu,  5 Nov 2026 00:54:45 +0800
Message-ID: <20261104165504.2430480-28-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

After 200+ scan cycles without progress, do an exact-match
per-address walk to determine whether the address is truly
present in any per-CPU or overflow-list slot.  If absent,
complete the waiter immediately.  A wildcard counts as present.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 66954251c332..13ae9eb26a8b 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -407,6 +407,7 @@ struct hazptr_waiter {
 #endif
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
 	unsigned int drain_cycles;
+	unsigned int bloom_cycles;	/* cycles since last exact match */
 #endif
 };
 
@@ -852,6 +853,18 @@ static void hazptr_scan_do_cycle(void)
 
 	mutex_unlock(&hazptr_phase_lock);
 
+	/* Bloom-false-positive fallback */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		w->bloom_cycles++;
+		if (w->bloom_cycles > 200) {
+			if (!hazptr_scan_walk(w->addr, NULL, NULL)) {
+				list_move(&w->node, &done);
+			} else {
+				w->bloom_cycles = 0;
+			}
+		}
+	}
+
 	list_for_each_entry_safe(w, n, &done, node) {
 		list_del_init(&w->node);
 		complete(&w->done);
-- 
2.43.0

