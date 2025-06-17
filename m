Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB7A29826D;
	Tue, 17 Jun 2025 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153818; cv=none; b=mz50yDYF4TbUm1aakjfAeTxiy9DQ/tkHiVbo5u5Nq3XR8Lg/dytKPKBxmd4C87YYo0Vz6uY/6/9D5M88YJS76faMsIfHmEUbXOHne3hSZ4Tzsrag/KVh4VQls1a4BairCqpO/Sm+NDaAuGrm95FK1PtJDCbK0GdDvSZILiRVRcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153818; c=relaxed/simple;
	bh=YH8snW+HQzPkJeXMoGvcgRiLRIoHK3vIXAy0/dbKPZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhASUgrFWdJQhFQVsoakRELqk6gfu5bytzxQjCaFxL267vgv/Yeqm6swIOpyMbsyn3Bdzzji4zAiJxVRQyE/3dAuxUZbMxK1iChu+aMFXm2nUeih+l9BKhU0lqrThrjcEyNkTMu99ubJJaaxrCBOH6uPSwAKFFR1pXtRYVGjQVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb5ec407b1so903836266b.1;
        Tue, 17 Jun 2025 02:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153815; x=1750758615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YH8snW+HQzPkJeXMoGvcgRiLRIoHK3vIXAy0/dbKPZI=;
        b=NF/nD2UC3aPmv2uQGfVhKDtOy0qBjYH9Eid0byVgI9H/uNToOk4BiT5IJIL0QnjLLz
         KsVAegd2U5T7Wa7WVnq8cMLyAfWZ5KFGlEXcB0RMEN9HOq8zIXxvcuyIYXxqiXDSMfSY
         laUOYZ5yaaUw94zkVXrwFtW2xTtFGRMeADyTz0skE5sVRH6A4k5xN1jF0zgcAoDjijmJ
         9eYY8y8GqCUrsXbIjRHD9EkdbVmeCQXB9uDNS84KL7E5t+I01O5q5ItqAmU5/l8sIM60
         e8IATr7hX8fDadQyyms2O8yZSK24LNl5+M5HO/+aO7Hy0tTuBFSWgL9uDuNrktoJrcKF
         FAlg==
X-Forwarded-Encrypted: i=1; AJvYcCU5USjXbnuC8+bCtGn/5+EBlsvJ+54bTiFU1IngyYL09c8a68skcUVkvzrkMjfltBk2Kccoig==@lists.linux.dev, AJvYcCVbHB15TFxAowQZFIyVxob8dsCrSVb+myrMu7y4+c3XbDcKjLNC/YJXIS9ZLXGS0uEQM//oaE+r2AcX8I/Ub9JLq6eVzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/DaTEu7jOVIFv0q0y2HqSwJv8AcTjEFUk3PldWx80lSR4ZTkh
	A36fIFHrum7h3XDuyHpOdoAhmX4WY05CdIfHXv6rTvI8On1dcZJA/gRn
X-Gm-Gg: ASbGncu6yG107lWoKT1DeLJ7B8KucCnnA0e7rkbcBTRxZEMRdEclguf+BnROw9mSXqk
	gXreNctLY4flPOUCMC/Fe4dc2jNzQ1U/4ySe05nCqhqhvTlH3nk3qNXvLHI554G+uu0v189ayGM
	7NzS0jBKjWFiHsHbATAxtlycAn3WbvWklDstFhCtrQ55UABmqP+tNhzxkOJmlnDOW1LZMTkqK5S
	Dhsncgs5U5NdOIfduF6LITNaLd3YqTKDHKSgCV5SDegaQNh4fk7Lk4dmHFzj69fC1b/CQbOjD2q
	tusCqVap7S5/BrDOIPZw/ECx8k3RM7IP6mAooXjbTWRtG8gkAGH6ag==
X-Google-Smtp-Source: AGHT+IHn2FJqs9RO9flMz3wqH58LiFdg5OFFDyapqZw3NxqVXI1mx4LABvm24mwAZpwVpNqg2v/fsQ==
X-Received: by 2002:a17:907:1ca0:b0:adb:2bee:53c9 with SMTP id a640c23a62f3a-adfad29d046mr1234466066b.3.1750153814797;
        Tue, 17 Jun 2025 02:50:14 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8977545sm844022366b.147.2025.06.17.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:50:14 -0700 (PDT)
Date: Tue, 17 Jun 2025 02:50:11 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>,
	Jan Stancek <jstancek@redhat.com>, Marco Elver <elver@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>,
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v5 09/15] tools: ynl_gen_rst.py: clanup coding style
Message-ID: <aFE6U9e1Y3Qu+v62@gmail.com>
References: <cover.1750146719.git.mchehab+huawei@kernel.org>
 <b86d44729cc0d3adfdddc607a432f96f06aaf1be.1750146719.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86d44729cc0d3adfdddc607a432f96f06aaf1be.1750146719.git.mchehab+huawei@kernel.org>

On Tue, Jun 17, 2025 at 10:02:06AM +0200, Mauro Carvalho Chehab wrote:
> Cleanup some coding style issues pointed by pylint and flake8.

Sorry, forgot to mention that there is a typo in the commit title.
