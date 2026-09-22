Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A44E73C5
	for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070981; cv=pass; b=URWoS0f89CMjd4WuWZxtOniv3slHaZB28OJI3RNHieAz7HMrkf3aP6pe97PiMzn4kvHjjjKwoWghQnw23fMrLAFtfVPecYUTn/ye+neCO+iQdlvI6I/ErdesdFQb0l8ZoQc+8PCW9IoVwmieu+qEggIT/Zci+RLffrrkqYuNpKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070981; c=relaxed/simple;
	bh=xCgswTJ/xMHw1lRSMwJ1pqZUnBBu1pooak+t1aa0pNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a414oGeHBJbCk7XlcfBOwYmYSOO6xpwtO5wsn+Y7Z8elsQ2iYGLKC0Lne3rKKZPEoWg87oVV8pavCfy822GSF8ckkjHG2KH4yLOBtZq/YZhT2RU9jZq798ixx4oof0RHQwBn6cVpwwJmf82MAq4zwyijVteTbCJzfzSjGTy4LIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BF68gJeE; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BF68gJeE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so26823215e9.1
        for <lkmm@lists.linux.dev>; Tue, 22 Sep 2026 02:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790070975; cv=none;
        d=google.com; s=arc-20260327;
        b=GRGKrAENUn/8dq00Pht/WWamVT7KR0Nk5iTz/gcI6iS2Byu0kodBwnT7qahBfpfapq
         Uuks9BxpdlflmhSliVycH0hE5FAOsF2Cr0AF67Wq4T0CCu225ajIwAa6IQrbg8J1QCG8
         rBW7abMPpAvn8ebIfCREgzuPKFZGvefFJBYMqApfg4DrQK/JG4iJbzp5bN0Yj0mtVDHN
         0s2IPpixpDA70dgk3MT67YAW+ooaODdNrvA3gM3t2JqUeoAiUZuDj974pG4f1MnYjgQG
         4InTMlSFOGhlN+7J5FlzD9cWgazglGNMqoxrPzV91PH7y0YWwcvsAKj9u+qSJvE0BB3T
         ChCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        fh=55PhjZFKEmF8U53jka4iIhNqSD9NJHbvaVXY62E2VPs=;
        b=qMrJE63zp7JrNvZrhx02aaXoPwYniOSXNUnRgpLl1yGwpGp9wppjKzgcpwDLfcrCo2
         HljW3y5vR3f/B0Hq9FRH6Btgph05K22fyUjURB7Dotw2/qDUUn/FO0JwLCkKY0659yGV
         ilewiJqjCOVT5bEJUXtL4jFn1yRB5aZ0hGIiW0AWxYpvkpsoAFjW728YCZv8T5PK76eX
         iBv7uxH7x8yBlJ5FALuWnoRF9bIcV6T8bvgVBgiNN9vff4yBw4EhcnZJYw6ZFvUrLOGH
         kguWyLAQF8aAGMMbNivUMvXmz8YbQCWTSL2ezUJaZ1mirMC0GwTZ9UGscFml7V4GN+ev
         SCJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790070975; x=1790675775; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=BF68gJeED2ngY+/UT80mjDrhZgJUCc+tqZ/lAJuEQUCoVob79snbL2SuU46g1G8Tak
         MR05sRkIw8ddljLdcTZRM+tBRvSbEwelomB9kpnPENRIudCAnyLYYTImj0sjAylfjv08
         4pKBe/eg7jj0z0BSYLgcEBh7Ibegs7bhKrEYh0Bf8+3Zp6vUK//iPYRVdlAF9FzXeird
         lZDC2jy/mjI2H8EN/bVmhEPuiMevMdZzc14ufmOi+O4PmgD2aqv+doZ3VIJD4Iz8cQ0L
         4bJjuuzwDGBErMUqaa+L8Si5W3yBWeGI1doP4T+YruSimnqzr0vodANpjsPyL5R4ElS+
         1waA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070975; x=1790675775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mpmxz+siGJavhOivfMHQvVZY8OjM6RnPvSbr/e5q99c=;
        b=odptFYwLIYtj8t3sP47B+pCYOPOt4Eur0iP2crkF+FMGNN0/ZiQvOqrnJ8pcn+if2O
         m5Io1BBhffxp2Hya645SlEZY5JLFjQj9SYTkG4xIsAyv6EVc/jrtBy62u9sqWVJ6EahT
         X+NjZM3TOd5hjQ7HuWvO+Nk/ndmYWfzpHwsJjaGsuqbfVkGXm+ZNIgqGLA1igdUQLVpG
         OyYz4OiCQJM5IIlMceIT6OAG+AqAQyynrhmcoPmvNDVXo/9abm155e42D9o5d5K4q4iR
         1h7Pdy10i73Vg94l/bBwiRow34csWZH2xjhlg9prQTTOp2b15JuszwfcODAzykYCnAPi
         ld2w==
