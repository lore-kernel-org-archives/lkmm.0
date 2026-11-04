Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753471;
	b=OWkUYVCArND1lGjync/GgvgXKBDf9T5/OhiZ9/aYaqwlFntKSfzWwghmQShRegSFtSg5
	 vf8KY1AThn1bDicGX34Xl1iZ7U07o2ufY7LnBfndJMFVuce6TdB0rXSzZiosIBRXp9qN2
	 8DyGbCKX8nd3RPS/VCmTZ3v+h/XfiCGyeA0Cq0oPJhxMaZZQ6NyKWlQ8r17+Vjg2T3lY3
	 /6veJN+dtn7Hw8PEymOBN6RD5KIfnnO/j5rhG/chIx4m+DeUacmhklQoYOp+KOAwPfJiW
	 mgIwQMbSHISxiPmSInQBekYnYFNkBorSbh7EMs28KZ34QTemS7GpzNanHQQS61VJiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753471;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Description:
	 Content-Disposition;
	bh=g2vFMfll/yEzRavIYm6DmcdOnQjtpS3Vbok6gpCPUEY=;
	b=tG5a+NdTGJYnT9Bt6bhdxvX9+/PHCJktvGh012E9U02oLj+xcUylnTMCZpeEZESkzLIl
	 3jQGdXe/aC4cuF91Ox3Oj6M7OuGMFhcyASIHihOPo//CHtMXJZ4hxai34Z4DDigg+/T3U
	 aHwBhrwtpsSK3PzCVWGOGZSO0R50IIw4g8HMjCUZLkscMuBtt4etI4ndj9YmAlPhD01mc
	 ohYcUMgF3Jdyqs7MCEPxcS4+Z6gq9RdRE10IJBfuYuZAmqPsxlxda0pKS0HZNVWe1f6sp
	 ZL+0KetyzjoD5TQvBbgfZEV8gEpcBZgk4zDBnNoayFjbbn7+b4zhFAbE5c9yWSWEWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AXdaKSE7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052A606A326
	for <lkmm@lists.linux.dev>; Wed,  4 Nov 2026 00:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4052A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AXdaKSE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793753469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2vFMfll/yEzRavIYm6DmcdOnQjtpS3Vbok6gpCPUEY=;
	b=AXdaKSE7V6ZcLsM1kY5/CQQPP4gjJSmPUlRxqr+BS/LYcBxAYnok7X/tuUyjvPBY6oMx/L
	UF/lBCn/jdzUfbwjN95S/e5AohkbZLdaxPDpFUZdR1HmesYGDI7H6u/exI3evjx1znVFJB
	YPPznvKlL/CvnS5+VqDy6zlx/f097q0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-l9ybQsndPrSJPPBB55CFWg-1; Tue, 03 Nov 2026 19:51:08 -0500
X-MC-Unique: l9ybQsndPrSJPPBB55CFWg-1
X-Mimecast-MFC-AGG-ID: l9ybQsndPrSJPPBB55CFWg_1793753467
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b1bf297a3cso17816067b3.1
        for <lkmm@lists.linux.dev>; Tue, 03 Nov 2026 16:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753467; x=1794358267;
        h=in-reply-to:content-disposition:content-description:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2vFMfll/yEzRavIYm6DmcdOnQjtpS3Vbok6gpCPUEY=;
        b=cENO0dY55ZrSZicHzvjfdFmRNbRH7J/Tc7hXL2kZUSPpGx9op2vPLr4Y+727YCh6d5
         fNLOjQ6vtEtFPbOzJ9au0H+h5uVmEVHMulmaTkp8VsShQftz1ds3YysnETUxjwz2D0OI
         YJBfe7aFNkkh+LWqjB6q/mRHXcFBnAYQYdpERYItxaGV6b0ZEKXVURN7o1J1OqSWvLVq
         M5SqoKwU6wpLkhYKUV7ja11w2XIUuB/b3B7DtnHlrgE5YQItNu79J7lLpQyc5jgpxrpW
         rvQ4xV1P19FIj5LbZ9UbdLY7bpiCCL7F2di2urLe8X/Zi81YZe56bLKQeUyKWc6sfCME
         SeNQ==
