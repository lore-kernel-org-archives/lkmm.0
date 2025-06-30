Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77942AA4
	for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297284; cv=none; b=AR+3RHHGuE0U3n70bw//bZUYustkFAvxqNBdLj5A2QlGaXiaLTquT1PhoGK4/ehkbJs6qEv5IUp4i/MgOONsvcO+gdkiXN2XxZdMcUL9Xh2f7vZM7pxqyTuJDbNlqOATamN01I1jU6x/iktuSN8f4InBd3YOH4AQEgaCJEvBLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297284; c=relaxed/simple;
	bh=R4ZKd5Izt9SSWjSSLD/vaRFa31ZYb9nuV07HQ1qG4yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgu+TgWm3ZDqzh+tEYISjUQsB1ZTZgSQzMcSwXY87fwlpQ5tnWoffC0cUiWNN4bXMd2oI+H1+9eY2KCBY0t9qXD0FuwRacaGO/DX4SfB5yhHtOd0PyEpPzRHZLSWeNptmBod5XEeDcaEMIQYOiF2TP3fKrbwtRHcNCCE9fjHf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1aHUtTT; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1aHUtTT"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso46295016d6.2
        for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297282; x=1751902082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRWe4SgiDv0tsg7Z/Uvyrshrg1+1baaByE8+3IYg1qQ=;
        b=h1aHUtTTJTLpOQg9SFD+lp6UwT9oqkObl8LOOxeToCRxsJ5+9p773jssn7t9vLupsC
         h/K3GG33Qy9GR5TWfGUfJRY7HLb5RqKeBGDb631pT/nkS+xkFvYE7xIScluTW+WU7AFB
         bOFgQApA8Z+JHgzOsuk1JA0exEj5Hq8Tn+MIagcZA9OA2+wq2HgA1DmHGZ1D0/FuCtAI
         0stSvGIrygaw7nE9C5tRhDEB95drVYNGuk3C7nzogHRvcgAK/RJg9t3KnWCMMjyRcXJF
         fTTZ/SB7FRQc3zZzEjTVCZJZO1zsbPjHx7qx+nDJ5wLIO4Ydd4Y7g2J8W5RjME0QUW7L
         j3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297282; x=1751902082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRWe4SgiDv0tsg7Z/Uvyrshrg1+1baaByE8+3IYg1qQ=;
        b=QaE1pZ/l1aIfrYg2kvGoljXdc/l8ys1WHN04JemTgtYKAJDTPK64iV5ug/jpJ3Avw8
         b9TbXEb0ZPaOt8Gnxh6Ud1d7xW0paZxlug6COwkqj3DiFnU+ngadtFHCOgVTsb9lnp2i
         gzdLtPajRjeK8KMZpNRO8KudCKsOWu4BpwmX4I1o154N76ki2zX6v7CY7UgTqaZvDLKm
         6eWHZGMgocdJS24TXl4BL3BWd96xqs7s+AHtWGM5ghniXhj/s8H+2Ni4H9TD+dKkTH1g
         qi51oyrH2xLNy0QJ//kO6oAf4GEq5v3x0GHnY2e99WdXPOlWOiAqKeUNFFKJWJm1J8Fq
         qwug==
X-Forwarded-Encrypted: i=1; AJvYcCXYsNtunbcUGCjpys8y/AgQNHQi9Y2d59WTXZGJUn4/Bw7jntZuNOEaHtndGNercWbb3Agh@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb5UIqA2SCs6vasbWM0rGQvueThin8lwPz3aMCQI7gscGCooz9
	B9yz3yheTwbPNu7HrK0hpUYJ/oI5g/FeumyU3wUemXIul/ERofGs/ZVa
X-Gm-Gg: ASbGnctg16Kfyj1r0GV04Vk7yo2j6PAQEnu2G7Twm1qh7UGPP5QqSUnVKYnSNcUhji0
	TK59mRBXgjCmYBog1COilQjbPKZ6H8bPA3nV0N+mimDt0FFsAw2P2rbf0IEKZMlvcbEHYyhvvHe
	GCebvvd/tnX6gNSQ0fYDDAsim/XAt6VLJ2jIXG/vb3+/tHkV63nxnDhpdsjv7HFAZbzrDrcmJQJ
	6iQ9geWgAXCz6Be98i4YoYkHWOR0tlacN4W3QZ2xK39r3CxWj2NZO92FViKrvr8L13cFkOEcX8I
	K+qptTfcQDxH/GGLldBcatX2TRPAa+NPO0HBsxmJnyFJcI3O3SYyLG+mFWd4Y7k5wuRjOhzSfY7
	MQqeOy6rWEa6BUwPq4wphQMh01WRSt8McLwY3nLdR0yrANcM1Suu1
