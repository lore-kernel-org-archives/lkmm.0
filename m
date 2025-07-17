Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7AD145B27
	for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751619; cv=none; b=W4DMuHK+DKGWw0TlGRccRNzbON5a9dRXc1/uf4sPoxlHFFPEgJZX49IrKWqbYwGRUnPh7GmhFkDmwgb/SX1Y1lHaMJLH+ByQ1qp7BHq5NinstdzahRf5LTV6J2ODe18bSSHzVq9HHwbxSiSLSdKBXmP0DjQZSZ+V9uHnTKhhjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751619; c=relaxed/simple;
	bh=n5lz0P7zqJhekiegT2JchABpgJQ16TCu5PSuMlnO1/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0OCDgt6myRyY62nxUSuan037OxPdRQPdnMd8QcwmwbV21eRLueuOjQvkZIc4ut8l70Wk2eDFi5pMEjxcf0Wbv57ox4x6iVBEJM4icVQOogoYKRGaiIYVnM+0FL61+DXZzJF0aD2wJx24oqfFyccam97cMfxYFLHdfrSFzVz7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1yhn77Q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1yhn77Q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso809504a91.2
        for <lkmm@lists.linux.dev>; Thu, 17 Jul 2025 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752751617; x=1753356417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mamQmxuSC1gLOH8NTWGobgALudQdb1hsjmYCRHW0pFo=;
        b=Q1yhn77QAKx7Ft7hcX+WEAhFi1sSA5GeXaxdasWXKqSbUlmdb+i4c6gVneD/ddmLw0
         7MuTvfPjTCtYbVNbcjIVcGG3w9RZ/sEXYu3xoYWch1ZVLoY/vaoaZ6O6GxMnTF4J+BEB
         abrkfngPhdidbzat3H4c/szLIGVpoeq6rFD/u9GLnrT2DxC+R35iJraWrZ0OD7bxiZE7
         2a9bOVmDDlYQUcaSBAr1C33fYCrJzwNHVKDAcPOEeRLkdOGojhbZ32IwSB1p7abDCNgQ
         b+LK60LCSvI5zLuYI6VFTcZDJ279uWXpQnIdny48ddXy4Rj9MQ+KjPHS2NJt9SIgQRTy
         21dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752751617; x=1753356417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mamQmxuSC1gLOH8NTWGobgALudQdb1hsjmYCRHW0pFo=;
        b=Q6+uYe/vViLAjz+CLZ+gUkx2LehhkVHZlzHQcPF30gk/E7t0Ae89Zx6JXATUIB33o4
         MRkr6sa248abFkvKu0oiOI/qhZQeDCgdaLAL4mx5+e23EK4WDIYxjZZFVxCTFj7CwnB1
         8GZxV0mykdIKLh9806EDnbS/Y93gE5kf6enM7HQAFj2JI1Ym7dUGC+SSHhASnnTHIXXS
         yFGq3U53M9nnEPwKu7MiDrAhBBjlZ1iwX9TW/oXAhoFPyDbNUySG4ol8FYNd9873SDZZ
         RUuyftAgPVyuEi+1KcLQi+l7+xcaRiWhdoQ42fcoHvyRunlvOYkGcOiEQ+tEqF40899W
         K5IA==
X-Forwarded-Encrypted: i=1; AJvYcCXrO6Ly3Q0ACZh1M+vSDfDm8ZFAFAjZhKSbNysE48sJflEC9wrTPdvNyvh5FkzMRSWWlUls@lists.linux.dev
X-Gm-Message-State: AOJu0Yz83L4BFV7zlgMrOXXY0KdD0qx71sDAA8LyzQxQ6LnpBqme7+ak
	j/DDWWQvEROKQOCTB/PcMwtihI3tPVfLE+iciPykP3cRWuGoz/UXP33Q
X-Gm-Gg: ASbGncvKjrvswAX7t1WD4j02m7aHe92/R/NtGpjrzfURZjgBJQyIg3/YDfnTNDFRimq
	ziZHnhkswDfUckmzwEQj1SyyOmeZm1GAV1ZywATJEA83p1FwMQ0yPupo6tR7YYrq+suAYZtOzSR
	uWoDBJrQktD10LRd802o46rAZWwwaKqCvZwGZvOkS4i19FKXGDa0A3rv3DREB0i/PFPYFx3lgr3
	S5s8bzkft3PAPnQZHp7VeU7tHicCQVECcWaF26lon5AWo6sWfNqcyw+D0oZ9TqDRVWYZ4fH6xJ+
	nHKyiLhUbGlS7vMBZxeq3OHGI0GSG4/u/AnBxGf9kH900VlxhskCsrZ5jZYF3zSsbHEKPU8VS96
	4rXefzrEE3o1F2gM3WJd+FNPDk/p0kX1e
X-Google-Smtp-Source: AGHT+IHgByp/+dn0A3OWrLhB0GDZBc03RDMuL7JkWfT26AK/PVvD8T61v8pd5crnp3FDaRyCdZGR6g==
X-Received: by 2002:a17:90b:28cc:b0:311:b0d3:865 with SMTP id 98e67ed59e1d1-31c9e7931a3mr7920094a91.32.1752751617130;
        Thu, 17 Jul 2025 04:26:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7c3729sm1361493a91.18.2025.07.17.04.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:26:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DFA1D420A819; Thu, 17 Jul 2025 18:26:50 +0700 (WIB)
Date: Thu, 17 Jul 2025 18:26:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux RCU <rcu@vger.kernel.org>,
	Linux CPU Architectures Development <linux-arch@vger.kernel.org>,
	Linux LKMM <lkmm@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Dan Williams <dan.j.williams@intel.com>, Xavier <xavier_qy@163.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 0/4] Convert atomic_*.txt and memory-barriers.txt to reST
Message-ID: <aHjd-oisajaKW_Z5@archie.me>
References: <20250717080617.35577-1-bagasdotme@gmail.com>
 <20250717105554.GA1479557@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JBAf7wDkA/Ps+xxf"
Content-Disposition: inline
In-Reply-To: <20250717105554.GA1479557@noisy.programming.kicks-ass.net>


--JBAf7wDkA/Ps+xxf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 12:55:54PM +0200, Peter Zijlstra wrote:
> On Thu, Jul 17, 2025 at 03:06:13PM +0700, Bagas Sanjaya wrote:
> > Bagas Sanjaya (4):
> >   Documentation: memory-barriers: Convert to reST format
> >   Documentation: atomic_bitops: Convert to reST format
> >   Documentation: atomic_t: Convert to reST format
> >   Documentation: atomic_bitops, atomic_t, memory-barriers: Link to
> >     newly-converted docs
>=20
> NAK
>=20
> If these are merged I will no longer touch / update these files.

Why? Do you mean these docs should be kept as-is (not converted)? Jon wrote
in e40573a43d163a that the conversion were opposed but AFAIK I can't find
the rationale on lore.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--JBAf7wDkA/Ps+xxf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaHjd9QAKCRD2uYlJVVFO
o5gTAP9lBzNcAUcWTLaW0MwlnQrRBczAAM2O5+rQWHZiuprqawD9ETZgMoUlvAOY
cmL08HFZ09BvD9UIA2iITCiObHR22QA=
=vYMt
-----END PGP SIGNATURE-----

--JBAf7wDkA/Ps+xxf--
