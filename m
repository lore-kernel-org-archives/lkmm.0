Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD232779D;
	Thu, 11 Sep 2025 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597105; cv=none; b=cvrRLbmQ+CWUVgOy9b22+DUTRTB3RvRCFgWBQl2qlbcxl13P7z9HOqOePJK5KrIAwZ7JieDmPAORu50GLJsqGawYEzm6K3LVEfi397RSjikbRLu6BtKf2BIcSpIINv+0GqZgDRIz6w4Pd44fZTBQVitwyR7Fg+F+LdB3dNbQr70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597105; c=relaxed/simple;
	bh=vmvhNHlDW8PkoLNG+CaB6XwY+lfTsDrSjISJ+GkPtgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K630fXGRLBKFyv8A2IFzuF6CWgEucCuonkKB1r5xorcXhkJbKisJzS5lrakpPm5yB+xmrXHp2SvwS5mBSMaKx5CI8lwX384fzoiesPsbnDej6D306XbCcqnQl/TdYJkWQXT8y9CKQssXEY+BICkNQNiQXUAORgG3hfi+w9tjXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHeAvZ1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHeAvZ1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F61CC4CEF0;
	Thu, 11 Sep 2025 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757597104;
	bh=vmvhNHlDW8PkoLNG+CaB6XwY+lfTsDrSjISJ+GkPtgk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=FHeAvZ1swZBMdxXUDp40dCs+rezhxacgELZZgDp0uaNlFud3fIeVCqPnJxseMFHPa
	 nSgcN+KOZzR5uoz1RC0z4NR1vFKDzhjt0gdH/W4JGaXKyPA8WdzWga+y2+uXfAtttj
	 QF+5fAdBj204OMu4/3VUpmrwM4B/YyXAZw+P008gKGVKxXiATerO9oY9bPn3SCPKjx
	 Ry0SvmLMrcxtqOOv0pA5ZKzA/eoaGikXRQP5gGADMpttUqYnh60dqe+o9fp/hAysS3
	 joHO7aAYoCyP5j7n6hnskvs011SYpjFb+whnnE+pBy+0C/l6PZ5hqNm7zx8ADc9AKo
	 kh1cGSOGwHXcw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1E7CCCE0DDA; Thu, 11 Sep 2025 06:25:03 -0700 (PDT)
Date: Thu, 11 Sep 2025 06:25:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Marco Elver <elver@google.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev
Subject: Re: [PATCH v2] docs: Pull LKMM documentation into dev-tools book
Message-ID: <5e2b5f4c-9655-4ece-b0a1-df43b5f578db@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7ce84a93-5cbc-420e-894a-06a0372c52ab@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ce84a93-5cbc-420e-894a-06a0372c52ab@gmail.com>

On Thu, Sep 11, 2025 at 05:29:31PM +0900, Akira Yokosawa wrote:
> Currently, LKMM docs are not included in any of kernel documentation
> books.
> 
> Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
> into the core-api book") covered plain-text docs under Documentation/
> by using the "include::" directive along with the ":literal:" option.
> 
> As LKMM docs are not under Documentation/, the same approach would not
> work due to the directive's restriction.
> 
> As a matter of fact, kernel documentation has an extended directive
> by the name of "kernel-include::", which loosens such restriction and
> accepts any files under the kernel source tree.
> 
> Rather than moving LKMM docs around, use the latter and pull them into
> the dev-tools book next to KCSAN.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> ---
> v2:
>   - Rebased on top of docs-next.
>   - v1 was intended to be upstreamed through Paul's lkmm tree.
>     Given the changes queued in Jon's tree where docs build scripts have
>     seen rather radical changes, upstreaming this through Jon's tree
>     sounds reasonable to me.
>   - Removed "$SOURCEDIR/" from path to the "kernel-include::" directives.
>     "kernel-include::" now treats them as relative to kernel source dir.
>   - Amended summary phrase. 
> 
>   Paul, could you ack on this change going through Jon's tree?

