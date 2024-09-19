Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF2191F7B
	for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726729845; cv=none; b=PmTthUXVEj+TEPK8+eiDw7rLeKNdpYZ+HgV/5o35kVltxHib1iO2RWJ11QItV/wOnP+ywK22nw32+Qh3dKlb+XLFb035CA88AoRSZ3JAC7ly0i77I/95dZTXTY7x1V7ioZa62UcmWvjiQGb7HNfFjGsx83vZsZ6r4oPXP8s/zvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726729845; c=relaxed/simple;
	bh=3QHzNYn6bQo9WZIWRe3nhGOkEDPFAhwWWERWCitveaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkKrgJZPLtbzhRgVYgnRqsxvk+kDYsfe53JhtLsaijiStrTbRFOy9+gdbymSVeM5ifyBLAU5LvgoDB/2YEbgYqkT6/XI/TEW37VBd+Daah02e6Z5xt3OJY63f9LmQFOEUw2EVc0HmL+6sUc4NQCXkB3kRm1jk0AyXFqQbLXegBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaaJfq6x; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaaJfq6x"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-45821eb62daso2760501cf.3
        for <lkmm@lists.linux.dev>; Thu, 19 Sep 2024 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726729843; x=1727334643; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7QO2c7/I67RlCRDcr/Y3qX9Q299kYfHctBt13qLUVFY=;
        b=jaaJfq6x43AK18w0Dlus5iQ2RPCAtp1F9+C98TldoQXmApnOC94i4WiTuQQ7O35N5g
         xVlSUp9og6bJkreOs40PhO8luH+/OVzisi//OIsZWJT3LfkXXpQoO0YjwjVM85KyYSb5
         quRpxvLgMkMrzNHWCyM6aS3Ndza27iN+HHOvM/iidlDkGEXWk2V7+lZ0SZHUVgU4czBH
         cqdGNqjNmwEDP0/UPZkC5IzVJxonL9AxTJ9PdX6yMsKv1Ayu4piGR+4E5075ELaNdV4m
         +mtvX4DN3xUDxlZDBwA2YOW9ZDECri4IJDLSKc58NQlKqK3ihBH0+MQaWXTBDhFV0DWi
         QbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726729843; x=1727334643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QO2c7/I67RlCRDcr/Y3qX9Q299kYfHctBt13qLUVFY=;
        b=FZnSVV2Y7pgfDU6GZfcZ95EpHAzoLoeEzjsv2N6dyxZB4ZYn4napwBCcaKwTuSuuTV
         KSwKJlfTH2WiyugFbPXJjG0fKUnxHQF5JIqMnHWvwVakpoIZIsvWITVA4uOn/jEfMn7Z
         kq6uhwL+S6QMQOpKHcpRA0QjR/4vt9uzEF9nWaISTfIqIv9wOF2fEHAjziRCaZ6xHL1K
         HyoPRWHNbO0YN6Filu8svT3tSqw2p4RH4TLweW4/o9TcggCqY2CAXvPONnk8mCNTbTax
         vzERg3k/nBnOmU6Bb7IO3XnhhTF51Rwqw40HskwqolCRexP6A90Ehalm0rqjYofZLOZ9
         fkiA==
X-Forwarded-Encrypted: i=1; AJvYcCXz35jlL3Fub3gpuhCSRC7weSN9S7oKKDehxkNUX60Vwz4dKhJ4qvwnA4P47ZYJL4Y7arei@lists.linux.dev
X-Gm-Message-State: AOJu0YwwhHv/Lp999hlu5r+c2Y4vP95huik51itzK7iaWBi9UKmflUE8
	faPHxzuF4gTvRoOtm35xPqTKGRVn+xS2aS2EE30M9MULGZWH2D7f
X-Google-Smtp-Source: AGHT+IEKX3hg+/XrCUs3vNj5lGyvUgv9sa2s1gAeDJdkuaQ80BEsYKQrkSosZ6GkHLs9lV7qEOSmyg==
X-Received: by 2002:ac8:7d02:0:b0:458:52f0:9bd8 with SMTP id d75a77b69052e-45860422a45mr368514221cf.53.1726729842653;
        Thu, 19 Sep 2024 00:10:42 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b1788c181sm4461881cf.52.2024.09.19.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 00:10:42 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 785DF120006E;
	Thu, 19 Sep 2024 03:10:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 19 Sep 2024 03:10:41 -0400
X-ME-Sender: <xms:cc7rZuL2KHpOmhysjtNv0J7Ul8PR7rUZN3DoM0IJ3r6a8DlgJP2TWw>
    <xme:cc7rZmJGjq1YIbKuEKmvp_m-f2H2otINvkQIvm4WugGtWuwCX4nrEY_VcMmFGj1vS
    VP9l1ElaNCrSdGXiA>
