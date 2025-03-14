Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E08145A11
	for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951036; cv=none; b=i1lOlZ62Yu/C9HxWDemNRtX5AmR0I78EkM4dZFoEaIEtehhy5waxqu6IjSqL1SXLsi1t4ZMvlChLFh6Qm60cXkBMs6xivNFJyav/jEoDJiLYfF9uOBW2V6+kz6CvAglcg3GRnTT/H0hZxk7ghME9FLy/i7kx9ybn0Ad+zSMw1Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951036; c=relaxed/simple;
	bh=ARpMPk8SBHRQkFV+qcrj6snAi6vSRUiLdxKqxy/0foc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n31Agsh7iVtgXt/4shuhD8v8upqwvkS7qgYwOifEZmZNLKn8BdmrWlrWaYI+P7c87/Q/gu5/4zMMB2MxShGwWWWvRKdO+bV5t/9IbSGlJdEhMJuFC56ercYdkIGW29JAf2jg2MCeZf2ddY0gDO5rc8jSkTh7cyTFDskAIn9CmzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsIgFUoo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsIgFUoo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff187f027fso3572452a91.1
        for <lkmm@lists.linux.dev>; Fri, 14 Mar 2025 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741951034; x=1742555834; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84hssImPhuH6NYvg0TBsS0X6NjWF8YR75VUFsfs6SyU=;
        b=YsIgFUooDK2PDABIOvNHWZxX2BwH+LHwcLhWLKMe08FYqLkKtWAKKQoAoDIM2tNXg1
         nSaoa5Ys75vBqcIxfkiS0tiH/I052OSYoZ+yE3dAanVW+EDv4Aw7zeEpQ7OkKDzb3lK3
         7KbePR/6egEBlvJyGmyXIswxwvgRH8xaY0PGuwpMSr3kDB7F42/05YdOaKYNCX53fn7n
         NlTzcxeZOOsxzwoMwmdPrTJvyOndSP4HCoBjr66f9BZViGTt+KYI2BUoV3xQ3OOLWobg
         QFDTpQhR3yZtEeh1Sdco3VFrbVqBZoF3Lt0V9PP3kos8kykLKGHWfHHwMyKj+6POsz9W
         xdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951034; x=1742555834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84hssImPhuH6NYvg0TBsS0X6NjWF8YR75VUFsfs6SyU=;
        b=oiEB0z7V4EQbZE6E2QERLkycIeDv8VHttv8z71yELYJb4VI9sbh3ThcOCkEn7+ORFy
         8j+t8rVLuchavx4a5kD3NxXCDmZD47ZrVpBL2vALzSgLME/Pi+OtZPvROcRc77MKfSUV
         pzLon3y9lio7ZGSaKQvCo2jlmVrAVPxf9CyJV81syMFMUUbuQXrvV0e57DIBNq6Ce1oI
         6yca0wIIy5YgNyYtOKNGi4GhcjCuuhXxAHvOrM9pr2jfL+QvwYRE3NssqefWiGih9K0Z
         JM5w6a8nt817Q8a2M5Nuwk665Eb6VrS1VyKK1hy5UdSbmodcQc29Ssg3IpEkSeAmlynH
         0iYA==
X-Gm-Message-State: AOJu0Yx/mAjqfrgVi9R50KUT7CBqRK/2vS5KhMXl3jMMdnViZNcICncc
	+gJ0qBDDHidfZh0MY/LwZG6YiUtcHegilQnBV0ZGBKp+Tb0afRq6EtbwJA==
