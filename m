Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9137E1DDC08
	for <lkmm@lists.linux.dev>; Wed,  5 Nov 2025 03:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762312654; cv=none; b=kwkqNCSqaD0YTL1/SjlfdcStO6wwJ+wxibpVvVFMNiUWQ2k+AwothoY78y4jWRKJgptWbdelEpD9iuJHoN37+k8z11Iqk8ieElxQnYsp9ELNGO7Zt4D4hymgNFKkHuV7qQlSqcu1PrmyBje+cfxs9/oZ+oh9mj4xXg20su80f1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762312654; c=relaxed/simple;
	bh=IcK3JFRX+HXE6leL4dnbKK9tnNomtqjV08j1N260PjE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UT7ImSJ6OszAvfo+5tgf/kZWM1wo+jtaZKBSEvRVfj7AiBULmwEVe7qdnEq4dChBgWxHVc1QvF6ij16Oxx+BpjdeBv6CvtIgORlI8cxtNzKAedUEiVUjcTbRb5pU9uS2lJkEs1Cj7LqSCm1oB4YlmuHDstuIXhjcOTqGKY04FLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkDp0cur; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkDp0cur"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso848589a91.1
        for <lkmm@lists.linux.dev>; Tue, 04 Nov 2025 19:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762312651; x=1762917451; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Bm5ws78PQumnUKZDvRLbolqjLy45tI5RDSpPERcwn4=;
        b=SkDp0curY9e4ODuBb02gcEAoqvHhAktH1ZnYUk5ooGaM8+bUZX2/D0le6PnDYu1B8o
         Pr+0xjJ0avutoGrEXhlt9Zqn0IsQ545sJTREgHgB9IoJBUj7VZFzbQrWmBsn51fzEiPZ
         6A6QAfsWDOcxuXul4Ju01dn5/jA4v3yGaSlQ7hOCz+Wm/04/P3F4dvVzL/LF7e8r9YP6
         250WDTOUizfV5mbBl6dvcGTRJaOdyrrn8dlIIJkzLLd7zim4Xc4xLJ3OGSMUzMCH7t58
         +vFueTv5E1vpkVL+f2QLVZ7KlShEawsvChNmSO9B7+UPBPwuhuF/kwGV2oVc5A0NEAF0
         DB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762312651; x=1762917451;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Bm5ws78PQumnUKZDvRLbolqjLy45tI5RDSpPERcwn4=;
        b=wC1lEC3CTGwg4Cq/iZAVtT8t7Ke4N2L00pZ4jM95yFdzOobjlgwkOnctKbWZVu1+UC
         EhnETfdv6p+S765k3EnI7XQADjDSiHfncpUh4po5iEOsGifGKOqOR/du6d2+lr5fNREI
         vlbnCD5qW8CJaRX80CK4yz5CYhJxIoyuo3Oe5QlluiVYicsf4pd7H0BmVPYjQzHdrIph
         I/rMOkLxpesllR0y9KVW++McLpn6UL0+OPILwID9qr3888KSJIq71gnALTdcXhFsujG8
         O+6PuF86us/YvCt3BZgW0IwoO9ZXHJrTmBwohOy8Lusocoa739jQg+GvHr5Ib2lL/d3A
         VvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZjKX56zoMrgsSnFWXXHUa239Q6nmvNFkuuMQSmobRqLqwHKpxHDWDHavYjUoqZEyBAQpK@lists.linux.dev
X-Gm-Message-State: AOJu0YzBf6IZBgqjRBN4Ky8PSBOdokGu+XKG962cPTNJJNmNuxcnyN1B
	bYat1haEgUE8cwrtdeH0amVoCV0C0r3c6sc+J233RkV5Smg/a9yH4xdI
X-Gm-Gg: ASbGncsFlothL5hxczxbQx3uyfbzHxObsrNddg9yCavQBBU1f++oBnoSWcJ5wqqpyNq
	Gty+cPI9RwBFXaTsxusPcT4eW/BPj0NfJzeRjXbM4k6b3TXw6ORW/Ngvnci2i4UdjzmlFJIWq6w
	JERIllMuS79mI1oFJmv2oEQeKQoRPwecLjV58/0P8J/89w2e1XHAOb2ZhESN2Y4fHl3foCDd7uB
	TZqd2wy942b2L6A6/PNUKkpixgZ4gq1dDRBAcdJRWWcXEVRitMRqqFakK9aRHsLZZz/Zs/lgogW
	/w7cRw2cSKwjvU+FofreSwDom6ibTD2yLu4QCRixUhsPttTazP+uHN6YOdV5JUotDqS4kT4lUbX
	SBtiiqE2uSbr4FipdHxiz/QtIiz8jXApTkiW7HI0jyQ5DSMK42xuC1MHo8Wpbi1gQqSPvQeZ1t1
	EjAReWOy/AfI1CJqewMLmi4MDcqVBSh8/7/zQeXbZds/VqMA==
X-Google-Smtp-Source: AGHT+IHa8ka39I1hGvwxLHskM+0Yzo9UUTydXepxscwQ+Kx/ZQfsRFC4XBrgn6mPGflRv8VF0EK+LA==
X-Received: by 2002:a17:90b:3bcc:b0:336:bfce:3b48 with SMTP id 98e67ed59e1d1-341a6c4ce13mr1718242a91.9.1762312650722;
        Tue, 04 Nov 2025 19:17:30 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a7a62sm1133038a91.2.2025.11.04.19.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 19:17:30 -0800 (PST)
Message-ID: <d06d8be2-5661-4926-8734-d12c30c9e03c@gmail.com>
Date: Wed, 5 Nov 2025 12:17:28 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>, lkmm@lists.linux.dev
Cc: Akira Yokosawa <akiyks@gmail.com>, =?UTF-8?Q?H=C3=A5kon_Bugge?=
 <haakon.bugge@oracle.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memory-barriers.txt: Sort wait_event* and wait_on_bit* list
 alphabetically
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit 88172700423c ("docs/memory-barriers.txt: Add wait_event_cmd()
and wait_event_exclusive_cmd()") added two APIs without taking care
of the list order.  Sort the list for readability.

While there, make it clear that this is incomplete by saying
"for example".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Looks like there is no pending change for v6.19 in LKMM.

I think this minor tweak is worth having, if it is not too late.

        Thanks, Akira
--
 Documentation/memory-barriers.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index 1d164e005776..61b7317bcf2e 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -2182,9 +2182,11 @@ set_current_state() may be wrapped by:
 
 which therefore also imply a general memory barrier after setting the state.
 The whole sequence above is available in various canned forms, all of which
-interpolate the memory barrier in the right place:
+interpolate the memory barrier in the right place, for example:
 
 	wait_event();
+	wait_event_cmd();
+	wait_event_exclusive_cmd();
 	wait_event_interruptible();
 	wait_event_interruptible_exclusive();
 	wait_event_interruptible_timeout();
@@ -2192,8 +2194,6 @@ interpolate the memory barrier in the right place:
 	wait_event_timeout();
 	wait_on_bit();
 	wait_on_bit_lock();
-	wait_event_cmd();
-	wait_event_exclusive_cmd();
 
 
 Secondly, code that performs a wake up normally follows something like this:

base-commit: 4356abc63687c65a86ab709db96470540441e822
-- 
2.43.0

