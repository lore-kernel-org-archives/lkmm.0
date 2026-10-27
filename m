Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119131;
	b=5YjlBLd9QvvaFjd94G1ngcU29lV7MBrI6oGE2Jsc8L1XKWovW7mSCVBrQtXRGiJ4VyV7
	 NFT9XPeG0R3nqFdsMxOC/G0kJxydjaUqHSllkRVCtL24BUC2TZW9Sw1sEe6Ew6a904uGS
	 jRja+6tlbDOvGJUKapVZReAXKbe2LZcKYZYOayYJCnTjUS2Q6P/jM6LwRXunuzGzwuZeo
	 8Jn2oCMxemrszF3ZGOsUZxo63GgMMrUZXgyQPIJtfpD1lQrxMF7uJMPkv2igDaPnThKEs
	 oSTIPFmkWTMiQGxyKPJnYh7Y3DNu0nda5mGQK/dk6/MxGWUa3RpCeG4MGE6bAFN5jwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
	b=Yi4M/ka1f5btFLWKMG5I1akjHlSnY3u6RTwurmySs3ZRF+bUp14kq0FeqmK2ggaQsaE+
	 cHYLVzthA5ljXOZqKMo3ihXdLneXLu4xkZ2yFZjI9c19S9gAtSsIJjfU38gZmG5oJFeyD
	 XjmrM9uizmAz8kET/uuXI3f2GUPSHjMZm1XIN2bvgy2taHuMaloKTjxLlFESKp3D9RpjD
	 OssSk5b8cs2euZSwle/SGy2wmBGIZVEQt9czn9M65lhfaaDrXEH7HM+nbjoMXNdOtX/zQ
	 Wy3WToXwuvKpLIwK7dMDNnIeD9HLDoYB0bQWzDUjvwJx0tTD4rGeYj4YYtq83QF7fvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ME8qIRf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E945606A332
	for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 16:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E945606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ME8qIRf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so288985e9.1
        for <lkmm@lists.linux.dev>; Tue, 27 Oct 2026 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119129; x=1793723929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
        b=0ME8qIRfCJleLnChyDL5cvS/LJWp3dv/4ojmO7JGpeQ4xTAJMaP86+kA2pjdnnjjzM
         foFpF7VFQX7do4VqpsYkoK66M2ZL8TYd8ousPBT60kcQW+R46zTOVHW+5YJbFFnuCwmY
         8b3bAu/9MLK0s2VPMxOGEb2ujMk94Ju65H/2Wf4uCchmvPhDucCgDc44dD69YjMUGwR1
         yOZXN46+o8pzjJsfEQxj9yYlSxViut09Qp0Zbpgg4OHNEv2BQQ55sUU++TBce1IKuh6T
         55O8PzCVVbpB15c3FaS4QMDPVfQ0WhF/PSyDH6OMmOscQ1+sd91cWsCNBas12QgJWquo
         g6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119129; x=1793723929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uR0yAsXbMma6/WfA/RpMNc9+EEy6cOFQycvac3oRjgc=;
        b=tmOyOEBx0ASCiu2FDp2wFq+H7WSBcvHPF4UhY8WRaW16p7w8gGtJj9QXGDt5VQ07oz
         3lCIVyN63qMKsJAbtgZt1spuXe0tT9HYGhV0CU4n5JhL66CZLRi+XboxbI6GLo7x5rj6
         EmcguB49z2CtW2UH2Id9cryZhG+sC/awMm8AQpeY0F79nZTuAhbgKwq+IvSjQ7KdYhgU
         bJqnIFg7/bvESr69GbnOQXWlnfF0jUXaHvhJNAh1VBD8UOpMAJyRAjBxa+IMqHv540a5
         JK/l8ViV+PflhbFRj3r2h0p7u/Y/aiaLtc/fvQ3s0ulDJn7hxWWXvk5waYHY8GybxwGt
         lVAA==
X-Forwarded-Encrypted: i=1; AKwUvBwSxplHsyLDBYC65pYhN8QyKZAR2iO5RzluisbLT00ArGfSqcWktSjcnmLNa0/Cdt1zQLn7@lists.linux.dev
X-Gm-Message-State: AFq9FYI839Yzqfh141/ZFtvG+v2uaGEDc7jU1RrRKsyBQHXxEJPM+bzG
	fjVWkpi65Wwic/LM2fZ4Fqg31GkpOpMEIP+CIm+05U9h+Dybc8YTtIE0
X-Gm-Gg: AYBFou17hNmSHnGccwzEwe7S2qCIsXIYY4jAr2c4YQ7gMDEc+qrAu/gu+u+kQ+2pl7h
	dSt4ZU4/g6W/8QBsNlJxNQRC09Qq2p/12fsquKw4V9LtIYi8S3yJWt0De4qGtEIk+9IpfonNREG
	gbjuviKfYZ+ezGZbEqs8qrppcyQ1vzkEGeVW8CuJXmaF6ZmC8dS89Awy2jT4c2jwscDybYVyMfP
	/+k43cZtZzkFF9MdasPMuzZrKEdAQMpGvp3QMrsIfosVSzPsPgaNYfXxDsW4rRFXehCc5arYCWe
	ttb13I47i42GP2ebnOFOueZiqhL7m01pD8bQeU/Xsq7+DkZEkIMJKKKrsVcOds4/Q1pXRXF5EPe
	qm6aqTwd0le0wwO+5dkovNy+XOqBu2R1X2W1gRMZESrQhVH5Nh5ujn+2T97H3cmpG6EIrdpgzQj
	7ocpXwu3Mo67jwhy7zjMZEzy/lWCCWxzNoXaNKSt/72LSNePPUqeQFAngz/8cPJAqs+MIVc31X4
	LYfr2R7SWc2t29GKhVitv/mNKxo2Ef/QLMFCUsuQcO/VG9/W27a+E0ePFbN87eckA6cpwSC0TmT
	aF81pmxMGcoI/jbcJC75feFgNg==
