Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DE24DCE6
	for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507175; cv=none; b=piwrm+/YEvXNKJCCYh0z9jfox/xVkZBK2DOReDrO3wtoEEUao1/hj/7EhxCjHNBbJudtvu9eWwLVaCi8L03kzTVnp80lHGtmyUCj17A00NKiyjmluqo9zE2MVJBOVn7n91yFW3Sktx5W8/xsgz/qOakCd4NMjlRfYXKbyquRZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507175; c=relaxed/simple;
	bh=/koeKlB/k0Uouo8pgg2T7oltVBCEzdoq4Vld2kRYayM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbFLbJzK4hetUPYct+m0UV+zzON/aa5CDJappt8MjwqzmlSi+fszdzVoo+P1dGKgxvmmnjSwk1GcT9iE4CRhQaQqSXN+LcmdlN4aF6ujQHVz5pFK70dgBlNR65YrRUrRPsrH9j5CDvzSuMVxfrQmQWloiAv1jw2QNTUOSo3n4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZsTGGt4; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZsTGGt4"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab380b8851so21866591cf.2
        for <lkmm@lists.linux.dev>; Mon, 14 Jul 2025 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507173; x=1753111973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MfFqiSzZREdMyVsNgIAfk4F76Kub2bUvM9+BkEQL8A=;
        b=aZsTGGt495MFl0vrz/4TTM1LOpKXQawn6n5yQxpc9IToujtrk6Lc7cqBzxwve1R+sF
         jenJi2h3tgcfzt2vaAiY5Jg5iKLV8ZIJx7o4R/ElA8mBK/NlwnGobufTsiNJzkt3ObN2
         2I1uv+LFVffwrVlNyh1J439eBt6GtGkVMQnhnFdaODBv07QJh+udHspupfx7lr9MTIqA
         XRabAafp2OCgPiYDFeMBOcqbpOgDoyTcZ+Y0WC2p8QqESQtJkU80AhJRjaxeM2jYLgYu
         vJS1d/wOduB6nQN/+9zaXjP/zgHnFBnEVk+Oru0H/kIzdxttODP3VdAYMuu/1OcmQxxw
         1G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507173; x=1753111973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MfFqiSzZREdMyVsNgIAfk4F76Kub2bUvM9+BkEQL8A=;
        b=IiZ3AAk76XHce+YM59czcswqweH8NlIdK6nn3kSBEu7YzYRhSEyzGTXd0WBGGnfVtF
         xn1DKNe2BI/cbudd+r0TrCN9X5i5BQb4AZOZomMceMgxSqAaRT1oWxeoI/jn260yAu4M
         aHac0mFlhZdbwZY5aUPEzmvYd8fLwhCvdH3CemC+7n2bJUrH3MZjHtTK7q2pb4UmZN9A
         jwZq/B4zsZq7SI5sTZhy+VB4sqXL+lnI49/xawSY9I6nh28MAleozYRin+nCAHnEACwV
         s8fgXoUjlvhlPxiC+7MSDigCmJp7Nw0K+AlNsZ/0Qf6s/PJNLzqGES8LPiq8YkGv3w+a
         0h/A==
X-Forwarded-Encrypted: i=1; AJvYcCUj2Vxpq0rz+hCzeVT3TXWfh1yB55BGI8oOYBkMpgRtSTwsx06gMlFddvKf3b3iKSzRWrSd@lists.linux.dev
X-Gm-Message-State: AOJu0YzObEBgZrCag9CTRhXq/t/cOGqBw7JE0nT1gdrF2Mz+FG9iASrB
	rZzR0uu4gkb4/AG9zkX1cD6I3ypFsyx889eGqJ75+0IupF9SPsEI3O5m
X-Gm-Gg: ASbGncu/bzmOYpQwiSKVHkI8gtKyDKL5+5FnhcDMW1Mc/uFVbxD4be1w86XgGuwxLgO
	gMTPgJUbotDGGkH58q6QV/qqX82kwOA6omeE34GrAVjZmE3YATCX3ajmieE/83kz+lzIjSBSJlz
	uNI2cw2lyfO1ahn/xh/5WUFauYEREXlxe7bLJflNVM29scX+OefZZRVe8A/+TX6Ohp+UcgOiAyt
	7DiXSO3krE1BtYpGVdTnd9+Zw6+Bsz3Qh3OQi6lyhKDcGJ5MBX1GWL4gzGxbhAffQq8Tanqqr86
	zd3Igdf1QnezLnFnpYeCG5siz4sFcPhsGTa/2vL6M8U6RvczdFWu0xuNaBcMNTUNI2nKNRwCoSs
	9sZYbGN9i/UKhXi+WVUtF5Hm9HfYi2JLJe1iAGmwIzVRV9njOSC0KGAjnkarvkHU7eV/42szpIr
	3uL7Xe9/SQLDMX
