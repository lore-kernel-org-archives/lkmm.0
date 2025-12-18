Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50827FB28
	for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 22:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766095367; cv=none; b=RE5w6CpnclEA16oCnKaRvdvo4wrLvfBEbtZNOu8TfwAmNC7hEgJtzBJQcUZHaQ/QkQtG1zv4MswX/1Sbr6akjOIxGuXb1pKHmaWuo3sY2IBmBUv20J6vrCELB2V58mvH14CJlM8sLeNW9SbrHkRjmuX8E2F0U/VIUV/gyRiG5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766095367; c=relaxed/simple;
	bh=Bf2KYbMziPki3rnasos5YRzsDzuBX5KJfPRFOQinxlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NL+KScPnij7UoLPCJ5sdRqol5qdQBNhJVu5FnrhWzb48icVPNxRBPEAC/zA2wp+ih2ZyKycuCEV3u2Yr1u9SmeUCsWg1JoyjQcTzvWEyWHRdZkw9oN4HHrcr5gEwokGkhi2PixpOY+3zxwR5zv4p2M6rrafdkVa5Gaptp/dYn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhzi1+N1; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhzi1+N1"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b76b5afdf04so174966766b.1
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 14:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766095364; x=1766700164; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3VZdRP8NwaypFlr46kQWQp+Zi4z6sAOUbRUp8gjWS4=;
        b=lhzi1+N1YWy4CqOC0diJJ+IkR5LJgBzDyg+aMC7zRA7u6blEV90yCld819z491RSpH
         Yri2hqi0h4VJTs9nKYXcaYW/+oIKTfokY63/I6WPfbUG35oGNyLuGS0/Cryf5IW6VYav
         N1bLMDMfQpdK787ZdpKdZD3Uo1xU3RmwSPRDNn30HOTv1k1oM56DoeB5jmxvPKs7cbIb
         +tZ/IiDimA2JbfaQ0WOK8s5+kajbbVcPtK5WvtoCYCvrpvyBgrYCEnx+k0nA00GvRsYs
         n2CtGVC1bii4KeohOSVjIThd2ulcSX/b2KLnFuzEiXPd0lW1Zlu/CDxTvW/rWFkcfe+S
         2rLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766095364; x=1766700164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3VZdRP8NwaypFlr46kQWQp+Zi4z6sAOUbRUp8gjWS4=;
        b=ZpScqp8RnPrWU6XaibjdvetCYjIFGZy3XXO1UAn1I8AZTWs5jNV/j9lCnTwECVDtza
         052JnXTWMQ9SCuyhfkerhE8QseE4vC4E6UyDgSsJZAbtMhlqMamE4PkkhgFFZcKNiFyD
         aFOGdCldRcN+ly7n5FFTqZPNY4diIRMNa26x7VjSitTJgqCLT3ogGMcMlGnQZ3j/9jOG
         p0YqqxuLVPd5cMz3iFrcCzUoqfblg+vqVVrrLj79odtLwo5be1SdpKamFCXzpSazJO2R
         zQVTomq8hDHAtSXmEdJFiFdjNhq+DV49eMwCQAn1NZUKnYCztMK4hfef5BBzHzNMqF6V
         gX7w==
X-Forwarded-Encrypted: i=1; AJvYcCWB4Gh9cx8D2jBHelJKOVkI4KQDO9PEspUiZg1oYDWMkGSho5OtAyZbbUAemwRoYofChbzu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6rBPEUaoEpONjCxEiV1RajJK89wEGuMbkM0RRIe8SAy3cdkjF
	Z/TeKAhs2nGMcNugela/lOTms6xgsxNAgbwgG02aORjjT3XJI8bQPEVP
X-Gm-Gg: AY/fxX6TsQcM7+iwFJGId/Y6QW2J6qYDUUh0gj6mPwLryE1gfVxAVH4/aDwZQpXMeRZ
	TdUay5b7sW4sZrN/20m+AZf3in39oWFMbKRtiD5dMe+uHZwRJjNm1PHX8n97+LdzoFSoKdOM2PS
	U3GSYrBRuv/7PdimOjM4bxvhaRwlix5nK2kkFUrj1pvQZa3Vmn9WQZTYm/ekO4Qt/i31KOP8B26
	SBdWf+4EFsztzks4Nf1V7IVStydfsZS6QuVrZt7M4WDqbQN1urw9aA6VKZIozaoUtR12hHzRgH1
	1uxD/nfuQx+1c9eiwIZ3EyA3RMaehCrf1qmjLRBqa3mHLg6KktPMq4s/fksnFX1niJUFV55FVuX
	85BsrcttVKnLmoxP0bIXe6qrgxQCRUKHDSDT+zFsywfp8q4dLBQ1uaLo8GPKBoSuPxJpFZwNYvg
	gTb3P/XJM=
X-Google-Smtp-Source: AGHT+IGC8nWpel+ncFSY/d62pIo9n55fFYIVH8WgqZxu82es9cY5UqEa9vD9DhmktlmW69ZmfTB99A==
X-Received: by 2002:a17:907:3d42:b0:b73:a0b9:181a with SMTP id a640c23a62f3a-b80371df391mr84490166b.54.1766095363819;
        Thu, 18 Dec 2025 14:02:43 -0800 (PST)
Received: from andrea ([31.189.127.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm50069666b.49.2025.12.18.14.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:02:43 -0800 (PST)
Date: Thu, 18 Dec 2025 23:02:38 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Haas <t.haas@tu-bs.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <aUR5_kSv6gR_sITO@andrea>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <0f7f3317-7a96-44f2-a3e7-a49f75bcd6aa@tu-bs.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f7f3317-7a96-44f2-a3e7-a49f75bcd6aa@tu-bs.de>

> ARM has recently fixed the issue on their side by strengthening the memory
> model (see https://github.com/herd/herdtools7/commit/2b7921a44a61766e23a1234767d28af696b436a0)
> 
> With the updated ARM-MSA model, Dartagnan does no longer find violations in
> qspinlock. No patches needed :)

Thanks for the heads-up, Thomas.

This reminds me:  After your post, I wrote some script/files to test MSA
against the LKMM by leveraging the MSA support for AArch64 available in
herd7 and requiring no changes to herd7 internals.  I've put these files
in the repository:

  https://github.com/andrea-parri/lkmm-msa.git

in case someone here feels particularly bored during the Christmas holi-
days and desire to have a look!  ;-)

I am hoping to be able to resume this study (and to write a proper README)
soonish - but the starting point was to "lift" ARMv8 execution graphs to
(corresponding) LKMM graphs, cf. the file cats/lkmm-from-armv8.cat; then
the usual "test, model and iterate" process, with unmarked accesses still
needing several iterations I'm afraid.  Any feedback's welcome.

  Andrea
