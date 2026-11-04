Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811386;
	b=GVes42HUjVbOuvTs5z/HGQPWJ3nIJzugkXCIQFaotEH+BaR4g1nEvJ8py06O1tXU+sng
	 hW+0cZCqb8a2XG1Sr1BO7MDRyiYCR8ljmWnYEYYT3RCjx8UkKPqb6qJUnwlbo1eGHZmDm
	 SQEmhVt+KNnpX9mW2oOeEreMQDU6VGIFWbh65fmJhUINdhNmWNkcBFJcFBYjw2GqYf+G0
	 DRZ5IFp8Ct9ArHdUwQkruPfyhk9V4xC954FEhjzsSFzKMgQA+tKL9Om9B60cKa2I9ZaJ8
	 sBNGY4EmxIEfxKFdqFmbnS3Y5mCwl4lY4skiqI09LrZL33BSZfT+JQBIUkl4EdUQRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
	b=l4m9LNVINSWwSmjn2/xkdh5ICU6PFcFxIXx8da7EOf3Ax0pCNYMY0/H9NUEg9LK8QWpz
	 eo7+7exMY1bJjD52OqpTz53cVIP1/nIQPjJk6k5BypY6HLv5a9YeNILscQn1VSDuOUmfi
	 iPM2MwTEzfZIQc1Mos7oN5MD5l7n9VfCV/mm/aUZdRHi+TCerDgi7/atxe1aAsHYliI70
	 adJ4X9blimXa2N80CUG7Hexm4RYNloXwlWh0dw4zQDc2FjcPiepDwpu2KjZPK5eAW56N7
	 u6wkSq38eiZ5Kocep5mTOEiSSP7GBCNduwXqd3iqIgz3D76B+/EFJEBotv6qdUH2ziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xesq/3ua";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF277606A335
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF277606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xesq/3ua
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2007986c88.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811385; x=1794416185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=Xesq/3uaWYsbpu5XuqPBQizahTGdNc3n1t8WobWvVHF1Rwerx6DQCTud1KUyzjjRrk
         84qOJMuqOYUexdCn1WVybnxvHcx3l6m+yXq0hGFMMjcm2J3z1RaAGPnCjIvtgN1iU33f
         rm/JG4yX5sWhS9DUCg7fTMNbl5+VKj5PFbKlg9kdFx2aH9MkSkyukdkUflCTiitQKvHr
         p/MeljRaC0y6RIMeTFo2yZ2qMZeFh8ZAoj669FnhzYZIUuCv7uLswcCBFN1u/d3kY6+r
         uFdVJd5+hsRz1nToHmgeGGOftjEShuKrhr0h17im50kQJksMKiww8INJx07I8VrYRxWf
         p2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811385; x=1794416185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXmgooCun45H9nlbuiuwQFHR9S540n6oe4h3LrE1mlU=;
        b=VSrR1Pz/9O3IWKlr82DxOCxiEfj+DnIWFKbtj1/TGbSzAw9PipVDvkHZoF9zOn5RMQ
         KBfi0M49qYcbtWYJIp4nWVy/3K1Xsy6jad5ube58+uK3vAEazTEmUdFcUUsUT/fBL8Ue
         3Yt8hYbGQhtpV2uDp3jrO8/SfiYT2yn3q8uhmzgUtDQtnlVY7TN8xwjnagRpkRuaRoyZ
         MXB5ZX4cHnQvUEaxdzM/tAdgETOdVD7r5ZzjrmTCBHwaGi44js/pxlt9r8BsR/ZUeGmV
         FsZfTvtYb23Cqst07GRm5EFW25s43unwAQaLbSFuys33m62Oe4PnFJeeTF4/CZKIvyW3
         2UWw==
X-Forwarded-Encrypted: i=1; AKwUvBw7rh4eMs6E4lJi9skM/XpHCFgTNd60TurGXWFAaVcUu7oKQMl+dNa+B2qoIDPlfhon/k/d@lists.linux.dev
X-Gm-Message-State: APuU4Z9R0KEKKAKr7P5Yw3b8+HG9bVEOUwuNyLv+SUKvR9z6HybGJWDN
	xMHhVCPkqUcRVYBv/du76NvgOmaMH6Suo+lZgiA5eXf1wIJBnkcbIlVM
X-Gm-Gg: AYBFou0R2+e5cPxFD0s3sorw8E6xhSl5+Soo2DpAfLufvMdUasW+cnLOgqGaD0kvOFn
	cEyjnopJfpLlBra1ObeLHx+ub0UJ5JBYncAAvZVA8zqQ4ClEplkaUONMN2X+L30RyRiU9+OiKTa
	M5RCk6EukI047r4cY8MGiNn/70o3HTsJcX8ZsPFoYshGQKJi5An7uYJl4kohoymdpUiRAkSa6PN
	6Po7xl6oK0IupHnreA3A88ywfDDpAVWAOmpcjM0rMkEVW6cHsnYDeW+evF6r/CnzTnWsHNaeGFA
	3Z1zwBFV/I5/nfVR2vV8KWUwdsKzpFd5t3fBWMsT7H2mpKr4992iT1jqPlye2upB1Po5O2jDdsL
	8zyFkfS0tVO5Mkp6a6o3TrvPZ/tnvXXAPozsGD+Is+NMtulXLTjeGmBIOY4bYKJ5J9dNMK5VN25
	rnrgYdcdQj782BbEnfLpKLesvv75AHuBZ2USrvqlDiHuyyiC0fDDcmhG5ZaWsPJ/77cgUDAjSgZ
	9wKbc13ROXo/D8X/zH4O+nMqgQ3a4huBgZZUOKIxNL4Ov6VN9BxeCklHAaNKyYvkQ/uzr6x+4ys
	ZrwI/eR0IZ0DcLdIOEM2TAm0Ln96PVOEdVVeN7s=
X-Received: by 2002:a05:7301:3d06:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36a42404840mr36237962eec.33.1793811384606;
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:56:24 -0800 (PST)
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
Subject: [PATCH 07/28] hazptr: Fix kernel-doc of hazptr_release()
Date: Thu,  5 Nov 2026 00:54:25 +0800
Message-ID: <20261104165504.2430480-8-kunwu.chan@gmail.com>
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

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 299ad8a07156..0fb48518525b 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -315,7 +315,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
  * hazptr_release - Release the specified hazard pointer
  *
  * @ctx: The hazard-pointer context that was passed to hazptr_acquire().
- * @addr_p: The pointer that is to be hazard-pointer unprotected.
+ * @addr: The address passed to the matching hazptr_acquire().
  *
  * Release the protected hazard pointer recorded in @ctx.
  *
-- 
2.43.0

