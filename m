Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E731CD2C
	for <lkmm@lists.linux.dev>; Fri, 19 Dec 2025 00:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766105027; cv=none; b=rLytsrKr5KlwbY+zWdTKyarDyHIRxQu4T9ITtnjHBytGdUkhwRm80FAUxK9QDlzodjNQV8WI13mNCV5EMmLhKby4YbWTfrNPRHqaEWWDuRzve3+Wz4zqpY6ZMT+c01q5nHZzliMgy1VoLSTyVp9rYiLHklf0kUDIKlJ1hCR1MqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766105027; c=relaxed/simple;
	bh=GpxK1aDfEJaB8fwidbucD/6IJwrflKCJ83SIxuIm+es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m939Iw/Bm1FvIBwSrPjw3pIDwbFQA/gi/tMQfrI4kCR+7Gx72IgCy81LEdFD4Mymc2cbgBgzjfsNd9HV8SoMypxlW7qH79TRhF0xUz/H5hQBLE3ZMTUOj9a31rv9nnQwwinvuSERAhyJ9GTwxzC/BVAzKZDdIlt9k3o8JMnQuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar2zMBBp; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar2zMBBp"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2d56eaaceso149082985a.0
        for <lkmm@lists.linux.dev>; Thu, 18 Dec 2025 16:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766105025; x=1766709825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5yXQjeYJcUm9npCVl/WQPVGb/ZOj4espvLUprKL8vc=;
        b=Ar2zMBBprGiUSPzg6aEIDP8tHTId9P3yku2FqKHpq/UBfpJFwEYptxKW5hIignFubL
         yensYtW38jm1wxFzp9IXKd34k/wRfl10axl0FZgX+XQqcKjT6cPRZoiOHQk8S6Exslck
         uL2UzpJEZika59J1AINg4DOKnoRqUCgrKG0olJrWSMB/FH3olkNfjRHlUbX/9IdSj5s/
         iFAmkEwZ5aN3uk8g593yjcLcYhjr8JTX4E5MoB6Aan47Umyp3q8SF+qw4eSr3hqfYIz0
         d6CgpisSA182aoicZnewQhrxywxbxDC9KiriGXONlC3t9pVQWpYfXg+PkK+ifkDYHRf7
         VWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766105025; x=1766709825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5yXQjeYJcUm9npCVl/WQPVGb/ZOj4espvLUprKL8vc=;
        b=oMjogbHUsgjNA6PPa87/gLBuymT4+PldZ0d4vAw1YECkiO06EbaS9WQz1m9GIvyXAv
         PsAAwxRNHjYDSD0DbDlEvXex5JnOMTD1t3Zq+L7tpv00+i4VST+Fr12uR3u3CuToVT/b
         I40Hee6OsQ1XPtKl9OrEvnrt7yk+x51QpFNnRCbux/Yboql91w1UColxPj2Cpbw35gST
         V009QottdyRAomEc9lTDv7R7BWQM6bFc3etyple1urR4aPvYIow0ocbhnuVlt6rQwk81
         zvhZMYzj/ABQs5VU8CabR8S6xU2AxoBp4n91JCztBtaeqFveAlGRXeSJks2eLEylFGzR
         yFAw==
X-Forwarded-Encrypted: i=1; AJvYcCWY7fww5Co+AFMJBlUbzPpAW/zpd0iok/QAJCxCUbLHI5H9wYXZfNZpW79s5ooifW+OOKML@lists.linux.dev
X-Gm-Message-State: AOJu0YzrUmOEdN6vikhoU6aIEzkojvTYNuPKrEab0flb1R5kWFaUhUn6
	7uSQq3AWUC63dU5ET+GIHLsbKDiVY0rV1SkO0rmDWwzGvp8GJgI7peo0
X-Gm-Gg: AY/fxX4I1WJYeyMrFtXZjMmffiNmLrmRqmpaS/c+3FGxdysy9qFGBMQTtnzQ9DpIe2L
	CdWqjXfZWn25kIq3gOcWZYNRRldKFwEWwvJ2EUlPpv/8YyR+oMhrzSsboa1awzqPCcl9XmFJM2Y
	qwsXj01/+z/06UZH6DPk/8yGPLyKzmiGIyQrZLWBWX+1tR3UAAHpqpzfOZwEAFue+X1CAjdMGTK
	Yx3a5rs0WQPc1KfZGzEFvJXyZUClNVS1XImQSAOagfIcC7l0iG7jBacoT3iarVpcF3rri8OTZW0
	13B2m2B1EGdt0UXrlV5uZkO5LC3/0CFyGPiJZrp+dugoC4FubyB7u36Q+CZVSyPQs9gBR5RgvTZ
	Mrh1N0lFfMadUEyypnWW+gsY0dbr93bD70CDF/tm2rVCe2JIPKyz/wlKlvuEswUU4+OAovVaQle
	fsLhn5xYOVyEWSgOJT31dttqvOcmcUEcd8ZnnKVTQsziF/Xj5N2hx31PshCpQIHOE0Y0PLopHBY
	cjdc1eklpLtnx7imz3zCGn97w==
