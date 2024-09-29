Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E38224F0
	for <lkmm@lists.linux.dev>; Sun, 29 Sep 2024 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727625062; cv=none; b=FDh+JVvSbPwA5JkD9F8TQjWSK6v8zrnpuNh5sDKnzwGc8b6EqhIG+Eq8nlGKXr+bpy4IsTjGgV5aMSz0kezRmg1RWvOm2vab2H51b30BY5Br2b8C/9sQM0N7UE7c6U3iYFB05veLsj4TkmSBxT1rmRLIO8IzARKpE893sawA2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727625062; c=relaxed/simple;
	bh=JZxrYxpziZiNH0RWp1bEPKptpq2xXzmCutmdLJ4h9hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiAjW6g786njzMm4FlXGQcb9MnYOAzICsJXso5KuwESr6MiJg7+V0kc9AGjVhsCT00UlVRhXixCLabHGIyKdKY1Y/lYygUZM9BaVYPZuCrtX1+JKwaNTX/Ut0lVEsp89Zram0vMp3IJbotPVsZZdc/qy5aVt731yn2sQAbBITpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wQoqQOct; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wQoqQOct"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cb399056b4so26709216d6.0
        for <lkmm@lists.linux.dev>; Sun, 29 Sep 2024 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1727625059; x=1728229859; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Y2D6qTzk1N1f3m0kRzoxA/mFWQeqmxquaa8AlYdeFM=;
        b=wQoqQOctmJ1TfFuMZtaOhqvtejZtQV5CDjgAuXkDxsfwrZ+Hf2QAagGztEe+VRGHBM
         tDXKQ54QkMQzPoiyswlv+Zr6uTdfsjy7F7aXKppeh6aV5yPW9huO9Ys8wPl7p+3k1OtP
         6GsdVacKxzfn8VPodmOc8rkXpOxxF/5+XdGm55XAOKXGqrL/NrP0U/2vXcwyn5slRVHM
         pTssYoyW4VCUn01IHuUIeAYjsVuWx0a+wlC14wc9c/50/yKqyqVmDbWw118GFG3ddUum
         LGqD7Kxsg9Dp/Hugfky8Uc+aC8UVWjYZU0ilzE1obmO9XCWEPw1aYp5KCUBU/+Xfz/3M
         lk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727625059; x=1728229859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y2D6qTzk1N1f3m0kRzoxA/mFWQeqmxquaa8AlYdeFM=;
        b=FiWp+iOYLZymQkxgwhCOhyEPcV9ASDypQYUerqYAggcizcH/L8aKOBQvhVBea8b1EC
         yPSqf2hwnE6IuleIbwF/DvnHW6+cQskG1+QEfb3pmtb3cpLyiFsCmModNrfQlq+vtj6R
         EJNAHu7Oxpn84DJT0WCdS6HGftAwFIGvKkTKqZEhdb1s9ZhrCIoEZGMNm2kZsgIbGdeb
         Uz/yJ1mbRmoGfxWxFJ7pm6EPEDwno1q+wE/EAnbh1XfaGa+lpnp8v17NsFLXt1rS18DP
         1ReO4voguXYQglOUjwUQLP6meGsZBTbQl73uuAbYgN2QbwXouleEZlPFB9z4H33KXYxw
         RrFA==
X-Forwarded-Encrypted: i=1; AJvYcCWEKE00dR5OyNG17RItbUOyZ387gAHdaUCWrT60TkIsjsuEMsk0jj2Y/jbJFw7vDLRtO34L@lists.linux.dev
X-Gm-Message-State: AOJu0YwlMrPtzAxAJcA6doQyzF5laao5Lo06cJxxFrp8+8iNVELNpoUl
	MgPkJYZWl5u/JseKlRNrCZCEY7YX+YDMZVyS6IqIouj5YxvzrB/E85gIIlduKw==
X-Google-Smtp-Source: AGHT+IFZuEPBZGMBb6yILvpuGoLBRTg0zQfGWndE1JjdQ9u9RIGWwrmtLSM5wwVtRT+ilMvEG3tiNQ==
X-Received: by 2002:a05:6214:598f:b0:6cb:2d18:dfe5 with SMTP id 6a1803df08f44-6cb3b65a8femr120236206d6.49.1727625059122;
        Sun, 29 Sep 2024 08:50:59 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::abbf])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b5ffbbesm31867626d6.25.2024.09.29.08.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 08:50:58 -0700 (PDT)
Date: Sun, 29 Sep 2024 11:50:52 -0400
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
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev,
	Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v1 0/2] Introduce ptr_eq() to preserve address dependency
Message-ID: <df54d990-537a-418d-b748-7cc140eba236@rowland.harvard.edu>
References: <20240929111608.1016757-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929111608.1016757-1-mathieu.desnoyers@efficios.com>

On Sun, Sep 29, 2024 at 07:16:06AM -0400, Mathieu Desnoyers wrote:
> Introduce ptr_eq() to compare two addresses while preserving the address
> dependencies for later use of the address. It should be used when
> comparing an address returned by rcu_dereference().

Both patches are now much better.  Thank you.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
