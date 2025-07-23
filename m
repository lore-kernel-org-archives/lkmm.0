Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B3221F2F
	for <lkmm@lists.linux.dev>; Wed, 23 Jul 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753298721; cv=none; b=ssHQU4bwn0h5AMu438VG/Pjf6KrK6XciAAjJQ9FiE1mZM8MsbvGDKXAIS2KJpFdXM0NN6l6r246FRqSrdeETCEbz1VMglBY7wt6IaXQwIl1GVTjubGdrabkhqJvxKnFwf7q8TkYGZ4di6MFGbu4Nd5oEkWgaYu4EbE5c/rVBbdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753298721; c=relaxed/simple;
	bh=BkbfST8VnkNe2dA/eG0x4Zv7iq6xINXAglN3NoSKfys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QByzR2xDwdv8UbQRCr+oW34kiZl/qaIb0NL1ykAGRaIDhMDnZw083yAOnjADI5XXoDwzc62lCOtqycxdKNFBxcGuJQh3FfamBZ5yfDSykIcjkw9lCSR7hHfexUtC+yGVt0PXZqAnIX/ABLRS41Und8evinDgQGsjIYORAychoG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RLyGWI0O; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RLyGWI0O"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ab82eb33f9so4224181cf.3
        for <lkmm@lists.linux.dev>; Wed, 23 Jul 2025 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753298717; x=1753903517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ja0+u1t4v2GnYrO6vfHRjNkhPG9aXnqYbT0ae6BB0O8=;
        b=RLyGWI0OssPTQDQmEs/21UdL1d3iCa60fnP2I1wgoefIkumumg+McsESnYUTFctRy2
         c4FjOj2BK38rEOwqUHF+sBf3Q/2efWyfCOgnm6Z/v8BkfAUNhWCt1Bgj85TFE2Zp6QdE
         3VRnWyPEiBy3bGaLmbSFZ2NkqS7oqojw2umv4LmfYlMOw8tHu76YfHCm+m6VBeQ+hTkY
         jICqWZgmRqzW5XYpD73Cfhz7Rrzt4yo5vBBgAs7s+COQ4S9lHYlkJIY7En43GlcnZP4L
         beN7RK9fzADYIHxgYCYVDdsBfoEiRfuTXGe5fCJ1zfsGj1mwBpFwAAtoXjp7Olfdrqw0
         CQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753298717; x=1753903517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ja0+u1t4v2GnYrO6vfHRjNkhPG9aXnqYbT0ae6BB0O8=;
        b=g+Qu/fBfOJx3dHswa7qKzx3wq44/oTpRkCTi+ZJeO2PcKZpyTBtYlD+gejF4M1lvMU
         aWdza6Dti8N+1TVPSo77bGl7rAzNMVTYndDIN2IYR0+OLMs2Kix4FNFVwcf60QS88rdS
         wyjFPn6Oez37JVFh83IUxtjHX0hFEVug0VtaBWOoQnwr9SeUG8xnShiwz9Dvc36aYqmG
         ZgJ+VgEev+FL1YEqGCZZnBJFGyx2OzQGoYg5hE06RWzkPkti2G16hexBoj2bsz+BoiyH
         IqKh5qMk+Hd+XSaBZ8JRoGoDHukv6GmmyiZ03U4p70MvUQLiaSvTNSLLQwBo9AnsOKz8
         RH4g==
X-Forwarded-Encrypted: i=1; AJvYcCWcue8v25+UZLTwq0HjqMMhiOrYhk9SCdahgxMmuSXKiRZflGGualylB2cH1QYRVyGBlfjX@lists.linux.dev
X-Gm-Message-State: AOJu0YwS7IoQP4va5M+9Qe4qqk/2oePQenB8qhLKc+P/9I9u5yw075mD
	puEZWX6PfFl/tP4aToRm1/7RHdLmTb6kWYaQFZRRnTVa4XSj5D4++osr313oCEmC/Q==
