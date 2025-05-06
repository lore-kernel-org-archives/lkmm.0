Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309E2D5D0E;
	Tue,  6 May 2025 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746499817; cv=none; b=Et7Q9MEvxySccO3IlRe2+AS538DD/v+BFWftCE8Jou2XDLRrn1N0AL8LxdVncPrpRfuJC3+2buUpLnK9g3/jIR91ea7NDTnCbdb4ynxvXv4evpxzAW1LiKvPyWsAt+4uDBNUWzxFkuAmpDgJOwkeqRqttto2SO2w8qZ4+L4BFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746499817; c=relaxed/simple;
	bh=W20blw7HTgEPQz/VINXV45x9hoVEuS13v6oZc8mYqmI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=NpqETaW2ude9qlF0KC3WM0NbYxQlct8f2B/j1+3Hh2AWdNxbFFw7R6WcXbTOlg1doC4DaT3k9iDiK0f8pf0WMpjpZ4tPPTGMq8JUTfkQV/sfXpQ3564NbsJ53cIstwvn2n8TpKTa6OVONnX/BlbWyxuZmZKZJNLamF62rqqkyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwQxSHkd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwQxSHkd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c3407a87aso76339915ad.3;
        Mon, 05 May 2025 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746499813; x=1747104613; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrviYYlvzk4BMKpbic83AUnOGOEgxdgxl7O3Y/SynbA=;
        b=GwQxSHkdFwEQTWDr4W0EGv1pYHlCFOWYN60slNFwHOBJqjvJy+YTFP3ZLEGLImneAP
         NYVLvw6C2vq3ojRYGOMtATu92kQBo0JT8a/cL3OP97dzsyiCF23qPyGJEytIH6aaESZI
         1puC1PEpA71I/EsEB7FNXoxaJ2KidVk18JjIOfGECW1/AxHDsaE2kDBYM9f5F02PJCA7
         /UfSvhzGFlvmHbgND7VFxyaP3xw2+0MoFsvhqQlqD8ZC8mAhFfucv/OlkDqacbgur4Sc
         eoPsKScpUXC5MfWEVUP98YhWi4O1hvSx1Gfdr8dsOXEdSGPSxaynHXpo685VRS9jf69o
         u7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746499813; x=1747104613;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrviYYlvzk4BMKpbic83AUnOGOEgxdgxl7O3Y/SynbA=;
        b=fgZpc9XcEbqyKIJOlrKmsHamNMcN1MivmScmCKNju56AHwIZQReB6SBE7kiht7kFD1
         xA2OUs8O0LFAi4uUIl67UXWk0JyaEsae1c6oLhr1mweYFyFJGFcjatgfaiLbtl1/4yk0
         15tf/64vHbaz9GVZChcMT3HQjLsYHQJ3RdxdW4URIsFED5cG1bsrEkA4vd2ViaWjvnIR
         1I1ZX38vVp56goWm4zOmO1IKWd8f1LdFaZoccE+0Zki8MNC9g4u1m0TYo/Q6sQTsCZqW
         qolV0KrY0ZZMGWIgcOPVYvx7WmH/uwXk+7DmDQoBy5nEvbzMmBZI8yUkScYdQtHnpwHI
         qEnw==
X-Forwarded-Encrypted: i=1; AJvYcCUys0mjzWC+zsDOYyL49O7zR44WwojxOEBEyJ6zoEdlzMSrKJLFOOhOHl3L2A8n6NwjLSSlPQ==@lists.linux.dev, AJvYcCWxBROC71m/ue1SR4qblRhBrrE5JFZZqlccSqZYalTEgfXlpRL+YzBVGNaN1ChYPEEXp+8K4mqp+IsJJASsJShLDM/RRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxNYo2RGdX5PQ6fNhS8FyZjQnW8gcVRoBXmqtT3BgYeFy8DC55
	DBhlST2T44JYoue0yXVJHvhiAH/VZ2EFiNejWdbJ8FNxMxCiywuX
X-Gm-Gg: ASbGnctzSmkYypcK1+MTBwKik1zjg6kdsrJN5BpVJ8RtevsHpbOPBRVv0jXcVnjrQ22
	WJ4hgVY5rWhei+WMeqNVlfTPDaQm1wzqSrPMFUxAbnIDJ5LRLLo4qEWze+C6QidBiKX+SgoMMnN
	BzvTnM2G3MnVS1VehG0oZFmoTlnb8v19p2apGNvc5lITvAz2szQrii+gS3wJn+DGdQwjQP7//Oq
	07blt3DT0cpQhFoQHteSmkKYoagI2tXD2TAdpcTwBrO35GehCZODV1QYf0jAN9zwCH7760BPWlE
	x6eFJDvtD3XfX16yqPyVjgQ0Zx3IqUnz7R2QASA13QTetlvbNykSs5VvXRxbSSWYcVPWw0FanzA
	bmT2SQCxjLm4=
