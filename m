Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285270;
	b=zHpK24fwG3jdRKJiaM9dd2GtzCC3EoSYZYEYcRcBsT2y+LvFZ8ik5hjrYkxwQekXDMgF
	 UlYd/i2obC0J1AilSAwNwtIHidhTT0an5WBhnwmD6HPWm7qv/bDbdV8qm+HJG5WG2akNC
	 OQjCC3JIq2HKj93BzX3zOnel7tDobulr7S8TRODjTyxejDjWdwi3xygZM7H+3JQv0aAnx
	 eYJMfpgsFJhfDsQsZ5BPl4PpLh/K0FqH9ZrwfW50GYHmFZSA9E0qn1ofrMk3WkQWnlHWC
	 SybN4led9KKKIPSqGnPP1aS8YVJCHNrZbst4I/KifXpvM7rAKqmUx4cLVsXXtxSLaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
	b=c1K1IijKNipvUqD6ZKY7t+DNM+C8DvFSosJPHNue1u8bdVv+9egn/eWyu1KKyp1af8Gt
	 65gi2NGH7nSCVs1SnKPVnVlKsWcxS3+c15fE13bjWPUjIqyBrvfNWrdQrvrlfNBsEu1jb
	 4IJiXtTajKguaHMXUkfN9oN8efQJz0BgSiWoqhsSBf2lrUaJc2uYTmk3jB585g1c8zoPj
	 zfhs/fsAuPjUDxhKAleW4oDTylUXPTmA4PnjzoBeQCKghUsLj8K7+T3WtmvN67oD0TYEZ
	 +kuWMgosXorUFNf6RduSc+6bHzYdXFH5ybL9NYEwydN1LRbAHLZJ66Y0qskhVKsROBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eTZ/N+7P";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3D4606A31E
	for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 14:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTZ/N+7P
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so23902245e9.1
        for <lkmm@lists.linux.dev>; Thu, 29 Oct 2026 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793285268; x=1793890068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
        b=eTZ/N+7PXFBc9P07ubWZkJwgeG+JrMTCoy5Kt6but0eV5ITge+D4RKndepbOX102yG
         fzMrHP8lmcNuiJNuxiNnS0WClwDV/+k6YlSov419RiZUJCULwCEw+T04b3EH053joXFX
         U/+Srf3Gra5blrvh2SQEfKobB9FsptGMGv2AubaZS26vQ76i7sjkWLVGNoGt3gydhkWP
         cs0QP+/KmbarUTX+FJg3P2N4/Li88SwbkQBuhqGyDaD38QbgoFJ/W0iCM3Fs2FdYxwEP
         FAMt6vXCJEW0i+Z2eNBvc/iw2ygZtVVHWb406qysBoeJ5i/VsOO53WOpoEgaEvym+LHu
         uxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285268; x=1793890068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2RLRcd4jJhvrI7zbg6jPMwuOd13g8I2G+u3G4j4wno=;
        b=16MXhnW68A3x80DHvte2p6LjSVeY3eccfG0W1IX4Of4xBnJ7zqLMVAKNAJMEnmco5u
         SLEDxWNu/D/8YnjbuhyiG1aVX4M2Ltnv639xB7GT1/prqB4oxTsE77wFzJwvN3MBxtnt
         8L/KziuTAqPdPjDQQV4VKTfuGpNilAn/s5PRjuu0GBH94Epw7SVXTPXttzzFw1hsdfRf
         zZkXpjIL6I74CQsRNk/FPIpCY3V2pXoWiiXqwFDNnp/A1aXxH/qyIgE3MM2z56rW3STA
         SvZ6qD6rxyTmntY5YgbUqgocXvpDkDuVdpTzHS3rFr1u+VfYRUB7GrxhQ9R7Ohh/PBvF
         x3Xg==
X-Forwarded-Encrypted: i=1; AKwUvBx+oeUlvYtDpwBQiGlCtgrXQXxWzc++oGfgcvlc5ZVDvA7a0TgweAgGrf7Nl/kDZ3V+CG65@lists.linux.dev
X-Gm-Message-State: AFq9FYIuv8PoYoJAFW1GltUsG8RXDpz4rMLDBS4+8MXrFS8uR0jzrG08
	86tIA4GdfTYebLNYabTi3/epkuilBFQmLyB+13MwLXF3UHUqQMdFC8gy
