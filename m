Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01542198850
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727722389; cv=none; b=DgrXAHyZVb9d2FLbvSmiiIlFl9K9Q4efWeZ60wyU0hQ3ouTDA255qzUThyvq7G9G7umjGn5/Ni46ptj5IAbBwjnCTCztsDvSrk6+EvBeDr9GzU9Ka8XGRko0RAvK6gtFBU2DvYIyqkRphCKYuUrGIu34AgCSHLGSWeRBAkrjhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727722389; c=relaxed/simple;
	bh=OhFYS2zLBVylMlhXJpUaVCRzSOpOEfPox/eu3c+3Bu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0euPA5b6WRDl3CDJ79kHLXUE8DbLSvahNQ47xeCvveLJjZoc97sM8yTzDOzva7oKQjCVw7zGUwP4I2mWjCxJ8gncf16Tz2Gl1Bzn9WWCDJxyjinAzNp0af2+xqOZ39gVb1wzYTQc6Xox3JsVnA5a6jJjqEISBX5JhnoWxxqB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ScmwgFMr; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ScmwgFMr"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a9ab721058so495953985a.1
        for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 11:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727722387; x=1728327187; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3nc/E6veIr73qBv2y/aevoRhI95QWm1Rj9HOPT08sU=;
        b=ScmwgFMrCRN1mWVGGjcI+DdAuMhDakWnvozD0zuDHTplNz7g3Gxo16ZYZwVxg7cTMq
         UAv/t4/vXThXoMVPQaYXwP8RdOg8f2x+P5V2pNNI3PT9CIgBVOM7S/Yhp0Zk5QsiNkjC
         i3J0tnFBvNr+/xBxARPhqicR1zF97af8/rs/JJvYLZo/Z5M7rkX+w0jhwDjTUPUnbD8Q
         Cdf7xTvYId3Cf59fc7i6sIn9SAjql0YBCJGpDhoKYKpqKMGVjt39CFVGXG2g4Mn/srr5
         syHuC8/hp5uR5cp7WNEfdk912tj/s4Nx8NY8JQoiaaMnzAbKP0IyunpRyPwI3ZjJ+CoV
         0OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727722387; x=1728327187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3nc/E6veIr73qBv2y/aevoRhI95QWm1Rj9HOPT08sU=;
        b=ueXfgKBAm9Rvly8XRYg28EiwGdgB993NcaLQ+WNqL6A6LJWC4iVdP6TG/uesCwireV
         nzUG3t1yZsuaOOcGhX3c9OYIS8nR2VxmtfBovFsTo217gDbgN5vAWsfa88pmzi6FKIuj
         RX+NGp+zzGqXj/iT3rEYd01tpcvEAJr1KdegSoFUzP5gnHb9CAPoSa2SfRNhsClGbq6S
         JxJBvxXPzk0nJMiTnnxhnmTnK+Egs4zKiUN6+QU0ZPee1mRgM3omwAYjzI7n8CqH/vIR
         DNoTvnwTHzmLuTLcv0CyDYQcmTee1ktMbBAs8cYvkP3JKKyjjlnD7T5GgAbjtSob88an
         cd9w==
X-Forwarded-Encrypted: i=1; AJvYcCW2c/bNWScmKWblFGshzsseH0yPDAAE29zO0Ba7I/Y3Io+yyezilvsYlpU4tPsBlTA0/pLL@lists.linux.dev
X-Gm-Message-State: AOJu0YwONlJh0B20VKPrQ/v3gvvW8SP64iQBwQ4m5TXymw4ODG0z1KBm
	1dnIMaSTvygZ+t+uBgI49mCJimUgbqqtVUmqC5az9OfBM28Ng9xU6zhkeO0Obg==
X-Google-Smtp-Source: AGHT+IGKwCrS47yaTQ0BeOhoXQcBFlAYv3nhqHOPGUF2suoHUqsJsO84VsCTi/F+Qxr0yXZrYyaBIQ==
X-Received: by 2002:a05:6214:2d13:b0:6cb:3be9:1816 with SMTP id 6a1803df08f44-6cb729e7801mr8703456d6.24.1727722386910;
        Mon, 30 Sep 2024 11:53:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::5638])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b67f247sm41724056d6.107.2024.09.30.11.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 11:53:06 -0700 (PDT)
Date: Mon, 30 Sep 2024 14:53:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, John Stultz <jstultz@google.com>,
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>,
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
Message-ID: <82e97ad5-17ad-418d-8791-22297acc7af4@rowland.harvard.edu>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <9539c551-5c91-42db-8ac1-cff1d6d7c293@huaweicloud.com>
 <2cdda043-1ad9-40cf-a157-0c16a0ffb046@rowland.harvard.edu>
 <5d7d8a59-57f5-4125-95bb-fda9c193b9cf@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7d8a59-57f5-4125-95bb-fda9c193b9cf@huaweicloud.com>

On Mon, Sep 30, 2024 at 07:05:06PM +0200, Jonas Oberhauser wrote:
> 
> 
> Am 9/30/2024 um 6:43 PM schrieb Alan Stern:
> > On Mon, Sep 30, 2024 at 01:26:53PM +0200, Jonas Oberhauser wrote:
> > > 
> > > 
> > > Am 9/28/2024 um 4:49 PM schrieb Alan Stern:
> > > 
> > > I should also point out that it is not enough to prevent the compiler from
> > > using @a instead of @b.
> > > 
> > > It must also be prevented from assigning @b=@a, which it is often allowed to
> > > do after finding @a==@b.
> > 
> > Wouldn't that be a bug?
> 
> That's why I said that it is often allowed to do it. In your case it
> wouldn't, but it is often possible when a and b are non-atomic &
> non-volatile (and haven't escaped, and I believe sometimes even then).
> 
> It happens for example here with GCC 14.1.0 -O3:
> 
> int fct_hide(void)
> {
>     int *a, *b;
> 
>     do {
>         a = READ_ONCE(p);
>         asm volatile ("" : : : "memory");
>         b = READ_ONCE(p);
>     } while (a != b);
>     OPTIMIZER_HIDE_VAR(b);
>     return *b;
> }
> 
> 
> 
>         ldr     r1, [r2]
>         ldr     r3, [r2]
>         cmp     r1, r3
>         bne     .L6
>         mov     r3, r1   // nay...

A totally unnecessary instruction, which accomplishes nothing other than 
to waste time, space, and energy.  But nonetheless, allowed -- I agree.

The people in charge of GCC's optimizer might like to hear about this, 
if they're not already aware of it...

>         ldr     r0, [r3] // yay!
>         bx      lr

One could argue that in this example the compiler _has_ used *a instead 
of *b.  However, such an argument would have more force if we had 
described what we are talking about more precisely.

Yes, we do want to prevent compilers from doing this.  I'm not sure that 
it really needs to be mentioned in the comments or commit description, 
though.

Alan
