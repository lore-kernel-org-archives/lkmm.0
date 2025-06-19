Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06522F4A19
	for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356300; cv=none; b=ORhqOHHM2EKYLgRX8aUJfKeykVCwH2cg1V3qXaBFNXJj7rf6uYpID8rPjTIXDg1LsbHyRhcWTY6JZ7/5KHWOziZL/n4yghMjmS/LmaprF11mIheKno4kFVBf/m/CpPWJn9SO8PtO1AUTN7+KcKG9eq4AJOAbKjdFQloXVFeIqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356300; c=relaxed/simple;
	bh=1dJVx9uawlA9hJYDvC4nybtTSvTD1cO2bZ9M1c+EVuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMTf3Ft0sc3iHwBkKRK9/FSYvTNzFuZia3izBkjlYsY4fdCGhqXFcSlyffx/zogxVIHabkjDWoQ4hnGhrtP/4Ej1JUpJGURtbqgTRiN/hiKNXXPDqwLw49OMkTgYAOySVkSf+HW7sP5YoqmPePo+JhFCUWzaVFNUK2o/7uvmtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MTM+1Sir; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MTM+1Sir"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad74483fso11203586d6.1
        for <lkmm@lists.linux.dev>; Thu, 19 Jun 2025 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750356297; x=1750961097; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju0rK1YrXezG8RMPatgIQGMIY6rdX0cs7akdNztgfu4=;
        b=MTM+1Sir1Qv12lqJvXYvyU4bIQHK07veOK95kqxImgpGtBjcbyhIfNc3qvVPan0VML
         gRFa7Bbn5a1a/iOw+KeUxxiu7bp2ivi3C/SMYGXT5+p6NMU1ZQJrlIXRdCtErO/aQwqI
         1wIp7Y4LvEoNpkjkbiQ4PKGu3OQjzYyXAsnS5kt5I43mAWy9xQvje7eC+uifL12YA2el
         0V7uUIVTmWX3/6Wywo35d98HUMfSEv2vqWy2w3X3FqYMlDayzO2GQYOHHTziSe6tz0Ke
         yT1g+VEbKm08k+m/OPZGOrKIraeyY8LLJYRnE9aKqP70UTYdsxjhj6Epe2eOUCAIjRR9
         Anng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356297; x=1750961097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju0rK1YrXezG8RMPatgIQGMIY6rdX0cs7akdNztgfu4=;
        b=eAvi168zU+hpcTSluBot6btmcrM/zNHJdv/SHmhnYNoJxX7A4gAbvvo606BWn5NfbT
         tW46tRrU0b0byRSef76Wzupf1T2goGtCHTcytwjsZ6Il+2DnxVLdMbdlXFTCsihdU2Mp
         euWQTMqGx1QLsDLFoiZ9poTmRq9PTWXn6NzERxoc7TYX4duftkbqAk4mUzsSzuu/wxDA
         bj4xxBzetwYebp1FCV1d96FhBolcHAve8HeG3eW7j7bygWnRu0wNFIjn3d2Kn58vReHU
         izwDRjnLuUWRclbfL5S/xh++JNaQMAjCjim/fr3p10vW//8JLgrwr3o7cOYZisuxQ+Sl
         RF+g==
X-Forwarded-Encrypted: i=1; AJvYcCUs/7FIDPY9jxbD8Fo8a7bpcZ094FinEkzf/n5lq7MqZXZUwxVBRzl9k7JNRuk6X4FRfLuD@lists.linux.dev
X-Gm-Message-State: AOJu0YyVcs63JrzRbUAfPD/1/2fP78VtzJX6n10FuHiNHhUVT/UFxALp
	Kkz3ZYWZ41xu6MU8D5qg1USa+zUeLp5Dqsv/N03dMKcD+cV/eVQSCV8xDlfPBsoRAQ==
X-Gm-Gg: ASbGncsCvth/ylVe9RjdecemwYS0AOBJ7T1+fB1hJw2xgBdvATcm7OfvCcnxjsj/TGv
	wp53q8R9uFF8UKcR4uqCrWVFcDaPI251jiDg6NKV5kSFdwvn4P9r6qqxpeJxMhXJ3GE5Uc/6HLZ
	nhq7ZvZ7HHqf7S9wlIWpYAzFQj5oz1DbxwXjhVwcbtK0sb4aptQIWk+gJNcn8iKa+96eV4mp5qB
	/GFvd1eeQTShdu/A8TgZkttt0WYP2z3Svw3EAATdOqZBdlhR3LasxBRf7UBV4QV1nsDY9KvKSI2
	SguyTMKEjiNDZcejynELcnYLNo6QXuVDI+rslNKCv/AO91jWgIHM59fVQzR1HvQ=
X-Google-Smtp-Source: AGHT+IHYQPCClOz6CKzGdC08frCU41q/Xam4KfyuktRr18N70eT9mCmlX3M2z1ua5tmNIo2PbaShTw==
X-Received: by 2002:a05:6214:4598:b0:6f8:a978:d46 with SMTP id 6a1803df08f44-6fd0a49c0e7mr3871256d6.19.1750356297608;
        Thu, 19 Jun 2025 11:04:57 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09544e75sm2440186d6.70.2025.06.19.11.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:04:57 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:04:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <d84ae4de-3fde-4097-a42b-9dec0902f27d@rowland.harvard.edu>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-4-boqun.feng@gmail.com>
 <20250619103155.GD1613376@noisy.programming.kicks-ass.net>
 <aFQQuf44uovVNFCV@Mac.home>
 <20250619143214.GJ1613376@noisy.programming.kicks-ass.net>
 <aFQmDoRSEmUuPIQG@Mac.home>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQmDoRSEmUuPIQG@Mac.home>

On Thu, Jun 19, 2025 at 08:00:30AM -0700, Boqun Feng wrote:
> Make sense, so something like this in the model should work:
> 
> diff --git a/tools/memory-model/linux-kernel.cat b/tools/memory-model/linux-kernel.cat
> index d7e7bf13c831..90cb6db6e335 100644
> --- a/tools/memory-model/linux-kernel.cat
> +++ b/tools/memory-model/linux-kernel.cat
> @@ -27,7 +27,7 @@ include "lock.cat"
>  (* Release Acquire *)
>  let acq-po = [Acquire] ; po ; [M]
>  let po-rel = [M] ; po ; [Release]
> -let po-unlock-lock-po = po ; [UL] ; (po|rf) ; [LKR] ; po
> +let po-unlock-lock-po = po ; (([UL] ; (po|rf) ; [LKR]) | ([Release]; (po;rf); [Acquire & RMW])) ; po
> 
>  (* Fences *)
>  let R4rmb = R \ Noreturn       (* Reads for which rmb works *)
> 
> 
> although I'm not sure whether there will be actual users that use this
> ordering.

If we do end up making a change like this then we should also start 
keeping careful track of the parts of the LKMM that are not justified by 
the operational model (and vice versa), perhaps putting something about 
them into the documentation.  As far as I can remember, 
po-unlock-lock-po is the only current example, but my memory isn't 
always the greatest -- just one reason why it would be good to have 
these things written down in an organized manner.

Alan
