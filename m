Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4C848E
	for <lkmm@lists.linux.dev>; Sat, 21 Sep 2024 02:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726886683; cv=none; b=LWTRI/nyEmBqsl3n75ZYBc6aS4WUbp4yHn9wBY7oIodVGXCffxyCDo8zCQV/i5K7+IXapXyZVNUCXfchMnVCcpD55garwbwYScQfeDxzdQQA2SyF1VyClWi1uOdHielkKcWuR7mexbkOex9E2j1JG0TbD+4ooiZWL0QbV2gVFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726886683; c=relaxed/simple;
	bh=H/autW/YqOyUNcfOZrNSGSnCM6eLAryma/N+c+IzYfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJseMLClJeQisnTq5fsPPCKbYBaGNxoj0/QohWIJuZN0PL5IP5b5+zVvh7AiMpvZg11fTC9m6HBbwLheCAvPcw+pKrICFiGgUPXgnw1agFh23q2b/2WQlOiMNWe2HnMRJYb+tefsXwISpAmQSn+lwG4wAtUCiZxOQSsZ9se0L1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvM4g13n; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvM4g13n"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20688fbaeafso28633885ad.0
        for <lkmm@lists.linux.dev>; Fri, 20 Sep 2024 19:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726886681; x=1727491481; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ/3zw65PIpOdglVeIFo16/K92vheRfk4+ATdMFLd9M=;
        b=hvM4g13nMzW/aXHt2cvCn8ACLoPKmMSitOXhdpoWgm1fe3qoUGIur8MpiZmaa+bSc8
         zx60upSBA1wZTKdJlhddesKoEb7wcyz/RPyoCYjwelI1JdDyt/eDVe/cZ3E2EnkE2yeQ
         VmozggPoiM70ME0b9tXltmIz66PAdy7lvXdYZyAmM+deX9ymNHSygotSrhIUIX3CDHo2
         xPYE8h5hkygfDQpVLz94JZWfjzTcbJQXYMd3yNo43IJ+EEEFIVxHPfEHB1Kbb6PuU1nQ
         nGyyhb5groqtf7kNzu5BLAFEWO7StqhabuJJQSO/Z8V6d7qjojm01U2h7azvdv9MEefn
         glyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726886681; x=1727491481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ/3zw65PIpOdglVeIFo16/K92vheRfk4+ATdMFLd9M=;
        b=vAupMdDSkiV7sckaI/5LHOE1E16xDIaL/WTVoZ1LUMcATHYPm0D3rLsY7ELnWUPk5/
         eTKK2N6mq5Hqwo5qhg/Hu9knrgDcBtGGINxUS+DMyL73UONCC9qWC4yCxz9Ep8AzNvwr
         ATOWBdqjMtSPydNBVZiLqWqrN0UU+5qKj+qy1+b/+q00JEwQfg4RaY52Ti6RRBG6UQj4
         zlfHB+ggZXOw2nOHMSvT62exYP+rCRIjprpbFysdSkhgS496SKIaijYntNoO4JlAcYcA
         JlezR4pK8poE2iEvwfeYPwEQIlmYhMzQF44E+LAlSAVej9cvhmGp8kBxu6/GdFbWueNH
         z9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSOW+dwW5TbTWUXBRN7+0Ms6AsR8FwWYSRkQFJA090yeDL/itTuNN6oQG+VshM4kbJIkFZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx42ftLKpRSeYXEcoNc3b6qhYJbr1Dbwu3R6fbVKj6VewL/ZnQ
	CIWLRwFxjupWWbfuuJdgDomuII6KQXW1AgfPLJwE5I7jo52s3W90
X-Google-Smtp-Source: AGHT+IH/0PXLGmSF44cjd1rlWhfDxS7bfKfWMg0aE1M4TxOlOREdcFdCuvzhESkIPjZJC/vFFTjH1A==
X-Received: by 2002:a17:902:ecc9:b0:207:3a68:79c with SMTP id d9443c01a7336-208d83c64a2mr68592285ad.33.1726886680928;
        Fri, 20 Sep 2024 19:44:40 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fc352sm100946035ad.206.2024.09.20.19.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 19:44:40 -0700 (PDT)
Message-ID: <8cb4e810-da6c-4d8f-b608-5bdba56da2bd@gmail.com>
Date: Sat, 21 Sep 2024 11:44:32 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] tools/memory-model: Switch to softcoded herd7 tags
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, paulmck@kernel.org
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 dlustig@nvidia.com, joel@joelfernandes.org, urezki@gmail.com,
 quic_neeraju@quicinc.com, frederic@kernel.org, linux-kernel@vger.kernel.org,
 lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
 Akira Yokosawa <akiyks@gmail.com>
References: <20240919130634.298181-1-jonas.oberhauser@huaweicloud.com>
 <20240919130634.298181-5-jonas.oberhauser@huaweicloud.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240919130634.298181-5-jonas.oberhauser@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 19 Sep 2024 15:06:33 +0200, Jonas Oberhauser wrote:
> A new version of Herd7 provides a -lkmmv1 switch which overrides the old herd7

Why -lkmmv1?
You mean current (unversioned) LKMM has to be called v0 ???

My preference is to call current one as v1 and your new version as v2.

Either way,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Please find a few more comments inline below.

