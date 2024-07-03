Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED517C7C
	for <lkmm@lists.linux.dev>; Wed,  3 Jul 2024 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023990; cv=none; b=oAVrxmxCPRQ+7XlDlCSIPc99abnJvR8Tj1ROvwDRiOrxqAQUOSLs7R3XBNOI3VaDhseXvurM4tWMGFK2e5X2wENPIhVsT0hcPtQXSbwwSGvhPfMM4SxrIOwzaFzMNrRbMaLiuycrt2ARlNfS3OFrAzn01B7VNXt9/7zccav9dto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023990; c=relaxed/simple;
	bh=Uk8SKD6gxWX0gT+33jY2Nt6NqxCDIB3Pn7INT3sy8k4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aZwDQSoUS+Vw9aKhnSEydyg9iOOpj6L0pSEzdv3EBt1gU3pJmJo2TtqvVJ68Pa+mCzJrcc8DMaXrapiAztyyJS8GtHRN3Qyx7BgBLnr7vYNW7N+DVB6VCTDWWB5zSw4TLWtiZ+EuSxvFAd8HV1f8+dQEgK/HCfaVpBIGLtOP2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1+WB+hI; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1+WB+hI"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3cabac56b38so3426169b6e.3
        for <lkmm@lists.linux.dev>; Wed, 03 Jul 2024 09:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023987; x=1720628787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f3L4z7hSroOuwsuipXwj/IN76KXKnPgl4yK5C8eJ7Ok=;
        b=F1+WB+hICYiJ8iPHVGdojLt0gFbkfSTUtUMBhI6dnv8vI9XvGLF0LbHHqCTzMgF1GT
         TsZNtyn3EGs2wgM69QNslHwrXEo8Zw/+InvP1yGZHZnBuX0pRTCNvAuMeGIjQ/5uON0c
         i7bzDMfXcxm7NQVzSap9tsGArNf3B3wRQaIk67wURKLPyzO9n3W1Z1FWfG+xGaCn1FSL
         XMyAW70Hv46fhLRos1kIwfKntgnzmN8+xJx5MhCVMmz04aLJsDdh2ijUaIQrmUdI301W
         HJT/5LRLHaLG5A+JIZUKjsPAwQ3wU32R4g/0UteKH5UsMeP6m197BkjSr/FrSIkj9jpi
         efDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023987; x=1720628787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3L4z7hSroOuwsuipXwj/IN76KXKnPgl4yK5C8eJ7Ok=;
        b=cx33QAwwUwn3b4YoxXShpfrdYmA0FYsq69TqbvpEORs3zjSmOFOn29eV9L3XXR/qRq
         JH9dXi6urQt17g9rlklLvuxDH7hh8W1yqbauBSUVk1Iul0q5346gZ5uh3zd6g25UbGgz
         UAzkdPdKGp59BAVl6DxxuZ4JdBi+VyW7nmoFvYfMe79ymkEcHmFbjq22YKHANPdYqfOI
         044mSKEKrFIFk4wdjsdg4VXtTmdR2gfaEDb/gGThGjB9VYSpkiyCdufj6M2OWraYJgNK
         ksUMY5be2LIt2mSWPhwmH8bps07ZWbsk8gNF5Viax4SzZUmWyhPyeZB9hxp0bbSTmF3Y
         oiYw==
X-Forwarded-Encrypted: i=1; AJvYcCXg8BJ1735xUQparXWP55mN8P+zp3RTvB4lEtIGZoVtFf0/11r4ygUsXuL836KNRBEOfCDIUK+AhwTDuouUhsa4yB0gVw==
X-Gm-Message-State: AOJu0Yxn/6ykhorlYqTmGyrlHBbuSe54RW0tWvoujEdNPtlSYaXCEY+8
	qD8uNLSWfYFqx4G2F7RQ3Iyj0NHTFBeeZXew5JRTXhgao5nfQJ3i
X-Google-Smtp-Source: AGHT+IEyVyUiYLLSoPl2liXg/YKC21xisWvxAX/7YL0rN+iIfSsx5LzU/hQHjBPpSvLWLIFXEE4mEQ==
X-Received: by 2002:a05:6808:bd5:b0:3d5:6413:2138 with SMTP id 5614622812f47-3d6b2d189afmr15501833b6e.12.1720023986849;
        Wed, 03 Jul 2024 09:26:26 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b5df21b3cdsm9456786d6.113.2024.07.03.09.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:26:26 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 9674F1200068;
	Wed,  3 Jul 2024 12:26:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 03 Jul 2024 12:26:25 -0400
X-ME-Sender: <xms:sXuFZl2oKkz-zL6Ff7EvTfz2YDiqa29wEVmyslPRc_caHM_uqWGdpQ>
    <xme:sXuFZsFZH-Xhlfgt17QEYCsTEub_LCrSKNxzKqSFZVwVd6FhxSn_khEY-h7KIoYIU
    9HyNjvSTadnrUuzAA>
X-ME-Received: <xmr:sXuFZl71SMwi_Q_mo39A6gFtUXidUC1RFzFx1E5JIKp7dIttb-4DPIIl_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieev
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:sXuFZi1ZDoNFjIUOhyABWuvJsFbPxrDLJAeUw9dx_c3dQ3cCvTH0Eg>
    <xmx:sXuFZoEq-ih8SkLyfJWOWivzU7-hDlU4REhE2mxbjGdcEMscrV5Keg>
    <xmx:sXuFZj-bhsLF9QFw537JwzotNRaLSjb62ObxpjLfX25fz7hzHX7AvA>
    <xmx:sXuFZllFfPXhIip0CG5K1qEr2E0SCqj2YsE6z6u6UYFnwXh0LVOPaA>
    <xmx:sXuFZsFJ9FAZ152dnxITOtxpnhoqE0G5i3HlzeLHGkw0uaTWa1D0Qgu_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 12:26:25 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,	Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,	linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,	rust-for-linux@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Hernan Ponce de Leon <hernan.poncedeleon@huaweicloud.com>,
	Puranjay Mohan <puranjay@kernel.org>
Subject: [PATCH] MAINTAINERS: Add the dedicated maillist info for LKMM
Date: Wed,  3 Jul 2024 09:26:16 -0700
Message-Id: <20240703162616.78278-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A dedicated mail list is created for Linux kernel memory model
discussion, and this could help more people to track down memory model
related discussion, since oftentimes memory model discussions would
involve a broader audience. Hence add the list information into the
maintainers entry of LKMM.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f2047082073..a77bd8a49cd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12796,6 +12796,7 @@ R:	Daniel Lustig <dlustig@nvidia.com>
 R:	Joel Fernandes <joel@joelfernandes.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-arch@vger.kernel.org
+L:	lkmm@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
 F:	Documentation/atomic_bitops.txt
-- 
2.39.3 (Apple Git-146)

