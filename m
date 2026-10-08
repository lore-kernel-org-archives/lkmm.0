Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63133122A
	for <lkmm@lists.linux.dev>; Thu,  8 Oct 2026 04:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432962; cv=pass; b=Uj7D9M5gLVUfVbcAPDw309lgjKjfY6Z49/0Kvg0rENniHo/8qCsptPX04LupyeAayuRrOOFHbsDV3GXLxhdCUuICgaKO0dZuIfTQdXf0kRaNtbXxEv47XyBr3bbKYzUNooWirlgzGCCiXSN3KMi9pWRP4lmpte5vPJq6BQnIVgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432962; c=relaxed/simple;
	bh=uyN5KVBgznyWy3+95mvnt5gqK/qRzApqBIr4yF3bC1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4YoQPwaLzQH/7S8vMmw4ra2n93btNhDvSfaOE2ixmcWATmHKP9HHFGPxjWn/Y1hi9wumUS/JBuJU3+tjBx7ouUikPUbnUixFon7AVRP8DduPZLWrG49bJSLIvRqgoXpdjyEkRm3cNj+qubK+r5Ll34Rj0GH6rDkUZ1cTRK362g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWcPZKTT; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWcPZKTT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so18614865e9.3
        for <lkmm@lists.linux.dev>; Wed, 07 Oct 2026 21:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432959; cv=none;
        d=google.com; s=arc-20260327;
        b=pBnbLbahBQHFInrOzfIVbztTRmBQ9d/ui3w3n2yhvZX33qPi8dHUbQ1sQqrLKzYjAD
         8m22YM/7yeXIvZIziXEHdgdp/F7a15vtCJzrGoEJWEZl+UIu0YGZp5W1h7ogHyFKy6kG
         K9vwXzaTapOHVaB2uTyG6zWwx9Z+teVqPSQZtIEhUKOQSOGeo2p8ergu2gUFJNdndZU1
         cvEWcV0vgup6e/BLHOywp9tvwHWUJppBxkOsZFE+4A3lDTbfWu2nT7uen/36nkfliCi3
         hlvd9rTcgg8SIM2lz6p3R1RRLMfiedcJi2/DyhAsF6QEJEDFEXGBsDQUeH6oIhapTbGl
         5QZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        fh=NmL7D78ne2EO9hZyBcVsXZWtMXLk5UqTTnrbqXw0YZk=;
        b=SZFvbagCCwco5njw3QBn2+MTud/wKI6FqdSRBHXpWc9gxFvSDWzbT2Xd5BTvxyCVMb
         tGm98Y95XDoz3pyblmQo1H5Ij0RiMvKWp8QL+eVcEKaSbdtYdiVba3Hd48o0NfwvIdG9
         XlZg81L8t0GphAGZKBGm2Nx0BjrJgM37gFkv4lju3bCrvbTizHeF/2f+SPoivspYdL0A
         XOszGCYoJ8d60VckkLkp9UIOgbLSiGpJW7AtWKsrxQHfVRFCvCo7fqrBKm2FjWa/lVTY
         I61fSmsUhpVwH89165MRi00jVVda5TLv3LywmwABKKwclqBizIhI0/GzxYrQA6cJSdNf
         eobw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432959; x=1792037759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        b=nWcPZKTTDBYP1HR31f7He2Gyw7GARz3XaJUmuyG6i2VEEsvpSH1m9Q8GsVNX+9kKlP
         V17SuhEDmr5xEHvD9D9Az2L5Dw6T7eL9iiA7gMrupMDEmyN4snF8sJe97vG/4Pz0l+jt
         6p7aWPCinN3IMkeguUWL4GridA6EW7hJqeBmrWid7IBC4EJCgy1MRI20pA2CRmQUekZB
         bihMB/6dYDJuHrPPrBuOUZsZcygAfzRkEg3V/pqWD1Pbk+zu0Vja2ztRvqGiDAPZk4t3
         MJuINieR0y4ptoiMI8NVUyWrXhuZx6SWwZF709dkQY1P1MPxQbtK40P6c0Jo1t6pF9eB
         URAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432959; x=1792037759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Z9vpPdznmiH/NLpVMrj1ax6vHKxHJY2iMpBJAfxMIw=;
        b=N+7/UZm26axEgySjqFmr52C1cbgYbBhTpKYZkWY7ZAnUvFKqQRjHnr+2DIxw3IHjuJ
         BBCPAL/5sewPipaTAHFjI0R96av+fRflen/74mQMiujDAfnfRN3ms1E/7Skoh8gqcB0A
         NspwekEinKtKiY4F8B4UcnYO2wa5HwtMBKcCnqJfMkEYCoywnxGubG7PtvSdha8T9oA7
         cFMmn3k37ncgUdwJhCOvItj1ByJEtacLTs1ODqmLRmFjTERoC0DhOiqahpeDVQpVb82M
         RW/dV8LZBcNDWNX9TiyXSSdGAcGXiEPqh13kOFmvYWaS0KhFQ+pdFa7c4hx+lA9VpI7f
         rPJw==
