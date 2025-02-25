Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76591186E54
	for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740457697; cv=none; b=eQdatYfyacDvpxvbXrFDS4noySj6AmNAoEPXCZoNjkn3l3zCuxfYOpNSZ82BWsabdufyokdLRRIq/5Er/A2yomVntDClqSIItCEjkJsr2xjhQ+x/g4rd6MMfm9PY3SIr3e5FaBBaTgS/JMlPReFemZiNkpohYkRS071XuKFzJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740457697; c=relaxed/simple;
	bh=WTxSpawuERK/ZBZBLzdcu4rQ44kJS8Ior+f3QaFbD4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIsSp8j9P5F6CKprZf+NCAPNa0W8b6CETdwO9Wt6Ggaub0+lsFaNzpYAUJMgydmLl8TTFPeKXhaOkb6ygqOQ8pPvPJgRFwc/J860oXAfErO8/MTsIAP7hLEIDI+69xxhF1OIaQQzJLAb5rBKafkrZT+0Y0v9pQ5kG25BaUPFkV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkX19WDE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkX19WDE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2210d92292eso2491195ad.1
        for <lkmm@lists.linux.dev>; Mon, 24 Feb 2025 20:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740457696; x=1741062496; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DwzRod25NBc/IUFnmtj6zNS9Dw9ri8JzR7lTV9LJ3w=;
        b=lkX19WDEp51jPpZQ9MF5JRkE6GsruJXDUdOCgZrnlgE0ljPsjHX9CjalA8aqqb2lGL
         OJUeJSzE5872XgUaQpMPCyCPr8cx8DwGEAq2UaoZuzNMS/Fv5cJdxGSNI8Azb4h36ieN
         s+3jhbvqR+3WaVwwVDMGA1H2+h8WXN+16ZChQSrObvRvDE3s5/aiLmm397Y1Tp2yv0UK
         pu6OtfLnSiIeF9EeRBznYH/rUFfcCPxF0FFV7U9qPjW8xM7hnPpvsQEeTsAHhECHt37L
         10PORBHcGjM9pB2+SJVNlufY/TVYdN7LMCv1O02r0HvuE1VOWb4TF+CyRCIXYyyPg0/W
         fLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740457696; x=1741062496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DwzRod25NBc/IUFnmtj6zNS9Dw9ri8JzR7lTV9LJ3w=;
        b=iDzRbSpjfOs7RWBPjyiAPLGRZJp9DZex8YuYpCGBGJRCnwd/vx4aMLrmLdqBowzIu/
         nx+v+XPwZ1GX/M70fWjLTp0g8fT9hSFLULoGge8XpXQ8ZgMkUBJ4GR7U8eThHdEwBaWC
         OrhQ9N4QhTky6/vdqGyg+7Oxep6UPe1ybmOwgPYV/0fsrenA2v30foyL3HNh5v4Zot34
         M2fMsL2c5PP1afj+EaA5Hib2tkyJjEFyUMkxOXOa4aWnFBW4QcfDAg3eA/1hEXxt0dq5
         i0WfhlnK4uWs2cpruHw9j/6H1rjcYLI+ieH18qkiyfnngoJ+bDfpV3KYYucryXDwwZAG
         uWvg==
X-Forwarded-Encrypted: i=1; AJvYcCXfKMKW4oB/0XZ8ZcsztlCV/1zblBH/lukYYKnOkvH02cisyMA2tV18cqw1LyhycysJRX1s@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl8qt4H/u21A3kT8J6mb9M9y20Qap1ADjVzpaeS+xHMaEW3CCK
	RDGUmeOsTbMRL6a7sZSRsuwbvG8+Sol2lmWT8QEnYqh/4CwKrg59
X-Gm-Gg: ASbGncsL+WmNDget84Kf9bRqlVb/6drL+9pnOUgAmVHjIaUY/LhfZ7rlqVEzgfc/gPa
	rCNXzhpRIa6PiMZ9itstLeoGsFRXzV22ytNDhEup8xeXI5nXoq4NzA2jlFn+2KKxVEtHBFADbEa
	EZ3SOUF7ZksIdzURB3PnO+BLz5hr9jcqCGIFj3YDwOZOsaQ2kN+3KvBzPLpFXpIvJr8+mMjykpz
	CSxeukEZECHkwgsA2ldcEewzyzVmRa6eqzND9uiuI+JetptgyM3PAPgFzax/H0phSO4uYo/mVyB
	GepB2K8C+ygEp4dCqPunfYpjtfn6ymepxZBJvfBQgfna/CiIf2nBjTajl1KCKZAhqP5NXVkT
X-Google-Smtp-Source: AGHT+IG1fPJ5D8vBakIA4rQzjp6ci4WMzPWgrPPMcgkL0SJnknv5G1QU8PC/Wd/vT1m9BvjnKBlxCA==
X-Received: by 2002:a05:6a00:1390:b0:732:5651:e897 with SMTP id d2e1a72fcca58-73426ce80bbmr23106330b3a.11.1740457695745;
        Mon, 24 Feb 2025 20:28:15 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a518a10sm500364b3a.0.2025.02.24.20.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 20:28:14 -0800 (PST)
Message-ID: <ec893c4e-b4eb-4279-be66-1ca7e6bce7b1@gmail.com>
Date: Tue, 25 Feb 2025 13:28:08 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH memory-model 7/7] tools/memory-model: Distinguish between
 syntactic and semantic tags
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, lkmm@lists.linux.dev, kernel-team@meta.com,
 mingo@kernel.org
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8cfb51e3-9726-4285-b8ca-0d0abcacb07e@paulmck-laptop>
 <20250220161403.800831-7-paulmck@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250220161403.800831-7-paulmck@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 20 Feb 2025 08:14:03 -0800, Paul E. McKenney wrote:
> From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> 
> Not all annotated accesses provide the semantics their syntactic tags
> would imply. For example, an 'acquire tag on a write does not imply that
> the write is finally in the Acquire set and provides acquire ordering.
> 
> To distinguish in those cases between the syntactic tags and actual
> sets, we capitalize the former, so 'ACQUIRE tags may be present on both
> reads and writes, but only reads will appear in the Acquire set.
> 
> For tags where the two concepts are the same we do not use specific
> capitalization to make this distinction.
> 
> Reported-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Tested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Tested-by: Akira Yokosawa <akiyks@gmail.com> # herdtools7.7.58

> ---
>  .../Documentation/herd-representation.txt     |  44 ++--
>  tools/memory-model/linux-kernel.bell          |  22 +-
>  tools/memory-model/linux-kernel.def           | 198 +++++++++---------
>  3 files changed, 132 insertions(+), 132 deletions(-)

