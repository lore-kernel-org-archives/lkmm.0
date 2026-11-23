Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445918;
	b=ERCIQ7qQ4usY/FjSFGHtn1mcpD6pPAoWBZdwTN140y3c7qa6RCIPxoy9PUmajjYahno6
	 5Zeb8mLXO9BQLrjcHcidt4pfaa81H6noJ13zqulu3zsnyOYknVfLykQhrD1wwp4L0ciNW
	 O/gzMis2WfAfTa2zY5Xz5LdlBSVu5dWUfTQhmvFlo9XqTgMEHnKTbS3Mwb2706UQ3O9FM
	 ZXL1glD0ELRJEYVcG4CM3amMc006nUT8QvTeu/r4cRuvEgETX/peUHxfMadbzBLxIB/gm
	 NO2HNqU7xQ8W33ArwwfaXJ5/6hrMG8q4HZaAqrZGxEnnB+reDAfwp3YAKP3fZJ7dokA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Z9sGErjvuTdsND5vQoTeu95uEySWd8dkG2qG5cilc7U=;
	b=sAkJlYNFIMQVIHvH17wUDB/PSdCmEDEpnP140sX9/iHx7q91XsGKmhdjEzrHEwXYdYmW
	 EjsC+sagh4I4CDWFGkUw+CWQlX77Z+htqR3HeiSu0aVMG3TaYG9j24oeyItSZKXuCLNo6
	 eSCwxc6o+KIN+YEH2vdMMaJ+dJkXOA4WQTl2Q5v7I8zvsUP9EFAf057urXy1f1XQGBj4I
	 K3Hpr3D4j0LrqetYoTxrJl24xMZnXf3kRFR6VcGUR1ceESQjMzDNf7J4cGzXzdxJmW0nJ
	 bnWFq4j4WWYBfnIc+uuBd0PCOeG/s70kV1N1myeqxnlsjIWjntKpKYZT0UXORb3ZOCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=usUOj+jf;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F8606A33E
	for <lkmm@lists.linux.dev>; Mon, 23 Nov 2026 14:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866F8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=usUOj+jf
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5364648ae07so35003291cf.1
        for <lkmm@lists.linux.dev>; Mon, 23 Nov 2026 06:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795445917; x=1796050717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9sGErjvuTdsND5vQoTeu95uEySWd8dkG2qG5cilc7U=;
        b=usUOj+jfBxbu8f/MobuhJL9vYLS9MMyU3FP7esrIUmWjUlSHmC1fIAMCjYT0TYLJ+d
         S8BSTtSge/4mRbsU9mP6xQ7NeNiE7EEqNvDNsoSKjqMS+yKVWzHt8PltT5kkszGJqDH+
         4B3vQNvOm6jcCYTVnYZQxfDyiZmL7QodihskrlWNMmLO/dmHjo4tQ0cRSzxyCBNbgGSj
         r9u6MZSBlVjT2K3MafuLfpBrZABBxy50CQ1q2AzXbeOUh75e0lDjcbs+QJFiJWsxtUfA
         SPK192jv6XMkSPDAFo4vBdzEV5ab6VsslftDib2j6HSG2wuWPGD1m9wuIVbesltp3UvH
         aElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445917; x=1796050717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9sGErjvuTdsND5vQoTeu95uEySWd8dkG2qG5cilc7U=;
        b=LoqXx+e8yNaz3WCgts6seJpEIT2Y049SQq6g/qSNvSuM16wu7f4ApahVskn/0xXI8T
         apkKLHvhA56tcHW9DZp5og9RTA4hSw2dGJw3ZyaGzh0CtCeU0j5k3wqTMoxRhx+bdV07
         YTd4A9ax+gKRN30+BAgmvPrV/Caubm8qfecVLAYfEzSUtZYMxLebahYnOhsEArETcmde
         JG45l+wEvXVmJxOJdW4gCl7PfSVQBCgNJ5TvMRXMhXbbANkGZjW6Is7C1uz8J8/IJxWg
         c24xX5ewCSDjgGWCd/P4aGeq4Zy9cKWhSAa0ZqgpV/F+m/a9FVQGyuicIN3LfBFmvWzC
         WySw==
