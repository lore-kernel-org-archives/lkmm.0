Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E21E521
	for <lkmm@lists.linux.dev>; Thu, 14 Nov 2024 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731596177; cv=none; b=oJEG18Yvoug/ggrf2vmWHI7OLiwYnODk3PfVSzRuFlRwoQj34a7T7Tu+jWhtn9WM8vBStfHzmFCMBuF02VVU3Na7UILtZlErV0pkEgYi7P5a8HaycYWLHobah0Uc+xKPOaqrG4cF/ZZIedWQM4+VOwVtKz43Rxbvs79ooSVa3qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731596177; c=relaxed/simple;
	bh=5sOe9ripCxbSEVyi9HSWTx+dlYBbi2HF+KFmFLJmqIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct3l1RsafEQWMATyzmHSwVDR+AgmbqvmJFroqV3JZDZr2rjUOh4DTY96M5i/6PJ1pnjBiXg1qgbt0HhcyO/+HuwL4gvT+DmX1GXmmvtP/hD5zFl9n2tEu8ybFi2TqFJnjfeqmAXQeUR4fbXgaY11bApltDrP6mJZ8dR6JZGYe7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuxkOBeF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuxkOBeF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so486671f8f.1
        for <lkmm@lists.linux.dev>; Thu, 14 Nov 2024 06:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731596174; x=1732200974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ypIe2x5wqkPNzyRl0qrW7xKxln38d/rreWFO8HGI778=;
        b=PuxkOBeFyDlrlmAocEBDLMigzzwx4pwcdh0Hr8374INxU+4fTOZ7iOJhYP8ky0zv06
         mAy4sWlrM2MKQSUSGY0EB9HItbA3qNruLGmoeHNm58l29kZFPUeBMrjlgYVm8ZNKHTXf
         guJ7cxhAV9T9hNFAM99gE/lQgAM5r/iqHZTWRa7Ruh8LQvS3gpDsuoXnQe672eYbOuWq
         jAld2s/qKOhPjMmiJsaVK0XqWkChgwjEyt3Cn34k5P6pWZjT6tQX4S9Q/MP7U1uV/OFt
         CRxBKL+rv8OBFzv1w/XHvFwAxWn5kBpf+asoymEo1jZmEJS3w4rtU/FnFUc51xzR66eF
         c5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596174; x=1732200974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypIe2x5wqkPNzyRl0qrW7xKxln38d/rreWFO8HGI778=;
        b=dtHQMvCBV4K1gGGwAxWuX6QWUtnpuGLLTGmCqLjZouKKatBb5GO9PsKBQBmALhlSsl
         Fp4to3DjDUilpUo8AYh0LhE+5wNCPcKQGPoNlXIf+2V9fiznelJYcjGVG0mrQNrDpZuf
         XE7tUIzl8fAQxNXxYQSvXu0onWhsu8rhA4pu1xDYKn12+mkpoNlSyLWeqCHnizqFERr+
         neGTWUYYsoKY8KY6UNOH8mDj01OO67NoF5GGDyjVGUDNZF6Rv0PPKY/Keim7355b8MrB
         qb2xzVUA/JruacfOoL11wEGq94E4lgb9wxVg4AiEgzTFHtYAIIgLYO/ASyXdE28boYx2
         a1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkfRWx18uNPZR5wF2EBQoYuPypuuBJh/u1KNhwBzAUEiyfDWPadzjTUxZvDGmtSHClZn1a@lists.linux.dev
X-Gm-Message-State: AOJu0YztRxKxzf3ysnTFixv8VCvXfaSkppCtGUm0MZu0LQfu+orK9SzI
	9qdDQpK5VueXY1SlYjujuGqLLCnOWd5HIb8+Qw/z1J1UrKArGzfhQe6K8A==
X-Google-Smtp-Source: AGHT+IGfT3/q3KJg0BmJv0M3JSpyylmNbOkhP3+kI1SDAPayxBKjFLi0azP6rHT0HtymqiHBO+xoLg==
X-Received: by 2002:a05:6000:1787:b0:37d:5026:f787 with SMTP id ffacd0b85a97d-381f1885612mr21224023f8f.38.1731596173714;
        Thu, 14 Nov 2024 06:56:13 -0800 (PST)
Received: from andrea ([149.62.244.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3e7bsm1730816f8f.7.2024.11.14.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 06:56:12 -0800 (PST)
Date: Thu, 14 Nov 2024 16:56:01 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, puranjay@kernel.org,
	bpf@vger.kernel.org, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Some observations (results) on BPF acquire and release
Message-ID: <ZzYPgd8rJDG9p6WQ@andrea>
References: <Zxk2wNs4sxEIg-4d@andrea>
 <13f60db0-b334-4638-a768-d828ecf7c8d0@paulmck-laptop>
 <Zxor8xosL-XSxnwr@andrea>
 <ZxujgUwRWLCp6kxF@andrea>
 <ZzT9NR7mlSZQHzpD@andrea>
 <CANk7y0gdNGM36Er9vq42-YouoGVVQ4gp0yvgVHarm0-NFC2i1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk7y0gdNGM36Er9vq42-YouoGVVQ4gp0yvgVHarm0-NFC2i1w@mail.gmail.com>

> I have applied your patches and modified them to add the new tests to
> kinds.txt and shelf.py
> now these tests will run with all other tests using 'make cata-bpf-test'
> 
> All 175 tests, including new tests added by you, pass :D
> 
> make cata-bpf-test
> 
> _build/default/internal/herd_catalogue_regression_test.exe \
>         -j 32 \
>         -herd-timeout 16.0 \
>         -herd-path _build/install/default/bin/herd7 \
>         -libdir-path ./herd/libdir \
>         -kinds-path catalogue/bpf/tests/kinds.txt \
>         -shelf-path catalogue/bpf/shelf.py \
>         test
> herd7 catalogue bpf tests: OK
> 
> 
> I have pushed it and sent a PR so we can get all this merged to master.
> https://github.com/herd/herdtools7/pull/1050

Cool!  Thank you for the follow-up.

  Andrea
