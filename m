Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409691E0DE8;
	Fri, 13 Jun 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815750; cv=none; b=oIQEH8kZt4r3W5iNdsAAh1LHW26BaeymtfDK6MbNqbp7SOHClynel2vY/yIuaRtjpLzMS4dZ8o4fW22P744gOwmlvwjooFa2VTpzequLH5ZpzaMF+jQkEwibnwrwhsjqIqLKzxVhVHBjm0sBuaAciYLDScoenwYRDBYFR9HoKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815750; c=relaxed/simple;
	bh=J0EhitDlrIu1hu+1XXXSUw/oOLeGybNBfQdPNA3VApM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=pU7536bAvwtAw7M9Aw4TUJd+qHoBvfAAI6s5rD+WJWWS5p5xAEANlD2IXHuqS/VrEIZN7/n1qA0tQHn6yGM8Fov0Lo53UPwHjUaD1//vTUredhFrOIQD7YmQoN45FGqlPVF2VStaKvNqD93Krv9wU5ozOeqN6GZLgOG5peguf20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxpRw2bp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxpRw2bp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d6ade159so17580025e9.1;
        Fri, 13 Jun 2025 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815746; x=1750420546; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0Jd7r0YovHZb9j6sJLhJrjT0z3EOg/1+unPiSwN2eo=;
        b=JxpRw2bp10kJZT0PzO3fxFg8x10Qg+PkKWfqttJISEhuFQ9uByPseXOX7S/K7fUbUW
         aK0cS/eC5Vbp/EN/NAoYSpIwjoKSt7kOKDIAgzCkPUN3mZBE11CrLi4FuFKm1LVL0iMd
         QgzVVA0iuZ+Q29FJTzB9mcOSZFSvxa6bD1z8+8nxIP3KRmROq9IB5SHDy8pQBXik21/Y
         +KilcB7g859uA/VmNnx4UGdaiSRlAEIgQ1AAh3XmfK3w1qyipLSWZkR4KtWi2Dc/OXGm
         jh4Rid5vv+OOmqSC161IawdUMUI5Jaw6L4kbgB8YneXasz428Zbc3L8dq0JCXX3P3DVV
         6qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815746; x=1750420546;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0Jd7r0YovHZb9j6sJLhJrjT0z3EOg/1+unPiSwN2eo=;
        b=KKEPxK0cJQcRRvi2WCB0uIVvsK0j/HrqXx5Z+RJdNK/z77iXmX9rEToRj9y5o+vq2H
         lbUrygOP/04fIBZjAmcSa8WBW37RJ8uhB2khBplw77HYUiuoQO823P3WsOwTGf/AE4MR
         rB8jhmNkBeT4NZyY3DYQiTBo+q0DkVLq8XtUFAu+EVfP6fDIqzhf2iFQJ/AXvUpmK1Q1
         S7WIjXe0E0nNWfvjSgMJBJCMAF5Avjg1i7I7fCWljmK6fpHmOpIDv4PBirqAWq1Dfswu
         fNXuMN5XbXphB3BE/rtJV5CqmEUziMN7+LAavo+eiIY/vpBJipP09G1l1r3JDf+aHiwF
         H5mw==
X-Forwarded-Encrypted: i=1; AJvYcCUAipnE+/x5f2pkgmL3r/TLR++I4ji5iJaMneCVK7rp/OxvgbnALfAFe1awoZgSG6Is8fmamA==@lists.linux.dev, AJvYcCVmK7BsWjhzwPA/0vgvCg11MxRV6cgaWNxJ46zECJAAmycvjMk9QVWKtbBs//u0xzy/54Xs/jfC3S6BdumGn8FZSBqEkg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5MajMHb4spm1HJ+xngCscOV+hymENhSvxjr1Gggy04foBz69y
	jO6fBB0vBdVo4jPDaP6XLXDYoAoAjUNI322wgbja5TB2D6XHXFeXip8N
