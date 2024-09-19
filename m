Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725241EA85
	for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762224; cv=none; b=Vfa+BRl97WiG0NhDPeTvp2LzKiSLFQ6W5PxcCvvHZUsLcscGyUyTPSWtvM/iX5daOTJErDrO+vyqTkHdeL0/75atalXcAhDJQ6lTKOAHyni5B023NlHt7MfodlgYfWCtq1LEOMr+CMU7XJBCjwELk0RWTePCELzv4EYN+Gn7YhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762224; c=relaxed/simple;
	bh=TeWxYNML4uZ1URMQu31Nx1o53ehLgcKlEXaVaXJx29k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cc1Uc/cdw+sVcn57Tuxzon69f3J/mAUFug3YSRqVQ0r+7l2iLDPVdYThfDNhwVjXO7iCvnIB8ArbGPVSkkQe2hnS7rVYctUUr5pNiaDugiIwOb1fP3naF8yfrQdtgacd5lwjYXTLoU1CElsReFYYP+Kn1ovQ9ZB6JsMWaBj+In8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLDPr8sV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLDPr8sV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2068acc8a4fso11579375ad.1
        for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762223; x=1727367023; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY/fGPKseiN5XtuGoO/dNcX3n8cZ54goexwrvXf3OMI=;
        b=DLDPr8sV8ne6Jsmuf0vFe2LjrFRgz+yOTME2J+Ohjwtzz8uK5XQr6JCxbg5NJdcvN9
         q1GMTmWiyItgUx+1O9gtN7NrLFFwNxJia5sJthAoliKAS2KSLJKWCSnPNQIXlS9dL1oz
         5Y3K5S3xsA58RHjKwciIt/IAk9//J7IzHwM8HxcOjEXF/9wZA9KjTK8x+KOU0oPTFZ6Q
         4nwgrcBNYy7+pyq3Z5C7vK6hGad+afxXC/e+ROuSR6qvpQbut7g1R7TzhZjmCi2vHNj3
         cbP3E3YAjTABQjRmVKIiTLVOShkO7z3agTgE724ssK2MmNw1zjN+/227Pz40QDiubXr9
         UF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762223; x=1727367023;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY/fGPKseiN5XtuGoO/dNcX3n8cZ54goexwrvXf3OMI=;
        b=bBpnmQdfJX+ySBWT2ojVjFzXpywjxRZC3DeTUMo6pTBIvWAWhuhoVI+UwNdS92RAaI
         SIw4uTnEThV4GLF7YE/D/1RPtyHeLD1LtR/G9qMY9BFnXJKpC1CAsHfLkS+quycr8Db4
         6m5WRC0dwzXqlfHe8u0L9WPHlu6UgLC3NCnWHwFLhFv8SyxKqN1huvvphaaZYrVMADqN
         YqAzR9D90d1mcE2a0jgeMyN282NBgoHsZXTERmv30bJNImbYpe+Dc7tVY2Ss2YWZAh7k
         owP2+P9oYTQGKSiVbX15ChM1JFcGbYG6w2AddEqUPOOpc3+ZXOKFFzIXMVZYeEqf3oUZ
         /eHA==
X-Forwarded-Encrypted: i=1; AJvYcCUL6lGQH/2e5BLCseGSw07v+Pgy0IG6nGHYAL9HDFwoChlTs8d5j/MoYr2DryB5xSzlrkDR@lists.linux.dev
X-Gm-Message-State: AOJu0YyfqbDH0DdjkhkjegfJj51qfw0IUcXtFX1Mct671gsXCHo+3qhN
	Wy8Djxci1rKkOCJo7dgl5qD4oiUVsyMzcE7adgyztVv+uSm11XG8
