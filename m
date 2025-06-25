Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9528262FE4
	for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861111; cv=none; b=YWAFe2jL0Je1/TeINXrp1MYxBmbjcGVE5QY8QgydQlCQtxmmRU5ILceWF/DYXZTYEHJ9R6FPDzcssxYnIzO5rfq45QxN4PMjjSk8WwHD3VHGGffYAu+7MoeJK86vSNM71HeNbnHqaYuhJYEDOKWyd+QUwtPa3MvaL1CKCGNTkks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861111; c=relaxed/simple;
	bh=v8kTdUhjATpjI9S/z2ca5IIHJ3LI0Gt3dbKmgjAwh4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS5KPbUK2htVqIteOfp4GbQAAzE968WkA/doO+KQ653PVpIk77/eTWSzFWfT5N7u/Ot3A1uZzICQtsa5S/Dtvay/WJg0+RN4MxS6xKdYH20TfY+liUf5/rZx0zirhYe65ndMBSW6jYpsq12CPdS4lU5p29ECO/UsN3uN6kpCKdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0DJCEQ+; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0DJCEQ+"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a42cb03673so20961421cf.3
        for <lkmm@lists.linux.dev>; Wed, 25 Jun 2025 07:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861109; x=1751465909; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SApv73wV95/PW1AcOp5ta6WUGd2OuNz5QHUzFSvdal8=;
        b=f0DJCEQ+MJ9M04HJbEZBAJzretciuB1BPqHie+UnSxRG6xoX9I+U0HNcam7p2r5u7n
         px1ZjIbbHo9ZG/d5vzg1kJu3kLWYbbPokDSzEI5B9BUULSyixNaL5m8ZrCFr1KMAZM2W
         pI+Pf/FMquTJpvvXNLxmwBjl9NDZhejWV+kIltTPAARkJYBJ6UBJWJULuynBjdFZ3jGD
         uUCQk4JNwddz+R9jvCOq3JB+mfaW44xO2OFImnHtKv0ohHsHnq/ENs/wjxMKhQTk/VcX
         +5+Kpz2ncrq7kjPqN7ZN7B/18M22dY4XyqYEC86vBPxg5TtARhvDCJFOMokBWe7TFbLD
         8WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861109; x=1751465909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SApv73wV95/PW1AcOp5ta6WUGd2OuNz5QHUzFSvdal8=;
        b=Rs4P8M8bbb7HzQtsmCMVBZqzWDUZ0beSXB0VSWneY+F6CWkHyCjvaxt+dsFQTcHMPH
         wdaX/2CGyze8hUT4AOkmcOtZ2PRuixKPZdLx1CtWhXbllE6L0Aqd1PSrEvZhEnD+W8Ki
         26EBUYi5nQTL+9LIfeiod2uGfgaGfd6VBVVSSBSgvQgbNlVFpOKMhiTIy812cX/xy6PG
         M+OStppWi1Dvgtf+a3qyt51CUvnKp8asDq7yVhMrOL37oxioXTcht2Hb2wePjuqSGdDL
         R3MrCNuNV6ixQjxzTlnzOAJOmZuyzdioxBali2XIOL2Ok0sAtxb4sLBJg6VAXLokpVyd
         LANw==
X-Forwarded-Encrypted: i=1; AJvYcCUFP17IjL1OPG6jB6Nu7dPN784vmgcmgwWaSbzDnT6Z61tCMskFp0KOQLUh/Zh2/IochCA+@lists.linux.dev
X-Gm-Message-State: AOJu0YzZg9+MzQuvVoAN+X64jFxtnu+UcbwrSaVtCKSfju35iObPfc0i
	8N61B2OyitbYpN0VECxA5oLUomKwCIJXVn4YH+J/1E6AkC9xzYP2EvqL