Thank you, Akira!

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> [v1]: https://lore.kernel.org/015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com/
> 
> Thanks, Akira
> --
>  Documentation/dev-tools/index.rst             |  1 +
>  .../dev-tools/lkmm/docs/access-marking.rst    | 11 ++++++++++
>  .../dev-tools/lkmm/docs/cheatsheet.rst        | 11 ++++++++++
>  .../lkmm/docs/control-dependencies.rst        | 11 ++++++++++
>  .../dev-tools/lkmm/docs/explanation.rst       | 11 ++++++++++
>  .../dev-tools/lkmm/docs/glossary.rst          | 11 ++++++++++
>  .../lkmm/docs/herd-representation.rst         | 11 ++++++++++
>  Documentation/dev-tools/lkmm/docs/index.rst   | 21 +++++++++++++++++++
>  .../dev-tools/lkmm/docs/litmus-tests.rst      | 11 ++++++++++
>  Documentation/dev-tools/lkmm/docs/locking.rst | 11 ++++++++++
>  .../dev-tools/lkmm/docs/ordering.rst          | 11 ++++++++++
>  Documentation/dev-tools/lkmm/docs/readme.rst  | 11 ++++++++++
>  Documentation/dev-tools/lkmm/docs/recipes.rst | 11 ++++++++++
>  .../dev-tools/lkmm/docs/references.rst        | 11 ++++++++++
>  Documentation/dev-tools/lkmm/docs/simple.rst  | 11 ++++++++++
>  Documentation/dev-tools/lkmm/index.rst        | 15 +++++++++++++
>  Documentation/dev-tools/lkmm/readme.rst       | 11 ++++++++++
>  MAINTAINERS                                   |  1 +
>  18 files changed, 192 insertions(+)
>  create mode 100644 Documentation/dev-tools/lkmm/docs/access-marking.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/cheatsheet.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/control-dependencies.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/explanation.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/glossary.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/herd-representation.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/index.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/litmus-tests.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/locking.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/ordering.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/readme.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/recipes.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/references.rst
>  create mode 100644 Documentation/dev-tools/lkmm/docs/simple.rst
>  create mode 100644 Documentation/dev-tools/lkmm/index.rst
>  create mode 100644 Documentation/dev-tools/lkmm/readme.rst
> 
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
> index 65c54b27a60b..4b8425e348ab 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -29,6 +29,7 @@ Documentation/process/debugging/index.rst
>     ubsan
>     kmemleak
>     kcsan
> +   lkmm/index
>     kfence
>     kselftest
>     kunit/index
> diff --git a/Documentation/dev-tools/lkmm/docs/access-marking.rst b/Documentation/dev-tools/lkmm/docs/access-marking.rst
> new file mode 100644
> index 000000000000..80058a4da980
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/access-marking.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Access Marking
> +--------------
> +
> +Literal include of ``tools/memory-model/Documentation/access-marking.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/access-marking.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/cheatsheet.rst b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
> new file mode 100644
> index 000000000000..37681f6a6a8c
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Cheatsheet
> +----------
> +
> +Literal include of ``tools/memory-model/Documentation/cheatsheet.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/cheatsheet.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/control-dependencies.rst b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
> new file mode 100644
> index 000000000000..5ae97e8861eb
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Control Dependencies
> +--------------------
> +
> +Literal include of ``tools/memory-model/Documentation/control-dependencies.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/control-dependencies.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/explanation.rst b/Documentation/dev-tools/lkmm/docs/explanation.rst
> new file mode 100644
> index 000000000000..0bcba9a5ddf7
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/explanation.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Explanation
> +-----------
> +
> +Literal include of ``tools/memory-model/Documentation/explanation.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/explanation.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/glossary.rst b/Documentation/dev-tools/lkmm/docs/glossary.rst
> new file mode 100644
> index 000000000000..849aefdf3d6e
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/glossary.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Glossary
> +--------
> +
> +Literal include of ``tools/memory-model/Documentation/glossary.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/glossary.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> new file mode 100644
> index 000000000000..ebf4a2181cd7
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +herd-representation
> +-------------------
> +
> +Literal include of ``tools/memory-model/Documentation/herd-representation``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/herd-representation.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/index.rst b/Documentation/dev-tools/lkmm/docs/index.rst
> new file mode 100644
> index 000000000000..abbddcc009de
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/index.rst
> @@ -0,0 +1,21 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Documentation
> +=============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   readme
> +   simple
> +   ordering
> +   litmus-tests
> +   locking
> +   recipes
> +   control-dependencies
> +   access-marking
> +   cheatsheet
> +   explanation
> +   herd-representation
> +   glossary
> +   references
> diff --git a/Documentation/dev-tools/lkmm/docs/litmus-tests.rst b/Documentation/dev-tools/lkmm/docs/litmus-tests.rst
> new file mode 100644
> index 000000000000..3293f4540156
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/litmus-tests.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Litmus Tests
> +------------
> +
> +Literal include of ``tools/memory-model/Documentation/litmus-tests.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/litmus-tests.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/locking.rst b/Documentation/dev-tools/lkmm/docs/locking.rst
> new file mode 100644
> index 000000000000..b5eae4c0acb7
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/locking.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Locking
> +-------
> +
> +Literal include of ``tools/memory-model/Documentation/locking.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/locking.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/ordering.rst b/Documentation/dev-tools/lkmm/docs/ordering.rst
> new file mode 100644
> index 000000000000..a2343c12462d
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/ordering.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Ordering
> +--------
> +
> +Literal include of ``tools/memory-model/Documentation/ordering.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/ordering.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/readme.rst b/Documentation/dev-tools/lkmm/docs/readme.rst
> new file mode 100644
> index 000000000000..51e7a64e4435
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/readme.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +README (for LKMM Documentation)
> +-------------------------------
> +
> +Literal include of ``tools/memory-model/Documentation/README``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/README
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/recipes.rst b/Documentation/dev-tools/lkmm/docs/recipes.rst
> new file mode 100644
> index 000000000000..e55952640047
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/recipes.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Recipes
> +-------
> +
> +Literal include of ``tools/memory-model/Documentation/recipes.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/recipes.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/references.rst b/Documentation/dev-tools/lkmm/docs/references.rst
> new file mode 100644
> index 000000000000..c6831b3c9c02
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/references.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +References
> +----------
> +
> +Literal include of ``tools/memory-model/Documentation/references.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/references.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/simple.rst b/Documentation/dev-tools/lkmm/docs/simple.rst
> new file mode 100644
> index 000000000000..5c1094c95f45
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/docs/simple.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Simple
> +------
> +
> +Literal include of ``tools/memory-model/Documentation/simple.txt``.
> +
> +------------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/Documentation/simple.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/index.rst b/Documentation/dev-tools/lkmm/index.rst
> new file mode 100644
> index 000000000000..e52782449ca3
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/index.rst
> @@ -0,0 +1,15 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +Linux Kernel Memory Consistency Model (LKMM)
> +============================================
> +
> +This section literally renders documents under ``tools/memory-model/``
> +and ``tools/memory-model/Documentation/``, which are maintained in
> +the *pure* plain text form.
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   readme
> +   docs/index
> diff --git a/Documentation/dev-tools/lkmm/readme.rst b/Documentation/dev-tools/lkmm/readme.rst
> new file mode 100644
> index 000000000000..a7f847109584
> --- /dev/null
> +++ b/Documentation/dev-tools/lkmm/readme.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +README (for LKMM)
> +=================
> +
> +Literal include of ``tools/memory-model/README``.
> +
> +------------------------------------------------------------
> +
> +.. kernel-include:: tools/memory-model/README
> +   :literal:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef87548b8f88..ac47a5d0d8e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14151,6 +14151,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
>  F:	Documentation/atomic_bitops.txt
>  F:	Documentation/atomic_t.txt
>  F:	Documentation/core-api/refcount-vs-atomic.rst
> +F:	Documentation/dev-tools/lkmm/
>  F:	Documentation/litmus-tests/
>  F:	Documentation/memory-barriers.txt
>  F:	tools/memory-model/
> 
> base-commit: f44a29784f685804d9970cfb0d3439c9e30981d7
> -- 
> 2.43.0
> 
