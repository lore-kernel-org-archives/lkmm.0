Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E66280001;
	Tue, 10 Jun 2025 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543217; cv=none; b=F7+BIg95aHSvLbmvU1krk/grmv62RMHrcvJgDdtQ7utuXaSO9yhDiWo9LEycYbLmzvoHJMllWMRm2PT3MsxcKonvmOArZcu5Aqj0U8gSA+BGxVUj/WsLeZroSCwumySEEfQ4ZYcbDPElRea5wbW53vUi6yBXPEJaZiD0LtndJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543217; c=relaxed/simple;
	bh=eZ8mMT4xITCP8zZ4dRjUAj87OD2BsMfsr0rdPnrGSFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGp6nwkiX5Du/Ic/m9cMG/lZrpaI22X8Sv6hrSFiCTRF4odFzLXl+h7AxRYgE2isWhqXzU4FAW2LeynEo6n4UoY+bD3N5C2GNv90NI2ES6ntH9A17QugT5UltFZ2S20Haj5daRF8WKAN9rOk6djfNksuTl7yWz2UnsrTLYyvWB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gn1SPxVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn1SPxVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C34C4CEEF;
	Tue, 10 Jun 2025 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749543217;
	bh=eZ8mMT4xITCP8zZ4dRjUAj87OD2BsMfsr0rdPnrGSFg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gn1SPxVvktzcMdbi8bpkcZT5H9uz/TDP1OqNFTHRnrbKlgEVAYi2GzzqbPPIyybZ8
	 g0vfPzo914HDRK3MTRN+sBGifimDar+idMSG28wV0kSbOd/go97tCRndO0lG58bFL+
	 WbeT/k/QZqfCaoh/6up9zpqyLu7NvhTYJCTOBvEsSOSyHsjt0qxnBdXp6tJqfYwOY3
	 vgTYPSzbn9QtePYDQj7wFe4r7HtIQ6ttUxco9aad5t4rtEONrOK54D/NaV1KXvf8k1
	 jSmMHCkY/O68ynFXnuZMs96skVvy4XZsel1DnmUC/Yk0D4U+H2p9mVZoQIuDz4XkK/
	 BGDkPhEV55j7w==
Date: Tue, 10 Jun 2025 10:13:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney"
 <paulmck@kernel.org>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linux.dev, peterz@infradead.org,
 stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>, Ignacio
 Encinas Rubio <ignacio@iencinas.com>, lkmm@lists.linux.dev, Marco Elver
 <elver@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] lkmm: docs: Put LKMM documentation into dev-tools book
Message-ID: <20250610101331.62ba466f@foz.lan>
In-Reply-To: <c1e93b99-21a1-4646-af6c-e05330e1cd3d@gmail.com>
References: <837b4d83-b91f-40d1-995a-aa3c5a925b0b@iencinas.com>
	<015198be-1f23-4fc9-ba58-be7c48550f36@gmail.com>
	<87ikl48te3.fsf@trenco.lwn.net>
	<c1e93b99-21a1-4646-af6c-e05330e1cd3d@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 10 Jun 2025 11:11:50 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Mon, 09 Jun 2025 16:03:32 -0600, Jonathan Corbet wrote:
