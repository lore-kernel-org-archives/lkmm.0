Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826BD191F98;
	Thu, 19 Jun 2025 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296909; cv=none; b=ra7zbKpVLdEtGYeaNeaG/EnPDmgwWS5VzZQxvOmwZSj8K7B2EDReDytDNpCVRYgkWpLvmU92aRJNncB0o5mw6XYFRy4J1QKWn5StEwaQDjqOEBd8rWMquo/59nuapQz7AIWs+il5Db3l+Va+Mlz+ca1j0eS5/K8f9vGiMkEH7IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296909; c=relaxed/simple;
	bh=B4qe92RWiDJShMCHmxOj5yRAE1bEW5Fo7kjKCRJ7HYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LaLkXbAqKqU4gM0xZhCuUsiLKwyXf0v0iSAz3IjtwCjzQmxEnODxcfcYNVNRVN5sNygE39BKUpTEcGT5VvWTIne8G9p8IMdUn2PJhP1ZDXMczzP4eJ3VAHponWSguaLrjmMWMswiemN69M/iz4CfqUEEQAlcLbwubjQFE9upIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrE3bezJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrE3bezJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31d8dd18cbso333795a12.3;
        Wed, 18 Jun 2025 18:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750296907; x=1750901707; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNw9ysipdpiqhc3psPSgAI9TjtSHXl8iuoxkHYIGdW4=;
        b=nrE3bezJwa7HXlICCa9mMdDNk0kUq+MjGT8uEm+QkDD1EJLLXiEBP3XY2s/LKigfTm
         rbccbwcoYzGrNTbVH8AdgOa0boNkqVD5am+i6S1gEHepVn3S09XGJbBFaHvff/ffYBbD
         5CsIJEJ27yNt1Czl8QdA4qt1nb99u3kn7v4BN7bxlGxJHczDf5+LLhZeDJAsq6PN/zWy
         CDdZqu4DKlE6Hk9HRlTI5gkyR4X1aY1k6b4fXU9X5setzWeQ4PPvI81MKe67MeenGjDF
         vVZBB18oGgFM8GmA9zgEQiaBUdunidt2cF5jLnJFx/cX0Yx3lK6OQX+9HaEtshu2WmYm
         vKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750296907; x=1750901707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNw9ysipdpiqhc3psPSgAI9TjtSHXl8iuoxkHYIGdW4=;
        b=bJkY1OImjfkyUQchvXbgwD3VYAFc+tnJMPOsMDayhXOIKqlMAvQPHjnQq+18IkiVDL
         bedGfJexp4DxFLSaxTko11nYKg1Q6TwXdaR393uXGyqGmb8r/dw+kenYT1VfFxpVdUf5
         huqopyQVx7r2D1SJj1Fdu64WTTZBxEAR3CGeV5/CYBiDwKWQ2EcYIVGSwTozS19jLpNk
         /j5/q+JBPjHpAMMY4I3L+SVNXYMaSSMHuVJdoD7vhuFznpXRP8jMgcHq2NhJ+S13bEDe
         qgDq9AHfz5/R+vAGPuXnkUCjmWHBXJ/pWdqaKuBU1Wu/XrSPjEl96QseLu3E/T/yHVSc
         BYuw==
X-Forwarded-Encrypted: i=1; AJvYcCU8dS75rdSxtMBszI5/vMRWXKUMNBf2G5zATvns34MH4R3Md9g0FerQi5zmHVHdQvFkl/6/EJCHF7lBiHAEEOCuy6j1ow==@lists.linux.dev, AJvYcCV47vsQ06TJctraiujgPQFBHfUx8ufXFlwdkxPvxsSEM2MrF4mUtxBqSaYfYJsixx+v0Ivq7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHcQfm5ajiDruId4iKJwVUwVTZF/n22dH5qhsQx5tMlq9NyDJM
	hCVB01IjSCTzDEOvMJjcrz1IFuYOkszHU79gGsWKmAomLTmZDpC0Nt95
X-Gm-Gg: ASbGncubMRdbAh+RlwiG3NaBy7+83KA2MAQAIkRPypNhpH4luIJEc72ZRg0xOKrPrsC
	PxlLxVldMh+AZpIB3mcQLJCij9uUKYLGOs4nr+WxdN6Jw6c1YdOn0oJ1w6zb71LtjbVPa2B/nvF
	yvPPEubiMKiKwiS4KcCvgi3e1Lbdk3oTEF8PVpLNRX3LSbQnX+x6SnrHbJG2DXpT85ZvTXwQHhz
	SZ9frEPS/Ll+wUXtgdm95zLlILO8LtnUg5kKAF+97+Zv2GtsbbwbaB1wYkoiWzDpm2TsFx11A8S
	cjmaBkqklw5SRMhSrpw5tk78Ad0LX9e7XD/PQ1hHYQqif35GE0iG6GVy32XVdZQLzeRjS/P0u97
	1Mx/fzEowVgZQSnwIHrHAanO41qj5ToMl