X-Google-Smtp-Source: AGHT+IG45ySgvPSXOzFWRB0LsIw2L1BJ1YJ9Hz+PzHa9ZAT9451cEMCl/iN8QGeVs4dYuO3L993sJg==
X-Received: by 2002:a17:902:c402:b0:220:f59b:6e6 with SMTP id d9443c01a7336-22e1e8ea417mr110666565ad.8.1746499813065;
        Mon, 05 May 2025 19:50:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228e57sm62941645ad.174.2025.05.05.19.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 19:50:12 -0700 (PDT)
Message-ID: <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
Date: Tue, 6 May 2025 11:50:08 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: mchehab+huawei@kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
 stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>,
 Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev,
 Marco Elver <elver@google.com>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] lkmm: docs: Put LKMM documentation into dev-tools book
In-Reply-To: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Currently, LKMM docs are not included in any of kernel documentation
books.

Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
into the core-api book") covered plain-text docs under Documentation/
by using the "include::" directive along with the ":literal:" option.

As LKMM docs are not under Documentation/, the same approach would not
work due to the limit of the include:: directive. 

As a matter of fact, kernel documentation has an extended directive
by the name of "kernel-include::", which has no such limitation.

Rather than moving LKMM docs around, use the latter with source tree's
abspath passed through via the "SOURCEDIR" variable which is now defined
in Documentation/Makefile, and make them included in the dev-tools book
next to KCSAN.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
Hi all, [+CC: Marco, due to the relation of KCSAN and LKMM]

Without having seen much interest in "reSTructuring" LKMM docs [1],
I went forward in the direction of literally including them without
bothering with reST markups.

[1]: https://lore.kernel.org/lkmm/837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com/

This is more of a PoC of minimal glue/wrappers on top of Paul's dev
branch which just works for me.
[doesn't apply cleanly on top of Jon's docs-next due to a queued
 change in Documentaion/Makefile]

Note that there is *no* change under tools/memory-model/.
How does this look to you?

        Thanks, Akira
--
 Documentation/Makefile                        |  1 +
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
 19 files changed, 193 insertions(+)
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

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 63094646df28..988460db1ce1 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -87,6 +87,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
 	PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
+	SOURCEDIR=$(abspath $(srctree)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
 	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
 	$(SPHINXBUILD) \
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
index 000000000000..1c11bb86b8ce
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/access-marking.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/cheatsheet.rst b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
new file mode 100644
index 000000000000..c510a578a8d1
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/cheatsheet.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/control-dependencies.rst b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
new file mode 100644
index 000000000000..db18f18f56f7
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/control-dependencies.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/explanation.rst b/Documentation/dev-tools/lkmm/docs/explanation.rst
new file mode 100644
index 000000000000..4b4592fb52da
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/explanation.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/glossary.rst b/Documentation/dev-tools/lkmm/docs/glossary.rst
new file mode 100644
index 000000000000..00376a226675
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/glossary.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
new file mode 100644
index 000000000000..2fc4e6e5422b
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/herd-representation.txt
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
index 000000000000..f1f27c573189
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/litmus-tests.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/locking.rst b/Documentation/dev-tools/lkmm/docs/locking.rst
new file mode 100644
index 000000000000..c396107d2126
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/locking.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/ordering.rst b/Documentation/dev-tools/lkmm/docs/ordering.rst
new file mode 100644
index 000000000000..aef2f1f8ff89
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/ordering.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/readme.rst b/Documentation/dev-tools/lkmm/docs/readme.rst
new file mode 100644
index 000000000000..3353feef52b4
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/README
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/recipes.rst b/Documentation/dev-tools/lkmm/docs/recipes.rst
new file mode 100644
index 000000000000..a20d114422aa
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/recipes.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/references.rst b/Documentation/dev-tools/lkmm/docs/references.rst
new file mode 100644
index 000000000000..04d3dfe69e3c
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/references.txt
+   :literal:
diff --git a/Documentation/dev-tools/lkmm/docs/simple.rst b/Documentation/dev-tools/lkmm/docs/simple.rst
new file mode 100644
index 000000000000..0372520a43bd
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/simple.txt
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
index 000000000000..21ddad3b8fe2
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
+.. kernel-include:: $SOURCEDIR/tools/memory-model/README
+   :literal:
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..c95b93e74287 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13714,6 +13714,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
 F:	Documentation/atomic_bitops.txt
 F:	Documentation/atomic_t.txt
 F:	Documentation/core-api/refcount-vs-atomic.rst
+F:	Documentation/dev-tools/lkmm/
 F:	Documentation/litmus-tests/
 F:	Documentation/memory-barriers.txt
 F:	tools/memory-model/

base-commit: e245fbc31c2450481e83110583793ea2eb51e7f7
-- 
2.43.0


