Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717D19047A
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504787; cv=none; b=rxjlR8CeygDpuA50FN4OqqWHDljpCuZsS6tFUq9vkjlvjknemrIRr2hwvy3C+w4rQuw8IEdXsQA/HDI1mYn1b/6aRMO/vJaDts7uAKMwgOvAPSnxbiWgfB5/KHGf5tGGIsoRYFOrGG2+JSBl0rR19+bP9jxalxGelUrXUbGQ7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504787; c=relaxed/simple;
	bh=Xi87K1n3E3/9eEQwywuM1RQ8TuihTQgkIKzC4BoyTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jB128lIaz6HVjsXizx9mv3hZIoOfks3j2yhLBUjg9a/jxnbBgoXhPMxK9mAum2S4GPqIvvvKGuBb9CaemC5050PbLqremBVP78BaEeyzOAh8OW/ZqnNmvf4uSjoAf6inTwExrYqsnbIctk1DVY7Xg9NkUBhuuBOKajAnHxM7kG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcR0IDl2; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcR0IDl2"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e182e4171bso169572085a.3
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752504785; x=1753109585; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6qnE2JyrBpFNh6aD4UkpO19Juwdqz7o/U9HH2b1z+dI=;
        b=XcR0IDl2cY6XdlldkZaKSzRaDivK5bPXIWuMjdFSxf9NXYwTteYH8OB54THHgkWOWG
         i4I5H4uyRDcFXPlSgvgaJ/oY1tzHeLPOFdED3cOjtCGF2KqNFWV2QAPtf+HZQ1Ba88LV
         Bmwlh+js6W3JE0HF/wPzm8zZMRFGb6oD++mjXQEXZJEASIXER+wFB4r/qgvMsUVDjdI7
         2+7S5mc1vwfTdNlTEri32VsA2WB9myhBv9QdQVP5oAh8pR8a82x72xO7B56LRWcR4mnl
         JIslKtOwc2oHO+F5MErV8OQH/zPX7Q97epmxWMtBzSColBvy0cmQ7AtAWnb51LalkTCj
         qKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504785; x=1753109585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qnE2JyrBpFNh6aD4UkpO19Juwdqz7o/U9HH2b1z+dI=;
        b=XE53owuyZLly9EXuJfoUJpXynBq9P06/ZAD85GBDxYFqP5uRkRP9V54V0TopgCSkr6
         x553zxzU5hxZl/CgVY7Oj36//DwpmY5OHVmE2YtKf4JY1BpJ1f5NnqWTVOiNMiE1vQA+
         s95cw6zXsDNGp6ZLDTuAZxXDgz5xtr5uQMGSNHcZ2A4LEAK6yA2SyJgD+2H17/rz/8OP
         nHOBFmzOY8lbIkAd/kguyOOT+Hq8VhURNB9pn0T/kkCexy5CjH6sscaaiaa0SNAjHbp6
         1TDJ//Pm5VeKWIC8kF1W5XgUviRuVG7jV5aJDilPvWXDvzK2dLm499T3A7X89nTtRRfv
         X97g==
X-Forwarded-Encrypted: i=1; AJvYcCVDh6IjslXRtOthn0qULG8CZxFgRI67qXX23MeS2lTw7PDj4ZUzd2rlQoOsSjt53DU0Md/O@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0t46U/ESjTT+dG3234/RLhvEnMfS9Gm+uFL7MfvF7dThfHbg0
	WcAYykQr9jB9RNaRq4eDvXDxa0+I9R+qV+XaKEqIiOZ6l31x7g4rUCymZXFObw==
X-Gm-Gg: ASbGncsWH3XZJMHgsuhJlM9SewrZ5H2Id+XmJpDSM8tK7HIlopLzzjvkgVepjjQ9e2v
	Mj8s0ie4MZBuVtTlTUwUP+DbcPedV/sRKjgM7TDXMa79MuRicnGYHtA1+u7O+2FvD8DvS06UZWE
	O4D5Ns13jH5gshddGVCF6BIw9Q2WVgg5DoT/p5E0azvt1cAQJMwvr5/ggNpUlGFf5lol6YUa8is
	/7CfQ4HKS1/Jl+8Aa1NHKsyi8Kxfgyqw3gkgGvBmeq1fdDuiuSGsmJ+76HZ4bb04bw5quLzemkd
	erRs6AjDl3WVtOWOpQ9VnA+85RlYixyRyXpdrHHs0XcdERgv8txgK0wMDWiCNzgZWS8O4/oE4lT
	ostKR0MZoEDRugt/IYkKdGThbBMqCmOvNMOD0vdUMd0+OoYsAu5NZpD/PexH2wVlk+ISmdJB9zq
	44rVvsD0c7bdiK
