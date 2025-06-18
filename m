Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF17194C75;
	Wed, 18 Jun 2025 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214542; cv=none; b=Q6P4v/JOLFahnTfQkElAUFFdzdI0PER/eJjQm4fIv0sEMWVb9r20VyoD9e93vxxhmbV5GpEeAZedJRAya2gf7bzGyjByGKRmNILWBpqD/+1BzTIPEWlcKDD8xDPMXoX6BjL9qNibNUXrepHcSEFgb7stGvSj1DRScr/7nvZvUQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214542; c=relaxed/simple;
	bh=7i5+1Vmj56/aTiTJ9aGMjarno6AIHKUGDq5Tb5xI53w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qp1uyn0t6Ihj2le3grGWwxxXCn1+khWCGHvSwU4UOhjyuubBmqgiIOh1SG7i6cIZf/loYKlcmNn/VKWIxivDhdOxsBkC3iUo7bsa+QPofMPaWLFcJe+RVjLygN305D8RsQKuNFbkhADKxL0vOGVTRI4XxrPoq+Qt9Tr/RhrWFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXKwIIh3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXKwIIh3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234bfe37cccso82649625ad.0;
        Tue, 17 Jun 2025 19:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750214540; x=1750819340; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fuYMA/57H5BAmU65jan5lqjjy5ZSUjRygUj6a7SK/2Y=;
        b=HXKwIIh3+4LOUdWlqp1yY65yAiYKWYGk7m1zfVFLsUjXTlcNazSFisnJnAr8/YGLmN
         vKaKjL19FtxJq0ectdp8SEwoozvXJTAn30H7Jx410sWwzbrZTR/5YMoXAzFT2PiFqOHW
         FoqiPC/Tj74pXJmkTmiy3HJLLufB8ZOlw3Ypnj8kTwuAPnweH6zqje2qLCNpZT6PwyCj
         r+l2jz5W6EgppDYxP48hAXCiTEMvrARkC0XBENi1qordA6vQsBBWFjjbkmY5OWI8qVNn
         vRz2csvWKG51Y5N5XasuT8f4bQCnB7kuVCPzp7uke5MgDMV6GOPEofqZqBVQMGWb+c+4
         p+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750214540; x=1750819340;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuYMA/57H5BAmU65jan5lqjjy5ZSUjRygUj6a7SK/2Y=;
        b=bdwE/dyX5E2orU58oS9tVvVe70ZHZO8l1Chb36T4zeJv3oOJ4M7Ko6ThvRXitHF3ei
         spOK6T35OVGs/9dfXsyeaiWSb66DPJinFLhDNXuYS+i9/j9dTnGaj0J5rm9amOEgIaZq
         +khypiyO+/TZukpp26IFAhs06M3DOEURmqV8KJH9+HGBYauXFD+8ROTUmGXdFVVHdC5a
         QX5ijAbmkk5IGYDZngt541miGyP5BiGuLMymeTaMpa1HEinVXQhb76ipeLXGibsErOv1
         s+WM7JmeclTsFEy/hzyy55Bdf5KGXvao5prhXLLPgMV1ouiFsFp5fxXHF/MMLxV0q/AF
         6Lkw==
X-Forwarded-Encrypted: i=1; AJvYcCU8aSazyyQkEHr82ThGnoIndOtp95V5t4yKg09QsZ5vDaJvy0BZyxQ7LG6O9ztihMH90m5h4UV5vzdwILcibDHLx1FFqg==@lists.linux.dev, AJvYcCWBTU9aUFQRWnanCckNX6RMoaG2B7Vj4L4vA4FHtfJQ/FX/FoxlZdlejnHfpUYY5mQB/VQHGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2sqtRkZnM0zkgzKL734Zsu559WtGX/qfA26W9UwsdWHvjJJR5
	Lwe5Swra9vQjwA5fJJ8PXB1goUYfk/iLvq+klFo0hpaAoTodBYDBNXy9
