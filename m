Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00271863E
	for <lkmm@lists.linux.dev>; Sun, 29 Sep 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727569224; cv=none; b=FFTjx9Jm7+irXn/0nMSLR0YXyw/+/6Qa4pBtZNIiTuvuF79JBkCHGXd9qr1bNgWNuRN5LzO8WUb1borysiX4zF/2zv9VvTDo36U+6TaLm/RuSGzZVymIu0S1m7NmsdXc5cJTgxkLQIZ8NCCI1R9LEFBVhlcuPQBp7pcCNBbPLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727569224; c=relaxed/simple;
	bh=Q9NKGA9e8SpsBeHRGYpOWyq1+YIDZCPIRoH/v9mX76Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GJurvDrOreuanwilTxNUiydeUpe0MZNGyMknIB9O5cr304kjfok4kBOYFtP10mOFFnOmZwCjLIOSv45kKsc+EJFsyMSJgJbXlXMQMr1/zOuSxBzl18HkFx4UVQ+NkoVRdCeK8K4wN5tiBCMiLu8V5pJdrUq4SgI5V2PRqKcGewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVO+MrY1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVO+MrY1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71957eb256bso2873210b3a.3
        for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 17:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727569222; x=1728174022; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AciA5lkArq2LcuAgiidbmpLX8//NU2EZPXWMWey1klw=;
        b=HVO+MrY1FmEm8cUV/EN6d/ZxgFMJi7omBQQpZJoL/jusGa1VnBoOEC7RAxF1mFXu24
         xuelEzgH6aFsnaFdHEtPypLQPT/TmOYX3ZY/JLCe8x48CLwAYUuLYW84mIDsIQNw8Wbi
         1WzXTJZNLgM+rmPPxZZarTqAFVsDF6g7MWoWWq4p2JcUPx03IxDVL8E6j2IByBhRqbMd
         G6m3TXIYI9STbGbPiWv5bdcBPHYlBQ4F7Zmza+Mjm14aSNShnz2bQnwgeO32gqBOcPFb
         TDqKAzy25U3KXLjbwQW+/Oox8bLePC1NTsBrf8X+NdJeVSclGkASVecTM4SHbg1w8Hb9
         uQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727569222; x=1728174022;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AciA5lkArq2LcuAgiidbmpLX8//NU2EZPXWMWey1klw=;
        b=ZYuO6P74J6XO04MwrzKU2eceNlUDeSZyYDhnoPMicA6PL5od95b30ib9a2Yx7fbggx
         xtoeIYjEZHVWkXkkwr024mvTf17Auk50EiuJBkz16iY2SHw25rM90z8niwE368YzEEQL
         mCiImPp8EwF1whGeMRWa5b+y8/6wZD9RgktEsFyPfSPrD4Vu+bDaE0cE6EbG70nYDXv2
         SwkNciTZmJmXuJ5k/vzhRVZhL5CJzwxJ+xpi1i+v/sr84/BZMgZa3SI0Mn3zAPeOWRlT
         +Mu4IHx7gxpD82tt1MtTBkx1fzOfHVUL5CbD8jzJSrkdu96Ya4Fm8q8JhOehrLJxINpA
         TH8g==
X-Forwarded-Encrypted: i=1; AJvYcCUk9u3kBipG5/oK1OYOCnTVD1dNISIWgV0AYH2HL9K3Q5FJq7GINutQlh5BxpgJVizL5pr3@lists.linux.dev
X-Gm-Message-State: AOJu0YwMqwGNcfir52k+x7164MPTZF9ODhOkL+u5gDjQ4b3DW0Wld5w6
	ZvX9cjalGu+9PZE7YZAhNABiZPYdCRXNhdMhib3N23BY7Y6jzC/W
X-Google-Smtp-Source: AGHT+IGrPCIsZd3xVlDfQ3t7v5wWjb0n8Dw8h91/C6QpaBBBIkYhcxX80aGJo1MfszwJ4cOHtuUW3Q==
X-Received: by 2002:a05:6a00:194f:b0:717:e01d:312f with SMTP id d2e1a72fcca58-71b26078cf5mr12778522b3a.27.1727569221947;
        Sat, 28 Sep 2024 17:20:21 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b390dsm3889001a12.20.2024.09.28.17.20.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Sep 2024 17:20:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <60123be5-ae24-4426-b9ca-6f39e64ab76b@app.fastmail.com>
Date: Sun, 29 Sep 2024 08:20:01 +0800
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Neeraj upadhyay <Neeraj.Upadhyay@amd.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 rostedt <rostedt@goodmis.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 RCU <rcu@vger.kernel.org>,
 linux-mm@kvack.org,
 lkmm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD97A93F-EAFC-4C32-97F8-EEC8C1B48519@gmail.com>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>
 <d2c87672-af75-4210-bd96-d7f38f2f63ac@rowland.harvard.edu>
 <d49f5d9f-559d-449b-b330-9e5a57d9b438@efficios.com>
 <D31AF4E7-B9D5-4D2F-A4B9-1E12B5E69549@gmail.com>
 <60123be5-ae24-4426-b9ca-6f39e64ab76b@app.fastmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)

