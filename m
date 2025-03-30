Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D014B08A;
	Sun, 30 Mar 2025 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357178; cv=none; b=e9pFr7svJnrDCsNfVb8qg0ROnXt+05bIoxiZUUM21TKbhMbbS/JVi5BaalEQ06wWOF67oqMZN2v/dYOMQseEaE/YzWLUDfbWBCEXcgWGOMBQlHDoIAUvoFJv8PQfmq4nKnizBkMa3CVF0pTb8cEj9ozsW6PmQT5FIYIN3r6TICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357178; c=relaxed/simple;
	bh=7e0wnXNRs6Kfwx5gKNC6ozyxfGt5BWhdaG7QHUgybp8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPcUNZ3eCNv+yGdpRbnVB4LerBxKDToyBZ/YkhXnPyQBXZLLaYIoplHn0SYGsszzXta4HcObEZj1VAvl5WfErhpF4YYVfyzq0t12WTMVt3adJRmNrELv3yLKJKH/FcpjWg03E2srr4hSNdvDwi5JUy0g+pnM20N71yjYso0aV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qB9dUcCs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qB9dUcCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB5CC4CEDD;
	Sun, 30 Mar 2025 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743357178;
	bh=7e0wnXNRs6Kfwx5gKNC6ozyxfGt5BWhdaG7QHUgybp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qB9dUcCs+3TRXl4skIm5ZbXegawVOHA8SoEug8aV0HCMkl2bz4f/NfZ1B3exRB3+Q
	 xqVrVoxuc8ICV2Tz8Cdv4gbQ6XTtYFraTl+qe5A2p4lwgVPu/Pbksdc7IOiG10ArBR
	 zbxByG9Ou3h2sTCVf8olkQSo2wba2R0X7pCoehcEm5t5fEVcYUDaz4Y/M5Ja472KFk
	 OJoyVIoyq2xWXIk3WPEug37BVKU1LohnualOhvXdBHFzKwTKhkMBH5sviAVvEb6rX/
	 gS1ibzlpjawzHpkWfFt/Qh71aECYf+WOESU9TEfcg6tb+wEUEm9s35wSrGTGm25STH
	 tUNc4wMbsK7BQ==
Date: Mon, 31 Mar 2025 01:52:45 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev,
 paulmck@kernel.org, joel@joelfernandes.org, Akira Yokosawa
 <akiyks@gmail.com>, linux-kernel-mentees@lists.linux.dev,
 peterz@infradead.org, corbet@lwn.net, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: Potential translation of LKMM docs into ReST
Message-ID: <20250331015245.260fbb52@sal.lan>
In-Reply-To: <16aa2173-afb2-4781-b1b0-a248b1f16a9f@rowland.harvard.edu>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
	<16aa2173-afb2-4781-b1b0-a248b1f16a9f@rowland.harvard.edu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 30 Mar 2025 12:09:22 -0400
Alan Stern <stern@rowland.harvard.edu> escreveu:

> On Sun, Mar 30, 2025 at 01:07:23PM +0200, Ignacio Encinas Rubio wrote:
> > Hello!
> > 
> > There is interest [1] to get the memory model documentation into the 
> > built docs. Akira pointed out that this was discussed in the past [2].
> > 
> > A couple of years have gone by, so I was wondering whether the decision
> > to keep plain text documentation still applies. 
> > 
> > There is an "easy" way [3] to get the plain text documentation into the
> > built docs, but I would be happy to work in a conversion into ReST if
> > that's what you want :)
> > 
> > Ccing people involved in [2]
> > 
> > Thanks!
> > 
> > [1] https://lore.kernel.org/all/87o6y5lvvg.fsf@trenco.lwn.net/
> > [2] https://lore.kernel.org/lkml/20190901133530.GL4125@linux.ibm.com/
> > [3] https://lore.kernel.org/all/20220927160559.97154-7-corbet@lwn.net/  
> 
> I have no great interest in seeing the memory model documentation 
> translated into ReST, but you're welcome to try it and see how it comes 
> out if you want.  Some of the files are likely to be easier to convert 
> than others.
> 
> The only restriction I will insist on is that if the resulting ReST 
> source files end up being unreadable because of all the markup they 
> contain then we must keep the original plain text files too.

I did some attempts to convert some of them to ReST. Some files
could be a little be tricky if we want them to be converted, but
it is possible to go to a minimal set of changes. For instance:

	Documentation/memory-barriers.txt

There is an outdated conversion of it could be found at:
	https://lkml.org/lkml/2017/5/18/1267

If you take a look on it, most of the changes are minimal. On a
quick look on my previous patch, what we have is:

1) the most relevant change: example blocks need to use "::", like:

    -in 24 different combinations:
    +in 24 different combinations::
 
 	STORE A=3,	STORE B=4,	y=LOAD A->3,	x=LOAD B->4
 	STORE A=3,	STORE B=4,	x=LOAD B->4,	y=LOAD A->3

2) This won't work:

	By: foo
	    bar

   As it will produce a warning and place everything on a single line.
   The smallest change would be to add a blank line after :, e.g.:

	By:
	    foo
	    bar

3) This is not valid list on ReST:

	 (*) element
	 (*) element

   On ReST, unumerated lists use either:

	- element
	- element

   or:

	* element
	* element 

   We may also use, instead, a numerated list with:
 
	(#) element
	(#) element

  On such case, Sphinx will automatically numerate the list
  This is what I proposed back them to make changes minimal,
  as i wouldn't need to adjust indentation.

4) Tables in ReST require an extra line before/after it:

	+	===============	=======================	===========================
	 	TYPE		MANDATORY		SMP CONDITIONAL
	 	===============	=======================	===========================
	 	GENERAL		mb()			smp_mb()
	 	WRITE		wmb()			smp_wmb()
	 	READ		rmb()			smp_rmb()
	 	DATA DEPENDENCY	read_barrier_depends()	smp_read_barrier_depends()
	+	===============	=======================	===========================

5) Footnotes on ReST require a different notation. Either:

	[1]_

   or:

	[#]_

   and, at the place they're used:


	.. [1] foo

   or

	.. [#] foo

 
6) Chapter numeration markups need to start from column 1. On files with
   sub-chapters, some changes to use the same markup might me needed (this is
   not the case of memory-barriers).

The remaining changes I did back then on such patch were cosmetic to make it
look more similar to other parts of Documentation, like using "Titles Case"
for chapters and converting CONTENTS to a comment for them to not appear at
the docs output (as Sphinx already generates a contents index).

Regards,
Mauro

