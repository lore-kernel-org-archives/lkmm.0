Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6042C9A
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 04:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727411380; cv=none; b=kAitp3ezv81J7JUStWG6uwvO3fgs2qgcdmWyofucU2sd5QgSyUX/2pcPJrQxkOSxeZPNVyRntvhhkNqDhgeiakDUgxXQoBs0Hi4FV0TvVMDaVrpPwn+SdO+CwKpXkz+zpgSvi4GuRrjmlEfcT8OigOaq6ZLcxNNeDlM1gyKz9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727411380; c=relaxed/simple;
	bh=sMNt5tFQGxDMGatcPVdTRP7jHKRuKdtylY+3WzV8EJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyzLlAjrmMEp7ypAwpaDcU6C5TxdSjbpH6PXM53wvLTZNE79mufYZ45RexEu+78VnsE3WBqTikjHGb1oopDRgKjHM6NWIS/oQlu2FXnbogBBWoYvGQPvWFZjSju34tfh3ffF/+2gffaJhjmccUoQkJnFrDDcu3xaHKDdZ/QRW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwQSzaqP; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwQSzaqP"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb22e9c6dbso10202146d6.1
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 21:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727411378; x=1728016178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21M9MzJPvTphBfiljncSfgv5gf4c5od3t3MjpsyahVw=;
        b=QwQSzaqPl5Dx8IuJdRM1IIimkFhuL9BhUla4ZjbwmUfcX2LRl2iYR2/DRJjYRp8eEY
         TzGhPsQkDCO1Y6ZA1tbwKCDTMtKcvCL8+7WGjhkArSXFPryp/Wumi7rKXosrpxUHxYB/
         wDCr57KiIHjPwJNxJl05g9Lj21iQGsCvNU/nNSJMsM5A9pZ/TXz3CKsZLOCl0gsfVwpi
         X+FeUP8T6pjrWkl127NTRINdf/N3pQCiSoqMvkTu4EJcV+4XQOps3pAPwuwHoMQXpdb4
         +457yUk94SfIfR9NKd34c+SZOAlc6r0YtyVA2vhcSPKyHOtYSD9+Ph4D9WovmXsLPVrx
         qHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727411378; x=1728016178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21M9MzJPvTphBfiljncSfgv5gf4c5od3t3MjpsyahVw=;
        b=QRs7TwnJ2hp0FXgK1ZXJvH1wuWa+N2SJkSvdI1alH7Jyx0S9Bw1Hsdc8fOXyklTydq
         vCqT2f2x4wA/1hsaE7E6OEpIQGdzTv1msGbrouTNCSM04pK8z1quJaoJVesOPKaYk/bi
         /x3XFeRWjGR57F0VLPwx8GnHhKEa1JKu+XImZmeA0jQOKjQkfOnX3Uq5c1bdoogmdtIV
         Co12r4efSZsh/wH0193/ZX4pAP3WHJwGR1odnpEhKdsmAEX8PTf7noIGMOiTLD7THqom
         G5qB4vhZaqWHzTJcOn6thAK3AN25dm+HLaiD0uoZgmCrgstYaM1D4tRkM95h3RURqTsk
         45FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg+Vn4jzDItnj4PaEtS35Q6MguBlFBVr20X4RiN3FrtJ/A+BkrvARNAOz+Fyz5FbBvsbhJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yygpsuq5wZlOuTF/xoC5F++h3i7Z7puZ0ImhXpF2SA56X9qnMDK
	Z0ddpo5sb3uQrD+4VqJxPtc6H4s3rtF7C2uDGnhRSwtcJSHw+4A0
X-Google-Smtp-Source: AGHT+IGf/plWz9ASXEKjdPoI6R7baDwvKze1+ejjNG6Hfz77yFVyuHE5hcsLvlFgymh7Y3GdLFe/cw==
X-Received: by 2002:a05:6214:3d0e:b0:6cb:28f9:cf71 with SMTP id 6a1803df08f44-6cb3b5dee21mr33731136d6.20.1727411377586;
        Thu, 26 Sep 2024 21:29:37 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66b0cdsm5407156d6.80.2024.09.26.21.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 21:29:37 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 587AF1200043;
	Fri, 27 Sep 2024 00:29:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 27 Sep 2024 00:29:36 -0400
X-ME-Sender: <xms:sDT2Zic3n8Lq_G9bRHR7x2jO-RnzP39kw5QphGOz9CSdT4GlGX0Kpg>
    <xme:sDT2ZsOhQdv4PhIt_K6nH_reh7j0x3-cxkeEe6ipT5dvBVEbmBc1VlbaYd1gnPVVG
    Qdy7S_ILnP1c3ovIg>
