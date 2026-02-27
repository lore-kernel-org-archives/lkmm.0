Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783062DD60F
	for <lkmm@lists.linux.dev>; Fri, 27 Feb 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183671; cv=none; b=Xoccb4G/FfukenJoxVThBrUCHA79wG2At4rVjvAr+XbPaOyWkpBcT6YqFjgLpW9PlAsd/+TtFq1m8H+k/M7vtbgx8eh4VtTGTO6oLDF5LvtQZvQKA6NJimIBOxJhGt6xDvJE0XOubQiN3oTSrb1qlVPnf0cI10kjDNz/9cUmo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183671; c=relaxed/simple;
	bh=rZFuxH4ePyQfLFf35lWZ7sV4t19Dx+EifCpgdsQfiwM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rcIJiXFswb5qqT++u7Ul+W9qF6CZfXJcl923o1Goy+4i4lAn82hp7oBGe6YjXL+rG0VIwlr28Hv1EbiDsbLQIDd3mEFkfoj7h3xBSNy2YYTW1RN6bDhGvQ4U3Uxb0NMR36eV6FRWe/PYs4jL+mQaLYpXLpU/Wnw4jOzSH4GxiWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwJXe81k; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwJXe81k"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82748095892so604017b3a.0
        for <lkmm@lists.linux.dev>; Fri, 27 Feb 2026 01:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772183670; x=1772788470; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5UvTRhrxfKsVqoBZeh0/0n91cab9+yPTUHsILCMpZNg=;
        b=YwJXe81k72V3LWni1ZIzmrIUgYQv92npexJkaWXncYmOUjwxfaCowxMbJhvN6pWpni
         DUeBU3zDM/rUQQHFhl8+out6My+I22zNgGEy8ZZs20w6Cq1MmXbb19s+B/rh7PnPwynm
         LA39ETaAsa/feolCDzsiNekvDPwl+f68rdIDt26z3fikiiBGK9emN3FZ4OhY3TpMWVMf
         MjMNMOmk+zl4dhA+OOizXDUlhHAu27cIiUMc9kM4llSzijdndq/pwawjR4KxuA562Lu2
         JWjj7KbXdTcR7GtfxxXUXbf3GQgbRBsA1IW9PTnO2c4cQrYtU0v54WnQH76QpAW61P1c
         6VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183670; x=1772788470;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UvTRhrxfKsVqoBZeh0/0n91cab9+yPTUHsILCMpZNg=;
        b=s+GdKh4K+zwRT5Ivhz181+CKyCGee7cuo9FwiFF/cVmaZKh9LmA3dTjfSpTpZczZds
         zAd6LM3jqB6IPdrYNhKDRELGvsyUrQw+74kphbwYcmLyisukqmAN5YrMSsG+5aPBKu/B
         GkA0o9Iqg95I+HkvQrrHb++8Ig7FXodhItEd1jc69ofcGhdUnkiXGr7V72/XHB2zhCKG
         qf39T+r2XZkxCUp+SoEy3AtJpBJI+ZwNMl9OTvQwCPXvBz32ra1Ra/KYyBCCKEK+OBdM
         YGFelrlEEbxmEPHuu/tkNtY/sLVgVBQIHdmswFj9inny/MPY7l8OnGzaiHlf//HKQeJU
         TPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO8noJtaLRV/Im8DQ7zsHCxD4Q41ZpG36QTeQvfOKD241cfyXLVAuZzUxP3Pa1Zvdo++tI@lists.linux.dev
X-Gm-Message-State: AOJu0YxO/n/jg6M6BJl/MaKCcCU9BjOzqhNzl5GqNmrcjY1bH8dw1unU
	CEBotmM4fN+1+OSS6UlugeXOBgNZDhTLXN1jbMDH+RttPpmow8rC6zUC
