Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F0022A813;
	Thu, 26 Jun 2025 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982364; cv=none; b=s3JdbeT9mfqlTmnA7sjYdMqoNirURs9907nGT0NUSfpBFxTX0xtpI2WgiBY7TpzDeGxXN6ZpgvhSGpnTY0z6J8p3ckgYtxJbkq8YyQBSsD8pJ3d6NJwGfEHywLkfinFXU5M5w7qvAdqywJrBZztiRkS3k96tWKlxYkO/LEPireA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982364; c=relaxed/simple;
	bh=s3rbMWUAfYhIRKU2aYRNEwpl6k00a31yw5xuU8prP3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sd4oOTUNL55jAxBhEQaO6WWW8PHXEQ3/Rr1sUjksq9/JZ7mqtP5mK93iFljZBYjuR+uN0sSuluFiA2q6VB7oyQeiQogNrduCMnZCZE9xj83408zlaMvVWnTx3Z6O9Uj+URKAfI1N2bGv96qYoBn0rMvvSu0uaOjKeSQ3MFF1Bgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FihTM8KH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FihTM8KH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so2091449b3a.0;
        Thu, 26 Jun 2025 16:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750982363; x=1751587163; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MU802fHFDsWEcG5O/JQOLJRXUp/Mx/sjo2Oncuu4jl0=;
        b=FihTM8KHAgT4ltimKVVnFBf+wYh48aR5cRSo9DOKAgD6zpzQgDaNHb5Xtz9uI5cOCg
         2SRvdNoiPV0jj9vTVBxj4ge5ZHqScQmqrswAJaEoCEuC163f3mcfRMNevh0dnzhxEceO
         hefEmRZG2hgdDEaoExbyF4VbmCAB9eXyFjUQTEPJu8IlF35CEasDCeg0stLlyDaUC3WW
         O4evESxLp7QrhMoigK3JxxLxeozAL6lWr3uDEjh3iczIzlX6AIQ2lnP9lNIQTfD/VzYY
         YXvbxwTz16hAPBAZaarDtZXx/Ydew96vPm8QCaFeohUrv39mMJIGzTelx0dg7nHfRyWh
         zS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982363; x=1751587163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MU802fHFDsWEcG5O/JQOLJRXUp/Mx/sjo2Oncuu4jl0=;
        b=ZSg9y3FxtUAFaxeqVc7hZ8yh5JayYM0fc+ztwJpGoQRZ20MTdDDRnoHwq8DrDNAhOR
         5ag8gAGBZl6KaXHcIVceITutkLZTODXWFrUNlrOOsTWTLTLmYNOvzvrBQ4atGBHOSOTD
         d4HDGLoqd5K1B0btcH9JYVyMI1mDP3VLBdcFv1LWhPyzeZTyYrEC7dkyl2OdJEYyU7bd
         vFgMvpVmj5TseZzXX751UxQOcNd+CuElAHmp11B4njyHfVZaoyNyRVBEa765OoTZkc3K
         EZkrPscG+ABEmISvTjjYM4ZfciryXDTKv02aBmgmfl2rViAeV6UTO8aFLfn5XbW4nEr2
         WTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Cb+zrxHpJ9XAoPm41+4xIYQlYmTtf8Hf95U0QJ6zYJqQr6kZvhZcJzF0vwYonhZ+Wj6I4Q==@lists.linux.dev, AJvYcCWjKkE00+j1KJ4fbYYQogBVSGu6+qCBHwxiMnqyaxb2rEV4fnC/PLpVBdWPM3OYzLNDSa+wLFp4M6ZvytYHeaMqHkNywQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHg7cIAUJ4vsNL8zXFyadij0P5SOOefc6hdcbWOD6RyQe/KJzs
	IBkWfCcidtjrwlkxI82wpUDdCTia+mviCK+Q1dOsJfonR216di7nvObV
X-Gm-Gg: ASbGnct3DbTP1uLQdlDUJ4lKpUJIMA/UVEgxTXTvcW63CgQ4+6IFq6LlNTvWrL4jg3f
	mdHyglMbZzR5OnA8IThwKwH1kSYTSjpegsAvrrOL2l+XtbwF+F4FJ1mEVTmlHT2Eva7Xtz6Q8vy
	9YeB00VSrepgctY+ezQ9cO7aXvVsKvM4Szf2yTON6mZ0ECTtAZ2L2dNHNIqafevnS2F8ozjKBLp
	AHIW5kDZo+ufGdL0iGSxPZLd8VPp6qdgKlMfoFe5sHAcn90KblOZjTgH6pYA+74Q+qi4gWo3iUx
	KQkACMGqdB3/PtEoP2QLxAZMVrUPRfas4CXD5A9FvkMIWRiE6nqSxGWZCK5E3Za2FvMJ1Poxjb+
	kl6KNOTn46ycRC8RD/fw1U/GOC6uM7YBG
X-Google-Smtp-Source: AGHT+IH2QEv1EXX1AwW0bplm/IMyDMqzMeclzHruNi6dErZJ0S6a5ZLa64wP13/R2bF/xVlDw1ddCA==
X-Received: by 2002:a05:6a21:1fc3:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-220a08dc64amr1126298637.5.1750982362495;
        Thu, 26 Jun 2025 16:59:22 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cffccsm799591b3a.130.2025.06.26.16.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:59:22 -0700 (PDT)
Message-ID: <ebdb0f12-0573-4023-bb7f-c51a94dedb27@gmail.com>
Date: Fri, 27 Jun 2025 08:59:16 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/13] docs: parser_yaml.py: fix backward compatibility
 with old docutils
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Breno Leitao <leitao@debian.org>, "David S. Miller"
 <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>,
 Jan Stancek <jstancek@redhat.com>, Marco Elver <elver@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Ruben Wauters <rubenru09@aol.com>, Shuah Khan <skhan@linuxfoundation.org>,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, lkmm@lists.linux.dev, netdev@vger.kernel.org,
 peterz@infradead.org, stern@rowland.harvard.edu,
 Akira Yokosawa <akiyks@gmail.com>
References: <cover.1750925410.git.mchehab+huawei@kernel.org>
 <d00a73776167e486a1804cf87746fa342294c943.1750925410.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d00a73776167e486a1804cf87746fa342294c943.1750925410.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On Thu, 26 Jun 2025 10:13:09 +0200, Mauro Carvalho Chehab wrote:
> As reported by Akira, older docutils versions are not compatible
> with the way some Sphinx versions send tab_width. Add a code to
> address it.
> 

Tested OK against debian:11's and almalinux:9's Sphinx 3.4.3, both of
which have docutils 0.16 bundled.

opensuse/leap:15.6's Sphinx 4.2.0 has docutils 0.16 with it, but it is
python 3.6 base and it does't work with the ynl integration.
As opensuse/leap:15.6 provides Sphinx 7.2.6 (on top of python 3.11) as
an alternative, obsoleting it should be acceptable.  

Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Closes: https://lore.kernel.org/linux-doc/598b2cb7-2fd7-4388-96ba-2ddf0ab55d2a@gmail.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> ---
>  Documentation/sphinx/parser_yaml.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index 8288e2ff7c7c..1602b31f448e 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -77,6 +77,10 @@ class YamlParser(Parser):
>  
>                  result.append(line, document.current_source, lineoffset)
>  
> +            # Fix backward compatibility with docutils < 0.17.1
> +            if "tab_width" not in vars(document.settings):
> +                document.settings.tab_width = 8
> +
>              rst_parser = RSTParser()
>              rst_parser.parse('\n'.join(result), document)
>  