X-Google-Smtp-Source: AGHT+IHBoKvVU4bpVWy26A88umlSdYg7xDFOn/6WBb9a3Unoq7wnWyZHIkO35I8WAP6pzd32QS3AzQ==
X-Received: by 2002:a05:6214:2345:b0:6fb:619c:98ac with SMTP id 6a1803df08f44-7000841ca3cmr224617726d6.39.1751297282157;
        Mon, 30 Jun 2025 08:28:02 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771b5027sm68355766d6.33.2025.06.30.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:28:01 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id AC81DF4006D;
	Mon, 30 Jun 2025 11:28:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 30 Jun 2025 11:28:00 -0400
X-ME-Sender: <xms:AK1iaBDkzTk8wXkRcRCl0ZTQaamobcNFNn2lthfQZAaBqYl-rvBptw>
    <xme:AK1iaPiWRv5GW2N2xd_TSxK11S4xArae6LLB3mTudbzSy98B2ENiOkAy04ETpJubY
    dj3boj5xv_pjVM_HQ>
X-ME-Received: <xmr:AK1iaMlvsePwJadZVdYTYO32qtVdofMVsHMQumkgvmvR8SHoQiqe7o_PMPCy9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdq
    fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkh
    hmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgt
    hhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjoh
    hrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:AK1iaLyaKv3kaC8pF1jREu432UFhp9rOe2NMpIMUqK0kb7Dp5dFABA>
    <xmx:AK1iaGSOvPvFxO7IawSH5fP1OvTeoOjQL8T6Hq-IcY7XeTXcgMzesw>
    <xmx:AK1iaOYUTRQh-zeZJ4piKuc_bVkOZuDUcVUFMwjrdbQfWLnFm0FxNA>
    <xmx:AK1iaHQbPhBvh5QjX3knerCzXuzVJrYCFEVQAyasK8azsx1TzieD8Q>
    <xmx:AK1iaEC1vKaFzsxfrU6HFdoOerQvp30nvKAebfMON3CWlBwXZfESzDaO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 11:28:00 -0400 (EDT)
Date: Mon, 30 Jun 2025 08:27:59 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
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
Subject: Re: [PATCH v5 05/10] rust: sync: atomic: Add atomic {cmp,}xchg
 operations
Message-ID: <aGKs_21dK7y50fxh@tardis-2.local>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <DAX6WZ87S99G.1CMIN6IQXJYPL@kernel.org>
 <aF6iXB6wiHcpAKIU@Mac.home>
 <DAXY0EJHHDWM.1KRSSJLOTCZ8F@kernel.org>
 <aF-aS5FLX7QIiiPa@Mac.home>
 <DAY0AZXDTCD3.OAWZ91IQJT2Q@kernel.org>
 <aGKsHZ0saC-XkQlA@tardis-2.local>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGKsHZ0saC-XkQlA@tardis-2.local>

On Mon, Jun 30, 2025 at 08:24:13AM -0700, Boqun Feng wrote:
[...]
> 
> Make senses, so added:
> 
> --- a/rust/kernel/sync/atomic/generic.rs
> +++ b/rust/kernel/sync/atomic/generic.rs
> @@ -310,7 +310,7 @@ impl<T: AllowAtomic> Atomic<T>
>      /// assert_eq!(42, x.xchg(52, Acquire));
>      /// assert_eq!(52, x.load(Relaxed));
>      /// ```
> -    #[doc(alias("atomic_xchg", "atomic64_xchg"))]
> +    #[doc(alias("atomic_xchg", "atomic64_xchg", "swap"))]
>      #[inline(always)]
>      pub fn xchg<Ordering: Any>(&self, v: T, _: Ordering) -> T {
>          let v = T::into_repr(v);
> @@ -382,6 +382,7 @@ pub fn xchg<Ordering: Any>(&self, v: T, _: Ordering) -> T {
>          "atomic64_cmpxchg",
>          "atomic_try_cmpxchg",
>          "atomic64_try_cmpxchg"

Missing a comma here, fixed locally.

Regards,
Boqun

> +        "compare_exchange"
>      ))]
>      #[inline(always)]
>      pub fn cmpxchg<Ordering: Any>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
> 
> Seems good?
> 
> Regards,
> Boqun