X-Gm-Gg: AYBFou3ADmLahNkmd1NKvlUYUpAluRiEGybVS1FzoFApph/7RWgyEB4iuZ6A2FsYw1B
	NhY1fe3etx9xwhxtZ7zw1irOHE5jvegigV2uuUrE+FbcZC+9qPVCa+aivrQPy8gOHg0Hyd3VtuZ
	L2RqJ/s2EoOlmf7ugCRYJTpZL/Ri8gpo8OvLenIHUZmbyk3qXcgyhffe7jWirmXQW69vp4Y3ocJ
	u3t8HhaZgvto8v7XrynEvK4Ea83GoG5slrG2wUWnLgX4P5H5RtYrlPKp8VOL+ngzL+gVFFYYLx2
	jw+XOuzzK0sfNgIrmBlGzvXJVV62MwEn2At7NVvJbQw/86uVn4FWhsLOrYi5220Dp7tDA0n7XOd
	eseloWHns+FdZ9b+kLhmb5WSM6kst+G24Ywwj79Gf/LLfi8nx/SUC51/myLWNHJEDPxDNVBKfQL
	0v7UBQ1SHDuIcumMsz2mU4fz/llFdCUcZQNJFUnYT2LHSYa8pmUk1AVZgRm311qrMdG8cec8Zwc
	sm9ALaTFt17WgrPSZ1WOQApr9tijyoMBi58Q3jLtEsv+ZoLeCT8FtdHaCu3ypq0oT6jh5ctzmHI
	Appjd52QLhnoy5SsF6TUehJsNND4QPtkU/HDGa7SG9O082l1MvHJh/Xv+gg3VMTD3D6hR1oHDae
	usztT
X-Received: by 2002:a05:600c:4e03:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a963ffcf87mr130861115e9.2.1793285268267;
        Thu, 29 Oct 2026 07:47:48 -0700 (PDT)
Received: from andreayoga.localdomain ([151.57.246.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm71561005e9.0.2026.10.29.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:47:47 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 15:47:28 +0100
Message-ID: <20261029144730.213196-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop>
References: <20261027163811.2470569-1-parri.andrea@gmail.com> <20261027163811.2470569-2-parri.andrea@gmail.com> <eb59edbb-c6e8-49c6-a426-c55cdb792853@paulmck-laptop> <9da03ed6-fea2-44df-8aee-f7a61a1d35ce@paulmck-laptop>
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

On Wed, Oct 28, 2026 at 04:51:12PM -0700, Paul E. McKenney wrote:
> On Wed, Oct 28, 2026 at 10:26:18AM -0700, Paul E. McKenney wrote:

[...]

> > So doesn't the above torture_must_stop() instead need to be
> > kthread_should_stop()?
> >
> > As it is, hazptr_torture_do_pending() will still stop before the
> > hazptr_torture_reader() instances do, correct?

Its loop does exit first, but v1's for_each_possible_cpu() pass comes
after torture_kthread_stopping(), which returns only once
hazptr_torture_cleanup() stops do_pending, after the readers.

> Well, one thing that I am missing is that changing from
> torture_must_stop() to kthread_should_stop() might cause trouble
> if rcutorture execution is terminated by system shutdown.

Agreed: on a shutdown that hazptrtorture did not start itself, the
reboot notifier sets FULLSTOP_SHUTDOWN, and nothing calls
kthread_stop().

> So my next suggestion is that this be added just after
> hazptr_torture_reader() exits its do-while loop:
>
> 	for_each_possible_cpu(cpu)
> 		hazptr_torture_do_one_pending(cpu, &rand);
>
> Thoughts?

Works for me, thanks!  I have been testing it, instead of the
for_each_possible_cpu() pass that v1 adds after
torture_kthread_stopping(), and keeping the torture_must_stop() loop
condition.  I will send v2 with it if it holds up.

Thanks,
  Andrea
