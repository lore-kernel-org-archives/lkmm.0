Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FE22D4E2;
	Tue, 10 Jun 2025 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570242; cv=none; b=Jy/salPVR5cIjs3E/2C8vCacaKgr9yni8Tl6JM8ENChk2ZnlRHctaZAAIE7wr7aIj2hUBXaHARLMVFCEoysYYNWljhZ7b6UotuBfF53c8FXhF9nkeyZOSBTgkDKe6C2mzcQtlxANRCy9uiaUeegB12t4qf+Q7vPmAV2eR+0Hwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570242; c=relaxed/simple;
	bh=FpHd5k/WuqGkFa8AqlRyJwsexbf+fo2WnOclxAlQJgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsGmBX3dRtV8cacwhrz0t2VcbCLsBpD4VtGjz32gmRiWa6bSt3Q2MbBVAQWEjKqGCx4sfye2s/07r8YvTx1vR5peM2fxq82ZuGyhnrATQo8s+PhqAORfpAkCwlNdGI6ztao+ogB0e8fRYw162MhiTDpQWwC+kYQOs5TCCd745xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so899197666b.3;
        Tue, 10 Jun 2025 08:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570239; x=1750175039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuDaN3v7IKjjOwPuI92C78hEQA3//blEo1hg6ajXKJQ=;
        b=uoKrU4eo3fBWotnwubxDEDlQRx9G0i0/A2g1n6VbWs8GsEVcBqPgnwHA5C7zo0DXOc
         9e865blWyLz5K1RmeUNtu9IeUrtU/B0d9xk+n4xbuY3C2krIb5GWUzwKcx2mgrGB+wgN
         LDNAcbC1rq10DXCt+CgrtsOfzZm80//Cnotfb5zYfDNzzwL3GLaS9NZO0g3UlDOzspyU
         953E+/BHQWf9Pr7WGNyyvLAlK54XEhZfPIIXG+RmbXlN86c+gQ3cwtp1rpOSgwouNSd5
         nbv05XR/MZV/2nHNcwtao0QRJKdfhMbXmlRTB8AYyUNJTySMttCmg/qmMU2cllRB7zak
         Fk1w==
X-Forwarded-Encrypted: i=1; AJvYcCX4JwVlkSwCENFtwiox7tMhRVYr+RkQI50cYa8tuRkNYodmpMJ8c1y+DesluNij45axi7WHLA==@lists.linux.dev, AJvYcCXtims1N7Rcm3Q2BHG+/jupqWKoFdF2T2Neb8PyngLp7+E2jGBJiX4M1gXsto0qvYHtxcy1HTxDanadfv/p9PZbwYTCXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2LENIzQWI/F9ky/CYbpaG9CtmCysaUBWXnjhSnPs1Jsp1ZsbW
	Dg+gl1yD+Cci2adcpNTqDzkt90KN+MpkMbUnL1F9kAZStWIxmuKaqINH
X-Gm-Gg: ASbGncv08HToDl9RCcBDHOuTjd+1iVideA/8cCsGMkoGP6TjkLtUwy7JuQ3LYQrJARi
	DgpOr6KpgZR6ljlEurHs7FZiJiAodNd20t/7rwonYvh92s3pT97+jwcqDxjoFq3N61hEf3F0Zfo
	XE2djm06j6dWAOixRQhv+Vm37a2kq+TTCKsn7uip8u4/tqyv08rKVezDY7SJVIriGfv7gQqakb1
	JdIeIkAE6cR0wUfJz1ZpzMZ8raZ3ahounUP/BF0Sr0dfDvqUZYsBrKAKcAaVtkXLAL6Ft0bwzDS
	P7lA4Sny5f+RYeXWPsphrXDlstwDunHblguhLLyaNt4sAMpspwMq
X-Google-Smtp-Source: AGHT+IH7vBoM84CZWFqasHt9KzLiG9LovQysp/riPIFgA4hZQCuVBAr5gBWic0qBZysBWtn+fw9E0w==
X-Received: by 2002:a17:907:608e:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ade1aa93187mr1760955366b.16.1749570238942;
        Tue, 10 Jun 2025 08:43:58 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc76feesm738828966b.147.2025.06.10.08.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:43:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 08:43:55 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>,
	Marco Elver <elver@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jan Stancek <jstancek@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
	Ruben Wauters <rubenru09@aol.com>, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH 4/4] docs: netlink: store generated .rst files at
 Documentation/output
Message-ID: <aEhSu56ePZ/QPHUW@gmail.com>
References: <cover.1749551140.git.mchehab+huawei@kernel.org>
 <5183ad8aacc1a56e2dce9cc125b62905b93e83ca.1749551140.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5183ad8aacc1a56e2dce9cc125b62905b93e83ca.1749551140.git.mchehab+huawei@kernel.org>

Hello Mauro,

On Tue, Jun 10, 2025 at 12:46:07PM +0200, Mauro Carvalho Chehab wrote:
> A better long term solution is to have an extension at
> Documentation/sphinx that parses *.yaml files for netlink files,
> which could internally be calling ynl_gen_rst.py. Yet, some care
> needs to be taken, as yaml extensions are also used inside device
> tree.

In fact, This is very similar to what I did initially in v1. And I was
creating a sphinx extension to handle the generation, have a look here:

https://lore.kernel.org/all/20231103135622.250314-1-leitao@debian.org/

During the review, we agree to move out of the sphinx extension.
the reasons are the stubs/templates that needs to be created and you are
creating here.

So, if we decide to come back to sphinx extension, we can leverage that
code from v1 ?!

> -def generate_main_index_rst(output: str) -> None:
> +def generate_main_index_rst(output: str, index_dir: str, ) -> None:

You probably don't need the last , before ).

Other than that, LGTM.

The question is, are we OK with the templates that need to be created
for netlink specs?! 

Thanks for looking at it,
--breno
