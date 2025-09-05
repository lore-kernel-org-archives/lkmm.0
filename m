Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D146299944
	for <lkmm@lists.linux.dev>; Fri,  5 Sep 2025 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047339; cv=none; b=uNmT9DG1XDlvK8MRZlvNi+ooywETOeC7v8FXi9OYv32keTK7yCo4XeK5Mv2Ay+IQ4w7ABK3EDdEXM0XcfaejLaU1CBDjmqyOBjMChSwjakCTD/iWuNnCsGbiR7xdZD6c87NzoNfWPGkCBazx6i6H+NWedyBt63YTkGNoqmhJ0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047339; c=relaxed/simple;
	bh=haoC4Iq605Rnw34oLAGAMEMRUfKlboNcZlioATaXcGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEQ1IfD18lipXqmcXPc0jt87Wba6HJtQpwOzT1cnFlbFnh7L7LlyQ8YiLtyhhB4236gN7hsw9HSBsDXQirSsx8I2bNBJ2FIEoJLL3OON89mqewuqw/aY4EGAPHWLBJDyPkZMQW/J+f9SIKQWZmW8sRuwNK6giLNPUWqCq2h4Um8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYZ4nHZm; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYZ4nHZm"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b30d09da3aso20520551cf.3
        for <lkmm@lists.linux.dev>; Thu, 04 Sep 2025 21:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757047337; x=1757652137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FKmc3OiqoUCIGRN7E+h6XFxZ5GqGhS2cMHJIUmthqoE=;
        b=nYZ4nHZmW+NLFzKJMGokOiW+XAXAGt+BJCBDcOyyUzS7iRViEZJhc9cf4Dpt1fq0EV
         3G6nImxY+2/OmaJ5gf1vR0+L5E5xPsI3Sx/j5FBDmjU/Y0SERQBJtQfqKflu+wA8HBrV
         7t0A4AUGIW3aFFiNSXEVzlazkGqN4qjNaZ19Tlut3V6+wPqviRDLrUygQEZYYTACPjpr
         EqSp7q8GuUQQjepu6ESeh1tQG+x/CIa1fb1l88t+yUQJOgwAOQ+zHSv9eziLC7APa+xq
         twTES2fgMC/Ahvk6/MxFfZSD0fe4wNuuecJ31vJESv9Uzo4tNWGCPI8KkNNZgabv6YZe
         RtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757047337; x=1757652137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKmc3OiqoUCIGRN7E+h6XFxZ5GqGhS2cMHJIUmthqoE=;
        b=IQtJxCGfbK+0hnxXPUPHfw/R+nH7MQHeaSEF10g4YTEMXd8qPs3uVISrVqzBU3CXCZ
         2ohy4MsMxtTmKr6p5bHUztFBZFx8cw3MSpEPsyjTIkRrseonO6AntZangICQa4Yziygt
         y4lK5wLVjtuHSiMdW3HRjFzUEfp+8ar7hStLpAaY8Xp9K9rP+O558hxrZ+/RCZ96cPd9
         vMKSQ2TfyGgBLzt1S5vbLQzRIMv5tABkeP3yPs/oP2fj1QpGuJjsvCSvMddRRCieTq/O
         qKhdSrGQ0vShP4MhlIAL0WzgnxjacM1o8Gpawi45pCg485ks44D9zuJCixm/vISEedgf
         o9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX2y/1BsXz83U4Uuifoh9gNzigZ6PF+G0ZWGjBN10w96Xxsbe4bTBDeUqs85kd4kdl/4+i@lists.linux.dev
X-Gm-Message-State: AOJu0YysoXpz8PYAnzWoRWSQExg0SMmGfAdjxwL1Af5irrgU3DpJ1Pwh
	5/DBgxpW9S/DHTCtpQbqCRtnzEeAdTvX24aNu+I00w7rKmVRsUZ30SH/