X-Forwarded-Encrypted: i=1; AKwUvBwzVYSkcrk3ntjDpmi8kwGUrpiytGho0DDy/g6jQRzDuZiekFJEd5aHva4UY2UHZOVvx8lA@lists.linux.dev
X-Gm-Message-State: AFuF++k83FkguaH3HaO2bxu0jpTVbW3Tl53ji/rzn2BPf/ZZhES/ysZc
	Kw9P8yoOTuMKaL9iAzp4dUS08qyyA8dAK4S5pAb3S84uMgd86I4m4ldEpt5MjuEpnkJ0lSgN12T
	vNoiZ2Z1qtocTygpkbmgeWRDrWMKS09k=
X-Gm-Gg: AYBFou2G+AxHgJiv28sv8VOESbxTbMh6Md+anTrEmTUTVGuNv0IxhsQOZV3KqlG9Aw0
	QBHJ2ceUJszMBpYngP8GoA3x+cSestXJygUsZcIH0xFJlna0ZvsCctkErfyXSbnTB7ln5gY88z6
	T1dCehnIBF52keCAokiTtP/4nHAAw+Ui2cRmupCZvXiW4jTa5GBbZ74VZVjtWirJGf+kz5AmMqf
	F3Aku93jK/4Vx0EHjJdUKXu7BKYqO16PVLgkfizg7+QJzeTldB79O1MVvdmPkCZHR3y9M7pD8fI
	MvTD4X4TLe31HqUxZNsggixtxLqo8b+gWY+JJj/2Q73Os8ETyDpAy9cg6uipFJarudvqgKQIyFi
	DxWj2YyEDj3RmEg==
X-Received: by 2002:a05:600c:34c1:b0:49e:799a:8951 with SMTP id
 5b1f17b1804b1-49fc56aba0dmr207997635e9.11.1790070974214; Tue, 22 Sep 2026
 02:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922070950.4173245-1-kunwu.chan@gmail.com> <arIyx4BaA2eArvYM@MacBook-0RXW5>
In-Reply-To: <arIyx4BaA2eArvYM@MacBook-0RXW5>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 22 Sep 2026 17:55:57 +0800
X-Gm-Features: AcwNN1WuirzzkFb6JjmLl9oXFf7utj_0mv7EZ3p-lcOEdTyD2DTvMQxEs2mG2t0
Message-ID: <CAN_Opa_kZ1bwgVw5k9E2KkLkK1WP3+J_=n8GW2m83zZMwXVEYQ@mail.gmail.com>
Subject: Re: [RFC/WIP PATCH 0/4] hazptr: add shared scan path and lockdep use case
To: Boqun Feng <boqun@kernel.org>
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org, 
	peterz@infradead.org, npiggin@gmail.com, dhowells@redhat.com, 
	j.alglave@ucl.ac.uk, luc.maranget@inria.fr, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, dave@stgolabs.net, josh@joshtriplett.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, urezki@gmail.com, 
	akiyks@gmail.com, dlustig@nvidia.com, joelagnelf@nvidia.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, longman@redhat.com, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	qiang.zhang@linux.dev, include@grrlz.net, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:48=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
