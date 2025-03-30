Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22A1CDFC1
	for <lkmm@lists.linux.dev>; Sun, 30 Mar 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350969; cv=none; b=qJpp02sKxzSWyqicoTKxfjhPxJsZQs9lqUOc5zBSmtu6AgTwjGiLeyI9BPRgmGJru53hcmXfhHl02zAxTNVpnYBJbeDLNEYLgjxc35hSjXxwNiW83ZZ5PGoNgR2nGWeUEH7bLE18Akv1kA3TI7KfRXs2G4uLBgPnbpql22wwbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350969; c=relaxed/simple;
	bh=qVgSe6YnHqUBrsPeMhbV1G+0k1Gh5bSrXoGQahPQsh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cpb6r2dt8tYfCBLdYZjHHZEjrdYntVoznrt4akz/5CWThZxAE+YksKAyXMi7exKrzMxstuZZOF8bWt95n5hQrkfWNBvXswW4m4iDhDBF2/N1GOU/Vi1OrKSA5KQxZLchqKkcWxWB4Hs9YdOsJnZNU0FEGDTO/RUpRDFefPlgKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IR1IkIH1; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IR1IkIH1"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf99dd567so44504656d6.0
        for <lkmm@lists.linux.dev>; Sun, 30 Mar 2025 09:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743350966; x=1743955766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vE4EA8v3l32V+wDYAu22J/7AGuib9xc3kzULTaZO6kk=;
        b=IR1IkIH1zGDEQptaj0JZixwv3mD7VRNDA/CykWu10APx2EYm6pr4CbhqlShjc7lIV4
         3Ufh//suBLWx3XWKAWxIk/zo7kHf1QaxYyC5Pp04b01ZMcqMtxCDwsKI5DbobNdnYbi+
         56iD/KtHMbqN72EDL/ztXs8ploVLloghEhbl+O+RVOeSTOtUVEjRMM0zWhUGhz5uAdHA
         RSvKzV0It9LyX6d4BxmZ8QqbmQ5EXE7og8RG4dCOV5q4U+zWTzpxag99ihGp62/pmv7K
         CoyOzj8MARBIeqZLEO8DgFT7PVurk6groTQHh9b0DV82gK7S2nPeckGoy7TmdDxhEAf+
         Eyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743350966; x=1743955766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE4EA8v3l32V+wDYAu22J/7AGuib9xc3kzULTaZO6kk=;
        b=H5sUyCKIBGVhr/FA71MNQSCKBvVDK3kbCqUIeC5GMT7PAr/qQg1xL5WF8cnUpkhVEX
         LaEtORj+UVT5M7Gjv9/RhhV+dN2Pjv7B70zgyKvEcHDg0Kd2KIuaBd0eVAsx5vZ2q0H/
         wdlTXZojybuDN6C5Uh8eWt7bNk5h7hhqKTovWpOqRRnRgu4UmkQ08fOfi6dn2W52tMXv
         N6bIO6aUNXanr+t+IIdZqOBDUomz7RkF4gCYhq8vTBRCD6byqecmasv4lO0z2OHBSiuO
         4DA/oyVYvGTH+38/8jGAO5d3HK1k1DxAyI8iia7LOFMSJPdLyWSRTuEcO0K/bBch5nBh
         GBUQ==
X-Gm-Message-State: AOJu0YxyLSIN2UD55ON7lTR2AWVhkbIngZG2ysf2VwXTKonmbFTe9KVN
	FFmWtp9apwu1cJL7vYndBq7H4VSbKjztXo7EkRFY2iL4zByTB0vhb+E8JGM8IA==
X-Gm-Gg: ASbGnct0kaDkIYt4n+dNxEQUPzMFC7R8JlQoPxiGGNlvJ1HX50i/L+o4eC8shk9uZob
	aIVaQgrbH5p3TlahsvloqHjJ1ZbEgVIRSIFSZfKWk8oXIxHBYYsD4Qhr+dBYuMiiXugt7CjTt7b
	6g+9ZjEw23GWvwlnAHT2gLEBr+UCv6KY9umOH0fuYmIYnNt6qsnjkgvlUxf1oN6Ouqt0k5vU+bE
	w+5oosxA6/ooP9RoFh+xGASYbmsBO64ULgOGleVYmJW+2na4gBVqO8R2KXxjKZfshsMYwwOh+v2
	1vvne14k1eOYbnTZXRqSW1N/scr9UNbKyr60ZBPqjUiA
X-Google-Smtp-Source: AGHT+IEaSrbr4R41o2quAG2XSwcX+jEX0eeFi8SpfsVZjT5rPtSayMjI3aEqN1OtqBBh8AGOl7JX+A==
X-Received: by 2002:a05:6214:19ca:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6eed61dcb24mr75632696d6.15.1743350966703;
        Sun, 30 Mar 2025 09:09:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771b42sm35302086d6.88.2025.03.30.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:09:26 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:09:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ignacio Encinas Rubio <ignacio@iencinas.com>
Cc: lkmm@lists.linux.dev, mchehab+huawei@kernel.org, paulmck@kernel.org,
	joel@joelfernandes.org, Akira Yokosawa <akiyks@gmail.com>,
	linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
	corbet@lwn.net, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Potential translation of LKMM docs into ReST
Message-ID: <16aa2173-afb2-4781-b1b0-a248b1f16a9f@rowland.harvard.edu>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>

On Sun, Mar 30, 2025 at 01:07:23PM +0200, Ignacio Encinas Rubio wrote:
> Hello!
> 
> There is interest [1] to get the memory model documentation into the 
> built docs. Akira pointed out that this was discussed in the past [2].
> 
> A couple of years have gone by, so I was wondering whether the decision
> to keep plain text documentation still applies. 
> 
> There is an "easy" way [3] to get the plain text documentation into the
> built docs, but I would be happy to work in a conversion into ReST if
> that's what you want :)
> 
> Ccing people involved in [2]
> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/87o6y5lvvg.fsf@trenco.lwn.net/
> [2] https://lore.kernel.org/lkml/20190901133530.GL4125@linux.ibm.com/
> [3] https://lore.kernel.org/all/20220927160559.97154-7-corbet@lwn.net/

I have no great interest in seeing the memory model documentation 
translated into ReST, but you're welcome to try it and see how it comes 
out if you want.  Some of the files are likely to be easier to convert 
than others.

The only restriction I will insist on is that if the resulting ReST 
source files end up being unreadable because of all the markup they 
contain then we must keep the original plain text files too.

Alan