X-Gm-Gg: ASbGncspAarEWzNk3q/e3ge0hm//cr+87n0abbg1QsIg55yLcp8pT2TsTLrcrj7asye
	Ffzcn28Rv1IWw2+U/7Re2ib4BCr9GesvRhTBaTIUaReVxrXHQKe5g9Bbeer1qaNTLWm9mG6atgt
	y6lpoHF9W+zG0kFhpLZKEun3yiakdiDF0risaSG9wdDlL16AE5O9DYn75lBG4WyUISIFoOMXIDL
	QLLhDmE9k8B+FrWSld/5PhGsDV6Buc3EHQ4om5DHb55tP/yDdRaE3s8EtC4QGwep3DnHZavR2Pi
	wr1k9Zesj4iHYi5UYyWDbs8JdqLqOkxMCkywJtw19Ed0UxZPwKGTYyTPBI7wp07GYEeJ7PtxuDc
	=
X-Google-Smtp-Source: AGHT+IGW0eL0Sz+MMQ5fKW1+Pqr/GURhwD5tm2GubA4NtMMgQA1khyv0UdopZBiD1m8D03I6QjyEeA==
X-Received: by 2002:a05:600c:5395:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-45334b06b56mr29131225e9.31.1749815746230;
        Fri, 13 Jun 2025 04:55:46 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:75e0:f7f7:dffa:561e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16b425sm49552735e9.34.2025.06.13.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:55:41 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Ruben
 Wauters" <rubenru09@aol.com>,  "Shuah Khan" <skhan@linuxfoundation.org>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH v2 11/12] docs: use parser_yaml extension to handle
 Netlink specs
In-Reply-To: <931e46a6fdda4fa67df731b052c121b9094fbd8a.1749723671.git.mchehab+huawei@kernel.org>
Date: Fri, 13 Jun 2025 12:50:48 +0100
Message-ID: <m2ldpvn9lz.fsf@gmail.com>
References: <cover.1749723671.git.mchehab+huawei@kernel.org>
	<931e46a6fdda4fa67df731b052c121b9094fbd8a.1749723671.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Instead of manually calling ynl_gen_rst.py, use a Sphinx extension.