X-Received: by 2002:a05:600c:19d4:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4a35acbbcaamr197509565e9.25.1793119129109;
        Tue, 27 Oct 2026 09:38:49 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:48 -0700 (PDT)
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
Subject: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Tue, 27 Oct 2026 17:38:03 +0100
Message-ID: <20261027163811.2470569-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
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

hazptrtorture can hang at shutdown when deferral is enabled, as in the
PREEMPT scenario: the writer stays in ->sync() and kthread_stop() on it
never returns, until kvm.sh kills QEMU:

    [ 1800.899278] hazptr-torture: Stopping hazptr_torture_do_pending task
    [ 1800.899447] hazptr-torture: Stopping hazptr_torture_writer task
    [ 1812.713870] hazptr-torture: rtc: 00000000225df70a ver: 12436 HTWS_SYNC tfle: 0 rta: 12437 rtaf: 0 rtf: 12427 onoff: 48783/48783:48786/48786 3,254:3,280 611671:731494 (HZ=1000) acq: 5720353149 rel: 5720210186 acqirq: 571927 relirq: 714778 reldefer: 714139 relundefer 714114
    [ 1812.713971] hazptr-torture: hazptr_torture_stats is stopping

    Summary: Potential hang (QEMU killed)
    !!! PID 1393523 hung at 1980 vs. 1800 seconds

hazptr_torture_cleanup() stops the do_pending kthread first, then the
writer, then the readers.  Once torture_must_stop(), do_pending makes
one last pass and leaves its loop, but unless stutter_will_wait(), that
pass releases the deferred hazard pointers of a single CPU.

Readers can also still defer after that pass, from the iteration they
are in when torture_must_stop() becomes true.  Readers that have left
their loop hold no hazard pointer, so the writer waits on one of the 25
deferred hazard pointers above (reldefer - relundefer) that nothing
releases.

Stop the readers before do_pending, and do_pending before the writer.
do_pending still leaves its loop at torture_must_stop(), and now
releases the deferred hazard pointers of all CPUs once
torture_kthread_stopping() returns, that is, once
hazptr_torture_cleanup() stops it, after the readers.  The writer can
still wait in ->sync(), but only until then.

This should be safe because readers defer only from their own loop,
which they have left once torture_stop_kthread() returns for them, and
the hazptr_torture_acquire() IPI runs synchronously within that loop.
The readers do not need the writer to stop: they leave their loop at
torture_must_stop(), after at most one stutter_wait().

do_pending keeps the torture_must_stop() check before its sleep.  A
kthread_stop() that comes after that check and before the sleep starts
still delays do_pending's exit by a full kthread_do_pending_ms sleep,
however long that is.  With the readers stopped first, this happens
only if do_pending passed the check before the test began stopping and
had not yet gone to sleep when kthread_stop() came, after all the
readers had stopped.

With this change, a 30-minute PREEMPT run on x86_64 with 8 CPUs ends
with "End of test: SUCCESS" and with as many hazard pointers released
from the pending lists as were deferred (reldefer: 983727 relundefer
983727).

The hang was found with the help of an LLM.

Fixes: f23d7b47ced9 ("hazptrtorture: Add kthread to release deferred hazard pointers")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/rcu/hazptrtorture.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
index 7c8b5899fb011..c46083a8af093 100644
--- a/kernel/rcu/hazptrtorture.c
+++ b/kernel/rcu/hazptrtorture.c
@@ -560,6 +560,9 @@ static int hazptr_torture_do_pending(void *arg)
 		// Omit stutter_wait() because this function needs to do cleanup.
 	} while (!torture_must_stop());
 	torture_kthread_stopping("hazptr_torture_do_pending");
+	/* The readers have stopped, so nothing new can be deferred. */
+	for_each_possible_cpu(cpu)
+		hazptr_torture_do_one_pending(cpu, &rand);
 	return 0;
 }
 
@@ -773,9 +776,7 @@ hazptr_torture_cleanup(void)
 		return;
 	}
 
-	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
 	torture_stop_kthread(hazptr_torture_preempt, preempt_task);
-	torture_stop_kthread(hazptr_torture_writer, writer_task);
 
 	if (reader_tasks) {
 		for (i = 0; i < nrealreaders; i++)
@@ -785,6 +786,14 @@ hazptr_torture_cleanup(void)
 		reader_tasks = NULL;
 	}
 
+	/*
+	 * Stop the writer only after do_pending, and do_pending only after
+	 * the readers: the writer may be waiting on hazard pointers that
+	 * readers deferred, which do_pending releases once they stopped.
+	 */
+	torture_stop_kthread(hazptr_torture_do_pending, do_pending_task);
+	torture_stop_kthread(hazptr_torture_writer, writer_task);
+
 	torture_stop_kthread(hazptr_torture_stats, stats_task);
 
 	/* Do torture-type-specific cleanup operations.  */
-- 
2.53.0