X-Google-Smtp-Source: AGHT+IGypP/MybZIZ90NbN1IElm2htDIEQjwnBX1LF2MTvz7nWTRAhC3SjCrLmKlr166NWslnLCaUA==
X-Received: by 2002:a05:620a:40cc:b0:7e2:3a27:a117 with SMTP id af79cd13be357-7e23a27a4d6mr866347785a.55.1752504784611;
        Mon, 14 Jul 2025 07:53:04 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e332a794c3sm41568185a.10.2025.07.14.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:53:04 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6B252F40066;
	Mon, 14 Jul 2025 10:53:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 14 Jul 2025 10:53:03 -0400
X-ME-Sender: <xms:zxl1aOuAotqCyuRmLoGEdbhMkdl8aLt6jHiBOrbXuFpeznCkxfR3rQ>
    <xme:zxl1aEvnVbdWlAjpjOdQlaV6MyHbzHmaErNVa4l_BMs8ymIgojh_YwJHw3yRmKRpF
    KNA90czcWDs346V5Q>
X-ME-Received: <xmr:zxl1aCowqL3TpmwqvoZqBx-iY4ltN_LVzHO_jw8FI0tDTtNtqlZYywfZyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtieevkeejffffueehleethedtjeduieekgffhveeugeejjeeihfekvdegvdev
    gfenucffohhmrghinhepsggvlhhofidrshgrfhgvthihnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopedvkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojh
    gvuggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhi
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhig
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrd
    hlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehg
    rghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:zxl1aAMoVZOSJsH5MKPLSnVoiQEIatbmb3aNLMoNXig-JJnkiPkD7w>
    <xmx:zxl1aAk_RDbPnpZE-0AIOWtxvASesWcpQeOIbI372bBB4Ac6g2BzsA>
    <xmx:zxl1aKtUYoJlOcATb67oqfITdqaNY7l_BMcW6KPaNXq4Ha5fYafZ5w>
    <xmx:zxl1aPmOm6FYkArE_XREcCUknIo2lB7rB9STHOBwqK7FdzIt4A25Lw>
    <xmx:zxl1aDn0EUhwvjQ906NDPDBfpr3v4TCYHigKgfSyBfkuHRWbFbcGxNhM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 10:53:02 -0400 (EDT)
Date: Mon, 14 Jul 2025 07:53:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,	Lyude Paul <lyude@redhat.com>,
 Ingo Molnar <mingo@kernel.org>,	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHUZzdbUSkN_4v2G@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>
 <aHUSgXW9A6LzjBIS@Mac.home>
 <CANiq72mFa0bM_DZV2tHViU0SKqNG_tX6AxBWz4AQ=2UmBrt=nQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mFa0bM_DZV2tHViU0SKqNG_tX6AxBWz4AQ=2UmBrt=nQ@mail.gmail.com>

On Mon, Jul 14, 2025 at 04:34:39PM +0200, Miguel Ojeda wrote:
> On Mon, Jul 14, 2025 at 4:22 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Hmm.. why? This is the further information about what the above
> > "Examples" section just mentioned?
> 
> I think Benno may be trying to point out is may be confusing what
> "this" may be referring to, i.e. is it referring to something concrete
> about the example, or about `from_ptr` as a whole / in all cases?
> 

Ok, how about I do this:

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 26d9ff3f7c35..e40010394536 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -135,6 +135,9 @@ pub const fn new(v: T) -> Self {

     /// Creates a reference to an atomic `T` from a pointer of `T`.
     ///
+    /// This usually is used when when communicating with C side or manipulating a C struct, see
+    /// examples below.
+    ///
     /// # Safety
     ///
     /// - `ptr` is aligned to `align_of::<T>()`.
@@ -185,9 +188,6 @@ pub const fn new(v: T) -> Self {
     /// // no data race.
     /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
     /// ```
-    ///
-    /// However, this should be only used when communicating with C side or manipulating a C
-    /// struct.
     pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
     where
         T: Sync,

?

Regards,
Boqun

> Cheers,
> Miguel
