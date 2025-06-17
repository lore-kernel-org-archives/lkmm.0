Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A598F28D85F;
	Tue, 17 Jun 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165199; cv=none; b=FW11bpTgsD4hEF2qazSRrKPiS4tX8edLxK/eDYEZe9VrV6q/R+DCA3Ouw1R+0IreEjrtlHi0SkLj7Z/HOdo+NdImoYb0v49trwgoBMPBcsZXBmACLMOxUym3cVG3BTpp+lqNAmcO4FCWEMwAPnbh8zo7OLJPBJQMeJyQ14Jxqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165199; c=relaxed/simple;
	bh=bQYR6efMPCgHSXc5WbPc2ysqUPrzj3om34G9i+1jBvg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=eWAHxV2coJmFYOnZw3pwttMEM2vBKvfQJ1qIyleyGo2+x3PPTZ5R3eQoLEoCMBo6ot9GTWvTZAmSPWCfx2OtX/DQ7AgDUA042w/gqfGPncjfOMlsWkuICBiIrbeFBn8YQCqAp8UAnXT4ypqLxR88InszChn6b+AFqXhVMvaWzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBSY0k6f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBSY0k6f"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso46753345e9.2;
        Tue, 17 Jun 2025 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165196; x=1750769996; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfUao9xL+Nf+9UmRpe2eBeY78KoI4cSH6kfRJvoG+2g=;
        b=kBSY0k6fpWruqrzncMlOFDXwxVYttNINgP5IzcDpzYhi1xjhpWnVcPPsBCRZqZNEAE
         BqMxv8/kMB/h2sS75nTw+0i1RoaM/MsgCUHa87Isg4fSfFAiarqo5TQlCR34PR7ZLLNJ
         o/XYpfzwJS3J+bHINdJOJsHYSmRAdECJkMIKmTP+phy0lQNYX8EHFe6XM1rRVKyDX73Z
         JY5k+fCqH6mVSMyE0EPjtlqSNcL0nDxkedLQ4gf7xNFla1mv+a+UYMav3th1Qyg8WlPA
         lerOMo/RrDzqbI4qPNwaORxRQQxzbBGCekZoVJ6NAj0Hof98wVWVuZuDQh60lfswS4I6
         dj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165196; x=1750769996;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfUao9xL+Nf+9UmRpe2eBeY78KoI4cSH6kfRJvoG+2g=;
        b=dCc8hM4XEXQqBJm5zgBrNGOTo56266+BBLuGqqrvosgIVYplqusAsbPogr32bDFIhH
         86dJKOSazx3ZAOwu7lQww9x/vc7I3LOXh0s6RW9un34Tm5nh00GXHDH2VOB3wBMU9J4b
         Vo9baqmshRrpt2HGF+bLS7cotamHow+yzRva4FTX6zUAB/XaFCTlcUADu2RvZwJP/hxD
         iY+5hqcRpbwh/IBX/3i7M4RK0ZUSEMcjfXFLhTaLUr9IyRYRWKwF//lHSjQjKLM6fcln
         qZ5rRhysOeMQrj9k3sZskSRE914tgq9MoojbM9Bs4P3bNd7p8Ya8xpklA/UpaN7QomIz
         XL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVUjnaVHFHXPO1QY4k4UFbGeWGOcrgEy6DgOJJn0f3nuNfH7fa7At6cUVVF1Uo+WX2fUTuGbw==@lists.linux.dev, AJvYcCWGAsnqoy6UVZqqzLtyWchlj4QuRO9Po0nxQG2XuZBkwTNJmJmJuki120K/AopAjheN3aExMAdk0J3wwu0bnafA00ReCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywksh6ojyPv5wCm6sAafhymDI4dskAsa1T2Ees+DwBqUSjCd4rL
	SQM3kj5xFeyUYb4s/mEVLovcINA2D9sqIXXe8mutnU/GY0Q+yxTKDHFE
X-Gm-Gg: ASbGncv0h1johU21mb9AlkAdBxbwgJ9f10bqDH0YuxURERhP/jEMTu1cYQ3fCmzh6g5
	gmc6NjvXxSnaACyeQwrpNTbgJAqTS2+Ez/1u7vb+fi0PpWeKUm6u1Dg5cZD5vJb0ii9SiHOf6qP
	IOGSj2XbCEroM5Z3o26cOmcRFOM3be4tXwn3LfZXCI8hlbf4dV1X4K/YmgFxCAdGhgakF/qrSag
	YRtMM8cTC7V639aJeu05oaZJ2zRWwbbjp6+iccu5RHjE+I8UbPMj7gDGc4sXa65LJ+NteK1UTRG
	9+8bjfs1frfWDZfoDxZrSRXRUyPbttJ9nOTgVM0TogKvlf2JL+/W5vOk7iSqxJ1M5QogqDl8oR0
	=
X-Google-Smtp-Source: AGHT+IF61fOL3eHzYcgqTc6vlyac0Gb7tm3KYDOskETixTUcfYre70Gc0Oij3ykKtyQjrqCRI7YAKw==
X-Received: by 2002:a05:6000:2884:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a572374884mr11851638f8f.21.1750165195752;
        Tue, 17 Jun 2025 05:59:55 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm180628625e9.23.2025.06.17.05.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:59:55 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Ruben
 Wauters" <rubenru09@aol.com>,  "Shuah Khan" <skhan@linuxfoundation.org>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH v5 01/15] docs: conf.py: properly handle include and
 exclude patterns
In-Reply-To: <cca10f879998c8f0ea78658bf9eabf94beb0af2b.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 11:38:06 +0100
Message-ID: <m21prilkkx.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
	<cca10f879998c8f0ea78658bf9eabf94beb0af2b.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> When one does:
> 	make SPHINXDIRS="foo" htmldocs
>
> All patterns would be relative to Documentation/foo, which
> causes the include/exclude patterns like:
>
> 	include_patterns = [
> 		...
> 		f'foo/*.{ext}',
> 	]
>
> to break. This is not what it is expected. Address it by
> adding a logic to dynamically adjust the pattern when
> SPHINXDIRS is used.
>
> That allows adding parsers for other file types.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