X-ME-Received: <xmr:cc7rZutbiI7QMFsGerMXhXO1junoCRgmS3xkGcxhooXxLWitXXvBCL12Q7E1yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeltddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvdeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjihgrnhhgshhhrghnlhgrihesghhmrg
    hilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheplhhk
    mhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphgruhhlmhgtkheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehnvggvrhgrjhdruhhprgguhhihrgihsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehjohgvlhesjhhovghlfhgvrhhnrghnuggvshdrohhrgh
X-ME-Proxy: <xmx:cc7rZjaxK_4FLYRunDorIZ-lf25ZimazwKmlXG46oFpPRf3L9lzu7A>
    <xmx:cc7rZla83OcqCw74lEFDI8tUAfKrwQy1gRULvYEF5yYrO2ObvuvAEA>
    <xmx:cc7rZvAQYL5oabCq1Osgi2S5AgTTt_efQM4zVLG7_gwJ_Jhp_dO3-Q>
    <xmx:cc7rZrZn_I1vzu8Fd8uR4iTOucHrGzc2_PeN2iElgMelzfyzGemshw>
    <xmx:cc7rZlp5HrKHc67ffqs2cwdsK-oZ-hz1GIKWGvtCe701TrMNTdD3AeWN>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Sep 2024 03:10:40 -0400 (EDT)
Date: Thu, 19 Sep 2024 00:10:16 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org,
	lkmm@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
	Neeraj Upadhyay <neeraj.upadhyay@amd.com>
Subject: Re: [RFC PATCH 1/4] hazptr: Add initial implementation of hazard
 pointers
Message-ID: <ZuvOWM5c8tZotHFL@boqun-archlinux>
References: <20240917143402.930114-1-boqun.feng@gmail.com>
 <20240917143402.930114-2-boqun.feng@gmail.com>
 <CAJhGHyD8MzUssfuKSGnu1arnayNOyBnUA03vYB0WWwbE3WzoZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhGHyD8MzUssfuKSGnu1arnayNOyBnUA03vYB0WWwbE3WzoZg@mail.gmail.com>

On Thu, Sep 19, 2024 at 02:39:13PM +0800, Lai Jiangshan wrote:
> On Tue, Sep 17, 2024 at 10:34 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > +static void hazptr_context_snap_readers_locked(struct hazptr_reader_tree *tree,
> > +                                              struct hazptr_context *hzcp)
> > +{
> > +       lockdep_assert_held(hzcp->lock);
> > +
> > +       for (int i = 0; i < HAZPTR_SLOT_PER_CTX; i++) {
> > +               /*
> > +                * Pairs with smp_store_release() in hazptr_{clear,free}().
> > +                *
> > +                * Ensure
> > +                *
> > +                * <reader>             <updater>
> > +                *
> > +                * [access protected pointers]
> > +                * hazptr_clear();
> > +                *   smp_store_release()
> > +                *                      // in reader scan.
> > +                *                      smp_load_acquire(); // is null or unused.
> > +                *                      [run callbacks] // all accesses from
> > +                *                                      // reader must be
> > +                *                                      // observed.
> > +                */
> > +               hazptr_t val = smp_load_acquire(&hzcp->slots[i]);
> > +
> > +               if (!is_null_or_unused(val)) {
> > +                       struct hazptr_slot_snap *snap = &hzcp->snaps[i];
> > +
> > +                       // Already in the tree, need to remove first.
> > +                       if (!is_null_or_unused(snap->slot)) {
> > +                               reader_del(tree, snap);
> > +                       }
> > +                       snap->slot = val;
> > +                       reader_add(tree, snap);
> > +               }
> > +       }
> > +}
> 
> Hello
> 
> I'm curious about whether there are any possible memory leaks here.
> 
> It seems that call_hazptr() never frees the memory until the slot is
> set to another valid value.
> 
> In the code here, the snap is not deleted when hzcp->snaps[i] is null/unused
> and snap->slot is not which I think it should be.
> 
> And it can cause unneeded deletion and addition of the snap if the slot
> value is unchanged.
> 

I think you're right. (Although the node will be eventually deleted at
cleanup_hazptr_context(), however there could be a long-live
hazptr_context). It should be:

		hazptr_t val = smp_load_acquire(&hzcp->slots[i]);
		struct hazptr_slot_snap *snap = &hzcp->snaps[i];

		if (val != snap->slot) { // val changed, need to update the tree node.
			// Already in the tree, need to remove first.
			if (!is_null_or_unused(snap->slot)) {
				reader_del(tree, snap);
			}

			// use the latest snapshot.
			snap->slot = val;

			// Add it into tree if there is a reader
			if (!is_null_or_unused(val))
				reader_add(tree, snap);
		}

Regards,
Boqun

> I'm not so sure...
> 
> Thanks
> Lai
