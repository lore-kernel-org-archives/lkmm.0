Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631CF1632C8
	for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034891; cv=none; b=Rf8Gr+Zyw+pYPMXb+FCPDaaKjL2+ynwbAuNk7vyN2VgeBN44qedQX0cydPStj05ppz32oLebGn+RCC5xDq+RUN7z8Ja+qwbOyJiGNZX32L4ogdM3OuJd1tJY1IlGZVgnyTeWqalja5emUlzncfvfH+R8A/fe9h4AIEQdef3Qr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034891; c=relaxed/simple;
	bh=8SWOTq/6aB3hD/Rp3uSJjKSKkSx47GHiVeHf2/b9/Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHYl/zAVNb17gLUXLrkTHj49kBCTOK6SSxTq85pl6ZRR1U180CjZHUxRnyACJFRSlGEAJnJ2XAdBPq12dHfzkSyObkyzT47p6LZrKOlN6G/W2cBaN17WFxnX/XCo4YfIbmEGHIFcEPfxbkxQtIkLb/NXoWHR5pa7tpEFHTVioOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+hT7H3/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+hT7H3/"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so238960685a.1
        for <lkmm@lists.linux.dev>; Fri, 27 Jun 2025 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034889; x=1751639689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3XPUo2k/JzlWPJidlVVJlbfbcPmIjqtbYrSomwduhg=;
        b=K+hT7H3/LVtt31yf6sjkW9JmGtU1PcNybAZAfDh9S3n0Izx/nb56Ys76blH8fQcOs+
         QomVoVw3eGE1/h88fPRuYQLjZZXKoDy9dqKiGhyAQFEDEGGwhGL0iHqrkgshGSbwaDly
         X+C5rTD5vP6ySrG6ZVUAs+mWJKXF42+WOyvomexGi11zHCdhc0GaW4vKWidBAEeB7okz
         YnLJIJ6zGNDLndDnVYYTxrTFmBZfsqQSNCevVSLZjhTPiDss4j5+tiO5o2jLiSJ566Pk
         wXDujPG7AdMat+5ynp8Yf0FWvLDPuwl5pKCROqv3vhW41WaeQRhy9u6oQRt5h91aYIwB
         qbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034889; x=1751639689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3XPUo2k/JzlWPJidlVVJlbfbcPmIjqtbYrSomwduhg=;
        b=cOeQCd0PHB9jXgettKlw9SNKyITrj5jaPf0LvULdB2PayTKSOeNG6/t1Dep/Bdaell
         tLvtJk+YaFZyr+CwkO8hGWXD1VS9KbhscazSGi0qx4FtrdUICD5M3pej7hGawendWxtY
         jWQy4oCzx2Dkc7UsKslvMZXvPjgXjeQS9lgUnvn/LynkzJfEwN+sNjhjTpjj+/pzfUQ4
         uehv/Unuy/9XrSISaKEJTa55ChSsRL+oIiV/nALGtk50uxSzB13gWmZdETEwQDWA2moW
         uPqAZ/OorUmFs7EcoJLoWs1WaXnDPDXIycyuyip063tpUhj7ImUPBA1RrajfKuflku+C
         uqtA==
X-Forwarded-Encrypted: i=1; AJvYcCWXEe1J83kWROEd77jgbv9Jb3sRGlANTNDbOANTiz4iaa1cCskMGikhS4N8RB69Byt7v+hy@lists.linux.dev
X-Gm-Message-State: AOJu0YxrzlxJRKrKFH0qwJv/R1ij4uHlfh1ARrXhzkcxJFmRVPhQD9Yb
	pBnYsOKkf4HYpTJ2Rz0kRQFEbJB/naKwHVO3n6XKseg8j2Uxu8sHZ72A
X-Gm-Gg: ASbGnctXfH76WnJeFiIoTq4jcnev3XthGEKT5Z5tOT49PnZPVhekaLPbjKSrS08wbA2
	rnhel61Y5rO2Rx53nSDOlvzgV8Dt8D8/YbXAOiXAiE7cFXf9hTojGSvk8P3Wa0jdR0V3erSGcaJ
	pMJWhOySehN7FJ1YPQt7YURZLWj2q2wNfc70Kv8bpu6u9NaihcR2WkcTbDNEQEwl0eK/MU/oHe8
	gxp1DcXiVH94mboFGP/qM65Fz7VhPEhUsldnT6fprAWs9NVixjJQdgjyLwufwphktjvO8Oqyerf
	qUy2ZWuoRiaMKmP578EMkKfs1JM2j9XHK67osIWSyKzfUaYTLqZndsatRus2jgV1H1qzCOLoVGe
	gYg+ejJKfpByrxjblvLB70Xzomqmhou5t+XTNtyqjLN/5Sjrk1EtV
X-Google-Smtp-Source: AGHT+IGZyikryt8hPM9yrcWgWte1x7Olev818FRgeYkv+CxOxSOR68P97cWwvd11To4d5OzNHPBEOg==
X-Received: by 2002:a05:620a:8012:b0:7d4:4b12:a39c with SMTP id af79cd13be357-7d44b12a3abmr10636085a.16.1751034889181;
        Fri, 27 Jun 2025 07:34:49 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44320430dsm138449485a.63.2025.06.27.07.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:34:48 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25AD4F40066;
	Fri, 27 Jun 2025 10:34:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 27 Jun 2025 10:34:48 -0400
X-ME-Sender: <xms:CKxeaHaGyM6A187x3J_oJOBRqNZFvS84rgUIYDGEEfE1qEU0QKAl8w>
    <xme:CKxeaGZg7cT7mM1bxbQdO0-zLsya3lTSL_WDS1f6w1-qoTSOV-Vguhvxx8NpP51rj
    xM8PyRajhN7ylRlfw>
X-ME-Received: <xmr:CKxeaJ8HFmc8YjgC1rlq7M2UYU4tuBisAk0eyUzEaIc0iPdwB7Nbm22O_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeffeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhu
    shhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidq
    rghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:CKxeaNqEsdx2qMS26nGFaB16zCFaIwIEsqAvNInzeGK8V4aS_GcyLw>
    <xmx:CKxeaCoxLTbTjFCEGNQpc-dx0iS78-gkAPWlrPq120uyxlT8BTPKRw>
    <xmx:CKxeaDRHCOucVbG7up72PP_fDwcbf_eyrSijv8dRGX8v_epSy75Bvw>
    <xmx:CKxeaKqaDLEXezJL2BTQsrEDxGLz24pGHsCG-ufMlhOBMwKKZMYz_g>
    <xmx:CKxeaD5ju76A5mTWN9uDvGOOeyiryUFpsIKIv3HkxEI1Da2qNKMajHM9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 10:34:47 -0400 (EDT)
Date: Fri, 27 Jun 2025 07:34:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 03/10] rust: sync: atomic: Add ordering annotation
 types
Message-ID: <aF6sBmgTmdM5ZoB3@Mac.home>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <W3facY85E7FjV5y6_67OMqPUz1-Vubr8TpYgFCgXNl8GMh1oM6_bF9V94Kl_oZsdyCQSrxm5WExUmztE3pJ_BQ==@protonmail.internalid>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <87wm8yznkt.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm8yznkt.fsf@kernel.org>

On Thu, Jun 26, 2025 at 02:36:50PM +0200, Andreas Hindborg wrote:
[...]
> > +/// The trait bound for annotating operations that should support all orderings.
> > +pub trait All: internal::OrderingUnit {}
> 
> I think I would prefer `Any` rather than `All` here. Because it is "any
> of", not "all of them at once".
> 

Good idea! Changed. Thanks!

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
