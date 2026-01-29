Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAEE3803C6
	for <lkmm@lists.linux.dev>; Thu, 29 Jan 2026 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769686006; cv=pass; b=LUgMiKMlNXqlhRJIjFyB3cLSC1FiozOVlnGMjq3tmxanjDgIPAZsNhAwsqQ9GOeEcdXMpKdfyNUJrWDhCxy473T+FAEeMG9AGYjzQ8ch4d+cvOIXCjGqLAM+ZkPQE9p/+nwujIzeiwhsFoqSPDa76unLdRv1mV+aXmfp4Ww1mnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769686006; c=relaxed/simple;
	bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISMYKbHK+iMfPm78iUBmm8W6wdXM0UT3ciDlyj+6b9jqE5HdG83Zw2OpwYWDk5FQhivFUPtmQ3urqA/OxiV8YxZhnEgDagMhspEYkNw+HeT1FA4QjGFDa5V+LYz8mH+UFNWhfC7mZKcSfUdeYow2n3TXHyw0JzleDstD7XBxn7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1MOC7KN; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1MOC7KN"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233e05c77bso88371c88.1
        for <lkmm@lists.linux.dev>; Thu, 29 Jan 2026 03:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769686004; cv=none;
        d=google.com; s=arc-20240605;
        b=PzNsu+frYRzHq+Np8iYBDJFGb/ugJEd3YYiQ4xeJhQAziKXHACT2+MwbOSsLcncXsO
         wM2E7CRZz5fOk8w2JMDwdaGbfmugyIrVZP9QnN54w1MNV/bd+tEU54OOfnKvjlzJCyoS
         645wF8prWPf4n2kgKLPalFMcLusYWVIi6y03zFO4Kuh8k+tzKcnxHGOduHrv0UIkp+m3
         ZNKx1gaxWsLbmxIq/SXukwqDyADDNmju4rGkaJD957tXhLJHy+ucO7XxNyK80Du+8tk0
         AyRvfGSqxJLe9SMntE6DLpdK05nAj7u2+42NIbdmGxhKYiv65abwjRMzR+/kuwz7nt+y
         6vVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        fh=yXVpdnjzDA+8IDhmLdBuwb322UKZ7frdrbSs817QoK0=;
        b=U71JAT9B/6boU7r3xEOV771eeVZhsrAwITvT6FJthdmAVhY06FGKogUGvE7ni3Ggh+
         alscfXD9Dle5fcX03/dvBbyDPJAYf/P5xkelXKUPc6iFluSosvu097N74MmL6PU7nzzi
         DJcM5wOTWsaRRbB4qSRJ1rEpcCdkMW+cABzlOUu7mN6SZWlu7xdFWIj+Y7cmW+f9StmD
         ZoD//tySNB0J32L51YPtMhVNL+cgfDsGrc1ok8DNs+Muf4sRtGR6jG+E8+ue/rWxQWGN
         vxd9HNCEwVWhySkbywerWh75B5ZuQPtkhbc1O/Rpa6pXEq0U5fmvQi0pKYEbngd8Jg7w
         xXlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686004; x=1770290804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        b=D1MOC7KNNbT6G2IVeS6OXa3+pd2vpESldVQFQzxHpE60ATt7Z/Wsm6Yvp9K+tL7Ox1
         zhKaThV+KAHDzGGVEYtUurQuIKBQ1WcoHH44Od4CgCRoIMSMgt/GhbUKi0IqaAe7zvCK
         tjBz/beAJwfHJ+C31g/pMBwBCQuLDCDh2hseWMyeqaUBX2mxBz8txjqvDt14p9tkPdxJ
         EC8xiCFKx/yc6BrgmbJoiTZWUOnSGpbNyPieDh48x9XZ0F6xSLYn9JweQK1IQyYLoxkL
         Fae61CigA0v4NCERnSdnzNzd5GB3iQk8zTSF1qYfWZ88Vi/Oes64qEzESjDZ7rjiLzeR
         2Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686004; x=1770290804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTBwobW7blgjKHgIg8gbEPiJ438NMcLNfvtouebEM2Y=;
        b=hFFg5Qw45b1caXyNnP2qBG5T0XIiuBck31H0S++rGcZd0Gviu2Lp3UN4CF5BX1neQd
         kiDWBP6DaHBPpCveQ6Ui8eBmqYCOQ/pludlNiRBHV+Gw1QtC8lGoIWK7IFd9wkSjt9vm
         rWsM04N9DrHeINAWMH7ZzSaHady3NKGfWGP/xu04GgpBaBXYVyahYpuQ0eEnupLkK/LA
         OgJqIaZ8zZxX3F2tWrTU6ZlDKU5Gv5XXqjt+2eH95CMmpE/jTrVPIXU75fmzHsxoMXsj
         aAYmVFSkWyY+6zU7pp4r/5PZ6BcJFA+f9ChHQHz73Ydrksm7wxb7QMrL6Du2m+eg8217
         ep+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlGkxWP93AcVxNXBA1Y9KjDEpL/KIcqt02MkkhfC3l9bdA5ODhu0+6lqNCezTcMgKy60Jj@lists.linux.dev
X-Gm-Message-State: AOJu0YyRuP4n45buP3ymqkD6mwHRNY+ZIeluUaiJ0UIhWihrH6bPM+q8
	lYYc4+515kZ/M25srO9Yvm/TRUD2Lf5u8IH1mJNkg2bVnlDG2M8ovnB8Enz9/K+hBUdCwnt7yiG
	G4GhNQG7QfR8dEnQ8oskolvx8hhiRuuU=
X-Gm-Gg: AZuq6aJOnAoYWaCIwwuIZG5QhYJpp5Tijntq67pevNgiq1FElQnxGg/3KmXsF2JDN25
	cDcxkyb7JksstEc66H1hnC9x0USPptPeSgZLfq/r9mmG+RK+WIbKpiWMcnqxk8TXygjUKWpJ9Rc
	8Ou5qkCCiq40Liq99YJ7hW7W7+BtHgZiDmpSPYveOiUSt9/OvsLkxV3efQZRzK90P4kQp9OD2E1
	bponLSA2vUBcGM3AO5CYpZ4vBnW5MS6zH+2AwJXJDrs0aclQ5xkbLqZI+TX8YeJoiIXhTZNLs/C
	wAN3I1EGaZrSm0Wtz9Y/bCSxxhQMtl24OReYiNctiMxTI747SllNvoJB0d7b+ogVdpFAw26Q5fK
	zENlLPMSf1w69GLeXPoXKDIU=
X-Received: by 2002:a05:7301:4b03:b0:2af:7427:30b with SMTP id
 5a478bee46e88-2b7aeee373fmr959224eec.1.1769686004277; Thu, 29 Jan 2026
 03:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129004520.62697-1-boqun@kernel.org>
In-Reply-To: <20260129004520.62697-1-boqun@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Jan 2026 12:26:32 +0100
X-Gm-Features: AZwV_QjEigWgVtwlfTZvvep8-dxvVBHL09lG7swXUdQJFwhVozQ7aNFZLFhFcLE
Message-ID: <CANiq72=p9ZY2GWgnu=wYbNUQE3mxRsa3KMfkEnJV++X=mhTcXw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update my email address to @kernel.org
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, lkmm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 1:45=E2=80=AFAM Boqun Feng <boqun@kernel.org> wrote=
:
>
> I had issues using my gmail account multiple times this week, hence
> switch to @kernel.org.

I will apply the patch unless you or someone else wants to route it differe=
ntly.

Gmail is definitely giving pain to a few people this January...

Cheers,
Miguel
