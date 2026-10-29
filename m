Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793267921;
	b=ZRVhR4X8vWbkqGmdckJ8gZa/bfY04RNAFOkYcShkxCko3fb+ZugtxpRPjRWMj+Wufoiq
	 5l6LvQZIn9c9iey1MELs1oIUE/4ih0ksd3GA+IdNhV7bd34PQG6Rb1WCUExa0ulrR17aM
	 uYECboQHcnhu1jju5tg2eZQp4KfBJrQRXja3edF0Pc5wb24zgEaL2GY7EPiWFwmUJHzhu
	 SOjw+nCxIWz+jmHYCGU5vqkhx86lrrU4pYpmgwFGax0tPsKkhXS9SXh0wN9F7fbOF+CmM
	 hCJjkfag3vGhEt8gT21H2N1WA/02WfaE2p6M4JYEk3hRXUJ8kYNVb332Ti9B5YICDsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
	b=lJwwGZ1NwmXNvbKu2keOrgaqGPWZtvAL6qbsZB2qdVGCbKMUihOo53QVtPsf+RtYzbJx
	 thZnkYcOPCYzZB130ieyp+0j599G1BrZKOxL0AEiK3rC635B2vQIAy0qKdbV5VC+2bDFt
	 2BQF2FqcSYasvEIIO6etayBHVkWdO9Q/Soin+giAA8wzl9dMzFgyE1DMvpOt1p7I6/LDR
	 KgXy/VtMYnsRFEHthYa2N44+JNI+eHHaInlU3iTRwhzjwDn7rCP7pvWsxufWEpj9p3dHY
	 IiYmbBqTkBsYsfTyuUoys+ln3HQZGCny/JT0GZIlEPkUU8IXF2ytPxmHEj99EtrfvlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8xxqMca;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD39606A327
	for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 09:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD39606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8xxqMca
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso14430475e9.2
        for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 02:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793267919; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXhClsbO9/d5ekt9859PAk1TBkOlI3cvVbqmqJhTyr+nwRBVGWNBMpdMuiQI38YenZ
         GrJ7Za33UXP0ECOeVyJ+0SDWOjwEQ+9UhkDbwsoKt5+yQtunVsAgOizjSBMxm+Zm4H7a
         E8fsI7Ga1F0e49OxqhKIGgd/02KJd7lmTd09egp4vitAhoSxjcDRgZwie3cDCBa4s9bu
         M3X8skNdPa+yO2qPa+jvhVRUKGzDBUDWJH6vAOX09FZqz3UsewalRgRK/WTLIdQvJ533
         6BYqSpRYPD2Am8QneNvF3S/n/YTDePdRcoLzRJeeMxc5nUNGwQXNWM1HS+WVCurLJUjx
         qPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        fh=Htv5PQV9HiFU5STzW9U01dEqNTSmF/o8jqe3jWHk8cQ=;
        b=TPp0RVE/P6fn2OvwWeJawJRxni6hhZYDulsx5o+b6CLv+56hYl2LPhJdCromhzBR9f
         VZhazadlC7fQQmCvnXO09S/r2fA+mgnKkOA6elapI9PLrLtutIif2j4/dvoDzDKsmIiR
         zb+mOZQ/lcelmMhsgl6IfaLWveEQ/3kE+BpUxBao6RDCMtOdovIvwoa8LQ6GIqwD+N0w
         4ttAfFtJ5EGX58KhxtKNzBgB6pd1sZBaTfkCkOIo3DwYE/TvHgOjkSn5RZPlGog51rQa
         +wQIStl1z9YKVF/3C/6eorz5b+p+B6+/2Ov6lVtpB/G5zhb1kVl+8ieS452H9Y+b3IKa
         qINA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267919; x=1793872719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        b=R8xxqMcaSxxBBPmBmpwG1OkIh2A/ea8HkLHDPVqWVw21enhTDtv7tMobapMtR54iLG
         4JQ6y4GhCMkqexWxMEGv29liTeyaiy76inDZMgCmXvJM5d3bA+4bSM1HAFDfDJMjft5Y
         CFnMnzMrwLgHX7caGmmJW9YEdRrnW7JsdfnS07oqT6unV1+xjgntSfyjZz6Ypyz/bAIH
         m9dgNmGW4LwSrFO3KJ3paPPhHAh1RoJDvjS08vjkvsfSxLOX9Dq5/nOP2ITiNgvQzj2m
         bYa4s+ddV9ZUZqlnkOPXug9MiahEhOtrgSojLe8MGJJZ9fMgqu78jvFN4fhPEOPEAgqy
         vgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267919; x=1793872719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yc7WBDeLmx1ji0neslzEETIhjNOOqtjOzqoUjWpHAsA=;
        b=Lrom92RKd5ZRFbPin9/wMA39ywPwxpTURRFpfn+R6v64KpY8EqLQQrWYRI/3lv8/Nh
         1p7KZFiXbIHTMV9sKFy3oY3M44Sl85y6CJ3De8R1D+MffXEJRH4ekhQVoaQ0Qx6u7gnO
         4gfsCOpCz4xh3x4Yd5TNLoyCN2I341ZY7TlKV54IDtLWakqEjMIJMd1EO54HXOaqON6I
         eyB3S6RHLJ0VS43dwF2nWnl7Umyr7+JDhzT8MpRAe3+A1is5ZnQEluCKNOjN0CnBXybA
         rWmwCR4Ccf0ymClOt/X5nQY+OP1WixOq8AwI/lcIM9Jgh+cMpDcDquYyX33yoHdp+538
         WMsg==