2024=E5=B9=B49=E6=9C=8829=E6=97=A5 07:55=EF=BC=8CBoqun Feng =
<boqun.feng@gmail.com> wrote=EF=BC=9A
>=20
>=20
>=20
> On Sun, Sep 29, 2024, at 6:26 AM, Alan Huang wrote:
>> 2024=E5=B9=B49=E6=9C=8828=E6=97=A5 23:55=EF=BC=8CMathieu Desnoyers =
<mathieu.desnoyers@efficios.com> wrote=EF=BC=9A
>>>=20
>>> On 2024-09-28 17:49, Alan Stern wrote:
>>>> On Sat, Sep 28, 2024 at 11:32:18AM -0400, Mathieu Desnoyers wrote:
>>>>> On 2024-09-28 16:49, Alan Stern wrote:
>>>>>> On Sat, Sep 28, 2024 at 09:51:27AM -0400, Mathieu Desnoyers =
wrote:
>>>>>>> equality, which does not preserve address dependencies and =
allows the
>>>>>>> following misordering speculations:
>>>>>>>=20
>>>>>>> - If @b is a constant, the compiler can issue the loads which =
depend
>>>>>>>   on @a before loading @a.
>>>>>>> - If @b is a register populated by a prior load, weakly-ordered
>>>>>>>   CPUs can speculate loads which depend on @a before loading @a.
>>>>>>=20
>>>>>> It shouldn't matter whether @a and @b are constants, registers, =
or
>>>>>> anything else.  All that matters is that the compiler uses the =
wrong
>>>>>> one, which allows weakly ordered CPUs to speculate loads you =
wouldn't
>>>>>> expect it to, based on the source code alone.
>>>>>=20
>>>>> I only partially agree here.
>>>>>=20
>>>>> On weakly-ordered architectures, indeed we don't care whether the
>>>>> issue is caused by the compiler reordering the code (constant)
>>>>> or the CPU speculating the load (registers).
>>>>>=20
>>>>> However, on strongly-ordered architectures, AFAIU, only the =
constant
>>>>> case is problematic (compiler reordering the dependent load), =
because
>>>> I thought you were trying to prevent the compiler from using one =
pointer
>>>> instead of the other, not trying to prevent it from reordering =
anything.
>>>> Isn't this the point the documentation wants to get across when it =
says
>>>> that comparing pointers can be dangerous?
>>>=20
>>> The motivation for introducing ptr_eq() is indeed because the
>>> compiler barrier is not sufficient to prevent the compiler from
>>> using one pointer instead of the other.
>>=20
>> barrier_data(&b) prevents that.
>>=20
>=20
> It prevents that because it acts as barrier() + OPTIMIZER_HIDE_VAR(b).
> I don=E2=80=99t see much value of using that since we can resolve the =
problem
> with OPTIMIZER_HIDE_VAR() alone.

Yeah, barrier_data generates more instructions.

>=20
> Regards,
> Boqun
>=20
>>>=20
>>> But it turns out that ptr_eq() is also a good tool to prevent the
>>> compiler from reordering loads in case where the comparison is
>>> done against a constant.
>>>=20
>>>>> CPU speculating the loads across the control dependency is not an
>>>>> issue.
>>>>>=20
>>>>> So am I tempted to keep examples that clearly state whether
>>>>> the issue is caused by compiler reordering instructions, or by
>>>>> CPU speculation.
>>>> Isn't it true that on strongly ordered CPUs, a compiler barrier is
>>>> sufficient to prevent the rcu_dereference() problem?  So the whole =
idea
>>>> behind ptr_eq() is that it prevents the problem on all CPUs.
>>>=20
>>> Correct. But given that we have ptr_eq(), it's good to show how it
>>> equally prevents the compiler from reordering address-dependent =
loads
>>> (comparison with constant) *and* prevents the compiler from using
>>> one pointer rather than the other (comparison between two =
non-constant
>>> pointers) which affects speculation on weakly-ordered CPUs.
>>>=20
>>>> You can make your examples as specific as you like, but the fact =
remains
>>>> that ptr_eq() is meant to prevent situations where both:
>>>> The compiler uses the wrong pointer for a load, and
>>>> The CPU performs the load earlier than you want.
>>>> If either one of those doesn't hold then the problem won't arise.
>>>=20
>>> Correct.
>>>=20
>>> Thanks,
>>>=20
>>> Mathieu
>>>=20
>>>=20
>>> --=20
>>> Mathieu Desnoyers
>>> EfficiOS Inc.
>>> https://www.efficios.com


