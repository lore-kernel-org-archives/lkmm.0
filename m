Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B213B5B4
	for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727367202; cv=none; b=iz7UxybhSP1ytQi9j23ae+IxZkAjj51C12fplVaNjmmsVEa2EyhcW9LsNC9KlhgnJDwjWuQuteIymug4+pBEKJgk+4hzhcsimQCoJ474OoOFobbODCe5hjQGg5wqRuBoyeu5Ro53NoJEZfX3kD8DgkGA4MxOww5uBTLCC0DB7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727367202; c=relaxed/simple;
	bh=b/AkQ6KC/9/lXddy+98mjZVGNz2jCIw0oGNZw2EAKto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wr44K0qEzPlGYY/CdGdLEVVP/TwWw++mPtDkk4tPnCACHiEbNbnnn88pxu9G+EBH8E+PVPrRvExwS07W5YcrOC3bC6wiQyd6SPyScFGpgWr6x1HXITRZLTBW1mf/F7Pekw+kzH78PSz6wnwcxeicHUqMMJpG1KQN9s68bOyvoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WE+KHOTt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WE+KHOTt"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365a9574b6so2018680e87.1
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727367199; x=1727971999; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXnBUq/9ghYv0bNYvo4uDCfOpMdq8coMpre7nUUI9wE=;
        b=WE+KHOTtheXEbk9CE7TrMo4rezZ9JZYkDtiiAYMHaisbGRmqntxJlpEDhEZDp9JVGM
         yPSoc7b1LC4YNLRz7RLBkNTdkAY+qXvNr/WYyFPyelD+Vkej75IINs6xMsq9FMx8vxj2
         uDwVnpYBpXb6IHUKY8wRmleCEFQ1vDVBiENeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367199; x=1727971999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXnBUq/9ghYv0bNYvo4uDCfOpMdq8coMpre7nUUI9wE=;
        b=GdhtnM2HvRoZqH143DzX+jvl1FY4Hi1pAAKibv7VVcYZp0HnY+PDD69ekPEzVqL0ZD
         hYHM4lE9LJJLQnv4xH/ys6Yq4RQFPqQfc5u/c88BfxpGldBNlK10fThQtyARCijRArO9
         weh6o3C37VO5rc0SPJUM8KJZnWftOeUGPIjKJ37RdZ/BflqRoqUaZtb7DBUiFCgUTRQU
         R6z0ys0HS3m7VROuAFDBhqwlG7Gd6qcdpbhDHJfpFj7O+m4yfQLXz8DP1/5rgnvh9eaS
         V12shhMiW43jzw2Rrt9fGQzdWbVELhzA4w33bGVwEExoZAbhTObCNdtHRmZsuOUj9D8c
         PfQg==
X-Forwarded-Encrypted: i=1; AJvYcCXKJUWMnFOe/yHJwC68HwDmSip0AzC2q6fEGCMXzzG5L4L57rmbMVkisFNGcRf3dIzbrW8U@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3mrozfud41xDdUDacNxcKWvzc4Y+A6dLkE8xYMuMd8R6N7gIG
	y8ipCPglSLRtFCzT4hoOD2Y7dNFCTX1BMn3+PzMEDJ113lmpueSmDeAzUU1m8kCqIWr/tYpFu8s
	TIIlDtQ==
X-Google-Smtp-Source: AGHT+IF8vBBgZTVTlEVGtcFsFltqaZCsAxhnAqHoM5/6i5w9mL/xGyHismweCHCZmTeAmkvOAkKw4Q==
X-Received: by 2002:a05:6512:39ca:b0:535:681d:34b0 with SMTP id 2adb3069b0e04-5389fc7d395mr117573e87.47.1727367198652;
        Thu, 26 Sep 2024 09:13:18 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd53843sm2777e87.39.2024.09.26.09.13.16
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 09:13:17 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365a9574b6so2018564e87.1
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 09:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVNiDu1U+KCtbQ0brkvcTHGADwf6Qi2xX9blmRpusXOZfKteHa6nBeU440lg31lQUydVAD@lists.linux.dev
X-Received: by 2002:a05:6512:1113:b0:536:53e3:feae with SMTP id
 2adb3069b0e04-5389fc34426mr138492e87.11.1727367195995; Thu, 26 Sep 2024
 09:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917143402.930114-1-boqun.feng@gmail.com> <20240917143402.930114-2-boqun.feng@gmail.com>
 <55975a55-302f-4c45-bfcc-192a8a1242e9@huaweicloud.com> <ZvPfmAp_2mDkI3ss@boqun-archlinux>
 <f5aeeeda-c725-422a-9481-4795bd3ade0f@huaweicloud.com> <ZvPp4taB9uu__oSQ@boqun-archlinux>
 <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com> <ZvP_H_R43bXpmkMS@boqun-archlinux>
 <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com> <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com> <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
In-Reply-To: <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Sep 2024 09:12:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
Message-ID: <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard pointers
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 08:54, Jonas Oberhauser
<jonas.oberhauser@huaweicloud.com> wrote:
>
> No, the issue introduced by the compiler optimization (or by your
> original patch) is that the CPU can speculatively load from the first
> pointer as soon as it has completed the load of that pointer:

You mean the compiler can do it. The inline asm has no impact on what
the CPU does. The conditional isn't a barrier for the actual hardware.
But once the compiler doesn't try to do it, the data dependency on the
address does end up being an ordering constraint on the hardware too
(I'm happy to say that I haven't heard from the crazies that want
value prediction in a long time).

Just use a barrier.  Or make sure to use the proper ordered memory
accesses when possible. Don't use an inline asm for the compare - we
don't even have anything insane like that as a portable helper, and we
shouldn't have it.

                   Linus
