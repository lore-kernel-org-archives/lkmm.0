Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880A34D3BE
	for <lkmm@lists.linux.dev>; Sat, 19 Sep 2026 16:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835722; cv=none; b=PoZlJJPRW3XxroTEsTqXHc2Tgl40PLr3tTIW79R2KECRIEzutCpfOXYP7HbGPjFLjsIHNoDD/Q2QbEC5zAroPgfb84pIZqbZN82fXDLP/7pQzP8zf6xf/Iu2NNT0xpLur9dLC2mh3cbt1nfjQewwJE2imNNKPGx+MUb2VMRvIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835722; c=relaxed/simple;
	bh=83G8wP1wEtWoW0cUFLtn11NPBN+2XzI+CsyuJfeyx+0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZGXVuGnZ8dsrn9YLAOKLR2GHQMP21I101wdiGS0ChwlOsK1iEYSNRczOdZEiQva/iXHtIdbAl2aNzzMokDzbeecqfP7YKgimFSES/wQ1w7XOWSgLTscw6EVMRhwn658+lse5vXcinMHVUNWleUYr75/BuMgIzCQ95P9XQuxLIjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RkimT5Bk; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6ysdKn0Z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RkimT5Bk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6ysdKn0Z"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789835686; bh=ss08+m6Ho9dtJTXVBqY3w5Z
	xBXwOCMfnNt1YuIpmHGs=; b=RkimT5BkBTiAaZt96v8HUbIATDIlAJLAunUMzSNZIDzk9bPrVn
	GDg6ukzcJtXjd7XQaTG/kpIGy54G06dpI5caJNZpfoyN/OFsc//5rFicIO597d+OG34hfjYJplg
	fYIsbIc7dPfSJXLQLxzf61IAHFcSebtFnJ2+pKT87v0p0qq8HmRwFs8TLqlGtaeeYB9RQbbbf5v
	KokwkRsGtkM+qKYYAq2XiVQ24YQvHAgx/SZEY+MnprN8oHGPGwteEueNQ8Aa5HgxCBLhaYIUsbj
	RzaA9+kTbtkFoxKEkn2sBvZLGaghMwqcDJBAzp1q5R+GuO+bsiQc/lCIqOWm2YBQwtQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789835686; bh=ss08+m6Ho9dtJTXVBqY3w5Z
	xBXwOCMfnNt1YuIpmHGs=; b=6ysdKn0ZyB1iJMq/zpPI1XK39XVC7xlLiBElhdUCPQ4AVd3HI2
	IMLjLff0iUlHgoSDPSjl9nR+oqlFqf9lLfAQ==;
Date: Sat, 19 Sep 2026 17:34:47 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
CC: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Boqun Feng <boqun@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 lkmm@lists.linux.dev, Zqiang <qiang.zhang@linux.dev>,
 Wang Lian <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-mm@kvack.org
Subject: Re: [PATCH 01/28] hazptr: Implement Hazard Pointers
In-Reply-To: <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
References: <e9669b34-12c2-4cf2-a887-315f581f0789@paulmck-laptop> <20260919000056.3132131-1-paulmck@kernel.org> <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
Message-ID: <6B1FC39D-6EB0-433A-8E49-E5EFC9379AD7@mainlining.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 19 September 2026 17:30:26 BST, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>On Fri, 18 Sept 2026 at 17:01, Paul E. McKenney <paulmck@kernel.org>
>wrote:
>>
>> Its main benefit over RCU is that it allows fast reclaim of
>> HP-protected pointers without needing to wait for a grace period.
>
>So last time I looked at this was some time ago, but the thing I was
>missing then seems to still be missing: actual real numbers.
>
>And no, I most *definitely* do not mean the pointless "do this in a tight
>loop".
>
>That's just garbage. Honestly, when I see those numbers it just makes
>me go "I don't want to merge things that even mention this kind of
>stupid load". It's worse than irrelevant - it's an actively
>misleading.
>
>So I want to see a real load where this is actually visible not a
>"loop a billion times on a hot-cache thing that doesn't do anything".

I wanna be a fanboy so bad here but I need to breathe and say something
technical 

I think hazard pointers are good, what test do YOU suggest we do here?

Once I get that PowerPC grant I'm happy to run it.

God I wanted to be a fanboy and say omg Linus hi, but I'm sure I'll be
flamed, sigh. Sigh.

>
>               Linus
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
