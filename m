Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8E051991C
	for <lkmm@lists.linux.dev>; Mon,  5 Oct 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220692; cv=none; b=X+YqpZ7qeZxDdolq4m77jv1FcI2khS4Mm/RU0DFGEFNJwf4YQmaeINmMEuXYvOzTaLnltNluw+gKEYMLwzKgZ73dVpwgV6LUT9KUTRVtsFmb71Og7QvvLS/hdQbJLvwomg2KVRtqTATqqAcvv1LsqB7xNZ3CPAUXYyjoRL9+2gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220692; c=relaxed/simple;
	bh=bKK6Ka9Gp+vtwgFDDZYR/jwqeinj7CuEjE6r7sAsMFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCQdA3i9dpNNb6Kg2YUBgjZyUwIiZW3ZZctRY+MiT3xF6PxSxnSDtC14ka9LJoGFe42Yq6jV1GL2dK1uvqxzfoM13OeuZpYFOmOYAPpoY6qDcxfScqY3+X+zDplO0Nx9CMGM+MM8gihrk258ygU83IJVsHkYTlSaJhkqVaBTXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx5gJSmB; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx5gJSmB"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1228801a91.1
        for <lkmm@lists.linux.dev>; Mon, 05 Oct 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220690; x=1791825490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=cx5gJSmBsWVyFIIT6551T5gyYYK0zQAKo4y7nuNanSpLM8FPvwKm1d9gL3x64YdLe8
         DPZR2eACIdrqf+maPpYuzgatWgayTpcDwbUc5bSbC1Ar5+MsbYWL1LAbi4Nk5imnv3hg
         TKYfl3f+elOFU9PSqZ1EYgybXB7/RU38cIDhEQhgcEsHJvIuAUysWoRvtodUcrwjyV29
         LqfubzjZyFjKuNIswwoZTRyR+rqDMpoIQusFOrVfeK6G8P9oeUGLBW/0ZIyBDsicuh81
         1zrCs1FVB+repz38+TVd7wecGmgD6DKTRMV8RWJQccraWWVDlN4wIBRJnkTyUoNhKxnL
         43aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220690; x=1791825490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJpC50bJQ46wh7HHA0CogRCPQLVQ5kdzi3EXJci6E9Q=;
        b=G+SN2u5hpa7vG19uFDaZJaNPajW6Hs/1IdkI8t7FrvZ/gUQzJU/NjJkUEUptVkm8/J
         9syEjQ+oqIqJBwvsgh7Mq3NEigHIZT1Jmx3ABCdMkG+4GxIzTiU8hS18/8avaOyBRSpt
         djSjEBIOHs5xYVQrLa5+bE2YAlfkUttPpbVRTJ0MzhETeD2xceOGmHOWZ9igRMMyj5vN
         1TrKlJIjnv5LOadc8j5FDcwBqlznndfVvpFCYOL6lL42GKy9VDHUNh+H3gQrAkwHg0wY
         DsnlNi8fR1uuH1sEYYTpk1UvBzAy6ho0sPuduVrit+HdFJ5Wzt/S+6/mi2lZLbWI5bkG
         JPtw==
X-Forwarded-Encrypted: i=1; AKwUvBz8+P6nU2xj2W+hzcY1mMETvaOoWM7FxK5JbvFu6rremQQfmO/sm33YZj9FL3j0DECAX6sP@lists.linux.dev
X-Gm-Message-State: AFq9FYLtFRlja0+K3WzqPnzhoNKTvo7FEoMPMy16aZVXb0vr0t4uzHxh
	nkzPinfFt34SVieIehkPAjAb5/zxcsqCYtLJ0frXfAnP0BAicei8uwxV
X-Gm-Gg: AYBFou0jsfnJ0jYb6Zhawe093ju121X2aU4Z7P/J4ZhlEXRnJBJQF3Ho7xo6ufmfRiL
	tYRFwPoSTnyVxVru4suCH0Vr6rORDc4QrIz1kd3lrGUHowJcYpXlBXEbs3G5ONOjfprdlilHPk/
	lN74OfiUkyK/YEJBU3HTr0nHqAcRAp5emzYCFfiX0VaSI4f0snop2tp5fY6fbphWHKZvTzsu2Jz
	Tfyp7XjZq1mG9kAOCyDqBC27FLXfoteGUl9zwTa+Z026+vJzp3wesUJWlxpIwx3l5NX0PE0cq2K
	Ql3ev7DNt5B0PPy/gtxQNmfxdE7yZT6P4WijhS0873hXcOtqa0EoOcNid+t5uLqxjXg0mwQ3Tph
	3uPWfwblhfRE++xPo82YW7psX0O14EUyg1QoiL8Mxc8DekX6uY+bdLaYKI9Tv1JPfyZ+1FMcdIJ
	Wm5KC1ouuYRbph+6GLw+Z0/f30G1YjO+KkQtFKIqu7fjKlTjgEHT067roZ+rERDgfa5RCrKneuX
	4NKpFaPkBK84ccCjVs6S1FhO8wusg==
X-Received: by 2002:a17:90b:3846:b0:3a0:bbd8:5ba7 with SMTP id 98e67ed59e1d1-3a6ce996924mr10923539a91.62.1791220689796;
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:18:09 -0700 (PDT)
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
Subject: [PATCH RFC v3 10/15] hazptr: fix kernel-doc of hazptr_release()
Date: Tue,  6 Oct 2026 01:15:24 +0800
Message-ID: <20261005171529.1378809-11-kunwu.chan@gmail.com>
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

