Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E62F5081
	for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752669403; cv=none; b=eQLtjg4jCjf/6hKsfgWMR3eR0XjJuH1DP2hFVMH6I1Nnuv+/DAiYdUVB5ULZ/WMiCmt7Vn+qsA5axg6GAX00DJQ4skRTDLjKe7va1Hly1hgOOdQWgj3EIZayzznBvelNiieTEOix+xbMgaXGeUX9gtZFdh3ml8PQZ35+Uoelt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752669403; c=relaxed/simple;
	bh=wzq636UmBmkRt5jx0MGIBDFLizgfD0NqkzU8lhycQFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuCZ7j/RbD25hbPTN38GC8eLR84y4e7L77duvKZPGNBki8htWC9M7s0ojcXcCu4BtSQ/cYjSfJHd+4y4+uRznKx4MiYaFQPLEEF4TF8/G0jspudJKO12eYDHHmRc7rc0pB3xYPS8wSQTRGhBr0zBSR2uA+PNGOuQi4tmuRdjjKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/F9jgC7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/F9jgC7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312efc384fcso1041994a91.3
        for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752669401; x=1753274201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbtdeD8Wnwaq/vjh/JXA9wDabfJkPgVSH5AlF8yNHxE=;
        b=j/F9jgC74A6nClYShMfVG4LG6p7ONQ0GBz9d+yBHKV6yRG7SuVUWAS9BC/HzO/4FNl
         MpD0S1NPBXWgsZdDxqJYalEIBychS+FcVsQifkrUr1WL1XsKRRJx16YXi2Pa23hpYiUd
         TpU2K6eW0nF0Xlfoga2N3QpMBfbdS2b645r5GA4dkebj6OtDiYrlNWNPKOiQa/Vuc5db
         h6sZt2H7sj+g3GEbd9g7iqUddtJrilvpjdL1Y9U26rQ7P+kN0HTcLiNCpGC7lJshGiMY
         GEB7TbrVYL4Wo3+mi4GnbZ0z/gfjMJO4Fcp84QqELdgA2XTfe82HhFQse6hYKmAlPzcF
         /GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752669401; x=1753274201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbtdeD8Wnwaq/vjh/JXA9wDabfJkPgVSH5AlF8yNHxE=;
        b=MxOSYHxmTuosZZjeaD2z7VLdaWpvt9UagMyYcTos9hh5luDvfvX813y270ENK6TpBs
         gATG4tbAubHuttkncg0dFN+N/r+BCZaXR51OD011vdA70Oag2QUProJW7QUv5xUK7sZN
         6DwfuYvAHkFA6NvMTMR+4uM9Jx4ijMtqxn9P1khIXR5ny6vLX7MJdMa9jNH/VBVmZPm8
         9tGBuc/Jk57u7BMKs7ITeLflEtbBTZuhnButIduw5JE96JSZ/pMc/UlY8q9DX4gPXOjj
         2YqdTt/zCVpfavlW2G1esYeYuCIbg7gZF5pHB72k+19ZdIfUKmX2NZrEVzIIrvxca8vM
         aJxg==
X-Forwarded-Encrypted: i=1; AJvYcCUzGv7CF+flOCv4Vh2jkouv+PwaUHA0x/Uljngn52x8Lo3ypzNnaiwMPWaUA1ZtH3WQpuCs@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu2o3LX7zu7H2+1COSnht6rFWR6OXH5zWzy63oI2Ldqjgf/wXT
	ZDI32idx4JXS7mZDJchOoTXos9uflbLWbiYmozLz8YPyNPLnccOkyFuSdWax8nLCXYsv1mRtpnX
	rZjAqDV1uKfOXGlk8zhQZSMv17cL9KHQ=
X-Gm-Gg: ASbGncvsLWoSrXVRbBCCAKAtHfcXtMv8VIPOTSnwzjg/agEiiSMkAIXzjKNZKBBNAco
	/7r+i58obFHGxTzVATI277xXfgKWfI/ixr97Q7/mvEhAc26DBl5iUeQ37G6be4YV1+pbZUp8EwC
	MeIHnbsZI1pAvTxCh9oztlXCayxeMPJfUw3i6cTBO3wBgAKGTI/OW4flGCeC8CQ4WhkG4QJnEjU
	cEXsQ==
X-Google-Smtp-Source: AGHT+IH1AfpX3+Ds/zOoz9tipktkM9wtu5kQ1XtmEodOHlUJdQwaip1Keu+KmvTAMMyBv0JDYAk8CTYSo9R9mjAWmxY=
X-Received: by 2002:a17:90b:2d4c:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31c9e760e02mr1521980a91.3.1752669400814; Wed, 16 Jul 2025
 05:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714053656.66712-1-boqun.feng@gmail.com> <20250714053656.66712-2-boqun.feng@gmail.com>
 <2025071611-factsheet-sitter-93b6@gregkh>
In-Reply-To: <2025071611-factsheet-sitter-93b6@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Jul 2025 14:36:27 +0200
X-Gm-Features: Ac12FXxU7t4f3TmDU6568W4lxU0yBWR1CBpL3V_9M0bVOSQeTwuke3j6Ee5kfVQ
Message-ID: <CANiq72nCm1-xELn=Z1x1LidKHtjhMtz4FNnakunQ9BqzcS89ew@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] rust: Introduce atomic API helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lyude Paul <lyude@redhat.com>, 
	Ingo Molnar <mingo@kernel.org>, Mitchell Levy <levymitchell0@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> As this is auto-generated, how do we know when to auto-generate it
> again?  What files does it depend on?  And why can't we just
> auto-generate it at build time instead of having a static file in the
> tree that no one knows when to regenerate it?  :)

If Boqun confirms that there is no reason not to do that, then I can
take a look at that.

Cheers,
Miguel
