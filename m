Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8332E0B74
	for <lkmm@lists.linux.dev>; Thu, 11 Sep 2025 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757579377; cv=none; b=Tk6uL3ck/ED2MuIPDzOgOLqFiu8EmXUGOBtQxRgSGg3hU6BWEvcFE4xWO4K8SHPlhWUzTVr7ymJd5INgZRT+1Ygk/F27WAcrwPHxSTtsd+oOwHyKzA7yw7XMF57LTfdCLyFUQeG6gcmIoKdKOY3B249Uq7QH9Sq0+BamMX/trcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757579377; c=relaxed/simple;
	bh=itv4Mf628PlRa1WWBwzVfDWj8GrePfWoT2kdKlmyKSo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=TEz93zU8tWb09h30dHuOVfM7pMvbSR+Jh7WSW1qbxVdaL5GyUJODjqU/ZdhFGABBDTIvAVUJEEhmyMF6NeYKkLAeq8WnJfIV6awYMowFPYyQNfR/LjJJbouPkdMBdL4ms0bzE7Jf6LOjl6mw31wsfzpQHDI4a9kK5VDWyHvTmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebL+eNDF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebL+eNDF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32d6c194134so647158a91.0
        for <lkmm@lists.linux.dev>; Thu, 11 Sep 2025 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757579375; x=1758184175; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17NUzlg67YJjbVf0HZBfty1lUuGmethQA5ndVWidP7g=;
        b=ebL+eNDFoD57oDzCVTcNbAEivGnVrQn3ufb7clQTZJ0L5+KcWRmpRO6pAPUr0ugwpA
         22GYHafqRXsq2v5E8XBT+wMngofelKar174GOEJ0N+m81udWqlqHIMg2XekpzsH91pNF
         BAqNGGeo+4A+GJLGkeglsz/B1K/VLs50HxSUxpmJfuM4eKaYgvSYLjSgPx5J/eLbhVbv
         oTaabFJKA5FE1ySZ3q+edFZiDqUGHrdR+dIJTdtfGWufqt42ndg4qsdSp4zrMavT6AGA
         0aLJDbs+mJjCeANqtb7OJ2iT+zbVff62oi47or3PoSAxndvI14uAYWpG64ZZ7pB9kRgm
         28Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579375; x=1758184175;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=17NUzlg67YJjbVf0HZBfty1lUuGmethQA5ndVWidP7g=;
        b=b4WOXuvfGIiscH5r45Q+ux7///D7jbJZ2Wh25KOvf5TeF5KQKjp9MEm0KCmR0w0MKF
         8ait2SDujMmHSEPd5rPOtlySkGGMDsCiM9S6HYDIjb/uNyKMbNlnrRbaqMtIQSrMnQuE
         vMYtRbJjXA3w4iMjbPX3Scms/9z0QwSKcskgtk4rYHWGywZ2C8gR2tWOZZ8JLD5rr/Nq
         JvfeZCfjqLt0+vyLQ7V0m+LX1ecCs10reJor7kdNiO4gpxmel/ss4GtfIl2lwz77aSWK
         Ia3l1f3ixUo+R3Eade/kHyo8gr8AsoY1GZnz8iTf6E7+SoflBYp+irenuvOYQE1iJoMT
         YYmA==
X-Forwarded-Encrypted: i=1; AJvYcCVsP1G2OzGvVGNw2PQ9Dyp+OPyYjGuT1rTRIvSvO7gO1rFqtjmXX3SZa9nHRW0LYgiAJw04@lists.linux.dev
X-Gm-Message-State: AOJu0YyoqETDZJ0kbjG5Dgf3gfUrZmGD1ba5r6jwFDGHeNopD77qqzV8
	VRV1bqounMuFKflLKZDJqIF72so4A1xAj6lV8FJvAI//syQsuULb0Xql
X-Gm-Gg: ASbGncvlM5QczIxuTQLi99H5zQ/wQK8XL8ypk1vy0EOieGHlJHpn/VfvJYNYhaPS1tY
	tc10zxoceNGCIi3Lrteczh25b53TnDypAmjUR0kvT3S/pCxIXqokRdSjW4t1swXTRMCL84R3Hb9
	2PS4XP/vWMFug8ov+LvdUeNPaV4F8FhOVwJZ1UGOcl8wkboP6s3Vr+fDnVIrZPZfY2qR4uvLPhd
	6sHJ+TOdOceHIgBpggXMbVRddNBwgCXXGFWsJez+Jievy06fuG91eA1J7nuXu6+V1LWWDorTkmO
	mQKxu6pN7KgjRRU1rlkHqsHrFFArAlWZFtM5W3pEbkT8lxJaFibt4qUD2v/0ce1kuaZa1sw/YGp
	669siCIhepc+bJOkk3eGlxZsx+R34YlzjLWN4NArPSBFljehAsYILUp/9nRS0MCXFwZoXw2VwLR
	RgOeU=
