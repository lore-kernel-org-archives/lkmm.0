Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19E82481
	for <lkmm@lists.linux.dev>; Fri, 27 Sep 2024 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727395344; cv=none; b=tWnlANf72C1bTU3RhWutFImXB/Hh40v6X/sV4EBqTGl43xKe4DMAfI9l0qR1c0xA2r1GnSR05RLE4EsMQEJYdxfS/Hx0CzdhXTtPxq1tHtptLzqOZQUbQGfRDT5fb9jyxQ0eNcJUeuiX43EnAOfldIfqPiN7NZu2atyCFckURV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727395344; c=relaxed/simple;
	bh=F5yy36E7OeMgmhKMxsOBgmA2+aKBWMg1Xm82IpAWq0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMfDQhiEFSzNLAmssmB9x2mxyk3N+ykxYmHpDCGjL94JfITQUsYRfMyK47iErnCPP6rHh1/prcKLY+KDBtqEU1LjZBEqAzo+KvG8lqgW9U5Qp6xYzkwjDUOR6Vp9A0MRbuyZ2tDMOGGClSWprM8Ih6zP90c50UlwNnJS7RstmyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URP4Or3o; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URP4Or3o"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a99de9beb2so110473485a.3
        for <lkmm@lists.linux.dev>; Thu, 26 Sep 2024 17:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727395342; x=1728000142; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjCSmMibXXEPpnXZCTdjE8rV5Ekv91uy3bvJiKflnq8=;
        b=URP4Or3om8PWF5prpMtqoEMW5j8ObTSxbnhbDNoku6K+xujXdnANpMjAUsnj6bOpQ2
         Y4kpFq0eIanZ6Mkk3nXrsYZRg45fnqqbJn+uTDcGE2tCfcwPrpnm7j7rRP2RRkykkSgf
         5EPEQFh4V7MrPLR/tJRjRnBNucWORxKpkN+3lYz5eRNKQqhH5yqBJfyzumB+5Y8K8P1s
         B/5/55YpjTt2GQlUSV2Hl22cKSfjwLk7WdL72ql5juyPVod7DKOY4eHMFYw09tAqE7pd
         7uPMcFt9Xlhe4AfTt700mDol8sFQwG4FjHcSKARTz2SfYIOBINSKbO42m/U3vUo8bE1U
         KzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727395342; x=1728000142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjCSmMibXXEPpnXZCTdjE8rV5Ekv91uy3bvJiKflnq8=;
        b=UbtZ2rK81e3jg93QVRa6sEzzcdv4oxWN3mINFZ9qybkHtBpgv61vNhEdlY5sfbe7TI
         D2mkUYDWGKu1WMH2JpxpVUOGNBzWDgKP+Q9dTlGSRAHztUH4YY538e7fDRZvJFlyQJhl
         aDxAg6/Jbrwrgu/byVX5imF9e6to2OYIEMCK9n0ETx3+xSMHTfyf2OzE2q3W4fdpvDen
         ojb7hCkLYsyvn6WQXbXovUVZtoTBs+VOo6sKkZMSuZ5mbTe/Ay/0x74IOZ0nsXkedCoQ
         5baMVYZM4zmMP5NR2PwdAJ1baWtMGPkv4jBaXFFH9hBmaypfudu+uLM0Ri9LCfwXljXf
         Z7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUr1IT9aLswHUqqyvZ+p3TyOruCY2Nm/dqQe/UA72DU74LVIVPQIG1u1VWwNqIWg/B/lf0p@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/SvsQ23juau9eNeaMyJEqgfV3lje/2WyGIrZX6K38R55tdNMF
	4rSrb4NnehjP95nOxKSMIgToWCy7FnECW5YBUwoQE2XsevrDYtkv
X-Google-Smtp-Source: AGHT+IETPGhDSd2dPTaUTe/MpX7CvYID59u5rcY/0DoOFj9RnHuwMiq3GVfzLGUfcMWFWNdyAVZ8ng==
X-Received: by 2002:a05:620a:d81:b0:7a9:b3eb:9ca1 with SMTP id af79cd13be357-7ae37852a69mr174950285a.28.1727395340967;
        Thu, 26 Sep 2024 17:02:20 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377ecc4dsm36520085a.70.2024.09.26.17.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 17:02:20 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8A96C1200043;
	Thu, 26 Sep 2024 20:02:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 26 Sep 2024 20:02:19 -0400
X-ME-Sender: <xms:C_b1ZiwNCRSQ0xegCnqGmWiu8AdCNuyA9N-AU4t4AeU7vZd4uR6NOQ>
    <xme:C_b1ZuQ_Nj4OpZ1qFxWqlkmlcHLfEoLcffi4nnBmtgkgBELercgMwQ5tKzMX5aiMw
    rtP491tb-yU3UW6HA>