> This way, no .rst files would be written to the Kernel source
> directories.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile                        | 17 ---------
>  Documentation/conf.py                         | 11 +++---
>  Documentation/netlink/specs/index.rst         | 38 +++++++++++++++++++
>  Documentation/networking/index.rst            |  2 +-
>  .../networking/netlink_spec/readme.txt        |  4 --
>  Documentation/sphinx/parser_yaml.py           |  2 +-
>  6 files changed, 46 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/netlink/specs/index.rst
>  delete mode 100644 Documentation/networking/netlink_spec/readme.txt
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index d30d66ddf1ad..9185680b1e86 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -102,22 +102,6 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
>  		cp $(if $(patsubst /%,,$(DOCS_CSS)),$(abspath $(srctree)/$(DOCS_CSS)),$(DOCS_CSS)) $(BUILDDIR)/$3/_static/; \
>  	fi
>  
> -YNL_INDEX:=$(srctree)/Documentation/networking/netlink_spec/index.rst
> -YNL_RST_DIR:=$(srctree)/Documentation/networking/netlink_spec
> -YNL_YAML_DIR:=$(srctree)/Documentation/netlink/specs
> -YNL_TOOL:=$(srctree)/tools/net/ynl/pyynl/ynl_gen_rst.py
> -
> -YNL_RST_FILES_TMP := $(patsubst %.yaml,%.rst,$(wildcard $(YNL_YAML_DIR)/*.yaml))
> -YNL_RST_FILES := $(patsubst $(YNL_YAML_DIR)%,$(YNL_RST_DIR)%, $(YNL_RST_FILES_TMP))
> -
> -$(YNL_INDEX): $(YNL_RST_FILES)
> -	$(Q)$(YNL_TOOL) -o $@ -x
> -
> -$(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
> -	$(Q)$(YNL_TOOL) -i $< -o $@
> -
> -htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX)
> -
>  htmldocs:
>  	@$(srctree)/scripts/sphinx-pre-install --version-check
>  	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
> @@ -184,7 +168,6 @@ refcheckdocs:
>  	$(Q)cd $(srctree);scripts/documentation-file-ref-check
>  
>  cleandocs:
> -	$(Q)rm -f $(YNL_INDEX) $(YNL_RST_FILES)
>  	$(Q)rm -rf $(BUILDDIR)
>  	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media clean
>  
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 12de52a2b17e..add6ce78dd80 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -45,7 +45,7 @@ needs_sphinx = '3.4.3'
>  extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
>                'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
>                'maintainers_include', 'sphinx.ext.autosectionlabel',
> -              'kernel_abi', 'kernel_feat', 'translations']
> +              'kernel_abi', 'kernel_feat', 'translations', 'parser_yaml']
>  
>  # Since Sphinx version 3, the C function parser is more pedantic with regards
>  # to type checking. Due to that, having macros at c:function cause problems.
> @@ -143,10 +143,11 @@ else:
>  # Add any paths that contain templates here, relative to this directory.
>  templates_path = ['sphinx/templates']
>  
> -# The suffix(es) of source filenames.
> -# You can specify multiple suffix as a list of string:
> -# source_suffix = ['.rst', '.md']
> -source_suffix = '.rst'
> +# The suffixes of source filenames that will be automatically parsed
> +source_suffix = {
> +        '.rst': 'restructuredtext',
> +        '.yaml': 'yaml',

The handler name should probably be netlink_yaml 

> +}
>  
>  # The encoding of source files.
>  #source_encoding = 'utf-8-sig'
> diff --git a/Documentation/netlink/specs/index.rst b/Documentation/netlink/specs/index.rst
> new file mode 100644
> index 000000000000..ca0bf816dc3f
> --- /dev/null
> +++ b/Documentation/netlink/specs/index.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. NOTE: This document was auto-generated.
> +
> +.. _specs:
> +
> +=============================
> +Netlink Family Specifications
> +=============================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   conntrack
> +   devlink
> +   dpll
> +   ethtool
> +   fou
> +   handshake
> +   lockd
> +   mptcp_pm
> +   net_shaper
> +   netdev
> +   nfsd
> +   nftables
> +   nl80211
> +   nlctrl
> +   ovpn
> +   ovs_datapath
> +   ovs_flow
> +   ovs_vport
> +   rt-addr
> +   rt-link
> +   rt-neigh
> +   rt-route
> +   rt-rule
> +   tc
> +   tcp_metrics
> +   team
> diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
> index ac90b82f3ce9..b7a4969e9bc9 100644
> --- a/Documentation/networking/index.rst
> +++ b/Documentation/networking/index.rst
> @@ -57,7 +57,7 @@ Contents:
>     filter
>     generic-hdlc
>     generic_netlink
> -   netlink_spec/index
> +   ../netlink/specs/index
>     gen_stats
>     gtp
>     ila
> diff --git a/Documentation/networking/netlink_spec/readme.txt b/Documentation/networking/netlink_spec/readme.txt
> deleted file mode 100644
> index 030b44aca4e6..000000000000
> --- a/Documentation/networking/netlink_spec/readme.txt
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -SPDX-License-Identifier: GPL-2.0
> -
> -This file is populated during the build of the documentation (htmldocs) by the
> -tools/net/ynl/pyynl/ynl_gen_rst.py script.
> diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
> index eb32e3249274..cdcafe5b3937 100755
> --- a/Documentation/sphinx/parser_yaml.py
> +++ b/Documentation/sphinx/parser_yaml.py
> @@ -55,7 +55,7 @@ class YamlParser(Parser):
>          fname = document.current_source
>  
>          # Handle netlink yaml specs
> -        if re.search("/netlink/specs/", fname):
> +        if re.search("netlink/specs/", fname):

Please combine this change into the earlier patch so that the series
doesn't have unnecessary changes.

>              if fname.endswith("index.yaml"):
>                  msg = self.netlink_parser.generate_main_index_rst(fname, None)
>              else:
