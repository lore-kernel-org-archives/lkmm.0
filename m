Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF91F259CAF
	for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080648; cv=none; b=llz86ewTGfsfZseFuGuM46BLuz0XLqJJHmGqaogxxU1JnEMr7Yq8awRwBNw7UFk/NkVvP9zMofHwJqHViurQpRs87tZkuDMnH9Ux7Aik1ebuGshNGU47xWjbfhlZqsfmXo70ma/hiiCp1JvROgjPJWGspRs4lOplSgQiQHBdjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080648; c=relaxed/simple;
	bh=wETgaVi/4Srcrvn11NsykVRNrUKwSV1mN9QfsLJ8b7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMkiMQsbjH+rqz9csN/gkwZAHSevxlf8W2UEsFi/IMAG6mSp4WkKqjWVz8KTQtIGTwpMmloeBdfnCLpyAMIWQ6AKrUEkA4Qqp00+MCm3ypDxWtTLB6iwL9ATygYf5YoE+FvfXtGWQGOkwXSwYaFiXqrke46cSCdQ+iSoTtqWW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPbhr5LV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPbhr5LV"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so1303740a12.0
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 09:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766080645; x=1766685445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAT4NIB50wSSQJ2eRS7sx9I/iK0vGJNZ4n3UlMbS9UY=;
        b=RPbhr5LVKJwZP8AHxDy6jcfG9IJUid4iyRoEbtcpQQ+GBXTgoZWfvRAjgrnRBdTALd
         bsLujr50y4FdovlGp1Hr+4Pclppc4JbVgbjRWX/I2VWT/vyFtoSXfFRI+LRyaykSX8Lh
         MIpNWYIW2heFKy/YHhGT3PPz0C5oPBt81miWtOUY2q5/ZdchIb/OWLfTLex6gOjc8iMp
         7RTuJCMnqGu+fai+NNfXlFUlN+/UZT2Q4DuI+1TBQQdm5a+NnxQRpZYSxa62SmXFnq1c
         yX8Svy5Skxt3kyLDK8OytebMFelAE9FM/EJdhToztkO/G05X8iOn3+h25kA1d6y4mmLU
         9t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080645; x=1766685445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAT4NIB50wSSQJ2eRS7sx9I/iK0vGJNZ4n3UlMbS9UY=;
        b=BBb9QFKmfHfElERendZmHe+bFduv/9MDcPr2JCCcAuFzp+qt/mxm8ooRWhdWa86GVK
         9nZ38afDp+k0gAGQ0a4njCO2kMYG/ts+ru+eSnSVMcc41LtjEYdJKBvhr3Mfi8lyS2Ze
         bvWbLVkKkSFMWFWSLLrpnDOisHA4eMKxYeJ4uCZzB2WP5P7wTQ0x1QH3k0KNWS70GpO8
         1uCnFnEGw5vW7rePOrvB20xt9BXy7GXVZCTg+FVb3dXKjXsXyNOfhtIqkQVmW6h5ObkE
         CVSy11jefSE2j8Jkf0aeABpTSpuGTg1Ks0DP5cmOJ8RLZtTW3OavLJCELHFJI3COO+6G
         I7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUIhslPpMANZwWpV7YzkdgSxXQKhDMSv9OQEFgfSVP/PI9fiLwUEDdzRt8NK7rAzAXCStit@lists.linux.dev
X-Gm-Message-State: AOJu0YzFKwGW5/tpoLv9XGPWe0F1D2z55NPriwMbfIEFivhWj0c4MwhH
	/cl5zdA4nAzy4nkRDYQlX4c6eC7nscG6GoLVCTVRQZT36Al0I8CyHF4UNrhVwA==
X-Gm-Gg: AY/fxX4ahPCTplIkGHpPvwJNOBfNJ5dYdED6bD77yu86zGajy1aNvWWs0VVw5lwqm8I
	AMRhUQcrn+dn/j0Oxqwe9cMERDAXwIRCSznhkbcF3unz6TBoeZcJoXuiVJkuAdEft8tR5ZUD3bR
	0QB0iADgf/zhX/h5Zlv0MM4lbxg7EdvYgoHOkggJg+PXABnZNHf9A92RoIohmIi2/sgPn5aMTMi
	2fWXgsM+fBUiD88m1POwpssQ0oq8t0M0FiihsnSjMn2/lQuApk8fCIXJ5n8nO2rrJeLoK+CujaV
	w39JAvQV5gtYruZsyTVDQSVcD9w5nYx8ZQ8i/fWzzVyc11x4Kj8x0Zu5g6vgJvGWn8haj7BuGQr
	lK1QQFGvqdFULZg74a6nt9T7FDczOXrGgqr/na5bqiYrgiuVV25tpjAXk5ZXL3UK6so7u+HYSwE
	gIV3MxhU2Xyhaq9WPWCAjnZ0Gh0ThX09XystCO+OrYewvdte0GdiR0
