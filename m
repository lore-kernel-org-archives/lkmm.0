Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7B4C8E;
	Wed, 18 Jun 2025 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261582; cv=none; b=AYtvaBs6YOgZQmPTy4x84vulSkTmgKVcr0TVFh6vLAOAwkcTqpv8a5L2n9kgrE7u/50nERkdNWqKO7EQHt5/XiZQ+qtZxOwY6XA8BbSQt4l2yi2Eu0dEnfiXerus8yd0swrLFV+RNxUsLPJUvh1EH16MCP+bliTXpbBYPRzIsv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261582; c=relaxed/simple;
	bh=RkhAhy7cJp7ZZXWeYy/4iE+8/T6IKGFMwCV6ga9hQfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fi66Uw4W6XVNqzP/rvYNvXcYqMf0IxZ3O/GA7GVv3RPPaHATu/cDtnIdEBePjgxjwIxcbLOcruru0CYqOSXylY2QuHA0q4r1gcE1znCgJBqnoHszA4BCd8O+A5okwHdHoTmU/LHSdibFJQSPt/yiFH63rMOXQKrfS/WeM2kJ8JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBeTS2+3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBeTS2+3"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748f54dfa5fso233817b3a.2;
        Wed, 18 Jun 2025 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750261580; x=1750866380; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egqntrQT0mcTNXSQUXdoAiXmKkzBs77HbRV6QGmeUAk=;
        b=IBeTS2+3PAgNJ4vdzyKu2D8o/yC/7ZVsNF476I/DwWPcJ5FEYEiq5/tROQWLBX6ZJa
         44tOJDl2CwzseBE8SaPY8S8o3dLd+ygTKOFCVlkKLiEA7LOs9iO5Ayqpd0iQvgPwO3yD
         0mD0XRssZaEPmRPJ04HVFGnLEO4OeFmO1mlHrv5dmNJ1l8IAsIYrDApejssHoEPKQlUv
         ivdsYIMtCXVxym+zAL2BVM/Je567L3XiaCDv2cNEkaYuqvBE2sY9Tk10HZHYSCZOdtha
         VUZajE9dTe/W7dEejW1T2ut9s1Lnd/XGDqYJI1ODZ+uUiwXYOoR7E8ZGfWlWbvOnYCVL
         j3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261580; x=1750866380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egqntrQT0mcTNXSQUXdoAiXmKkzBs77HbRV6QGmeUAk=;
        b=Vg3j5Qu86nn0wTSyq5Gi4dD8dfOyk/T4E+R5ryXKb9RKUVMEwtRrMXNm5Z/TvzfKP/
         6Z90dPeSUIUlvv6MgcWdi+PcS5WpKhH46gRtn8Q+wMJtz19FTIkuM293Tg5wBhQkAYU/
         2ti1MngIbFrX2O+3N8zSeIQayxLf+haJbbzXvT9S/QgohCDLwZRT2gJ3GBCEf8fY1gbD
         dASmQN/KcLpsYijM8bf1v173+IeDNCtBxOkDyEf8u9OfmFw63PN/T9z90IlzN52yKkgz
         msvLZHw36ZboWHgECghvnim3Nv2fkjNcBJEXo64CX+c6m/lpV4qn1cpT9+Xckqasd7te
         D44w==
X-Forwarded-Encrypted: i=1; AJvYcCU18XbFb/8rgm4z71NBd92AjSa/0w2k1JvakiX76ebfuaPPU1CSFufat/XMTpdxgaEgnaPCgw==@lists.linux.dev, AJvYcCUJ4C+eCQjdd2DHL52PKDqAb7BWTaYBYCtvKFmXhKqwJ997jIu5YNj/MXKu2tFY2ub1DoRGWkUfMUe3HjWrSb4vzWM1QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQNiTmyihyBy73L5X3pFdnLiZVNAJ+50XIa1SSpDGR91BwtT12
	fRLI1Wd2y1JIDTdrPNHnl6/NMSdm/CV55UKbfEogUyhMwhmWmTCfV/pE
