Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84428DF2F
	for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297060; cv=none; b=iC0t84MCg/imTnwpVazBcp7oCf7yOnD2SRaid1hOsheKMbsnHeg7idlz0YEz0CSvQRO9Gn2j62JFLev5ixw6emjbdWHh3smK2FVvSSHaZj3TKqttTA35+H4tqdcVn0Zd7/M+7v9pRnXwSDZCtQMhxoGbDSuzI/m167BBjkQAta4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297060; c=relaxed/simple;
	bh=M23ynhZy19mK9w79Y3elPi3q6QxYIYCws5YjIiWHC3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPytqtTWxmflml3kALiiGUdRxCcE3CdOyx91Z1esPT6hYWtYRpBkH9u8TQpOuPyYpzyWyxiIsXg2DPEkfPGhs5Y3v+DY+ZJ+b02WOplRX6DSo0wxksV3HtPSztcPBgLSHMF8ItVvo89nRIMMcuFQvC5UoDAPgLpVDqakJ4CyfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OikawHga; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OikawHga"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso53183486d6.3
        for <lkmm@lists.linux.dev>; Mon, 30 Jun 2025 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751297056; x=1751901856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/nxHBC5mvm0Wpw5nwM4/4J66VrNlz0x27CbN6M/i28=;
        b=OikawHgaWkRDC0G1S56IGTQPwdJBhxLKZHY/tNtvQXhNKCI79ot/iYIgHyEkZQ5F9v
         EvZ5FJ+NPOUWP/BYqWBzAHQjOSimlXSVZUNI3tzdfWXwe71Dpr/E5M/S1m0o6FPbxxe4
         q6hUWYa5yroeyAoVzr38fOAnAgcy5lGMeJ9Q4+fpUf2q8ueaRx5uMHJIs2XWN20yH/xD
         f6IU3VL7J7IQRW0mF6i5fC23e4bcErf1sRHyMUDmnYFk5RkEK3YjWyhtbTaOmzD71+r5
         mC8SSNFiqIyiG3jUVkVZVqEXKbK1IB2MwPfHtxxRp75eOXMjyJQwGT23L1fpRwNeKyW+
         EYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297056; x=1751901856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/nxHBC5mvm0Wpw5nwM4/4J66VrNlz0x27CbN6M/i28=;
        b=RaD7+x7BXYOO3cVzCiXl+kTta3YILzHUny4S+znCHiYkRlt0A7sSsC5zxxV98Ylbrf
         NovgxldjUxiuGkjCgNFEsbHWPb2aXqxrr44xhPoQTUMHripSPqYjd1c6mzTIYJ0klasK
         NrLfNRwcj0DQWSUl5e0lMFFFtQXCcUIqU+Wn71cTnmIRTWreDsJrKGV788rDrsKuD6DA
         BuJtyKy0AEH/XQ4/n0XYq6zK5hxze+3DCCy8m0EqMScJf4JmQfLLOkWON9grXO7SkNju
         sCl7Yl0v7InKOF45PoOxMsDmAV2OdmNXJSUL8VvMd5dpFO4KtPnk20II+Oj514IK9Dpc
         C7cA==
X-Forwarded-Encrypted: i=1; AJvYcCVDP04JvnaHz08X0kMZGL6NOwVdxLigcU/y1av4oosQMAqtq50G0X50SkVBT9vGwJHwSNxW@lists.linux.dev
X-Gm-Message-State: AOJu0YyQDh64ZXaTtSgDOIsoGATlV7KuqhNK+T6U6fn3cajUnJmoiCiD
	kSU3nFiEm6GsmmvHVzJaZL38DQQoxHdGJncpvaFqv1XgvGVHUDCmeRXc
X-Gm-Gg: ASbGncuVzANLAnNAu52W0f9K4fThCMopHMTvxaqp7Ee3LN0t6SZgtPIKB3VMpHLUzsu
	EJagxmElnjAq/rm5dlJxzZjKJnQ9nX61hdJSSCR6TEDtX3BTNuBMnCx/bvsCcoYdmf6k9P5nK1+
	Jr7eYOFpuhafX0ZFWMxs8vROL9dcOJdKuzZ8FlWCAL4ST5ulFEljmGSUbXXgBOhsIeyFe3Y3J2f
	JXxmJcreoNRVcTgLdHsrSYA+zmYT4Xx0SgoGQmoWfHUIMCReSUTqmCVYerume1TJH3Zmi1YfPbn
	cHdOv1fQGMGmjF8WDPnVanGuZ/QGHphrNzgWFPXcT5qMvoPS3/OOS8VikuT5l/1UwU3yT+ErJvD
	PjikGiS8qsfyyHKuXpSnZVcPrSCh61BO6+7/34JxSPtP1jl61yMyC