X-Google-Smtp-Source: AGHT+IEX3LAgYnT5Lo93smJLzWDPMc1uQ4Aj1gMjYO0ty7+7jdOdeZ5GXQKimSTh9jzRGuiit8vdow==
X-Received: by 2002:a05:600d:1b:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-47a8fa81e14mr202186375e9.0.1766073295465;
        Thu, 18 Dec 2025 07:54:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm48092275e9.14.2025.12.18.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:54:55 -0800 (PST)
Date: Thu, 18 Dec 2025 15:54:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes
 <joel@joelfernandes.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, John Stultz
 <jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil
 Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik
 <mjguzik@gmail.com>, Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, Gary Guo
 <gary@garyguo.net>, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
Message-ID: <20251218155452.6ae47481@pumpkin>
In-Reply-To: <cb55e583-395f-4b83-925f-c341c95903c1@efficios.com>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
	<20251218014531.3793471-2-mathieu.desnoyers@efficios.com>
	<20251218090313.33923750@pumpkin>
	<cb55e583-395f-4b83-925f-c341c95903c1@efficios.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 08:51:02 -0500
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> On 2025-12-18 04:03, David Laight wrote:
> [...]
> >> + *
> >> + * The compiler barrier() is ineffective at fixing this issue. It does
> >> + * not prevent the compiler CSE from losing the address dependency:
> >> + *
> >> + * int fct_2_volatile_barriers(void)
> >> + * {
> >> + *     int *a, *b;
> >> + *
> >> + *     do {
> >> + *         a = READ_ONCE(p);
> >> + *         asm volatile ("" : : : "memory");
> >> + *         b = READ_ONCE(p);
> >> + *     } while (a != b);
> >> + *     asm volatile ("" : : : "memory");  <-- barrier()
> >> + *     return *b;
> >> + * }
> >> + *
> >> + * With gcc 14.2 (arm64):
> >> + *
> >> + * fct_2_volatile_barriers:
> >> + *         adrp    x0, .LANCHOR0
> >> + *         add     x0, x0, :lo12:.LANCHOR0
> >> + * .L2:
> >> + *         ldr     x1, [x0]  <-- x1 populated by first load.
> >> + *         ldr     x2, [x0]
> >> + *         cmp     x1, x2
> >> + *         bne     .L2
> >> + *         ldr     w0, [x1]  <-- x1 is used for access which should depend on b.
> >> + *         ret
> >> + *
> >> + * On weakly-ordered architectures, this lets CPU speculation use the
> >> + * result from the first load to speculate "ldr w0, [x1]" before
> >> + * "ldr x2, [x0]".
> >> + * Based on the RCU documentation, the control dependency does not
> >> + * prevent the CPU from speculating loads.  
> > 
> > I'm not sure that example (of something that doesn't work) is really necessary.
> > The simple example of, given:
> > 	return a == b ? *a : 0;
> > the generated code might speculatively dereference 'b' (not a) before returning
> > zero when the pointers are different.  
> 
> In the past discussion that led to this new API, AFAIU, Linus made it
> clear that this counter example needs to be in a comment:

I might remember that...

But if you read the proposed comment it starts looking like an example.
It is also very long for the file it is in - even if clearly marked as why
the same effect can't be achieved with barrier().
Maybe the long gory comment belongs in the rst file?

I do wonder if some places need this:
#define OPTIMISER_HIDE_VAL(x) ({ auto _x = x; OPTIMISER_HIDE_VAR(_x); _x; })

Then you could do:
#define ptr_eq(x, y) (OPTIMISER_HIDE_VAL(x) == OPTIMISER_HIDE_VAL(y))
which includes the check that the pointers are the same type.

But it would be more generally useful for hiding constants from the optimiser.

	David

> 
> https://lore.kernel.org/lkml/CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com/
> 
> This counter-example is what convinced him that this addresses a real
> issue.
> 
> Thanks,
> 
> Mathieu
> 
> 

