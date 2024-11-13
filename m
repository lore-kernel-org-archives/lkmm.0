Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95F1632E5
	for <lkmm@lists.linux.dev>; Wed, 13 Nov 2024 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731538797; cv=none; b=M6ik+p0wtg4j/k+6JD5LgfYGPMciaVQZkT/V+TbinhS8XAjt/0Vtyf0blVqgkoHNHoYYo/EYaIAdM34hFgknGwR3BTwtY006CC7+zXsXgdWDQto9JJL9lhPGI2crFNl/w6236h4BFAE0G9PhZjYRPgj74/xMd8gkCJuNJHnRJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731538797; c=relaxed/simple;
	bh=P4o6noBwxKclWruPKIEJq7jRNQ6JmEK4g7sgUwx8fCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehDQOvF5jZLWqOSd9LxD0RwcO+MdNMQwgh9oWhE8v2wCeEmrsNBXxNVB1WSQ+g/yolrTFCoLjKVgL3Fam1AlsYXz/hGofrPq5dW1WeK9MkQQVeS58ooAknA7oGshNHEA36/TWjrFEHrHb2eADcKRJjPRiI2E76yzkvnCFGYuj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Emr/dXdG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Emr/dXdG"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f6e1f756so7871198e87.0
        for <lkmm@lists.linux.dev>; Wed, 13 Nov 2024 14:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731538794; x=1732143594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPnoa5kJESuIfhZM4IZ9Nt1wIRz5hW1xyaJdPQqT+Bo=;
        b=Emr/dXdGiF1AWjgq9rl4EvsM1ZpWaRldYJ8q4nQQt+udHmTdGOaOWbGTa5FC2wvWlH
         qWnACSqbYzYlI8fZ2xklbUHvQxQS0LFPUSQkMkjXQmBmHcgHuXSbfPBrFRO8UkBO61pp
         EaE7f/3MAvy3qC6Xaf5S2AJXYvIvdUSqy35ciEJcOCy940UcMnGZRw6q/+J8v6G6jxxk
         ho+Wmig75blauZKbt5J77NPxCJuTGueaVUQLgEHeCXPUZAS/ieeliCdbo+NGPOPrvyQx
         WbS9n1SbLFPXMwtWIWpx6+xGFbmNW0ovFfI3ekBb8pVOvXCCrykuX9SlYrYNxYmkggrq
         KiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731538794; x=1732143594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPnoa5kJESuIfhZM4IZ9Nt1wIRz5hW1xyaJdPQqT+Bo=;
        b=rs7h9kl/rJy3+SPeymEvj0Mc7QimlCrDt6uGNiUwu5+taahAO+0dZLBRF6q1dQFYUm
         p1JoPDgbyVMc4eP8CqDB5isjICQvTOK50MYTbixpEbAP0hRCsoaJOTCzXOJNTOf6cUKj
         eaqMMLBHEoU+8dMJkw90Sy4pgoUjzo22MfnZyJQs+BoNFMc5VYs3ggK6Ai8jrHffGqs6
         tvNxyW+/CCI7n9Sq9t8vrkRwIkBrCrVfGLuBuis8wC2F0lff6RYu53l7H2Bn9W9vSdbF
         fVdsI6dM8cUUABHqmDUJHcudoEof0dcSKynJ+ICbn09XTLh2RWyvgRB8i4skKFVLvtzO
         pccA==
X-Forwarded-Encrypted: i=1; AJvYcCWve/trCBqhczjvlQVmbrX/zpUL+nlY1InT8O1dRxAhh8yRcj6ESq1ZTyONgJLur+U9zlk1@lists.linux.dev
X-Gm-Message-State: AOJu0YweqCMo05YRmMFZzJ8LjgN6w+j6YXoTLxX2m7+bsczntvgwb3qs
	fjUbEjDS1wU166BDasMYORrcemYjqUhIg/qAvCOR0U9v3D7Xg+gQ49eU8O3Z12VjvmwbmULpnkh
	AWxTgo27X7+41OKxqr3IlFWrj778=
X-Google-Smtp-Source: AGHT+IE86IQhayL6ZlO/ZiGdLIHBHsrEAa3BnTxjnXJ9fRF16YRt4VJQ/gbI4u/usQc9PCC7lpP1oW0Js9MK47xC7EM=
X-Received: by 2002:ac2:43a2:0:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53da132c789mr1442601e87.47.1731538793422; Wed, 13 Nov 2024
 14:59:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zxk2wNs4sxEIg-4d@andrea> <13f60db0-b334-4638-a768-d828ecf7c8d0@paulmck-laptop>
 <Zxor8xosL-XSxnwr@andrea> <ZxujgUwRWLCp6kxF@andrea> <ZzT9NR7mlSZQHzpD@andrea>
In-Reply-To: <ZzT9NR7mlSZQHzpD@andrea>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 13 Nov 2024 23:59:42 +0100
Message-ID: <CANk7y0gdNGM36Er9vq42-YouoGVVQ4gp0yvgVHarm0-NFC2i1w@mail.gmail.com>
Subject: Re: Some observations (results) on BPF acquire and release
To: Andrea Parri <parri.andrea@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, puranjay@kernel.org, bpf@vger.kernel.org, 
	lkmm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 8:25=E2=80=AFPM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> [...]
>
> > I guess the next question (once clarified the intentions for the R
> > and Z6.3 tests seen earlier) is "Does BPF really care about 2+2W
> > and B-cumulativity for store-release?"; I mentioned some tradeoff,
> > but in the end this is a call for the BPF community.
>
> Interpreting the radio silence as an unanimous "No, it doesn't", please f=
ind
> tentative fixes/patch (on top of the bpf_acquire_release branch cited in =
an
> earlier post) at the bottom of this email.
>
> While testing the changes in question, I noticed an (unrelated) omission =
in
> the current PPO relation; the second patch below addresses that.
>
> Both patches were tested using the "BPF catalogue" available in the tree =
at
> stake: as expected, the only differences in outcomes were for the new/add=
ed
> five tests.
>
> Please use and integrate according to your preference, any feedback welco=
me.

Hi Andrea

Sorry for the silence and a huge thanks for working on this and fixing
the cat file.

I have applied your patches and modified them to add the new tests to
kinds.txt and shelf.py
now these tests will run with all other tests using 'make cata-bpf-test'

All 175 tests, including new tests added by you, pass :D

make cata-bpf-test

_build/default/internal/herd_catalogue_regression_test.exe \
        -j 32 \
        -herd-timeout 16.0 \
        -herd-path _build/install/default/bin/herd7 \
        -libdir-path ./herd/libdir \
        -kinds-path catalogue/bpf/tests/kinds.txt \
        -shelf-path catalogue/bpf/shelf.py \
        test
herd7 catalogue bpf tests: OK


I have pushed it and sent a PR so we can get all this merged to master.
https://github.com/herd/herdtools7/pull/1050

P.S. - I am writing this using gmail so the formatting might be
broken, sorry for that.

Thanks,
Puranjay Mohan