X-Google-Smtp-Source: AGHT+IGv/d17HpJxLBRXhnhpeMayjal/q21AA86Ig3ltBL3sey+sRC+omVInGksw9AWO+El58UVdjA==
X-Received: by 2002:a17:90b:1d48:b0:32b:c9c4:78cd with SMTP id 98e67ed59e1d1-32d43fb1c60mr23502333a91.35.1757579374657;
        Thu, 11 Sep 2025 01:29:34 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd98245e6sm1280032a91.7.2025.09.11.01.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:29:34 -0700 (PDT)
Message-ID: <7ce84a93-5cbc-420e-894a-06a0372c52ab@gmail.com>
Date: Thu, 11 Sep 2025 17:29:31 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2] docs: Pull LKMM documentation into dev-tools book
To: Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney"
 <paulmck@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Peter Zijlstra <peterz@infradead.org>, Alan Stern
 <stern@rowland.harvard.edu>, Marco Elver <elver@google.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev,
 Akira Yokosawa <akiyks@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, LKMM docs are not included in any of kernel documentation
books.

Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
into the core-api book") covered plain-text docs under Documentation/
by using the "include::" directive along with the ":literal:" option.

As LKMM docs are not under Documentation/, the same approach would not
work due to the directive's restriction.

As a matter of fact, kernel documentation has an extended directive
by the name of "kernel-include::", which loosens such restriction and
accepts any files under the kernel source tree.

Rather than moving LKMM docs around, use the latter and pull them into
the dev-tools book next to KCSAN.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul E. McKenney <paulmck@kernel.org>
---
v2:
  - Rebased on top of docs-next.
  - v1 was intended to be upstreamed through Paul's lkmm tree.
    Given the changes queued in Jon's tree where docs build scripts have
    seen rather radical changes, upstreaming this through Jon's tree
    sounds reasonable to me.
  - Removed "$SOURCEDIR/" from path to the "kernel-include::" directives.
    "kernel-include::" now treats them as relative to kernel source dir.
  - Amended summary phrase. 

  Paul, could you ack on this change going through Jon's tree?
  
[v1]: https://lore.kernel.org/015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com/

Thanks, Akira
--
 Documentation/dev-tools/index.rst             |  1 +
 .../dev-tools/lkmm/docs/access-marking.rst    | 11 ++++++++++
 .../dev-tools/lkmm/docs/cheatsheet.rst        | 11 ++++++++++
 .../lkmm/docs/control-dependencies.rst        | 11 ++++++++++
 .../dev-tools/lkmm/docs/explanation.rst       | 11 ++++++++++
 .../dev-tools/lkmm/docs/glossary.rst          | 11 ++++++++++
 .../lkmm/docs/herd-representation.rst         | 11 ++++++++++
 Documentation/dev-tools/lkmm/docs/index.rst   | 21 +++++++++++++++++++
 .../dev-tools/lkmm/docs/litmus-tests.rst      | 11 ++++++++++
 Documentation/dev-tools/lkmm/docs/locking.rst | 11 ++++++++++
 .../dev-tools/lkmm/docs/ordering.rst          | 11 ++++++++++
 Documentation/dev-tools/lkmm/docs/readme.rst  | 11 ++++++++++
 Documentation/dev-tools/lkmm/docs/recipes.rst | 11 ++++++++++
 .../dev-tools/lkmm/docs/references.rst        | 11 ++++++++++
 Documentation/dev-tools/lkmm/docs/simple.rst  | 11 ++++++++++
 Documentation/dev-tools/lkmm/index.rst        | 15 +++++++++++++
 Documentation/dev-tools/lkmm/readme.rst       | 11 ++++++++++
 MAINTAINERS                                   |  1 +
 18 files changed, 192 insertions(+)
 create mode 100644 Documentation/dev-tools/lkmm/docs/access-marking.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/cheatsheet.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/control-dependencies.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/explanation.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/glossary.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/herd-representation.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/index.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/litmus-tests.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/locking.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/ordering.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/readme.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/recipes.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/references.rst
 create mode 100644 Documentation/dev-tools/lkmm/docs/simple.rst
 create mode 100644 Documentation/dev-tools/lkmm/index.rst
 create mode 100644 Documentation/dev-tools/lkmm/readme.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 65c54b27a60b..4b8425e348ab 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -29,6 +29,7 @@ Documentation/process/debugging/index.rst
    ubsan
    kmemleak
    kcsan
+   lkmm/index
    kfence
    kselftest
    kunit/index
