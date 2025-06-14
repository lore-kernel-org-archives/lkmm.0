Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8A1E4A9;
	Sat, 14 Jun 2025 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910286; cv=none; b=U2ydCrlp0Mmld02bjtu7TotZ3EhunliJhSxEkaZKXNQBuBmbIAimV/coX2wTiO+WVUMKxwlQcN4sPJspqCZe1ExhvZX3xmeri9+x+sWmD0K8pqm0tQogGlyKKydPgsWK8czSljBVEZAalAA8Gd8i9J42/IrLSrsEUU9LOaro7pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910286; c=relaxed/simple;
	bh=POxwkq0O0GbjEOLATg9Cms4ibuGIWc/rbmDVdyXvrOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6vlC9Se6sOAw2anJNKTqG3iqueCBCe/DzU7NZIAaqvDgWbz/6GD8ACFAcUuG6tQ+ch2GG77bAoOuEs4tN8L/2bYHnwEmNB2TjbHWeMA4G1ffXCRSwrhuIKUQjI8XuSaGY+sVC8/pXxqkbJn3xv0AIi9FS62HZtjNLUlQPV2NlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a51UWO8Q; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a51UWO8Q"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2ea58f008e9so2397293fac.0;
        Sat, 14 Jun 2025 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749910284; x=1750515084; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eiB96bAhSJ6/e3F5OHXMtztFQ+Tpw8+eBOtaWFUgd08=;
        b=a51UWO8QW5MKzW1j3cLy2yNi5EX2FK0yR3/IFp2WHxLUfAH+Zj+ocfcl1z0UsD02se
         VGkWcm4zc+h+py5s6V0qo42NZ7i6UQwj4xOfBD7NHeYDcfpwEPdE/+JBIPJwu2LI47/w
         8IgvO/Ai5Dof4A6xzWn+AUIYKTO6NMA2kX1tf31QpfTWYquPoS2Isv3tTfeIBpDOo+OV
         1iL0Hs8pQ1Y+r15qmkX1KYOeIl90/70UeIU344vWO+kimADJh+CbrPUo0fe3wbtrmj0S
         o5CspRLxbyjpZtEWQzXJIn4FuWVA+I/bIaGpjP9VUEJaCCjsO3WmYybLTCRWjlEHH7Hs
         x8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749910284; x=1750515084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiB96bAhSJ6/e3F5OHXMtztFQ+Tpw8+eBOtaWFUgd08=;
        b=T7TA2+jAO6EYkWFFnQ3CfSpByQik3ZJQijzTM80GdTzdrSU1pjz+9sKA5yDp5D+I6b
         O409MOvy9uk/rSCerjoQqGthI2Hph/4dWrRm3Dq7e3iH7bJLGZqBSOd9e/KkZz9800wC
         IZeZbivPjKLBDRwZLigVEdQDmcLQDn0rLJ2Ai0gCZeXOTEUSF9XaAmntwmAm65Vm9dhe
         ufeiwArA8bbHjasKrjv16bMw60EWkdVaFrHepovQwg2JoM27ddewl4V6jmIk1BnaxxaP
         BuGgqofDSlFD2m3TTfeTaEi4Yc0BjMoMotGD7EcXWkqI+F0z3BokUYO0vZo9lGi5dFUY
         38Zg==
X-Forwarded-Encrypted: i=1; AJvYcCU9HCLE0MxGoqZj/A4WKLpvGAF4yNXPeoqlOP5Do8cbihmAgdIWzM5jhJKHuhPYv7GMe68nOzG7XDFl0MBNBn3UyC7zFQ==@lists.linux.dev, AJvYcCUcdpr+AaaC8Otghs2r5JhQrKdP44VjYYkOLTdI0rXU+LutDz6RfbJB/A5evwtZOZUzAZVsIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyG5T5J9vJvmn1i2hWIx3QrmY3y7LF3bWMotuJZM7+N7B1wNYn+
	y57PO0OKBZOpGbOPb7eqfD31sU5qtgN1S0OzaB9586HB9va4jkiJhgjYHpe1LqVvLpyRkPLLNBH
	+h8wVBtfqiyWQsX/bALoganofZT4mh7iQnHGj
X-Gm-Gg: ASbGncujXYcVXWz6ouzv3Pi3E+nZWL0TUeDzURPHDQrdW52MA8Y+VwftnRtYFrzqqIz
	ke5vTBNFLfi1Zt0XEh1Q9ylz86rF5NZwF2bYASfR3HTwchE8NYyQm6U4YNI97c85AZxnbzTPu0O
	Lii+GZJDdwYgn5s1E06sr1U1lS4Wid7AeAIVeKMwjZYBytSZx1GA4PkSLcvevQ8HIKAet/7EOiu
	SnvetkWXBtt
X-Google-Smtp-Source: AGHT+IHL7vBY1W2DXQlT9x8BW0qpd0hTAvVSmZdjIqU45TpVWU75wLX2Cpkv4JMTdfmuBXHS0Fns4/kCOE/Hp9HqVZY=
X-Received: by 2002:a05:6871:4318:b0:2c2:260:d77b with SMTP id
 586e51a60fabf-2eaf07f4bfdmr2374938fac.5.1749910284303; Sat, 14 Jun 2025
 07:11:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1749891128.git.mchehab+huawei@kernel.org> <9b22975b17bf42210f8432cf0832323c03b1c567.1749891128.git.mchehab+huawei@kernel.org>
In-Reply-To: <9b22975b17bf42210f8432cf0832323c03b1c567.1749891128.git.mchehab+huawei@kernel.org>
From: Donald Hunter <donald.hunter@gmail.com>
Date: Sat, 14 Jun 2025 15:11:13 +0100
X-Gm-Features: AX0GCFsfuit4DJaOo6O24z_9KMPmudpwemZmcUivmVYluqb8vmkzFkeOZF2nLLs
Message-ID: <CAD4GDZxj0YXKdmZiWiLhn==Krg8_EjoUWjLn5Mz5Q=JHNC86_Q@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] scripts: lib: netlink_yml_parser.py: use classes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Akira Yokosawa <akiyks@gmail.com>, Breno Leitao <leitao@debian.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Ignacio Encinas Rubio <ignacio@iencinas.com>, Jan Stancek <jstancek@redhat.com>, 
	Marco Elver <elver@google.com>, Paolo Abeni <pabeni@redhat.com>, Ruben Wauters <rubenru09@aol.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, joel@joelfernandes.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lkmm@lists.linux.dev, netdev@vger.kernel.org, peterz@infradead.org, 
	stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 09:56, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As we'll be importing netlink parser into a Sphinx extension,
> move all functions and global variables inside two classes:
>
> - RstFormatters, containing ReST formatter logic, which are
>   YAML independent;
> - NetlinkYamlParser: contains the actual parser classes. That's

Please update the commit description to match the code.

>   the only class that needs to be imported by the script or by
>   a Sphinx extension.
>
> With that, we won't pollute Sphinx namespace, avoiding any
> potential clashes.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