> behavior of simply ignoring any softcoded tags in the .def and .bell files. We
> port LKMM to this version of Herd7 by providing the switch in linux-kernel.cfg
> and reporting an error if the LKMM is used without this switch.
> 
> To preserve the semantics of LKMM, we also softcode the Noreturn tag on atomic
> RMW which do not return a value and define atomic_add_unless with an Mb tag in
> linux-kernel.def.
> 
> We update the herd-representation.txt accordingly and clarify some of the
> resulting combinations.
> 
> We also add a litmus test for atomic_add_unless which uncovered a bug in early
> iterations of the Herd7 patch that implements the new switch.
> 
> (To be) Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
> Signed-off by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> ---
>  .../Documentation/herd-representation.txt     | 27 ++++++++++---------
>  tools/memory-model/linux-kernel.bell          |  3 +++
>  tools/memory-model/linux-kernel.cfg           |  1 +
>  tools/memory-model/linux-kernel.def           | 18 +++++++------
>  .../litmus-tests/add-unless-mb.litmus         | 27 +++++++++++++++++++
>  5 files changed, 56 insertions(+), 20 deletions(-)
>  create mode 100644 tools/memory-model/litmus-tests/add-unless-mb.litmus
> 
[...]

> diff --git a/tools/memory-model/linux-kernel.def b/tools/memory-model/linux-kernel.def
> index a12b96c547b7..4281572732bd 100644
> --- a/tools/memory-model/linux-kernel.def
> +++ b/tools/memory-model/linux-kernel.def
> @@ -63,14 +63,14 @@ atomic_set(X,V) { WRITE_ONCE(*X,V); }
>  atomic_read_acquire(X) smp_load_acquire(X)
>  atomic_set_release(X,V) { smp_store_release(X,V); }
>  
> -atomic_add(V,X) { __atomic_op(X,+,V); }
> -atomic_sub(V,X) { __atomic_op(X,-,V); }
> -atomic_and(V,X) { __atomic_op(X,&,V); }
> -atomic_or(V,X)  { __atomic_op(X,|,V); }
> -atomic_xor(V,X) { __atomic_op(X,^,V); }
> -atomic_inc(X)   { __atomic_op(X,+,1); }
> -atomic_dec(X)   { __atomic_op(X,-,1); }
> -atomic_andnot(V,X) { __atomic_op(X,&~,V); }
> +atomic_add(V,X) { __atomic_op{noreturn}(X,+,V); }
> +atomic_sub(V,X) { __atomic_op{noreturn}(X,-,V); }
> +atomic_and(V,X) { __atomic_op{noreturn}(X,&,V); }
> +atomic_or(V,X)  { __atomic_op{noreturn}(X,|,V); }
> +atomic_xor(V,X) { __atomic_op{noreturn}(X,^,V); }
> +atomic_inc(X)   { __atomic_op{noreturn}(X,+,1); }
> +atomic_dec(X)   { __atomic_op{noreturn}(X,-,1); }
> +atomic_andnot(V,X) { __atomic_op{noreturn}(X,&~,V); }
>  
>  atomic_add_return(V,X) __atomic_op_return{mb}(X,+,V)
>  atomic_add_return_relaxed(V,X) __atomic_op_return{once}(X,+,V)
> @@ -144,3 +144,5 @@ atomic_fetch_andnot(V,X) __atomic_fetch_op{mb}(X,&~,V)
>  atomic_fetch_andnot_acquire(V,X) __atomic_fetch_op{acquire}(X,&~,V)
>  atomic_fetch_andnot_release(V,X) __atomic_fetch_op{release}(X,&~,V)
>  atomic_fetch_andnot_relaxed(V,X) __atomic_fetch_op{once}(X,&~,V)
> +
> +atomic_add_unless(X,V,W) __atomic_add_unless{mb}(X,V,W)
> \ No newline at end of file

Please fix this warning.

> diff --git a/tools/memory-model/litmus-tests/add-unless-mb.litmus b/tools/memory-model/litmus-tests/add-unless-mb.litmus
> new file mode 100644
> index 000000000000..72f76ff3f59d
> --- /dev/null
> +++ b/tools/memory-model/litmus-tests/add-unless-mb.litmus
> @@ -0,0 +1,27 @@
> +C add_unless_mb
> +
> +(*
> + * Result: Never
> + *
> + * This litmus test demonstrates that a successful atomic_add_unless
> + * acts as a full memory barrier, ensuring that *x=1 propagates to P1
> + * before P1 executes *x=2.
> + *)
> +
> +{}
> +
> +P0(atomic_t *x, atomic_t *y, atomic_t *z)
> +{
> +	WRITE_ONCE(*x, 1);
> +	int r0 = atomic_add_unless(z,1,5);
> +	WRITE_ONCE(*y, 1);
> +}
> +
> +P1(atomic_t *x, atomic_t *y)
> +{
> +	int r0 = READ_ONCE(*y);
> +	if (r0 == 1)
> +		WRITE_ONCE(*x, 2);
> +}
> +
> +exists (1:r0=1 /\ x=1)

This litmus test is not compatible with klitmus7, which is much
stricter than herd7's C parser.

You can have only int or int* variables in the exists clause.
Register variables need their declarations at the top of each Pn()
(classic C).

See below for klitmus7 ready code.

And tools/memory-model/litmus-tests/README need to mention this
litmus test.

        Thanks, Akira

---------------------------------------------
P0(int *x, int *y, atomic_t *z)
{
	int r0;

	WRITE_ONCE(*x, 1);
	r0 = atomic_add_unless(z,1,5);
	WRITE_ONCE(*y, 1);
}

P1(int *x, int *y)
{
	int r0;

	r0 = READ_ONCE(*y);
	if (r0 == 1)
		WRITE_ONCE(*x, 2);
}

exists (1:r0=1 /\ x=1)
---------------------------------------------