X-Gm-Gg: ATEYQzwRQlTFHONGkFD8Ib56vZt3ACyd7PL+Eaa4/TFmU6bUUaoNOGqsCfaQ82l9spe
	q3hMMOcGQkstHPbYGdwv54TzXjnWlQMM2IKwmrtse4ktdNz2cSNfp0We3YIlkh3I/W4sWGFzelq
	RjYRjAl7/nhO33ImdCph/g4au+eycB7EmEAsG4HxCBsa6D5YiJ76MrloXQvfzKdnNkBWXdDoiZV
	Sh8ff+NQUWRny6VL5TpX2ZMYq6S4fEfX+dxVhgOlNBEeQ/FohP9Uf9LFqTq6iNQ+cAQvAnPk7lt
	SAlbxm41Wej3tAOGc5DYbQm61ORuHWvn4shvmf0UqvaohjZjVygwHoSiO7F/m8LYVfIZWsLKxRy
	0OHCSjAdbze0ws1dAIrdx8f3eW9mUeGQV4LEVGEGtuHAzCf8w1Jvbi1dvmKR6aW8AZ794QJQSqr
	xHYpxU1xS22YyfXCu0sgojLlQc62AHD6QBNwmqNv5YZUqG+IgpKnWZ/n2Nh0l4TseFJKhW
X-Received: by 2002:a05:6a00:3d55:b0:81f:17b:c70f with SMTP id d2e1a72fcca58-8274d979671mr1981349b3a.29.1772183669587;
        Fri, 27 Feb 2026 01:14:29 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d5689csm6176793b3a.13.2026.02.27.01.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 01:14:29 -0800 (PST)
Message-ID: <463aaac5-d36d-46b6-91c3-b62994f0528d@gmail.com>
Date: Fri, 27 Feb 2026 18:14:24 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [BUG] Memory ordering between kmalloc() and kfree()? it's
 confusing!
To: Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org
Cc: Dmitry Vyukov <dvyukov@google.com>, lkmm@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Daniel Lustig <dlustig@nvidia.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Luc Maranget
 <luc.maranget@inria.fr>, Jade Alglave <j.alglave@ucl.ac.uk>,
 David Howells <dhowells@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Andrea Parri <parri.andrea@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Pedro Falcato <pfalcato@suse.de>,
 Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Mateusz Guzik <mjguzik@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
 Marco Elver <elver@google.com>, Akira Yokosawa <akiyks@gmail.com>
References: <aZ_lJAqxh_hNGr_v@hyeyoo>
Content-Language: en-US
In-Reply-To: <aZ_lJAqxh_hNGr_v@hyeyoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

A comment from a LKMM reviewer.

