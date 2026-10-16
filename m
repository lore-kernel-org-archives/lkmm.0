Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69DC44C658
	for <lkmm@lists.linux.dev>; Fri, 16 Oct 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139810; cv=pass; b=o3/efCiPYhGggZQgn6GpmsbaOsguAOEanFfQspXPIC4qPve81h2puSrxX1Tt2sW0OZj0nB+nsXdNcFL4zo2L3pd8mCUWagFzNmE5ARcp6NbJHZSDfN6h5g0AsqxC8c1Yy2xoqJd/wJgTKcZ1Tzta7JOPHZUnrEOVpetxeZftm1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139810; c=relaxed/simple;
	bh=YGxrPNmKo+Cu2MYeesggWlBjJm+RWBe5YXtDpPU+Wk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhRZIIHgUfMo7GoyJebFxvW05//fNgXlfUMHbqvdl0HdPSwOcdxyJQFhBdn6GnK/Eu3mmX5jAou3fwFLzDuBGgFOgA7Yg8ZBt3r28hLWKDwMyBl/DqSll69x1M0QryWk+qY6HsGEQuWdvm2hTwnDNnZLA9zHkaGMlIDmT/xe/lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3X8aows; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3X8aows"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3fd91337baso183170766b.3
        for <lkmm@lists.linux.dev>; Fri, 16 Oct 2026 01:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792139804; cv=none;
        d=google.com; s=arc-20260327;
        b=NxCiAL3xEDowk7aXOKMGrmC8iuZQYTV4ovOY7RAhrIrgBVZuFOMYk0iDFMceNt1Qxl
         zy1ChjSTldXVi7Z3BNqGqa06WYtwqx2HeOIO3dkqoU3SWAhZOPtYqp8+0KAnsDg/MtzH
         FvXctb/vt2JajMfJnV2ZPLs+It7FzV90dGvtP/3kVQ1DXCqE0HgPxjWbm8pAMugPEbS3
         z9vFaS0dNnZOPr3V1lTB7TkRjpyOctrBhuCU0AnchtPrQ6M3qqhEmJMS1vdcDsYfDV2g
         HebD98e0ymSwk8a7FB9SJQr1gDwM7EjZXnNwiLTKq55tWHJiH2w5IMRc9vZQPziencbF
         t+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        fh=+C3q2R1/9rSB+0SrhkQ4Sv0N9YdjDm2z8nwQ9PcZKD0=;
        b=J7QJGYFZzKggA+DOxlfVwVsaNhUACNGwoI5YALQZR/85vtnbm5xkBPwkHn5x1GRFl6
         qL4+wcENR2kc1y9Gi72xBvzZlKn+0jb8S1G4a6TCThhxkXIYVtTGdIw0vTmzQfKenSeh
         ET2IYnYS945YVRctyKSjSSpo52HPy7MvCClSPmSAFms2mmPosn8hN5V0yajUNCAhegg+
         hojim67kQgqsfUnLvsGpTGoBZYJ1YQhmxvwTAp8X7yZ555gQgfuac5wdJhkJCveePlBJ
         8mZk6vDRYeEG7dGPhM3z8D6I68JDfHTo8USx9teuv75LH2dQWjTpk0B8VWMZR5xwyd4a
         /aTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139804; x=1792744604; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        b=A3X8aowsN/xMriiuC771bBUlWezDVajs6HuRJLsSrl9xSRtS8UrJDD3dRwsCY8yObK
         YfbwjP6wqPFJZGirfRKcvfDYd12iMdA0YRM/7pwD/IkYw+HS53Lnr3fcJF/oPel75NX7
         gjuQ7HqHbYit2XEuxMmumheofOzTeNADXLdEJJZvN7kCa14CxJoMaSbvdmIykHmYQwfl
         VY7mBjQGnhsi7d4lnpeYrKkfnne4XDF6yeXqjanK5sl+GcD+UY7bdaY1WWtHDqhTuWIy
         TXl4ZMREQVxaV1NBkBcNjEiMJWZ7IAiGv6RsksPbEocJhr6S/lSRxmkJgAYd2EtF4kF+
         j/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139804; x=1792744604;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ko2nFEKzryM0Joy0DntqtRQJcRZwX6j2MQIGWblaJQ0=;
        b=JcGcZ27Wia0XXJAVY+N/7pV5lLEWKRVJoNGkE1JohefoepavQKdlcy654XEzrRD+OV
         E3zwkHLfO5vkbUB/rlsnwXfU7RRKGXO5gdgujfVwdXlof7KfY4zoQQEjTiDhID9ml1RD
         7ZCAsfeRtTSfF5UYf3ngfy9c6fEb92YzPRr9WP7pkK2PC/mLm1+twUqZJOkDNgbm152o
         Z4qyjLT0rj58FUe2en0mfaSBXkD204e+zzr0hosadWgLUEmSyEBq1/X/VgsUry0BntSm
         QqOZ1C3loE2cJhSOkcHxHbrwSo2qJ8zw+k3TWDz71yLQ5miJOe0k+6OJ4RGI4QYN56h5
         cFoA==