X-ME-Received: <xmr:C_b1ZkVkENCmWd2oWEjGEjAiTpp6avxtNcLd1v3Qv4z9cUBJwR2_LDX0pZfl2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouh
    hnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhonhgrshdrohgsvghrhhgruhhsvghr
    sehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdruggvsh
    hnohihvghrshesvghffhhitghiohhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdr
    ohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggv
    rhhitgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:C_b1ZogbkNvj7gJgUY3zLWKYYUnfcrbB1kR2_1cIo1xnPCGmJUU21A>
    <xmx:C_b1ZkCtu4IXBMF9tBa8xlvkkb1SxSURkKhGzEBINnpAhSOOfHtnSw>
    <xmx:C_b1ZpLgdv_WW3xDEbl2RrhZxEeTmVZlJG3mDJZZxhtL-LwEcx0arw>
    <xmx:C_b1ZrBblqgVfYzMvroeUWYgf275JUmPfrjkAh4el2m7J1cCjFbFVQ>
    <xmx:C_b1Zsz2VQ1OjogLsDQWkVFaGYaCXHrUWmFfAFT3RIMwIKaQf6HoeZyF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 20:02:18 -0400 (EDT)
Date: Thu, 26 Sep 2024 17:01:31 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-mm@kvack.org, lkmm@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <ZvX12_1mK8983cXm@boqun-archlinux>
References: <4167e6f5-4ff9-4aaa-915e-c1e692ac785a@efficios.com>
 <ZvP_H_R43bXpmkMS@boqun-archlinux>
 <a87040be-890b-4e83-86bb-5018da4a894d@efficios.com>
 <48992c9f-6c61-4716-977c-66e946adb399@efficios.com>
 <e2733938-06fa-46c3-8839-4349fe50d46f@efficios.com>
 <2b2aea37-06fe-40cb-8458-9408406ebda6@efficios.com>
 <55633835-242c-4d7f-875b-24b16f17939c@huaweicloud.com>
 <CAHk-=wjL803+FxtAPSGrWqThGQP5cCHzzwZJFq+-fkgt5DQ3VQ@mail.gmail.com>
 <54487a36-f74c-46c3-aed7-fc86eaaa9ca2@huaweicloud.com>
 <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wifOW0VEh6uL3sHSaAUA46YmPDS9Wh5HnNC2JyOiXVA=Q@mail.gmail.com>

On Thu, Sep 26, 2024 at 09:54:33AM -0700, Linus Torvalds wrote:
> On Thu, 26 Sept 2024 at 09:40, Jonas Oberhauser
> <jonas.oberhauser@huaweicloud.com> wrote:
> >
> > Boqun seems to be unhappy with a barrier though, because it would
> > theoretically also forbid unrelated optimizations.
> 
> Well, doing a "barrier()" is kind of a big hammer thing, but honestly,
> I don't think we've ever seen any real situation where it makes a
> noticeable difference. Yes, it can pessimize compiler output more than
> strictly necessary, but the kind of code generation issues it causes
> tends to be the non-problematic kind (and particularly the kind that
> even a trivial OoO core will deal with well).
> 
> We do have some more directed compiler barriers available, and this
> code might be able to use OPTIMIZER_HIDE_VAR() for example. It's kind
> of a "single variable value barrier".
> 

Hmm.. this seems can do the trick? 

	#define ADDRESS_EQ(var, expr)							\
	({										\
		bool _____cmp_res = (unsigned long)(var) == (unsigned long)(expr);	\
											\
		OPTIMIZER_HIDE_VAR(var);						\
		_____cmp_res;								\
	})

i.e. compare the address and hide the equality information immediately,
so in hazptr code:

	ptr = READ_ONCE(*p);	// first read

	if (ptr == NULL)
		return NULL;

	head = (struct callback_head *)(ptr + head_offset);

	WRITE_ONCE(*hzp, head);
	smp_mb();

	ptr = READ_ONCE(*p); // read again

	if (!ADDRESS_EQ(ptr, (void *)head - head_offset)) { // pointer changed
		WRITE_ONCE(*hzp, NULL);  // reset hazard pointer
		return NULL;
	} else {
		// Optimizer lost the information on the value of 'ptr',
		// so it cannot replace it with head - head_offset.
		return ptr;
	}

Regards,
Boqun

> Honestly, we don't use it much. It just tends to be _too_specific. But
> it is there if somebody wants to use it.
> 
> > But I have not seen any evidence that there are any unrelated
> > optimizations going on in the first place that would be forbidden by this.
> 
> Compared to something like "smp_mb()", which is not just a compiler
> barrier but also generates typically very expensive instructions that
> completely mess with an OoO core, a regular compiler barrier is a
> complete non-issue. When you have those two close to each other, you'd
> have to make up some very odd situation where the plain "barrier()" is
> even noticeable.
> 
>                Linus
> 
