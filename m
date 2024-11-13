Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABB13D2B2
	for <lkmm@lists.linux.dev>; Wed, 13 Nov 2024 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731525949; cv=none; b=TPQQUyi+LI2DOBTWOrpps1MN3vrrI71CfnV1a2iGg6crWhzOnnVReWUackkrEm43HSDMge6bjPM8bmXFWPvdvXv8CBqZuLreopgnfufEwSURboQeKE27XcBDoqkIw1IaltTfGZLWIhf8FAWZkZKNEbJeQwXTJQVrPLK86AUNhqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731525949; c=relaxed/simple;
	bh=zCS2ZMeF1HWgEUFZZMCDIzPVdagt9/38VUpfLXW8SoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RF/q4hg7Vn4DRUW3KBEX3w13jBIXwIb3qS2UsrIn+eQHRrTKlU3qe+TUGQN2aXdXOlOAtQF2aeboEDjulkyS5xo4PNZcye1cUG8QK4YyBfbDZfpqN53QPMrK0/0lLzuaoMnj/sS3ib4ae4RALUK7ZO4lHMBk1PUwywxM/6HBits=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNaTp69q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNaTp69q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d51055097so4438700f8f.3
        for <lkmm@lists.linux.dev>; Wed, 13 Nov 2024 11:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731525946; x=1732130746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79OHR5n3SZfsy5UFp+Gd64dReeEkaxfwRsIGDJcWEIM=;
        b=CNaTp69qea3dPz+5lw8imoZdWWTvE97TOeWVIRNSTOWZUxBl9e+NJnnUQvrYFZD959
         5omnDFVRF87NJ8wh8BI5Bwf3ANSDAnCiqeOXvNw8LQ39oYZO/FOK6gqvwzzeCX7MfFWc
         rjDtAgU2wmz0ATpgO9YDUdCXCNqF9N1Rc6eBKU3kFXt/Up6DKeIw47YsqLk6yhnN4+5V
         CJ1/W9HhSuHo8kK9s+E/pHCXUaajym0nF8NzrDpC3Mc3P3wZSgHD8AIz+RIPx37wAyJO
         sGeB7HiYfndkTih0IziKVnv5bFoHgMGXX0UHZD0zhZdkijv+ZXLqVM80J01eesOV9u9O
         ffXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731525946; x=1732130746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79OHR5n3SZfsy5UFp+Gd64dReeEkaxfwRsIGDJcWEIM=;
        b=oAGWHWO57vCoWch/BzThkMDv0AQLzlPgaoTUXzh7r0PSxpfkJ1pOE9N1TN6ZgU79WG
         nBZWSx0GOIIgfaaK+YBGe99IRe4GglfxBo5hZ1Vibnz8ezFIaSRS0Mjk17aR2I4ioIc3
         AcOAOJUl4OWDZWNF1v8NMWhU+TD2/zpaEfwnfqm3bSHFirtG3yLNdLBCyAL4yFd4YLMh
         sPNyZ+Zvy5Swsn0VGeuuoZCpfCgc292UGXENhaZlV48eUKekB2JrKOizIZ3s/+reOLKj
         a9NpY4jsi+WREnu6S8F1wcopNXlBrGwZv0aC6sA9IU38ozeHioe2zbA5aDoJdvmX3Csu
         WEvg==
X-Forwarded-Encrypted: i=1; AJvYcCUofEQYGXpHnuPAmthMk3B3toGNZvvTf7slNpAdbHvB9afFnn+1SyO2o6MglwDDsGWsQFQf@lists.linux.dev
X-Gm-Message-State: AOJu0YwdTjPyhW9EuMpT187OqhfFqVfJbPo+YJeYE/ClyYsHBAJhgBIC
	O50ff8bmROYgUdTEdQelfGN4XT4nZV6wqsOskEGvwlNkON3PC5Mb
