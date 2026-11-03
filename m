Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749384;
	b=W24uV/EkbI81+jIwn5kEW0pzrnycyjzjM6fulLyzzAIgzyHzdp66459s2ZJbHuTGlKQH
	 p258ubOYy+QNgzh+H1MfJuQTZtBFSVPwBJ6pKYiLYuqKuBXiJkwRcRuJceiUzb4poNkDN
	 MzzP5oy84sgOzczOetFjztMII5oJwqK1Nx3BiXg7SGgre9G95DO8U//0szInWHuP9ypVG
	 Y6ijL7Ped9/Z/UJqhLuaPTCIp0qX0xXKrKhGBwMNi7F8LkEw5I3vuuZX9K6ggXsNj4nQG
	 boGbhc+ITCvVkeOQePZb73X+iRpLrJABNz9LfmaL+ALkLTI84UCRn1gIiZz4KLfLTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
	b=ihx4ZaaKfzls0v19b31QlKNfVqcJPnrQnmSS244100FQnyt5YB26EYO9oEHst2iPI22G
	 XTDlz2KXaU0xm2jbepPByuuI4/tHmqF6cQVDyacV+jxjgQiLH4jLQWNJAohKJzs0GuHCH
	 kasFXJe8ZibwJftE4/YXGy9UwLXltXbDnSDaS0BZS09q8ehVa8Hq/6kJZt+yakw3YHdnN
	 VuUodP1lnIhtiFQ4vVUHxYd4NeXGKNiqRoz2hSkd2cDuDzouZvr5ys9PqZVnzkPuiJgbs
	 XoxfYnhuoPWcvkMlQvuj2ZMe00rRXmqc/Et/BjDvCI9Pt+vrtZon2l/E4rQN9Ue5P8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYsicxnq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC797606A324
	for <lkmm@lists.linux.dev>; Tue,  3 Nov 2026 23:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC797606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sYsicxnq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso65640f8f.0
        for <lkmm@lists.linux.dev>; Tue, 03 Nov 2026 15:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749382; x=1794354182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
        b=sYsicxnqd1QRdEd5nicAG/BMBvysdMRxSzLjIgVjihEclPxJyfZOGeqCbMTw1q6M95
         KbJVjkW20k/3bDDlTXIQ7Wnf0E2v9vqtNaghA44vf9neeV9p53/Gp9vfFkKLczAybfRZ
         f5bGWQe/6zZKeOf27kDD9e+Obj/+UTnMGMkd+GzfNTfxy1SBy594i5gK/9zZFPm/RCh8
         McUuxl3fF61u2UDzdL8P7ACjCCWlKHOuEgbNiUi+YRex2XXgEKwE9wPnTGcWQk0GuOEU
         EucGcHmOZxuA0EqRP2Z6+3WNMXKBnUt5JvPE5rbHTqAB7TxREshOfh3xcolcMSySoew3
         rhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749382; x=1794354182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0TmtvtXPpRF/twzDdIfwnX1S+VDt4Q6vGLAqJtu7vYk=;
        b=CBEMco5avtlV+gDLnbbCekl5Au5XGkUhCTzYxYSy8c3fbUFvHOYtjK9ybG7xFgcZ5v
         zL8GwtVDEaQhFOHytDbc9VvpOZdjfrRHVAIFCwhuwUf7boWlyVGNkAC+Odr3sfBgzVZP
         DxXUHbAVzLiMZ4nozpMe+g1J2VQ9cRuMaAm23R8VIV/5EBSMTBCyqJ5lM314pXeGWVz9
         qhZK7HFdHmobXy713g1LTMupwno07g5jd2r/bMjF8qYQaCAQCLykZN0pBZKZjHKWCylq
         2LovrrBNZWcQ9d5a9FkG1Ka3IoPha8J6oW+NKWeEKEK5kAK4ck6LVTNzysi1jfye3kZw
         xVKQ==
X-Forwarded-Encrypted: i=1; AKwUvByVme1YS8WHRlSBMEVbNXOQwttDS7gWrbLYORr8fvO5l/HnG7D+kDDldCr9zCELhLjkwPjj@lists.linux.dev
X-Gm-Message-State: APuU4Z9hPp8Etv2ed1Q9l2/aoYQZddTxX+rPTN1Aqpg2wvNauRRr3dLm
	VQADbTrcYS+DxWU0ndCJOZDqk+S9afkY78VMj+JIU2dfmiwQM+kTxFKR