X-ME-Received: <xmr:sDT2Zjhqa4NHv5Q0Nflczmc7bOcXtqZbe78Wq60xR9InPaKQfUfNzYMKvv1paw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegfeefvdevffejueekjeduleduveehgfehleek
    gffgueeuvdeuteejhfehledtueenucffohhmrghinhepghhouggsohhlthdrohhrghdpvg
    hffhhitghiohhsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthi
    dqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghi
    lhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghf
    fhhitghiohhsrdgtohhmpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfoh
    hunhgurghtihhonhdrohhrghdprhgtphhtthhopehjohhnrghsrdhosggvrhhhrghushgv
    rheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorh
    hgpdhrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthht
    ohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrih
    gtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sDT2Zv_1rTbuPKdhgfyFp1WG9NX4vjhj7BX4KuXvXdfndMzCVqFrsQ>
    <xmx:sDT2ZuubbLiY9nUZB0dVHx8LFwNeQj2yPkyI_z4PGOYKZPb3p8DJAw>
    <xmx:sDT2ZmEh3iGpm4xZF_Tzm4FDQeYWWqIzNunKDB1Dp0AHOXjwA8_EkA>
    <xmx:sDT2ZtPtmlM_2OXPEMB1wr-HnEHvZvfE5Q5FgMavHMhkSIs0dbFMaQ>
    <xmx:sDT2ZrOh1wt-edWIW4ZwLvNTfvFftu8-Dm8P2RYrSLp-L7KIYmomLR3S>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Sep 2024 00:29:35 -0400 (EDT)
Date: Thu, 26 Sep 2024 21:28:48 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-mm@kvack.org, lkmm@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard
 pointers
Message-ID: <ZvY0gG2dCJApPbp5@boqun-archlinux>
References: <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com>
 <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
 <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com>
 <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
 <ZvX12_1mK8983cXm@boqun-archlinux>
 <0b262fe5-2fc5-478d-bf66-f208723238d5@efficios.com>
 <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e748893f-28a3-4b8a-a848-cfb1173ab940@app.fastmail.com>

On Fri, Sep 27, 2024 at 09:37:50AM +0800, Boqun Feng wrote:
> 
> 
> On Fri, Sep 27, 2024, at 9:30 AM, Mathieu Desnoyers wrote:
> > On 2024-09-27 02:01, Boqun Feng wrote:
> >> 	#define ADDRESS_EQ(var, expr)							\
> >> 	({										\
> >> 		bool _____cmp_res = (unsigned long)(var) == (unsigned long)(expr);	\
> >> 											\
> >> 		OPTIMIZER_HIDE_VAR(var);						\
> >> 		_____cmp_res;								\
> >> 	})
> >
> > If the goal is to ensure gcc uses the register populated by the
> > second, I'm afraid it does not work. AFAIU, "hiding" the dependency
> > chain does not prevent the SSA GVN optimization from combining the

Note it's not hiding the dependency, rather the equality,

> > registers as being one and choosing one arbitrary source. "hiding"

after OPTIMIZER_HIDE_VAR(var), compiler doesn't know whether 'var' is
equal to 'expr' anymore, because OPTIMIZER_HIDE_VAR(var) uses "=r"(var)
to indicate the output is overwritten. So when 'var' is referred later,
compiler cannot use the register for a 'expr' value or any other
register that has the same value, because 'var' may have a different
value from the compiler's POV.

> > the dependency chain before or after the comparison won't help here.
> >
> > int fct_hide_var_compare(void)
> > {
> >      int *a, *b;
> >
> >      do {
> >          a = READ_ONCE(p);
> >          asm volatile ("" : : : "memory");
> >          b = READ_ONCE(p);
> >      } while (!ADDRESS_EQ(a, b));
> 
> Note that ADDRESS_EQ() only hide first parameter, so this should be ADDRESS_EQ(b, a).
> 

I replaced ADDRESS_EQ(a, b) with ADDRESS_EQ(b, a), and the compile
result shows it can prevent the issue:

gcc 14.2 x86-64:

fct_hide_var_compare:
.L2:
        mov     rcx, QWORD PTR p[rip]
        mov     rdx, QWORD PTR p[rip]
        mov     rax, rdx
        cmp     rcx, rdx
        jne     .L2
        mov     eax, DWORD PTR [rax]
        ret

gcc 14.2.0 ARM64:

fct_hide_var_compare:
        adrp    x2, p
        add     x2, x2, :lo12:p
.L2:
        ldr     x3, [x2]
        ldr     x1, [x2]
        mov     x0, x1
        cmp     x3, x1
        bne     .L2
        ldr     w0, [x0]
        ret

Link to godbolt:

	https://godbolt.org/z/a7jsfzjxY

Regards,
Boqun

> Regards,
> Boqun
> 
> >      return *b;
> > }
> >
> > gcc 14.2 x86-64:
> >
> > fct_hide_var_compare:
> >   mov    rax,QWORD PTR [rip+0x0]        # 67 <fct_hide_var_compare+0x7>
> >   mov    rdx,QWORD PTR [rip+0x0]        # 6e <fct_hide_var_compare+0xe>
> >   cmp    rax,rdx
> >   jne    60 <fct_hide_var_compare>
> >   mov    eax,DWORD PTR [rax]
> >   ret
> > main:
> >   xor    eax,eax
> >   ret
> >
> > gcc 14.2.0 ARM64:
> >
> > fct_hide_var_compare:
> >          adrp    x0, .LANCHOR0
> >          add     x0, x0, :lo12:.LANCHOR0
> > .L12:
> >          ldr     x1, [x0]
> >          ldr     x2, [x0]
> >          cmp     x1, x2
> >          bne     .L12
> >          ldr     w0, [x1]
> >          ret
> > p:
> >          .zero   8
> >
> >
> > -- 
> > Mathieu Desnoyers
> > EfficiOS Inc.
> > https://www.efficios.com
> 
