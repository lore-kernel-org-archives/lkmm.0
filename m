Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13211EA85
	for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727561442; cv=none; b=L3pvY6J/175wZmQh7f2mQ34U0xO/pxPE4zuGCwY33fJ3jNXQ3N8hXsWJwZUVSivb9+IA8hA20GKzrltZPwd7Vw6oHIFTjjcbqRDFS4awoGOOg/AJ3dAFu/9FM9JduxlKKuRYyzY7LoCalOi0oxHVBcnJAM9Jos5DR5s3WaBGq6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727561442; c=relaxed/simple;
	bh=iFvrb/lmFsBDg2xcV9M9jcJjJV8Gn6DxXflBVHcwH94=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sqT6+Vh960fGugKDHUDjDB8BnfaukdRkeIqdIl9smHANH9hGs9nFF9iVGdue0tldK5xf35TOZcUVXLLjGySqU0UX9pz3pHH7kn7C2KMdOdlwR3pNZcnKeH2pFIL00VgMZbGdnwJvrggTTunUaC2flLV0oxHidB0eAOYUeHdcVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKBi5fmS; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKBi5fmS"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71b0722f221so2515440b3a.3
        for <lkmm@lists.linux.dev>; Sat, 28 Sep 2024 15:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727561440; x=1728166240; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqv6uZtvWgufJBQFjoO2lvT5jL4vVi5PDl7zOSvVCAI=;
        b=gKBi5fmSH57WSbE+PVMNOLQnLBi0M2NWRj7/Bnv2BEFHyt43ecmRum1it9zdgzlWsJ
         9eRR0efggTcy8Og1M74CYvZuy7phE4+0uu+Xu0vGITtLN6NlmpkYcYcQjjU6VSgeCUhl
         AkfGoM+S88rbXm0ZfyijO68jbSsJysP4K9lX/spU6Akcse29ua2FFe7EkLapR9WjPNyl
         P2KK/Bkz/xgmsUrb8IqedpDwvMwvC80ZgsyIw0mTyA6c8BYI3BUiveoMRU+s+bGy5f5U
         V+KMAngac+hWOYpT+MSYPMx/bR+fwcW6K5Qk7tONrF416DC/cXNM2kJnXCWsCua33qyk
         iQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727561440; x=1728166240;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqv6uZtvWgufJBQFjoO2lvT5jL4vVi5PDl7zOSvVCAI=;
        b=a1MTWSu5svvTl9psClSJpQ5BfwdthKuCSzd/Xi6Ngj/QSV4TLCeLU2Z/ppeR2a0Wlk
         oz/rvSG5WnRsLbZK12b/RsPd4NtxQOmP9yvy+1Flej3lePEPNk6qgihtEtklm/MvhZUM
         9NtwtxaqaD3FWOxDJ6l9xOAv9NMeabh+/QDDfO7UUedGxjxHsdpLGSHTGTfUFr5dVslM
         kZ7AYVTIDWLCaijpXz82GrtNXzl48z02XIpZol4DZ5xbykRUtqI2Dipj+HqxeWGRJrdG
         web6LNhk5W298gnelaPz8jXDkbdTYJG4fTROeIK4hHSrN+bHOL5khBSSV0ilH1lj05pU
         +KGw==
X-Forwarded-Encrypted: i=1; AJvYcCXou1ImUCtmMHrmWCCh3UEfh0HVNHX2ZPanXtq5b5LK2TDx76wWIY+MYZ+9H39WcA1Q0/l7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxup3/1tZ7RPHvmzDWsY2a6hXm5U8h3qMT9C+U1fmpqd9Cb4Bdd
	zAxn42TBP+haOxq5LRbeN3vLbM4bnfRuX0njbz9rEWfuk9F5ihXjYsyHUiaJ
