Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E482CA8
	for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 21:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727558137; cv=none; b=kvHIaof7jnIJd/2dlr0K9x3sEGl7yTwydVmgKgCBJvmQcYdeukRAvSylt0z+5W/w6yQIP4eycxdKEA5dxro+Lu43uiz7ymFYOIieiC+MdVqyp4BDZA/ojyicEYimCL+5oRE24GgLUf5P8nx1MMIIZKqL8/yT3LPdT1PCkXqQ6pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727558137; c=relaxed/simple;
	bh=++4TeXgazg91XXehxEoK1/9SF4OgnIIL2ao0x7Jj/y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsX/NnKiypR9fvBmo/pg9pAzGj/3wB+MssiBgDeYO6bSlQp1FgkdCAheL2noCPy2vK4r+E0RIM3zAG9wsSIUGk/HAcXpVu6cyPGKO6I/M8x8N9lKjGXk4UbroCGzFs6UyCr/I8E1fTRfkO0ys5l/s5AygrZjKoB1tvd2Qbmx2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=i5dvfoDw; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="i5dvfoDw"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7acdd65fbceso267580185a.3
        for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727558134; x=1728162934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PxKTMIF6DeQ/9qr6txQjiAXMf3+GilsmbRaxHtQjSE=;
        b=i5dvfoDwZqBOqpiTPEP9nxlR5NDh0YLlsGQF3dOzTvlgTSdTbZdW1od0x44iLarDcF
         zEj4ZFN1RbbhpHJDWaj+t9FtWJ3p2qeGcn71DxzN1+j9lf5XJHGp6jVFDzSNHeBtusXE
         jsdo+e93gocrlwq3QuydIHXy2NCaIN9Y3THsl8eysqtC9IQM82vzTOXjJt6lpol48Ngu
         aDWALFf5MNKpPbkjT8TkGiCEPpKu0ZYL9dYvcoIjeuZH1VVni9yGP91ihStwwCYbV5F8
         EMMget9LuLNE90n/DFvmzRcNryLee28QXqvGKDkUlL8I0/ReQyqG0gGykctJUg2shfwy
         1c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727558134; x=1728162934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PxKTMIF6DeQ/9qr6txQjiAXMf3+GilsmbRaxHtQjSE=;
        b=Jcl90VFXwOjfuWBDUDQnmSBhnxl7Xz+/gUoWr0BlEm5TaoqyjaDifpCJPMdmIgfmK8
         br4Qf5nMubg841ww7PprBcTK8qieceR6BJYMYfZ3lIhBzKHqm2j8MMgbYURlFhklTBgo
         EoZJDb0wGmwFUYFedgK7ahtHYtpIQOIKVWhfXlB11Z7SGSzvqYNadNDBPrufL9m+ntUh
         8H8H19xyFzYt2uMvjZV/bv44vSx6Htn7fEiq9Nn0Nvrc6Ps2ILgX/J5l5Hxxb2+8hkOW
         WAkW8PjiBTRDFbAOZgaVShFFWANZZMAyZGLVUqptUhgQWWLGYH6bg+MMHIJzXa0o7eYQ
         /y0w==
X-Forwarded-Encrypted: i=1; AJvYcCXX/+1AA3GBngo1jCBbHt89fYLQ2//K/ybxY9urdA516ioQuCEw/O7B0Xl55aslOfkGjwtD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Ae5sbxf2jleE3+fIPwuqkpi7RsEUfF1qtcaS0WpngOQCIjfb
	21en/iyGPrbcFJSiebRTda8Oo7+60jVD3yjDppP4KQ76bOkcE76WyHJi3jxIFg==
X-Google-Smtp-Source: AGHT+IE6VdKHTwplHgwI7PZXwbNIB2hr26lmUE6zQ4ZThO/awD81T++nWTivo6Q1AxoadzUpc2/TaA==
X-Received: by 2002:a05:620a:4707:b0:79f:12fb:ed1 with SMTP id af79cd13be357-7ae378380d2mr1176831785a.16.1727558134233;
        Sat, 28 Sep 2024 14:15:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::abbf])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782c745sm237384485a.90.2024.09.28.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 14:15:33 -0700 (PDT)
Date: Sat, 28 Sep 2024 17:15:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
Message-ID: <25344f33-b8dc-43fb-a394-529eff03d979@rowland.harvard.edu>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>
 <d2c87672-af75-4210-bd96-d7f38f2f63ac@rowland.harvard.edu>
 <d49f5d9f-559d-449b-b330-9e5a57d9b438@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49f5d9f-559d-449b-b330-9e5a57d9b438@efficios.com>

On Sat, Sep 28, 2024 at 11:55:22AM -0400, Mathieu Desnoyers wrote:
> On 2024-09-28 17:49, Alan Stern wrote:
> > On Sat, Sep 28, 2024 at 11:32:18AM -0400, Mathieu Desnoyers wrote:
> > > On 2024-09-28 16:49, Alan Stern wrote:
> > > > On Sat, Sep 28, 2024 at 09:51:27AM -0400, Mathieu Desnoyers wrote:
> > > > > equality, which does not preserve address dependencies and allows the
> > > > > following misordering speculations:
> > > > > 
> > > > > - If @b is a constant, the compiler can issue the loads which depend
> > > > >     on @a before loading @a.
> > > > > - If @b is a register populated by a prior load, weakly-ordered
> > > > >     CPUs can speculate loads which depend on @a before loading @a.
> > > > 
> > > > It shouldn't matter whether @a and @b are constants, registers, or
> > > > anything else.  All that matters is that the compiler uses the wrong
> > > > one, which allows weakly ordered CPUs to speculate loads you wouldn't
> > > > expect it to, based on the source code alone.
> > > 
> > > I only partially agree here.
> > > 
> > > On weakly-ordered architectures, indeed we don't care whether the
> > > issue is caused by the compiler reordering the code (constant)
> > > or the CPU speculating the load (registers).
> > > 
> > > However, on strongly-ordered architectures, AFAIU, only the constant
> > > case is problematic (compiler reordering the dependent load), because
> > 
> > I thought you were trying to prevent the compiler from using one pointer
> > instead of the other, not trying to prevent it from reordering anything.
> > Isn't this the point the documentation wants to get across when it says
> > that comparing pointers can be dangerous?
> 
> The motivation for introducing ptr_eq() is indeed because the
> compiler barrier is not sufficient to prevent the compiler from
> using one pointer instead of the other.
> 
> But it turns out that ptr_eq() is also a good tool to prevent the
> compiler from reordering loads in case where the comparison is
> done against a constant.

Isn't that the same thing?  A constant pointer like &x is still a  
pointer.  What you want to do is compare p with &x without allowing the 
compiler to then replace *p with *&x (or just x).

> > Isn't it true that on strongly ordered CPUs, a compiler barrier is
> > sufficient to prevent the rcu_dereference() problem?  So the whole idea
> > behind ptr_eq() is that it prevents the problem on all CPUs.
> 
> Correct. But given that we have ptr_eq(), it's good to show how it
> equally prevents the compiler from reordering address-dependent loads
> (comparison with constant) *and* prevents the compiler from using
> one pointer rather than the other (comparison between two non-constant
> pointers) which affects speculation on weakly-ordered CPUs.

I don't see how these two things differ from each other.  In the 
comparison-with-a-constant case, how is the compiler reordering 
anything?  Isn't it just using the constant address rather than the 
loaded pointer and thereby breaking the address dependency?

Alan stern