X-Gm-Message-State: APuU4Z9iWr05+xQHurjvBKlDGlMS9tcgG2zbmeK5bpVP8z5xpZhCO19n
	R1yuDCJ0Fmi54Fx05LkS25qx4rKnfNRqtn3HOHCgwAi5ot8DcVJQprx8kgucBSPJDA==
X-Gm-Gg: AZFdTZd6YYemrhxPYjTp2Ghlxr9u7idMUoCLfzEgYMWH1ShdqWHJ5LoapkKw1gkyjJR
	VjAKzpH4C4zF/nZZpqkNU1uqVyuLL0tgiJOL/1mDgn5qWl0WHNZg4qifs5aZnOMhK/xQasYrzCS
	YeD+InwINQ/2j32mGSTWxqzXkJ+/tW0NrJKbT8SK+ac8CQLzTsc2f07/x+2QhDvBS6zOJ5LFGKZ
	Mtpakaa+nHDZLzHCCMyd+X4Vy/blgiLPAeGanY2ow7ZzEktMJva9IxaDFNTV8F1BX5RKAeb7TKA
	L3UvO6AqMybDfGe49afGMRaniNkUYn7P9+DHugq/iV4EVBvmVo0MMSLSRtOoEPH/lPtstCguutG
	J++8PsWh+C+PbA1zUL8JAUQGXT7y3nJFuWAvHHegaVUOlERyZjY4bJoETM78WMlGLe86/lbzIYY
	RvDjbi9eus0tsk4ilwRUkkjjfQzHFs4DiUhdJmRtbolTfohUBQwVXHyz4ihGG8M8QVL7OlAM86g
	aORbse2n+hDGukqslK7gqGtMBJkxlxz6SYG8TegQI4IL2hSddrKjTf+rO1tHQQBFr4JlV2v2i2y
	IfuDzc5lqmuguisjlj8uFzYVWgpkMH3X972n7J3Uzylciyk=
X-Received: by 2002:ac8:6f16:0:b0:55d:6cfa:3e78 with SMTP id d75a77b69052e-55d76a1f704mr229976471cf.34.1795445917234;
        Mon, 23 Nov 2026 06:58:37 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm108115136d6.44.2026.11.23.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:58:36 -0800 (PST)
Date: Mon, 23 Nov 2026 09:58:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Wayne Yan <wayneyan@google.com>
Cc: lkmm@lists.linux.dev, Jonas Oberhauser <jonas.oberhauser@huawei.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Mars Cheng <marscheng@google.com>,
	Kuan-Wei Chiu <visitorckw@google.com>
Subject: Re: Question on (prop \ id) & int excluding non-trivial self-links
Message-ID: <3422c76c-67ca-4314-bc82-4f6b35f9ece4@rowland.harvard.edu>
References: <20261120083620.2186353-1-wayneyan@google.com>
 <e14d32d9-1734-4e55-8ad2-9c8aa0b49c9a@rowland.harvard.edu>
 <20261123043314.819493-1-wayneyan@google.com>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123043314.819493-1-wayneyan@google.com>

On Mon, Nov 23, 2026 at 12:33:14PM +0800, Wayne Yan wrote:
> On Fri, Nov 20, 2026 at 04:16:18PM -0500, Alan Stern wrote:
> > There doesn't seem to be any need for them, especially considering that
> > the memory model is not meant to apply to MMIO.  In fact, you would
> > probably want a completely different memory model if you had to cover
> > interactions between CPUs and I/O devices.
> 
> On this point: our goal is to model the CPU-side ordering guarantees
> for MMIO primitives mentioned in memory-barriers.txt. Since driver
> code uses them alongside normal RAM accesses, spinlocks, and RCU,
> extending linux-kernel.cat seemed much more practical for our use
> case. Do you think it's wrong to put the CPU-side subset on top of
> the existing linux-kernel.cat?

Nothing wrong at all, provided you put the extension in a separate file 
(like lock.cat is separate).

How does your memory model express the relation between two MMIO-mapped 
addresses of being on the same device?

Does the model include things like PCI's posted writes?

Alan Stern
