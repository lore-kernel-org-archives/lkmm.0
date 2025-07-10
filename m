Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF921CC56
	for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156378; cv=none; b=dM4wgQAcxp9yNnX/Mja6Uje0TtsZ47NpG1hfwq5Tz3ypX4unppTisjzI+6eCEPNG+mOpZ7IDPkXWiPW4OC1pdXqJAc3D4M7FklT6EKHLoWdM0F7SMj8emMFv+QWO1RSvT4a1vl5e/BcC+PtMKEc2vWRcRoOhQCDv848R5p2riCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156378; c=relaxed/simple;
	bh=yA/I0gJM/OKVOhc8b6C9blaRbMv2JfyPFC62inigLKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkZbfGFhdjzYHIqj90/VSzWraqQnWGM/1cKI/wV3heTwjyHV9SvwpUcE1zOIJ357gXlgk76dX0CbUKjg0UCTuxCsLKMoQOQxc2dEjWwVmYivJqab0cKn4/OyWq2zJRdvsliN6pGeLuI12Qw8fjm00M9pVFrmW/wnBLWvX8Xyl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so1611485a12.2
        for <lkmm@lists.linux.dev>; Thu, 10 Jul 2025 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752156374; x=1752761174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6racAcJNW4RKgIaC4lIcLewARYRmDGKH6RcAriCOozU=;
        b=KaITqxobqQs5VNifbasQyzMCF1Ev8bL5ukVDl2qzrBHABg7s/8RAyJAtuVhdGmJbaO
         16x7Z35bm1sxTjLhe9GkeHt5POyUhcgTFrfkxRz135rZR0bjqTf/FR24Qn/+faAmdVQJ
         0wWjqycJrCbopENz6qQL6WxaiR6MPeg95TSaHsseKDlS/B3Z0ETifCxB+t17dnyOSQvp
         Z/e23UfDadmfQ+bQ1Dr+LvWDhba11h3CiFtotwk+gZpdGVb8bJgkwCXz+tDIkE0S/6VB
         84eOZHHIYxEM1nSgnmPw7Fiu9LW6MblsDWz8STR0HSd9va4hTLdj2YlYUb2YbhJLP6P1
         gcdA==
X-Forwarded-Encrypted: i=1; AJvYcCXQjpfE5Af50/9ObDuMD3W7EpZ6s1KPeqCnrgNGxxpRqNA53/Sy+v5MN83I0S7OEavL7p9L@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3esK4jq/NmtQ4hTx5wyv5LqKauujX32DE3n50O2/tDeoQYRhF
	oFMS0jTB4LSybQ1vErmCdt631ev2FL3YdN2WJISoah3mELAxXSqPN0Db
X-Gm-Gg: ASbGncvMKwZKiPojvF0jFa1dzI5PR4gkqX9sBi+0z93XCSg2BPAGH8jTjSyXGZG+L5N
	9yMtW6UjnvcL94BfGcNkvEQ7rkFdGsHWm8kLfpY63LR1+rUa3Qqsi748PLXyxdzo2SHZyFglpi1
	PDSRgA9syY9NCbGtNTYqNbbI/zNIhsN76EvRjpJD9BkhK9PUoP05CVLURBobUNUnTzfUUqaALiX
	zRhPtOEwYFeuG0TvuPCI7lsM1SbBz+81+8vTcpfv1c2YM4Gpf/T/2JQCW2ybwCXcQBx2fkMK3FZ
	BhpVP+qOz3gqejAqmMHnmgM8L70ekqzMeZxiPaoXNVNnEWWQ2odw
X-Google-Smtp-Source: AGHT+IFmVAxl1c+wDjcDDTe+BiajHbN+l+Z6s7GZDC3h8YpwVObUutZTnP3nnWaOqw2omJw6WNqiMQ==
X-Received: by 2002:a05:6402:1f46:b0:602:36ce:d0e7 with SMTP id 4fb4d7f45d1cf-611c84d65d3mr2307951a12.14.1752156373710;
        Thu, 10 Jul 2025 07:06:13 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:6::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9524072sm927420a12.20.2025.07.10.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:06:13 -0700 (PDT)
Date: Thu, 10 Jul 2025 07:06:09 -0700
From: Breno Leitao <leitao@debian.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	lkmm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, aeh@meta.com, netdev@vger.kernel.org, edumazet@google.com, 
	jhs@mojatatu.com, kernel-team@meta.com, Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 8/8] locking/lockdep: Use shazptr to protect the key
 hashlist
Message-ID: <i3mukc6vgwrp3cy5eis2inyms7f5b4a6pel4cvvdx6jlxrij2g@wgrnkstlifv3>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-9-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625031101.12555-9-boqun.feng@gmail.com>

Hello Boqun,

On Tue, Jun 24, 2025 at 08:11:01PM -0700, Boqun Feng wrote:
> Erik Lundgren and Breno Leitao reported [1] a case where
> lockdep_unregister_key() can be called from time critical code pathes
> where rntl_lock() may be held. And the synchronize_rcu() in it can slow
> down operations such as using tc to replace a qdisc in a network device.
> 
> In fact the synchronize_rcu() in lockdep_unregister_key() is to wait for
> all is_dynamic_key() callers to finish so that removing a key from the
> key hashlist, and we can use shazptr to protect the hashlist as well.
> 
> Compared to the proposed solution which replaces synchronize_rcu() with
> synchronize_rcu_expedited(), using shazptr here can achieve the
> same/better synchronization time without the need to send IPI. Hence use
> shazptr here.
> 
> Reported-by: Erik Lundgren <elundgren@meta.com>
> Reported-by: Breno Leitao <leitao@debian.org>
> Link: https://lore.kernel.org/all/20250321-lockdep-v1-1-78b732d195fb@debian.org/ [1]
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

First of all, thanks for working to fix the origianl issue. I've been
able to test this in my host, and the gain is impressive.

Before:

         # time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1234: mq
         real    0m13.195s
         user    0m0.001s
         sys     0m2.746s
	
With your patch:

	#  time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1234: mq
	real	0m0.135s
	user	0m0.002s
	sys	0m0.116s

	#  time /usr/sbin/tc qdisc replace dev eth0 root handle 0x1: mq
	real	0m0.127s
	user	0m0.001s
	sys	0m0.112s

Please add the following to the series:

Tested-by: Breno Leitao <leitao@debian.org>
