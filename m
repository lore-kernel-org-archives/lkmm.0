Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00696F2FA
	for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 19:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726775649; cv=none; b=rRlGFYjq2gcVZa2aaIuARgCvQ/C49XlzCoGhEyViLRHeUUcHaj0TxNUPS9FDQUohK/qKuIEl7Ddm+I7NezUMXTbJBDFkZ/h27JtkOez65K4uoO8iVJypos8F6T8WJ7UYKwgc2ut+cMMzDaGqHl4hfd/oTPQfczzgSwdE51HeSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726775649; c=relaxed/simple;
	bh=1i45zGSiRkJTX0/fszbZu3HyTUxbdJZTSv+ySSH3i+g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iFTDldElTlkAsSBJOS4uRsbI5wWar14DH2i3/9hHP1pGPcrJ2tgefZ6JksMpEzoyqAKH8GmS9fKgQG118Vn3aL1d0l2vC8IF5dvoC+brPTFqczB0LiqfcDyPyKAw1nH3ou5Ab9wGWz/P4olaxsGBptgHpd7MKVBMwglyRsLEd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNVnz3ez; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNVnz3ez"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2068bee21d8so14271705ad.2
        for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726775647; x=1727380447; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjXf6goRQFZ6Ws5IfZ8O0DYwX0AY16FeqqeJVmOvTGU=;
        b=mNVnz3ezUWAsJNRUPw9n6/7OJb+/4iLfZQfFeWKg5CmFSMzppUoYE9V1A4mc0N8pqL
         D8aUthHY8nIgxSrgF++IkMU1IH1wGKjpFlpKTUPMroxFJqLjuko3iE98AihEM60Z/suy
         x1J/wHzbVN3GqqtTRFItclIk5NKbejH9n7/ht2v+O7BNyruuZ65UP2TqIeOJ+iC0vmpL
         fzvWOpg6MyY2xBIr91W2ZrlFjfEh4ydebKo36MCR/WRz+0U0QFW57wB5ym4ckO8FJ35f
         vYOF+FSCKPU7+VQLn8VIsk80lGv5CoKIHun5n0eJDJGb/24Uzbr+7xLiaw19gfecahge
         jzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726775647; x=1727380447;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjXf6goRQFZ6Ws5IfZ8O0DYwX0AY16FeqqeJVmOvTGU=;
        b=HXU2Cb4aaL+CfJB1K0IpVBoBucC88osXmGDPZnGw1zgPK+5nXx5TFSkqA6cbYU52bB
         jvDzJ5FvQlK9b4tOzPB6PuGk2USi8cqxF2GVWDMKOHr8IzH/voSWdALTu+F0DcbLajL2
         7K84nX7dP3Ni5VLEAohVMzmGgBu9XzsmxOv/Z3CuC6A1L2hxN3I3Idrnnwi9Bu2VjR/i
         U+CnzDnPozCVv72IzaF88Q+juxeHODs/TwDUJF0C4E2bjiqTCsgM2gYFhsOj5AFulpc/
         doDbj4JYujbmUBcbanj8rMugOvYl/Tx/chOwa26am+PLRjQ6QKUGntImnpSNidivUPV5
         /RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbAAWL9azjmUuUtiXF6yux5Y+kb6DLiPpFyQdLtSkQeb3EsXVCtPdA5IDgdRjcomGq61cC@lists.linux.dev
X-Gm-Message-State: AOJu0YwMmsmnhTye5WvQoHc2PifuS/pAUunLwAkLI8j+juJjZA6E2s60
	vuWolA0oggsHVq8GlaXDoO5XsnI/jLmeMptAAcKBtuq05Xh6H8DF
X-Google-Smtp-Source: AGHT+IH5dS4oXN8alWlSTmhjhkU0PXFpBaA5QFKN5xumUpTYUgMD5V/GZ5nWIJx9cLBmoKfPt4ah3w==
X-Received: by 2002:a17:902:ce85:b0:206:cfb3:92e0 with SMTP id d9443c01a7336-208d8397c0emr6902295ad.17.1726775646983;
        Thu, 19 Sep 2024 12:54:06 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d19aasm83542725ad.127.2024.09.19.12.53.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2024 12:54:06 -0700 (PDT)
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
In-Reply-To: <Zux0Vyh38FK8OeJ4@boqun-archlinux>
Date: Fri, 20 Sep 2024 03:53:47 +0800
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
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
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Zqiang <qiang.zhang1211@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 maged.michael@gmail.com,
 Neeraj upadhyay <neeraj.upadhyay@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <09AD613C-97F2-4C60-8267-18E27909779F@gmail.com>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <CAJhGHyD8MzUssfuKSGnu1arnayNOyBnUA03vYB0WWwbE3WzoZg@mail.gmail.com>
 <ZuvOWM5c8tZotHFL@boqun-archlinux>
 <D2BDE4C4-48DB-4813-9608-F672896E0121@gmail.com>
 <Zux0Vyh38FK8OeJ4@boqun-archlinux>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)

2024=E5=B9=B49=E6=9C=8820=E6=97=A5 02:58=EF=BC=8CBoqun Feng =
<boqun.feng@gmail.com> wrote=EF=BC=9A
>=20
> On Thu, Sep 19, 2024 at 09:57:12PM +0800, Alan Huang wrote:
> [...]
>>>=20
>>> I think you're right. (Although the node will be eventually deleted =
at
>>> cleanup_hazptr_context(), however there could be a long-live
>>> hazptr_context). It should be:
>>>=20
>>> hazptr_t val =3D smp_load_acquire(&hzcp->slots[i]);
>>> struct hazptr_slot_snap *snap =3D &hzcp->snaps[i];
>>>=20
>>> if (val !=3D snap->slot) { // val changed, need to update the tree =
node.
>>> // Already in the tree, need to remove first.
>>> if (!is_null_or_unused(snap->slot)) {
>>> reader_del(tree, snap);
>>> }
>>>=20
>>> // use the latest snapshot.
>>> snap->slot =3D val;
>>>=20
>>> // Add it into tree if there is a reader
>>> if (!is_null_or_unused(val))
>>> reader_add(tree, snap);
>>> }
>>=20
>> It seems like that two different hazptr_context can=E2=80=99t be used =
to protect the same pointer?
>>=20
>> Otherwise the following can happen?
>>=20
>> thread1  thread2    thread3(worker)        thread4
>> hazptr_tryprotect(hzp1, ptr1)   hazptr_tryprotect(hzp2, ptr1)=20
>>  add ptr1 to tree
>=20
> Note that we have snapshot rb_node for each hazard pointer slot, so =
here
> thread3 actually would add two rb_nodes with ->slot =3D=3D ptr1 here.

Ok, good to know the rbtree can have multiple nodes with the same key.

Thanks for the explanation!

>=20
>> hazptr_clear(hzp1)=20
>> hazptr_tryprotect(hzp1, ptr2)=20
>>  delete ptr1 from tree     unpub ptr1
>=20
> Therefore, there is still one rb_node with ->slot =3D=3D ptr1 in the =
tree
> after the deletion, so updaters won't invoke ptr1's callback.
>=20
> Regards,
> Boqun
>=20
>>        call_hazptr(ptr1)
>>        oops: invoke ptr1's callback
>> Or am I missing something?
>>=20
>>>=20
>>> Regards,
>>> Boqun
>>>=20
>>>> I'm not so sure...
>>>>=20
>>>> Thanks
>>>> Lai


