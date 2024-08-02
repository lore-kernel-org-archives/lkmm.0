Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85170256D
	for <lkmm@lists.linux.dev>; Fri,  2 Aug 2024 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591989; cv=none; b=Gp016tWGQpeG3gFzQm9jMc97FdNN06QeyDb29BmyKqOofNO2krYR97v6nJlLDGFnDlx3sB0I57UgW59vtBTyT0IlEmzcQwCMvyS6nTZYxFnt2Of66YY+GA52pBS8aQQ+ho8G3667O3yWZW3tLINswJ5DDhxwXExLFnYVgSMYhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591989; c=relaxed/simple;
	bh=r+CuKV0BtJAp/fMFn++g/APZ2xgoalbuTBMWgFPMv9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9hQb9tL8wJNxp2t7q0JLyWpa6uj492L++zYLGNdKSMi/3TgY9Xzfqs8xdS6FAPR0fVaZbZoRJpPdd3i5W1Zgc/Jkl3bTabJMUIQoy1fiZJm5TJ/rhVx+oM40fHJPlXVT134nDC91Ucf2X7jq3JSLjW0iakyC2vpW5JcULf5Zgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnzqLqie; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnzqLqie"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42819654737so47341015e9.1
        for <lkmm@lists.linux.dev>; Fri, 02 Aug 2024 02:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722591986; x=1723196786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q67BM/SyptRvsJWIM+wuVI8aE85d1Z8XEHPF+IhIGiI=;
        b=AnzqLqie0BV56wSsZFS5pxLK+l57rmV8plmNOzmk4D2QFfZ/jr4dqyYZxUexAMizx9
         npfKcsSgHi5U2zttKsSaWBm/Luba0oI7ZZ3S/No+CbSOpGyQti3Hp/ylG3A+1AvU4y43
         uL1tCEFOGttGA/4xc87s6BxJmRXYFo1je/umfXBYe+Wav5eRgeCJZC7z8Sy+ha3OMBgy
         jbN9IH0uFAWgUNDS45jiicz6i5RguatGmsAJ5a0K9F98BlARLtldtpFjWx00VJ1kGJ6N
         vQ7GU0zUM/UM2XfeGmusCaQEXGeqvFYwhFcvQt0d8lMq12hUzbl9gxLtdQGGo6xolX2J
         bduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591986; x=1723196786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q67BM/SyptRvsJWIM+wuVI8aE85d1Z8XEHPF+IhIGiI=;
        b=SaRKvXeG/HT23hcviAPGy6u+6YEvsHuvYPs8nADZ4s1MLVqm/3pkF+Qjr+lZ+EoNnk
         rat9r1UP6qJ1HefgiHn1Iq4Y0yy7ovdF7tQ4iVoP3zxx8P4Tsdun1IJkM9iyZNz4Q+mA
         rdsxtOfjcjEqipf2e7/75AopIVq0xmMOYvvINPufLy/1z+tTw4h1K0Gs6Tdv53GQlvQs
         V2h2sOPySp4TloWgKRBfWLtoAAWG3AAyYLkXXU4UwcrAxeNiKYZhhJA9Gt5rzTUkdhDf
         2OtLaE0K+pD0+jOq6N6EnC5T+eKMlkCBvvmQkYgcEJ+n3J2Dc9C7ymkKVf+uQoKmxdZI
         b7rg==
X-Forwarded-Encrypted: i=1; AJvYcCV51PmvPLbpmKREQg2xNeO3GLiGRF+dXOHW3lijgKp06PlebsktAPcDSGotV71eQ39fDy10wp7HPA/zO+0hB7l7ZnS37Q==
X-Gm-Message-State: AOJu0YzrXwtEF9ShysMxi6Vas7Ol1EYu/jh3rxD9mjsPhlMAB3gUO8kT
	2XNfPYlFD9xq0mRNkYlGPrvBh/Ev85mDe/vdVFK/wYvEwkuw0Ca1
X-Google-Smtp-Source: AGHT+IFCLBjPsFTWDZkjzm22AGa3mLr/3SDceOhn+SPwLeYiThM/NnCa7DDCeZhNCep2iLYyQ6EoVg==
X-Received: by 2002:a05:600c:1906:b0:426:686f:cb4c with SMTP id 5b1f17b1804b1-428e6b96b3bmr20772425e9.32.1722591985295;
        Fri, 02 Aug 2024 02:46:25 -0700 (PDT)
Received: from andrea ([151.76.3.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42824ae7a59sm74389155e9.1.2024.08.02.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:46:24 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:46:20 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, kernel-team@meta.com, mingo@kernel.org,
	stern@rowland.harvard.edu, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com
Subject: Re: [PATCH memory-model 7/7] MAINTAINERS: Add the dedicated maillist
 info for LKMM
Message-ID: <Zqyq7DjIrHAOqf0k@andrea>
References: <e384a9ac-05c1-45d6-9639-28457dd183d9@paulmck-laptop>
 <20240802002215.4133695-7-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802002215.4133695-7-paulmck@kernel.org>

On Thu, Aug 01, 2024 at 05:22:15PM -0700, Paul E. McKenney wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> A dedicated mail list has been created for Linux kernel memory model
> discussion, which could help people more easily track memory model
> related discussions.  This could also help bring memory model discussions
> to a broader audience.  Therefore, add the list information to the LKMM
> maintainers entry.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Acked-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea
