Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD7620C014
	for <lkmm@lists.linux.dev>; Wed, 14 May 2025 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264867; cv=none; b=TG9i2uJuyMIkh1jZ7uLIfq/Nzf0UG39B1sq5218LOo6ceLF5DWGsS1haFIchZVtXKUretR8EjU5FB0bTjehFjZ+WrNbBZE00OW3yyXnsG2bOvgGiyadHPuzGf30LtuVrjtcC50VEenEOjzQRA6j6tLOmkXUACvYRoy9E6AZbGf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264867; c=relaxed/simple;
	bh=uQfanbkbNKzMoHOMeVj3wbsTpuwNVNOz8UDzF8whJpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2b2ah/Mx6jKRb+HNnDoAQaignQgSwjBlxpM6pkxvegi/RmIP4S+0yfWM3gsYSqUfJZrSnyMyDos+UsIGcecHlUeQZ9oQA+aFCBqFDpXAhg8MFxmQzcqNHuGhBVvpwxwGZLLDokKTF0sEXnKo01QA44PQf3CFvsbd802Cc2EAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=ojJzfWAS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="ojJzfWAS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7415d28381dso396199b3a.1
        for <lkmm@lists.linux.dev>; Wed, 14 May 2025 16:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1747264865; x=1747869665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpxE6MEMMzwuyZNOZ6BiIuMXiwrHtKHE10sl2jjdvxE=;
        b=ojJzfWASnnLZS/Khk4ZNSyvreS5ajPUxj39atzlO4E6oTOvt9MrepjrAxqZnyc5rYq
         B3miA/zzYcm/EjoHwclO4dFBWgkTEMnK7k15Ep6nrSteqftr+IV47VrcFdNq0oMEA1Am
         K6AFfVN9LD3Kioyq3XRC8bJdO2CFNffTPSr9kB4E9qv0DCBx5b/cqprEkKNlmU/cR2jA
         JtXvMRGMC3aQtiPHvC3SOOR4AyjQF2hFvFGbmBOnEesnL94pt78Qp53V3nNdrFCnixmC
         jNpS2b8rAF/3iSWk/AZ3O4Nbej+EKG4YCTOLKdH79h3QTzXO3OAG85mWfdqhoDlpdixM
         e6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747264865; x=1747869665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpxE6MEMMzwuyZNOZ6BiIuMXiwrHtKHE10sl2jjdvxE=;
        b=IYuai/X5UON986CFTw1i901IsJ8gdXn7lFGwufD7v9CqsyLkEr+lgaidAIIsMVQvGh
         RxiuZDmx966KCyZYqqpcJQ0/6NaFmeVGfIvs5cxCshfo26vBIZ0JFWjtMiFkWmQWo39Z
         VjCQIDxvoyFWqS4oUbEqSwYsB8qmd2YnseXu+cXvHh0jhx8iKGKXp305wlzdej34NhOi
         EFHqij5DADGiUWi+Opjtb0/XTEY6Jix6GD7+Lsp6H5Ygu9EpyyGV4nQ1i3gBP/ZZflSh
         GRTP9g0NPttSw2z0yvkza0JsxDTjn0cRwGoy7XWHl0z0lvJd8ccOzqTKv2xa1AR8S3yI
         R/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVysU+WqH1ctu+KcjJzbw5zE8hjshtPe4E79IXX+zJUglLyLzbuc/MAgQs84mnSEfMWefrk@lists.linux.dev
X-Gm-Message-State: AOJu0YxtteL0Y/DwrO0yhKP+G88rmuiEswrBMow4fMmewF0epTHoCPQy
	kBqEFh3kXAyTwA92XiL5VZTp0Hdk0wMp3aJm1UtKKbx2D6wyO2yxx3gs3Bw/KVY=
X-Gm-Gg: ASbGncv2E4V5eJV89/Byo20V+u5OXzTGfiPi8xDjQcRD//CxjRcRZDHooWlemhGb2LY
	cCFDcq5/mTIcORJ7aHrRX4Mp/Q5N0sw4B7o8lKiRfpkErKhuXI6QftBBDlwU7/viy2ca5Jb5QJc
	5kLXEEn/XXDmK2vqfFSbR2DuvB7aZFZ0he6iyB0Do21KYDA6p7iN7J6sFMzlJyh8M0Fr+W5f+/o
	YYdklJLTxLfrfUqTx9BplQVeq0N9991nHz/3puOvhU0hhB35AgxxgOTh5bchr5gqtuhLuhYZHSf
	guHjRQLjm4+HroUqRlkCW+ZXyDBLk9BATdLi4wSprIVtp/VoYnaqz9HdPjeHvru5jeCY1deVINk
	SqGL7uk6GCnXqv7ThbVRJ2IZtbXU=
X-Google-Smtp-Source: AGHT+IGbo5cEIC0JUxpfSPsVWhCeQsEIHLbngmmQEFQhMKY4u1ZgqEsu0R0NtVVUP9lCappXR8Q5vA==
X-Received: by 2002:a05:6a21:684:b0:209:ca8b:91f2 with SMTP id adf61e73a8af0-215ff125547mr7347703637.19.1747264864692;
        Wed, 14 May 2025 16:21:04 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b23493257eesm9454409a12.16.2025.05.14.16.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:21:04 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uFLPJ-00000003b3s-17mk;
	Thu, 15 May 2025 09:21:01 +1000