X-Gm-Gg: ASbGncup5GoiVuhgeRqqdbbgzW4XV4O7/wtsYTulTRDoxR2vDdCSoL4zU1KFArCZpAk
	/7Sf3jsrZ5W4onhfWUttr1vUlh0nOtenAi3N6vmOD3UkFMP7tkV8WTeJVUIsOhlO+AXBe+b9fms
	zOw4REvGd8MSJAQsp+St+2wO12LMJ4K8sr2+/jWRgDvX8a2zmGlGyjayw/vj9yvIQXj/2lNbPxa
	FWdVjsdjQWQNNWU0PRjcCSAm6U0hQIfgFZtelqMpS+XGQAAHcJCoD0qAvKXOjXdD55xf0Au0cJ+
	sagDvSbVbv5jBiukc1SHqEE13TXZT6aMZpyow4/c+z+ENRK8eEyknNJfm1069bySNE2/h4taqWf
	K/3Q7ztL38PrzIsaow7Ij6pdOQTDmipTU
X-Google-Smtp-Source: AGHT+IGojw9TogQCLzzrFvTji884jdeSs6pD+joQuFZ1XOjZry8dO66lcKyVpPr1hvTndaJFUZbB5g==
X-Received: by 2002:a05:6a00:895:b0:73e:2dc5:a93c with SMTP id d2e1a72fcca58-7489cf9a3bbmr21984258b3a.11.1750261580264;
        Wed, 18 Jun 2025 08:46:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082e71sm11574559b3a.107.2025.06.18.08.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:46:19 -0700 (PDT)
Message-ID: <17f2a9ce-85ac-414a-b872-fbcd30354473@gmail.com>
Date: Thu, 19 Jun 2025 00:46:15 +0900
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, Marco Elver
 <elver@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jan Stancek <jstancek@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 Ruben Wauters <rubenru09@aol.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, lkmm@lists.linux.dev,
 netdev@vger.kernel.org, peterz@infradead.org, stern@rowland.harvard.edu,
 Breno Leitao <leitao@debian.org>, Randy Dunlap <rdunlap@infradead.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <cover.1750246291.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1750246291.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 2025/06/18 20:46, Mauro Carvalho Chehab wrote:
> As discussed at:
>    https://lore.kernel.org/all/20250610101331.62ba466f@foz.lan/
> 
> changeset f061c9f7d058 ("Documentation: Document each netlink family")
> added a logic which generates *.rst files inside $(srctree). This is bad
> when O=<BUILDDIR> is used.
> 
> A recent change renamed the yaml files used by Netlink, revealing a bad
> side effect: as "make cleandocs" don't clean the produced files and symbols
> appear duplicated for people that don't build the kernel from scratch.
> 
> This series adds an yaml parser extension and uses an index file with glob for
> *. We opted to write such extension in a way that no actual yaml conversion
> code is inside it. This makes it flexible enough to handle other types of yaml
> files in the future. The actual yaml conversion logic were placed at 
> netlink_yml_parser.py. 
> 
> As requested by YNL maintainers, this version has netlink_yml_parser.py
> inside tools/net/ynl/pyynl/ directory. I don't like mixing libraries with
> binaries, nor to have Python libraries spread all over the Kernel. IMO,
> the best is to put all of them on a common place (scripts/lib, python/lib,
> lib/python, ...) but, as this can be solved later, for now let's keep it this
> way.
> 
> ---
> 
> v6:
> - YNL doc parser is now at tools/net/ynl/pyynl/lib/doc_generator.py;
> - two patches got merged;
> - added instructions to test docs with Sphinx 3.4.3 (minimal supported
>   version);
> - minor fixes.

Quick tests against Sphinx 3.4.3 using container images based on
debian:bullseye and almalinux:9, both of which have 3.4.3 as their distro
packages, emits a *bunch* of warnings like the following:

/<srcdir>/Documentation/netlink/specs/conntrack.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
/<srcdir>/Documentation/netlink/specs/devlink.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
/<srcdir>/Documentation/netlink/specs/dpll.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
/<srcdir>/Documentation/netlink/specs/ethtool.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
/<srcdir>/Documentation/netlink/specs/fou.yaml:: WARNING: YAML parsing error: AttributeError("'Values' object has no attribute 'tab_width'")
[...]

I suspect there should be a minimal required minimal version of PyYAML.

"pip freeze" based on almalinux:9 says:

    PyYAML==5.4.1

"pip freeze" based on debian:bullseye says:

    PyYAML==5.3.1

What is the minimal required version here?

And if users of those old distros need to manually upgrade PyYAML,
why don't you suggest them to upgrade Sphinx as well?

        Thanks, Akira

>
> v5:
> - some patch reorg;
> - netlink_yml_parser.py is now together with ynl tools;
> - minor fixes.
[...]