X-Gm-Gg: ASbGnct49ixmEFtOs73RfbgGpmx+7Ogfe50kpP7B65lWeoCBrPSyvLVAQL1ZaQKsxN+
	EzTFSgEjNXyfRaFw+LIwe5g+DAtjH3Irx3LZM6eceAY3UBGq/WwfVjZohD0pZXOBYFsWXDpZLAA
	t4yqevpdkc4NrlH7MRoW7FEVD7o7QxsIMd+hyFghdQ2s8eAsxHh2q0KXYSzfj7jsBzRwNyY/W/Z
	5SIUJZZvZHo7W6z+9g43ybegCmHPDhzKedoHn8tjQaZvZoX+9H9FFDiE69HVARyjW3lZVoQyvrF
	p8GHBUIQ6pTDCFXzZp3F0GByybcMf9qSXoKfHw2tcM0uz4GwhE5SSOsoPm6Ew5frov1E7dQJepX
	6r1mWy60D9IJkZH3BYPlMq6c7vSiEvPa4r/RQU8DVj8JUlBZhMJS7cproOj0SjgiuPQ==
X-Google-Smtp-Source: AGHT+IG8vOZUCry43fkriuOa/tnIX5d5irFl/w/P6a2uToDSFLiTZ8ufd5Tr7TYG4+WypOiZc7k5eA==
X-Received: by 2002:ac8:5913:0:b0:4ab:9551:3b4d with SMTP id d75a77b69052e-4ae6dfe9242mr49397451cf.54.1753298717332;
        Wed, 23 Jul 2025 12:25:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:3d4c:de64:63d3:50b5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb499fcd2sm70834141cf.17.2025.07.23.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:25:16 -0700 (PDT)
Date: Wed, 23 Jul 2025 15:25:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org,
	boqun.feng@gmail.com, npiggin@gmail.com, dhowells@redhat.com,
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, akiyks@gmail.com,
	dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
	quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <b9c250b2-e4c0-4e8f-b37c-b51d93b980f0@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
 <6fb01aea-f7b4-4f38-82b9-fd6c360514fc@paulmck-laptop>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fb01aea-f7b4-4f38-82b9-fd6c360514fc@paulmck-laptop>

On Tue, Jul 22, 2025 at 05:43:16PM -0700, Paul E. McKenney wrote:
>     Also, C-JO-OOTA-7.litmus includes a "*r2 = a" statement that makes herd7
>     very unhappy.  On the other hand, initializing registers to the address
>     of a variable is straight forward, as shown in the resulting litmus test.

...

> diff --git a/manual/oota/C-JO-OOTA-7.litmus b/manual/oota/C-JO-OOTA-7.litmus
> new file mode 100644
> index 00000000..31c0b8ae
> --- /dev/null
> +++ b/manual/oota/C-JO-OOTA-7.litmus
> @@ -0,0 +1,47 @@
> +C C-JO-OOTA-7
> +
> +(*
> + * Result: Never
> + *
> + * But LKMM finds the all-ones result, due to OOTA on r2.
> + *
> + * https://lore.kernel.org/all/1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com/
> + *)
> +
> +{
> +	0:r2=a;
> +	1:r2=b;
> +}

In this litmus test a and b are never assigned any values, so they
always contain 0.

> +
> +P0(int *a, int *b, int *x, int *y)
> +{
> +	int r1;
> +	int r2;
> +
> +	r1 = READ_ONCE(*x);
> +	smp_rmb();
> +	if (r1 == 1) {
> +		r2 = READ_ONCE(*a);

If this executes then r2 now contains 0.

> +	}
> +	*r2 = a;

And so what is supposed to happen here?  No wonder herd7 is unhappy!

> +	smp_wmb();
> +	WRITE_ONCE(*y, 1);
> +}
> +
> +P1(int *a, int *b, int *x, int *y)
> +{
> +	int r1;
> +	int r2;
> +
> +	r1 = READ_ONCE(*y);
> +	smp_rmb();
> +	if (r1 == 1) {
> +		r2 = READ_ONCE(*b);
> +	}
> +	*r2 = b;

Same here.

> +	smp_wmb();
> +	WRITE_ONCE(*x, 1);
> +}
> +
> +locations [0:r2;1:r2]
> +exists (0:r1=1 /\ 1:r1=1)

Alan
