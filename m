Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B81D54E1
	for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862160; cv=none; b=Ix0Ea9XZKAMawu3myVAW4eeLADPNWAFOeEiCAzOlx02MeJ/2PEjumURaVtMYS3Tm9243dB2N7zjLTLc1oB80RtfEYYUI+TuvNahivTb0r13beMPh/WiOWapGy+Qx041WBoURRlWXL8x4/H+G+AD9paeO4m8o93d0Fsh40i5qLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862160; c=relaxed/simple;
	bh=6rIo+vdcMEuTUqZoMAe2vVb8Ms1aL7m1jUDOp7NaOlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIQ/g93j7+8IAmooQmkBuEeQdxAfZnqKGpCxCt4TUi/iQYTIgJIeQopxW5QiBEN/mg/+bjgnTTMiK+0Y2Gb+NFJf6O5rMrMAaa2p7IRLwZEl6OfKs2/lbPeHbaCJXg+FTItaQrpYVi0aYOdkE+69E2yXrQnorSxRWvrkEoClZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwzzvRSe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwzzvRSe"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5111747cso20040211fa.2
        for <lkmm@lists.linux.dev>; Fri, 25 Oct 2024 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729862156; x=1730466956; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFQYI9kn2KpyO6+Zh+n/B/mnlRE68l19bBjZd/mN70A=;
        b=QwzzvRSeVAv7x71ItobTol29tUtv8zie4du1mZbh1jicC2mHvGx0Q1MpzEb2AwNjh1
         /pwMLB/4Sh8lTvmKUSc/1QRFINmxFXaadWZFW/ZOtCfc9yokYdRI7C8vd4GrD+Wmihch
         auNmDdSEfvhLDDuukewuFJYwj9zoX/3A4l4sBPPYPtg7o5ger7DoX4QGXWKhCu419Ic/
         hS6XKOdMu2ojje+752MAS8y1xflEhI4J5auUjTZc5iKBtYABjNewSzp80p1IT5B69fjm
         MBg6Vfwd43fwba2rkGPFVGVHDTFDktKbQ1hA2rczKet2S6XTKPvmeiZG3DN6N1PYcRNK
         /Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862156; x=1730466956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFQYI9kn2KpyO6+Zh+n/B/mnlRE68l19bBjZd/mN70A=;
        b=umu9tDqCFgNX9g2zzMftUT2ErZsu7rnJLI0HGKo/GEc/nwKOKqmifwKvk9WpkOxOTA
         uJ/xWW8pTAnRJLopnv95z/RSpTk5YnmgBgRr7O37YeAG9shZLXF4U3sRG8jVbRaArvSB
         hxC5k+xOzaenwsHt/9g/aOLhwTPG4DOC0gShghLkfutalyRCoN+BHgorrV2CfMCUJ6cz
         /ntG5onFRia3rK5GCJ/VU8N90530hrkTTm1TnzDwas6BHQqerhArc+H9/ArZgx7SOejp
         83Di3Ou6STDGMKtvGbBKxzIAAf+vbRm4xkbzLLPhvePYAcZUJ5gCXv8GZY3Qy0z7NBI+
         uRSg==
X-Forwarded-Encrypted: i=1; AJvYcCXyFFI/uGcywf37+AUmL3lTstsE/aUudalIGIhOTlggGqmFlt2wx4DKz0nyo0qtuSjbfACU@lists.linux.dev
X-Gm-Message-State: AOJu0YzDuZDhgu4HznmP5Ag5ojU1O9MI6sVnkgZhaKsHjZv2+8LRRZtF
	k8clJM3EQzOksuR56NOMe4OCUShBCo95Cp0HCKd5BjA4w9BKaUtd
X-Google-Smtp-Source: AGHT+IF/vki52w0HARzbFk6uhj5G7C/TJ4gfz4Tapn5tB1AJ7e6CiehZey0IQiNgqI5DznVN1grc8w==
X-Received: by 2002:a05:651c:198c:b0:2fc:97a8:48f9 with SMTP id 38308e7fff4ca-2fc9d35a491mr58028391fa.19.1729862155916;
        Fri, 25 Oct 2024 06:15:55 -0700 (PDT)
Received: from andrea ([2a01:5a8:300:22d3:a281:3d89:19cb:ed96])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62580b1sm618645a12.15.2024.10.25.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:15:55 -0700 (PDT)
Date: Fri, 25 Oct 2024 16:15:51 +0300
From: Andrea Parri <parri.andrea@gmail.com>
To: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
Cc: puranjay@kernel.org, paulmck@kernel.org, bpf@vger.kernel.org,
	lkmm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Some observations (results) on BPF acquire and release
Message-ID: <ZxuZ-wGccb3yhBAD@andrea>
References: <Zxk2wNs4sxEIg-4d@andrea>
 <daa60273-d01a-8fc5-5e26-e8fc9364c1d8@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa60273-d01a-8fc5-5e26-e8fc9364c1d8@huaweicloud.com>

> > BPF R+release+fence
> > {
> >   0:r2=x; 0:r4=y;
> >   1:r2=y; 1:r4=x; 1:r6=l;
> > }
> >   P0                                 | P1                                         ;
> >   r1 = 1                             | r1 = 2                                     ;
> >   *(u32 *)(r2 + 0) = r1              | *(u32 *)(r2 + 0) = r1                      ;
> >   r3 = 1                             | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) ;
> >   store_release((u32 *)(r4 + 0), r3) | r3 = *(u32 *)(r4 + 0)                      ;
> > exists ([y]=2 /\ 1:r3=0)
> > 
> > This "exists" condition is not satisfiable according to the BPF model;
> > however, if we adopt the "natural"/intended(?) PowerPC implementations
> > of the synchronization primitives above (aka, with store_release() -->
> > LWSYNC and atomic_fetch_add() --> SYNC ; [...] ), then we see that the
> > condition in question becomes (architecturally) satisfiable on PowerPC
> > (although I'm not aware of actual observations on PowerPC hardware).
> 
> Are the resulting PPC tests available somewhere?

My data go back to the LKMM paper, cf. e.g. the R+pooncerelease+fencembonceonce
entry at https://diy.inria.fr/linux/hard.html#unseen .

  Andrea