X-Google-Smtp-Source: AGHT+IFhovJoNYleXxjXLz6aGvITgc6JOAD0PX6lEgltW3VQ1SR5GvjGyJEZPadxx0f45FlXPLeQ4g==
X-Received: by 2002:a05:6a21:a247:b0:1d5:10d7:2020 with SMTP id adf61e73a8af0-1d510d72090mr2118216637.41.1727561440019;
        Sat, 28 Sep 2024 15:10:40 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26538828sm3592306b3a.219.2024.09.28.15.10.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Sep 2024 15:10:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard
 pointers
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <4ed833df-54e6-454a-ab1a-73967cc51054@huaweicloud.com>
Date: Sun, 29 Sep 2024 06:10:21 +0800
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 RCU <rcu@vger.kernel.org>,
 linux-mm@kvack.org,
 lkmm@lists.linux.dev,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,
 Neeraj upadhyay <neeraj.upadhyay@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F741990-7A14-4528-9AF8-817007689B0A@gmail.com>
References: <ZvPp4taB9uu__oSQ@boqun-archlinux>
 <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
 <ZvP_H_R43bXpmkMS@boqun-archlinux>
 <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com>
 <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com>
 <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
 <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <bba2e656-4c3b-46db-b308-483de440b922@efficios.com>
 <ZvY2zBiluLkqRSkc@boqun-archlinux>
 <62508c1f-66ca-450d-abb6-236ca3b9096d@huaweicloud.com>
 <d86536d9-9c5a-48ab-abf3-3483e2e5e980@efficios.com>
 <4ed833df-54e6-454a-ab1a-73967cc51054@huaweicloud.com>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
X-Mailer: Apple Mail (2.3776.700.51)

2024=E5=B9=B49=E6=9C=8828=E6=97=A5 06:18=EF=BC=8CJonas Oberhauser =
<jonas.oberhauser@huaweicloud.com> wrote=EF=BC=9A
>=20
>=20
>=20
> Am 9/27/2024 um 10:10 PM schrieb Mathieu Desnoyers:
>> On 2024-09-27 21:23, Jonas Oberhauser wrote:
>> [...]
>>> That idea seems to be confirmed by this (atrocious, not to be =
copied!) example:
>>>=20
>>> int fct_escape_address_of_b(void)
>>> {
>>>      int *a, *b;
>>>=20
>>>      do {
>>>          a =3D READ_ONCE(p);
>>>          asm volatile ("" : : : "memory");
>>>          b =3D READ_ONCE(p);
>>>      } while (a !=3D b);
>>>=20
>>>      // really really hide b
>>>      int **p =3D &b;
>>>      OPTIMIZER_HIDE_VAR(p);
>>>=20
>>>      asm volatile ("" : : : "memory");
>>>      return *b;
>>> }
>>>=20
>>> This also does not generate any additional instructions, unlike just =
using OPTIMIZER_HIDE_VAR(b).
>>>=20
>>> What is the advantage of defining OPTIMIZE_HIDE_VAR the way it =
currently works instead of like above?
>> Did you try it on godbolt.org ? Does it have the intended effect ?
>=20
> I certainly did try and certainly read it as having the intended =
effect, otherwise I wouldn't have written that it seems confirmed.
>=20
> However, just because my eyes read it doesn't mean that's what =
happened, and even if it happened doesn't mean that it is guaranteed to =
happen.
>=20
>> By the looks of it, you're just creating another version of @b called
>> "p", which is then never used and would be discarded by further
>> optimization. >
>> I'm unsure what you are trying to achieve here.
>=20
> Simply put I'm trying to let the compiler think that I leaked the =
address of b. After that, the memory barrier should let it think that =
the b after the memory barrier might not be the same as the one before =
it (which was equal to a), forcing it to read from b.
>=20
> However, I suppose on second thought that that might not be enough, =
because the compiler could still simply do b =3D a right after exiting =
the while loop.
>=20
> And that is true no matter what we put behind the while loop or before =
the condition, as long as the condition compares a and b, right after it =
the compiler can do b =3D a. Just took me a while to see :))
>=20
> I'm not sure why gcc does the b=3Da with the normal OPTIMIZER_HIDE_VAR =
but (as far as I read the code) doesn't do it with the above. Maybe just =
a weird corner case...

Let the p to be a static variable out of the function will make a =
difference.

Or the following:
=09
	int **p =3D &b;
	barrier_data(p);

also works.

BTW, barrier_data(&b) generates more instructions than godbolt when =
build the kernel.

>=20
> Have fun,
>  jonas
>=20
>=20

