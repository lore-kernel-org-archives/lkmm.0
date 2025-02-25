Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3813BC26
	for <lkmm@lists.linux.dev>; Tue, 25 Feb 2025 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740457473; cv=none; b=kQ0XgE8NIxoqp///JG7OsYqT8NpF7NL3MKUi+PZDjgs0TA33rnFKb/brV1ivz7840vzTjM0jNMk5j40dSRY8u9Sxasnvaz9YkInYV2H/4uTEz4L9nEimdJROaNMuaBTe3cdJAndTKEpPj0vVqegBSkM8c/OxjkfXp9GbYVe0mY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740457473; c=relaxed/simple;
	bh=0xBlOnbwWPcpFpEFFwo3az9IHLdEaVF/e2PiZf+/3Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHa+CIL6COxJl/jZFJxqkKrYBrEFi3CN4Ls4oFcckSIENVSLnI/BgOhsUg1TykjFpfjKNyJ2knQeIgEAXFCIQS+4OHnTIdAGyi/q19wr6IYxY2k3yrMVHLF5PhNMoEDB5Gzawu/pAst5Njnw36Lf8CR9lAXnyPQ7mAdjb+TrCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsI2pSwj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsI2pSwj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220c665ef4cso89489255ad.3
        for <lkmm@lists.linux.dev>; Mon, 24 Feb 2025 20:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740457471; x=1741062271; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QXq0XS1DMAs9J2jLZ98jTCNHr/BGJPzzAtLUhi5pf0=;
        b=HsI2pSwj76AQ6W2b0Umyu87JInF3TXSv/8hv/HRvTUqPUSikYePNkJLGeUldoMldKA
         6/MAt0HjxO5YLdBkMcvcG4vuVkDnVgX+DvChLiXIKdnGaOINwsz9b0cfx4YdVR/8y0oO
         dIyc+qvIfpEdE6XNAgzbb0GwTbT67quAkJ6mGIJA9WzZYBQVTlkPGZN0HNQTEixT9HLW
         EOZon8wv0Bx5saNSw9HxvKeKkw1SuC8ZtN5Yag2Hhog2S77cCaqhWbsrqcLNnYhe6rdb
         Ndd/z4NONgnJp7fT0tl6Yw+WKjLkwebC7wq6VzutFtq37+8D1rPYHZBK2PHal6xKVSkl
         gXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740457471; x=1741062271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QXq0XS1DMAs9J2jLZ98jTCNHr/BGJPzzAtLUhi5pf0=;
        b=F1DTxoBP6zc1DuYRzqfNrR0GSvL77nhi3RP54YsO4VMuw5ZIjkH+rUn1Rkmsx8uPPJ
         oumJ9l/c/D/xLPCMmOlx6KoPufM5vRkkuW2zubyiis6MIi3WJHCYyWrW7YcbslZnlNwc
         BGIre8vU8EgFbZFowQA/WgO0/WUXpMfqXxefQR83YigmVxQvNYdNHEQs6e0cr+iXOmzg
         2Jyt3rPNFsNxOv4E/l4zhp6RrnY7qw7eID7CbEAJmw6KarrDYODRcUABkEy9krHvDX6g
         RHJ4Rd28hcsNYXebQFS/HvJJ++GfBxLjk5Wh43wW6HKw1D92WjqZaJ3NRI7iBiDsm82u
         Br7g==
X-Forwarded-Encrypted: i=1; AJvYcCXPW4SHRWTJT/mYoaEAwlzEHqHM1asfarc20kRzGujZd4EqxfRqAwnQ3Lwdla0ZtVvNQ68V@lists.linux.dev
X-Gm-Message-State: AOJu0YxWj7JT1efaDqE8CYJOrpHn3NU75GpUK8cGZVo+U8+NzBx6Pu2N
	P7bHkZg0SCDB+E6RPscAzQhGjWlOTEfnfHkTa4MkLVzKMLQg4xy1
