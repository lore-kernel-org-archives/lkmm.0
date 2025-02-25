Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0226389C
	for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477413; cv=none; b=qO060J4wNFKFzX80h7Frrxza+LYYX/LtzPzUikjdFnznNtKBE1DJUd98Wo7cfEEquWodMjay29XwS1qWUJtIfQL6ZnPVhjUsLf4lvuixaaGX1bqNTpgMz2/aD+oBqxJT4F1/6mcnj1y423hXZ5nX6R/8AHSkKITdpCXRk+evxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477413; c=relaxed/simple;
	bh=WLrnWK2+CHrNieCqxffSgjS9YRSLeW2wVafInhcP6cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esGlYXqtFETBFlZPxkpxGwdQcmLlcZpf00pbT2A3q1fA/sY81ULtKU0dmK+Q+mc4YAzUMc4burgj0piEj9uqNonhyDVAwiZZKdHgFLuDoiJYmNmUm/SlXvxNhgmMUvfKvxm/ziHS7J2VVBcxU7WvXJl7rCDbptbmWvMF3tG07AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMgUlzwg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMgUlzwg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220d398bea9so84911905ad.3
        for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740477411; x=1741082211; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gOpuD7b3bbWD/di99VldgS9yJfYZ5YqBFHt/sGPsMM=;
        b=WMgUlzwgRRJdNuKsnk/HBzR7KTNIGRafpoXb5F2Z5/EGBtIj4ChDY0uTeGHwRRIED2
         2fKCAeMqKFO2KlECcA90B/Rwf7jBlclWVNmegoDOxna2JhnVQ1W4rRtha7F3sqCEoVmn
         L9sFKrc3E0Knd1oDhOWXJxgtZ+f2avVlBTR8Y/VMuM+ospWE3KYaHbvI/yduJI6MxnqI
         Z30XPQE/VcQNxIaNh3UGiwrwzZjm4BWstcehw5jSAgR8s7czy5kPV/OtrKtguDaDR/tQ
         DFTSg49/y6gIrBho1Zil/Eu3d0tSUun81PbeEYoo3/9EeAsTgD06ojzQ4ddwD89QeWUD
         yOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477411; x=1741082211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gOpuD7b3bbWD/di99VldgS9yJfYZ5YqBFHt/sGPsMM=;
        b=Cva7aYPqTkxTgcmfpTF7wbryD1Ip/F0kPnr8GjELCIeS7fgrRkBlhMEXgjVxcynbbO
         BfNseW+l4+u4UzhZBHExQYYGra357esI+aR6613FI7ySMUkf/sNZF5Vfa3tYlNlej9I7
         z6MmXur84rqQJnCQfMmCcTTy04QpEoxlOLECbmy3ESBGwEw32T9XnbWhqo9rxTgIB7bD
         NuzYGDIEV91GP/zqIcBZissK3e5pxpvKEXopUupIju9RbYEewHq/wcgADlnXn6HHWrHk
         MSau09giKbuDGD0C7xY9U0OMPPe+vGiPijRnkYmV/FOOhbJr1HG0vh8CfUJqAdduyldl
         hXTA==
X-Gm-Message-State: AOJu0YxDQh6eUuN/uviF1m6KxnRS/DOBi2/m5X4NUf756KJ2UVX6JFpB
	HOFDErnvLeic+UtPxwIaIjeB2/Xz8Jx5LKhZCPWWmNa+36lOEijz
X-Gm-Gg: ASbGnct5P60C6wamBAXwN2pEbbDRWVKoMtNqk8qgIKIsBgQPtSwSU7uCjSKeP3R8omi
	qm7GuJk5KxFSEqRoBOulfPewTwaWBAdCeEPCBJKegDsEfAGbdyR96FNIVCPY6HVnXuLjrZaQQWQ
	KNcL+yZ/rmrX1UZdDQHKhObG3I3taSk2BOgHWiajT86yeID9ppIwBxD8Cyw/INf/4aexrmnpVM4
	wzSJSEgtxP2ZOtJli+7cGEzts27PHQWrqUq+HGKR4YBtNuki8cp/o3fV51mBe+eBw24/Gsbm1x9
	ReH6MDSGR1Nm5oqUu7pXRDIZC7MFD33/G4KFYlOi5vp+WFS0fTwtCHDDIFyb9M5CmAHt+lA4
