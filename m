Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994563;
	b=G1QGCs/vOiXEI2qYs0xgdxjYSkFP/yezhC1Db9VcdmOwngEyu0T6xcm7+4YX4g1fQi9N
	 fb5JYEETdMzelnpPvpOMGgyX4qgofLsUXCC/Msx0oND6sagQd188X49L4GmeEJ+YhKItE
	 kXAbveNng4xPGpTD2eRajpOuvobJJ55ZUhGBYMadzVF6YG8I8mvflK7e93IhWzgZXreFN
	 vVxFpZT92INWDNNOveUpPobJ4qGTnw4/CgsKzs9AiAzc14wcOrf4FGnVoXWRAyZwF0kMK
	 edL5YeEqWjfXOAdrfT/H2iTr9yO7djK0kMqHq2ScOSVoAd7hZiqimte9fZ/ZMtMyNPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994563;
	h=Received:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
	 Reply-To:MIME-Version:Content-Type:Content-Disposition;
	bh=YtvAeH1Lk9qY+OtdbuDry6Fob14KLlwIPC/5liN5daA=;
	b=48kppOoGDf73JHhUPNHfPoDTZsnlVU0Jbt6qpxjUcHOtHzgrkoWzyVBYUjgfeg54WMmy
	 c8aiBKWY2t3vbzCrloLymCheyPpjCLVYUWgKXkJthJ5T2+4ofc92RGgscMG3jUrjbRtCn
	 kNeo+ohUSqH8yUoNjOyoSAb150zIi/4SEbKNmU4Abk0HUt/A/RO/6lbrjIUr05SgpmUca
	 I/rRXdC4otHwTpasbH46WvQvza6q3Zpajvi/9befuCrjbpjMYzOcsZrmBuVzo0SlJC4po
	 ZGiAelO/ey6Uji+7BQFZ5HmvskpA4jbkA/EfWk/VP7FA38I8GoQIXsVI7twYTOUmnuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbEptYk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF0606A326
	for <lkmm@lists.linux.dev>; Fri,  6 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbEptYk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1AF1F0089F
	for <lkmm@lists.linux.dev>; Fri,  6 Nov 2026 19:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994563;
	bh=YtvAeH1Lk9qY+OtdbuDry6Fob14KLlwIPC/5liN5daA=;
	h=Date:From:To:Subject:Reply-To;
	b=hbEptYk2yH4fzZ/KMnkjQrmPDEwfBpVgVqx8qSOxW2uB66MJR3WmGh/+3eGaoMi89
	 nyTihRzR2tQie/013tNyi0XjtK+n4LWejEC9kg+MZf++cXSYFa9fRsiNP6RjNNGKa0
	 Of/JTjEYU9V96nuNha6c/yigiWuo3vqVKzdAIhqlvvFpV9VHvsvNJFCk7PLgHHUTRw
	 n+8/K+a1dnrYc6XgoU8Q8qkwpTAFigyMluS/8YkU2T5chZRfsUdRknRfmoIutPhl/Q
	 FCBSD8Gia/HfQMunPh9+V9AehO3MbQO7B4F7OgFP9u2CNd+I9XVdR4n9jcMFwrgpKW
	 q4+4pltQ+UYiA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 120A0CE04B8; Fri,  6 Nov 2026 11:49:23 -0800 (PST)
Date: Fri, 6 Nov 2026 11:49:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: lkmm@lists.linux.dev
Subject: Fw: Re: Kernel formal methods mailing list?
Message-ID: <4c4ee760-0f17-46a6-8d9d-bbb619f4115b@paulmck-laptop>
Reply-To: paulmck@kernel.org
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

FYI, in case you would like to join an email list featuring more general
discussions of Linux-kernel use of formal methods.

							Thanx, Paul

----- Forwarded message from James Morris <jmorris@namei.org> -----

Date: Fri, 6 Nov 2026 11:20:09 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: Christian Brauner <brauner@kernel.org>, Julia Lawall
	<julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, gmonaco@redhat.com,
	ojeda@kernel.org, aliceryhl@google.com, gary@garyguo.net,
	namcao@linutronix.de, sashal@kernel.org,
	natalie.klaus@runtimeverification.com, willy@infradead.org,
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr,
	ejratl@gmail.com, corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?

>From Chris @ LF:

> Hi all,
>
> This list is now operational
>
> address: formal@lists.linux.dev
> archive: https://lore.kernel.org/formal/
>
> any issues or queries, please reach out to helpdesk@kernel.org
>
> Chris Hoy Poy
> Senior Systems Engineer
> Core Projects
> The Linux Foundation
> Perth, Western Australia (GMT:+8)


-- 
James Morris
<jmorris@namei.org>


----- End forwarded message -----
