Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A21E25E3
	for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752908928; cv=none; b=hFYn6U9GAjZdn1wZBHvtL+PNPpDN70ST9ubEYispsCBUwCvk51Wh+lOHxpo5aFV6Omgj3SXcAmrzLW9f8HQ9hp80SvA5t0QYnM/lJVa6nFNBlAa09yPPDrawN1Q1X3axgar+ncu7vTXvhWfYD6/7zhSXuL1INLv3b5MOK9dY/oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752908928; c=relaxed/simple;
	bh=vufT61B0JmqwAIxP7VPqMs0HC4W5rnfofR5tYibjGiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuepfvtDx32JoxNpqspd/m5q2xPTwQdONgHoWXkla9/qKcHGxihOQ/dn23IzI+hhVnWC6+nlcsX/Dp0SHC/CyMbzKBP0GfYmPdXIIFQci05F43rIIccOwZcOY0AiGhfF/o0rTiENpl6CifP218MYqjfLVXEAkhr42XGSVJHF+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfIfgwmO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfIfgwmO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so5874644a12.1
        for <lkmm@lists.linux.dev>; Sat, 19 Jul 2025 00:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752908925; x=1753513725; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UT5HypfoUTQWMwocYzVj5Hl5OahvJzyO3VxVcUyzP0k=;
        b=UfIfgwmOQokSmCR58NwsWMT18HXw5L7XsoCM2JbODJgKFNJuiDx0/x/aAeGPXBzL4V
         auEGYuHfvWXAH4SlcX5OaJmB1jGgcZ79H75gvftushQmT848c1i0URKVw0b7PWCjg/BC
         8KSc2wnjTvVVVqBK//GNyhxHQyInn0z5wMcP5JrxhCgg+/BfJKp7abtYEDZgPLYBKfIL
         JgQVOveDgX5/UEX3/Tfcw/NZICjCUH6+cjAra4hcx+3Gm5uVS6AzZHmnpCiKbOHzuR+Z
         CNPYV5nFdm/Ki+u7HfAtKq56tnTKXLJJ/XI2vzjYIolxm2l3p7A01ASMNALGeVES8oUR
         hrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752908925; x=1753513725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT5HypfoUTQWMwocYzVj5Hl5OahvJzyO3VxVcUyzP0k=;
        b=U56CfxFcb6LnM+cgkErsyh2sxL1oaMatEpqYgZa7+NdXEKxwFU8Ji34u+EVJVqfCjw
         /KxpdRdpsC/l2ZDnYBiBz74ULujN7jbYY6mTIrIAuWzQUqZEbgXHBeeKy04BdYyJ8zkO
         4b4Ez0jyB2xOmg+1afUUikGynLwYW7Bcw4Ty8v7ULMM3/b1Ww1kAexT+0pWqYKsCf8kv
         8i5ILlwpqyiaDMgfXmj79pfIEt8zLrIwl6ZTSrbWOoLt+9YCN075yW8qhY1qdiVwdpNQ
         aDfcAp07P+JsCc9rlpfl2MpaMyxJdUPLb7y9Gq3K1OK9CEY/fZ7pJFgEamHZJg6eXifU
         Eh6A==
X-Forwarded-Encrypted: i=1; AJvYcCUizzeQ8dJyFbZbA63KwgKyVexuPyK/jc9bISFQufuHAMHdt3oaEeIEeAX6DHaEYgH8xaSY@lists.linux.dev
X-Gm-Message-State: AOJu0YzB8AMdsDetaFKwuzyXDjfYiq+yRulhLnBxIgK99ACIxaaosHuY
	Lvgh3pdHtFJrlwvGJ2hMnhmKI+q7wjSv17iphGiSbkcq6FozXiDlVh9D
X-Gm-Gg: ASbGncvmPFcVMEw+TzCOqOWIbxMCDcldC3wgXbWlBA7IGq2zx0SWi5pHy1TfqNNl5vb
	fmbbGUADb3zTBQNp+2KGWGDllxzNSPF+1yaRuH7GPC4hdB/0+8HJfhiyw3MUKcOyu1zmhqhezlu
	nUYCxlvhhL/+F1w9XFqk0oeAxxYgAvkt1cLC+8RxwS1o07shrudN6zKbV9jugUKCW35gs7XuYR6
	71q3sCdW6fNm4q+QVdRmPRzR6uaWXEdq2HYiTEEKmiy4Mfmw1j+bonHd1STrVVUl9GcNz4qiGl8
	Fyyp0pj0y2Ktp9NjY8xO9DlHGagdYCcYl5yfqp3b9PlzMzGX14IDvpaUEIba+HBqqPZ+6/FwQ+9
	ufuU4N6cZRXwn+veXb6IjxQ==
X-Google-Smtp-Source: AGHT+IFThgtoJuSP5FXWdNpEpQ5czog6sgr2fMyqs2egrXeD+Pi/tn7lPVEjYiDM63dPY9Wul0I/mA==
X-Received: by 2002:a17:907:7208:b0:ad5:8412:1c9 with SMTP id a640c23a62f3a-aec6a674779mr480258166b.59.1752908924588;
        Sat, 19 Jul 2025 00:08:44 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8357sm253986566b.52.2025.07.19.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 00:08:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 87B73423BF32; Sat, 19 Jul 2025 14:08:38 +0700 (WIB)
Date: Sat, 19 Jul 2025 14:08:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <aHtEdoj_qgpq9NNa@archie.me>
References: <20250717080617.35577-1-bagasdotme@gmail.com>
 <20250717105554.GA1479557@noisy.programming.kicks-ass.net>
 <aHjd-oisajaKW_Z5@archie.me>
 <65735554-0420-4af7-881d-5243b83a3eb6@oracle.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2gLgncKtdrrHipxb"
Content-Disposition: inline
In-Reply-To: <65735554-0420-4af7-881d-5243b83a3eb6@oracle.com>


--2gLgncKtdrrHipxb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 01:56:12PM +0200, Vegard Nossum wrote:
> On 17/07/2025 13:26, Bagas Sanjaya wrote:
> > On Thu, Jul 17, 2025 at 12:55:54PM +0200, Peter Zijlstra wrote:
> > > On Thu, Jul 17, 2025 at 03:06:13PM +0700, Bagas Sanjaya wrote:
> > > > Bagas Sanjaya (4):
> > > >    Documentation: memory-barriers: Convert to reST format
> > > >    Documentation: atomic_bitops: Convert to reST format
> > > >    Documentation: atomic_t: Convert to reST format
> > > >    Documentation: atomic_bitops, atomic_t, memory-barriers: Link to
> > > >      newly-converted docs
> > >=20
> > > NAK
> > >=20
> > > If these are merged I will no longer touch / update these files.
> >=20
> > Why? Do you mean these docs should be kept as-is (not converted)? Jon w=
rote
> > in e40573a43d163a that the conversion were opposed but AFAIK I can't fi=
nd
> > the rationale on lore.
>=20
> Here's one:
>=20
> https://lore.kernel.org/all/20200806064823.GA7292@infradead.org/

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--2gLgncKtdrrHipxb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaHtEawAKCRD2uYlJVVFO
o1DEAQDTgA9l2rIBDAihhUg5LQsrzUGjdyEsn0EUAnvE5VwB3gEAorEAChqX8FzC
FkHus6Bb8Vr43ZFqoi0M5HJt4JCX5Qg=
=jzZz
-----END PGP SIGNATURE-----

--2gLgncKtdrrHipxb--
