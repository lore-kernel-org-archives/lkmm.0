Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0721E49E
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727455822; cv=none; b=oZWITkC7PIqG5x1mAYEwE1NxynTATazTXZiYKwVakzgQOnvaW0bADsXoMuKF5ls3UPGKAE5vFdxdduPPX0ilJDyLKQ83aNZL3B7jJB2Z4KXgdtT/RlLaGbC5w5RvQrIlWNeIJ41P3mCAoW0aWl/QKbZiUuEN4OdYE+A07QMXqcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727455822; c=relaxed/simple;
	bh=C/61GLLGEEVYHtyByRtDw7pPawa+NNpIeX7syWGrSlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5x1tY27g8Y/l8BfrXkjZBjgcqemcnfptHlg5trNdo1OWae4129J0CtYcXy6Bs8zWAaC14k2nblKJldZ68//YZgQVulOs4/pQIurleD8CatNGeA9pBEGkOlndKjxzskOjSM2Eqc+6BOF1hKYFhIRXb7LPqsLB5hFTjX3x25NPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KQ4w9aBJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KQ4w9aBJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8ce5db8668so370558666b.1
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727455818; x=1728060618; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fPpqzCsLOObKbwWe/AzrIGNw3HOBLR2W9N0IccOsIgU=;
        b=KQ4w9aBJae7dpEU+Ze8xAHpY83jT3/siyKjLwlusR/un68+wKUwEv7RKhcnbSmpzBJ
         KCxk8sQbaANpuKH+8Lls19lP+qUwHVKTMnfIIkn+f4g02FLoJiqKCjAQWvAAue28AsVJ
         P1R7kHj6KTaoIZomT0mNQHM7AOzwTjRncAoGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727455818; x=1728060618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPpqzCsLOObKbwWe/AzrIGNw3HOBLR2W9N0IccOsIgU=;
        b=nUtWmyS+wiAL9WUYL5P8mw7lcf1dy0edAfQvTHeI2bw4VZyD8sT3RkVZT/kNwUJKVK
         TUcI2M6W29FjWPj1qOiV1FtT4/K1tg44zdJyS8iACKBDPMsYBlc1PC73A5vel5BXevaj
         4EFgm+tp13PcEbJV/WG51y3jvWP6CMYj8RPr9hJCjwLAX8foC9ms9mPlz28zXFISFDs5
         v/S/q+EfiOBjrpFpzCmMvN+wD3zB3V8td/AhUVzG/vufJ2i8VfETJegmZL1e5invCrXN
         yL9fv6SGgBrQ3HVENTkmH/zmTa+mVFsJpR/pjJyMwxKko+CoqYTN4t4rss5AuBd8tQC7
         6pQw==
X-Forwarded-Encrypted: i=1; AJvYcCVbjy2+7cOh4g0epO0XfK6hoOTkOQ7CemUMEQwwA72TC/4ra7YOw8cGqsWIFB5YgDRPZj7K@lists.linux.dev
X-Gm-Message-State: AOJu0YwvmISWf3zAefkUHPIG4vQm8l1NXi6RdStPsg6s3E4T2dhjdRkU
	nd/segErfjHWk9ICpw+DVn3pFg73yoch6VTjGVCEC1fZhOtqMsNDfZt20Pbypz1Zh6gCw/5E1zW
	GPtnyWQ==
X-Google-Smtp-Source: AGHT+IGZPaGuLSIx05sr/mnxp0Duam0hFGVu+IrlorJPGEm9HGqccj6qoyyP/X3BaMPqM9ZE/bmGUg==
X-Received: by 2002:a17:907:6d20:b0:a8a:66b6:58d with SMTP id a640c23a62f3a-a93c4a4e104mr320364466b.41.1727455818375;
        Fri, 27 Sep 2024 09:50:18 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297a647sm152552566b.152.2024.09.27.09.50.18
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 09:50:18 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d4093722bso326222366b.0
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 09:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYXWDbhuJUY70N+lCwotgYQ7PKzVa6UfxFMAWd7kvBTzdGWAyYIeW+NkX1qIx6cb6XvXXx@lists.linux.dev
X-Received: by 2002:a17:907:748:b0:a7a:b73f:7584 with SMTP id
 a640c23a62f3a-a93c492a391mr352824766b.34.1727455468157; Fri, 27 Sep 2024
 09:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
 <ZvP_H_R43bXpmkMS@boqun-archlinux> <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com>
 <48992c9f-6c61-4716-977c-66e946adb399@efficios.com> <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com>
 <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com> <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
 <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com> <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
 <ZvX12_1mK8983cXm@boqun-archlinux> <0b262fe5-2fc5-478d-bf66-f208723238d5@efficios.com>
 <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com>
In-Reply-To: <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2024 09:44:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQyXOt_HjDZHNqWMmyvv74xLAcMw88grfp4HkKoS2vLw@mail.gmail.com>
Message-ID: <CAHk-=wgQyXOt_HjDZHNqWMmyvv74xLAcMw88grfp4HkKoS2vLw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard pointers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 18:38, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> Note that ADDRESS_EQ() only hide first parameter, so this should be ADDRESS_EQ(b, a).

Yeah, please stop making things unnecessarily complicated.

Just use a barrier(). Please. Stop these stupid games until you can
show why it matters.

And by "why it matters" I mean "major difference in code generation",
not some "it uses one more register and has to spill" kind of small
detail.

At this point, I'm not even convinced the whole hazard pointer
approach makes sense. And you're not helping by making it more
complicated than it needs to be.

          Linus
