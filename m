Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32E83161B4;
	Wed,  3 Dec 2025 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798790; cv=none; b=h+9gUrbgsKuQSmpshTOEFNPisbyBr3K6g1oN04QX4b6dDKa7nre74JR1mGsvo+jRzybYgi3nK0HHOBALNsgWKhuyxd2eDPJJViHrUQm92wUHI+1UJv3fgnuGgt308QcfmgLDE8j2wbXlJXvCNM7wHPesveHSMDZ1HIj3XEBP8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798790; c=relaxed/simple;
	bh=8ISyT1lqCSz8cV8y6g7OievDKhkUN1wTceQv3XokVI4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ML+cUpEPr07kM2W3/ZzJlYYPG2bQm6Q99ahhtVXM0KrTueRWpvJDjQsc29G9cRPyu0F6wIRHFNe4gJJzEnX1d1tJ0ck/IvsThbMJlY3JnbFlW+TArbfKybTVgK6I8Uyu4RXGpiTYF9nizLBDKdeMSEnGqyUt63j/gW3E/VVq4qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur7vFc7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur7vFc7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C0CC4CEFB;
	Wed,  3 Dec 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764798790;
	bh=8ISyT1lqCSz8cV8y6g7OievDKhkUN1wTceQv3XokVI4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ur7vFc7kNZl77XdeceTRxMR/8KPAahwLo8uhF57Gliz1L/eDUaj1ZEfgTn8gi3v0K
	 KgSwcMs4QTEonplsEqUBEHYcu7RLlc3DUw7sD6VdNlS8bm1mvxuI3yYfqeEWA0366Z
	 QKKjaqw1/OMSK+iV6x98qcMHsbc5pTQcGxWbXVv1hyYbvUOFv1+MOXPjqi0AqacOYv
	 TflJbzoyYNygDrOMbN5HHIN0BjRinjuXy2OSNNwBCM6+9Z8xb6a2feOg3osGjQPG6T
	 MO+v6N2OVVcGWO1V7UeVm0Jt9P1yLPwkYc7tBEVd6uQzQnx4Yck8zkh9+MS6m1IANE
	 zKQZgI6VoiZ8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 789C03AA9A81;
	Wed,  3 Dec 2025 21:50:10 +0000 (UTC)
Subject: Re: [GIT PULL] LKMM changes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <d1eddaba-8d38-4a91-a05c-33fb286e8f9d@paulmck-laptop>
References: <d1eddaba-8d38-4a91-a05c-33fb286e8f9d@paulmck-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d1eddaba-8d38-4a91-a05c-33fb286e8f9d@paulmck-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.12.01a
X-PR-Tracked-Commit-Id: 7f8fcc6f09fb732745b3252f481def76b18fb99c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a4e0199378f309fa7259132e1443efe56c1e276
Message-Id: <176479860911.93177.18423478527890720776.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 21:50:09 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, lkmm@lists.linux.dev, kernel-team@meta.com, akiyks@gmail.com
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 1 Dec 2025 08:38:11 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git tags/lkmm.2025.12.01a

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a4e0199378f309fa7259132e1443efe56c1e276

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
