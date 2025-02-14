Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAED21CC40
	for <lkmm@lists.linux.dev>; Fri, 14 Feb 2025 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739519931; cv=none; b=jDNq+g5p38CY6APjFlgfmnpXOg5CWueMA3s6yjeqHcAtNMn2UbmcmuJNQPhakck5N8wSctOHfMjbLStRi/Pwpod/xBDQDy0iFFMLP4rldw1JJr/IYqdV5uodSAMQKNb1Z5JF+DhNuhX421P5ZSU0zM3Oo0SqHWkAP+qflbMbWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739519931; c=relaxed/simple;
	bh=x2KE4P62k1zgXpZx1Q5Zi/VebToU99bs9e7NR2WaBTE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Z9oCPJ/04DP8ahCH174jjauE3Bw+npKQrNzG1R+VJ+9gyUqX18gXEsmlzz+A+EZPZdGqtTayn64hM845N0KUgyp4nMgxomlYjXFNwRyeV1YiMPfxVCEMEyPUDCZingU12rOK0brcFFoZO/Z7FdIkqLN40HTUE2MhPGUKJSIrORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anbh0ot6; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anbh0ot6"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so4665069a91.1
        for <lkmm@lists.linux.dev>; Thu, 13 Feb 2025 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739519929; x=1740124729; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq34ASCSqMBImRf2FTvSA6r3MMYuBcOZbrtGAE63mP0=;
        b=anbh0ot6quKQcc0UomGWrc3f7ldm06DKJ3eJe/Thbf1IvNeDqffyV6ID+O4KUFtbnP
         reUc1IA7ZjjHRB/g8gaAVONuRkELdrj410Qoirv+fHuwdhAHfjdUhd/1dMTKbi1wNpmP
         V+pY2gNtVsiJ01b+E7c3zUAKfz+01m8i3T0NMnwJBMXW7CBKcHn/boNSnAeTQH9d9Qgf
         I8YRdZtNgFA3GpUtEtYjWqvfVvXwT9fupqxZOY5+JQrllp2von541E0XuJoaDOHOx/0n
         grDi0HTJyWBA1GX67LmYULYDb4CfY6j5EjSpZdWogjuEBQjEPL8xe9+brpHc3pH7OWvD
         lUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739519929; x=1740124729;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pq34ASCSqMBImRf2FTvSA6r3MMYuBcOZbrtGAE63mP0=;
        b=GDpXAi7cGb4WCzCV9XGqKfTECiW8KCGmKYVxQlAp4kRDZvwUp/ExWBgrUXHOrfmCWL
         IQMdhVn2lOhezmmxv85tdNJBgI+O8NXaT7KYSJuRz1iMPXEGiM9+ALGUMpKbg3dCdIfM
         JwR8opdvf1ykUqJ58unzYP79z5mublxpafCTw/c3JvSgT9p4fc0gaANk0ozmtyOr4Rb2
         41YpirX8gRjvoBTjBqGw2S7rE6BKd8j6H/PeSre5qE+v8KFmw+3AY50XZqa6wZn4k7Hl
         /6GLmNTMq1NFGlK5DbASzoTvZ84ZMWbWF9dDd35Y/1IUWpEyi2aQTnwSpQaEH/Q4vvR0
         NzSg==
X-Gm-Message-State: AOJu0Yz46Rwz51xPsFyTFxL+/IK1ZQsz/TXraPupqOt/S+CFAPRkeN60
	SAVaoup/8G37a6GxbVWVZmHIq5rlC6OgupvmVREgi6FFdMiL+exM
X-Gm-Gg: ASbGnctBVu3vQD/5ESBME9CEl1zlnIBsrBiIR1fLPPmxqWLjw/vhMA3N7yHI3cC7pxr
	yIIEuOtHiKLoqoNVFYX4YwjlfD3JNIT2oq4wq8HXF+T/lrOvLsxG9V8RFRMk3Mtkw4BbSX+QHaB
	GwQf/6zQuh+JweKh3AXe5ulTchOjUuhGdF/Q8IZJSHq4OdCuSkueu/4rn8hg8xzsLaZCBN50Cwo
	eQG+KdfAT1kO+si4q5mCNkOilR8l2S8HqPVMNtDvwuObfLqusWuFrcez2x16priexDjY79OEC68
	joWg9sgC9NtuRrl21OjC2TchZpuOhppV59fO0phMZ1tobQNcBeYqBTcQ3CidBg==
X-Google-Smtp-Source: AGHT+IHlbKeFxme2qOlqQOVlxkxvWkzC+lJk9FcPYx2itBG/GTjykSu01w2Jh+YflfhG7Zt9Oj90Sw==
X-Received: by 2002:a05:6a00:400e:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-7323c8f59b7mr10867447b3a.5.1739519927118;
        Thu, 13 Feb 2025 23:58:47 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324fb3a761sm903557b3a.178.2025.02.13.23.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:58:46 -0800 (PST)
Message-ID: <234b1984-1956-4bfa-9b60-20b28514c8cb@gmail.com>
Date: Fri, 14 Feb 2025 16:58:36 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Jonas Oberhauser
 <jonas.oberhauser@huaweicloud.com>,
 Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
 Hernan Ponce de Leon <zeta96@gmail.com>, Puranjay Mohan
 <puranjay@kernel.org>, Luc Maranget <luc.maranget@inria.fr>,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: herdtools7.7.58 is now available
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Thanks to Luc, herdtools7.7.58 is now available [1, 2], which means
pending LKMM changes by Puranjay, Hernan, and Jonas have become
ready to go for the next merge window.

I'm not sure who will be in charge of sending LKMM pull request for
v6.15, though.

[1] https://github.com/herd/herdtools7/issues/1155
[2] https://github.com/herd/herdtools7/releases/tag/7.58

        Thanks, Akira
