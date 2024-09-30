Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EA51865F1
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727687734; cv=none; b=hKzG76b9YQBFM+PQoubUQcrfN0XDWBbgol0qvyY4gqVgYCwd6A9K0kgYOGr8qef+fYNVwl8WU9cq+chsKDCtJOR793uAf1Ic1SnNmXLhs0VjW4XnL5yraC622umkZs8YzksSqxz5cW6Uheamit4gdS3YISea8RFJRXWCSMFZOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727687734; c=relaxed/simple;
	bh=BDDpZBhfv3Jn9H/6bzLKxCR0/WFuWsatw0oW98n/peQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=evod+/uiwNyGmIpy/I5GCpdczzVogh4m2CyCmPyGOfmTKU2i43Yc+6ypZ2Bea3IrNwgn76jYjxECC1vuvPRD0VDRHJ792y1mloJqw2vwyfZgdlj11ryUgwOMv+qJ8d0SbrZfeR/JMRsLyep20IE+0I2GNAg1f+S3gMaAHOre66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKZJJBfj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKZJJBfj"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db299608e7so2557358a12.1
        for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727687732; x=1728292532; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R504Vt0ci9sSs5hDFIgMgmgRSMuxflw8Qv5wpi5Jf4U=;
        b=OKZJJBfjIPI2GgvkfOjBq+/HmsAqTsmYfjN4Vj9rGreWSq9xQKkc/56tlsC11t3aJC
         Z9GfpqS1U8aItwsRZgwYC/yF5+7Jv/m/nf6aXSiBdag9jEnNcGKRkhzpyHKFiig5Nwg1
         0okODP0AOsvUIpBjhgU6XdbmSa3vllh/vKrecKpjfNtZDaBgYaTp0bDh3Uv3Jva67wWW
         gHhEo8Es6x2NIhjyoR2QehzZvOoTnJCpTLSOmj1Qew/G+iOkclb0sp24zW06KHGP4HHB
         ZN+wVDajQYweXVLMgGd00v7f3xMwNvkox45Ju3psRieGJ+6ZooqF5eqS2dqboCZSEXKW
         /W7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727687732; x=1728292532;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R504Vt0ci9sSs5hDFIgMgmgRSMuxflw8Qv5wpi5Jf4U=;
        b=jbp3Ibnqs3IAm/FjwARt6k6Lw7mtD1VoWAxy3/CxY4tgY7Wi0SO7ZfaEB6t0MmubMR
         MnrL3iyO8CSdl8uaev6AnEuIUNkzDDCKKFAwHFAAy1mTdBjUTPKECvOBk9ccFrS7A2sI
         WyZTSolqH9gKenyANEfhXIZ7hbYOVlOA29qmC3NkXXTpCKaSqlEX9khDxjDbaaiVSTnq
         9SctDpmFpiz4dAId5yXResg/Kl716JAbW0++TLchoXo58MyO/LCm/vB8ZPVBghM57O2Q
         DmuOyJsxPCnNJKkUxXTZCcn9zdZfkAz6oW0hRwcm8FrttqNMuanGjDZweZC346vN1DOF
         /a6g==
X-Forwarded-Encrypted: i=1; AJvYcCV3ocHx1vPdFrgAOV6ruVg+W6JdBFCLjH1PcysaRQtvce5f0INtGK8Ang+73A94Qak1Q40R@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5bvKyoOfb4SFYFVllSELXg7zqVfuKuz8FivALTDKyyZ5bK+bl
	YU3u4CVoRFoWyj5PsHcPv+lZU2cFLWmUR6WvggwuCyRHdvQS3Lnu
X-Google-Smtp-Source: AGHT+IEye/2jxywunUzGiWYx+lzoY43g0ARL44Gt8Lgn3tnjajGuJZFxsxmzrRLv9R5VuNJiNRPfrg==
X-Received: by 2002:a05:6a20:c704:b0:1cf:2988:c34c with SMTP id adf61e73a8af0-1d4fa6c77ecmr16362116637.22.1727687731944;
        Mon, 30 Sep 2024 02:15:31 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264d7286sm5962229b3a.93.2024.09.30.02.15.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:15:31 -0700 (PDT)
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
In-Reply-To: <8d20cf79-9fa5-4ced-aa91-232ccd545b59@huaweicloud.com>
Date: Mon, 30 Sep 2024 17:15:19 +0800
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 John Stultz <jstultz@google.com>,
 Neeraj upadhyay <Neeraj.Upadhyay@amd.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
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
 RCU <rcu@vger.kernel.org>,
 linux-mm@kvack.org,
 lkmm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <EEAE4623-DCD7-4BBE-8E06-7F6FF6E3070B@gmail.com>
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>
 <d2c87672-af75-4210-bd96-d7f38f2f63ac@rowland.harvard.edu>
 <d49f5d9f-559d-449b-b330-9e5a57d9b438@efficios.com>
 <D31AF4E7-B9D5-4D2F-A4B9-1E12B5E69549@gmail.com>
 <8d20cf79-9fa5-4ced-aa91-232ccd545b59@huaweicloud.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
X-Mailer: Apple Mail (2.3776.700.51)

2024=E5=B9=B49=E6=9C=8830=E6=97=A5 16:57=EF=BC=8CJonas Oberhauser =
<jonas.oberhauser@huaweicloud.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
> Am 9/29/2024 um 12:26 AM schrieb Alan Huang:
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
>>>>>>>    on @a before loading @a.
>>>>>>> - If @b is a register populated by a prior load, weakly-ordered
>>>>>>>    CPUs can speculate loads which depend on @a before loading =
@a.
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
>> barrier_data(&b) prevents that.
>=20
> I don't think one barrier_data can garantuee preventing this, because =
right after doing the comparison, the compiler still could do b=3Da.
>=20
> In that case you would be guaranteed to use the value in b, but that =
value is not the value loaded into b originally but rather the value =
loaded into a, and hence your address dependency goes to the wrong load =
still.

After barrier_data(&b), *b will be loaded from memory, you mean even if =
*b is loaded from memory, the address dependency goes to the wrong load =
still?

>=20
> However, doing
>=20
> barrier_data(&b);
> if (a =3D=3D b) {
>   barrier();
>   foo(*b);
> }
>=20
> might maybe prevent it, because after the address of b is escaped, the =
compiler might no longer be allowed to just do b=3Da;, but I'm not sure =
if that is completely correct, since the compiler knows b=3D=3Da and no =
other thread can be concurrently modifying a or b. Therefore, given that =
the compiler knows the hardware, it might know that assigning b=3Da =
would not cause any  race-related issues even if another thread was =
reading b concurrently.
>=20
> Finally, it may be only a combination of barrier_data and making b =
volatile could be guaranteed to solve the issue, but the code will be =
very obscure compared to using ptr_eq.
>=20
>  jonas