X-Forwarded-Encrypted: i=1; AKwUvByInLM2JStAKJ1oSuLT0BBU2XlQFQP1a8AVxe/vYgpqAY6nnvkVb1GjWoSlS10l8LNKYzek@lists.linux.dev
X-Gm-Message-State: AFq9FYJpOydbJMbstsk330yzEXleGaglexmJD/ufXoA8GMmF+wdmL6me
	ZZrTAikDQfGXxkq1OYOal9dL+6ILTtmlcM/yh/VnhorLigrTm0KebNXD9T7shk0whkJl3dyMPlE
	YEJ9K4bpFQKiWQN6qlJhXPGit4I/+vKM=
X-Gm-Gg: AYBFou1W/ch+lWRZA+Nl02fO77FH91fXztoNWAF0VyY4stiOrpXNtm+vDrz43auvVd2
	JGMuz5S/GXWJuNZq8Fj93Gj9bGCBhprOqKUlAm/dBGaSkgH2muQthva0Kk8xJLJj1l7v+xGOk0k
	lpB1LkUuDCYBoxzhBCwcOZM1BO5kFFxttdRiGs+ma97LSTFyiUTMYGCILzVeENV3xkyoMMKSl84
	BuQQtQSQFavgaRuZTPwIoPBqdyTFIpc4xyVOBqKtYIBWqpOk31DiIUbzDu8/VZD2rGwTrAarDkH
	9ByG1vGmRU+vktMnjvHks/OibXSiWQkDVuLm/Fgzfr2xWnJ/S8Ix/SpgBywK1/gphTDmlEILGTs
	BTODlq5uYCjOe2vQk2ASTwo6psB0tsiN2bz8LCedaYVDjfhpCyn8OBKZRcizkGtLcHtJa8vc=
X-Received: by 2002:a05:600c:a103:b0:4a3:5d5d:48d9 with SMTP id
 5b1f17b1804b1-4a967ab127emr88000115e9.35.1793267918857; Thu, 29 Oct 2026
 02:58:38 -0700 (PDT)
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 29 Oct 2026 17:58:27 +0800
X-Gm-Features: AclHuK-PyU47NuYgIA0zE-mZxiBBfVoQmUb043GP6GTroV1D35cedFeNfUB49NM
Message-ID: <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
Subject: Re: [PATCH -rcu/dev 0/4] hazptrtorture: Fix shutdown hang and catch
 slot owner race
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Gary Guo <gary@garyguo.net>, 
	Bradley Morgan <brads@mainlining.org>, rcu@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I ran into both issues independently while developing new shared-scan