X-Google-Smtp-Source: AGHT+IF3Vl4f6PedAqq/5vg30gEPk9+7i1apLb/Gckb9IptND6S77GoQsHuPfuiibIVLb7kvCDENXw==
X-Received: by 2002:a17:90b:5285:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-313f1c0b04fmr31071516a91.9.1750296906590;
        Wed, 18 Jun 2025 18:35:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3157a60781asm1471627a91.0.2025.06.18.18.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 18:35:06 -0700 (PDT)
Message-ID: <598b2cb7-2fd7-4388-96ba-2ddf0ab55d2a@gmail.com>
Date: Thu, 19 Jun 2025 10:34:59 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] Don't generate netlink .rst files inside
 $(srctree)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Breno Leitao <leitao@debian.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, Marco Elver
 <elver@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jan Stancek <jstancek@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 Ruben Wauters <rubenru09@aol.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, lkmm@lists.linux.dev,
 netdev@vger.kernel.org, peterz@infradead.org, stern@rowland.harvard.edu,
 Randy Dunlap <rdunlap@infradead.org>, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1750246291.git.mchehab+huawei@kernel.org>
 <17f2a9ce-85ac-414a-b872-fbcd30354473@gmail.com>
 <20250618182032.03e7a727@sal.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250618182032.03e7a727@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 18:20:32 +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 19 Jun 2025 00:46:15 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> Quick tests against Sphinx 3.4.3 using container images based on
>> debian:bullseye and almalinux:9, both of which have 3.4.3 as their distro
>> packages, emits a *bunch* of warnings like the following:
>>
>> /<srcdir>/Documentation/netlink/specs/conntrack.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
>> /<srcdir>/Documentation/netlink/specs/devlink.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
>> /<srcdir>/Documentation/netlink/specs/dpll.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
>> /<srcdir>/Documentation/netlink/specs/ethtool.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
>> /<srcdir>/Documentation/netlink/specs/fou.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
>> [...]
>>
>> I suspect there should be a minimal required minimal version of PyYAML.
> 
> Likely yes. From my side, I didn't change anything related to PyYAML, 
> except by adding a loader at the latest patch to add line numbers.
> 
> The above warnings don't seem related. So, probably this was already
> an issue.
> 
> Funny enough, I did, on my venv:
> 
> 	$ pip install PyYAML==5.1
> 	$ tools/net/ynl/pyynl/ynl_gen_rst.py -i Documentation/netlink/specs/dpll.yaml -o Documentation/output/netlink/specs/dpll.rst -v
> 	...
> 	$ make clean; make SPHINXDIRS="netlink/specs" htmldocs
> 	...
> 
> but didn't get any issue (I have a later version installed outside
> venv - not sure it it will do the right thing).
> 
> That's what I have at venv:
> 
> ----------------------------- ---------
> Package                       Version
> ----------------------------- ---------
> alabaster                     0.7.13
> babel                         2.17.0
> certifi                       2025.6.15
> charset-normalizer            3.4.2
> docutils                      0.17.1
> idna                          3.10
> imagesize                     1.4.1
> Jinja2                        2.8.1
> MarkupSafe                    1.1.1
> packaging                     25.0
> pip                           25.1.1
> Pygments                      2.19.1
> PyYAML                        5.1
> requests                      2.32.4
> setuptools                    80.1.0
> snowballstemmer               3.0.1
> Sphinx                        3.4.3
> sphinxcontrib-applehelp       1.0.4
> sphinxcontrib-devhelp         1.0.2
> sphinxcontrib-htmlhelp        2.0.1
> sphinxcontrib-jsmath          1.0.1
> sphinxcontrib-qthelp          1.0.3
> sphinxcontrib-serializinghtml 1.1.5
> urllib3                       2.4.0
> ----------------------------- ---------
> 
[...]

> Please compare the versions that you're using on your test
> environment with the ones I used here.

It looks to me like the minimal required version of docutils is 0.17.1
for PyYAML integration.  Both almalinux:9 and debian:11 have 0.16.

Sphinx 4.3.2 of Ubuntu 22.04 comes with docutils 0.17.1, and it is
free of the warnings from PyYAML.

        Thanks, Akira

