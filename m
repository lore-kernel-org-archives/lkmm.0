Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1D2ED149
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248826; cv=none; b=j3IuDznSdsL5MhHHJgOhWgN+eRueSz3+ZzMo1Zw7Y3O2n/3cI7rcle+n7FKgEeBahmAZA1Y5iVrQY1Ap0UvWAEO8+lhqf7hnSJfVJgV8giosMzR1+Ol1qgxnjL5HBjqetSiwEm47c+3pBWK0vX3j4Bt1BNnXdb04vh431sSb4g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248826; c=relaxed/simple;
	bh=2Nh8QxkXw0V2Fc735JNOnhnIyUYWwQyxa7yIKpxASWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fa2jCOgYtRii5UaQ7eVe3icWmaw8pnbcJsES5Zx6p5coXN3CbXAH6TzUVWQLjSRQmDbm+vJuICgBy7MA2ASPgOPysMnGfPAMqquIeQqS2jFlFhXxI1zY9iTz5syL9R+kVPhWrYel24dNQzavNhgtUWY+YgCfPVvGlPkLWF0hfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIyK9JGR; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIyK9JGR"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so19050096d6.0
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752248823; x=1752853623; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VLMgwaCu/YbQoZ28wKXJbxPWWcQ4iAAOMGkARakw1GA=;
        b=DIyK9JGRaHie1tNOhxBs6s+9wkPjtLspVxc2R2pSdWIJN2Lvh09edzBzwxFFqWrEHO
         lIRN4d3LaK+DDOFYn/xAUbE5JsCzwCOKyN0mmilEy3GAQRsvxLTqiQSsnP7dyL5aqoyn
         Q+bcqt24FO5JDa/Z63Bas+PHrvADi6veJnh+WtvojB6ylI8hBlpRDc7+C7J++B61yF6b
         OeH+CSUBILT+U9gtEwDYvPEb4yv57rgg57QsfS+mlZjuhp/5GyHy2DBC+ZheZskirbb/
         dNVzewpDAhz9FVeu9GtOFhve9i9vWdO+YttvAFBzqsC4obM/434EhsKWFXWv6RryjR1U
         l2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248823; x=1752853623;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLMgwaCu/YbQoZ28wKXJbxPWWcQ4iAAOMGkARakw1GA=;
        b=LJ6RKuCB2wSOCwjJwnQmrC1/rnf5OU/WJV03dCQdpd6X89no0w4/AggS1KSEkHUZ7U
         ucdW55zK4efnwkvkbu1Hw11Naecdn+JwndEIG1S3VJmvMeUMWpSUvOGZmA+es6WlzHa/
         YjUyenltICjT3hUSmdMulPQlJZSYukrMBmWlP9doqtkhG3Z2H6KUe921mB0B5JGpuGlj
         fgu5lfDdYm4dnl6U2DABW00DLYmLdeoKIPIhDNT7hLwXncWlzgKCG75cjZoP/37khIlW
         IdujKWU0OWYbshbWey7CriwI15LAcSFXL+kFI34+mif8Ff6oGJP/wwzMg72dSj7gzniX
         4iNg==
X-Forwarded-Encrypted: i=1; AJvYcCW8xR9k/lNvqmNfQiqRBXp6rt7F921XIpsCzn/OIrf2QbptifEXmWno67NsyUjB8Naxcgcc@lists.linux.dev
X-Gm-Message-State: AOJu0YzaVLClLiWLEVktr+lGQt7QLNpZBPnWCyq1jGyDe51i4sES6YpT
	Rt5fqV4BI94+bybUAoDbcrQtNs4pT3ZMct7Nh9cXu4ah/MSDilmurWDv
X-Gm-Gg: ASbGncsJGpBB789+RrSi+VSelFHcvE7q/6mtomwyZDoqUU7Ecn6MfRZqiHthYvZdrrW
	Czspp+cXwKnRhlXrMLvkvFAUPtI6N0Z7s/wjdYHfhuzcgIwaL3eUV5u9W8/SxtqLOtmJbti+haq
	8y0MNfEAAYEJ0hkiCzEdnacGDe32wXWqrxJcWx3uCdOtvqkEd2UfGDo7lbsLDdXxU9XVdrKKTyS
	txBKv22RetBoaIeKy3ZhimWBlLN3VSIf/zK975SWPDI7SZk37CRP8KbjJ8iqU0BcEDVgc5Pvtph
	n1INliGK7ek8eXA2SxX+wwW1SoE1wigv94gDozid1S44DOqXlnxPvN+/Y8e4YzY1rpfZw+KyfAA
	n5z/DlRCtp9wz/snFQiqy1lOQeS9KPbbz2urTacWCtF2Uc6o/Mxrx/HdIXTm6OKs57Q4PIhcQEr
	WO3U9czEgj3lydQUKKVneoHJQ=
X-Google-Smtp-Source: AGHT+IGD27pr09cflx9frzlgFAEaJ4AeFDZGrtrkynny/esKSQ0wpel1jyRetyn3dDVhnw+i2wYpQQ==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-704a702e122mr56408506d6.31.1752248823001;
        Fri, 11 Jul 2025 08:47:03 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3d3b0sm20963706d6.80.2025.07.11.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:47:02 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id C75A2F4006A;
	Fri, 11 Jul 2025 11:47:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 11 Jul 2025 11:47:01 -0400
