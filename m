Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD422D793
	for <lkmm@lists.linux.dev>; Fri, 14 Feb 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532370; cv=none; b=U9VqhHtzuq92R8Dgwzr3cZtzELRHstSLsiH1qpWvjNtDFDgUQrhN07qfCT1sfRTzBFxdlxrTHDhUQiIoxHrqReR36poJ1SMrv3cCbp0/AEvqFOvNJ7IuSxExK18Hw58AgDoBL/ZpaBQFjrvAi+Dby0ikImjpwfFDa+TOqLf83as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532370; c=relaxed/simple;
	bh=/ZNasigpZFKF1GXcep6ADDsBdzqQxyuo+zoK4OB23QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nx/zfBrvqEraqub0r6zxYj2FHmwVw3EVLmN/sXKEAnKqpvafygwd2puVUgUz5NgzwOTEyqFag6Ee/I8TVjNgRjY5zOmb+aGMb2Q+exir1B7TaJkR42iNanjByBfoaSl0YvWE9oXXn/LDrjtz5uSZzQVM7nQQVRjJHeiZhJpvFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZSQlAvn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZSQlAvn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220f4dd756eso6292945ad.3
        for <lkmm@lists.linux.dev>; Fri, 14 Feb 2025 03:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532368; x=1740137168; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ecSp75NyRJ+nrRnVaEV7WndRjiDv+20xx0N1gsObHQ=;
        b=YZSQlAvn4KambzoGZINapAycjquqX1KBhnHIrkl7Mt1MpQyMfYkobGB/629pnjaJQy
         Hncq86F0i9yq/HRGeVszuLY8xk8U2PulcprNivy5/LZrdMljUTDKT9L8Q6QZcCD/o2E6
         p0wJSBSD2wpKEK/INYmHItwKFbFLuZrsLwwzO5NN3OY3HEsPX4OmBD+5QHQ7FmPPMcAZ
         gjs48+RXEoCqxxPf4UP5GlO9tejTWeC6ALooa9VDO51LNkrakCWxZh4GuurOHBUTBa7z
         0pQMNjbUpMeCXDI5/GoTHef9GvvWpZ+tVe+gQNyT2UmuBdHsHJF7pgxyFBdBMOt8B4Mf
         KG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532368; x=1740137168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ecSp75NyRJ+nrRnVaEV7WndRjiDv+20xx0N1gsObHQ=;
        b=tjV/44fEe+fOUTnksN/P+9jrPQtaT4PDrVDKx/6OJ1uF7bbEhp1dnBchTAsVsHNKDJ
         hTJcdATwEVBA9l4OcjWSJmcsaOihNTwKRMUtyrcvUaBH29c5K2kuUZYZqOrDbBZNHZNb
         ZNndN+SwXW7JX2jU93VmTG7tleGzV9Xcu7zEX8QSxPDEb0KEfScX1vZPfdv5Ek8DTSp6
         Utz0eOu17NrGSq0gsM3kGJNkX86Is3KfZbDp5WIM+/xGY8+bvF+xWqWigzGSTcXEfPSr
         tMhJ1qmXmEvE76ji+3G6SlVK137TDk61GPi/TBze9VL9I9D26LXdDnyb2bB+0SRyrrme
         O3jg==
X-Gm-Message-State: AOJu0YxhM7dGMY9ev2gEPayxV3C8F3Da/pWcNvor7DZLRo3rzNOYDO99
	WybLxBmqXFqKLa3kSnl/5b270Jp2+4MPlQR2KWeAM2S+a8f5c49n
X-Gm-Gg: ASbGnct90kySGzHU9shTo3w0CmSAX/ZEdGdbfhhvBvC1y706uXL44IZVy67BDAx0tkT
	egQ4V9qNhlqtsmO/mVu7Kv5VdJz/Ztn+P1G1dIN971DGmG62fzzZTgfQZ2PY53PivJcd2r7hknQ
	gtDiOvrRqmn61Gqaun7pPu7cG5nG3zvyJDMFMAhPQbvgs77FnHj6dxo5kcbeRe4G99OheF6m1Px
	9qgXszCAVTkCXmUnAWqsy/eS6GXewFxgYH3WRH+3vdCFeitV2D6W2MKRDVCiblzkEOOcpt+pS9v
	1CrfDnzamHK4Xkzmje+hQP2LRBviDElcpKJ4S8lfudESsVG+ppv8aSZz+ytH4w==
X-Google-Smtp-Source: AGHT+IGsAfj0nl8OwVVuV+UN0heh0qwNqWMHp68E3/TjEfdHYFE3SPii0cIXamst/AQw0so/sDQhjA==
X-Received: by 2002:a17:902:f683:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-220d20e8aa3mr107597245ad.31.1739532368230;
        Fri, 14 Feb 2025 03:26:08 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f1esm27203535ad.51.2025.02.14.03.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 03:26:07 -0800 (PST)
Message-ID: <ec97f28e-31ad-4a45-ac87-fab91e27d4ee@gmail.com>
Date: Fri, 14 Feb 2025 20:26:02 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: herdtools7.7.58 is now available
To: "Paul E. McKenney" <paulmck@kernel.org>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
Cc: lkmm@lists.linux.dev, Hernan Ponce de Leon <zeta96@gmail.com>,
 Puranjay Mohan <puranjay@kernel.org>, Luc Maranget <luc.maranget@inria.fr>,
 Akira Yokosawa <akiyks@gmail.com>
References: <234b1984-1956-4bfa-9b60-20b28514c8cb@gmail.com>
 <e52c415b-7469-41c4-842d-f15e32e1d80b@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e52c415b-7469-41c4-842d-f15e32e1d80b@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul E. McKenney wrote:
> On Fri, Feb 14, 2025 at 04:58:36PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Thanks to Luc, herdtools7.7.58 is now available [1, 2], which means
>> pending LKMM changes by Puranjay, Hernan, and Jonas have become
>> ready to go for the next merge window.
>>
>> I'm not sure who will be in charge of sending LKMM pull request for
>> v6.15, though.
>>
>> [1] https://github.com/herd/herdtools7/issues/1155
>> [2] https://github.com/herd/herdtools7/releases/tag/7.58
> 
> That would be me, and thank you for letting me know!
> 
> Would you like to submit a patch updating the required version of herd7?
> One location is tools/memory-model/README,

It is already taken care of by
commit c6476bdc49b3 ("tools/memory-model: Switch to softcoded herd7 tags").

That said, its Sob chain looks confusing to me (provided its author is Jonas):

    Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
    Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

This should be either (Jonas as the author):

    Co-developed-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
    Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
    Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    
, (Hernan as the author):

    Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
    Co-developed-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
    Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

, or (Hernan as the author, Jonas as a submitter):

    Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
    Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Jonas, Hernan, which is the case here?

        Thanks, Akira

>                                            and there might be others
> (though I hope not).
> 
> 							Thanx, Paul