X-Google-Smtp-Source: AGHT+IF7ACglfWHGWFwbQVHXMJUGCirizqztc7cFoX8b+KbBQgoDDCwSe1NYV8vTrgQZPQaKrxmomg==
X-Received: by 2002:a05:6000:1a88:b0:37c:d54e:81fd with SMTP id ffacd0b85a97d-381f1885eaemr16894820f8f.54.1731525945757;
        Wed, 13 Nov 2024 11:25:45 -0800 (PST)
Received: from andrea ([149.62.244.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05ce0sm18811627f8f.103.2024.11.13.11.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:25:45 -0800 (PST)
Date: Wed, 13 Nov 2024 21:25:41 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: puranjay@kernel.org, bpf@vger.kernel.org, lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: Some observations (results) on BPF acquire and release
Message-ID: <ZzT9NR7mlSZQHzpD@andrea>
References: <Zxk2wNs4sxEIg-4d@andrea>
 <13f60db0-b334-4638-a768-d828ecf7c8d0@paulmck-laptop>
 <Zxor8xosL-XSxnwr@andrea>
 <ZxujgUwRWLCp6kxF@andrea>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxujgUwRWLCp6kxF@andrea>

[...]

> I guess the next question (once clarified the intentions for the R
> and Z6.3 tests seen earlier) is "Does BPF really care about 2+2W
> and B-cumulativity for store-release?"; I mentioned some tradeoff,
> but in the end this is a call for the BPF community.

Interpreting the radio silence as an unanimous "No, it doesn't", please find
tentative fixes/patch (on top of the bpf_acquire_release branch cited in an
earlier post) at the bottom of this email.

While testing the changes in question, I noticed an (unrelated) omission in
the current PPO relation; the second patch below addresses that.

Both patches were tested using the "BPF catalogue" available in the tree at
stake: as expected, the only differences in outcomes were for the new/added
five tests.

Please use and integrate according to your preference, any feedback welcome.

  Andrea


From 5bf399413578b6a94c42f6367245be2bdbf58926 Mon Sep 17 00:00:00 2001
From: Andrea Parri <parri.andrea@gmail.com>
Date: Mon, 11 Nov 2024 08:38:42 +0200
Subject: [PATCH 1/2] BPF: Fix propagation ordering, after LKMM

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 catalogue/bpf/tests/2+2W+release+fence.litmus | 15 ++++++++++++
 .../tests/ISA2+release+acquire+acquire.litmus | 15 ++++++++++++
 catalogue/bpf/tests/R+release+fence.litmus    | 14 +++++++++++
 .../bpf/tests/Z6.3+fence+fence+acquire.litmus | 16 +++++++++++++
 herd/libdir/bpf.cat                           | 24 +++++++++----------
 5 files changed, 72 insertions(+), 12 deletions(-)
 create mode 100644 catalogue/bpf/tests/2+2W+release+fence.litmus
 create mode 100644 catalogue/bpf/tests/ISA2+release+acquire+acquire.litmus
 create mode 100644 catalogue/bpf/tests/R+release+fence.litmus
 create mode 100644 catalogue/bpf/tests/Z6.3+fence+fence+acquire.litmus

diff --git a/catalogue/bpf/tests/2+2W+release+fence.litmus b/catalogue/bpf/tests/2+2W+release+fence.litmus
new file mode 100644
index 0000000000000..0f88babbf27de
--- /dev/null
+++ b/catalogue/bpf/tests/2+2W+release+fence.litmus
@@ -0,0 +1,15 @@
+BPF 2+2W+release+fence
+(*
+ * Result: Sometimes
+ *)
+{
+ 0:r2=x; 0:r4=y;
+ 1:r2=y; 1:r4=x; 1:r6=l;
+}
+ P0                                 | P1                                         ;
+ r1 = 1                             | r1 = 1                                     ;
+ *(u32 *)(r2 + 0) = r1              | *(u32 *)(r2 + 0) = r1                      ;
+ r3 = 2                             | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) ;
+ store_release((u32 *)(r4 + 0), r3) | r3 = 2                                     ;
+                                    | *(u32 *)(r4 + 0) = r3                      ;
+exists ([x]=1 /\ [y]=1)
diff --git a/catalogue/bpf/tests/ISA2+release+acquire+acquire.litmus b/catalogue/bpf/tests/ISA2+release+acquire+acquire.litmus
new file mode 100644
index 0000000000000..44c1308d70b5a
--- /dev/null
+++ b/catalogue/bpf/tests/ISA2+release+acquire+acquire.litmus
@@ -0,0 +1,15 @@
+BPF ISA2+release+acquire+acquire
+(*
+ * Result: Sometimes
+ *)
+{
+ 0:r2=x; 0:r4=y;
+ 1:r2=y; 1:r4=z;
+ 2:r2=z; 2:r4=x;
+}
+ P0                                 | P1                                 | P2                                 ;
+ r1 = 1                             | r1 = load_acquire((u32 *)(r2 + 0)) | r1 = load_acquire((u32 *)(r2 + 0)) ;
+ *(u32 *)(r2 + 0) = r1              | r3 = 1                             | r3 = *(u32 *)(r4 + 0)              ;
+ r3 = 1                             | *(u32 *)(r4 + 0) = r3              |                                    ;
+ store_release((u32 *)(r4 + 0), r3) |                                    |                                    ;
+exists (1:r1=1 /\ 2:r1=1 /\ 2:r3=0)
diff --git a/catalogue/bpf/tests/R+release+fence.litmus b/catalogue/bpf/tests/R+release+fence.litmus
new file mode 100644
index 0000000000000..a0bcbe0bbb804
--- /dev/null
+++ b/catalogue/bpf/tests/R+release+fence.litmus
@@ -0,0 +1,14 @@
+BPF R+release+fence
+(*
+ * Result: Sometimes
+ *)
+{
+ 0:r2=x; 0:r4=y;
+ 1:r2=y; 1:r4=x; 1:r6=l;
+}
+ P0                                 | P1                                         ;
+ r1 = 1                             | r1 = 2                                     ;
+ *(u32 *)(r2 + 0) = r1              | *(u32 *)(r2 + 0) = r1                      ;
+ r3 = 1                             | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) ;
+ store_release((u32 *)(r4 + 0), r3) | r3 = *(u32 *)(r4 + 0)                      ;
+exists ([y]=2 /\ 1:r3=0)
diff --git a/catalogue/bpf/tests/Z6.3+fence+fence+acquire.litmus b/catalogue/bpf/tests/Z6.3+fence+fence+acquire.litmus
new file mode 100644
index 0000000000000..67e9146bcef2b
--- /dev/null
+++ b/catalogue/bpf/tests/Z6.3+fence+fence+acquire.litmus
@@ -0,0 +1,16 @@
+BPF Z6.3+fence+fence+acquire
+(*
+ * Result: Never
+ *)
+{
+ 0:r2=x; 0:r4=y; 0:r6=l;
+ 1:r2=y; 1:r4=z; 1:r6=m;
+ 2:r2=z; 2:r4=x;
+}
+ P0                                         | P1                                         | P2                                 ;
+ r1 = 1                                     | r1 = 2                                     | r1 = load_acquire((u32 *)(r2 + 0)) ;
+ *(u32 *)(r2 + 0) = r1                      | *(u32 *)(r2 + 0) = r1                      | r3 = *(u32 *)(r4 + 0)              ;
+ r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) | r5 = atomic_fetch_add((u32 *)(r6 + 0), r5) |                                    ;
+ r3 = 1                                     | r3 = 1                                     |                                    ;
+ *(u32 *)(r4 + 0) = r3                      | *(u32 *)(r4 + 0) = r3                      |                                    ;
+exists ([y]=2 /\ 2:r1=1 /\ 2:r3=0)
diff --git a/herd/libdir/bpf.cat b/herd/libdir/bpf.cat
index 28b42497ea0fc..7803a1e818de7 100644
--- a/herd/libdir/bpf.cat
+++ b/herd/libdir/bpf.cat
@@ -43,9 +43,9 @@ show addr_dep as addr
 show data_dep as data
 show ctrl_dep as ctrl
 