> > Akira Yokosawa <akiyks@gmail.com> writes:
> >   
> >> Currently, LKMM docs are not included in any of kernel documentation
> >> books.
> >>
> >> Commit e40573a43d16 ("docs: put atomic*.txt and memory-barriers.txt
> >> into the core-api book") covered plain-text docs under Documentation/
> >> by using the "include::" directive along with the ":literal:" option.
> >>
> >> As LKMM docs are not under Documentation/, the same approach would not
> >> work due to the limit of the include:: directive. 
> >>
> >> As a matter of fact, kernel documentation has an extended directive
> >> by the name of "kernel-include::", which has no such limitation.
> >>
> >> Rather than moving LKMM docs around, use the latter with source tree's
> >> abspath passed through via the "SOURCEDIR" variable which is now defined
> >> in Documentation/Makefile, and make them included in the dev-tools book
> >> next to KCSAN.  
> > 
> > So this fell through the cracks during my May travel, sorry.  
> 
> Thank you for taking the time!
> 
> > 
> > I've taken a look at it now ... it adds a vast number of build warnings:
> > 
> > Documentation/networking/netlink_spec/rt_addr.rst:28: WARNING: duplicate label rt-addr-operation-newaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> > Documentation/networking/netlink_spec/rt_addr.rst:41: WARNING: duplicate label rt-addr-operation-deladdr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> > Documentation/networking/netlink_spec/rt_addr.rst:54: WARNING: duplicate label rt-addr-operation-getaddr, other instance in /stuff/k/git/kernel/Documentation/networking/netlink_spec/rt-addr.rst
> > [...]
> > 
> > I haven't had a chance to figure out *why* it would have this particular
> > bizarre effect...  
> 
> I don't think those new warnings have anything to do with this patch.
> 
> This is mentioned by Paolo at:
>   https://lore.kernel.org/495e43ef-ae20-4dda-97c0-cb8ebe97394b@redhat.com/
> 
>     My understanding is that this rename triggers rebuild of the related
>     doc, which in turns leads to quite a large number of htmldoc warning,
>     but it's really unharmful/pre-existing issue.
> 
> , and Donald said in his reply at:
>   https://lore.kernel.org/CAD4GDZw+Enkd2dA8f7pNxMadwURFd_tHv1sUwkXqFqxsOquHQQ@mail.gmail.com/
> 
>     Yes, Documentation/Makefile goes the extra mile to only try deleting a
>     list of .rst files generated from the list of source .yaml files. It
>     would be easier to just delete
>     Documentation/networking/netlink_spec/*.rst which would be able to
>     clean up old generated files in situations like this.
> 
> HTH.
> 
> BTW, I assumed Paul would take this patch into his lkmm branch for v6.17,
> once all is clear for the new uses of "..kernel-include::" with ":literal:".

IMO, that happens because of the extra step introduced by ynl_gen_rst.py.

Any file renames and deletes will cause troubles. Btw, with those:

	YNL_INDEX:=$(srctree)/Documentation/networking/netlink_spec/index.rst
	YNL_RST_DIR:=$(srctree)/Documentation/networking/netlink_spec
	YNL_YAML_DIR:=$(srctree)/Documentation/netlink/specs
	YNL_TOOL:=$(srctree)/tools/net/ynl/pyynl/ynl_gen_rst.py

	YNL_RST_FILES_TMP := $(patsubst %.yaml,%.rst,$(wildcard $(YNL_YAML_DIR)/*.yaml))
	YNL_RST_FILES := $(patsubst $(YNL_YAML_DIR)%,$(YNL_RST_DIR)%, $(YNL_RST_FILES_TMP))

$(YNL_INDEX): $(YNL_RST_FILES)
        $(Q)$(YNL_TOOL) -o $@ -x

$(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
        $(Q)$(YNL_TOOL) -i $< -o $@

the produced ReST files aren't placed inside Documentation/output.
They're placed instead at $(srctree). This can be problematic,
specially when O= is in place.

IMO, the right solution would be to write a Sphinx extension that would
be internally calling ynl_gen_rst.py. This way, there won't be a need to
store.

There is a second option: do something similar to what we did when
media uAPI documents got migrated to Sphinx(*). The Makefile part
is at:

	Documentation/userspace-api/media/Makefile

Where generated ReST files are stored under $(BUILDDIR). We did this before 
we start writing our own Sphinx extensions. While such approach works,IMO
a Sphinx extension would be better integrated.

---

(*) the tool there ensures that the entire uAPI headers will be included
    on media documentation in a way that all symbols will have a
    cross-reference to uAPI documentation. This way, if one adds a new
    uAPI without touching docs, warnings will be generated.

> 
> Thanks,
> Akira



Thanks,
Mauro