X-Gm-Gg: AYBFou2BkOYM4Elv5FEbJeNHA1EmQpXoWLILmjdjHU4j0Cu/xB7ShDfXZS6Z6dTqkmv
	M3eKF9DStIy5MV/OmrW0v8SOkDSyd7RlQ6rbfCmfkM0tXi3NPxtIAAvC7ATZAcbYfWmCf8gtMPA
	T+mqaawNH8pkAX1KRkh15BgfgXHlnpSz0v2xZfAhO+nWSHgWKNbuUxFcxvPz6ji8Btlo5Oz/pd+
	MuCOCf+85EcxyPnZpgQMzi2m+0XDpJBTb2CozoCUxtndejAhDZ+Z5Vm2j/9sxpRv+lNy40gLuCM
	mYI/EqrxBMTqipF2MCCvd1mbAqCvNjpWzC6atxxqKS4X85xLege16y54NE2AI3R0TIz9rRJkTif
	GPb329nieLjeoM2gOVJMTNOX9Uj2MervpaAdbYPhHhMOYxKSSEMKNySb8c8bOVzzy08e6uPlxp1
	ZvYIFG8MKJ5o7GVh+x8IJ9bqkczSRGzxdE9u6vguvXxYrHIyBFsyzEprQ69glTbxqJRdNvmTI+Y
	qgW27XpuelsQKwaFgClvTX6YRa1ZQwj/GWFefLIFjH3j+RsHUMLQMnBG/phh6S4raVF5c/3qIvZ
	Z5SGDbbpfBPrKolwCFLhlomsMbtX48HU42NttSRnvpzMK70yRFVepRR8opPZvUYVcmqiqBBmpVU
	CDg==
X-Received: by 2002:a5d:4d82:0:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-48e6e4f4ff5mr25016512f8f.44.1793749381829;
        Tue, 03 Nov 2026 15:43:01 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm513060f8f.46.2026.11.03.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:43:01 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Subject: Re: [PATCH -rcu/dev 1/4] hazptrtorture: Release all deferred hazard pointers before stopping
Date: Wed,  4 Nov 2026 00:42:41 +0100
Message-ID: <20261103234246.2546810-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ad753ec5-52ee-4fcf-8275-77095f42e8c9@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop> <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop> <20261103190507.1913628-1-parri.andrea@gmail.com> <ad753ec5-52ee-4fcf-8275-77095f42e8c9@paulmck-laptop>
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

On Tue, Nov 03, 2026 at 12:44:07PM -0800, Paul E. McKenney wrote:
> On Tue, Nov 03, 2026 at 08:05:06PM +0100, Andrea Parri wrote:

[...]

> > >     hazptr_torture_cleanup() stops the kthreads in random order, which
> >
> > The order is fixed: do_pending, preempt, the writer, then the readers.
>
> That was my first thought, but then I remembered that torture_init_begin()
> sets fullstop to FULLSTOP_DONTSTOP, which causes torture_must_stop()
> to return true, thus stopping all the hazptrtorture kthread at about
> the same time in some random order.
>
> By the time hazptr_torture_cleanup() gets around to invoking
> torture_stop_kthread() for the various kthreads, the game is up.

torture_must_stop() does become true for all the kthreads at once,
when torture_cleanup_begin() sets FULLSTOP_RMMOD, but each, once out of
its loop, waits in torture_kthread_stopping() until
hazptr_torture_cleanup() calls kthread_stop() on it, in the order above.

[...]

> I instead dropped the torture_stop_kthread() reordering from the most
> recent version of this patch shown below.  (Which still contains the
> above typos, but could you please check it otherwise?)

With the pass after torture_kthread_stopping(), each reader reaches that
pass only after kthread_stop() is called on it.  Cleanup now waits for
the writer before making those calls:

	/* hazptr_torture_cleanup(): */
	torture_stop_kthread(hazptr_torture_writer, ...)  /* waits */
	torture_stop_kthread(hazptr_torture_reader, ...)  /* releases */

So a writer waiting in ->sync() on a deferred hazard pointer left after
do_pending's last pass keeps kthread_stop() on it from returning, as in
the hang this patch fixes, and the readers are never stopped.

With ba9a3e4d3b237 and patches 2-4 on top (d0a4ec9443ee), both
3-minute PREEMPT runs with kthread_do_pending_ms=10000 hang this way:
after "Stopping hazptr_torture_writer task", the writer stays in
->sync(), no reader is stopped, and 3823 and 4072 deferred hazard
pointers are never released (reldefer - relundefer).

Keeping the reordering, or doing the pass right after the reader's
loop, before torture_kthread_stopping(), avoids this.  Your previous
version, which keeps the reordering, passed those runs, as did the
variant from my earlier reply, which does both.

> > Also, "hazptrtorture: Nest a second hazard pointer in readers" conflicts
> > with moving hazptr_torture_do_one_pending() up, as both add a function
> > after hazptr_torture_defer(); keeping both resolves it.
>
> I believe that I have resolved that correctly, but could you please
> check v7.4-rc1..d0a4ec9443ee in my -rcu tree?

The resolution looks right to me: it keeps both functions, and the
patch adds and removes the same lines as in v1.

Thanks,
  Andrea
