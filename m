Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09961D5151
	for <lkmm@lists.linux.dev>; Fri, 30 Jan 2026 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748134; cv=pass; b=li7zeDOiNueI7hMFUzcfUtqMdWuFJ6D9flEFaRXNgCMHyOPc6ORhC/dKr18fX/VDhXILppFJqASq3FUZIaZbci7yXuHbDvnk0AzNSzJlHaF4p4+tLL/Pyn27klDbHMuizsUcrvwVuiuCsQPBE3YTJAsgQ6+rO/AdwVa910FJFsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748134; c=relaxed/simple;
	bh=9AtXd8g8cv324hiwUaOLJkTtg+EH4HxvCYA3UxkJaWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coq3vAMcC4KWwktPdfodrx/rKbtAwfbTCayYgWBI2aCoPXOFUcnwLatb6CmGRcOwvEcvPsofnaSy1tzT5XOBmauUjM6S7uAShJW3EjDTSapirWweNPHW1vYqain6nyUfo9sGnpA5xRPrKzRal5VSWkXy/CrX7JQmwaw/z2FaXJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYap894a; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYap894a"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233bc11279so5853c88.1
        for <lkmm@lists.linux.dev>; Thu, 29 Jan 2026 20:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748132; cv=none;
        d=google.com; s=arc-20240605;
        b=RETCa1R5q5obV13iRyk70OvT9GmjhP+1QgKDrunJCNA+mwhXHHjWsblgXknL50WsY5
         vMmjgD3+LEvXtcoDzVKs9bgjq2o5q9+dDqv+3RxmXrymEh/iNp7x/QeAcGViAlSQr1ot
         9tk0waQ2met6YkmRfPq7xEVea+ROooYp+OVTvALWgHriIa0xwT1WPKnSzjyZRwgF7GUy
         VCheMWMJNULz0zjeX/BiomsUi/MCan9UBTCWZQyd8Btk+dJRptK2OQZ7N+S4qKlrYbWP
         6o3amayJ35FxDWsjP7AsnP/gncnhfVewAvJZwNoBhDfgOix9tw3YD11TTzkl8MyOl0iV
         u/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        fh=dfhrVE/NOqcnRshhnFUszEhw/qFGKZmApeQovz0QGNA=;
        b=O06DhKyxCMSzmFbNV+tF67rIEaYEU4De+wT6RDYHtzYfHUK8UB16cqGXePjC8TabDl
         90cZpjORmSzz1TVbmbRF67yDmdoYVdhMF2xtdg0f4KYRxoUAi5gwldNv5SWcodNk/sEg
         g3Cq6CSvKNoeTLNKhfla+w5pntaD/E5L4+2VOood0tBZwGBBG1WC5UmvrJ/6Z8WWecaB
         gFqwoK2UxXvg76bm1EqzhdzpsfVPJcjyAuvcwuNEDe6/OWfpjqNAAPbHLknv1uuIf9e5
         p7bhDYHRBg7NPn0+50AoxPXslQWFqsZbANt1VLH6FGN/05ONQLAnhbUVIKTg3pIeaMGo
         aaCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748132; x=1770352932; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        b=UYap894aSGIVC/3EsKWahZEfvwa2WR5neowKVw8hfJqYUIYNaH5igCshonisZwhKyt
         /6v+DplJSYl/5n2vmt37jCzZJ3ZQE/8zV2ry2GIV07wsSj4/4Ir01ClRgO7eGceIdsYe
         BkPN8CmcVRSsnM4sX4fPHO0jUvL+yaFgMuaMaVosNQ1zzwLD0PJCDvROupeenciu/bLd
         mW9xAis35PDk0wT8cdv6LOQB9w3ODg+Bsaxy8kNcB0cikCz0hlaiuKBCA1rI9SGq8SDj
         8cy6WBM/VyqM9UgbdseE2MQ3Gs1CQFu0y0wtmZhpUyfPiAled7nmekgHD/HUz5wbr1Tc
         lEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748132; x=1770352932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRhqTEHqwyvVmwdWFyLPo5xELcEwDSdFsxzHqxGTMCs=;
        b=Bvuay+jXuC+iqtpG56Z9leSIuawjAyeZGnMt6iLimiwFqApJAavpXwrbQ5Y/Izo8s+
         hIwl9J+KMczCAt0wJoe7rgt06LAyh/5iQSj7zRiWOSXPBxtkyhmJd4ThFX5Ex73L7Ui4
         eXnqJZWpoF/H620QoByq0obaarbmQs1kz14lo8H7fYaGy7qG6nR4IiBcZyP3Fs9bDzIH
         GIuSqdTrcn7v/d3tsc06h/fnVF1wzCwnW1QTUCfOzZf1sizRNLnACgYu01YljVz5nxTm
         AUXEeM0SXWhnVdqqybTICSYVC0eNwJxjDX8ZjM+DbT+UBs5lejjVdL+Rwlh7WkpEbnCd
         Ho0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiC8nAWkwzJjyq8uvnLbv1SzIY5xYijF5KVoDcn5kXxB6k5mnH/ZlIN6+DHw/zTRhuma5B@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdp6h+Y3D3vItCYUkBHtX5dHyJhbaG+6XJJsyASZzrLIcz5N5g
	/FiSlWn1gpEtHsJaMskrqeqeaiMUtJvDEr7dJzm0z4s5LhaRYMMOOUWeZI6JqrY+n7iJSjaZVYO
	LkW64E/Ev5iq9MqW2R2/5AlMqpEKFRpY=
X-Gm-Gg: AZuq6aKySQUBFzAhxwbMDaZwf9Ip6vbVCfPTwX3uL1ivF5zWUlw0EwUGdxQEixZ+0u+
	twAvLnA1zQhUMqiIF3C/mDZy0yYw8V964rgwErV6POMQu4iLY0+VBOQkQjnlKWb2BQUTnoOGFCV
	yufWaFiA2QHVnHyUkObh0rQSfT2xcA10LO6Pk6GZqFg4M6c6xjCvnl9Hy6ChxfDfvZrn2Cju+WN
	L0Q6bfAGUE3vL4HEkJE/CQUpZz4vJunqHmBHTFEG9Cjn3ssdbyVHPGiKfcC++P2gGSCmo2lJ0qG
	5jBvpWa9MBKg7T2JFm8ESSZJj6qWxXHK4wJx8qlO61XoMJH/QaDAHKaFs42eRwzYt3oKtCrpB1L
	Q51qUuEDWZ4ye
X-Received: by 2002:a05:7022:906:b0:11e:3e9:3e9c with SMTP id
 a92af1059eb24-125c1018f83mr463923c88.7.1769748131683; Thu, 29 Jan 2026
 20:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129004520.62697-1-boqun@kernel.org>
In-Reply-To: <20260129004520.62697-1-boqun@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:41:57 +0100
X-Gm-Features: AZwV_QgKWHn9P9hd8qHR3QNl6yV8Hn92j4G2YSbbe9naoXr792u2X3ZGzLx2RN0
Message-ID: <CANiq72=MkDXW-qa9sqGnAbFyz9V74QCkBch1fodAY43_Zkvr+w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update my email address to @kernel.org
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, lkmm@lists.linux.dev, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 1:45=E2=80=AFAM Boqun Feng <boqun@kernel.org> wrote=
:
>
> I had issues using my gmail account multiple times this week, hence
> switch to @kernel.org.

Applied to `rust-next` -- thanks everyone!

    [ Sorted alphabetically in mailmap. Removed Cc tag list. - Miguel ]

Cheers,
Miguel