X-Forwarded-Encrypted: i=1; AKwUvBwlyFqR5qXK3uBqQAqcJghr/gfme2BojqzQ39b0w1HoABZIGpuEpc87LRPGepckgauHWP4r@lists.linux.dev
X-Gm-Message-State: AFuF++lv+mI+Yu58Wya+jY2kWJFLCT7Lph27AAOBFJk1WzsowSYySLVA
	0wxR18i99UJ6KU6+LaEkpJvbWCvlZRiFnvK23e3hmsVVqo6VlUyPpRrswbNgNr0qk2V7AwfVeCc
	jpRyP55G+5JjSTzskbP+IkuVIb5XoVzQ=
X-Gm-Gg: AYBFou1wqE6ezD2005AI6OSNw/6GXo5idUH73eFykiT4Zvy1M7rPoVCp93sPp6z2DRX
	Be+p6o2kg8EsT6DC+5raQATzVs3bb8+BTq6HkhbkhldUSlB01f5b+loAGQelBgLVSAVlNegmqZ1
	Nms2JobVO7vE6YOVDX279f4HU5s3XZ8cW+s6ZUr9cVqX5gNKaQLeV8CizMtQufJDVlaSQ8Y0D4q
	eqXrpCREx1vfatsqvhn//VrDApZqpOth30pvJYttVMG++9GKr+1qjNLsOcB/UwrjR71mgB1wCiD
	xlZ2OtnaUGazdtG1pqM8iuwztSQaVXT3/M8rSIggtycB7+hfsrUxqM4xmoKgX+0iW/k=
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id
 5b1f17b1804b1-4a180648d69mr75524555e9.24.1791432959029; Wed, 07 Oct 2026
 21:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1f885062-4905-4d9c-9293-615c145d2d6b@paulmck-laptop>
 <5b5dbb90-69ad-4a8f-8583-f5ba162744d3@efficios.com> <631c13bc-671e-4cf3-b466-0408d7600ab2@paulmck-laptop>
 <CAN_Opa_a5MbG_50DTg=Eu_f5X_ZiYUdyzVGiAzHGhP__xDpxnw@mail.gmail.com> <a411c4d9-2a38-4a9d-bf8f-66f9c50394a1@paulmck-laptop>
In-Reply-To: <a411c4d9-2a38-4a9d-bf8f-66f9c50394a1@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 8 Oct 2026 12:15:47 +0800
X-Gm-Features: AclHuK-UiUNRD4-4EumGZ1XisAVtmg1Wf7lczZKX9L8XbPbOf9tl0FJZhAAX5LM
Message-ID: <CAN_Opa_KMtSmFyvLvB2pRb9YQLL0N8sNw4z_DVNThNViDuyaCw@mail.gmail.com>
Subject: Re: [BUG] Splat during modest hazptrtorture run
To: paulmck@kernel.org
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun@kernel.org>, 
	Wang Lian <lianux.mm@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Bradley Morgan <brads@mainlining.org>, rcu@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 11:53=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Oct 08, 2026 at 09:39:50AM +0800, KunWu Chan wrote:
> > On Wed, Oct 7, 2026 at 11:59=E2=80=AFPM Paul E. McKenney <paulmck@kerne=
l.org> wrote:
> > >
> > > On Wed, Oct 07, 2026 at 03:09:27AM -0400, Mathieu Desnoyers wrote:
> > > > On 2026-10-06 19:40, Paul E. McKenney wrote:
> > > > > Hello!
> > > > >
> > > > > This is all new code, so the bug could be anywhere.  So you all n=
eed
> > > > > to know.  ;-)
>
> TL;DR: Adding the first patch in Mathieu's four-patch series cures this
> for me.
>
> > > > > I got this from the NOPREEMPT variant of hazptr during a nominal
> > > > > "--duration 60" run of torture.sh on x86 with the guest OS split =
across
> > > > > two NUMA nodes:
> > > > >
> > > > > [  137.765104] WARNING: kernel/rcu/hazptrtorture.c:658 at hazptr_=
torture_stats_print+0x25b/0x4f0, CPU#1: hazptr_torture_/136
> > > > > [  137.768647] Modules linked in:
> > > > > [  137.768891] CPU: 1 UID: 0 PID: 136 Comm: hazptr_torture_ Not t=
ainted 7.3.0-rc5-00661-ga1f1e4890d1d-dirty #193 PREEMPTLAZY
> > > > > [  137.769683] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)=
, BIOS 1.16.3-6.el9 11/05/2023
> > > > > [  137.770319] RIP: 0010:hazptr_torture_stats_print+0x25b/0x4f0
> > > > > [  137.770735] Code: 48 83 c4 20 e8 86 44 fe ff 41 83 fd 01 7e 23=
 48 c7 c6 6e 85 17 b0 48 c7 c7 db 27 17 b0 e8 6d 44 fe ff f0 ff 05 76 6e 0a=
 02 90 <0f> 0b 90 4c 8b 64 24 70 48 c7 c7 73 85 17 b0 e8 51 44 fe ff 48 8b