X-Forwarded-Encrypted: i=1; AKwUvByrdNFxQwJOO66kOgGVQZUwZtkzv8Pa65kUzpyUHGIM7dRxu6f0SjGAlFzEIfMMHdofEMCe@lists.linux.dev
X-Gm-Message-State: APuU4Z8kRmr4eCjYIIbPon/lX42S+IDspcO+ZloZoa59RjYijyoB7uD+
	9klzM9QKVJOEF6A9k/TOwOcA4p09oADBEDj8MY7UGw0S0zVghH1W1Or/itPwX0mbOzrOO5XWS2P
	aCnmFzfpDPDN371BRaXnzEbwh+5SvgJ/ijrRwSfTYkPlxIb5Ohul0jDg=
X-Gm-Gg: AYBFou2rbdgbX4ZuVknjpKExM/NalmVw0dTG4+EWDN8ZwYOEelfDIfLDlMoWkYHudmt
	td7Gdix+RFBNbS+t7I8KC8O1yuxCPKGiYbn/Pfztjtw3Bx/laekYZzBL2/cwhvUzvwrRogJEfDl
	HoLb+eFuSfBl07nhLF4XF5fYntAorVYOIGMUD14baDGdUGUSwN0KQgmLw3Bf6bFDmoI0hdXnwgm
	M6pXAZt5zE4lQCCJmyNgckB1b/H/MYPXP2SzCwyyqhL9aI7yQGN9J/DX0T1NzonpNhV9Il6mwjL
	8OH04VWJeh6WEDhKIjIinX1MtYaytHce6zQmH72pn9Cu8pPKSS6q/4HRJZ3EjqK+Whp8+CdzZsd
	7prDyAfrSo6TZJIWx2k/EOumYEB2S2Rc8996OPVN/BJ7cZ4IofGnwpcLnuyD2ZBLOkrSa5jemk9
	KGDr0qB8LhirR2cQgLSg==
X-Received: by 2002:a05:690e:4390:b0:679:b0db:fa80 with SMTP id 956f58d0204a3-67ba501859fmr6980294d50.34.1793753467305;
        Tue, 03 Nov 2026 16:51:07 -0800 (PST)
X-Received: by 2002:a05:690e:4390:b0:679:b0db:fa80 with SMTP id 956f58d0204a3-67ba501859fmr6980277d50.34.1793753466637;
        Tue, 03 Nov 2026 16:51:06 -0800 (PST)
Received: from localhost (pool-96-230-193-249.bstnma.fios.verizon.net. [96.230.193.249])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee24498dsm524359d50.10.2026.11.03.16.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:51:05 -0800 (PST)
Date: Tue, 3 Nov 2026 19:51:04 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Paul E. McKenney" <paulmck@kernel.org>, 
	NeilBrown <neil@brown.name>, Alexander Larsson <alexl@redhat.com>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, lkmm@lists.linux.dev
Subject: Re: [PATCH 4/9] fs: unmount without a grace period when nothing else
 holds the mounts
Message-ID: <aup-0JQkE0sYoCpd@echanude.csb>
References: <20261012-work-mount-gp_on_demand-proposal-v1-0-43f60221a7d0@kernel.org>
 <20261012-work-mount-gp_on_demand-proposal-v1-4-43f60221a7d0@kernel.org>
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Post: <mailto:lkmm@lists.linux.dev>
List-Help: <mailto:lkmm+help@lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:lkmm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261012-work-mount-gp_on_demand-proposal-v1-4-43f60221a7d0@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _D511K3GjnGFSipNb9n5Xo2A5Tt5QhYMpGwfDii7vGk_1793753467
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Description: 
Content-Disposition: inline

