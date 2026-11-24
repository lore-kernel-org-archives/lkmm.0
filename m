Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494382;
	b=qHPciFAEuMY+RsXK6R0nwobHfRGZY9IlVakvti8loRcA5khTorWVdgid3ImN6vmjnHhG
	 rkNXJPIDCFh0951KvUM2hbjZI9gqhcIyPXAijuG5RmGM+dQEI/Z3Wanv0UCrz844Kec2H
	 UYEPFbVGF6HRh36f/N8FZh54kbD6urXZyfOYQikKfHqPv6imSKoKoyguU5lNiAmzUyRKe
	 ZesG5TfsIsbOyzvxcJPhDZ3cTQUxpB65yc1ZbCvwdbuTaeetDh1kiReWZwmi+KBRf0Dgp
	 DL5rPQUltBUAMQLX587oKEy8SEoTBIWscTaFnPSIxV9sM2X6v2U4OF8P/psaVTME+xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=aIci3Qk7fN5eLXhpIXDm+EfzO1nSUnwHA6TBtJc3Q/g=;
	b=kuwNYUV7rBKg7Yql6kdPbP7use9r0vlolsdNK7mnRjytVeZBySAp/CLBz/G/EPY/KqGe
	 8pVPiGbTKnBbYjUrbQDhcRtw0hRiNzBLuavkSv5QWKutdC1AHf0OUPv2BmylmKbNHNGH1
	 PUas1EiFn5nSetHLw5ZxsevDNjRWuFnOO5prsQy8RsV5ZAIoZPW7gLZxcCVSbD1cw9SrE
	 Z3IKIX9EFJjCLsFkmQjf38jJLhBxdLNYQMdFCkPgesE8Pi8Up+zHdBfnwaZwhtVoaQADj
	 6E6a5yesbm9mhpdghc9o43NDYPBStWnvv16l3e38WCtRnoWncvnpHUm2RZdCdBF35uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="WOS+z/Gw";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42642606A31E
	for <lkmm@lists.linux.dev>; Tue, 24 Nov 2026 04:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42642606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wayneyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WOS+z/Gw
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5045708eec.1
        for <lkmm@lists.linux.dev>; Mon, 23 Nov 2026 20:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795494381; x=1796099181; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIci3Qk7fN5eLXhpIXDm+EfzO1nSUnwHA6TBtJc3Q/g=;
        b=WOS+z/Gw6hVcPyd5cSMHo7cyOIJUuulc8rNzCNP/c4J4IOzCCcPPFDP8Irtd7Xuave
         ELKvOHgtkJD3gEzb0nqdvP8/g0uEIZo/BsXdYPQMsNj5UoJ35/Jw7RGci7moMS6Sxp1Z
         FHC78Gc/CVshSy5x5XhWCEzYl0gxT6UMCWxDBZA0zIVWkbglfFiSo0A1nI3qPtlkqvP0
         /G+tk3WMr4xD4/UXDbaMur5Mem5KOSNXLsCsh4GuLyRgKoVWY4drQAH+D+coPIj3uNRI
         2TII3vPMUak89TvKyaQ6VQqVefZi+zr2Fnb43EVp5EAs4hpsQkClLAk2RlqifdpoC4+d
         PrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494381; x=1796099181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIci3Qk7fN5eLXhpIXDm+EfzO1nSUnwHA6TBtJc3Q/g=;
        b=HvK7AYud29wjCWCtYlj6IJZTbRoi299Kd9c7MMIv2zcptzAC74ScfUWZwFZBUx5OBt
         30jcHK5ZHnZOTP57Ly/VovwV8tflth1n9YFKyKwWsB6oc7u5n019Y3u2njHDv9LerYa9
         mfKFvikSbHRcRK+FsW7OkQ9dSb8Ctro+sVg7PUgXsJ+J9A8fqa2KpfeN07Z3pD2/UMMv
         kzmhSxuPNaU94DOdiUek7rvev/2ptTzm5/8sNbMAN4B8aDr2l1ymrEfkur4W87UvYlCI
         jqEJC1E33p1sB6LKYwffGcnb3PK4QM31OPBi631r04+85AZTUh9elnOSg/5EjpEANLJE
         JGzA==