-(*************)
-(* ppo rules *)
-(*************)
+(**********************)
+(* ppo and prop rules *)
+(**********************)
 
 let ppo =
 (* Explicit synchronization *)
@@ -65,6 +65,10 @@ include "cos-opt.cat"
 
 let com = co | rf | fr
 
+(* Propagation ordering from SC and release operations *)
+let A-cumul = rfe? ; (po_amo_fetch | store_release)
+let prop = (coe | fre)? ; A-cumul* ; rfe?
+
 (**********)
 (* Axioms *)
 (**********)
@@ -72,17 +76,13 @@ let com = co | rf | fr
 (* Sc per location *)
 acyclic com | po-loc as Coherence
 
-(* No thin air *)
-let hb = (ppo | rfe)+
-acyclic hb
+(* No-Thin-Air and Observation *)
+let hb = ppo | rfe | ((prop \ id) & int)
+acyclic hb as Happens-before
 
 (* Propagation *)
-let A-cumul = rfe;po_amo_fetch | rfe;store_release | po_amo_fetch;fre
-let prop = (store_release | po_amo_fetch | A-cumul);hb*
-acyclic prop | co
-
-(* Observation *)
-irreflexive fre;prop
+let pb = prop ; po_amo_fetch ; hb*
+acyclic pb as Propagation
 
 (* Atomicity *)
 empty rmw & (fre;coe) as Atomic