On Mon, Oct 12, 2026 at 05:39:17PM +0200, Christian Brauner wrote:
> Currently namespace_unlock() always waits for an RCU grace period
> before it drops the references of the mounts that umount_tree()
> unmounted. The grace period is needed for two reasons:
> 
> (1) mntput_no_expire() decrements the count without mount_lock as long
>     as it sees a non-NULL ->mnt_ns under rcu_read_lock(). That only
>     works because the mount's own reference isn't dropped until an RCU
>     delay after ->mnt_ns has been cleared.
> 
> (2) __legitimize_mnt() speculatively bumps the count of a mount during
>     rcu lookup and drops it again under mount_lock when it realizes the
>     seqcount has changed or the mount is doomed.
> 
> Without the grace period a decrement or an increment of an rcu lookup
> could land after the final mount put has summed up the counters and end
> up leaking the mount. Or the task in rcu lookup would end up shutting
> the filesystem down instead of task which called umount(2) causing
> spurious EBUSY errors.
> 
> The grace period is rather expensive though. Neil switched it to
> synchronize_rcu_expedited() in commit 22cb7405fada ("VFS: use
> synchronize_rcu_expedited() in namespace_unlock()") because 5000
> unmounts took 100 seconds with normal grace periods. But an expedited
> grace period still IPIs every CPU. On a reasonably beefy 64 vcpu VM
> that's 20 to 31 microseconds for every namespace_unlock(). That's two
> thirds of the teardown of a detached single mount and half of a mount
> and unmount pair.
> 
> We've tried a few things to get rid of it. For example, handing a lazy
> unmount to a workqueue after the grace period (cf. [1]). But that
> changes uapi. Today every mount that nobody else references is torn
> down before umount(2) returns, lazy or not, because the puts are done
> from the calling task. The deferred variant broke LTP which reuses its
> loop devices right after a lazy unmount, and mkfs corrupted an ext4
> image while the filesystem was still being torn down from the
> workqueue. I also tried sampling the grace period state in
> umount_tree() and polling it in namespace_unlock() but that didn't help
> as the two are only microseconds apart.
> 
> But we can elide the grace period in a lot of cases. In commit
> 7eb84d54fac5 ("fs: don't let a migrating task hide its reference from
> do_umount()") I split the per-cpu reference count into gets and puts
> and the puts are summed before the gets. So the increment from rcu
> lookup in __legitimize_mnt() is either visible to the sum or rcu lookup
> sees the seqcount bump of the unmount and drops its reference under
> mount_lock.
> 
> IOW, if the sum under mount_lock comes out as one after the mount has
> left its namespace then it's the mount's own reference. No holder can
> be on the fast path of mntput_no_expire() with a reference to it, no
> rcu lookup holds a reference to it, and nobody can find it anymore. So
> it is safe to drop that reference and put the mount without waiting for
> a grace period. Mounts that are still held wait for the grace period as
> before.
> 
> The fast paths of mntput_no_expire() and __legitimize_mnt() don't need
> to be changed and nothing changes for path lookup. Nothing changes for
> userspace either.
> 
> The unheld mounts of a batch are finished under mount_lock and the held
> ones share a single grace period. Finishing all of them under one
> mount_lock hold took a namespace death from 62.9 to 49.9 us in
> namespace_unlock() and gave the 8 worker variants of the dissolve modes
> another 4 to 7%. But every peek sums up the counters of all possible
> cpus and path walks spin on mount_lock while it's held. So we finish at
> most 16 mounts per hold.
> 
> umount-bench, kops/s, median of 15 runs on a 64 vcpu VM, base against
> the full series, 1 and 8 workers:
> 
>     mode                  base            full            delta
>     mountumount 1w / 8w   26.1 / 75.4     57.1 / 125.5    +118% / +66%
>     dissolveone 1w / 8w   38.2 / 108.5    170.6 / 173.4   +347% / +60%
>     dissolveflat 1w       15.5            22.4            +45%
>     dissolvechain 1w      15.7            22.4            +43%
>     nsdeath 1w            6.15            7.10            +15%
>     detachlocked 1w       2.72            3.22            +18%
>     lazytree 1w           2.93            3.11            +6%
>     held modes            14.8-17.4       +1 to +4%       level
> 
> For a namespace death the synchronize_rcu_expedited() (30.9 us) is gone:
> 
> - namespace_unlock() goes from 93 to 61 us
> - the slow path's 54 us are replaced by mntput_final_locked() at 5.8 us
> 
> Propagating a tree of 128 mounts into 1000 mount namespaces, median of
> 14 runs:
> 
> - mount and umount propagation stay level within 1%
> - releasing the namespaces is 5-10% faster
> 
> Mounting, statting and unmounting in a loop with 8 threads for 20s:
> 
> - overlay is 82-87% faster (292k -> 528-544k ops)
> - casefolded tmpfs is 24-26% faster (433k -> 539-545k ops)
> 
> The gain grows with the number of cpus the expedited grace period has to
> IPI. Single worker, base against this series, median of 9:
> 
>   vcpus            1     8    16    32    64   128   256   512
>   mountumount    +30%  +44%  +63%  +92%  +83%  +93%  +71%  +75%
>   dissolveone    +86% +130% +183% +293% +224% +242% +155% +149%
> 
> Above 64 vcpus the per-cpu sums start to dominate a namespace death. At
> 512 vcpus 521 of the 676 us it spends in namespace_unlock() are the
> sixty mnt_get_count() sums and 118 us are the grace period. So the
> multi-mount modes only gain 10 to 27% there. Held mounts stay within a
> few percent everywhere because they still wait for their grace period.

I tried this series in the crun case used with the first attempt[2] and
was surprised it still hit the slow path early on. The container runtime
(crun) does a double clone to set up the container. A transient process
makes a detached mount namespace clone and passes it to the second clone
(the container init). In traces it looks like:
1. open_tree(dirfd, OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC)
2. execveat(clone_fd, "<init>", ...)

The exec path opens the init binary via do_open_execat() which traverses
the clone vfsmount and takes a ref in do_dentry_open() with bprm->file.
It then ends up in begin_new_exec()->do_close_on_exec() and closes
O_CLOEXEC clone fds, which triggers dissolve_on_fput(). At that point
though, bprm->file's ref is still held, so mntput_unmounted() sees
count=2 and falls back to the slow-path with
synchronize_rcu_expedited().

I think the RCU grace period can be skipped here?

Path walkers will reach mounts using the mount hashtable under RCU. A
clone that hasn't been move_mount into a real namespace has not been
through make_visible(), so it wasn't added to the hashtable. There is no
path walker that can hold a ref to it. All refs beyond the alloc ref are
from holders like bprm->file, which will release via normal ref
counting.

I tried adding a mount-flag and to skip that last
synchronize_rcu_expedited() with crun:

Without the patch:
# perf stat -r 50 --null -- crun run test
 Performance counter stats for 'crun run test' (50 runs):
       0.032681821 +- 0.000928967 seconds time elapsed  ( +-  2.84% )
With the patch:
# perf stat -r 50 --null -- crun run test
 Performance counter stats for 'crun run test' (50 runs):
       0.025248765 +- 0.000809740 seconds time elapsed  ( +-  3.21% )

[2] https://lore.kernel.org/all/20230119205521.497401-1-echanude@redhat.com/

--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1104,6 +1104,7 @@ static void make_visible(struct mount *mnt)
 	struct mount *parent = mnt->mnt_parent;
 	if (unlikely(mnt->mnt_mountpoint == parent->mnt.mnt_root))
 		parent->overmount = mnt;
+	mnt->mnt.mnt_flags |= MNT_WAS_HASHED;
 	hlist_add_head_rcu(&mnt->mnt_hash,
 			   m_hash(&parent->mnt, mnt->mnt_mountpoint));
 	list_add_tail(&mnt->mnt_child, &parent->mnt_mounts);
@@ -1550,8 +1551,19 @@ static void mntput_unmounted(struct hlist_head *head)
 		if (!synced) {
 			if (mntput_unheld(m))
 				continue;
-			synchronize_rcu_expedited();
-			synced = true;
+			/*
+			 * Path walkers reach mounts through the mount hashtable under RCU.
+			 * If a mount is never hashed (e.g. an anon-ns never
+			 * move_mount into a namespace) it cannot be seen by
+			 * any RCU path walker.
+			 * So we can skip the grace period before dropping the ref.
+			 * Remaining refs are from explicit holders (e.g.
+			 * exec bprm->file) and will release their ref directly.
+			 */
+			if (m->mnt.mnt_flags & MNT_WAS_HASHED) {
+				synchronize_rcu_expedited();
+				synced = true;
+			}
 		}
 		mntput(&m->mnt);
 	}
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -44,6 +44,7 @@ enum mount_flags {
 	MNT_LOCKED		= 0x800000,
 	MNT_DOOMED		= 0x1000000,
 	MNT_SYNC_UMOUNT		= 0x2000000,
+	MNT_WAS_HASHED		= 0x4000000, /* was ever in mount hashtable */
 	MNT_UMOUNT		= 0x8000000,
 
 	MNT_USER_SETTABLE_MASK  = MNT_NOSUID | MNT_NODEV | MNT_NOEXEC
@@ -52,7 +53,8 @@ enum mount_flags {
 	MNT_ATIME_MASK = MNT_NOATIME | MNT_NODIRATIME | MNT_RELATIME,
 
 	MNT_INTERNAL_FLAGS = MNT_INTERNAL | MNT_DOOMED |
-			     MNT_SYNC_UMOUNT | MNT_LOCKED | MNT_UMOUNT
+			     MNT_SYNC_UMOUNT | MNT_LOCKED | MNT_UMOUNT |
+			     MNT_WAS_HASHED
 };
 
 struct vfsmount {


Best,

> 
> [1]: https://lore.kernel.org/all/20250408210350.749901-12-echanude@redhat.com
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Link: https://lore.kernel.org/r/20261012-work-mount-gp_on_demand-proposal-v1-4-43f60221a7d0@kernel.org
> ---
>  fs/namespace.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 79 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 8c6673bd8c03..435e5f6db880 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1489,10 +1489,12 @@ static void mntput_no_expire(struct mount *mnt)
>  		 * Since we don't do lock_mount_hash() here,
>  		 * ->mnt_ns can change under us.  However, if it's
>  		 * non-NULL, then there's a reference that won't
> -		 * be dropped until after an RCU delay done after
> -		 * turning ->mnt_ns NULL.  So if we observe it
> -		 * non-NULL under rcu_read_lock(), the reference
> -		 * we are dropping is not the final one.
> +		 * be dropped until after turning ->mnt_ns NULL and
> +		 * either an RCU delay or a look under mount_lock
> +		 * that found it to be the only one left, which it
> +		 * isn't while ours is counted (mntput_unheld()).
> +		 * So if we observe it non-NULL under rcu_read_lock(),
> +		 * the reference we are dropping is not the final one.
>  		 */
>  		smp_wmb();	/* pairs with the smp_mb() in mnt_get_count() */
>  		mnt_dec_count(mnt);
> @@ -1504,6 +1506,75 @@ static void mntput_no_expire(struct mount *mnt)
>  
>  DEFINE_FREE(mntput_no_expire, struct mount *, if (_T) mntput_no_expire(_T))
>  
> +/*
> + * Drop the own reference of a mount that has left its namespace without
> + * waiting for a grace period. mnt_get_count() is biased towards gets,
> + * i.e., it overcounts rather than undercounts. So if the count under
> + * mount_lock is one we know its ours and we're going to drop it.
> + *
> + * Called under mount_lock, the cleanup of the mount is left to the caller.
> + * Returns false if somebody else still references the mount.
> + */
> +static bool mntput_unheld(struct mount *mnt, struct list_head *shrink)
> +{
> +	VFS_BUG_ON(mnt->mnt_ns);
> +	if (mnt_get_count(mnt) != 1)
> +		return false;
> +	mnt_dec_count(mnt);
> +	mntput_final_locked(mnt, shrink);
> +	return true;
> +}
> +
> +/* peeks per mount_lock hold, pathwalks spin while it is held */
> +#define MNTPUT_UNMOUNTED_BATCH 16
> +
> +/*
> + * Put the mounts umount_tree() collected. Ideally, every mount just has a
> + * single reference count which means that we can elide the grace period.
> + * We batch mntput_unheld() as mnt_get_count() needs to sum over every cpu.
> + * On big machines it's not that fast. If there are mounts with held references
> + * we need the grace period.
> + */
> +static void mntput_unmounted(struct hlist_head *head)
> +{
> +	struct hlist_node *p;
> +	struct mount *m;
> +	HLIST_HEAD(held);
> +
> +	while (!hlist_empty(head)) {
> +		unsigned int n = 0;
> +		HLIST_HEAD(unheld);
> +		LIST_HEAD(shrink);
> +
> +		lock_mount_hash();
> +		hlist_for_each_entry_safe(m, p, head, mnt_umount) {
> +			hlist_del(&m->mnt_umount);
> +			if (mntput_unheld(m, &shrink))
> +				hlist_add_head(&m->mnt_umount, &unheld);
> +			else
> +				hlist_add_head(&m->mnt_umount, &held);
> +			if (++n == MNTPUT_UNMOUNTED_BATCH)
> +				break;
> +		}
> +		unlock_mount_hash();
> +		shrink_dentry_list(&shrink);
> +
> +		hlist_for_each_entry_safe(m, p, &unheld, mnt_umount) {
> +			hlist_del(&m->mnt_umount);
> +			mntput_queue_cleanup(m);
> +		}
> +	}
> +
> +	if (hlist_empty(&held))
> +		return;
> +
> +	synchronize_rcu_expedited();
> +	hlist_for_each_entry_safe(m, p, &held, mnt_umount) {
> +		hlist_del(&m->mnt_umount);
> +		mntput(&m->mnt);
> +	}
> +}
> +
>  void mntput(struct vfsmount *mnt)
>  {
>  	if (mnt) {
> @@ -1527,7 +1598,9 @@ EXPORT_SYMBOL(mntget);
>  /*
>   * Make a mount point inaccessible to new lookups.
>   * Because there may still be current users, the caller MUST WAIT
> - * for an RCU grace period before destroying the mount point.
> + * for an RCU grace period before destroying the mount point, unless
> + * it finds under mount_lock that it holds the only reference left,
> + * see mntput_unheld().
>   */
>  void mnt_make_shortterm(struct vfsmount *mnt)
>  {
> @@ -1782,8 +1855,6 @@ static void free_mnt_ns(struct mnt_namespace *);
>  static void namespace_unlock(void)
>  {
>  	struct hlist_head head;
> -	struct hlist_node *p;
> -	struct mount *m;
>  	struct mnt_namespace *ns = emptied_ns;
>  	LIST_HEAD(list);
>  
> @@ -1814,12 +1885,7 @@ static void namespace_unlock(void)
>  	if (likely(hlist_empty(&head)))
>  		return;
>  
> -	synchronize_rcu_expedited();
> -
> -	hlist_for_each_entry_safe(m, p, &head, mnt_umount) {
> -		hlist_del(&m->mnt_umount);
> -		mntput(&m->mnt);
> -	}
> +	mntput_unmounted(&head);
>  }
>  
>  static inline void namespace_lock(void)
> 
> -- 
> 2.53.0

-- 
Eric Chanudet