X-Gm-Gg: ASbGncv9uNxsXnmDrS1N5717VH2C7k9Bd82RZnnm/6dWgOIhUZt7K+Wr3yAowOJby9z
	+/d5JeNFrWGSZIHuvSTqzsoJjtFKyMs4oVJkZBHoba8w1Fy5vUPNVSOf/K62yV9146O4OwYLZWw
	+iZmtbw4mLy6j7eYTxDv5CCzSk04IPJaa/ac6ODT8SvrUaMSl9dqgI8RdG6gXn9/FBZvu5H8ckD
	KIZRZfHrUyhTrDTRW9pMoY/mxHtT01+mhUjEbCtrlaxFN04/XveTHFW4KUB1/FpZRJYAxVgKXIa
	o2Othb9X/cgWKxZTs5Si0OPg9Jmu4s4vkJjLtxjtBkw8GkPaBeGhjC/sjCdxL/UnFHA+3OxVl+h
	LcD6U7/ZnwrEOs/I=
X-Google-Smtp-Source: AGHT+IFaMdN6YyEBtiXiT05hf3S0SyhPuKluR9R+BG5EYusOEEEMkr/UGox1p6a+56ZS8LX0gDQUnw==
X-Received: by 2002:a17:90b:2742:b0:2ea:8aac:6ac1 with SMTP id 98e67ed59e1d1-301521a74e3mr2875387a91.15.1741951034272;
        Fri, 14 Mar 2025 04:17:14 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153b994besm776057a91.34.2025.03.14.04.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:17:14 -0700 (PDT)
Message-ID: <9981e802-d201-4030-9922-b48c71126904@gmail.com>
Date: Fri, 14 Mar 2025 20:10:30 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] tools/memory-model: docs/README: Update introduction of
 locking.txt
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

Commit 9bc931e9e161 ("tools/memory-model: Add locking.txt and
glossary.txt to README") failed to mention the relation of the "Locking"
section in recipes.txt and locking.txt. 

The latter is a detailed version of the former intended to be read on
its own.

Reword the description in README and add notes in locking.txt and
recipes.txt to clarify their relationship.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 tools/memory-model/Documentation/README      | 7 +++++--
 tools/memory-model/Documentation/locking.txt | 5 +++++
 tools/memory-model/Documentation/recipes.txt | 4 ++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/memory-model/Documentation/README b/tools/memory-model/Documentation/README
index 9999c1effdb6..43602f7822ec 100644
--- a/tools/memory-model/Documentation/README
+++ b/tools/memory-model/Documentation/README
@@ -23,8 +23,11 @@ o	You are familiar with the Linux-kernel concurrency primitives
 	that you need, and just want to get started with LKMM litmus
 	tests:  litmus-tests.txt
 
-o	You would like to access lock-protected shared variables without
-	having their corresponding locks held:  locking.txt
+o	Your immediate concern is to access lock-protected shared variables
+	without holding their corresponding locks:  locking.txt
+
+	While it is an expanded version of section "Locking" in recipes.txt,
+	it is supposed to be readable on its own.
 
 o	You are familiar with Linux-kernel concurrency, and would
 	like a detailed intuitive understanding of LKMM, including
diff --git a/tools/memory-model/Documentation/locking.txt b/tools/memory-model/Documentation/locking.txt
index 65c898c64a93..b29b3a978df3 100644
--- a/tools/memory-model/Documentation/locking.txt
+++ b/tools/memory-model/Documentation/locking.txt
@@ -1,3 +1,8 @@
+[!] Note:
+	This is an expanded version of section "Locking" in recipes.txt
+	focusing on accessing lock-protected shared variables without
+	holding their corresponding locks.
+
 Locking
 =======
 
diff --git a/tools/memory-model/Documentation/recipes.txt b/tools/memory-model/Documentation/recipes.txt
index 03f58b11c252..ce531767adfd 100644
--- a/tools/memory-model/Documentation/recipes.txt
+++ b/tools/memory-model/Documentation/recipes.txt
@@ -61,6 +61,10 @@ usual) some things to be careful of:
 Locking
 -------
 
+[!] Note:
+	locking.txt expands on this section, focusing on accessing lock-
+	protected shared variables without holding their corresponding locks.
+
 Locking is well-known and straightforward, at least if you don't think
 about it too hard.  And the basic rule is indeed quite simple: Any CPU that
 has acquired a given lock sees any changes previously seen or made by any
-- 
2.34.1