>
> On Tue, Sep 22, 2026 at 03:09:46PM +0800, Kunwu Chan wrote:
> > Hi all,
> >
>
> Hello Kunwu,
>
> > This RFC/WIP extends the current v3 hazptr implementation [1] and
> > adapts the lockdep use case from Boqun Feng's earlier hazptr series [2]
> > to the current hazptr API.
> >
> > [1] https://lore.kernel.org/all/20260919000056.3132131-26-paulmck@kerne=
l.org/
> > [2] https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmai=
l.com/
> >
> > The lockdep conversion replaces the expedited RCU wait in
> > lockdep_unregister_key() with hazptr_synchronize() for dynamic-key
> > lookups.
> >
> > The series also adds a shared-scan kthread for concurrent
> > hazptr_synchronize() callers, rcuscale support, and an LKMM test
> > for the acquire-before-scan ordering.
> >
>
> Thanks a lot for picking up this, much appreciated.
>
> Do you happen to play a bit with rcuscale and see any performance
> difference between hazptr_synchronize() vs synchronize_{s}rcu() on
> various configs?
>
> > I tested the lockdep path on a 96-CPU ARM64 KVM guest with Boqun's
> > original mq workload [2]. With a multiqueue virtio-net device
> > (`-device virtio-net-pci,mq=3Don,vectors=3D6`), tc mq add/del x100
> > completed in 850 ms with hazptr and 860 ms with expedited RCU.
> > The rmmod workload similarly showed no measurable difference
> > (1360 ms vs. 1380 ms over 10 runs). There were no crashes or hangs
> > in these tests.
> >
>
> You could also use /proc/interrupts to measure the IPI counts during the
> whole operation, and you should be able to see the difference there.

Hi Boqun,

Thanks for the suggestions.

I collected both the rcuscale synchronization latency and the
/proc/interrupts IPI counts from the current implementation.

On a 96-CPU ARM64 KVM guest, the rcuscale results with
nreaders=3D0 are:

                avg       p50       p90       p99
nwriters=3D1:
hazptr          98 us     96 us     101 us    110 us
rcu             8.4 ms    8.0 ms     8.0 ms   16.0 ms
srcu            8.0 ms   15.9 ms    16.0 ms   16.0 ms

nwriters=3D16:
hazptr          8.0 ms    8.0 ms     8.0 ms    8.1 ms
rcu            14.9 ms   16.0 ms    16.0 ms   24.0 ms

With a single writer, hazptr completes in ~100 us. With 16
concurrent synchronizers, the latency approaches ~8 ms, while
RCU rises from ~8 ms to ~15 ms. The shared-scan batching
appears to be effective here, while the scan-kthread polling
mechanism has a significant impact on the completion latency
once multiple waiters are present. This also motivates the
Bloom-filter redesign you suggested.

For the lockdep workload (tc qdisc mq x100):

                wall-clock    IPI/op
hazptr          ~810 ms        5.1
exp RCU         ~790 ms       12.3

The hazptr path shows substantially lower IPI activity on this
workload (~41% of expedited RCU), though the wall-clock time is
similar. The lower IPI activity does not translate into a
measurable wall-clock improvement in this workload.

I'll update the shared-scan design based on your Bloom-filter
suggestion, make the rcuscale target cover multiple objects,
and add the forced-slowpath debug option. I'll then rerun
the measurements with the updated implementation.

Thanks,
Kunwu

>
> Regards,
> Boqun
>
> > This is still RFC/WIP. I would appreciate feedback on the shared-scan
> > design and the lockdep conversion.
> >
> > Kunwu Chan (4):
> >   hazptr: add shared-scan kthread
> >   locking/lockdep: use hazptr to wait for dynamic key lookups
> >   rcuscale: add hazptr scale type
> >   Documentation/litmus-tests: add hazptr acquire-before-scan test
> >
> >  .../hazptr/hazptr-acquire-before-scan.litmus  |  49 ++++
> >  kernel/hazptr.c                               | 274 ++++++++++++++++++
> >  kernel/locking/lockdep.c                      |  30 +-
> >  kernel/rcu/rcuscale.c                         |  65 ++++-
> >  4 files changed, 407 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/litmus-tests/hazptr/hazptr-acquire-be=
fore-scan.litmus
> >
> > --
> > 2.43.0
> >
