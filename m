Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285345;
	b=1QSw/Ehung58Bb8TFdDQGfW75a7taxlj2is8wl/ngYCW1HfsIFYdcJrrzUgm3ZIukpu4
	 8BEn1ouhbMC99P1yJV0qumA0ubvEbKe3Zd6wLGVh7dBJebfe6Hd7rPxBPuZuVGI0ZDtEP
	 191kzUUsfepsSEUaNCTkkz2ZxwH6U43S2nef0lJub2dI5S39TCFffukymYdregJP3fXiy
	 eqAi5tBVXO5EUsS0ZLc1Q2ZFaIH/42hPq9L61cRzGAymnx3r2F4nnucqziGeXXj2HGId7
	 0s/WQV4MyZdNDTwXomupER2y5j0OaLwZ446gOrW5wtQwQyBSjnV5/yCB2MjOtfgHolQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
	b=GClNKmSI7VAG6kAH2b3/hWZEbTz9hcLWfVYkgsXVJo+28Jccgq5CLM6NtJOsFytT5Ul0
	 syd5JSPBcSRcRZDK1AKdO0LBpdwWbXrDRGXTWJjJT/hrYIONKnh4cdZbVmN/Mq4fwVlvn
	 1LjwRm1qt16Yt9oOA9DuPsaBgwJazcK9zjA6JrtvT52pet1eTEPAuvGULYKughz8XrpZn
	 xTlr4pwtpitQVBkec19TcY88joNtfYomYAXru7pkkDvnTUmjRpIY/eClUJNGMoxBfEyjF
	 aKmsWaHv0dp3Ws4JC6/sm5snsKhPHY96hDe11CD57jBdHuswdgCHj69PmIabENEp5Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9ZAnohs;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDE606A320
	for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 14:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6CDE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O9ZAnohs
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20524015e9.1
        for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285343; x=1793890143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
        b=O9ZAnohsHI81Rwd2MAGMwVCg2FQkSJQFZSWvBRJfbkHBJ3+uGT42NEtAm/qsBmDfXm
         M0/BMFGHCc4aXAqbOPrUoiLQa0BQeLxyU6a/MBR8dR5V/BVeblBSa0zriLiswtgK27ys
         qUdyJQLreZBqB4qQA5GuQtaf2WKDatwjfxwKYj3FB3Iu8lIGIu1k6CLlqRmz5Ig6ss1k
         AMxUnQO+KfOTCl2ieRoe22ndj1ySi5whcHmNmbxhuPHaiyTrztRgnhJuZwFjk8AEvcW8
         eehfR5EttktlFumor0DpmJ0gDLY8Nq1sgQJVnCuD5QJK4wB5MaY9LhtAkOMVadFI4Zpe
         Ej/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285343; x=1793890143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=11yI6X7RNJHkj59+rMm7KEGQ4tLy1r9EmEZe830OAuk=;
        b=bLURSS8tv010UgSKRRPsyCTP/TBsS2YE0vCvkW8BjPzlDgxYSSZ5CqCu/lnoeV3sW6
         WoGde1jgC53I+FzUKWhnFTyV/M3GOhAGxEYePlJ8vFkakWeNAm98KI5M3NJj4AavljHU
         qluhYkQ08TKVS0S5qSqnR/y2n9DUBMiPgsoubqEXYfPfPO4+SGOoPWK0csGX7ycbsgKz
         5Ax0/e1IapKKpPL+/MtpANb3wMBJyKUTCIGWbetjJxmkNPmeKm/iJpl3TO57f9RilEmO
         yvMAH+/MrOPZVw6HsY5RchGR4BCiR911Fo4ygwiZuPFSLy+BinEY1rkwhP8jC6m190hF
         wrZA==
X-Forwarded-Encrypted: i=1; AKwUvBxVvLCRPF/NrsE7GFOP+XQ3dyVoWUBzHbhjYV/s+ekRtbfUJ1fZ9xIWvpmJPdZBCE4pQGlU@lists.linux.dev
X-Gm-Message-State: AFq9FYImB5YxDsw6bgPKB5ci5mAq0N/IJEUQ6FiTW5nto4aKwtVCVIRZ
	6Mg7IQsDKrUS+MY4lRBIt8+vwc0bFH8fn/y43VMr9PWiitk7jZzICczM
X-Gm-Gg: AYBFou1cNCScUygBqx/RydD98rNLCbMTbZqcE5WgtnB6m9l6/SefqAj9DM9PBghlex7
	nkwLwphtAHroyT36g3Dnq9bSqWHa9AFqUxSzpulQh42cWvvYOW8rBLQnuTKzfreOgT1K4hmfmYP
	4eehjWC+wYo//PWUBvnIPGqBc2aLsfnuxMlwy0hrtV0vxmIb4LG+7MJjIcEvqTEHWhSoRiMk8/P
	w/BbmKt7ktLk+dMM4AGd9E4YeOzn8spwAcOlQoWB+yaCw7C11i78v2enapfUxvsA4a7d03TUED1
	WwBPrvsd/d60LP2Vmht/KeBQlysWkSEsv45jCCGE0ISYyt33FOlumIm2jHkT/lgOUjUAcvyQt+N
	0VjYBR0NrZSdVXtdt3wtPeZWKEiibWYT8H+HOsHxhgBfODgDJpLvuOC5h3q0JPcDpERf6PM/AgS
	+zoD8BcZDMorrmEW8NBeFc0xpoa/9A9QXkIXecywnAjkNkkUVJruoFUla13Jirwluf8AWgaci0/
	BB00yYWJdBboaPI5xWTK02HYIVQmkwNG4FdFNxsdgBuMuZUb1PraMvUW6NJPRjzFuX5ZqCVGx6S
	3jwJDiOzrDjlezDTd/YY2mwc2Y6G0NqlVFHFiD6Aq8xilgP6vcZtmbSi7swnQ85lhP5ZmRVn5x4
	02PZE
X-Received: by 2002:a05:600c:1d1a:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4a966c4111amr126768575e9.17.1793285343088;
        Thu, 29 Oct 2026 07:49:03 -0700 (PDT)
Received: from andreayoga.localdomain ([151.57.246.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm66634665e9.2.2026.10.29.07.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:49:02 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -rcu/dev 0/4] hazptrtorture: Fix shutdown hang and catch slot owner race
Date: Thu, 29 Oct 2026 15:48:53 +0100
Message-ID: <20261029144855.213308-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <CAN_Opa8OyyuveYo7VyfQb4rDtUmw_m-25OSXSqwpzfOnGqwEpQ@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 05:58:27PM +0800, KunWu Chan wrote:
> I ran into both issues independently while developing new shared-scan
> hazptr series and its torture-test scenarios.

Thank you for testing these, and for the arm64 data points!

[...]

> Paul's concern about `torture_must_stop()` is valid: `fullstop` can make the
> drainer exit before the readers have stopped, so its exit-time flush is not
> necessarily final. The reader-exit approach looks worth testing against both
> the forced-slowpath case and the PREEMPT scenario Andrea reported.

do_pending does leave its loop then, but v1's for_each_possible_cpu()
pass comes after torture_kthread_stopping(), which returns only once
hazptr_torture_cleanup() stops do_pending, after the readers.  Either
way, I have been testing Paul's suggestion of a pass after each
reader's loop, without v1's pass in do_pending.

[...]

> These tests independently reproduced both issues in my setup. I'll check the
> final cleanup approach against the forced-slowpath scenario as the
> series settles.

That would be very helpful, thank you.

Thanks,
  Andrea
