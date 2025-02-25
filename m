Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B102225D541
	for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477304; cv=none; b=Mx7r1L5jGiPxSj5HCEWq5wZXgoDsTgf4A12qUL9UXXOBCkAr2NfduW0hm1IIdZiB00fyJdJkkY0f1SwNvvYIRw27zi5Izc4TacL/O9NJibpld478Ri2lSSbceKSjjvGtlzdQIksOns/HpGGB/3Vh7H83QqmEpPMCJ3rMLNJTBrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477304; c=relaxed/simple;
	bh=cE7O6spm8d4MuXc9xyn+9HE1Bc3YExo+VjBcNemgrz8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AWs1Teia2jbUE0RAoqhyAemymADcWzTDSIulBXvmQv6ezIxDBmr8Kzo6hux2pR7oZN9PlYdw4BbAwU7M29T/rjsgPwkVviILgT+B1qkKoVUuYbOLdbaT0fIoUGZckB905wEI63CVGiDwtiOqkqHdiQa+NrVDKhXlgI7OC/kuF1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SW22buSA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SW22buSA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so8314708a91.0
        for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 01:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740477302; x=1741082102; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggE76883CVAeTq58XAi6ffInhl9pLfxkp/xNUdtf8Bo=;
        b=SW22buSAoTcdBJsgZVW/xLgdf8r7Yxxp0lK34gXYdYpkxnr3YVxyQMSNFGZrczqsch
         PtfvR2oR1GSgtJz9nUEPVaeZc88buvkGIM+p9re0hg+8oN49cQWIP9oTqeKH+WjI1Fzu
         E/V1M8BhnUU6cwZiozwY7QIqoB7v8Ll9tyNcuUmGXSZmrvcMFqGebS+ymtw3678p8EHW
         zNNcb+pEotcIqH1azJt/rAaXNugM0KHV1pfV/lkKWjrLkFSXRms2dgt3VEZSUDM5d9jO
         Ic/VbUUq+lWyKSRSdDpLaXDFgCbaUmvOJewnaxi6JyMh+IM3gEL4kxeYARkqYKMLvuhT
         0ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477302; x=1741082102;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ggE76883CVAeTq58XAi6ffInhl9pLfxkp/xNUdtf8Bo=;
        b=GOswtmil7GgNRlRAUTk2ZgAZiOBQiI5hxULLOx5BZPol9idE7eAUCkrq69T5/CJi67
         I9YpCkVlc5OxwASh5kjsoBsX9BrRJQfEHMsxH5GLE0fpjGXVCtyJ1z9ZT2usjAzK6Kbf
         /xJeUtxkt0hEn16gl4vgjWVYrtpAT72+2wk6eFvvwutl9DZJAIahc8UkfBzfAY+eiJ4o
         G6HUPZ7+Cz5TFbdxJarF+FLdhaww1seAbMG/iOvi7o1MnznyYEGhSUIqRjqmGxcMznwt
         qChJeKWPvLojs5QhEsZ5zUGyT19UQYwufpST/ZM6y38Se6ZomXUWrrBvR5sYiT+4m2Vt
         F8Og==
X-Gm-Message-State: AOJu0Yyt2I5Z7HMm2hgdGGmiza3ArJc7UnfzgdjgeIYsuIUWNyk6WUx8
	D3nWxv73FdhklhFU9u6o5Nk+pJf46pmMnviLo1/EZQdHCJo+eQyf
X-Gm-Gg: ASbGncs6jBv+BZLR+rYEthHFuDQOfkAVtzVr/OLaXJJiUmooTUGSW5L9SEWXsZIMpZN
	x1ZskTNa2nPXdETbkWxpO3B14qz2G/PU5MmxG9UCru4Xq5BILi94mgt5/XUbKOyvMQX1rw1yPk7
	6gvbqhZiZ/ehdulM1HZWsBeaMnFkaP85J+K6URvitAeEZIIwMVCoy3GXKMICoF/3YT0ntSl+jVs
	pCeAWRcQxCXFeGsFnzH5+dy0iBgkMZFxm6bs3Vd68TG5do8BxkxnM6qOXUukHjdIfXcodF6ijsZ
	waWkqKMRqkovY7L+X55pkBNdL8+OP2shmEgUmYB5jzEByfjKUBfWln0NR3MRqCLUR9aDZZq3
X-Google-Smtp-Source: AGHT+IHywcQzxGY+cA7LP67Arz8v3W3i/feBTrlb4k1guv+ZglJpLXswiDA1YeQL3y6P8CoWC6pL+Q==
X-Received: by 2002:a17:90b:5688:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fce769a8demr28948511a91.2.1740477301865;
        Tue, 25 Feb 2025 01:55:01 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d51fsm8022328a91.2.2025.02.25.01.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:55:01 -0800 (PST)
Message-ID: <bd7bba43-7674-4a4f-9eeb-3e2b8684c24c@gmail.com>
Date: Tue, 25 Feb 2025 18:39:58 +0900
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
Subject: [PATCH memory-model 1/2] tools/memory-model/README: Fix typo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix a trivial typo.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

As this and 2/2 are trivial changes, I'm using a trimmed-down list
of people in CC.

        Thanks, Akira
--
 tools/memory-model/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/memory-model/README b/tools/memory-model/README
index 59bc15edeb8a..64c860863aa9 100644
--- a/tools/memory-model/README
+++ b/tools/memory-model/README
@@ -79,7 +79,7 @@ Several thousand more example litmus tests are available here:
 	https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/CodeSamples/formal/herd
 	https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tree/CodeSamples/formal/litmus
 
-Documentation describing litmus tests and now to use them may be found
+Documentation describing litmus tests and how to use them may be found
 here:
 
 	tools/memory-model/Documentation/litmus-tests.txt

base-commit: de3ac915f986e6ecc1c219584797c196ff6d1fa2
-- 
2.34.1