X-Google-Smtp-Source: AGHT+IHeVtCqSb2QoBZg08Zk3znfKSyCstCwyV8afrVw1t77VkguPSWePpJRLCLvm2eidPpMSXHg0A==
X-Received: by 2002:ad4:4ee4:0:b0:6fa:c5f0:bf57 with SMTP id 6a1803df08f44-70013a6d2c8mr216477886d6.38.1751297055817;
        Mon, 30 Jun 2025 08:24:15 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771ce44dsm69020716d6.45.2025.06.30.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:24:15 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8FBE1F4006C;
	Mon, 30 Jun 2025 11:24:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 30 Jun 2025 11:24:14 -0400
X-ME-Sender: <xms:HqxiaPWR8_7oGwl0msOihUymSO5YfJmT-BxMLH0J2qLMfbeppjmMhA>
    <xme:HqxiaHlfqa5ZJzOLJfBhkP8XDOzrkbFkVxd8mF7Nsy_dRmWI9Nx4MidL6bMtMKpIa
    7rf0Fmg2j26_KBImw>
X-ME-Received: <xmr:HqxiaLa00HKs3FQ4W-ca9XM09NHzEEZC0_hkTeqa8MeGmvgmh60X3j5nJBaeGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddthecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:HqxiaKXh4xW3_q-Zpc092U7HFs4OwiMG9rkAnBaq3Ez2sGIuB0wv0g>
    <xmx:HqxiaJkVIWWowdKC8XQnS9paOBoEJXcjVcefKDjiNByyBLw9FeiExA>
    <xmx:HqxiaHdEcOBKyhXtz27EyE8eSiPTkutqq5BvM8ZmvPJhYaQXGrhtmw>
    <xmx:HqxiaDGioS-hJKWyDd83VEf5vUSUkf-CdVn8dy3UH1a08k07rj1Prg>
    <xmx:HqxiaLnhZovproP3xm3gBsKslxi-kjqeImWfkaVvT3JY7Oy-JBwYxIBO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 11:24:14 -0400 (EDT)
Date: Mon, 30 Jun 2025 08:24:13 -0700
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
Message-ID: <aGKsHZ0saC-XkQlA@tardis-2.local>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <20250618164934.19817-6-boqun.feng@gmail.com>
 <DAX6WZ87S99G.1CMIN6IQXJYPL@kernel.org>
 <aF6iXB6wiHcpAKIU@Mac.home>
 <DAXY0EJHHDWM.1KRSSJLOTCZ8F@kernel.org>
 <aF-aS5FLX7QIiiPa@Mac.home>
 <DAY0AZXDTCD3.OAWZ91IQJT2Q@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAY0AZXDTCD3.OAWZ91IQJT2Q@kernel.org>

On Sat, Jun 28, 2025 at 10:00:34AM +0200, Benno Lossin wrote:
> On Sat Jun 28, 2025 at 9:31 AM CEST, Boqun Feng wrote:
> > On Sat, Jun 28, 2025 at 08:12:42AM +0200, Benno Lossin wrote:
> >> On Fri Jun 27, 2025 at 3:53 PM CEST, Boqun Feng wrote:
> >> > As for naming, the reason I choose xchg() and cmpxchg() is because they
> >> > are the name LKMM uses for a long time, to use another name, we have to
> >> > have a very good reason to do so and I don't see a good reason
> >> > that the other names are better, especially, in our memory model, we use
> >> > xchg() and cmpxchg() a lot, and they are different than Rust version
> >> > where you can specify orderings separately. Naming LKMM xchg()/cmpxchg()
> >> > would cause more confusion I believe.
> >> 
> >> I'm just not used to the name shortening from the kernel... I think it's
> >
> > I guess it's a bit curse of knowledge from my side...
> >
> >> fine to use them especially since the ordering parameters differ from
> >> std's atomics.
> >> 
> >> Can you add aliases for the Rust names?
> >> 
> >
> > I can, but I also want to see a real user request ;-) As a bi-model user
> > myself, I generally don't mind the name, as you can see C++ and Rust use
> > different names as well, what I usually do is just "tell me what's the
> > name of the function if I need to do this" ;-)
> 
> I think learning Rust in the kernel is different from learning a new
> language. Yes you're learning a specific dialect of Rust, but that's
> what every project does.
> 
> You also added aliases for the C versions, so let's also add the Rust
> ones :)
> 

Make senses, so added:

--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -310,7 +310,7 @@ impl<T: AllowAtomic> Atomic<T>
     /// assert_eq!(42, x.xchg(52, Acquire));
     /// assert_eq!(52, x.load(Relaxed));
     /// ```
-    #[doc(alias("atomic_xchg", "atomic64_xchg"))]
+    #[doc(alias("atomic_xchg", "atomic64_xchg", "swap"))]
     #[inline(always)]
     pub fn xchg<Ordering: Any>(&self, v: T, _: Ordering) -> T {
         let v = T::into_repr(v);
@@ -382,6 +382,7 @@ pub fn xchg<Ordering: Any>(&self, v: T, _: Ordering) -> T {
         "atomic64_cmpxchg",
         "atomic_try_cmpxchg",
         "atomic64_try_cmpxchg"
+        "compare_exchange"
     ))]
     #[inline(always)]
     pub fn cmpxchg<Ordering: Any>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {

Seems good?

Regards,
Boqun
