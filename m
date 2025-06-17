Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5958C295D95;
	Tue, 17 Jun 2025 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153780; cv=none; b=fbwcZsroDZNdaxsuI3Z72T4JHsECdC//8uDmwi5c2sl59QKfHKVD5tmQxql5r+X8Hejma3E4oujdTvqGrw5R1WrCMstKHhGDHQiPBLatycDTvIoP5lzMjhHrxOSxsOImo+k3kFmKdPChhFUxpdlMUI/jKlw1xFDKfc3aMsQ/Zek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153780; c=relaxed/simple;
	bh=DP9DqrgR2bh8NqZ6FizF/KGOAPXqqAR5joYEFv95tPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=co0kAiDtRCs8pufvTkomGNo+N8PeaHcv7JsiAgZtmZs4mNODzwvnliZTn5mrss/jn6bPyGI1m2FQKeFVwqvaVtLYAzUMdWfTgfag8PqU/aOCdWxCPZZfVVJsUOZUCZejOL56Me7HzCc+qHlF27Png4F7ztkdR1VENTr+9UDdOK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade48b24c97so862007166b.2;
        Tue, 17 Jun 2025 02:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153775; x=1750758575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNjpKIWFUO3UwHjqSrvxZH4sVoUp8DK07nEW60sO6KA=;
        b=lOupGrl9mtwL6A8/1Zwo8oUU4NZiv21zrlAf3VI+ihWd7mRiQgTi83EAKvj7A6v1hP
         fOXpgcv7JKkmF0C9CBAavgt0vMP6o9p8agrd6CJDxHpJJCRbUoriXTKceLWZ/DXMhptR
         FHAGDxLf0FGDSzjTgqKTVEZeEAaBglNDRKLVbh4Scr2dogjSKnrCnndXlK2D/KQ4UBwj
         E5b2zyNByD3cLkzh78LOMC+Pko692dGXWjUgJa6sxP7SX2+b+8VjEWJcDNhFmhLNr9cR
         tZvQHM/Re8s4vPFnPp+eP2Au7241t7XI3WPK0Fx2yNTnw0Wo4gXpYQ3OchxQdh/A8cD7
         HA2w==
X-Forwarded-Encrypted: i=1; AJvYcCVXQFJKYM5xZNlFGoqlKFOO0+qwHafcjUQGd62GbrCrjecrOnnuxW3LSIgxCg1BChnfudPI6pXqrMTtx+2nHe3HFmmwqA==@lists.linux.dev, AJvYcCVoOlvsjE3rirwk9IXUzWsFasw+oGy2Osp3q15bfdc/z1MYSadlTY33fDKBl+whthP2dPEldA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv6MTIcagvzjUo/dgW+h6KegR30A9Y49Pg8sZ50vUWft0MXoUf
	L2LAPjqm32Q2A5dx5i3pCuAWIT/BDhaMW1+ItGpbErDNcAT3lLKgWSB8eYZjgA==
X-Gm-Gg: ASbGncuMzg/upz0kPF56/oUTZlAFoKnamIfrsgEQkNYxJ3o1iMLbakzx2VoZhLNHLzb
	ztYJS1ED4SSLGxegR+dQwIBlu5pWyuOxUPpheRJFfXZ3VM5tI7cVtXNlPprUFpxNxBlny9nXCHO
	UzsoLVrWpjLEbsRC8zyvyzp7QdtOwk+1Lh1DvkbI3RicfjF9FMhdKesldl11ry8BD6g4yGgyUBI
	9LKaXGMrqYa28MiUIoBWOXJA5LOg0+tdL+6KRgk/2Hp6LUFTCT1D+izlqqyqurfe0yAqskT5KV1
	9Xuk0HsIQa0SEV9acTV7uRtBrW5G3XUL6LBCVQUoGs8f+ugWy7O82g==
X-Google-Smtp-Source: AGHT+IHW9294E3OtqJ+f28GiD9wYZ86H8EQy05fIL/mh1QaSIzEMnsqq5NiG7/2VBActvbbuMbdfRg==
X-Received: by 2002:a17:907:1c0c:b0:adb:2462:d921 with SMTP id a640c23a62f3a-adfad277532mr1325684366b.5.1750153775307;
        Tue, 17 Jun 2025 02:49:35 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c5c5fsm843320666b.63.2025.06.17.02.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:49:34 -0700 (PDT)
Date: Tue, 17 Jun 2025 02:49:32 -0700
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
Message-ID: <aFE6LIpZsFfy3rRU@gmail.com>
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
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Breno Leitao <leitao@debian.org>