On Thu, 26 Feb 2026 15:35:08 +0900, Harry Yoo wrote:
> Hello, SLAB, LKMM, and KCSAN folks!
> 
> I'd like to discuss slab's assumption on users regarding memory ordering.
> 
> Recently, I've been investigating an interesting slab memory ordering
> issue [3] [4] in v7.0-rc1, which made me think about memory ordering
> for slab objects.
> 
> But without answering "What does slab expect users to do for correct
> operation?", I kept getting puzzled, and my brain hurt too much :/
> I'm writing things down to stop getting confused :)
> 
> Since I have never thought about this before, my reasoning could be
> partially or entirely incorrect. If so, please kindly let me know.
> 
> # Slab's assumption: Stores to object, its metadata, or struct slab
> # must be visible to the CPU that frees the object, when it is
> # passed to kfree(). It's users' responsibility to guarantee that.
> 
> When the slab allocator allocates an object, it updates its metadata and
> struct slab fields. After allocation, the user of slab updates object's
> content. As long as the object is freed on the same CPU that it was
> allocated, kfree() can see those stores (A CPU must be able to see
> what's in its store buffer), so no problem!
> 
> However, when e.g.) the pointer to object is stored in a shared variable
> and then freed on a different CPU, things become trickier.
> 
> In this case, I think it's fair for the slab allocator to assume that:
> 
>   1) Such stores must involve _at least_ a release barrier
>      (for example, via {cmp,}xchg{,_release}, or smp_store_release())
>      to ensure preceding stores are visible to other CPUs before
>      the pointer store becomes visible, and
> 
>   2) The CPU that frees an object must invoke at least an acquire
>      barrier to ensure that stores to object content / metadata, etc.,
>      are visible to the freeing CPU when it calls kfree().
> 
> Because the slab allocator itself doesn't guarantee that such
> barriers are invoked within the allocator, it relies on users to
> do this when needed.
> 
> ... and that's quite a reasonable assumption, isn't it?
> 
> Actually, I'm not the first person to question this.
> 
> [1] https://lore.kernel.org/linux-mm/CACT4Y+Yfz3XvT+w6a3WjcZuATb1b9JdQHHf637zdT=6QZ-hjKg@mail.gmail.com
> [2] https://lore.kernel.org/linux-mm/20140102203320.GA27615@linux.vnet.ibm.com
> 
> # Now, let's take a look at the bug I've been investigating
> 
> There were two bugs [3] [4] reported, with symptoms that appear to be
> caused by slab returning wrong metadata (the symptoms: incorrect
> reference counting of obj_cgroup, integer overflow as more memory is
> uncharged than charged).
> 
> [3] https://lore.kernel.org/lkml/ca241daa-e7e7-4604-a48d-de91ec9184a5@linux.ibm.com
> [4] https://lore.kernel.org/all/ddff7c7d-c0c3-4780-808f-9a83268bbf0c@linux.ibm.com
> 
> Hmm, if it's returning wrong metadata, how could that happen?
> 
> Well, perhaps it's either 1) the calculation of metadata address is
> incorrect, or 2) reading the metadata itself is racy.
> 
> Shakeel Butt pointed out [9] that there's a potential memory ordering
> issue. It suggests that no enforced ordering between slab->obj_exts
> and slab->stride can make the metadata address calculation incorrect.
> 
> [9] https://lore.kernel.org/lkml/aZu9G9mVIVzSm6Ft@hyeyoo
> 
> Let's say CPU X and Y are allocating/freeing slab objects from/to
> the same slab. They need to access metadata for the objects:
> 
> CPU X				CPU Y
> 
> // CPU X allocates metadata array
> - slab->obj_exts = <the address of the metadata array>
> - slab->stride = 16 (sizeof struct slab)
> 
> - stride = plain load slab->stride
> - obj_exts = READ_ONCE(slab->obj_exts)
> - if (obj_exts)
>     - metadata_addr =
>       stride * index + obj_exts
> 				- stride = plain load slab->stride
> 				- obj_exts = READ_ONCE(slab->obj_exts)
> 				- if (obj_exts)
> 				  - metadata_addr = stride * index +
> 						    obj_exts
> 
> 				// Wait, obj_exts is non-NULL,
> 				// but slab->stride is stale!
> 
> 				// Now, metadata_addr is wrong.
> 
> Hmm, this could definitely happen when two CPUs try to allocate/free
> objects from/to the same slab. We need to make sure that, CPUs cannot
> see stale slab->stride as long as slab->obj_exts is not NULL.
> 
> # How I tried to fix it
> 
> An expensive solution would be do:
> 
> CPU X:					CPU Y:
> - slab->stride = 16			- READ_ONCE(slab->obj_exts)
> - smp_wmb()				- if (obj_exts)
> - slab->obj_exts = <something>		  - smp_rmb()
> 					  - plain load slab->stride
> 
> Then, CPU Y should see either (obj_exts == 0), or
> (obj_exts != 0 and a valid stride). (obj_exts != 0) && (invalid stride)
> is impossible.
> 
> This fix [5] seems to resolve the bug [6], yay!
> 
> Before testing this fix, I wasn't fully convinced that it was a memory
> ordering issue. But after testing it, it seems reasonable to assume that
> it's indeed a memory ordering issue.
> 
> [5] https://lore.kernel.org/linux-mm/aZ2Gwie5dpXotxWc@hyeyoo
> [6] https://lore.kernel.org/linux-mm/84492f08-04c2-485c-9a18-cdafd5a9c3e5@linux.ibm.com 
> 
> # How I tried to optimize the fix
> 
> Hmm, but it's not great to have memory barriers in slab alloc/free
> path, right? So I tried to optimize it while maintaining correctness.
> 
> Previously, slab->stride could be set during slab's initialization
> by alloc_slab_obj_exts_early(), or later by alloc_slab_obj_exts().
> 
> Within the slab allocator, for the slab to be accessible by other CPUs,
> they need to go through per-node partial slab list
> (struct kmem_cache_node.partial), protected by a spinlock.
> 
> Hmm, if we make sure that slab->stride is set early, before the slab
> becomes accessible to other CPUs, smp_wmb()/smp_rmb() pair is not
> necessary. So I made that change [7].