diff --git a/Documentation/dev-tools/lkmm/docs/access-marking.rst b/Documentation/dev-tools/lkmm/docs/access-marking.rst
new file mode 100644
index 000000000000..80058a4da980
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/access-marking.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Access Marking
+--------------
+
+Literal include of ``tools/memory-model/Documentation/access-marking.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/access-marking.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/cheatsheet.rst b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
new file mode 100644
index 000000000000..37681f6a6a8c
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Cheatsheet
+----------
+
+Literal include of ``tools/memory-model/Documentation/cheatsheet.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/cheatsheet.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/control-dependencies.rst b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
new file mode 100644
index 000000000000..5ae97e8861eb
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Control Dependencies
+--------------------
+
+Literal include of ``tools/memory-model/Documentation/control-dependencies.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/control-dependencies.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/explanation.rst b/Documentation/dev-tools/lkmm/docs/explanation.rst
new file mode 100644
index 000000000000..0bcba9a5ddf7
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/explanation.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Explanation
+-----------
+
+Literal include of ``tools/memory-model/Documentation/explanation.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/explanation.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/glossary.rst b/Documentation/dev-tools/lkmm/docs/glossary.rst
new file mode 100644
index 000000000000..849aefdf3d6e
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/glossary.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Glossary
+--------
+
+Literal include of ``tools/memory-model/Documentation/glossary.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/glossary.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
new file mode 100644
index 000000000000..ebf4a2181cd7
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+herd-representation
+-------------------
+
+Literal include of ``tools/memory-model/Documentation/herd-representation``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/herd-representation.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/index.rst b/Documentation/dev-tools/lkmm/docs/index.rst
new file mode 100644
index 000000000000..abbddcc009de
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/index.rst
@@ -0,0 +1,21 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Documentation
+=============
+
+.. toctree::
+   :maxdepth: 1
+
+   readme
+   simple
+   ordering
+   litmus-tests
+   locking
+   recipes
+   control-dependencies
+   access-marking
+   cheatsheet
+   explanation
+   herd-representation
+   glossary
+   references
diff --git a/Documentation/dev-tools/lkmm/docs/litmus-tests.rst b/Documentation/dev-tools/lkmm/docs/litmus-tests.rst
new file mode 100644
index 000000000000..3293f4540156
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/litmus-tests.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Litmus Tests
+------------
+
+Literal include of ``tools/memory-model/Documentation/litmus-tests.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/litmus-tests.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/locking.rst b/Documentation/dev-tools/lkmm/docs/locking.rst
new file mode 100644
index 000000000000..b5eae4c0acb7
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/locking.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Locking
+-------
+
+Literal include of ``tools/memory-model/Documentation/locking.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/locking.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/ordering.rst b/Documentation/dev-tools/lkmm/docs/ordering.rst
new file mode 100644
index 000000000000..a2343c12462d
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/ordering.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Ordering
+--------
+
+Literal include of ``tools/memory-model/Documentation/ordering.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/ordering.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/readme.rst b/Documentation/dev-tools/lkmm/docs/readme.rst
new file mode 100644
index 000000000000..51e7a64e4435
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/readme.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+README (for LKMM Documentation)
+-------------------------------
+
+Literal include of ``tools/memory-model/Documentation/README``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/README
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/recipes.rst b/Documentation/dev-tools/lkmm/docs/recipes.rst
new file mode 100644
index 000000000000..e55952640047
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/recipes.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Recipes
+-------
+
+Literal include of ``tools/memory-model/Documentation/recipes.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/recipes.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/references.rst b/Documentation/dev-tools/lkmm/docs/references.rst
new file mode 100644
index 000000000000..c6831b3c9c02
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/references.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+References
+----------
+
+Literal include of ``tools/memory-model/Documentation/references.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/references.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/simple.rst b/Documentation/dev-tools/lkmm/docs/simple.rst
new file mode 100644
index 000000000000..5c1094c95f45
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/docs/simple.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Simple
+------
+
+Literal include of ``tools/memory-model/Documentation/simple.txt``.
+
+------------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/Documentation/simple.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/index.rst b/Documentation/dev-tools/lkmm/index.rst
new file mode 100644
index 000000000000..e52782449ca3
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/index.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Linux Kernel Memory Consistency Model (LKMM)
+============================================
+
+This section literally renders documents under ``tools/memory-model/``
+and ``tools/memory-model/Documentation/``, which are maintained in
+the *pure* plain text form.
+
+.. toctree::
+   :maxdepth: 2
+
+   readme
+   docs/index
diff --git a/Documentation/dev-tools/lkmm/readme.rst b/Documentation/dev-tools/lkmm/readme.rst
new file mode 100644
index 000000000000..a7f847109584
--- /dev/null
+++ b/Documentation/dev-tools/lkmm/readme.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+README (for LKMM)
+=================
+
+Literal include of ``tools/memory-model/README``.
+
+------------------------------------------------------------
+
+.. kernel-include:: tools/memory-model/README
+   :literal:
diff --git a/MAINTAINERS b/MAINTAINERS
index ef87548b8f88..ac47a5d0d8e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14151,6 +14151,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
 F:	Documentation/atomic_bitops.txt
 F:	Documentation/atomic_t.txt
 F:	Documentation/core-api/refcount-vs-atomic.rst
+F:	Documentation/dev-tools/lkmm/
 F:	Documentation/litmus-tests/
 F:	Documentation/memory-barriers.txt
 F:	tools/memory-model/

base-commit: f44a29784f685804d9970cfb0d3439c9e30981d7
-- 
2.43.0

