Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD4318EFF
	for <lkmm@lists.linux.dev>; Mon, 12 Oct 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792865; cv=none; b=AYEeI8dax1gU/e0/+TvVvUGUuYNzikbCBcakMo+cPACknmByI+O2MZ7BH1Hn11k53A1W3gZMBOnBsQMHtiLD5DZ1ctIjgU6eNR6uxDZDIvuECxhcmiIbKo1ThRBixySxzSGlS97QUDxSoQdPpJp4NWAdxgztg5adQrEt2Gq/49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792865; c=relaxed/simple;
	bh=xxtcnQ2p520nCwaMtIRUXBpN5cKppQiHY+3psB1PDCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWo4SgRbo6BntQDaWxPvwbqfMxQUcLjOvoo5TNpMd7D+/DxdrzRzYMvHTq/P4w/0+ptztBFxKBQuHBTv/yCCOUvZByfJEazO1TLnm653EcDJztdxoy0h8EWwPjUsJf5aStSg3dAxM/e8M5XlYBgixvqpRGs2Zbh7xWOwybihd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6WuiFCj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6WuiFCj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so19526775e9.0
        for <lkmm@lists.linux.dev>; Mon, 12 Oct 2026 01:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791792862; x=1792397662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFWZRnIucg2NcWdbhXql7kmMuAfL5coJ0dPwErOelCU=;
        b=S6WuiFCj5AYOcKZgSJzZ0ngy757NnrdNyY1nOtNZy2cxAlUc6Bt1GPkzrIBWs54QPE
         EEDxsB8Gf2ykFKoan54I0Sg/qQyMxmafXYDPrewg7tXh9uTluddubwXRbJNwwIklPw86
         nKbOzhF6Ax0IuvOKUkSgIK43mQugvALsooo3Xdqi32n/smT+QjVze43YJF64DnfTza1x
         iDFLNCTKvHCAjWCeMAVsHImG8LhboR+3X7X4Mh+oE1Q4hUH/fb7fSVf+g04KIcQ4U30J
         glWGPhw8CiFEQto0pDwNgunS/2BPxfskvAUBuY4Rb+d6Dw/f2pvHsY6ZzdDvmOBpG1vi
         cxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792862; x=1792397662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFWZRnIucg2NcWdbhXql7kmMuAfL5coJ0dPwErOelCU=;
        b=pyK+nLlIWh5YbO/m7ka+mQzS8H7frxGCWnAbCNY5yOWUs1Xtu65xdstnt1t8hvDZyb
         KK4EiA0pgvTOSA2lvxvJtLISeY0P1M8+fiQVZ7sVe0Zhf3eECCmk47FzzKicVAlz7a6m
         P5cvgIlN5shhrHPptJiqNbW4Vv52mE+vJtTHWF94+75RGGckv56JW5TSlEUVTQl93vSF
         fjgyQXLwDjyjUShk86OdYGrHRr1yi+vrB8IWBrLoASmKc9CjWpFehtriE8OtNut4O0Db
         L7IdlZDaYe5IbiKxymv6r/YI7rrCE/q20EUNggcawM3lMIK1QeQ+h023JW6sdvYSDG5Z
         8xTw==
X-Forwarded-Encrypted: i=1; AKwUvBwir8Tc0y3Y707CGwvNAaieno7Cngv1CpK+alHoEJUcWTbbeYVdJUsHRWyVc1OSevgeen0u@lists.linux.dev
X-Gm-Message-State: AFq9FYLV5Eg6Lm1Y7VtNrx96zLNmOeY9ADjYk264W4vhVGmodCilmJbq
	QwLy5fRmSy4URwq53HBYMpwimBX6ICx40eEaV/Ywdd7XdxFtHTnMdAM4
X-Gm-Gg: AYBFou3yoxrmnGe9RlgaDn0e9US1BLroGFkPw/w5cRg1+yjDFq17IpOPxNqK4j+Fhb/
	kzjHUQLg99YetLdGiLCtlzHe97XtnNT+i6/HG9UAcbQt/b8r35PVjc75hJbqQkRZbARYw5wKdMV
	iedmBbeyso964ijc8T9K+TX9B3irtG3ms7o4ql6YRaxLsLVCGAIlTl+JjgsHPtrb300vNf5eIDt
	7RryVwBg5keTyzBPyQcZc19yGz5Km90i8zCYUpAyxvE2y/YG4+cbjCDKjBAALFTloqmAgB9JOQ9
	hQDiX6m2DhWlLidRkMA1oVwyxXjLJcH9ygqmKUpHxCb8+UY44/f0IdvcTggggUu0lkrjOycDAHg
	+/wkUhbF6gqA5LO4KHvOoc8ZuIf1z6IVenGdGxu2bw1JG4ZSflaGUyqBHHqILU1JGvEKI+fzj6n
	OKdYB4wMZVXVypCe5baHHCqeCdQB6rDD4B6XNckWrahizUqJJqRVITlX1hiN2DCpMBZaxMPNbbe
	wz263mOJTRwtbkHjVd5Y5BXvZn9ezO2TfDoUMumNggD
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr162095315e9.19.1791792862176;
        Mon, 12 Oct 2026 01:14:22 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.59.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm432059985e9.4.2026.10.12.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:14:21 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	lkmm@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation/litmus-tests: add the mnt_get_count() barrier tests
Date: Mon, 12 Oct 2026 10:14:08 +0200
Message-ID: <20261012081409.7590-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011-work-mount-fixes-5-v1-2-a9b9a8ecf565@kernel.org>
References: <20261011-work-mount-fixes-5-v1-0-a9b9a8ecf565@kernel.org> <20261011-work-mount-fixes-5-v1-2-a9b9a8ecf565@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026 at 05:30:45PM +0200, Christian Brauner wrote:

[...]

> +	r1 = READ_ONCE(*seq);
> +	if (r1 == 0) {
> +		WRITE_ONCE(*gets_w, 1);
> +		smp_mb();
> +		smp_rmb();
> +		r2 = READ_ONCE(*seq);
> +		if (r2 != 0) {
> +			spin_lock(mlock);
> +			r3 = READ_ONCE(*flags);
> +			if (r3 != 0) {
> +				WRITE_ONCE(*puts_w, 1);
> +			}
> +			spin_unlock(mlock);
> +		}
> +	}

[...]

> +filter (0:r0=0)
> +exists (0:r1=0 /\ 0:r2=0 /\ freed=1)

The "exists" clause requires 0:r2=0, so the "r2 != 0" branch is never
taken in the executions it checks; puts_w stays 0 and the "r3 == r1"
test in P1 reduces to "r3 == 0".

Going further, both tests stay "Never" with every smp_rmb(), smp_wmb(),
spin_lock() and spin_unlock() removed, keeping only the two smp_mb()s:

  Observation mnt-slowpath-sum-no-outer-mb-mbonly Never 0 10
  Observation mnt-umount-busy-sum-no-outer-mb-mbonly Never 0 9

So the seqlock barriers and the mount_lock handoff play no part in the
result.

What remains is SB with smp_mb() on both sides (gets_w and seq), the same
as tools/memory-model/litmus-tests/SB+fencembonceonces.litmus.  Should the
tests be cut down to that, with a comment mapping the variables to
fs/namespace.c, or dropped in favour of citing the existing test?  As
posted, they look like they check the MNT_DOOMED/MNT_SYNC_UMOUNT handoff
under mount_lock.

  Andrea
