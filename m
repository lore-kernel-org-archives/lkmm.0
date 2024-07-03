Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C029D1DA319
	for <lkmm@lists.linux.dev>; Wed,  3 Jul 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018046; cv=none; b=IuZgsmTIUJaX7CWyDiKOoakNTbnBh3MeDwi4UOOq93cSeDzC5JEVlc45wt6CDnJLSZ9NsNjiL7J3SGGjwLJ08KBLJVlU3biqa07PNmKL0BYj4AMc6BlX1UpVLlGD7LXneoblS/T3x8EO0R5U3RbLd1LhV3co3kJM5n2G0omG8nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018046; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=hZVgvTG/Kj8l3CBKrWQubpkbnRqm2pQgg09zfvtBEj3ZGP4Guvfait9CZ7huTkxJ42iotDgeQ6Rp3laeac/r7sl4XTUriFTdPh539qFbJEryrMCcw2lH5Gck1RQZMdf97fq2g/A+rIT4VJB7LJ0ALAwrk9ngU1/gx2FfDtl/Okw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=MjPDlR1H; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="MjPDlR1H"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so11944182e87.1
        for <lkmm@lists.linux.dev>; Wed, 03 Jul 2024 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1720018042; x=1720622842; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=MjPDlR1Hroj+nlV6SvfrjOZ3kL77T+EVQHmksnnOcdGlBqYOvkjTp1vtXnoChfaMmo
         ZfG2rn5vZM5JkGbeW5g9LzSV3YVl+98eGVlkFrS6CSZgH4w7AGUnTyTl6jB6zRDI2APu
         P5kizor5xkv/VAzcolB+aP5/A2kGhPf/8FWNb2PySgjcmFbirIXn9Tm39B7a9rd3mZdx
         3/pwaIACGjm4BmqcLFnkUbefJikC+ZhQ8qiKNUJWoKe+nDEKeJlkb4O0oZoRRFF6EEK5
         C9edmEQd+PshzayRBUSjjC1E6oqIzPaYG9ToVyNMnbITaQOXtMmFTr10qfLBLYxvKpY4
         Kcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720018042; x=1720622842;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=os/18Vb1466t3nUxQWNijxezSMWYXvFCbpgNLjnzOu5gbCsIN/uCZ95KYAf6DNn5AQ
         jGHmdlGgUHuWIF2XaLHiHCyvbKL+wckFsRcOp++20xzthLlM/5xaUH8J3TL2RIGuTffB
         xyYcOVynDkCX1Ep+zBnYgJ8Ff4KtaPJsF8sppC1QcFtVSj7in+0Ci52pzQdszactFFBK
         SmkQpHUihfHkE64X1KWmmiL71E8OrSn0aV+uf3Safinzn1DWImGTjK5XAnOdfziXZZ49
         RZavPp9ueLMmxh3jbMo1Sv/VUiBTm7us9uEtL6/2uZOnM/dXouTF7F77nGo+EkOv2BGN
         I92g==
X-Gm-Message-State: AOJu0YwJw/Otxz18z+DcyLlWkCfCQjEnrH833t3yJLX9hywvwbSBA4Ru
	frolyJ/MhbxUnvF5rdIP/VlwQ5beKzYt58IRtWxTDVWQC23PyofJXjTWeDDdN8wi9dwl8jAdQPr
	04qQLkUH6RI32ekA+GEUaw/HKb6/q8kyfqtyRPAi/TxWAMp4fUPOZ5Q==
X-Google-Smtp-Source: AGHT+IFav3tMWLIYPLUEFN8Um178fhMEtZf0nPC+RWEcwmCgU1fRTCnYlGRurXBGYXnZM5T4TbgifNERpWSy5vRkPAI=
X-Received: by 2002:a05:6512:138e:b0:52c:df74:1577 with SMTP id
 2adb3069b0e04-52e8270600dmr11812433e87.45.1720018042375; Wed, 03 Jul 2024
 07:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Wed, 3 Jul 2024 20:17:11 +0530
Message-ID: <CAH=dH9_eJHRC5R7h91m5jauOH5E809tsymF18LPg=ZxEWQ_AeQ@mail.gmail.com>
Subject: Test delivery of lkmm
To: lkmm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