X-Forwarded-Encrypted: i=1; AKwUvByWDCiGxeow+OHX9TdpbZ3wSjfE9Vj7mG5U1r1+GNsmXce8uRN8FFiQVjH1oCmW4hXFNvkJ@lists.linux.dev
X-Gm-Message-State: AFq9FYIbZDjAlKZF60eCPrvrmRCvS5HppdKoqFmfXH3vBHuCLy5C5PUd
	IKMkSqETHjiUBJO+l25PplnvK/EdPC2xnO3xwO9hvIzuRxQL96F/3S4UckG7ZiL3zHAtlkjTaGu
	sds8l1RYQBl6SWVyxmYsGWTmoLCc9SHM=
X-Gm-Gg: AYBFou0uDEckG8izhcyrg1lJSqRk+iC/+f9htS9wdQ5uabey8CxYtgUSZHgaRYZQpj/
	j+aDMZOG/EWIh8xz+LpYfAsVexyx5l723Gcph8zx6Mq9G4O8s0ByD/ASnsq3Vg+z1A19bnCHu7G
	s6BlWRwluxZ5JMyzRASLyh0Bvc71DJcmphbW2fy/Mqxy0JS/poWNxbUoQyKmDa1EEJLxe2nq+ep
	6d3m8CKbr7JCMh9+Is1BPZfL9l+jhDsffDFysb25nR+GJXQVDw0XW6mhhJD0zjrMbQ8Hb57K8gF
	YxZ/hXS1Gq9fJIxHofKeGJQUhKlfUhyLR2bQJaf+J8xHPLbhmFpEK/w/
X-Received: by 2002:a05:6938:a082:10b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c3ef39b2474mr293285166b.0.1792139803822; Fri, 16 Oct 2026
 01:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011194902.97364-1-mathieu.desnoyers@efficios.com> <20261011194902.97364-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261011194902.97364-3-mathieu.desnoyers@efficios.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 16 Oct 2026 16:36:31 +0800
X-Gm-Features: AclHuK999gbk47tvgPj7S_99XIxJx7kM0oNSpmR7D65tPGL3PLvLQleVMZhU9_g
Message-ID: <CAN_Opa_aBH0iP+q_GoG=2JhVaCpgu6_K5S7hPDhLQ4u1jw=jqg@mail.gmail.com>
Subject: Re: [PATCH hazptr v3 2/4] ptr_eq.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev, 
	Lian Wang <lianux.mm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

I checked both implementations of ptr_eq().

The x86 version uses inline asm for the comparison, so
the compiler cannot reason about it as an ordinary C
pointer comparison.

The generic version uses OPTIMIZER_HIDE_VAR() before
the comparison to prevent the compiler from propagating
the original pointer values through it. I verified this
with GCC 13.3 on ARM64: the generated code uses the
second load's result for the dependent access, rather
than reusing the first load's result.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

Thanks,
Kunwu