X-ME-Sender: <xms:9TFxaLfoAuUzSgkJdsc_R_Q37-SP3uv9Kwku44mVQJ3GZLdXkpUOzg>
    <xme:9TFxaD2_-u3Ar8XALMADKUune2_1vpn-MzPQOune0kf2OWcxXJ4xy75cZjID6RGew
    ZyzAgAWtZjXl0LgTw>
X-ME-Received: <xmr:9TFxaEDp6SeAaYOlRppcEgQpO34hHcBeZ4M09naATqb1XO9R2vVdsoOwxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeekhedtgfejteetueelveduhfehffevteeitefhleetteetfeejleejfefgudel
    ueenucffohhmrghinhepfhhfihdrrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrg
    hnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrd
    guvghvpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgr
    rhihghhuohdrnhgvth
X-ME-Proxy: <xmx:9TFxaOTDrVx2RvfOXizuR7D4-A2mjWI5QXuLzjPPv0kLentSBirg9g>
    <xmx:9TFxaGJmncVZFV-1QKB_Nb0K9S8jOxb8MgO8oaKdnLQNkhwkzmV1VQ>
    <xmx:9TFxaFGl6-Vbgrec-C2j0Vt0fjwxrXiL99rnXZlYsm_Dv9ZWSQwUag>
    <xmx:9TFxaNLUSMzLAe60re4pibZTX_gx_PClVURYLpeHJYljl8Qt_92v-A>
    <xmx:9TFxaJ5SQvmd-G7SG5iqcO4NXyJoSb-R3vnngkJ4Ouy0qmv_dxeM5C8D>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jul 2025 11:47:01 -0400 (EDT)
Date: Fri, 11 Jul 2025 08:46:59 -0700
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
	Alan Stern <stern@rowland.harvard.edu>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
Message-ID: <aHEx85VKv4F_9S61@Mac.home>
References: <20250710060052.11955-1-boqun.feng@gmail.com>
 <20250710060052.11955-10-boqun.feng@gmail.com>
 <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org>
 <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>
 <aHEasoyGKJrjYFzw@Mac.home>
 <CANiq72kvZ7-fMoE9g7SBUrBZy4QMbSL1p8KgBqGhOkenrsr=3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kvZ7-fMoE9g7SBUrBZy4QMbSL1p8KgBqGhOkenrsr=3w@mail.gmail.com>

On Fri, Jul 11, 2025 at 04:40:15PM +0200, Miguel Ojeda wrote:
> On Fri, Jul 11, 2025 at 4:07 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Thanks Miguel.
> >
> > Maybe we can do even better: having a type alias mapping to the exact
> > i{32,64,128} based on kernel configs? Like
> >
> > (in kernel/lib.rs or ffi.rs)
> >
> > // Want to buy a better name ;-)
> > #[cfg(CONFIG_128BIT)]
> > type isize_mapping = i128;
> > #[cfg(CONFIG_64BIT)]
> > type isize_mapping = i64;
> > #[cfg(not(any(CONFIG_128BIT, CONFIG_64BIT)))]
> > type isize_mapping = i32;
> >
> > similar for usize.
> >
> > Thoughts?
> 
> Yeah, I wondered about that too, but I don't know how common it will
> be (so you may want to keep it local anyway), and I wasn't sure what

Sounds good, I will put it locally.

> to call it either, because e.g. something like `isize_mapping` sounds
> like we are talking about `c_long`.
> 
> What we want is a Rust fixed-width integer of the same size of `isize`
> -- so I think you should try to pick a word that evokes a bit that
> part. Something like `fixed_isize` or words like `underlying` or
> `repr` perhaps?
> 

I end up calling it `isize_atomic_repr`, and create the diff as below:

------------>8
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 7ff87b2b49d6..bb0d3d49e3f7 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -53,14 +53,21 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
     }
 }

+#[allow(non_camel_case_types)]
+#[cfg(not(CONFIG_64BIT))]
+type isize_atomic_repr = i32;
+#[allow(non_camel_case_types)]
+#[cfg(CONFIG_64BIT)]
+type isize_atomic_repr = i64;
+
+crate::static_assert!(core::mem::size_of::<isize>() == core::mem::size_of::<isize_atomic_repr>());
+crate::static_assert!(core::mem::align_of::<isize>() == core::mem::align_of::<isize_atomic_repr>());
+
 // SAFETY: For 32bit kernel, `isize` has the same size and alignment with `i32` and is round-trip
 // transmutable to it, for 64bit kernel `isize` has the same size and alignment with `i64` and is
 // round-trip transmutable to it.
 unsafe impl generic::AllowAtomic for isize {
-    #[cfg(not(CONFIG_64BIT))]
-    type Repr = i32;
-    #[cfg(CONFIG_64BIT)]
-    type Repr = i64;
+    type Repr = isize_atomic_repr;
 }

 // SAFETY: `isize` is always sound to transmute back from `i32` or `i64` when their sizes are the


Seems good?

Regards,
Boqun

> Cheers,
> Miguel
