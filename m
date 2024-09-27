Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E78A920
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727460809; cv=none; b=vAuq+Cqzd4bxeNe77ZQ0p6aS8rNU/ZPQ3u+BDDdUKMJ7hSOCE8mUHWVGfhineRU+WywZxwiGnT3M1bn2H8153LMHZAaL6oRWsGOXQLKaxeezVnVUPnG5pUr9RCa2VLfeImHymFjO/VXT1r6abDcTmCCaHQoIDy2XmWHq6r05lOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727460809; c=relaxed/simple;
	bh=07wSPeAgU67g80HqM54Nnsi81+Gz526YFvVEU0VUWqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJSyvFXXJoAIqLHil7Ev/ga4k1R0EVKAM73W1Q6qhH+/DtD34FaEKEXe8IJTFAU0e3SPbP4/9fs44kRUCt2hGPP+55wc9NPxPniFSaRumBNsuPyacZGTnGb5mu8vH060vdp/xWbVKoSKKTn3LlKNLrL2FQy2gmmtgifGSNjIFEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hpgt587M; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hpgt587M"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398b589032so615832e87.1
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727460805; x=1728065605; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUX1kCLvq6+bfGUvOV4xSkP3/ox8tqlvT0bJqmyP1AA=;
        b=hpgt587MhDD6b/qPKlX0jrgFJ9dDCZkqUNVRGcw7wWfeLLUJWDPQD44XWdJHm2sE2/
         BL21Xqx3Yc6Utg6N73zhXhV6OS0Ozt94wblVAOQjxXOJMYAUgfE3RlZ5UamlyA3KcOeF
         GaZPzBRApnHlenUg+w90u0OvuXWt0XnFFhblA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727460805; x=1728065605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUX1kCLvq6+bfGUvOV4xSkP3/ox8tqlvT0bJqmyP1AA=;
        b=VRVn+J1bQ19T8n8vtCZ2H2x+OgcDZjYwhp5N7j86I45TCbyk0NZpu2lxgSQX40DiPn
         KC35vb+TwyD0t/BZ/KRC7JD4zlbNgv+UwQhi++KHXwemgS6RAetPrcO7aSheQ2ypDhkm
         ZPWmcaDYOWkgrA3ABcH46fETQ8oayIUV0ucFj99Dr3xjSNxluuUgfMHAjNM3oAUVapmr
         CSpoWRBySZ6+cjXWTlriFLA+voKNarVYUL/f9ga5Mu3nCkbRwWubCtmmmhASxR9Cz2Dm
         N327HdrbsRnv2zWVvDpnvBAnCt19Dhs/HUDgKup1XTZCFYhWlmyyiBcyeDYVeNxtKsfM
         RQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCU2AKdvf1u1lBKzrRRLJiAVLK58IVzAThnGupnERM7ufvmA2Ilx6B6NkC+5EvLLR9sIwYQT@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzezrb5jUImG3WYx21f3Ge5EevkKYlaZ+5o8eS0klaqp+7CPku
	cWvgZz3G7HV8gaAfCJL6AhBKi3AyKZylmrd80JsFK7OQ9RjcE9aCGxiry/s4XcnFYxb3T9GZBWU
	Ryzwtpw==
X-Google-Smtp-Source: AGHT+IHmBh4vmfF2ZQ2YvgP71AkJjRjNOrFlHHjBKX/BMk6KOjVn+zAfNj9r6yoUojHjXNaWxEYn1A==
X-Received: by 2002:a05:6512:3c8f:b0:535:6aa8:dc49 with SMTP id 2adb3069b0e04-5389fc3441bmr4113788e87.9.1727460805396;
        Fri, 27 Sep 2024 11:13:25 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5384fsm386859e87.33.2024.09.27.11.13.23
        for <lkmm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 11:13:24 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so34520371fa.3
        for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 11:13:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8EvWVhl6D5gOtn9YvBwtmsW59KBPTxQ2XVMNN4nOD4LNHQAO17beyMsjcBtN1uTH7lqvr@lists.linux.dev
X-Received: by 2002:a2e:b8c8:0:b0:2f7:562d:cb5b with SMTP id
 38308e7fff4ca-2f9d3e3d465mr41944381fa.7.1727460802851; Fri, 27 Sep 2024
 11:13:22 -0700 (PDT)
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
 <7e1c8a5e-c110-414c-8fb2-022eacc2bd4a@efficios.com> <CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com>
 <34ec590c-b109-44a0-8bfe-8aafc6e7ad64@efficios.com>
In-Reply-To: <34ec590c-b109-44a0-8bfe-8aafc6e7ad64@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Sep 2024 11:13:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_hz8Whs2ogRUQEfMBk=OkZ3usmvJkzb5YyEKwqEJBmQ@mail.gmail.com>
Message-ID: <CAHk-=wi_hz8Whs2ogRUQEfMBk=OkZ3usmvJkzb5YyEKwqEJBmQ@mail.gmail.com>
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

On Fri, 27 Sept 2024 at 10:53, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> >   (b) the value barrier needs to be on *both* values so that the order
> > of the equality testing doesn't matter.
>
> If we use OPTIMIZER_HIDE_VAR() on both parameters, it indeed minimizes
> the odds that someone get the order wrong, but it disallows using
> ADDRESS_EQ() with a constant parameter

No it doesn't.

This is trivial - just hide the source of the *comparison*, so that
the compiler doesn't know what you are comparing, and can't use it to
then replace one with the other:

   static __always_inline bool compare_ptr(const volatile void *a,
const volatile void *b)
   {
        OPTIMIZER_HIDE_VAR(a);
        OPTIMIZER_HIDE_VAR(b);
        return a == b;
   }

compares two arbitrary pointer values without allowing the compiler to
then use the comparison result to use either of the original values as
a replacement for the other.

And yes, that "hide both" model will cause a bit more register
pressure, because the compiler will now compare two values that it
really thinks are potentially different from the originals. So you'll
have two "useless" temporaries that contain the same values as the
source pointers, but if that's the cost of having a comparison that
the compiler can't see, that's fine.

Making it a bit less obvious, you can hide just one of the variables -
you don't actually need to hide both m(but for clarity, maybe you want
to).

Because even hiding the value one from the compiler will mean that it
can't use the comparison to decide that the originals are equal, even
if one of them is unhidden.

No?

              Linus