-- 
2.43.0


From 84520eaacbcb399b5cc7b4cbe0f716ad84e87824 Mon Sep 17 00:00:00 2001
From: Andrea Parri <parri.andrea@gmail.com>
Date: Mon, 11 Nov 2024 08:03:48 +0200
Subject: [PATCH 2/2] BPF: Fix overlapping-address ordering

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 catalogue/bpf/tests/LB+release-oa+acquire.litmus | 15 +++++++++++++++
 herd/libdir/bpf.cat                              | 13 ++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 catalogue/bpf/tests/LB+release-oa+acquire.litmus

diff --git a/catalogue/bpf/tests/LB+release-oa+acquire.litmus b/catalogue/bpf/tests/LB+release-oa+acquire.litmus
new file mode 100644
index 0000000000000..1544179357e9b
--- /dev/null
+++ b/catalogue/bpf/tests/LB+release-oa+acquire.litmus
@@ -0,0 +1,15 @@
+BPF LB+release-oa+acquire
+(*
+ * Result: Never
+ *)
+{
+ 0:r2=x; 0:r4=y;
+ 1:r2=y; 1:r4=x;
+}
+ P0                                 | P1                                 ;
+ r1 = *(u32 *)(r2 + 0)              | r1 = load_acquire((u32 *)(r2 + 0)) ;
+ r3 = 1                             | r3 = 1                             ;
+ store_release((u32 *)(r4 + 0), r3) | *(u32 *)(r4 + 0) = r3              ;
+ r5 = 2                             |                                    ;
+ *(u32 *)(r4 + 0) = r5              |                                    ;
+exists (0:r1=1 /\ 1:r1=2)
diff --git a/herd/libdir/bpf.cat b/herd/libdir/bpf.cat
index 7803a1e818de7..4917d0f77009f 100644
--- a/herd/libdir/bpf.cat
+++ b/herd/libdir/bpf.cat
@@ -47,6 +47,10 @@ show ctrl_dep as ctrl
 (* ppo and prop rules *)
 (**********************)
 
+(* Compute coherence relation *)
+include "cos-opt.cat"
+let com = co | rf | fr
+
 let ppo =
 (* Explicit synchronization *)
  po_amo_fetch | rcpc
@@ -57,13 +61,8 @@ let ppo =
 (* Pipeline Dependencies *)
 | [M];(addr|data);[W];rfi;[R]
 | [M];addr;[M];po;[W]
-(* Successful cmpxchg R -(M)> W *)
-| rmw
-
-(* Compute coherence relation *)
-include "cos-opt.cat"
-
-let com = co | rf | fr
+(* Overlapping-address ordering *)
+| (coi | fri)
 
 (* Propagation ordering from SC and release operations *)
 let A-cumul = rfe? ; (po_amo_fetch | store_release)
-- 
2.43.0

