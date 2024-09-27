Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD51BFE18
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727457828; cv=none; b=YP8dqwNF4fW+zk3caIr1Fa1/sqSCNCg2yaB9inNLc1gxgedHGPkFl+XADwv0IA2sSSC2s8YjnbyYp0wJkUbPBSwEsf7VPbBzDsd3QfOsjDVWOBG2wQpPAyM1hzQ8+J6Y3UiGnjm/t6ArgPt9ZPx6LYi2bcF7V9s5VnaCbIrzamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727457828; c=relaxed/simple;
	bh=GCk2RsM5FRN762nuUdIVnJyHlR1/BB2s3RYsgpZTJI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TU2pQkj/lbIL3n7qGvVS2xAZgZlrNgUlIhrmrbG4a9Ehuo8gT6zSnD4x0RPhQuCkIAY9gOLYkkIhoe9guN5AjfBI1MssyTxrsEHAcb9kbCNfc1x1NPPJ54tEyK5uAbAZ5TSrS6OCdkno0kDEOG3Bczokdp3iB4tWc+P/Qj6JqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ARGx2oDI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ARGx2oDI"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398b589032so550216e87.1
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727457824; x=1728062624; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pL+eYyAYNBlL0JEzog7gteLEL6jaNxjttyWOz6wubk0=;
        b=ARGx2oDI2Ub1RZPPyxa2EmMFKNMspywXA1B2Lm9qDNkVC1k8EJj8BGt+g0X9ovBvM4
         oNQQM8JlmEyoKroKphBtDl4KtRh+hjM3KMb2qb01h8cwB9ULvcUAWueUhOUqEOD7vvz9
         z6dMJYWGcYrHBocRlR4e0X4FwE3cwXAb26ut4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727457824; x=1728062624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL+eYyAYNBlL0JEzog7gteLEL6jaNxjttyWOz6wubk0=;
        b=Dq8cE2PJeBkERaEdXkpUta5DGE/bCEzCcw6Oa9S4x1hNet9PQI7iqXvyavSoDCctp4
         5tKhEpenUwxxxhxBl+Hz6f8Dyi/3N05C42kctDAJqHp79x7TYLckW+SF5VTw4LdHVcBV
         l1gwbF2t1Wtn73k33uaix9o4TJIHb9IpfHbcoVaRiAUt6tVjkiVXFTd23C9f0UUxNfrl
         978VwfHMipDucU2P0aPK6dMoay4hxXKWYTwNxzNKsd1NuzAuPMpllgzUsgdQEwsZ1FXO
         xbeKWkECVLGodX8sH/+03bab4RJewdWixVnEG9JhLO75NbCLpVfIoH00wULIhuH0wu68
         hLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5I8v80uTxnh7dnWloAD2ccz03hitsH68kMu9KOb5Vilw+2wi/A31CuV3Xq+bNLxG3CUt0@lists.linux.dev
X-Gm-Message-State: AOJu0YzCPn6fpV0l0g6+IuIHKlE+cbP3k84ZGjpAuK0flk8VsH2kpJm1
	BZdqfKJNdvW4uamm1YYGwiTldwRuTOSHL1kjUhAuP907ANJpQ3FD40glusH1pc70FWODm3asn2m
	nWW/jbQ==
X-Google-Smtp-Source: AGHT+IFmQOmyiiOUCGVGEFHs4i8rvAX3bHmCspoBurGCaqlHysUI6I2jt+AOPmBB7sdNUDm48dZxJg==
X-Received: by 2002:ac2:4c43:0:b0:52c:e10b:cb33 with SMTP id 2adb3069b0e04-5389fca3ae2mr3716505e87.50.1727457824035;
        Fri, 27 Sep 2024 10:23:44 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27ecd10sm155294466b.96.2024.09.27.10.23.42
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 10:23:42 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c3400367so2080419f8f.2
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 10:23:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFhQ2MGEfTr32RhS5yhAsQQx/zcI47Aj3ot4MjG9it0FweC4wbYNb7eMV+SCV/26jiyV7l@lists.linux.dev
X-Received: by 2002:adf:8b1b:0:b0:374:ba2b:4d1c with SMTP id
 ffacd0b85a97d-37cd5aa684emr3408839f8f.31.1727457821824; Fri, 27 Sep 2024
 10:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
 <ZvP_H_R43bXpmkMS@boqun-archlinux> <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com>
 <48992c9f-6c61-4716-977c-66e946adb399@efficios.com> <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com>
 <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com> <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
 <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com> <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
 <ZvX12_1mK8983cXm@boqun-archlinux> <0b262fe5-2fc5-478d-bf66-f208723238d5@efficios.com>
 <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com> <CAHk-=wgQyXOt_HjDZHNqWMmyvv74xLAcMw88grfp4HkKoS2vLw@mail.gmail.com>
 <7e1c8a5e-c110-414c-8fb2-022eacc2bd4a@efficios.com>
In-Reply-To: <7e1c8a5e-c110-414c-8fb2-022eacc2bd4a@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2024 10:23:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com>
Message-ID: <CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard pointers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Kent Overstreet <kent.overstreet@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Sept 2024 at 10:17, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> The barrier() is ineffective at fixing the issue.
> It does not prevent the compiler CSE from losing the
> address dependency:

Ok. Thanks for actually specifying code.

That needs to be

 (a) in a comment

 (b) the value barrier needs to be on *both* values so that the order
of the equality testing doesn't matter.

> I'm preparing a small series that aims to show how a minimal
> hazard pointer implementation can help improve common scenarios:

I want actual numbers on real loads. Just so you know.  Not "this can
help". But "this actually really _does_ help".

                    Linus
