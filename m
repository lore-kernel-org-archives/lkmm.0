Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDD4D179C
	for <lkmm@lists.linux.dev>; Fri,  2 Oct 2026 17:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961060; cv=none; b=sJx5jq2wIPiO4M1HgTr1jeezAGlWoiTGiM2DtFYGLS4rBElYVXb4vD82dqqbXiqrq4AIir4XMXJAJ3ivTqJ6PXBHCF3jBRjxTUmbjifWQrk/0cjJPSjWDma9rFFrb3tQXVjAQnlCyVhLQwoCU61utH7dNpoLyUtuYFMAkH8pZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961060; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3nSodqhk+gQ90vgLumb/SQoah0q1l8ymEVEVlYyKytzKBtrkh6Idx0Wrr0G0gSpjLzvWFsAb9J1jJAXJBVWISSPvUfwpT3ajsUsOd+EBnzcgnoywmUDvxC5BGqaH0GRlUd4mD6ezowRH8+msqhw4dxn3DAZ5ctU0V/DuZJMoT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOx5FGS/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOx5FGS/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso142245a91.1
        for <lkmm@lists.linux.dev>; Fri, 02 Oct 2026 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961050; x=1791565850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=AOx5FGS/QsNBykgaHIcinayclbaY6grXe3Y8PPP19K6pdXdxr8kRdiqzKAN5rpGYg2
         6UAWWBi6qwcZFFu0e+WTEYGoPwAWmfHbMHgqOoyG4+angOYb/f4sm/S/hxHrK5urMuN9
         WITO8Ux4BYo+ccaMC6mkaqZITVUZsZfYw34Ly8hufMosyiCpUDq7sDb5YQu49O9inqL1
         0UEzpl2RkC8lRsG7guHKJYrL2CLAbEQAIci0WTMuqtETzARnO45Zb1zPqyz+UDszzkm4
         DRJUpJHPkx3Qr1A/D382XTVnRl+xREZr7Gt+nMKRnv7nuc/a4v1JSqRsb9jw/ldOTDGT
         KCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961050; x=1791565850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=MrbGIk9SX7WwUbdbbG89qF5n0YNb7GkV6MHlSS9V8IiqUh1jXzBaHZQ1IAVPYoAu7R
         cKmDaoYh6JlHuOj4lhSSftpYKoqKMeC4HctzyujAt0iMeOjGsMR5xiV6ZaX2aAzWQ/1R
         8M9vd9xmVysOEBzotlCPPNOa6McpY256Hc3z52OdPL77FqMnICXuF3ztu9WE8PekSluO
         dAtJEpIUiX7EyUkTPoCOWefju/Nx88cPJRR/8xIhVs5xmk4Od+cJ+Ph31TMEborvQeny
         UAUYw76tWcyBGaYoa9l5ciC4a8h8riX3vBSxDSfWpq5ezK7KDRf1yaPRmOKb98q07YmG
         5lRg==
X-Forwarded-Encrypted: i=1; AKwUvByOs2yPExzk1OHqjNq0hNakNFTIRA1bXqBAwuBFM9SRkM3WjzHS8mxaDU2EQ7Sm0NpqTIC8@lists.linux.dev
X-Gm-Message-State: AFq9FYIgB3xLo/p0SQOM4mx99zBPFIUZWJYsLUIO1s0fa2olGYrkpG4Q
	G1h3WZ0T/6Izht4ex0u3QNvu1BOiKfjn0Cb6FZt1oWzM8LCUmmR0OuO/
X-Gm-Gg: AYBFou3d+558Yg4e2nNO/iHRIfA7GEJK+4MaCHkdemYJ9vGnUTuVvYE9MQI0G4Q8pe8
	WRJk+E5HwBzm4ONsTC9IVKAiKWcwWQAyRpT7Y4xwAg/8+9/4hXRUCm/P5NoJle5RcX7Q4NVgpl1
	/VDXknmb2cFrht+GY+ccgC38JRUPVXseXVe83hShC1HPcQaS1uDbdfmxNKhEYZx8KrzoN9bS1rT
	OA5r2jGlN7fpGdnyKBl2NH7LZsYjclivb7Tx415B2L/DRc0CjsoTMYyXqLMiF0Ae6jS3YIg1726
	su1E6lH2vAV5qJBqOhk51pu6HYCDrlfkg92I5F3sP1U/mE2bEYG6iQcygCjx8sx5nXxvaEWL3M0
	5fIrKs4txKORuiWNFtfWYm6indoqLcv7yf6LMFlSjDwr4XupBXmIpMvgmY3GAj2Ds+E7vWkT4hE
	2MfFqj6A1NRfUCFt/ZX2M0eNWN2qZHMfK1TW3Rj/8/N0+5XvMOCJsFpQk5/NcRIr1EdeoIxclJ2
	GuYk58mfB7JH1Zy61lydrqF/sTA
X-Received: by 2002:a17:90b:28c4:b0:3a4:97ea:f0d6 with SMTP id 98e67ed59e1d1-3a6cecb5167mr2765857a91.42.1790961050063;
        Fri, 02 Oct 2026 10:10:50 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:49 -0700 (PDT)
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
Subject: [PATCH RFC v2 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Sat,  3 Oct 2026 01:08:42 +0800
Message-ID: <20261002170847.3653663-11-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second parameter of hazptr_release() is named @addr, not
@addr_p.  It is the address passed to the matching
hazptr_acquire().

Fix the kernel-doc header to match the API.

Fixes: 17969a0e7f7e ("hazptr: Upgrade kernel-doc headers")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/hazptr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hazptr.h b/include/linux/hazptr.h
index 4ee02d23abc9..07f5d9ef5a6d 100644
--- a/include/linux/hazptr.h
+++ b/include/linux/hazptr.h
@@ -293,7 +293,7 @@ static inline void hazptr_release_debug(struct hazptr_ctx *ctx, void *addr) { }
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

