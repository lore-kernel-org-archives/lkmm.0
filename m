Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119128;
	b=ogVTC7NF58dEry5Em+wiIpvnaKXP9aOt7fJI6ZAX0GwmYwoSrSonjCfZbzVpJizjoxnT
	 DqlZlAhCqG4bEzkKaOLvBmjIp5nnKZqmFB84CpipQZ3TFeMUi/vcXPKmpDF1JwlHNPb52
	 rIW5LuB23/6Ri5l/H/cDh/q+w7WSKtiA0NncKWtRp2Z2LW3qWYCNM+ywVJTJT25gfvBW8
	 k9nfb/5gz5wK7zlgY2vM1F4HGTs7vw9zJmjHHLsBeIe2DSv8JZMvkBQnDiixFqmHEvE8b
	 zuKBke4j7h2XpabJF8e7ydq0CAZ/XkVGlkG9UBmG5xlBjss45cqn+CHVnfmX6xgDrAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YdzeYBRZDVgcxRLuViW9S+/Z+tRK+ASP+jbr26j52IM=;
	b=aC5vNN8BTnwM9nuaCKmR0QrFkiJJjLVqxneHf4PdCMdBtMb7BNvSaiKOer3wvyVQ695d
	 nkjyBz/CoRHnWVQy3sICJhp1hzTjl61rPlNU80T5TwT2Vv3DZHRPzM56/eq1eUfOHdlbp
	 M2p7IAiSjLm0XiHDkAQY84bPpWD+/e2uD8jC2lOj/sqoz8vY+Qn7uo//RIPPwwudAMrXR
	 9SewtN7YFyJYKWzpjn7IAtua30btLFabqg4OUtnObd3z6LBOU9jo3ExJ7GHaHXvRmSxgE
	 G3WUZD3I/iP0XM6MOtY8pdk42L3u+YKGVkvSi/iuvijRXqVIrR1tovGrUvpFFK2KQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7jXte+J;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E8606A31A
	for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7jXte+J
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so29530f8f.1
        for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119126; x=1793723926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdzeYBRZDVgcxRLuViW9S+/Z+tRK+ASP+jbr26j52IM=;
        b=r7jXte+Jeh6KdhGUtEnrZCjDJgURPnP0m2+8/R/jnAJl9v4Iz0F2YudZwf3QlEGYUi
         QFDn6xJEU/Scv6D7MLZNl6IP+rXG520F0gE++751iFCDrEfPu+4VqSZwLkrHpI0ROS5k
         QHJTYuJfkZxsDtml43LTOg7/xfj4JrO73jVzmE2UBo3cDg5hl9/xOgNpR4XZDcegw4F/
         MKnv0mZ2dAKY1Tjr+q5M3XP+xjidq/xkGZ+5xsVxS2tl6g4VZMiW9d1xX6obDYWk27VI
         BOCG8+66r9IknOgu4Yc5mDmdnxJDTmaJuUy9Aq+mWoT6FyJpPp3SejJaBGfC6Kqa4lah
         EKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119126; x=1793723926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdzeYBRZDVgcxRLuViW9S+/Z+tRK+ASP+jbr26j52IM=;
        b=JMXHBaYt3Nt8ajfKh2fKBrwhzsIhkJRvptqvsHzA4dzpQgI4mJMRAEJn+BrTIChFiq
         g1NYD1Pn8AcZLe0sW1h6a8Cy9Xt5DzUPXYQk6raEu1I2nJuOm5aJEcoBNS2QCavFp9Ei
         piCe1jiDUMzTnVhzt0EKkl1F4E/A5f0CiCWosU1EIYCAUYVaD94ivM2/H2uhg20t8ZyH
         4tq+TyU1INRZoQ4MJKImuDV9+aH4/o0rwIUSA8WkAElbHs4InPn9HoWw0+3RodvwwP7L
         +MrCRC7+TFsxEVufwAQ1eFYz4bXUOEvbPDu9pYuEvB6apNmSW3piSxl22i3qqxZp/Seq
         QU0g==
