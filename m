Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854586341;
	Mon,  1 Dec 2025 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607093; cv=none; b=IfvPRbDhrZ2Z9lCoG+l5O9nInJBe0OpQCwKp6CYUIuU5Aq94KSp3a+rBs+XTAoIU54OVkCiu6EEKQdwaCU5J9Ho92thkZd+YuhH8bqgL0cQV2P+NmYDBC3AwHQylJYAl6uU2LUG24xbDAOjaaqCFTdDJUP75x5jc6rDbeLn6sAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607093; c=relaxed/simple;
	bh=DtUwZaS6SSBESyJ/yVckQ075eVZbIRovtANOffAzxQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCX/kUhs26hE+xMbe3I0uVQiJRwyNkEtvTgH9pRA2DCyJcRVDuWIsGrzG8bIjKWWF43t2uh8cQNtVt1/6ldTu4W54zjALZSHiAo8pKNcpI5N+/963scjKIc8puFKG/jRp3bRdvtNKdr/Mp7WR6gSGbNJSjIvUOeAn/aLVZDknmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPIWgMlq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPIWgMlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C4CC116C6;
	Mon,  1 Dec 2025 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764607092;
	bh=DtUwZaS6SSBESyJ/yVckQ075eVZbIRovtANOffAzxQo=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=EPIWgMlqYHZ0H6MqqnLsKzf4VR41u2ILKAT+gc01Lf2LNc5lbpju8bjB2TYLkT1XJ
	 5JP++qC78qeqLwThya2lwN4YlKnukSqkFGsTviIBbtoMl1biX0+LZ9RX/0IZCAVMT+
	 OumMuicMCeGBKeklm60esMvlQyVoHkjNilxrwXOnx5DZR/3GUHS3vnVGXsVMn4ghaG
	 iRgzL/MY7TTes+PnSx9zYL/4SgWE283WqYiNkkNc7tdBpq59VzBCzWaeqb4HvV07Ot
	 rLJJVt84VMgfbxgedOX3U/tkjx/VGwhcv7unNczbtOjieHPv1WRVsTQZNVrBiKSLGH
	 Ou2mz+pmhyZ0w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EA05CCE095D; Mon,  1 Dec 2025 08:38:11 -0800 (PST)
Date: Mon, 1 Dec 2025 08:38:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	kernel-team@meta.com, akiyks@gmail.com
Subject: [GIT PULL] LKMM changes for v6.19
Message-ID: <d1eddaba-8d38-4a91-a05c-33fb286e8f9d@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, Linus,

Please pull the LKMM update from:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.12.01a
  # HEAD: 7f8fcc6f09fb732745b3252f481def76b18fb99c: memory-barriers.txt: Sort wait_event* and wait_on_bit* list alphabetically (2025-11-08 19:02:26 -0800)

----------------------------------------------------------------
lkmm: Update documentation

Changes
-------

* Sort the memory-barriers.txt file's wait_event* and wait_on_bit*
  list alphabetically.

----------------------------------------------------------------
Akira Yokosawa (1):
      memory-barriers.txt: Sort wait_event* and wait_on_bit* list alphabetically

 Documentation/memory-barriers.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
