Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C208C0E;
	Wed,  7 May 2025 00:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576454; cv=none; b=Og2H9BlcMhQE2sykPZYIq3y7h0CPl3bHyu0TCiyO4UxXyy2krHnhFKkWKvfmKjHdwuNlcB3XCyT+7Cf+yI6AIg/QpYDmpexpUNeAZCtUKHEBVQjBCvkjJPa8hKyVMUHzVuYc09u/5Kp/uXsbpzq/KwwAJQMA+9Roor5bjAdIw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576454; c=relaxed/simple;
	bh=zcwWlEbqolEIZtSBsil+2/5HwIxmkkaYBt6tSIcRpyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgEcoSxXUU6Y0vWjC9iaeNEdWYLEQTOlfhte1EFf5ogSjUrU+MuTudQ+yphoCrmkJjOAv1++T5RNSEi2gIufqTq/dS3MW4Nf3KE6328oSe1G7Anu4SXt0wyDudbqfoZ3QDyW2cFezZG3n7+1bPewWKS3ErsiFXCA5rqP62/ob8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX9iWpar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX9iWpar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B18BC4CEE4;
	Wed,  7 May 2025 00:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746576453;
	bh=zcwWlEbqolEIZtSBsil+2/5HwIxmkkaYBt6tSIcRpyM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lX9iWpargfYQwD0clpzLBNyJqxJb9eQoDZf6+uuaaQozfJz6dDgd+JGqdwKObRaA6
	 QAo4lMzrS2/knwAfyM+ZhmCHOFUK13v5GPERztOLuvkcp2/mAiAmXG7gq/1mMVmW74
	 45rzjJUsy+NLBPge8yAesD83bLFteXs/lRTKgS8+kPSSkMsBb3a+pBZ6UHomlEFhUX
	 WlBovJ2NTVE86QiSv1Ksn+XXUuVjjem3CQX4EDH0Yn9kv/Tr2+YyMjGHVCQQBwpe11
	 sTc+dg6IzajCrKPDYkrf7+K1oMKLr+kB10fVU6JrNVxLowvuibMOJxHvUilbnI6ibg
	 maX/XCuKnHHaA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 29103CE1FCA; Tue,  6 May 2025 17:07:33 -0700 (PDT)
Date: Tue, 6 May 2025 17:07:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, mchehab+huawei@kernel.org,
	joel@joelfernandes.org, linux-kernel-mentees@lists.linux.dev,
	peterz@infradead.org, stern@rowland.harvard.edu,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ignacio Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH] lkmm: docs: Put LKMM documentation into dev-tools book
Message-ID: <855f6cd0-dc1d-47df-a9c0-ddf9948fa212@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
 <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>

On Tue, May 06, 2025 at 11:50:08AM +0900, Akira Yokosawa wrote:
> Currently, LKMM docs are not included in any of kernel documentation
> books.
> 
> Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
> into the core-api book") covered plain-text docs under Documentation/
> by using the "include::" directive along with the ":literal:" option.
> 
> As LKMM docs are not under Documentation/, the same approach would not
> work due to the limit of the include:: directive. 
> 
> As a matter of fact, kernel documentation has an extended directive
> by the name of "kernel-include::", which has no such limitation.
> 
> Rather than moving LKMM docs around, use the latter with source tree's
> abspath passed through via the "SOURCEDIR" variable which is now defined
> in Documentation/Makefile, and make them included in the dev-tools book
> next to KCSAN.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
> Hi all, [+CC: Marco, due to the relation of KCSAN and LKMM]
> 
> Without having seen much interest in "reSTructuring" LKMM docs [1],
> I went forward in the direction of literally including them without
> bothering with reST markups.
> 
> [1]: https://lore.kernel.org/lkmm/837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com/
> 
> This is more of a PoC of minimal glue/wrappers on top of Paul's dev
> branch which just works for me.
> [doesn't apply cleanly on top of Jon's docs-next due to a queued
>  change in Documentaion/Makefile]
> 
> Note that there is *no* change under tools/memory-model/.
> How does this look to you?

Looks fine to me!

							Thanx, Paul

>         Thanks, Akira
> --
>  Documentation/Makefile                        |  1 +
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
>  19 files changed, 193 insertions(+)
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
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 63094646df28..988460db1ce1 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -87,6 +87,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>        cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
>  	PYTHONDONTWRITEBYTECODE=1 \
>  	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(src)/$5/$(SPHINX_CONF)) \
> +	SOURCEDIR=$(abspath $(srctree)) \
>  	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
>  	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
>  	$(SPHINXBUILD) \
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
> index 000000000000..1c11bb86b8ce
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/access-marking.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/cheatsheet.rst b/Documentation/dev-tools/lkmm/docs/cheatsheet.rst
> new file mode 100644
> index 000000000000..c510a578a8d1
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/cheatsheet.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/control-dependencies.rst b/Documentation/dev-tools/lkmm/docs/control-dependencies.rst
> new file mode 100644
> index 000000000000..db18f18f56f7
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/control-dependencies.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/explanation.rst b/Documentation/dev-tools/lkmm/docs/explanation.rst
> new file mode 100644
> index 000000000000..4b4592fb52da
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/explanation.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/glossary.rst b/Documentation/dev-tools/lkmm/docs/glossary.rst
> new file mode 100644
> index 000000000000..00376a226675
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/glossary.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
> new file mode 100644
> index 000000000000..2fc4e6e5422b
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/herd-representation.txt
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
> index 000000000000..f1f27c573189
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/litmus-tests.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/locking.rst b/Documentation/dev-tools/lkmm/docs/locking.rst
> new file mode 100644
> index 000000000000..c396107d2126
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/locking.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/ordering.rst b/Documentation/dev-tools/lkmm/docs/ordering.rst
> new file mode 100644
> index 000000000000..aef2f1f8ff89
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/ordering.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/readme.rst b/Documentation/dev-tools/lkmm/docs/readme.rst
> new file mode 100644
> index 000000000000..3353feef52b4
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/README
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/recipes.rst b/Documentation/dev-tools/lkmm/docs/recipes.rst
> new file mode 100644
> index 000000000000..a20d114422aa
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/recipes.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/references.rst b/Documentation/dev-tools/lkmm/docs/references.rst
> new file mode 100644
> index 000000000000..04d3dfe69e3c
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/references.txt
> +   :literal:
> diff --git a/Documentation/dev-tools/lkmm/docs/simple.rst b/Documentation/dev-tools/lkmm/docs/simple.rst
> new file mode 100644
> index 000000000000..0372520a43bd
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/Documentation/simple.txt
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
> index 000000000000..21ddad3b8fe2
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
> +.. kernel-include:: $SOURCEDIR/tools/memory-model/README
> +   :literal:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..c95b93e74287 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13714,6 +13714,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/dev
>  F:	Documentation/atomic_bitops.txt
>  F:	Documentation/atomic_t.txt
>  F:	Documentation/core-api/refcount-vs-atomic.rst
> +F:	Documentation/dev-tools/lkmm/
>  F:	Documentation/litmus-tests/
>  F:	Documentation/memory-barriers.txt
>  F:	tools/memory-model/
> 
> base-commit: e245fbc31c2450481e83110583793ea2eb51e7f7
> -- 
> 2.43.0
> 
> 