X-Gm-Gg: ASbGncuImpQ8FUEwcvyGl3rPrGC07rF2SW1zxDJk9m7pMdOpMcTvrejQbOg+Pe5qKJn
	QiezpfEzQ0iYWkss/Ix16VePUHMWJ587ZSx+2QDsP2gauBfHb4dvovF/A7WIarmOCZbhccOkzqb
	Syr73tgZ+M6JsR04eVeU6yi6oLxYTbZEKLJS44JrLM0VG3zkRsjcPDnvrJeHLnePMpM+DQFRRLW
	sltS92unVDRLuU/yuMKfdbHD/bPDq70wj1i1Rea0IdwXHwU/s6Puyb6b5BgyNSVl4znvQpQQIVR
	F6JVg8c/rlvbLEIX1FNLn/YwVGXXiomW6pvx4q0M0I0vTWhR5x3k570ZONNXkSKpbuKzopwi5v1
	8QeCLkiRhPEfC6jQvU6Gl4dEWEe7V28FTazqoUu+Rd/M+fLnn2xjZL0TXlpsc8idB8M04mtnKSs
	yjnUJ/qUZ2/5s6PjT1gRczaHm18bYEeMU+2UowmkpxkjWT
X-Google-Smtp-Source: AGHT+IGrYb1U1PAKjzxlTYJ0D6BmDQ/4FzlKGlepVNh4VkMmJpfwfiq0jfQOV/6ptsw1/56zXKajKQ==
X-Received: by 2002:a05:622a:15c8:b0:4b0:6205:d22b with SMTP id d75a77b69052e-4b31db6a3fbmr290693791cf.52.1757047336847;
        Thu, 04 Sep 2025 21:42:16 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f7838edsm39622771cf.39.2025.09.04.21.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 21:42:16 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C7A46F40066;
	Fri,  5 Sep 2025 00:42:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 05 Sep 2025 00:42:15 -0400
X-ME-Sender: <xms:J2q6aIAiCx9mpiYFx93xX7ydaaKfSPcj1LfSExGNG-kRWRTtaWG1ZA>
    <xme:J2q6aIOX0A-ry71GQjwfyJigy3qqdN1AIn_vQFHzOkR-h-jEcWSqiPMf4oV5ZbVub
    9NZZDxDXTSnv9SQEA>
X-ME-Received: <xmr:J2q6aNUeJ75ZQpxA5_EKnbE3JJiG3NWzeJ9yXbCL3a1xH_aHgJS4haO6RRqP7Rb5Q9fYAXM33z16W0qCiOrWoOBILrx9yhWH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefghfffvefhhfdvgfejgfekvdelgfekgeevueehlefhiedvgeffjefgteeugfehieen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgepvdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedv
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkmhhmsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
    dprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:J2q6aLQ3I7qGWGd0s8MnhDYWgovEQmbE_YAo-soEeqEa5UjzJmwbWQ>
    <xmx:J2q6aD0GVheIQSyX8ej204tsknqPrsdCWKY-iBR6TqNwlfDvag8cLw>
    <xmx:J2q6aIiXQemlz9MW7KWEE1vifjAcpt1iCmKwoUVjawA8VDMLZg9e1g>
    <xmx:J2q6aBZpgKo-ZZmaosp4hJP89yBr0vxRjx6MnMQfRq2LhiRXkw0P8w>
    <xmx:J2q6aBOQGGoaie_A3vaEEU60On6stRjiQL9amni_J9zH0tNFC1U34ju_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 00:42:14 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: "Will Deacon" <will@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Ingo Molnar" <mingo@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	stern@rowland.harvard.edu,
	"Miguel Ojeda" <ojeda@kernel.org>,
	alex.gaynor@gmail.com,
	"Gary Guo" <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 14/14] MAINTAINERS: update atomic infrastructure entry to include Rust
Date: Thu,  4 Sep 2025 21:41:41 -0700
Message-ID: <20250905044141.77868-15-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905044141.77868-1-boqun.feng@gmail.com>
References: <20250905044141.77868-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

I would like to help review atomic related patches, especially Rust
related ones, hence add myself as an reviewer.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250723233312.3304339-6-gary@kernel.org
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37a753ec2aca..65499b9303e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3991,6 +3991,7 @@ M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Boqun Feng <boqun.feng@gmail.com>
 R:	Mark Rutland <mark.rutland@arm.com>
+R:	Gary Guo <gary@garyguo.net>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/atomic_*.txt
@@ -4000,6 +4001,7 @@ F:	include/linux/refcount.h
 F:	scripts/atomic/
 F:	rust/kernel/sync/atomic.rs
 F:	rust/kernel/sync/atomic/
+F:	rust/kernel/sync/refcount.rs
 
 ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
 M:	Bradley Grove <linuxdrivers@attotech.com>
-- 
2.51.0

