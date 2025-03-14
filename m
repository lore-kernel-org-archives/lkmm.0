Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10D1F2360
	for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951130; cv=none; b=cz1Mgjm7A4GpZu2Y/Y3T9j5D8aKkyuOzvqHfexVbI8D4qVxU5IFRP+DLrnYayiWK7Q/Ml5c/4b9ruNev0Y4Cs9FhY75CRmKTBg5QmJ+hq6n+gTh7vthzR8c9N39YNk+cEOYj8iYVrpovayXlJ2QD8R/3XLp63M4vNWKIsDC0hP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951130; c=relaxed/simple;
	bh=wUNvece7g2W/ySVxbYwLL+k7faybV3SJuZ6NjZC2ohM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phmDHjynMZFdPqL1CR2yS/ijkUvBLkKT0bSknRYPicO0+Y0qj83rpKl05FnfinbqrXJtes1m6oBb5AWNOhhfSJGiq+WQU4cdN3n39nPFTGXZQwgmtJMe4YUWMd6sKcJojYtiwREfUEGA7hxAnPx3RxQfvMXkYE6V1U+b+ojWKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIfHHlDk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIfHHlDk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso38804645ad.2
        for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741951128; x=1742555928; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kW9R55VdBcns+UcpZpXgXQpsXEnyLHj+YVPPMTbQ4FY=;
        b=PIfHHlDk1w12PdBXpjsJEVeUvGe2HzPKNNvzLd1WF/kc/h7dR+4T5qIopiUFStjeow
         o31626aJpHLVwDvEUHLJPQtqnkyWbzJwguFLrrgHRsRM2AJkozt1+eLavY3MaZBZav5Q
         Lj2OzenVehNcgIkn3MeRZN+mjUyqdY1i+j+cQ9/u3NgNPPA1G2y9V7Na3RuKtSrtCGeh
         vHJFNqWOD19jxlnYR/TVoD6mXkVaVTsR7h3bHqtLK0iyTjPJW5myPdG/7Ft3WGjmjSih
         eHTL3Z+GISTv/+iC198K2TQv5LtAg2yVHfJwvK4WYooAnP+78ZPtY3Vm0VN0RTIQnISV
         0nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951128; x=1742555928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kW9R55VdBcns+UcpZpXgXQpsXEnyLHj+YVPPMTbQ4FY=;
        b=h7ohPLZRd4KL07pvdZpeHw4C15N0OM3+EtMa1vb5z9mG1yM38ZrpuFdwlE6JKTj/AU
         eTW0B8DpWRYrmG9yyFeVkkVMzFFtusCICNKYBrttlC93sgSXJWKwfoLtUHzK7dqQfFuz
         mxfCr/DCbrsDHtRHqaPlOPVZdCd5nEiGFdPclo5cOCed/DWHot7bfdsKkNRn5e3MPhMe
         HRdmtgvCuJSi2RI2FLfp7ntH6cwr/WwWnZBWlcVdlSBOlY2hwtaPhOpsfDKk9087vg2a
         Fzloq5+g0G5/ieZyYbF5J1IumrpTYQ/lh5mvmxvFUsR9SXqFX8MwW7cbUkjDUzEWbypO
         rGIg==
X-Gm-Message-State: AOJu0YyzZZlOFdgRErOdKBFSkGYFg0KoBD8ZFsszQuc0ZAijc73kJFQD
	phCc4209VGTpgUHlwdjyk4UjCmGAdZhwIfoBkmU4J6ZIns+NUtI+
X-Gm-Gg: ASbGnctuIhU7qZ5q1mWijJMFOAbPI82JnHys5wSXbyUHuQbVskVgf8rUu0T65zKEmh5
	637q1mmYBvupwNXa7g4bxNXMwWvLk2gf6MaEQv+Ryh3Xx9lFtHHc2JSAlTTLbf0drlLAVRbUwXb
	mDRHQZZzcwbvWa3pTt0c95Q8OLUJE9xTds8npmuewko6TxZEdUvBwk4AfZvCcD5r+bwoavxTCnV
	HKJ36yL2Uv92gM87n+/PhcutOhdDfcQ3v26YGk1uOW3vijgyaifuObcZvrhPIjP+f/hSAT3rEgg
	pqQUv08sX3vUSSy0N0tRE77cHh9UEoGc8o0g8CA9cQOkQD1Hjn6WB4JjZ89w+TP7BIqS1Xye3nQ
	XDcVV96MCgWzMCDU=
X-Google-Smtp-Source: AGHT+IGr1vxzx2y/FiLuuRs7uguWQayH4sNwiM65yMs7CWYhlgEIleS3rte3d0OQpM/IyiiHzE5VSQ==
X-Received: by 2002:a17:902:e74c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-225e0a40bb3mr35665595ad.12.1741951128228;
        Fri, 14 Mar 2025 04:18:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba710dsm26785585ad.128.2025.03.14.04.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:18:47 -0700 (PDT)
Message-ID: <cd593ef5-ea52-4b20-aae0-096679cf4c81@gmail.com>
Date: Fri, 14 Mar 2025 20:12:04 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] tools/memory-model: docs/simple.txt: Fix trivial typos
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
References: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 tools/memory-model/Documentation/simple.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/memory-model/Documentation/simple.txt b/tools/memory-model/Documentation/simple.txt
index 21f06c1d1b70..2df148630cdc 100644
--- a/tools/memory-model/Documentation/simple.txt
+++ b/tools/memory-model/Documentation/simple.txt
@@ -134,7 +134,7 @@ Packaged primitives: Sequence locking
 Lockless programming is considered by many to be more difficult than
 lock-based programming, but there are a few lockless design patterns that
 have been built out into an API.  One of these APIs is sequence locking.
-Although this APIs can be used in extremely complex ways, there are simple
+Although this API can be used in extremely complex ways, there are simple
 and effective ways of using it that avoid the need to pay attention to
 memory ordering.
 
@@ -205,7 +205,7 @@ If you want to keep things simple, use the initialization and read-out
 operations from the previous section only when there are no racing
 accesses.  Otherwise, use only fully ordered operations when accessing
 or modifying the variable.  This approach guarantees that code prior
-to a given access to that variable will be seen by all CPUs has having
+to a given access to that variable will be seen by all CPUs as having
 happened before any code following any later access to that same variable.
 
 Please note that per-CPU functions are not atomic operations and
-- 
2.34.1