X-Gm-Message-State: APuU4Z8qqS+m+HHydmGib7zx78S8PYe9S2kO+ExanhuzVGextaRQTiEF
	aLXtZ2+7KViy+52OzwcG3EcqegN3hWUTxzeqKGgv/cc+5HeJlb1E6axvWELYay+TJBLfuL64n8J
	K11rIrEP7Ecm3Sw==
X-Received: from dlgj1-n1.prod.google.com ([2002:a05:7023:e41:10b0:1a7:2bf1:46cc])
 (user=wayneyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701a:cc95:20b0:144:fa57:c617 with SMTP id a92af1059eb24-1b5568f1200mr12791401c88.34.1795494380844;
 Mon, 23 Nov 2026 20:26:20 -0800 (PST)
Date: Tue, 24 Nov 2026 12:26:18 +0800
In-Reply-To: <3422c76c-67ca-4314-bc82-4f6b35f9ece4@rowland.harvard.edu>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261120083620.2186353-1-wayneyan@google.com> <e14d32d9-1734-4e55-8ad2-9c8aa0b49c9a@rowland.harvard.edu>
 <20261123043314.819493-1-wayneyan@google.com> <3422c76c-67ca-4314-bc82-4f6b35f9ece4@rowland.harvard.edu>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124042618.1239002-1-wayneyan@google.com>
Subject: Re: Question on (prop \ id) & int excluding non-trivial self-links
From: Wayne Yan <wayneyan@google.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: lkmm@lists.linux.dev, Jonas Oberhauser <jonas.oberhauser@huawei.com>, 
	Andrea Parri <parri.andrea@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, Mars Cheng <marscheng@google.com>, 
	Kuan-Wei Chiu <visitorckw@google.com>, Wayne Yan <wayneyan@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 09:58:34AM -0500, Alan Stern wrote:
> How does your memory model express the relation between two MMIO-mapped
> addresses of being on the same device?

For now we assume all MMIO variables in a litmus test belong to a
single peripheral. Supporting multiple distinct peripherals in one
test would probably require changes to the herd7 runtime that we
haven't looked into yet.

> Does the model include things like PCI's posted writes?

We don't model a PCI bus explicitly; we only constrain what
memory-barriers.txt and device-io.rst guarantee and nothing else, so
writeX() ordering stays loose enough to allow posted-write effects
unless flushed.

For example, in this test:

  P0(int *reg, int *buf)
  {
  	int r1;

  	writel(1, reg);
  	r1 = READ_ONCE(*buf);
  }

  P1(int *reg, int *buf)
  {
  	int r2;

  	WRITE_ONCE(*buf, 1);
  	mb();
  	r2 = readl(reg);
  }

  exists (0:r1=0 /\ 1:r2=0)

0:r1=0 /\ 1:r2=0 is allowed because writel() is only ordered after
prior RAM writes, so P0 can execute READ_ONCE(*buf) while writel() is
still posted in flight.

Instead, inserting a readl(reg); flush right after writel(1, reg); on
P0 makes the outcome forbidden because writel() is ordered before
readl() to the same peripheral and readl() completes before subsequent
RAM reads, matching the readback flush pattern in device-io.rst.

Similarly, under a spinlock:

  P0(int *reg, int *x, spinlock_t *l)
  {
  	spin_lock(l);
  	writel(1, reg);
  	WRITE_ONCE(*x, 1);
  	spin_unlock(l);
  }

  P1(int *reg, int *x, spinlock_t *l)
  {
  	int r0;
  	int r1;

  	spin_lock(l);
  	r0 = READ_ONCE(*x);
  	if (r0)
  		r1 = readl(reg);
  	spin_unlock(l);
  }

  exists (1:r0=1 /\ 1:r1=0)

1:r0=1 /\ 1:r1=0 is still allowed because spinlocks only order
writeX() against a later lock holder's writeX().

Thanks,
Wayne
