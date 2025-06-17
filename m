Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A8D2E2652;
	Tue, 17 Jun 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165221; cv=none; b=gqVK8y+DUNZY144uAs8DtdeqdjpKt1wwqMDnuQKvHHrwF1p+IU15n9+5UAKTH8Eip+j791e82JuMevJdAIglbstIn+VYke46dTCTBm0gje3cTGLahAWKQkWSHD5mMsAki3DrX7rGy2wJw9aYE62jL01zVX89ivnaGi6hWrZeHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165221; c=relaxed/simple;
	bh=x5Wrb85DRWbVNOvnfzFdGgHoRKBrMPTvOnwfQ5uCOG4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=bu7SxGmSXY5jOh78ZTzc3UFkmWr4mS5vKPWDQv2ApwSsGkpEnfyDPiTXYiJ3u8KQnMp4yao39EZWhnmEd2rh84qgL67Ejqo91F0HH7HWFZ6sPFkI2RknfigEdHqrGBfY5SFXErutwKWWzeC2L3J7cSZX7y59+thM7D2UeMGRrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbt++f39; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbt++f39"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-452f9735424so18537525e9.3;
        Tue, 17 Jun 2025 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165217; x=1750770017; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCBsAUdKLlXHFAS2dv9cOixZKTFpwiXbiHVQbvH0Ze8=;
        b=cbt++f39gnKZecnTRADpbPSMBoan3rbQztg2BMPwSojCW8dPSvCruiiJ8u1NtP9qaA
         fB1FcQxcIbn2Guk7BN26MLHpQMuKpY16xI42fiFZ6i8wPvTGMroZRWe/Hzj9Dc08EtBi
         3yIjOQo2V3R7zmrxeu0Qk8zkucoSWiQOsfbwtPp48ZFTRA2EeGBwWeAFN1MnGCPdLNq1
         mYQsgLLtLnGMMjHGJJQqGNY18fncIPQV7m08Z3E4xc4ijzG0bWY+rSQOFNpstfE1hlw3
         aSu+s2sxrIfoQa2ETq6B1EncI+2AqmppUoODn3M8ezbLBtWRTSUUoFOZf9ZdrbKVsJuw
         6lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165217; x=1750770017;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCBsAUdKLlXHFAS2dv9cOixZKTFpwiXbiHVQbvH0Ze8=;
        b=EvRrala5DheDOUkXnsEBJe1BUMzPgUrKweMMOk3YH/k6evnNHjd5TVE+wteFJmtMyf
         6oDY2CE8pdSig2UdN/9FL+scPBwvjM6EUiMEUMtlJyKyfwSil5uljqHbMfSf+kfDjdv1
         xLytzW600h9w5XRlT2n5+a9BpQ82lAd/96FRYvYLU+P1rePRDDt43ZAKYD19gxQ7S/f5
         N5cb6Os0zcg/1QPiFPPwsAnH00iunw+n1UVxJ9t2bXDDkSBZ1ymQF4OzYQC4FoVpZdPq
         ZyML854VWsUD5HaTGPc8/yRQa1W3A3Jy80plKIsdZXciWVzGvQW6me1uABa01MWVDPi9
         F/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUKGRGo3kGeONVo3oGAAUeRt9z0bv12O/wjM3lofxmr0rrkvMk0y4xS7p5RFhySkfXUCG+3yw==@lists.linux.dev, AJvYcCWq3wkrd5vkS1uEBF+LmmFn2e1m05U3vq3Ziu9Krc1IrBwpBcBpq42I6vcAXy246DSmS3jtOdFUL5mdyZtVK3sTODJDBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyGgwX5v9AeVMnWv7AHxOzl0DrqsP4pa4RdTFgki3/9vn40s5w
	km4hlmI/1XzEmuc/CtufynKWU4MOiEOkT/oNpvRQn22FtrD2PQOSR103