X-Gm-Gg: ASbGncup3F9yMvLTdjFqZKRhPtStYecXPyhUqcFGl1Nsery1k1g5fApqBDecdaX5783
	7eGYN4OmD/t3ISDWhXxScpd2VHIJsvj9JyOPjB3iHk/lYkT4P236NkTegutJRlHIGMlwFWnCffJ
	qHRSSnGpHmM/GsSRwVFwvUSFRy5bgLaw7NiGqdJ3a7C7B7myfoFbjN+t5984tU5S3iow51yoEvt
	pMhR5Mx9U93K7avpAsHK8wLVVjtZGkUMv2x6tQ/50S29jg0BWbc2x6aHNKsqCjT4ZYVtg4GvSQZ
	d8JWT+Anp7kakS3ea5RHNZ7dGqe9xL/QZ2jDEHfYwOO3U2y4dYhNC3LSxbtidTMIe+VrlvOe
X-Google-Smtp-Source: AGHT+IHFL6RvLCzMfkpdq/lhGiaA43IWa0AsYFBQKyWXztLMGiZRzji2e0BFIghxYbY4ZIqQsN1xWw==
X-Received: by 2002:a17:902:f60b:b0:216:725c:a137 with SMTP id d9443c01a7336-2219ffb8b58mr294789865ad.28.1740457471345;
        Mon, 24 Feb 2025 20:24:31 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0ae9basm4341005ad.226.2025.02.24.20.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 20:24:31 -0800 (PST)
Message-ID: <105532ce-a41d-4f14-8172-cd68bdffae1d@gmail.com>
Date: Tue, 25 Feb 2025 13:24:24 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH memory-model 6/7] tools/memory-model: Switch to softcoded
 herd7 tags
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, lkmm@lists.linux.dev, kernel-team@meta.com,
 mingo@kernel.org
Cc: stern@rowland.harvard.edu, parri.andrea@gmail.com, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
 dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8cfb51e3-9726-4285-b8ca-0d0abcacb07e@paulmck-laptop>
 <20250220161403.800831-6-paulmck@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250220161403.800831-6-paulmck@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 20 Feb 2025 08:14:02 -0800, Paul E. McKenney wrote:
> From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> 
> A new version of herd7 provides a -lkmmv2 switch which overrides the old herd7
> behavior of simply ignoring any softcoded tags in the .def and .bell files. We
> port LKMM to this version of herd7 by providing the switch in linux-kernel.cfg
> and reporting an error if the LKMM is used without this switch.
> 
> To preserve the semantics of LKMM, we also softcode the Noreturn tag on atomic
> RMW which do not return a value and define atomic_add_unless with an Mb tag in
> linux-kernel.def.
> 
> We update the herd-representation.txt accordingly and clarify some of the
> resulting combinations.
> 

Having failed to hear from Jonas or Hernan in response to my question at:

    https://lore.kernel.org/lkmm/ec97f28e-31ad-4a45-ac87-fab91e27d4ee@gmail.com/

, let me guess.  Past contributions strongly suggest that Hernan looks after
herd7 changes and Jonas takes care of LKMM side of changes.

So my suggestion is to add a Co-developed-by tag of Hernan here:

Co-developed-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
> Signed-off-by: Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>
> Signed-off-by: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Tested-by: Boqun Feng <boqun.feng@gmail.com>

, and let me add a Tested-by:

Tested-by: Akira Yokosawa <akiyks@gmail.com> # herdtools7.7.58

        Thanks, Akira

> ---
>  .../Documentation/herd-representation.txt     | 27 ++++++++++---------
>  tools/memory-model/README                     |  2 +-
>  tools/memory-model/linux-kernel.bell          |  3 +++
>  tools/memory-model/linux-kernel.cfg           |  1 +
>  tools/memory-model/linux-kernel.def           | 18 +++++++------
>  5 files changed, 30 insertions(+), 21 deletions(-)

