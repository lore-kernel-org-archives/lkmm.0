Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732725;
	b=zrcOD46MkZBrlcCiyLQDEWgv80YznJy+29Hw6n4PCYO8NhwCSS+3IQAHML8aQxGvmiPF
	 eYhbg3Ao0qdxkb0kKispCGwzqSyoW4ELIcPjLBp9xBaGr69X3SeW9xkU7uwU+A4JTpvql
	 aecn+N4pxns/H8WTjKCLD5fJFsKJHEmsETibpIRKdsprymNHODr5TVXDWpmHV9lx9w6y5
	 gHoUE1D3hVpU7idJGYxlDc3kkCYdsrqjOx7iIn9arVoEucX1CwE9miwRQXfCD8GdIs3hv
	 V+98c5YzokJ2KOSchW9HToHZWWLdXZFhzg/5bGi8GAilbvQXL06+iig6TTs4wPVVDLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
	b=XWtG7Ml64ZuSrbfpd82y0HJEyWMhUDb+o7vD8Z1WcE7pOSMkmK4erWmOpxrrh2EfxD2h
	 FPkUEN1tVsFCijk97L8ilAlgXPxGgHTneQJhdXg/erfbZgyyAWpYyNp+m7ixTXx+Up/Dv
	 +JXjxlOaQsiBe3UYKY4rwf4ZlFvRHZHc55jzTklN8Rz4RPpVH/h5isjgbQCXDCBLcvtIq
	 vJlU9CG+Zp+yKNEiGSDrhcN9z52BtWpYjYoVhYZwmzJ3pF43t5/6kZVHdvHWrtGRLiyP5
	 5q9zvw/0M8cEwM8kAf9rkYIOt9CS1zQFlWALTwaVGmEorX3nXlJqvAvpjwR5kaQYnzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7DsvLtj;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B7606A31B
	for <lkmm@lists.linux.dev>; Tue,  3 Nov 2026 19:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7DsvLtj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso2018433f8f.0
        for <lkmm@lists.linux.dev>; Tue, 03 Nov 2026 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732723; x=1794337523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
        b=Z7DsvLtj9cjTrd14M4VAX02DqcNeGnri2uwNT5I6qZjtX8uxkokhj6wF5r3ylSF1fV
         womTze4PELoCcouq+Ded9EXrVDO/QUBblg3zubwA1FRnMKnNXhiBv/7uUufjkGrlUvtg
         hqdgbVkp/MhTwm1JkpUgnL4PgOmVDr7gBHrhojzokW4vj3sCUFnbpZaa1RMWoFhccE4Z
         k9T5hMCPLomvsretLTBC9qpfjBi16z7zJw7vo+0AtHda+5EA2hvVAj1E2epp+aZEeTlb
         hG9D069homJtg18m+mxe85BGXDKnQX/ol9zuxWJsUQmZwWJ46AmU6cckay8/g21ZPlJL
         89IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732723; x=1794337523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WtXsrBXeBrmea4xy+IMxZHACmlbGQ2t5B9G23jCH2E8=;
        b=WEjXJ5oMd9i6hz7KDZx6UJeXWfExdqn0ot0nQJ5cnZD+WgY331ZAUpCeokxja5bXID
         3lCzUX49RIyinpTlHoge0gwmVlnl6j570knt78mycOmg763eArMY/d4muBxNbSAcPw9Z
         cXQwvdXE2n8FJ7tzpp/M+C3xVVHbYG40IbuTfrmdXSnIQ4iP88jSrqOFw20izZcTrD0R
         qO6FePPB13Ozlpsu7cWOeMajah2A16kD++bW05n/UdoXihoh+mVgH6VycmPEk5156ilG
         kMeAPVv6p5b09fpXRHZ3mLsEcKSAilZ1WvpXUjMV4phryOj2kr2Y1clMHFmrkJ3QzYih
         Hugg==
X-Forwarded-Encrypted: i=1; AKwUvBzYTH2WRJ7Yfedyuj7aHqTrOaQbr1oGiF6Xh8KUfhYrtjkdKQX+fSrMu21R65ghEUsXqMh+@lists.linux.dev
X-Gm-Message-State: APuU4Z/IKNtHx3Ji3YEHZiEE2myL7oPcgMLJIxTEk+y2Yg7XrrVmxIvq
	cO1nmXef+D3kZ2kNVhGPC5fH5JmiPjvT0TIi7CQasluq7DXJlHHZaafF
