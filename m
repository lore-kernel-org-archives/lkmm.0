Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811349;
	b=z9dGB8LxXm1ci6ICyCWTp6UiHwx+TV2MMKk6OS2r39oXwpsB8McwiFHzSbu+92N3Wm07
	 GfDZUj2qlSmhH+aqzo6Ud2mAKCilhmaO+eC2AbUffAx2jdhzUcjeKahtqdbQ+pP9i7plw
	 Q1e+2pKB/ON+YzH+aQGDMIuumxqPyhT7NzEr+GEIdPNaIMCulrvbF/A23WEhUsPRZ7srt
	 DTvhfbpKLuvMlyOxMpI5s3hZNlez1Vyg+n1jWkLZx1vnGiVCBvyM4CNsC662RqzxQAeCc
	 oLUdgEsEfvSWHxjK7490uUyQgSYWZSg0pAjdsroFlautB6YRnId7KQOMbkei1yaMPzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
	b=5Gbpc2mw5oUWuVE7D7KArZBbReI1F/RJZRKb+7HPieFC9QWVcRSperyPxGTJ22aK3jMb
	 09aEta4kUgMPdyuSs6Svh4yBrI5ynkeMRgPqTtA0S07cKrQHWPSfHz8J5l9xx2jkpUh6+
	 F5xjQrk9JBdU2u3U40LMh9QB24Q1TAf4zYyPt5cQDUiuEp6HNad3nj8AYrf8hzu9X4U35
	 D6y51iDW4DPl0v8nCJw3SYgcD40caAwgv7IBQivnjDww0yxTqJew8wPGcwHM/PGmWQPXo
	 oRC5s0GGEF8hU+kK/1ncxMFQz4TOZLD+G82uFuFH2O73zw/S3te3Q7siWXrqOFyup1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjjtZamW;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E10606A32F
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 16:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E10606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjjtZamW
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so1894189eec.0
        for <lkmm@lists.linux.dev>; Wed, 04 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811348; x=1794416148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=LjjtZamW3qcTN34XJzGtoKJKL9R35NtKqljRdRiGPavyCUjCFymtm/YZcxTbHwUrJB
         eLfN9DXMZzWOcQQq1IiNmAZkAllkbIzXYGQ81K3F3+CsdTlox3472bkIggiYYbu+kV58
         R5DWFOGRZgif7s3hSrBskQgF/y/SmMMHX1YHqxan4eAFZrZgv0lLSVFm6ui4IM39/tWx
         ssYHPcxDbcdqWLWgqsS3qLHynD73VDN12vbo3vnSwidXEOcfRdpv5zf/dGzWworODhi2
         fmX9NulUOLjFtubj1UvLk/4SZiJjvj6vCcyip3PbnuS2eeDNI8tl3fqj02VWFPo9VfoL
         2NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811348; x=1794416148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zN0OMa6DsitFd0I63/8rm5wsSSArSxIu8WmzT7WDGsU=;
        b=EpA67PbZ504wNOpzvRyoRBNrzWb5hdY0o0mgTuwsTY7wPjF9/pmljxhkG9OFcSOjg+
         F8N0O7XrKMnNp+vbbocHvztmDnLZwzWflmENojYVfxKdB25tcuqSy8r0gO5fRW+GO5Sw
         SF3RxflZfRpuCzeNplC98xQU4cHSS4zsS38GhCNhh/WmnFVEAmI/u/bPcE+9/mPqc4HO
         b8reaLeNz3CPWSA4vaFGUZIceMk9izR0y1HqrpWuZlT5yZpuJwnMoylLw1tQ7mbJz8RG
         eDuId6sJMeWPeQbsOPKcZTQkJLrxuWuwkQlcz9tqCHHpOnptUDZ9byvWVxAMCOaeUjEg
         Edew==
X-Forwarded-Encrypted: i=1; AKwUvBxNX3QYuVZA2pLHNWBaeOjQxzkIWczrJRu+Su9e4QLAEJGX6M2+ppznDTfckbQtS6fsFgXd@lists.linux.dev
X-Gm-Message-State: APuU4Z8d258EHNrL7UbohC5Sl73mtnt/Sa5Oi2KBi+SPcgFtW7pDx0/P
	Ygt1GdXwD934cGhCeIUYRryCr9EJCa214YElqQeVAtAFHgOjtJAUDKyk
X-Gm-Gg: AYBFou1iPmYWrQ1gI26gf8PLZygpeV/mwEOPTxot4zea0ZTfcjRPLceHCUg0rEwdXAX
	eVME/rGw7vsQsO2APyYN2VHBc65fYtU/QDGQzvSTiAKu7iT/oflJY3nykKo/1OL+CvkmlJRAhfR
	I+lflEAEn8kk9WjbYsYOQ8HItid6KhyiV/uRD2TM1xjvXkcm2nqYnEhRWx4ZJkHtfKMYij/cZ/J
	UW+otHw5B7R2Hz04xs5p6CmBxe+JKvGU89WGrGtiJzkTMj5wayHaWHQVx9WoZxLZjbu4HbdjQ7k
	ODp6iI5uvAoKXUavIQkw+txju1pShcimGVtbpTA1MqWuyd7SE5/sDRFmlQByouFaew+mdDuQDrp
	OgSkvz4m80yKr6s2yOle3mYXuFFDWyLgDKQoifXLd6R0tyXFzNUZUgEbC1LFhybxGyHrt1YhXy+
	70cieZz58jhSEDG9FYUTefp4U9F3zWtdltNA1IL8vegeUmOzNZSWgja4SofiuHnFXgPeNw001uT
	tbzQnWtV7wRXqR0oC7m9toIYeYieNK526dOOpBl8fFYj04b3q5bM+hwL/uk4VlBRVRXQ6EqeVK+
	ZYaRk0BO6gMUYW9fn0RAk/ZtTCci9QbcYa9SLSD7V4yN/QXwVdUqLFH8RqS9
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-36a423e52c8mr29321886eec.23.1793811347548;
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:55:47 -0800 (PST)
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
Subject: [PATCH 03/28] hazptr: Add scoped_guard() support
Date: Thu,  5 Nov 2026 00:54:21 +0800
Message-ID: <20261104165504.2430480-4-kunwu.chan@gmail.com>
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

Add a scoped_guard() class for hazptr so that callers can pair
hazptr_acquire() with hazptr_release() on scope exit.

The guard holds a pointer to a caller-provided hazptr_ctx rather
than embedding it.  The ctx must remain at a stable address while
the hazard pointer is held because the slow path can chain its
backup slot into the overflow list by address.

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
Acked-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/hazptr.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index d37792af3493..3372b1cdbee6 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -341,6 +341,43 @@ void hazptr_release(struct hazptr_ctx *ctx, void *addr)
 		hazptr_unchain_backup_slot(ctx);
 }
 
+
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
+ * cleanup.h releases via hazptr_release() on scope exit.
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
 void hazptr_init(void);
 
 #endif /* _LINUX_HAZPTR_H */
-- 
2.43.0