Date: Thu, 15 May 2025 09:21:01 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
	cen zhang <zzzccc427@gmail.com>, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xfs: mark the i_delayed_blks access in xfs_file_release
 as racy
Message-ID: <aCUlXbEg9wuyPEB6@dread.disaster.area>
References: <20250513052614.753577-1-hch@lst.de>
 <aCO7injOF7DFJGY9@dread.disaster.area>
 <FezVRpM-CK9-HuEp3IpLjF-tP7zIL0rzKfhspjIkdGvS3giuWzM9eeby5_eQjL5_gNG1YC4Zu0snd2lBHnL0xg==@protonmail.internalid>
 <20250514042946.GA23355@lst.de>
 <ymjsjb7ich2s5f7tmhslhlnymjmso5o2lsvdoudy3dtbr7vjwk@moxzvvjdh6zl>
 <20250514130417.GA21064@lst.de>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514130417.GA21064@lst.de>

On Wed, May 14, 2025 at 03:04:17PM +0200, Christoph Hellwig wrote:
> On Wed, May 14, 2025 at 10:00:28AM +0200, Carlos Maiolino wrote:
> > I agree with you here, and we could slowly start marking those shared accesses
> > as racy, but bots spitting false-positivies all the time doesn't help much,
> > other than taking somebody's else time to look into the report.
> > 
> > Taking as example one case in the previous report, where the report complained
> > about concurrent bp->b_addr access during the buffer instantiation.
> 
> I'd like to understand that one a bit more.  It might be because the
> validator doesn't understand a semaphore used as lock is a lock, but
> I'll follow up there.

Even so, it's not a race because at that point in time the object
cannot be seen by anything other than the process that is
initialising it.

We initialise objects without holding the object locked all over the
place - if this is something that the sanitiser cannot determine
automatically, then we're also going to need annotations to indicate
that the initialisation function(s) contain valid data races.


> 
> > So, I think Dave has a point too. Like what happens with syzkaller
> > and random people reporting random syzkaller warnings.
> > 
> > While I appreciate the reports too, I think it would be fair for the reporters
> > to spend some time to at least craft a RFC patch fixing the warning.
> 
> Well, it was polite mails about their finding, which I find useful.
> If we got a huge amount of spam that might be different.

That's kinda of my point about it being the "thin edge of the
wedge".

Once we indicate that this is something we want reported so we can
address, then the floodgates open.

I'm wary of this, because at this point I suspect that there aren't
a lot of people with sufficient time and knowledge to adequately
address these issues.

Asking the reporter to "send a patch to data_race() that instance"
isn't a good solution to the problem because it doesn't address the
wider issue indicated by the specific report. It just kicks the can
down the road and introduces technical debt that we will eventually
have to address.

We should have learnt this lesson from lockdep - false positive
whack-a-mole shut up individual reports but introduced technical
debt that had to be addressed later because whack-a-mole didn't
address the underlying issues. When the stack of cards fell, someone
(i.e. me) had to work out how to do lockdep annotations properly
(e.g. via the complex inode locking subclass stuff) to make the
issues go away and require minimal long term maintenance.

I don't want to see this pattern repeated.

We need a sane policy for addressing the entire classes of issuesi
underlying individual reports, not just apply a band-aid that
silences the indivual report.

So, let's look at what kcsan provides us with.

We need functions like xfs_vn_getattr(), the allocation AG selection
alogrithms and object initialisation functions to be marked as
inherently racy, because they intentionally don't hold locks for any
of the accesses they make. kcsan provides:

/* comment on why __no_kcsan is needed */
__no_kcsan void
xfs_foo(
	struct xfs_bar	*bar)
{
...

the __no_kcsan attribute for function declarations to mark the
entire function as inherently racy and so should be ignored.

For variables like ip->i_delayed_blks, where we intentionally
serialise modifications but do not serialise readers, we have:

-	uint64_t                i_delayed_blks; /* count of delay alloc blks */
+	uint64_t __data_racy    i_delayed_blks; /* count of delay alloc blks */

This means all accesses to the variable are considered to be racy
and kcsan will ignore it and not report it. We can do the same for
lip->li_lsn and other variables.

IOWs, we do not need to spew data_race() wrappers or random
READ_ONCE/WRITE_ONCE macros all over the code to silence known false
positives.  If we mark the variables and functions we know have racy
accesses, these one-line changes will avoid -all- false positives on
those variables/from those functions.

This, IMO, is a much better solution than "send a patch marking that
access as data_race()". We fix the issue for all accesses and entire
algorithms with simple changes to variable and/or function
declarations.

To reiterate my point: if we are goign to make XFS KCSAN friendly,
we need to work out how to do it quickly and efficiently before we
start changing code. Engaging in random whack-a-mole shootdown games
will not lead to a viable long term solution, so let's not waste
time on playing whack-a-mole.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