X-Google-Smtp-Source: AGHT+IFZuoAQxUGpyo2O0OFlTXrCGK1LzThWCKp445G5v9QQWZ/d6LpMkRJ6SIkLd3QlsFouXD5eZQ==
X-Received: by 2002:a05:6300:189:b0:1ee:d9a0:30e4 with SMTP id adf61e73a8af0-1eef55b49cdmr33404390637.40.1740477410972;
        Tue, 25 Feb 2025 01:56:50 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aedaab3546csm961449a12.63.2025.02.25.01.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:56:50 -0800 (PST)
Message-ID: <013585a0-7e71-4aae-aa88-15cdc76b0990@gmail.com>
Date: Tue, 25 Feb 2025 18:41:48 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH memory-model 2/2] tools/memory-model: glossary.txt: Fix
 indents
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
References: <bd7bba43-7674-4a4f-9eeb-3e2b8684c24c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bd7bba43-7674-4a4f-9eeb-3e2b8684c24c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are a couple of inconsistent indents around code/literal blocks.
Adjust them to make this file easier to parse.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 tools/memory-model/Documentation/glossary.txt | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/memory-model/Documentation/glossary.txt b/tools/memory-model/Documentation/glossary.txt
index 6f3d16dbf467..7ead94bffa4e 100644
--- a/tools/memory-model/Documentation/glossary.txt
+++ b/tools/memory-model/Documentation/glossary.txt
@@ -15,14 +15,14 @@ Address Dependency:  When the address of a later memory access is computed
 	 3 do_something(p->a);
 	 4 rcu_read_unlock();
 
-	 In this case, because the address of "p->a" on line 3 is computed
-	 from the value returned by the rcu_dereference() on line 2, the
-	 address dependency extends from that rcu_dereference() to that
-	 "p->a".  In rare cases, optimizing compilers can destroy address
-	 dependencies.	Please see Documentation/RCU/rcu_dereference.rst
-	 for more information.
+	In this case, because the address of "p->a" on line 3 is computed
+	from the value returned by the rcu_dereference() on line 2, the
+	address dependency extends from that rcu_dereference() to that
+	"p->a".  In rare cases, optimizing compilers can destroy address
+	dependencies.	Please see Documentation/RCU/rcu_dereference.rst
+	for more information.
 
-	 See also "Control Dependency" and "Data Dependency".
+	See also "Control Dependency" and "Data Dependency".
 
 Acquire:  With respect to a lock, acquiring that lock, for example,
 	using spin_lock().  With respect to a non-lock shared variable,
@@ -59,12 +59,12 @@ Control Dependency:  When a later store's execution depends on a test
 	 1 if (READ_ONCE(x))
 	 2   WRITE_ONCE(y, 1);
 
-	 Here, the control dependency extends from the READ_ONCE() on
-	 line 1 to the WRITE_ONCE() on line 2.	Control dependencies are
-	 fragile, and can be easily destroyed by optimizing compilers.
-	 Please see control-dependencies.txt for more information.
+	Here, the control dependency extends from the READ_ONCE() on
+	line 1 to the WRITE_ONCE() on line 2.	Control dependencies are
+	fragile, and can be easily destroyed by optimizing compilers.
+	Please see control-dependencies.txt for more information.
 
-	 See also "Address Dependency" and "Data Dependency".
+	See also "Address Dependency" and "Data Dependency".
 
 Cycle:	Memory-barrier pairing is restricted to a pair of CPUs, as the
 	name suggests.	And in a great many cases, a pair of CPUs is all
@@ -72,10 +72,10 @@ Cycle:	Memory-barrier pairing is restricted to a pair of CPUs, as the
 	extended to additional CPUs, and the result is called a "cycle".
 	In a cycle, each CPU's ordering interacts with that of the next:
 
-	CPU 0                CPU 1                CPU 2
-	WRITE_ONCE(x, 1);    WRITE_ONCE(y, 1);    WRITE_ONCE(z, 1);
-	smp_mb();            smp_mb();            smp_mb();
-	r0 = READ_ONCE(y);   r1 = READ_ONCE(z);   r2 = READ_ONCE(x);
+	 CPU 0                CPU 1                CPU 2
+	 WRITE_ONCE(x, 1);    WRITE_ONCE(y, 1);    WRITE_ONCE(z, 1);
+	 smp_mb();            smp_mb();            smp_mb();
+	 r0 = READ_ONCE(y);   r1 = READ_ONCE(z);   r2 = READ_ONCE(x);
 
 	CPU 0's smp_mb() interacts with that of CPU 1, which interacts
 	with that of CPU 2, which in turn interacts with that of CPU 0
-- 
2.34.1