So in [7], you moved slab_set_stride() before the store to slab->obj_exts.
Both of them are done without any markers for racy memory accesses.

Moving plain stores around in the C source code does have no effect WRT
the ordering of those accesses.

To guarantee the store to slab->obj_exts to happen after the effect of
slab_set_stride(), you need to do:

     -         slab->obj_exts = obj_exts;
     +         smp_store_release(&slab->obj_exts, obj_exts);

Also, the reader side also needs (in slab.h):

               smp_load_acquire(&slab->obj_exts);
               READ_ONCE(&slab->stride);

This pattern is known as MP (Message Passing).

Please have a look at section "Message passing (MP)" in
tools/memory-model/Documentation/recipes.txt, whose leading
paragraph starts like so:

    The MP pattern has one CPU execute a pair of stores to a pair of variables
    and another CPU execute a pair of loads from this same pair of variables,
    but in the opposite order.  The goal is to avoid the counter-intuitive
    outcome in which the first load sees the value written by the second store
    but the second load does not see the value written by the first store.
    In the absence of any ordering, this goal may not be met, as can be seen
    in the MP+poonceonces.litmus litmus test.  This section therefore looks at
    a number of ways of meeting this goal.

The RELEASE:ACQUIRE pare is needed because your fast path is not
protected by any lock and can see any intermediate states of concurrent
updates done under the lock protection.

Hope this helps.

Thanks, Akira

> 
> But something strange happens when I tried to optimize it!
> The fix didn't resolve the bug [8].
> 
> [7] https://lore.kernel.org/linux-mm/20260223075809.19265-1-harry.yoo@oracle.com 
> [8] https://lore.kernel.org/linux-mm/2d106583-4ec6-4da0-87ea-4ecad893b24f@linux.ibm.com
> 
> Hmm... even when slabs don't go through the list protected by the
> spinlock, perhaps an object was allocated on CPU X, and then freed
> on CPU Y?
> 
> But as long as "Slab's assumption" described above is satisfied,
> I can't explain why stores to slab->stride, or metadata won't be visible
> to the freeing CPU :/
> 
> That makes me wonder "is somebody breaking that assumption?"
> 
> If so, the smp_rmb() in the previous fix [5] might have unintentionally
> acted as a band-aid to make sure stores to slab->stride and the metadata
> are visible to the freeing CPU. But in fact, a barrier should have
> been invoked by the user.
> 
> Looking at commit 9e6b7cd7e77d ("tty: fix data race in
> tty_buffer_flush") and commit f57e515a1b56 ("kernel/pid.c: convert
> struct pid count to refcount_t"), it doesn't seem too crazy to suspect
> that somebody is breaking the assumption.
> 
> Does this sound reasonable, or am I missing something?
> 
> p.s., Many thanks to Pedro Falcato and Vlastimil Babka, who actively
> discussed this off-list with me. That helped develop my understanding
> a lot!
> 
> -- 
> Cheers,
> Harry / Hyeonggon