X-Gm-Gg: ASbGncvNO3tg3sl46meK+x1h7lDyZs2PQ2Nn9yelrNxtAj2hk2bGBBhQ/pudwr7t//u
	0VAkm2G2eFIC3sFvnc2fVNl3zms7jly5fgZxeP6xRvU86HvhhNeBpcyDq5bRLFOAEfbZeGU1WGn
	CWwOkaoFlfzNgRzTRva0EdpwNCqdnGql+6d55bqG9PZ/3eVNPXCpqYocd2rwSylwFlXOGj+zfB4
	7Qj0TuLMsRsPPveLwkUaDc/CBAFUtYUN4/Wl5PdruMbCVTcB9cF6rv7xX9OWumtiUWAvsf7xeIl
	rR+SLuaf9b9OS3HXqtljEkLvESlSgK4TNlH6wYymojC+xjd3vrrNHhEIHO1gkTxUJ/c7hnSGXrw
	oi4AfVu+FG+G07GYKvKdd12HCZHBnress
X-Google-Smtp-Source: AGHT+IHvoHz8x/cvMCuTAeyI0cA9D+sbDRrQQCvuQAcnDzndTzmiRTQy44tnbpaZaEQHbGQzSCzMBg==
X-Received: by 2002:a17:903:2347:b0:235:91a:4d with SMTP id d9443c01a7336-2366b0185e5mr212827035ad.23.1750214539698;
        Tue, 17 Jun 2025 19:42:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfc68c1sm88027995ad.238.2025.06.17.19.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 19:42:19 -0700 (PDT)
Message-ID: <1adba2c6-e4c3-4da2-874e-a304a1fdfd25@gmail.com>
Date: Wed, 18 Jun 2025 11:42:14 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v5 01/15] docs: conf.py: properly handle include and
 exclude patterns
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Breno Leitao <leitao@debian.org>, "David S. Miller"
 <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Jan Stancek <jstancek@redhat.com>, Marco Elver <elver@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>,
 Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
 stern@rowland.harvard.edu, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
 <cca10f879998c8f0ea78658bf9eabf94beb0af2b.1750146719.git.mchehab+huawei@kernel.org>
Content-Language: en-US
In-Reply-To: <cca10f879998c8f0ea78658bf9eabf94beb0af2b.1750146719.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

A comment on compatibility with earlier Sphinx.

On Tue, 17 Jun 2025 10:01:58 +0200, Mauro Carvalho Chehab wrote:
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
> ---
>  Documentation/conf.py | 52 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 12de52a2b17e..e887c1b786a4 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -17,6 +17,54 @@ import os
>  import sphinx
>  import shutil
>  
> +# Location of Documentation/ directory
> +doctree = os.path.abspath('.')
> +
> +# List of patterns that don't contain directory names, in glob format.
> +include_patterns = ['**.rst']
> +exclude_patterns = []
> +

Where "exclude_patterns" has been with us ever since Sphinx 1.0,
"include_patterns" was added fairly recently in Sphinx 5.1 [1].

[1]: https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-include_patterns

So, this breaks earlier Sphinx versions.

Also, after applying all of v5 on top of docs-next, I see these new
warnings with Sphinx 7.2.6 (of Ubuntu 24.04):

/<srcdir>/Documentation/output/ca.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/cec.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/dmx.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/frontend.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/lirc.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/media.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/net.h.rst: WARNING: document isn't included in any toctree
/<srcdir>/Documentation/output/videodev2.h.rst: WARNING: document isn't included in any toctree

Sphinx 7.3.7 and later are free of them.  I have no idea which change in
Sphinx 7.3 got rid of them.

Now that the parallel build performance regression has be resolved in
Sphinx 7.4, I don't think there is much demand for keeping Sphinx versions
compatible.
These build errors and extra warnings would encourage people to upgrade
there Sphinx.  So I'm not going to nack this.

Of course, getting rid of above warnings with < Sphinx 7.3 would be ideal.

        Thanks, Akira

> +# List of patterns that contain directory names in glob format.
> +dyn_include_patterns = []
> +dyn_exclude_patterns = ['output']
> +
[...]