> > > > > [  137.772061] RSP: 0018:ffffa738004ffdf0 EFLAGS: 00010202
> > > > > [  137.772435] RAX: 0000000000000004 RBX: ffffa738004ffe08 RCX: 0=
000000000000027
> > > > > [  137.772950] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000001
> > > > > [  137.773455] RBP: ffffa738004ffe60 R08: 4000000000001236 R09: f=
fffffffb01727df
> > > > > [  137.773980] R10: 0000000020212121 R11: 0000000020212121 R12: 0=
000000000000000
> > > > > [  137.774479] R13: 0000000000000002 R14: 000000000002ffd6 R15: 0=
000000000034f03
> > > > > [  137.775000] FS:  0000000000000000(0000) GS:ffff999c2e502000(00=
00) knlGS:0000000000000000
> > > > > [  137.775578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > [  137.776001] CR2: 0000000000000000 CR3: 0000000008830000 CR4: 0=
0000000000006f0
> > > > > [  137.776512] Call Trace:
> > > > > [  137.776700]  <TASK>
> > > > > [  137.776863]  ? __pfx_hazptr_torture_stats+0x10/0x10
> > > > > [  137.777207]  hazptr_torture_stats+0x25/0x70
> > > > > [  137.777508]  kthread+0xd9/0x110
> > > > > [  137.777751]  ? __pfx_kthread+0x10/0x10
> > > > > [  137.778017]  ret_from_fork+0x1bd/0x220
> > > > > [  137.778285]  ? __pfx_kthread+0x10/0x10
> > > > > [  137.778560]  ret_from_fork_asm+0x1a/0x30
> > > > > [  137.778849]  </TASK>
> > > > > [  137.779007] ---[ end trace 0000000000000000 ]---
> > > > >
> > > > > I have not yet seen this during a PREEMPT run.  Line 658 of
> > > > > hazptrtorture.c is the WARN_ON_ONCE() below:
> > > > >
> > > > >     if (i > 1) {
> > > > >             pr_cont("%s", "!!! ");
> > > > >             atomic_inc(&n_hazptr_torture_error);
> > > > >             WARN_ON_ONCE(i > 1); // Too-short grace period
> > > > >     }
> > > > >
> > > > > Any thoughts on what might be causing this?
> > > >
> > > > Hi Paul!
> > > >
> > > > Can you share which tree and branch (commit) this is running ?
> > > >
> > > > Does it include my fix from this series ? That would be patch 1 of:
> > > >
> > > > https://lore.kernel.org/lkml/20260927155134.4740-1-mathieu.desnoyer=
s@efficios.com/
> > >
> > > Ah, no, I somehow got the impression that this series was going to be
> > > updated, so did not apply it.  Apologies!
> > >
> > > I will pull these in.
> > >
> > > > Does it run the additional series from Kunwu Chan found at
> > > > https://lore.kernel.org/lkml/20261002170847.3653663-1-kunwu.chan@gm=
ail.com/ ?
> > >
> >
> > Hi Paul,
> >
> > I have posted v3 of the series since then. The link in Mathieu's
> > question points to v2.
> >
> > Please use the latest v3 series here:
> > https://lore.kernel.org/all/20261005171529.1378809-1-kunwu.chan@gmail.c=
om/
>
> I do it the old way with out b4, so I would have bot there.  I will
> hold off a bit for merge-window preparation, though.
>
> > I wasn't able to reproduce the warning with my current setup(without
> > my series).
> > Could you share the .config and the exact command line you used to run =
the
> > test? That may help me reproduce it.
>
> I used this command line, which creates the .config:
>
> tools/testing/selftests/rcutorture/bin/kvm.sh --torture hazptr --allcpus =
--configs "2*CFLIST" --duration 90m --trust-make
>
> This was on an ARM system, in case that matters.
>
> But pulling in Mathieu's first patch took care of this issue for me.
>

Hi Paul,

Good to hear Mathieu's first patch fixed it. That is consistent with
the race we were looking at.

The race is between the wildcard flip and a context-switch promotion:
hazptr_chain_backup_slot() selected the overflow list based on the
wildcard phase, so a backup slot promoted during the second scan could
end up in a list that was no longer covered by that scan.

Thanks for sharing the command line and test setup. The 90-minute run
also explains why it was difficult for me to reproduce with shorter
runs.

Thanks,
KunWu

>                                                         Thanx, Paul
>
> > Thanks,
> > Kunwu
> >
> > > No, but if you are good with it I will pull it in.
> > >
> > > May I add your Acked-by or Reviewed-by?
> > >
> > >                                                         Thanx, Paul
> > >
> > > > Thanks,
> > > >
> > > > Mathieu
> > > >
> > > > >
> > > > > For that matter, can anyone else reproduce this?
> > > > >
> > > > >                                                             Thanx=
, Paul
> > > >
> > > >
> > > > --
> > > > Mathieu Desnoyers
> > > > EfficiOS Inc.
> > > > https://www.efficios.com
