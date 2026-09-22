Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4C42E40F
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066719; cv=none; b=Jh4lMaXduUtSqPc4NYJMHF/UDh1Byoaa+B3YoQkW7/QuUm7vJOcVVVWBFYGPRBMfPrHM7/QGQLFs7aCbCHthbBCS+Ep+PfiwkfdyoIlEzgcNFkSnDeof7BGk1yPoEzFyzitdSs64mxVD+o9AH5fkjOnxHFzXfAHNsM25bbapUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066719; c=relaxed/simple;
	bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzHs0Oj0FJQcByVGOHrKRFqtI3BfopdAt1bEJzBLfyZvE5tXet7FoHxXrNqCX5huOCY/KpDPh3qMVmRHW37xRarhaZLvKql0442/yyfrQwZPYx37ww2QnwDpW7zwaploxPFNKRAKwbCij4rR6jt6hBXREG3mdxpT8297pJEJQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnGvy0nh; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnGvy0nh"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so14445865ad.1
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066717; x=1790671517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=gnGvy0nhlA1fdcN9fog0EU1hKh81cywWBe1eGj5G13VRqBl+L/+reg/89qiqo42ywo
         12l2olJd3Cfba/qhHSgiDfyVno1/ipuJRYA1M3tgWfsBJNCyuMZzjPMKdhvMpnrlifZ8
         MQqjkOAPAbqcSKijE4O73whAiWh3HX1o1Ex/Tq2/NjV0rmKf7NwH05RBuhmYy6MMQa/5
         k8yL4cvA+fe3N1th8wmBXsJOj/DtitnB52fYDgw4pBuoc6+RLjSBWHpyWrA2ldfpwHHh
         IYSn9OymsiLuSy3S4VAzp4ubfRnB7nBAaOfUrcxT2OK2BjLvWRSN+o/gFy7HfQYiOger
         HV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066717; x=1790671517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWOXTAtkNKBbD+uEgNV1nTyqhko/HqdFlDPSq6vVwJM=;
        b=QAopAMBDepfYKkrhTc7lVIS59/dfRhpZlq1JHbpETz38jA3wG/jMLu1h80yOCjjzP1
         eRonVy5Ym7lI5918FzDkwBvbvFUdRp5I59JrNQ+Uh7Ygod7Dn6kkGJ1Zl4o8I1Yg+ILL
         FlKE875edPhC5XpwAj/jUHDnfW6uO59Al6v2uXooaBTbtisyyGjQCTDfXsz5zROrtkx8
         KPOmas8BijPU51wAuOv05zeMbYZbOTSP/0BmtE3A/RRgFykFdfaLRFjY0Co2XNHlUEHR
         mNte1Bql81TvLcYhVc39/Y3EWHb2vxCUUs6WfJu+QGt+0re58t3Y/iRAI5ulEGZznzT1
         qbWg==
X-Forwarded-Encrypted: i=1; AKwUvBxBuJcuKEIxM02c1Oyte/NWS76Ss8WnwJcfzA5D+egdpDnklgTodpGcjHQvkNUt4HP78vK6@lists.linux.dev
X-Gm-Message-State: AFuF++kjncrXMckomvbztQaVE8JnFXdq3G+iqjwcAszUF+aDnfLxDN+z
	82pIhYFM5wdSc8vknH5xWFD5EFYmWgj2PXA0GYKs/6r+apSzAasOI4zG
X-Gm-Gg: AYBFou0/t/lkxl/E/IpCN0QYstNacbWTichUmYWKoi/bTcYsn1lIOEhruVJ4KCTnMst
	EhUC1iIh3ucFPDXX60dDoBPvOrnMtbofcrnQKwRn7Lnw5qBUhAMI1AbaQNSdU9oaiH+tLEbscY5
	w06iWNWRNOFDxqlMTzFNSK0rmGw2HKr06fxTByCWc5Nk02iwy5VwBhhe2G4QTBBrM1w1DDCY40P
	/v0i7mvs7g/YRG6L1USQS+n8sHTlNntEwsQKItOsoQm/i6mu+8qp+F7pIRiZ+B0riSlpLn1jbh5
	tA79Z977naVcV88KUSzBj9Ogm9MJv5LI0mIt12Wdbl5jFJexg+soPOdJO/MudkX9mnaKn5gUbWQ
	jmL8qI0U3T7n+8BGRN3A/yCjr0Viuo3R8Ri+s2/u+okQOqmm7f9QIEliGpWDkKAdL2widFer40V
	bI8ZYt7Qd6W0liucY0TUGxJwb4RRTY1SY2B0ZBC7i/yp3I82JH+R31oghTVvdmLc4NRyxp62267
	MRBrShQR+J0b8E0XrTNf95wnlEgc43eFijYaOdi
X-Received: by 2002:a17:902:e952:b0:2dd:c100:251d with SMTP id d9443c01a7336-2df60f2fd27mr3267025ad.38.1790066717422;
        Tue, 22 Sep 2026 01:45:17 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0588e9sm6100495ad.76.2026.09.22.01.44.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:45:16 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	dave@stgolabs.net,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	urezki@gmail.com,
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
	include@grrlz.net,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	lianux.mm@gmail.com
Subject: Re: [RFC/WIP PATCH 1/4] hazptr: add shared-scan kthread
Date: Tue, 22 Sep 2026 16:44:37 +0800
Message-ID: <20260922084447.58084-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arI8KNUjYNFBwKf8@MacBook-0RXW5>
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <20260922070950.4173245-2-kunwu.chan@gmail.com> <arI8KNUjYNFBwKf8@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Boqun,

Thanks for the suggestion. Kunwu and I will work together on the next
iteration of the shared-scan design, including your idea of avoiding
per-synchronize allocations with a Bloom filter. We will also run the
rcuscale comparisons and collect IPI counts for the lockdep workloads
you suggested, then share the results with the thread.

Thanks,
Lian

On Tue, 22 Sep 2026 10:28:24 +0200 Boqun Feng <boqun@kernel.org> wrote:

> This would requires allocation during hazptr_synchronize() and I would
> like to avoid that (it's going to introduce a "allocating memory to free
> memory" case).
>
> Mathieu brought up a useful data structure for the scan: A Bloom filter:
>
> Willing to give it a try?