On Mon, Oct 12, 2026 at 3:49=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Compiler CSE and SSA GVN optimizations can cause the address dependency
> of addresses returned by rcu_dereference to be lost when comparing those
> pointers with either constants or previously loaded pointers.
>
> Introduce ptr_eq() to compare two addresses while preserving the address
> dependencies for later use of the address. It should be used when
> comparing an address returned by rcu_dereference().
>
> This is needed to prevent the compiler CSE and SSA GVN optimizations
> from using @a (or @b) in places where the source refers to @b (or @a)
> based on the fact that after the comparison, the two are known to be
> equal, which does not preserve address dependencies and allows the
> following misordering speculations:
>
> - If @b is a constant, the compiler can issue the loads which depend
>   on @a before loading @a.
> - If @b is a register populated by a prior load, weakly-ordered
>   CPUs can speculate loads which depend on @a before loading @a.
>
> The same logic applies with @a and @b swapped.
>
> The header "linux/ptr_eq.h" is the expected include target. It
> contains the documentation of the ptr_eq() API.
>
> An architecture specific implementation of the pointer comparison
> can be implemented by each architecture as asm/ptr_eq.h. The x86
> implementation is provided initially. If no implementation header is
> present for the architecture, an arch-agnostic fallback based on
> OPTIMIZER_HIDE_VAR is included from asm-generic.
>
> The arguments to ptr_eq() are const volatile to take advantage of
> implicit conversion that adds cv-qualifiers, which are thus added
> implicitly.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: John Stultz <jstultz@google.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Zqiang <qiang.zhang1211@gmail.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: maged.michael@gmail.com
> Cc: Mateusz Guzik <mjguzik@gmail.com>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: rcu@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: lkmm@lists.linux.dev
> Cc: Nikita Popov <github@npopov.com>
> Cc: llvm@lists.linux.dev
> Cc: Lian Wang <lianux.mm@gmail.com>
> Cc: Kunwu Chan <kunwu.chan@gmail.com>
> ---
> Changes since v2:
> - Rename ptreq.h to ptr_eq.h (x86, asm-generic and linux headers).
>   Adapt the include guards accordingly.
>
> Changes since v1:
> - Move to linux/ptreq.h, implement x86-specific comparison
>   and asm-generic header (fallback).
>
> Changes since v0:
> - Include feedback from Alan Stern.
> ---
>  arch/x86/include/asm/ptr_eq.h | 16 +++++++++
>  include/asm-generic/Kbuild    |  1 +
>  include/asm-generic/ptr_eq.h  | 16 +++++++++
>  include/linux/ptr_eq.h        | 63 +++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 arch/x86/include/asm/ptr_eq.h
>  create mode 100644 include/asm-generic/ptr_eq.h
>  create mode 100644 include/linux/ptr_eq.h
>
> diff --git a/arch/x86/include/asm/ptr_eq.h b/arch/x86/include/asm/ptr_eq.=
h
> new file mode 100644
> index 000000000000..8e521cabe24b
> --- /dev/null
> +++ b/arch/x86/include/asm/ptr_eq.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_PTR_EQ_H
> +#define _ASM_X86_PTR_EQ_H
> +
> +#include <linux/types.h>
> +#include <asm/asm.h>
> +
> +static __always_inline
> +bool ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       bool ret;
> +       asm(__ASM_SIZE(cmp) " %1,%2" : "=3D@ccz" (ret) : "r" (a), "r" (b)=
);
> +       return ret;
> +}
> +
> +#endif /* _ASM_X86_PTR_EQ_H */
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index 2bc00c67dc54..86cee0dfd47f 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -47,6 +47,7 @@ mandatory-y +=3D percpu.h
>  mandatory-y +=3D percpu_types.h
>  mandatory-y +=3D pgalloc.h
>  mandatory-y +=3D preempt.h
> +mandatory-y +=3D ptr_eq.h
>  mandatory-y +=3D rqspinlock.h
>  mandatory-y +=3D runtime-const.h
>  mandatory-y +=3D rwonce.h
> diff --git a/include/asm-generic/ptr_eq.h b/include/asm-generic/ptr_eq.h
> new file mode 100644
> index 000000000000..2bd1c3b8a56f
> --- /dev/null
> +++ b/include/asm-generic/ptr_eq.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_GENERIC_PTR_EQ_H
> +#define __ASM_GENERIC_PTR_EQ_H
> +
> +#include <linux/types.h>
> +#include <linux/compiler.h>
> +
> +static __always_inline
> +bool ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       OPTIMIZER_HIDE_VAR(a);
> +       OPTIMIZER_HIDE_VAR(b);
> +       return a =3D=3D b;
> +}
> +
> +#endif /* __ASM_GENERIC_PTR_EQ_H */
> diff --git a/include/linux/ptr_eq.h b/include/linux/ptr_eq.h
> new file mode 100644
> index 000000000000..7a2bbf6e64b3
> --- /dev/null
> +++ b/include/linux/ptr_eq.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_PTR_EQ_H
> +#define _LINUX_PTR_EQ_H
> +
> +/*
> + * Compare two addresses while preserving the address dependencies for
> + * later use of the address. It should be used when comparing an address
> + * returned by rcu_dereference().
> + *
> + * This is needed to prevent the compiler CSE and SSA GVN optimizations
> + * from using @a (or @b) in places where the source refers to @b (or @a)
> + * based on the fact that after the comparison, the two are known to be
> + * equal, which does not preserve address dependencies and allows the
> + * following misordering speculations:
> + *
> + * - If @b is a constant, the compiler can issue the loads which depend
> + *   on @a before loading @a.
> + * - If @b is a register populated by a prior load, weakly-ordered
> + *   CPUs can speculate loads which depend on @a before loading @a.
> + *
> + * The same logic applies with @a and @b swapped.
> + *
> + * Return value: true if pointers are equal, false otherwise.
> + *
> + * The compiler barrier() is ineffective at fixing this issue. It does
> + * not prevent the compiler CSE from losing the address dependency:
> + *
> + * int fct_2_volatile_barriers(void)
> + * {
> + *     int *a, *b;
> + *
> + *     do {
> + *         a =3D READ_ONCE(p);
> + *         asm volatile ("" : : : "memory");
> + *         b =3D READ_ONCE(p);
> + *     } while (a !=3D b);
> + *     asm volatile ("" : : : "memory");  <-- barrier()
> + *     return *b;
> + * }
> + *
> + * With gcc 14.2 (arm64):
> + *
> + * fct_2_volatile_barriers:
> + *         adrp    x0, .LANCHOR0
> + *         add     x0, x0, :lo12:.LANCHOR0
> + * .L2:
> + *         ldr     x1, [x0]  <-- x1 populated by first load.
> + *         ldr     x2, [x0]
> + *         cmp     x1, x2
> + *         bne     .L2
> + *         ldr     w0, [x1]  <-- x1 is used for access which should depe=
nd on b.
> + *         ret
> + *
> + * On weakly-ordered architectures, this lets CPU speculation use the
> + * result from the first load to speculate "ldr w0, [x1]" before
> + * "ldr x2, [x0]".
> + * Based on the RCU documentation, the control dependency does not
> + * prevent the CPU from speculating loads.
> + */
> +
> +#include <asm/ptr_eq.h>
> +
> +#endif /* _LINUX_PTR_EQ_H */
> --
> 2.43.0
>