X-Google-Smtp-Source: AGHT+IEiE/KhsLnwDtozknIyhsymCObeRf1LTZcI6ldZd1GqTFKQ2x8AfKPsdKBm3mDZ2dcM+KQJ6A==
X-Received: by 2002:a05:622a:838c:b0:4ab:38c1:f9a9 with SMTP id d75a77b69052e-4ab38c1fc7emr172803891cf.19.1752507172595;
        Mon, 14 Jul 2025 08:32:52 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3f1c9a2csm30869951cf.67.2025.07.14.08.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:32:52 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 83594F40066;
	Mon, 14 Jul 2025 11:32:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 14 Jul 2025 11:32:51 -0400
X-ME-Sender: <xms:IyN1aNZhQdTXlEwdUFRK6ixe11IsrGl9xQrPhCYt2MdciWQg-2N87A>
    <xme:IyN1aF5V1ixT0MErGGOpS8ZDHhBAE-ASyclvhtA7ANSPsYQFZaeFm_Fo_jKMk6mpv
    TW-gZDXrO6Ol2FAcw>
X-ME-Received: <xmr:IyN1aEgsrCJ6UmyqHs1It-LK9ZJdmCqOQl4JHFw0IhhkfW6kCIniW78zqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepjeeihfdtuedvgedvtddufffggeefhefgtdeivdevveelvefhkeehffdtkeeihedv
    necuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsihhnsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhu
    gidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihse
    hgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhn
    mhgrihhlrdgtohhm
X-ME-Proxy: <xmx:IyN1aLI0aVk-31eig95s5X5IAwTfkC5opzO7TVO4o63Dxltb7RQpig>
    <xmx:IyN1aGqzMj-aS-jBspJ99eptAKv-u_tP7EK0_blC3OdjvfW1sdhgUA>
    <xmx:IyN1aJy2I1GGOeidWxfmC4_5la-hcr47Jg_T8wBKUXoDfP8TVg_o6w>
    <xmx:IyN1aCfyxZHOaUh4scxy2MoqYe5CypGeJlzZFysocpLyN3her6pRcg>
    <xmx:IyN1aNcFefTTQUTDjPW2XSJEq3GHvRHfEVHYBNt7FwOijMbUp8n62MlX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 11:32:50 -0400 (EDT)
Date: Mon, 14 Jul 2025 08:32:49 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	lkmm@lists.linux.dev, linux-arch@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 4/9] rust: sync: atomic: Add generic atomics
Message-ID: <aHUjIQlqphtgVP2g@Mac.home>
References: <20250714053656.66712-1-boqun.feng@gmail.com>
 <20250714053656.66712-5-boqun.feng@gmail.com>
 <DBBPI9ZJVO64.3A83G118BMVLI@kernel.org>
 <aHUSgXW9A6LzjBIS@Mac.home>
 <DBBVD70MASPW.2LUTJ51Y6SGMI@kernel.org>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBVD70MASPW.2LUTJ51Y6SGMI@kernel.org>

On Mon, Jul 14, 2025 at 05:05:40PM +0200, Benno Lossin wrote:
[...]
> >> >  //!
> >> >  //! [`LKMM`]: srctree/tools/memory-model/
> >> >  
> >> > +pub mod generic;
> >> 
> >> Hmm, maybe just re-export the stuff? I don't think there's an advantage
> >> to having the generic module be public.
> >> 
> >
> > If `generic` is not public, then in the kernel::sync::atomic page, it
> > won't should up, and there is no mentioning of struct `Atomic` either.
> >
> > If I made it public and also re-export the `Atomic`, there would be a
> > "Re-export" section mentioning all the re-exports, so I will keep
> > `generic` unless you have some tricks that I don't know.
> 
> Just use `#[doc(inline)]` :)
> 
>     https://doc.rust-lang.org/rustdoc/write-documentation/the-doc-attribute.html#inline-and-no_inline
> 
> > Also I feel it's a bit naturally that `AllowAtomic` and `AllowAtomicAdd`
> > stay under `generic` (instead of re-export them at `atomic` mod level)
> > because they are about the generic part of `Atomic`, right?
> 
> Why is that more natural? It only adds an extra path layer in any import
> for atomics.
> 

Exactly, users need to go through extra steps if they want to use the
"generic" part of the atomic, and I think that makes user more aware of
what they are essentially doing:

- If you want to use the predefined types for atomic, just

  use kernel::sync::atomic::Atomic;

  and just operate on an `Atomic<_>`.

- If you want to bring your own type for atomic operations, you need to

  use kernel::sync::atomic::generic::AllowAtomic;

  (essentially you go into the "generic" part of the atomic)

  and provide your own implementation for `AllowAtomic` and then you
  could use it for your own type.

I feel it's natural because for extra features you fetch more modules
in.

Regards,
Boqun

> Unless you at some point want to add `concrete::Atomic<T>` etc, I would
> just re-export them.
> 
[...]
