Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F7410D1B
	for <lkmm@lists.linux.dev>; Tue, 28 Apr 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378698; cv=none; b=Ixovoow+gtRhM1KYOooxVaNzkl4+z11i2zW5mms+j+mqNthREVlzk/iPFxyIFWuuzQ7uzi+1VsBXqQygQegvt9CNHQrXq4n+5tp3dwkPCC73HHsmuIOaF0NQCVen5qQMHrVCtYUnU5InteFhvIdeqjMXSgiq7J5ONHMhC16pg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378698; c=relaxed/simple;
	bh=S6uB/kQ0GahgMSx7sXFJL4xx14PTZSpyC0k2ZBUykBM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Df6pWvU5GpR+EbBK5kvBbHhXc+UJgj3t8ryNmK8SwbHk0jQOAKJqDjH8NK5tpC24ZEVLZqRwwdL6V/++mxz/X0rMXWabi2OtnrwnbLUr0pRBqZ+i23TFBj6URpliiwlqYWqxBgvmQydr7DWyU9yBT53M1uieRidu0ks6Ex7BDKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOkh+gUA; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOkh+gUA"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so5068135b3a.3
        for <lkmm@lists.linux.dev>; Tue, 28 Apr 2026 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777378688; x=1777983488; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPyQxoUotYrYw4f58af+v+KgDAXByP0f3tgKXpQ5qnw=;
        b=sOkh+gUAGmg4kNJKTbngnsULFf32P9hCr/NHwltJChvF9bhjyg5Zn2wwA+DbOT6q7S
         wuJdDhDEYv3YZ0kSwXqXlGqD9+h/7MWwpwAUrW+AIINlf8PlN/hJcTkOlAomtvXSLVKo
         3vb90+sUkHWbML/6ICmfH8xXhFihPbm+oYBPzre7y7NmugE7TZvOY3ckBX1kMukd/8CA
         mYMNKLQRYTvCuz8bGDsmVJbqxGPrhkAq2+Urh9nm/eeI/AJMPo72jjVbB9X1wKop9oPo
         YsyYWfsBm2Uor0RJb2gkkahcD7XwSfhXS4NJolS3Zlb8zyznLQWnTGsaSpu6MqOeEFV1
         I6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378688; x=1777983488;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPyQxoUotYrYw4f58af+v+KgDAXByP0f3tgKXpQ5qnw=;
        b=a2X8ku0XXEfZS4JeIXQuSJHInhw7EH8zqvvqTyVTjCGdntszSXzBJi2MhQS7sMvsJZ
         QxcU7sh1Z9f3/nYsrFJFrRxb2E89q7B5blvmE1WQ4A3xAyeIFq8s5ueIS6MwMDgdBlLE
         izr7b6UKCTWv2augs6LUCWv4eZIhV7//rR2YdWBOYf7b4C30SWghKt3rUVSE7dyKtEt9
         ePJMh0LBKxxGd5QS6ac6hijDJvOCiVS+ZxKqMYRlb+ptFvwBO7yhtk3X4+ewR1duvrgn
         j4X0a/g+n3YnGsxBsrrGXtGzeeaj5XGuiWkeIiKDe/6Js95hOQrDXhrZ1yUiqZVyVspW
         ybXA==
X-Forwarded-Encrypted: i=1; AFNElJ/GLTNK1NsIAjy9jqKK74jewFPmIhHBTk2Nj51ro+Vtgt+q2FTEAvqzt4QDXPou62mlnnvP@lists.linux.dev
X-Gm-Message-State: AOJu0Yzddax5cELH0uv7iTnOoKaWE8Kzu049VZZoz4/HNTW+ZpjOJGA5
	6F+RPNSXNjnVdsfhVn/kATifQqSPbe/TtStwUERDo31O7l9bKgcjL7ms
X-Gm-Gg: AeBDietso+cRKx+FoEGc/TBtLHUZ5fY/NwviUkAFpm7lsvW654ECMMdgt21Mglc16+k
	pJNI5zPFokpH5xUN6XTrDZc9zfZcNuIhIdrw8rs2+gTNugP/Vuq+AhWa8IzdQ5jeanlsKWK/P/+
	MMtfIdDzKEbdfJFMT6OqGEBMTS7mlm8Y3ZdxjiCVexZ/0KpQLtJ7y4uG9N3YYR8lJKvE4imPWvV
	j7BYkJJ/aafbLVb4xTxS3uMgvjyBIvtEs0cLHgZMaAmBjxmPlygiT24JN1XLvQZmHfcXoHmpvS4
	x2t6o6KqludJgTzm3q0oBHQYN1Qa/LbJy2iRsUlsKLGnP24o8XWxLPfeXOrpyfvA5aTJKfgdvYZ
	ZTlVbaj4SnxzJMuJTEwoAR4aSfqA3o7UcnHmHEd4UoFFvok50SGdWGtlS4DgHlLTKUfEXXIDL5a
	52amU65zF+Bl0BBtq7/mPbuiy7VUUM8OdaM8x5SAWAqYdGTIXeoAG4OKhgtw1L0NSBcXaAtfpJt
	NH4IBg=
X-Received: by 2002:a05:6a00:2990:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-834ddc7705bmr2700941b3a.46.1777378688198;
        Tue, 28 Apr 2026 05:18:08 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf5705fsm3249810b3a.42.2026.04.28.05.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:18:07 -0700 (PDT)
Message-ID: <80206f78-d057-43c4-a64d-edeb59c53925@gmail.com>
Date: Tue, 28 Apr 2026 21:18:06 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, lkmm@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] MAINTAINERS: Adjust T: entry for LKMM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit 8f6f1636e345 ("MAINTAINERS: Update RCU git tree") updated
LKMM git tree along with RCU related subsystems' tree info.

However, LKMM is maintained at Paul's linux-rcu git tree at the
moment.

Adjust it.

Fixes: 8f6f1636e345 ("MAINTAINERS: Update RCU git tree")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: <stable@vger.kernel.org>
---

Hi Paul,

While I was skimming MAINTAINERS for other purposes, I came
across this error.  I'm not sure about "Cc: stable" if it's
worth for this one.  It's up to you.

Thanks, Akira

--
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..d3e9c648d596 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14732,7 +14732,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-arch@vger.kernel.org
 L:	lkmm@lists.linux.dev
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
 F:	Documentation/atomic_bitops.txt
 F:	Documentation/atomic_t.txt
 F:	Documentation/core-api/refcount-vs-atomic.rst
-- 
2.43.0