hazptr series and its torture-test scenarios.

For patch 1, I reproduced a shutdown hang on 16-CPU ARM64 KVM with
`CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=3Dy`, `nreaders=3D16`,
and `defer_modulus=3D4000`. The readers remained in D state, with
deferred-context stall reports reaching 147 seconds.

My prototype uses the same all-CPU drain operation, but keeps the writer
ahead of the readers in the cleanup order. With that change, the same test
unloaded in seconds. The upstream configuration was harder to trigger; I di=
d
not reproduce the hang in a 3-minute run on the unmodified `origin/dev`
baseline with `defer_modulus=3D100`.

Paul's concern about `torture_must_stop()` is valid: `fullstop` can make th=
e
drainer exit before the readers have stopped, so its exit-time flush is not
necessarily final. The reader-exit approach looks worth testing against bot=
h
the forced-slowpath case and the PREEMPT scenario Andrea reported.

I also saw the patch-3 warning during ARM64 `PROVE_LOCKING` testing,
although I have not reproduced it consistently. The warning count dropped
from 3 to 0 when the relevant fixes were applied together, so I cannot attr=
ibute
 that change to patch 3 alone.

These tests independently reproduced both issues in my setup. I'll check th=
e
final cleanup approach against the forced-slowpath scenario as the
series settles.

Thanks,
Kunwu