X-Gm-Gg: ASbGncsDGikki4pb6P5Ayq7oUd8DKldACCn3I7l5sT7nqrOQsxIpQT8UpuSjfnitDKR
	KDYy3WnFXVe7FN8a3U5Fb0oKPJybDBZHoIHzUIpdBev7nSpMt3+khrQqbBfKL5kX/2Hsi//drXW
	VQqSEDfrCLTsSwmphnWwlBJGuqKH7BtTRBfvPGfxBhVBu+qldDt/6z5DcEczt3ylzUYAjR27Snx
	nL4i45raPMU4YFj7bCI62sMWkp8vVY3Z0EZrzi41sTwG+nTBJKSIne/NzhUGFc9NkOv7vEj12cl
	d6z75PL2pG8AfSI1zuZKetRzuRP0z11xPsfUCyvpCl2ctLxnIZsO3B8WOb70TpZ4ngEt0RJiWMx
	QfGeZ0/a02CJMABQj32wdq3Fi10AlVEYnoXKQmHdGaSB45RfjPUtO6yaVGD/75q8=
X-Google-Smtp-Source: AGHT+IFajQmaBSIi950oGCwkkGhdcIDigDTu+52BcWLWhXdTGrL+WmNf84aM6QjCMYIHqOhD0NhhMg==
X-Received: by 2002:a05:622a:506:b0:494:f1e7:65ef with SMTP id d75a77b69052e-4a7c08452d9mr53303541cf.44.1750861108315;
        Wed, 25 Jun 2025 07:18:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e5d262sm59894161cf.50.2025.06.25.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:18:27 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21392F40067;
	Wed, 25 Jun 2025 10:18:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Jun 2025 10:18:27 -0400
X-ME-Sender: <xms:MgVcaOwCVCagevnS9sW-PJ7ylYPYtdu6iXaUdfYmg2HNwWYMt8UPMw>
    <xme:MgVcaKRi623tvmF9P0BvaTyMyAvAcocMsiFXhFMwHt-3WicPtos_Ah6cAKtW5mJV_
    XMWv-KLXacVdLQ1Gw>
X-ME-Received: <xmr:MgVcaAWwaGbiUqOhNRJq1dJuqpKzsYsUstJI_7KFdqlU7_4N1XX-Iat9HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgt
    uhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmh
    grnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepuggrvhgvsehsthhgohhlrggsshdr
    nhgvthdprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:MwVcaEjcNogxlCJElq5Ale1bJ6pJZUTJdaXABNsyrKdceAsKRxft7Q>
    <xmx:MwVcaAA_6AfgxN3VXiJPIlFf5fAKOd1ovbVo0vsoEOvkLjTAj515Sw>
    <xmx:MwVcaFJvY5vFTAcHAX_cpzwNn-nVmedOU6MB4Aoenx3yRVhBiB8WMQ>
    <xmx:MwVcaHCjj62N_PPcE_CoPkoZG03OBmd1OkYqSXajhjwJ_k_GNAZO2w>
    <xmx:MwVcaIwD8Mb8OCae105Kdepdt-LxOuJmSd7xTQiTc0SL56i1uNop8Lmq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 10:18:26 -0400 (EDT)
Date: Wed, 25 Jun 2025 07:18:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lkmm@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Breno Leitao <leitao@debian.org>,
	aeh@meta.com, netdev@vger.kernel.org, edumazet@google.com,
	jhs@mojatatu.com, kernel-team@meta.com,
	Erik Lundgren <elundgren@meta.com>
Subject: Re: [PATCH 8/8] locking/lockdep: Use shazptr to protect the key
 hashlist
Message-ID: <aFwFMf3K_hBygBED@Mac.home>
References: <20250625031101.12555-1-boqun.feng@gmail.com>
 <20250625031101.12555-9-boqun.feng@gmail.com>
 <20250625115929.GF1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625115929.GF1613376@noisy.programming.kicks-ass.net>

On Wed, Jun 25, 2025 at 01:59:29PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 24, 2025 at 08:11:01PM -0700, Boqun Feng wrote:
> 
> > +	/* Need preemption disable for using shazptr. */
> > +	guard(preempt)();
> > +
> > +	/* Protect the list search with shazptr. */
> > +	guard(shazptr)(hash_head);
> 
> OK, this is the end of the series, and so far every single user is doing
> both a preempt and a shazptr guard. Why can't we simplify this and have
> the shazptr guard imply preempt-disable?

You're right. The background story is that in the beginning, the hazard
pointer protection was placed at the callsites of is_dynamic_key(): one
in register_lock_class() and one in lockdep_init_map_type(), and in
register_lock_class() I could use the fact that it's called with irq
disabled to save the preempt-disable.

So given the current users, it makes sense to fold the preempt disabling
into shazptr guard.

Regards,
Boqun
