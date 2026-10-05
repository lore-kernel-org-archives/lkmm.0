Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0114E80A7
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220605; cv=none; b=l7tPmthISVfG2FL0mTLwt871RMMFdvX1Mw7jRiuBIxd+uRBwpYwkr06BrbPttgyeIDS5FSOJhblyMT3/S3q3kKBGTdQPYvvPzSNBTG8b3wJez5C0ckDTc07QnTVyLMx6kDeMRuwsbG4uzG2QmdcLnZHcO+GBpVHogp4iOglu2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220605; c=relaxed/simple;
	bh=8NuyF6qDUWQBXBIkLeP3/lavelfuwnWRCmtSE2YKnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rtk0IQGaGfCBBLs80c6U1KJ5hC1Tinby6XnXrTjs0kKMhZN3XvoqeJVBteicdD5V3WpDtjn1CLD7LbOLgoSYAX0Qq4kopi1UTh72YXFVYiH+MUhLDOlhICSJ4Lq31Qy/T97mgmDms3LwTFhDE222JELdHyvh9KtQJo1J9jPeyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEqn5ij6; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEqn5ij6"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so670741a12.2
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220602; x=1791825402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=YEqn5ij6dbPC+dMCeZexoaadbwVd5EwDoPaV8bVP95R4I0IJcPbwJZlhxBoUNu4We1
         KZ5D3vqMnVGXZR/VBGh4ESXEa2+m0dBP76ZXRtsecsZuyt+BsMC6bSCCqtEzfIMOl0jf
         GqDOBahLOvTpVDPojkFSQ1o35xVZGLXzRupJRZElMnAXbz3Rz1SgPGEIKHkGiFd6RFm3
         KwWKb+7AT2AwvtuV8KBSL0HMXJDc1kG7DNaPF/7TSlNiHmlLRJHGpbLySOoD0L+X8jiN
         O1D2qCVzgnHa9U7j/pEXf1G9zaq5o+Xlx1/+PQ0lGxd3lUqz8C3vePTVx1zOYTqXn+Wq
         wztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220602; x=1791825402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtL6vbzPvQXVWHTKwirmF+KIwLuuD5CR0v0OHwTiljs=;
        b=loByqQfPhMIpcUqSHhCszXFYdpGUOSwNpLiz5yPpAnyGASbLRF/nHTSwmq1VIJH5Rs
         qxbpgJCFs43RinaNM3+sxYUTiGMsjJ+WAXWqFJiwPVl62XQSTV9Sfs3odIKpYNkfNtkj
         NIPjHVMSXhvcz6ZlmEiuTeSQvTZjfwrb2cApuKS3I5dHvks/iivNIlpEbIchJ+RJFlIC
         lEgovh/fB7AeHwHSA7n9fXLSdu6qEmD24l3YWsY+3H7lWsDF6aXPvsNeBsY9eRiFHif8
         u6zHOEG9EOlk3WsQ4rILaeanqPa9vwBlQcoolzIXoOv5BupWixA+mDzOvUmSN6IbIk33
         iSbg==
X-Forwarded-Encrypted: i=1; AKwUvBxXnRp2i97oy9DI4H1l16qiGMWs1/xiXcFInCdSkPXOYxkwQW0zB5AmxBTNR5Bn4fK3/iOQ@lists.linux.dev
X-Gm-Message-State: AFq9FYLUYHp3GYhd29X1YmIycJonoff6UkFLa5tQ+8q+vX6rHIQDDK6f
	h0ZCDn7O4iPVnv4rAuf/xWFVnqhfgNRsSr1q+LODdLjpU8T7G74JDOgU
X-Gm-Gg: AYBFou0vHAXdypivW2zTNaaYG2DlzRWFxhCFxhA4Gn7u7g3321sliMOTGBTREb5RnPO
	Ep2c5czlszWpBNpC6gjwG7CC2rd8HMyhkaz+Q6okpqWeZ0SoDUVGXB6pUcCohm0Kb6D7Ts046oO
	aUfv7iXKIbxzHaFY5jdPwOlWxFj9d2kG/UNMVwk5Iobr8PUT7E8qUGX/FEDelgXDRxmV7qH1f54
	3/PgWp+NW6ws+tWN2CmHAShVogHCtZpcg4PVdYZR0Jvw9Diwv8vJ9nY/9uZuB6tJgWHfVHFMTzl
	CKNImZD/aTtuWq991rP+AqCHi6wI8vRVmhkLiAlkD/RQxOgrkcJ/EEgGsOwPdYxTLMfd4TQiQAm
	m5E5TIH46lG2YrMOEr0MSrbphYqe7rv4uqnkg1l8+9MAj+TZ+1j9Peds0h+qZQuWsPN30PQMnon
	Eli5efd9aHxDelh+YCscCKYPtxaZqqWEI9Ky8aWN+59ghlWz/EKu6VSHZJoxMefYBaRHonfJdd5
	hmTtKK41+1g0gZq1gZlab0KBytbnA==
X-Received: by 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr7983000a91.39.1791220601705;
        Mon, 05 Oct 2026 10:16:41 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:41 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 04/15] hazptr: add scoped_guard() support
Date: Tue,  6 Oct 2026 01:15:18 +0800
Message-ID: <20261005171529.1378809-5-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d1670121947a..275cbe54b075 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -320,6 +320,57 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+/**
+ * struct hazptr_guard - cleanup.h guard for a single hazard pointer
+ *
+ * @ctx: Pointer to the caller-provided hazard-pointer context.
+ * @addr: The address returned by the matching hazptr_acquire().
+ */
+struct hazptr_guard {
+	struct hazptr_ctx *ctx;
+	void *addr;
+};
+
+/**
+ * hazptr_guard_acquire - Acquire a hazard pointer for scoped_guard() use
+ *
+ * @ctx: The caller-provided hazard-pointer context.
+ * @addr_p: Pointer to the pointer that is to be hazard-pointer protected.
+ *
+ * Acquire a hazard pointer using @ctx and return a guard that
+ * cleanup.h releases via hazptr_release() on scope exit.  The guard
+ * only carries the ctx pointer and the address returned by
+ * hazptr_acquire().
+ */
+static inline struct hazptr_guard
+hazptr_guard_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
+{
+	struct hazptr_guard g;
+
+	g.ctx = ctx;
+	g.addr = hazptr_acquire(ctx, addr_p);
+	return g;
+}
+
+DEFINE_CLASS(hazptr, struct hazptr_guard,
+	     hazptr_release(_T.ctx, _T.addr),
+	     hazptr_guard_acquire(ctx, addr_p),
+	     struct hazptr_ctx *ctx, void * const *addr_p)
+DEFINE_CLASS_IS_UNCONDITIONAL(hazptr)
+
+/*
+ * The ctx must remain at a stable address while the hazard pointer
+ * is held because the slow path can chain its backup slot
+ * into the overflow list by address.
+ *
+ *	struct hazptr_ctx ctx;
+ *	void *obj = ptr;
+ *
+ *	scoped_guard(hazptr, &ctx, &obj) {
+ *		...
+ *	}
+ */
+
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