On Wed, Oct 28, 2026 at 12:38=E2=80=AFAM Andrea Parri <parri.andrea@gmail.c=
om> wrote:
>
> Patch 1 fixes a shutdown hang in hazptrtorture with deferral enabled, as
> in the PREEMPT scenario: hazptr_torture_cleanup() stops the kthread that
> releases deferred hazard pointers before the writer, which can then
> wait in ->sync() forever.  It now stops the readers before that
> kthread, which releases what is left once the readers have stopped, and
> that kthread before the writer.
>
> Patches 2 and 4 make hazptrtorture catch the race fixed by "hazptr:
> Record per-CPU slot owner after claiming the slot" (now on -rcu/dev)
> should it come back, as Paul asked [1] and agreed to [2].  Patch 2
> adds two CONFIG_HAZPTR_DEBUG checks of the recorded slot owner, in
> hazptr_release_debug() and hazptr_note_context_switch().  Patch 4 adds
> the nest_acquire module parameter, which makes readers take a second,
> nested hazard pointer that goes through __hazptr_acquire() while the
> first is in slot 0.
>
> Patch 3 fixes a false positive of an existing CONFIG_HAZPTR_DEBUG
> check, which the nesting of patch 4 exposes with CPU hotplug: a hazard
> pointer that __hazptr_acquire() puts directly in the backup slot warns
> if the task migrates before releasing it.  It comes before patch 4,
> which would otherwise make runs with CPU hotplug warn.
>
> The series applies on -rcu/dev.  30-minute hazptrtorture runs of the
> PREEMPT and NOPREEMPT scenarios pass on x86_64 with 8 CPUs, as do a
> 30-minute NOPREEMPT run with torture_type=3Dhazptr and three 10-minute
> PREEMPT runs: one with irq_acquire=3D100 and nest_acquire=3D1, one with
> CONFIG_HAZPTR_DEBUG=3Dn, and one with torture_type=3Dhazptr-stack.  The
> 30-minute PREEMPT run ends with as many hazard pointers released from
> the pending lists as were deferred (reldefer: 650385 relundefer
> 650385).  With kthread_do_pending_ms=3D10000, two 3-minute PREEMPT runs
> shut down in 100 and 130ms, well within one period.
>
> Without patch 4, hazptrtorture passes even without the slot-owner fix:
> its readers hold one hazard pointer each, so they reach the slow path
> only when the ptr_eq() check fails or the pointer is NULL.  With
> patches 2 and 4 but without the fix, PREEMPT and NOPREEMPT report the
> race 6.3 and 6.0 seconds after boot, and with nest_acquire=3D0 both run
> 10 minutes without a report.
>
> The nesting costs about a third of the outer reader iterations at the
> default nest_acquire=3D2.  If that is too much for every run, it could
> default to zero and be enabled from the scenario files instead.
>
> Patches 2 and 4 stand in for the KUnit reproducer mentioned in the RFC
> notes of the fix, which needs a test-only hook in
> __hazptr_try_acquire().  The checks can miss one case that the KUnit
> test covers: an interrupt handler that acquires and releases the slot
> instead of detaching it, then a context switch before the task's
> release, when no other hazard pointer claims the slot in between.
> hazptrtorture does not produce that case either, as
> hazptr_torture_acquire() always detaches.
>
> Patch 2's release check also warns about a second hazptr_release() of
> a ctx whose per-CPU slot another hazard pointer has claimed since.  The
> hazptr_release() kernel-doc permits that second release, but it clears
> the other hazard pointer, and a second release of a backup slot oopses
> even without this series.  Nothing in-tree releases a hazard pointer
> twice.  I will follow up separately on the kernel-doc.
>
> An LLM found the hang fixed by patch 1, the crash shown in patch 2 and
> the false positive fixed by patch 3.  It also helped write all four
> patches and their changelogs, and ran the tests above.
>
> ---
> Changes since RFC:
> - Patch 1: stop the readers, then do_pending, then the writer, and
>   release all deferred hazard pointers after torture_kthread_stopping(),
>   instead of keeping do_pending in its loop until it is stopped (Paul).
>   Paul suggested changing the "while (!torture_must_stop())" condition
>   to "while (!kthread_should_stop())"; this keeps it, for the reason in
>   [3].  The changelog also says when kthread_stop() can still delay the
>   exit of do_pending by a full kthread_do_pending_ms sleep (Paul).
>   Bradley's Acked-by is not carried over, as the patch changed.
> - Post patch 1 in a series (Bradley), now with patches 2 and 4, so
>   that hazptrtorture catches the race fixed by the slot-owner RFC patch
>   (Paul).
> - Patch 3: new, for the false positive that patch 4 exposes.
> - Do not repost the slot-owner RFC patch, which Paul has queued.
> - Drop the Assisted-by tags, following mainline commit 1e035297ffda
>   ("docs: remove Assisted-by references"), and describe the LLM use
>   in the changelogs and above instead.
>
> [1] https://lore.kernel.org/r/fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmc=
k-laptop/
> [2] https://lore.kernel.org/r/e0145c14-9d6a-4c91-816c-57dabd98879b@paulmc=
k-laptop/
> [3] https://lore.kernel.org/r/20261023120755.2463384-1-parri.andrea@gmail=
.com/
>
> RFC patch 1: https://lore.kernel.org/r/20261019162005.12888-1-parri.andre=
a@gmail.com/
> RFC slot-owner fix: https://lore.kernel.org/r/20261019161852.12783-1-parr=
i.andrea@gmail.com/
>
> Andrea Parri (4):
>   hazptrtorture: Release all deferred hazard pointers before stopping
>   hazptr: Check per-CPU slot owner with CONFIG_HAZPTR_DEBUG
>   hazptr: Do not warn when a backup slot is released on another CPU
>   hazptrtorture: Nest a second hazard pointer in readers
>
>  .../admin-guide/kernel-parameters.txt         |  6 +++
>  include/linux/hazptr.h                        | 13 ++++++
>  kernel/hazptr.c                               |  4 ++
>  kernel/rcu/hazptrtorture.c                    | 40 ++++++++++++++++++-
>  4 files changed, 61 insertions(+), 2 deletions(-)
>
>
> base-commit: 633f91e3408cc65a5237752a3265b031c389e43e
> --
> 2.53.0
>
