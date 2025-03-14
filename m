Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019991E8338
	for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950911; cv=none; b=HNQfTOjqXxWEkM+JzGhuynLmZU8llM7OH4ihKwLeAnqmw+1tFHrqzblO75nJvsM7vB/S7uirtwFa0ZpPgcvuHbPf642Ahq8SD9N0F/xcpiWd3aY6KDZUPIBFHsOAfjaqmGKpdaM34jHZCsnNdg9WlkyI9nV96TRGiWnHMqwfwxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950911; c=relaxed/simple;
	bh=f7fUmMctZBmjNDdgmj8DXB175b8Om5Z50mjVjFK/WpQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=HyuVML377/NehrFH/kgSd5tQnS4ZSsqTJTqmS8lsJYsAHkhL8XmF+edIDVQ/OA8bfC0oyxSo68XkzFRDCICdEMv+nVh2nCG4I/XSnsJHE/gRzysNjHKWO/Z8kh9agOJBTiATEvbTT1pGX0JMMzGKue3VTSSR/VJ2TUfdQ2E5EC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrUw2GQd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrUw2GQd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so34857835ad.0
        for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741950909; x=1742555709; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZTVBzJhk7f/9BfMcHaf5gq57U+cCKR8vClOTonQB1o=;
        b=IrUw2GQdSO6M1+8uw88Sfvv6CV9vakxYj1LY1ECwZQZUYsdaohjxVhImiRisY5LtqJ
         4gvpW0XoFpxrUNcl5lzZ74GOlpJjKVwi8v3CzBTKSx7v61/EF+nNrKYsIyA2n5Oam+Hr
         Uqb81baKEm8WDdjrbPT6KL+Hsk4V0CyYNz0GO5L+IQOOmj/Ep1NsIZxhhDUJZm80+GdO
         kzMJivjiZOjamWheG6fIvMvQkrm2bNu0uSsWvZaBbd/8AxYkuFAGOLpu1SRNvZiWGVE1
         McMCSMFsGIP9hqBOz8bvM+LqUnnqgXmAEVtFxFFH2DJx/hQqrEWBufdLxpE997QYOcbx
         SE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950909; x=1742555709;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iZTVBzJhk7f/9BfMcHaf5gq57U+cCKR8vClOTonQB1o=;
        b=beNhpDXpNELSvJJnwryjyQTOobsi72UivSlzQREk1FqJokAx6zk/wNLMMJXk+N9wOY
         cClVT0ZCkPqgOHJQmsfrgBvHgoJZF5PNC1/dm+KOze94TtZUl6+QpwSLEoRO+9TD0xSK
         1I6D8CXLqTLNR488Uauipb9A06TgA9iJLaz+ptZMsvSmpcsSGY0PpXrx5ZbOxFJv8uwe
         M7OKoNH0BmLyD2SjCSLRlP03urpL9owrVtXasq0dvQndKpgUzo9wS40F3VqbI2CC+cda
         zXqLD8VCofUHb3aeDSNd3JXs7WbsdJ1UL+MxcFqvyED2f8Gqr47KAXPK90sWZ+cYhdPA
         wAAA==
X-Gm-Message-State: AOJu0Ywp8raP+Tvh3Zl1va94MiSvzYvFQdSY+3BnyG5H1JlGEQqzhcZ1
	5RGt+EAwU1g1vGH0CeGY/LBDf9ksvyVrU7Zy3EMrhBhsVOuMZY2ulbZbfg==
X-Gm-Gg: ASbGncv43CgHBQ21Ex9hWColiy2pmqBhRABttK/4f0P8gm8ZVUNR886yo82NLaaFtnK
	Dj2ANWIJ8oWkG47gCQYRwrEk9izsXGuLaHIaX6mrjKW+Jxoqskddk6CWirvJKCjbO0O+39MYGyi
	PtZGmyzrD4cDV8jWwo5NydXfWvN1s/4A2o2XnbyB2Dm2VCqBd3iOdVCIJhBQ3SS924O3QGkENXe
	M6uGQFg+RbeLUjUQxsmnuBeTual8Whn9KcaXJJAoF+MNHCVSiaE+Wo4leFinBGWnI31VuFibYLZ
	RQsW4JlqfweMdpw8KlFR+uGI2shV0ZDCAsJdEPZPjhn9qzQmyDZouksBir1elN4ax3Px735axpz
	cG3ELf+M7WUKfabY=
X-Google-Smtp-Source: AGHT+IFMZfDr5WEGOcKkAwE7gSqUN/PfSh0hb/tb3So/pfkLE0h5eylblZ7m55r2RzCMSYKWDvQmRQ==
X-Received: by 2002:a17:903:2cd:b0:224:721:cc with SMTP id d9443c01a7336-225e0a52150mr22077755ad.13.1741950909135;
        Fri, 14 Mar 2025 04:15:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a80fbsm26718395ad.84.2025.03.14.04.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:15:08 -0700 (PDT)
Message-ID: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Date: Fri, 14 Mar 2025 20:08:24 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/4] tools/memory-model: Documentation updates and fixes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

While re-reading LKMM documents, I noticed minor issues here and there.

This patch set is a collection of updates and fixes resolving them.

Patch 1/4 clarifies the relation of locking.txt and recipes.txt.
Patches 2/4 and 3/4 are trivial fixes of typos.
Patch 4/4 removes a link of MIPS doc which does not work.

        Thanks, Akira
--
Akira Yokosawa (4):
  tools/memory-model: docs/README: Update introduction of locking.txt
  tools/memory-model: docs/simple.txt: Fix trivial typos
  tools/memory-model: docs/ordering: Fix trivial typos
  tools/memory-model: docs/references: Remove broken link to imgtec.com

 tools/memory-model/Documentation/README       |  7 +++++--
 tools/memory-model/Documentation/locking.txt  |  5 +++++
 tools/memory-model/Documentation/ordering.txt | 20 +++++++++----------
 tools/memory-model/Documentation/recipes.txt  |  4 ++++
 .../memory-model/Documentation/references.txt |  3 +--
 tools/memory-model/Documentation/simple.txt   |  4 ++--
 6 files changed, 27 insertions(+), 16 deletions(-)


base-commit: 87d07e135725dd8976a5ddbc7dfa968198d9ae91
-- 
2.34.1