X-Gm-Gg: ASbGncuBJ0DFMuijHQVvTTXb+UIhV+EdhJf/r5BwCtJSLaz5It7u1kxN2nbo8ESjJ/6
	zDYHsykLj01+jz0JcJByy372z3d/+8z0XUK183kxwDQosiGq7PizhKReuPud2kFkWamU2bts+3V
	T1NgMFkiolfM3GZdYpafR/w8mVWD6dr5bSXGZFv0rVp2ptLsfbK0LQHMF1YscrFXI4ni5dvH1Yj
	8NTF+B+NRYjfgkDkro0/eIX3i+H6X/JrMNTR/C/j4x/qAnsQOJUqmRGseUi5OtaE3X2eIMBWI3/
	1DiqUb0fLvK7ZrxqCvYsQ8mcTC4J4w/pw9HGYUD2079QkcNqwaJ4fvCCkpiX9GRJ2PVTnuoiGOQ
	=
X-Google-Smtp-Source: AGHT+IE47uR89T5Uem9MM2qCkm1YZX6jwmHcz73YYxvO/Jmwjj1PBFbbbUyCJLNhhaUZOFeMr0rGbg==
X-Received: by 2002:a05:600c:37c3:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-453561ce33bmr8920735e9.21.1750165217074;
        Tue, 17 Jun 2025 06:00:17 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8931:baa3:a9ed:4f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e1838fasm173538455e9.38.2025.06.17.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:00:16 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  linux-kernel@vger.kernel.org,  Akira Yokosawa
 <akiyks@gmail.com>,  "David S. Miller" <davem@davemloft.net>,  Ignacio
 Encinas Rubio <ignacio@iencinas.com>,  Marco Elver <elver@google.com>,
  Shuah Khan <skhan@linuxfoundation.org>,  Eric Dumazet
 <edumazet@google.com>,  Jan Stancek <jstancek@redhat.com>,  Paolo Abeni
 <pabeni@redhat.com>,  Ruben Wauters <rubenru09@aol.com>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  lkmm@lists.linux.dev,  netdev@vger.kernel.org,  peterz@infradead.org,
  stern@rowland.harvard.edu,  Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v5 00/15] Don't generate netlink .rst files inside
 $(srctree)
In-Reply-To: <cover.1750146719.git.mchehab+huawei@kernel.org>
Date: Tue, 17 Jun 2025 13:58:11 +0100
Message-ID: <m2msa6ikyk.fsf@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

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

Note that the series leaves the YNL build broken.

make -C tools/net/ynl/
make: Entering directory '/home/donaldh/net-next/tools/net/ynl'
make[1]: Entering directory '/home/donaldh/net-next/tools/net/ynl/lib'
make[1]: Nothing to be done for 'all'.
make[1]: Leaving directory '/home/donaldh/net-next/tools/net/ynl/lib'
make[1]: Entering directory '/home/donaldh/net-next/tools/net/ynl/generated'
	GEN_RST conntrack.rst
Traceback (most recent call last):
  File "/home/donaldh/net-next/tools/net/ynl/generated/../pyynl/ynl_gen_rst.py", line 90, in <module>
    main()
    ~~~~^^
  File "/home/donaldh/net-next/tools/net/ynl/generated/../pyynl/ynl_gen_rst.py", line 86, in main
    write_to_rstfile(content, args.output)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^
  File "/home/donaldh/net-next/tools/net/ynl/generated/../pyynl/ynl_gen_rst.py", line 64, in write_to_rstfile
    os.makedirs(directory, exist_ok=True)
    ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen os>", line 227, in makedirs
FileNotFoundError: [Errno 2] No such file or directory: ''
make[1]: *** [Makefile:56: conntrack.rst] Error 1
make[1]: Leaving directory '/home/donaldh/net-next/tools/net/ynl/generated'
make: *** [Makefile:25: generated] Error 2
make: Leaving directory '/home/donaldh/net-next/tools/net/ynl'