X-Forwarded-Encrypted: i=1; AKwUvByL4rDFOwsgXUc7fFme5e/iq/lAjZGS5crwGV4ChjMF8+HPXqFuQ157fjiBE4ddNNc7Qbjl@lists.linux.dev
X-Gm-Message-State: AFq9FYLK1zdw2OICK+O2ZdMBPrxTNd3jWOvDnrdHUml2G4GoRilRq3rn
	2kxzcwd0aOMoaWjMTqX5qlMCEstnDhNCVyV6xWk93sGi/DYGwgwwSnvV
X-Gm-Gg: AYBFou11e6BJ6qFeHKpkJULjmWcPZiBRoknQn+loUGOfq0mWIH5afa8YupAGFrjIGJq
	6OIXcw186KZF7oeUPasr+grUjiYGkkFuVzd/sxo1Fo8q5Qsg+IA356JCongCbTDS000vxPWlwNh
	mnyJ1p3EFVuLo36IIvqR4dviTnSTilIMs4rJb0QqxRTFyQOwKal1lNkYuo5TLG0ZoxcboUI4OrK
	pQCjaxd4ZOknMBObrRKO7VAXwMu7hmIbOl8VxMbbSvnMcgsTwai6dNjVYqSgfCzhpKgbHgfdBaN
	PDgo6Ujg0Pg/RudICX9qe32AuIw+3z0YK8nmBXmYy0pXOoCRmMlSjRplVzjHG1N2dSZ3L0aeYzx
	VwrukgPZqXWVW4Si4NOQCO54wVKhOxGtXgBV9xWZqeCOhP9cg1W8GLtf2QpjACqmegOdgdAm33T
	1xfkvhuleLqPNwqJQI1bcDgi91JXWAlRMkSZLFWqpqM7R0FC4PeIVswvedVYAtc8pCsody/iyTC
	29yPHwUWfS4kDzCDlgwJPx8x5QvlSaMRryq7jKJhbu/GSlWlRAYRNVnZKnd7e0YscOzwV/U5nBY
	ssyU+Orve5vbytbIheISWOvt42A=
X-Received: by 2002:a05:600c:c09a:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4a43a2d1805mr146805825e9.15.1793119126174;
        Tue, 27 Oct 2026 09:38:46 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:45 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 0/4] hazptrtorture: Fix shutdown hang and catch slot owner race
Date: Tue, 27 Oct 2026 17:38:02 +0100
Message-ID: <20261027163811.2470569-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes a shutdown hang in hazptrtorture with deferral enabled, as
in the PREEMPT scenario: hazptr_torture_cleanup() stops the kthread that
releases deferred hazard pointers before the writer, which can then
wait in ->sync() forever.  It now stops the readers before that
kthread, which releases what is left once the readers have stopped, and
that kthread before the writer.

Patches 2 and 4 make hazptrtorture catch the race fixed by "hazptr:
Record per-CPU slot owner after claiming the slot" (now on -rcu/dev)
should it come back, as Paul asked [1] and agreed to [2].  Patch 2
adds two CONFIG_HAZPTR_DEBUG checks of the recorded slot owner, in
hazptr_release_debug() and hazptr_note_context_switch().  Patch 4 adds
the nest_acquire module parameter, which makes readers take a second,
nested hazard pointer that goes through __hazptr_acquire() while the
first is in slot 0.

Patch 3 fixes a false positive of an existing CONFIG_HAZPTR_DEBUG
check, which the nesting of patch 4 exposes with CPU hotplug: a hazard
pointer that __hazptr_acquire() puts directly in the backup slot warns
if the task migrates before releasing it.  It comes before patch 4,
which would otherwise make runs with CPU hotplug warn.

The series applies on -rcu/dev.  30-minute hazptrtorture runs of the
PREEMPT and NOPREEMPT scenarios pass on x86_64 with 8 CPUs, as do a
30-minute NOPREEMPT run with torture_type=hazptr and three 10-minute
PREEMPT runs: one with irq_acquire=100 and nest_acquire=1, one with
CONFIG_HAZPTR_DEBUG=n, and one with torture_type=hazptr-stack.  The
30-minute PREEMPT run ends with as many hazard pointers released from
the pending lists as were deferred (reldefer: 650385 relundefer
650385).  With kthread_do_pending_ms=10000, two 3-minute PREEMPT runs
shut down in 100 and 130ms, well within one period.

