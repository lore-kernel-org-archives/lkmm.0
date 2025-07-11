Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA32EF670
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258933; cv=none; b=EdEAU12ICPN7YMIBfksRn6AUTWwJ8xMejyKAHifejUu6dIiQ/QWgoh415j9etUX/3JGjuZYbGozAWKD0JnwTn2TRoMLCNhxsnJHQxbgdR/9igu79qEY/nctI1O8l9UF3H8AQNe7/bTnTJlgdeTdreE0A7UP1BRIMog/npimAc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258933; c=relaxed/simple;
	bh=Nnk/XGwHPiUD0lDNan2tVFDypdXvt3FmNJtRHDYftis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjf5w56vsqw9wAm2rDmZLI4KSSb9X2aH8AleNvE3+GyWt8/9/TAdsrWQTCS6HrUavRJ3ucocggeamZ4VX0YdmaxtZoDQopbaS+8v8UyUnvTI4QB7VnUNyUtU79+7TouI5Zg3GgR7Yi/LlcnV+0EtGQot6RACfpxL0jMX2UfXeHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QscgDNrM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QscgDNrM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313067339e9so385611a91.2
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752258931; x=1752863731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnk/XGwHPiUD0lDNan2tVFDypdXvt3FmNJtRHDYftis=;
        b=QscgDNrMhU6oi3eY6hYEsFr5Lri5uQCXuLB037zuScT7AxciVT4/Nnd26KfmuoVrMs
         re90hMaf/c0VZ/4UP4Z5pMTZCKetQqd20uNm6ByyJ2JlZ8naYuCnLOGu4z6LEZga4RfK
         5hr0uzNTDUA3pE6WZ4fHfwOGg/oDYQbJA4pYz8rYZtO+VnqEAoiz0hMOUfe6rXRpim6J
         A1VmEns8eFmlZ1PYi8jHiVwFjWTG0BFX9GRY8dOtTAC4I//WUm5rsWyfMOizVGEw8EeK
         ik7YtU7fAD+N1oV+bu/I7SpDomdTd5/dTzRUXp9XpaXvO4JzRRwtLRTrdmccXPkzp2uB
         kkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258931; x=1752863731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnk/XGwHPiUD0lDNan2tVFDypdXvt3FmNJtRHDYftis=;
        b=dRfxbRt90nbz9T3u/wo8G5joFSC4L3DcAKhtU77n3njmY/nNOXhRDwaRBnJlBR3VbT
         neH/o6GDGbRWPha8Jnrd5+hEriUWTKmr315QqB7GoVviKZAAj6vW7D+rvFBfP/mVDp1b
         LzuYP38OB+IIZEZ4ezVTwCsAP531endN7iuvWnzfJf4YKQssXA/AAgAsGPiv1dX4gJ2N
         YdJ7jvsQnyUoAeRdSv/vwi5RNMuApGSmR5NdyceAgjEBYbanN0eHVWeqsJAnOwj9VMyI
         VRv+2OIs9d86amZDoIFPD6GBvYNVKCl7pmFINsDwWhA9UBEDThRB23AhGL7UG4jhuuxA
         Fm5w==
X-Forwarded-Encrypted: i=1; AJvYcCV1KbS8+MoQ7YmJxXReizwfdVpV3Rrrps1mo9lDmimoe4WUCfDVSBoMmtWPcksiAAUdnZCq@lists.linux.dev
X-Gm-Message-State: AOJu0YyTnueOuOALFl4Q6bzcddRUqP7ZPIYV0swqYpVxKrtuCAZq+jiT
	HK8KJRil+NWBMZ8DMPRNv0mzVmk1ZoKPw9/gNTWt6TjyMZ2zWa2sFUahTFBS3TqS4JKnh7qa5MS
	aDGPa+lWpOoV7aJvuHHTMoDnJZfiTDbIVrsDb
X-Gm-Gg: ASbGncuAgZLu7ND/+uo4izGixvJjc/G80rn0tp6d3IL376GFvHjaxodWZCqoYtLVdN9
	3+1CIwzv79F/3Fdr26U61I8WywvbVzupYrs4InlTjJOgITA5IL7gJPgszB4kbAqMd09ePMM3rwS
	rf1ia+gNr7aw2TNo7kk+OIEN7uER+p1CR/kQ5iqSWxaYvKwoggFcjbbpTniZdvAXfPLpNRVauEL
	UQg93/m
X-Google-Smtp-Source: AGHT+IFdu4P3gbr8jvRULTRTMc+I1fag/ZOAwbK9fM7UQH+JY9maBUmCSu1LiearbfL5q3wUS3fTxkawFpOTfX0eTVs=
X-Received: by 2002:a17:90b:2e8b:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c4f540066mr2104181a91.5.1752258931399; Fri, 11 Jul 2025
 11:35:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710060052.11955-1-boqun.feng@gmail.com> <20250710060052.11955-10-boqun.feng@gmail.com>
 <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org> <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>
 <aHEasoyGKJrjYFzw@Mac.home> <CANiq72kvZ7-fMoE9g7SBUrBZy4QMbSL1p8KgBqGhOkenrsr=3w@mail.gmail.com>
 <aHEx85VKv4F_9S61@Mac.home>
In-Reply-To: <aHEx85VKv4F_9S61@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 20:35:18 +0200
X-Gm-Features: Ac12FXzmhAWZAkjX5xQzsRISqFx9ayq4uB2VwF5ENzbOuWKuP9kZr-GbD5DMCb0
Message-ID: <CANiq72=ow6R72EaEC2Q4J7EfvfG1qMv-u5NdDV7YMMuLLmZiVA@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alan Stern <stern@rowland.harvard.edu>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 5:47=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Seems good?

Yeah, thanks!

I will send the other one about 128-bit independently.

Cheers,
Miguel