X-Gm-Gg: AYBFou1ffxE4RLtAGkTaUOEat/NTx2t/Qrp8yiVyDpRz986FtD24AjNnyuB8yy9WZon
	aO09ebL7UJNmw6B5TqSKrWPnptQ6W5XTwKxdkBA7O+NuDQUW10w7E2pW+TerHoeE9vEsfnwz0au
	V+WZp16oAnSHbI2N6qohf/dyui+xM8P4YQ47CT7oBPq+ow80Yh2aDIZG5ddI30ASoeC4Cp6RNQs
	IB6vbu/+6/l4kWASBkhDVrEx1uzZe7QLGzoC5sXxeUS0tXM2wJlDoI7E7+8H8L/x5mVEQSOBOoM
	u7BxZe5BX+i0+eFMNJtNSm5sR7UvMYDeVn29tI6W1cV14RbStrE3syr7+kEwjIgDhlDbwwJKP5+
	VW9j2Bz1EqU9LXkAP1Nq8tMIA6um6gUClXYzXYnD2OI+478EwWJaXOdf0hJ34ye3HcJO6nzs6L0
	zBr1iNIqYFiXZ+mu1PdROmXPtcmvx6UqkcEmpBoqLzxBk2BUqD90V6Tl/ubVIt17vuJN88GEg9z
	fcP+outuixHMvIOlzeMQ1sG+nUoV4vLTnSIF8uvX0jsebtiLnoGLjABvKhBpZjr3tzJM0FZ5HD7
	q5nTdgSOM/fSTK5kTWbcgvaWh4Xk4/FCO387s0f1E6RhKIOfMPJlJkTmfMlGjGRNTC1M0EAmMty
	vG9AI983m
X-Received: by 2002:a05:600c:8116:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4ac1913eecdmr318548705e9.25.1793732723261;
        Tue, 03 Nov 2026 11:05:23 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm4202845e9.0.2026.11.03.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:05:22 -0800 (PST)
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
Date: Tue,  3 Nov 2026 20:05:06 +0100
Message-ID: <20261103190507.1913628-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop> <178eaa0b-e7bd-455e-ac3c-f1115d731a52@paulmck-laptop>
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

On Mon, Nov 02, 2026 at 08:50:51PM -0800, Paul E. McKenney wrote:

[...]

> How about like this?

Works for me, thanks!  With it and patches 2-4 on top, two 3-minute
PREEMPT runs with kthread_do_pending_ms=10000, which hung without a fix,
and a 30-minute PREEMPT run end with "End of test: SUCCESS" and with as
many hazard pointers released as were deferred.  In one of the
kthread_do_pending_ms=10000 runs, the writer also stays in ->sync() long
enough for a writer-stall report 31 seconds after boot, and moves on by
46 seconds.

The variant from my previous reply, with the pass right after the
reader's loop, passed the same tests, but there is no need for it with
this version, so I will not send a v2.

A few small things below.

[...]

>     hazptr_torture_cleanup() stops the kthreads in random order, which

The order is fixed: do_pending, preempt, the writer, then the readers.

>     Therefore, make each reader clean up all deferred hazard pointers,
>     which means that after the last reader finishes, there can no
>     longer be any deferred hazard pointers, which means that the
>     writer can terminate promptly.

With the pass after torture_kthread_stopping(), a reader cleans up only
once hazptr_torture_cleanup() stops it, so this also relies on stopping
the readers before the writer.  Maybe worth a sentence here?

>     hazard poiners.

s/poiners/pointers/

>     from the pending lists as were deferred (reldefer: 983727 relundefer
>     983727).

These numbers come from v1's patch; with this version, the 30-minute
PREEMPT run gives reldefer: 657653 relundefer 657653.

[...]

> +	/*
> +	 * Stop the writer only after do_pending, and do_pending only after
> +	 * the readers: the writer may be waiting on hazard pointers that
> +	 * readers deferred, which do_pending releases once they stopped.
> +	 */

do_pending no longer releases them; the readers do.  Perhaps:

	/*
	 * Stop the writer only after the readers: the writer may be
	 * waiting on hazard pointers that readers deferred, which each
	 * reader releases once it is stopped.
	 */

Also, "hazptrtorture: Nest a second hazard pointer in readers" conflicts
with moving hazptr_torture_do_one_pending() up, as both add a function
after hazptr_torture_defer(); keeping both resolves it.

Thanks,
  Andrea