Without patch 4, hazptrtorture passes even without the slot-owner fix:
its readers hold one hazard pointer each, so they reach the slow path
only when the ptr_eq() check fails or the pointer is NULL.  With
patches 2 and 4 but without the fix, PREEMPT and NOPREEMPT report the
race 6.3 and 6.0 seconds after boot, and with nest_acquire=0 both run
10 minutes without a report.

The nesting costs about a third of the outer reader iterations at the
default nest_acquire=2.  If that is too much for every run, it could
default to zero and be enabled from the scenario files instead.

Patches 2 and 4 stand in for the KUnit reproducer mentioned in the RFC
notes of the fix, which needs a test-only hook in
__hazptr_try_acquire().  The checks can miss one case that the KUnit
test covers: an interrupt handler that acquires and releases the slot
instead of detaching it, then a context switch before the task's
release, when no other hazard pointer claims the slot in between.
hazptrtorture does not produce that case either, as
hazptr_torture_acquire() always detaches.

Patch 2's release check also warns about a second hazptr_release() of
a ctx whose per-CPU slot another hazard pointer has claimed since.  The
hazptr_release() kernel-doc permits that second release, but it clears
the other hazard pointer, and a second release of a backup slot oopses
even without this series.  Nothing in-tree releases a hazard pointer
twice.  I will follow up separately on the kernel-doc.

An LLM found the hang fixed by patch 1, the crash shown in patch 2 and
the false positive fixed by patch 3.  It also helped write all four
patches and their changelogs, and ran the tests above.

---
Changes since RFC:
- Patch 1: stop the readers, then do_pending, then the writer, and
  release all deferred hazard pointers after torture_kthread_stopping(),
  instead of keeping do_pending in its loop until it is stopped (Paul).
  Paul suggested changing the "while (!torture_must_stop())" condition
  to "while (!kthread_should_stop())"; this keeps it, for the reason in
  [3].  The changelog also says when kthread_stop() can still delay the
  exit of do_pending by a full kthread_do_pending_ms sleep (Paul).
  Bradley's Acked-by is not carried over, as the patch changed.
- Post patch 1 in a series (Bradley), now with patches 2 and 4, so
  that hazptrtorture catches the race fixed by the slot-owner RFC patch
  (Paul).
- Patch 3: new, for the false positive that patch 4 exposes.
- Do not repost the slot-owner RFC patch, which Paul has queued.
- Drop the Assisted-by tags, following mainline commit 1e035297ffda
  ("docs: remove Assisted-by references"), and describe the LLM use
  in the changelogs and above instead.

[1] https://lore.kernel.org/r/fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmck-laptop/
[2] https://lore.kernel.org/r/e0145c14-9d6a-4c91-816c-57dabd98879b@paulmck-laptop/
[3] https://lore.kernel.org/r/20261023120755.2463384-1-parri.andrea@gmail.com/

RFC patch 1: https://lore.kernel.org/r/20261019162005.12888-1-parri.andrea@gmail.com/
RFC slot-owner fix: https://lore.kernel.org/r/20261019161852.12783-1-parri.andrea@gmail.com/

Andrea Parri (4):
  hazptrtorture: Release all deferred hazard pointers before stopping
  hazptr: Check per-CPU slot owner with CONFIG_HAZPTR_DEBUG
  hazptr: Do not warn when a backup slot is released on another CPU
  hazptrtorture: Nest a second hazard pointer in readers

 .../admin-guide/kernel-parameters.txt         |  6 +++
 include/linux/hazptr.h                        | 13 ++++++
 kernel/hazptr.c                               |  4 ++
 kernel/rcu/hazptrtorture.c                    | 40 ++++++++++++++++++-
 4 files changed, 61 insertions(+), 2 deletions(-)


base-commit: 633f91e3408cc65a5237752a3265b031c389e43e
-- 
2.53.0