X-Google-Smtp-Source: AGHT+IE63MOrtSDNRE1puuTOcxVEkzUx9edmw7szWrDYdYgkMNwLAGdFxq+KU06AHJcAn9dSKTtEfw==
X-Received: by 2002:a17:902:ea09:b0:206:9399:5dd7 with SMTP id d9443c01a7336-20782c16174mr330479015ad.56.1726762222437;
        Thu, 19 Sep 2024 09:10:22 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d17fbsm81702445ad.152.2024.09.19.09.10.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2024 09:10:21 -0700 (PDT)
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
In-Reply-To: <ZuvOWM5c8tZotHFL@boqun-archlinux>
Date: Fri, 20 Sep 2024 00:10:03 +0800
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
Message-Id: <28F2EAFF-1DF6-41EC-9DFC-3B437D67D840@gmail.com>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <CAJhGHyD8MzUssfuKSGnu1arnayNOyBnUA03vYB0WWwbE3WzoZg@mail.gmail.com>
 <ZuvOWM5c8tZotHFL@boqun-archlinux>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3776.700.51)

2024=E5=B9=B49=E6=9C=8819=E6=97=A5 15:10=EF=BC=8CBoqun Feng =
<boqun.feng@gmail.com> wrote=EF=BC=9A
>=20
> On Thu, Sep 19, 2024 at 02:39:13PM +0800, Lai Jiangshan wrote:
>> On Tue, Sep 17, 2024 at 10:34=E2=80=AFPM Boqun Feng =
<boqun.feng@gmail.com> wrote:
>>=20
>>> +static void hazptr_context_snap_readers_locked(struct =
hazptr_reader_tree *tree,
>>> +                                              struct hazptr_context =
*hzcp)
>>> +{
>>> +       lockdep_assert_held(hzcp->lock);
>>> +
>>> +       for (int i =3D 0; i < HAZPTR_SLOT_PER_CTX; i++) {
>>> +               /*
>>> +                * Pairs with smp_store_release() in =
hazptr_{clear,free}().
>>> +                *
>>> +                * Ensure
>>> +                *
>>> +                * <reader>             <updater>
>>> +                *
>>> +                * [access protected pointers]
>>> +                * hazptr_clear();
>>> +                *   smp_store_release()
>>> +                *                      // in reader scan.
>>> +                *                      smp_load_acquire(); // is =
null or unused.
>>> +                *                      [run callbacks] // all =
accesses from
>>> +                *                                      // reader =
must be
>>> +                *                                      // observed.
>>> +                */
>>> +               hazptr_t val =3D smp_load_acquire(&hzcp->slots[i]);
>>> +
>>> +               if (!is_null_or_unused(val)) {
>>> +                       struct hazptr_slot_snap *snap =3D =
&hzcp->snaps[i];
>>> +
>>> +                       // Already in the tree, need to remove =
first.
>>> +                       if (!is_null_or_unused(snap->slot)) {
>>> +                               reader_del(tree, snap);
>>> +                       }
>>> +                       snap->slot =3D val;
>>> +                       reader_add(tree, snap);
>>> +               }
>>> +       }
>>> +}
>>=20
>> Hello
>>=20
>> I'm curious about whether there are any possible memory leaks here.
>>=20
>> It seems that call_hazptr() never frees the memory until the slot is
>> set to another valid value.
>>=20
>> In the code here, the snap is not deleted when hzcp->snaps[i] is =
null/unused
>> and snap->slot is not which I think it should be.
>>=20
>> And it can cause unneeded deletion and addition of the snap if the =
slot
>> value is unchanged.
>>=20
>=20
> I think you're right. (Although the node will be eventually deleted at
> cleanup_hazptr_context(), however there could be a long-live
> hazptr_context). It should be:
>=20
> hazptr_t val =3D smp_load_acquire(&hzcp->slots[i]);
> struct hazptr_slot_snap *snap =3D &hzcp->snaps[i];
>=20
> if (val !=3D snap->slot) { // val changed, need to update the tree =
node.
> // Already in the tree, need to remove first.
> if (!is_null_or_unused(snap->slot)) {
> reader_del(tree, snap);
> }
>=20
> // use the latest snapshot.
> snap->slot =3D val;
>=20
> // Add it into tree if there is a reader
> if (!is_null_or_unused(val))
> reader_add(tree, snap);
> }

Even using the same context, if two slots are used to protect the same =
pointer, let it be ptr1,
then if the second slot is reused for ptr2, ptr1=E2=80=99s callback will =
be invoked even the first slot still has the ptr1.

The original patch also has this problem.

>=20
> Regards,
> Boqun
>=20
>> I'm not so sure...
>>=20
>> Thanks
>> Lai


