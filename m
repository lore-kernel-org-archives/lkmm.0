Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1ED28C2CA
	for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752670648; cv=none; b=cYEeTIkgcNI0ABmu+dcYZZJoH/hk3RnHmAiDFbADx9YDZB2qmidy0qvBKgowEoZrhczqrAFLADrk6NKIk3WM45Yzn5QVqj0Dau82+SyUOS2SeHZaNv+Vrc+CMgq9+LyjKfDQ2aQkZvWMWRT458II8f8fbq2kgI41RHpGrBkrmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752670648; c=relaxed/simple;
	bh=m2LnwIGYhLWQq9/vNrmq/h8g1o9AkmJ0CbCqU4PYnxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/aJhiU699Hp+TLVlXIk0M+bwISEljgxPFqJ321SVEZMm2CKp+nlFTJcMpor4w3zHwfPV59g7gb+vdzlXf180vmpKiX6YFEYhnGFx2UVGI6G3BpEC+m01CoMMFGEgwp0qMXxvnDfkVLg6m5IRzJ6Zl6IwBQ411fQCRyKQt1EExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8eCs3fY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8eCs3fY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b7a3af9aso366052e87.2
        for <lkmm@lists.linux.dev>; Wed, 16 Jul 2025 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752670645; x=1753275445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnUmwmHd04RAbDihiDJsc+TMOL+rIoUaNraa5eqvF7w=;
        b=D8eCs3fY3p3MtOIoH6BOe/2kSWeH1fvyK6UvMtabCvlMl5OTseVmvwyKmX/o43xPfa
         V0PWjSIrpKYvS06eJC1yLEoWtoD7I6Co1znE6HI2p5AJ25C6/rBxZsDjBzh+8OzUxq9T
         nmW4jQrr6o9V0WKe4hmujal2wzxzR0W/YmLYpNLYA4dVjkPeqX7Zlg2WU3HpmbSR+4NX
         cwi007A2fMPrVZpYMkJ8ky4UpOVxq3rLa+qZkex87KRie8EpgPrxJ1yHjI2w2kyQrWk6
         aHFohQ+xzqzj+onjceUqa7yKvoLE+3HrqwToDRgFSdCJowqH6+jJsvv/luTURBev7ufF
         977Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752670645; x=1753275445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnUmwmHd04RAbDihiDJsc+TMOL+rIoUaNraa5eqvF7w=;
        b=dLCdiRCa9sR8z24lkruhWzc3JXWa0BwMPXw7GZiKzcdRy+swQwhKc19m6LwiiydftD
         q1nJ9EcS2ro9uURLtOvsD14q/Ay7fqjVIrVksGLfm3UCoX7Cy4WYyHBBajwmU9N9JaEU
         WNqoRCjQk1nS3F9LhwSHxRBsGQdDw5Y9PDqvcSqODfq6LLg6KefZebjL+yaDlYqQb7zq
         hEH8qQ5U/FflnfrIkT60l78GYYOjy2RlfHwRMN7OOGu8ijWFePGev6zuvSZg02B+Dn8p
         k/D3NtZmA4HnzwQ17nDFiu9vDQsNqmUEKkzW+V+jf9nBP8AfCMbQzfiUOzhjzCI3MUF2
         FxYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsc4QmIYW0EvusQzC47reMMjLiUwFMJqrTDnT6b/KKyWGluPfPnkihNFy2YLnyP1HKEwvH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywao4jDu+bZs+LM/wWeK0p4KMCPTnM8lv+M6rC71OGeUZnqPJAL
	qG1WWt5ro0mGEyd/B6UHyNh2IijkoLCJh/H6Iy42FHlHmyvqRFUum9SFwAyUC02pojk1iWsxFzF
	FK+HI5A6YCqmvOduzJwsVjVTMdSOaGCc=
X-Gm-Gg: ASbGncuQ2ZFbjdA+FCj0UtUwr9F8+XFTa6wK0v8+Okg9UENijXm96F42aQ6pWDEnHXv
	HdSOMkrzFYWW6ShGQpJ9GB4IESVaxeUwMTa7S+Dwqx/5rtZ8tAFl7FVjIqLHJsFhic+7z4NqdT9
	fi98Ojtmtkxt75B0y6Gw3rWAlXNt81WDfKiHI22I3YdTXDSYWGQDYBSgY5lcXLUmMvVey3i538y
	NQf9w==
X-Google-Smtp-Source: AGHT+IHg75d3gVVHrcM/53JCe0JWtEDOc+JkT8umOlD84lSgO0oBWv54W8RcNo6KapvHj4vSpgUVoGscVjFYDN0Vl4M=
X-Received: by 2002:a05:6512:1313:b0:554:f76a:bab8 with SMTP id
 2adb3069b0e04-55a233d6c0dmr354370e87.15.1752670644558; Wed, 16 Jul 2025
 05:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714053656.66712-1-boqun.feng@gmail.com> <20250714053656.66712-2-boqun.feng@gmail.com>
 <2025071611-factsheet-sitter-93b6@gregkh> <20250716124713.GW905792@noisy.programming.kicks-ass.net>
 <2025071651-daylong-brunette-ed9e@gregkh>
In-Reply-To: <2025071651-daylong-brunette-ed9e@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Jul 2025 14:57:09 +0200
X-Gm-Features: Ac12FXw_Z0jSZPqLajQHzSS9go_boufb3ia_2RqCm041xzqV0b0NUKvb3yFhI9g
Message-ID: <CANiq72kn1MQqY8MXaR9bnSYD=Wo7yC4Wxcq0p0Z4w2K=_dDpiw@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] rust: Introduce atomic API helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 2:54=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Ah, ok, that makes sense in a sad way.  As long as someone knows to
> regenerate these files when needed, hopefully when the C files change
> someone knows to update these rust ones...

IIUC, the line added in `scripts/atomic/gen-atomics.sh` will make sure
it happens at the same time, right?

Cheers,
Miguel