X-Google-Smtp-Source: AGHT+IFay41fv8PMLFKhbM9Xqksn5yPJ44K9INTfADwIXSsxeUXdkXezhYJ/sTAO68xxPH9wqKC0og==
X-Received: by 2002:a05:620a:191c:b0:8a1:ca96:5d39 with SMTP id af79cd13be357-8c08fabda51mr230657285a.59.1766105024843;
        Thu, 18 Dec 2025 16:43:44 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783662sm67864185a.5.2025.12.18.16.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 16:43:44 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id BF7F9F40075;
	Thu, 18 Dec 2025 19:43:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 19:43:43 -0500
X-ME-Sender: <xms:v59EaeAftY8boR_LXQwkjYXG75LZuTP6aK7OJzQPjgu0cTzBMjQaSg>
    <xme:v59EaVrotpcsAo6Q92mmtVinEj-wxAuodYi7C0dLXtpLaeDPDBZcScWbaboCR4-UH
    fJLQ9RfurryVUxVSjtkVKdPneGwlreQ5hbEli3-9YyE3uupKnNlgA>
X-ME-Received: <xmr:v59EaSCyCsvr-vOaynLld1YCxXWgcxeqgFGEEN3q9A2sKhe5i8r1qakbDW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieeklecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpd
    hrtghpthhtohepjhhovghlsehjohgvlhhfvghrnhgrnhguvghsrdhorhhgpdhrtghpthht
    ohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhpihhgghhi
    nhesghhmrghilhdrtghomhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurd
    gruhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhr
    ghdprhgtphhtthhopegsihhgvggrshihsehlihhnuhhtrhhonhhigidruggvpdhrtghpth
    htohepfihilhhlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:v59EadwY8KDN4BqKdqkPGjxdmzPm2xP75Cd6JnjBeVbBDGbUMI7Xgg>
    <xmx:v59Eaa74_zwyFapcMAazBtoO36hiztMsW0ymuG_x4dsq9WDsY-8h2w>
    <xmx:v59EaevHCeZW17ybOQqxbPIzNIxvUw6PkUNMH4WwUTMGoIcp6BNhWQ>
    <xmx:v59EaXsNk6QvIuZnQUiPMaHyRDhPRvbMr79LrZj_UbhZUPztfY8O_g>
    <xmx:v59EaWv3BFKQ45zgyfitJutqnFrYmD4ojS-u9-hgcEWFdlTO9y0E8JqE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 19:43:42 -0500 (EST)
Date: Fri, 19 Dec 2025 09:43:39 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,	linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>,	Peter Zijlstra <peterz@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,	John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,	Mateusz Guzik <mjguzik@gmail.com>,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,	rcu@vger.kernel.org,
 linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [RFC PATCH v4 3/4] hazptr: Implement Hazard Pointers
Message-ID: <aUSfu4V9mrD7BQGl@tardis-2.local>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
 <20251218014531.3793471-4-mathieu.desnoyers@efficios.com>
 <aUO9KRaP0FXpm_l9@tardis-2.local>
 <fcbc99d0-b7c7-45f7-9cf8-f5d3bfad966e@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcbc99d0-b7c7-45f7-9cf8-f5d3bfad966e@efficios.com>

On Thu, Dec 18, 2025 at 12:35:18PM -0500, Mathieu Desnoyers wrote:
[...]
> > Could you utilize this[1] to see a
> > comparison of the reader-side performance against RCU/SRCU?
> 
> Good point ! Let's see.
> 
> On a AMD 2x EPYC 9654 96-Core Processor with 192 cores,
> hyperthreading disabled,
> CONFIG_PREEMPT=y,
> CONFIG_PREEMPT_RCU=y,
> CONFIG_PREEMPT_HAZPTR=y.
> 
> scale_type                 ns
> -----------------------
> hazptr-smp-mb             13.1   <- this implementation
> hazptr-barrier            11.5   <- replace smp_mb() on acquire with barrier(), requires IPIs on synchronize.
> hazptr-smp-mb-hlist       12.7   <- replace per-task hp context and per-cpu overflow lists by hlist.
> rcu                       17.0

Hmm.. now looking back, how is it possible that hazptr is faster than
RCU on the reader-side? Because a grace period was happening and
triggered rcu_read_unlock_special()? This is actualy more interesting.

Regards,
Boqun

> srcu                      20.0
> srcu-fast                  1.5
> rcu-tasks                  0.0
> rcu-trace                  1.7
> refcnt                  1148.0
> rwlock                  1190.0
> rwsem                   4199.3
> lock                   41070.6
> lock-irq               46176.3
> acqrel                     1.1
> 
> So only srcu-fast, rcu-tasks, rcu-trace and a plain acqrel
> appear to beat hazptr read-side performance.
> 
> [...]
> 
[...]
