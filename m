Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED546F073
	for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752241547; cv=none; b=hXiFo10zGYNFEj7aCRDJ6NVc4OGwd7dfeTFQEJfmkdpUP+S/xx0b6HHArV5tZAe4Tf7/u/tdgk5OGmCi46R4pjuqEe97XnIBy8YhEAj8GslqUjz1vAMHELUtmzBDj3P2HZy534od0wTiKasjcr3ztD280PAdEndFVA2LxgXKP68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752241547; c=relaxed/simple;
	bh=3jTI8lmVPJdNIpsEXo25Ia6BaFfUuorZSAB0PZFfdNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALnYVqT18aXiH2WUiMXIDpPeiXF4hRZpQSUeNCyjVq09Vtl1rHrd/yA4YjsJ41dpV5/IbUlNBtl28P2hSTqmdstYryIApSLcCm7ZtErhMX+rGHDuJMqueQVzeDMee5k0j+iFcN7FM5mQX4fdhJ2Tptg6iOWYoNSYwYICY+a1fAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRGJJsQJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRGJJsQJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2355360ea88so3216305ad.2
        for <lkmm@lists.linux.dev>; Fri, 11 Jul 2025 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752241545; x=1752846345; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cqaeziKytPI8w8vAt41vJYQ/P2vPeYWtQ7a6fagfqLI=;
        b=RRGJJsQJ+G3HSgw3HjKrdhGH8nkoQPvu3H/Ee7bVJNtdKd4FpXgNSwdGNqM26VINBM
         Qkuvfq1chFxAFt5W1OLT7gcIOm1fvq0KbOrobrA+DoCNzHVgX1qwD0aiKdP76MdSRYUX
         HQTU2u3MzLmkg/yNS8ms/at4xK4ORTE0thXNRsFDy6OXHDFvhor4YSOe3rxsRkEYnQfs
         BlbrHMAf2X/SWpxa/x+4TuZG0FdeDlhF01Lx2qtUbf3z+0h18tn75NIAjFIPqKc28rfE
         KNFC9WtIGrTobAnYJCRAQZKjLVyCim+cHoIWpWlOhw4sB/VHWW1WUu+p/ABsTFxrhwcd
         UmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752241545; x=1752846345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqaeziKytPI8w8vAt41vJYQ/P2vPeYWtQ7a6fagfqLI=;
        b=qqtpYyq+713Rib4pBD3GxSoa/yEiZkhhRnCTEn0wlAlrE1RnjLdWjLIXqSkBhMA1lw
         esgn1SgEcDNoPVitqYD4sIp7qjajwPmXGIgfxZj9da+CUM00HRgBRBXI0h9GtSjx8Lfs
         W5/enX3wJv5ESPSTcTwI4bDqB3/x3FA8QKL3j592P5cZIDnqzacExaDWr6O2EkqyFutI
         PljTAwR9U3AqXsp+puTCGptTH+3VtnXo15f+zwwFUbOlDex1YwEe/GumHnUmU4+nJA6r
         yIw49LVlU4V83ZeAWf++4FwA7QvHo6iopxI/7YhyV6TTQe/YWmIwXa/qOOhOx2Dnw25U
         xwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhX9OwBKXJ05lKPnmXKpz5OkP+WpyZAtProJ2K1L912u6dx+xQh7d7xJ9j9SYPZsbnJQy6@lists.linux.dev
X-Gm-Message-State: AOJu0YwU2PYJCUgGAhj1b+Sw/grgd61v80HDv2gGjoyyVux/MoiMkfeP
	KcNepzMWNjpKr7BXAmmQuOc7me75J4mPBaR3HhoJYxweuJ4S5ZBJdlbodcytf6NThaBV1YrrJQo
	+0kUP8qrO+qEHR+AlvyXMHEpPmuVDwzM=
X-Gm-Gg: ASbGncvYtMYQuQAAsbftoBnD2VlG9w42a/TTWsN0CSKMA05ATftTokjl7I45+F0ugNG
	NCausn9iTlsxTFXamKMoyEVnNxgi/MsYxrB1W9VyzJ5/DLh11XyrNTNvB/iJ5oxSzzPqFOgdMJc
	7IUhCSgtcz004TKVDYXaFv69ShyQeEnKaiLZPysBD0NnTdQnl7oGOLMS6Y8tl7HpdVY8Y0c7n4n
	RAizhwr
X-Google-Smtp-Source: AGHT+IFV5Q6XDMeNyxbrDaCqcTK/9CG4eq2MIFX5PPvQTMRtWGgXyj0wXcXbQyG2lvhVf12L4lT6ldVNfl1A8tpHFxU=
X-Received: by 2002:a17:902:e742:b0:234:bfe3:c4a3 with SMTP id
 d9443c01a7336-23def6f8af8mr14692945ad.0.1752241545448; Fri, 11 Jul 2025
 06:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710060052.11955-1-boqun.feng@gmail.com> <20250710060052.11955-10-boqun.feng@gmail.com>
 <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org>
In-Reply-To: <DB93Q0CXTA0G.37LQP5VCP9IGP@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 15:45:32 +0200
X-Gm-Features: Ac12FXyFrHk4Z1-8N4fJ4rpIjk16rCRk0lkV3gm2SvE-JFQCE4Eus7CzluwDG1Q
Message-ID: <CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUMHFTuuj5ydmqo+OYn60A@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] rust: sync: atomic: Add Atomic<{usize,isize}>
To: Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev, 
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Mitchell Levy <levymitchell0@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alan Stern <stern@rowland.harvard.edu>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: multipart/mixed; boundary="000000000000e0c02e0639a78652"

--000000000000e0c02e0639a78652
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 11:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Do we have a static assert with these cfgs that `isize` has the same
> size as these?
>
> If not, then it would probably make sense to add them now.

Yeah, according to e.g. Matthew et al., we may end up with 128-bit
pointers in the kernel fairly soon (e.g. a decade):

    https://lwn.net/Articles/908026/

I rescued part of what I wrote in the old `mod assumptions` which I
never got to send back then -- most of the `static_asserts` are
redundant now that we define directly the types in the `ffi` crate (I
mean, we could still assert that `size_of::<c_char>() =3D=3D 1` and so on,
but they are essentially a tautology now), so I adapted the comments.
Please see below (draft).

Cheers,
Miguel

--000000000000e0c02e0639a78652
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-rust-ffi-assert-sizes-and-clarify-128-bit-situation.patch"
Content-Disposition: attachment; 
	filename="0001-rust-ffi-assert-sizes-and-clarify-128-bit-situation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mcyv696x0>
X-Attachment-Id: f_mcyv696x0

RnJvbSBhZmQ1OGYzODA4YmQ0MWNmYjkyYmYxYWNkZjJhMTkwODFhNDM5Y2EzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+CkRhdGU6
IEZyaSwgMTEgSnVsIDIwMjUgMTU6Mjc6MjcgKzAyMDAKU3ViamVjdDogW1BBVENIXSBydXN0OiBm
Zmk6IGFzc2VydCBzaXplcyBhbmQgY2xhcmlmeSAxMjgtYml0IHNpdHVhdGlvbgoKTGluazogaHR0
cHM6Ly9sd24ubmV0L0FydGljbGVzLzkwODAyNi8KU2lnbmVkLW9mZi1ieTogTWlndWVsIE9qZWRh
IDxvamVkYUBrZXJuZWwub3JnPgotLS0KIHJ1c3QvZmZpLnJzIHwgMzIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvcnVzdC9mZmkucnMgYi9ydXN0L2ZmaS5ycwppbmRleCBkNjBhYWQ3OTJhZjQuLmJi
ZGE1NmMyOGNhOCAxMDA2NDQKLS0tIGEvcnVzdC9mZmkucnMKKysrIGIvcnVzdC9mZmkucnMKQEAg
LTM4LDExICszOCw0MyBAQCBtYWNyb19ydWxlcyEgYWxpYXMgewogCiAgICAgLy8gSW4gdGhlIGtl
cm5lbCwgYGludHB0cl90YCBpcyBkZWZpbmVkIHRvIGJlIGBsb25nYCBpbiBhbGwgcGxhdGZvcm1z
LCBzbyB3ZSBjYW4gbWFwIHRoZSB0eXBlIHRvCiAgICAgLy8gYGlzaXplYC4KKyAgICAvLworICAg
IC8vIEl0IGlzIGxpa2VseSB0aGF0IHRoZSBhc3N1bXB0aW9uIHRoYXQgYGxvbmdgIGlzIHRoZSBz
aXplIG9mIGEgQ1BVIHJlZ2lzdGVyL3BvaW50ZXIgd2lsbCBzdGF5CisgICAgLy8gd2hlbiBzdXBw
b3J0IGZvciAxMjgtYml0IGFyY2hpdGVjdHVyZXMgaXMgYWRkZWQsIHRodXMgdGhlc2Ugd2lsbCBz
dGlsbCBtYXBwZWQgdG8gYHtpLHV9c2l6ZWAuCiAgICAgY19sb25nID0gaXNpemU7CiAgICAgY191
bG9uZyA9IHVzaXplOwogCisgICAgLy8gU2luY2UgYGxvbmdgIHdpbGwgbGlrZWx5IGJlIDEyOC1i
aXQgZm9yIDEyOC1iaXQgYXJjaGl0ZWN0dXJlcywgYGxvbmcgbG9uZ2Agd2lsbCBsaWtlbHkgYmUK
KyAgICAvLyBpbmNyZWFzZWQuIFRodXMgdGhlc2UgbWF5IGhhcHBlbiB0byBiZSBlaXRoZXIgNjQt
Yml0IG9yIDEyOC1iaXQgaW4gdGhlIGZ1dHVyZSwgYW5kIHRodXMgbmV3CisgICAgLy8gY29kZSBz
aG91bGQgYXZvaWQgcmVseWluZyBvbiB0aGVtIGJlaW5nIDY0LWJpdC4KICAgICBjX2xvbmdsb25n
ID0gaTY0OwogICAgIGNfdWxvbmdsb25nID0gdTY0OwogfQogCisvLyBUaHVzLCBgbG9uZ2AgbWF5
IGJlIDMyLWJpdCwgNjQtYml0IG9yIDEyOC1iaXQuCitjb25zdCBfOiAoKSA9IHsKKyAgICBhc3Nl
cnQhKAorICAgICAgICBjb3JlOjptZW06OnNpemVfb2Y6OjxjX2xvbmc+KCkKKyAgICAgICAgICAg
ID09IGlmIGNmZyEoQ09ORklHXzEyOEJJVCkgeworICAgICAgICAgICAgICAgIGNvcmU6Om1lbTo6
c2l6ZV9vZjo6PHUxMjg+KCkKKyAgICAgICAgICAgIH0gZWxzZSBpZiBjZmchKENPTkZJR182NEJJ
VCkgeworICAgICAgICAgICAgICAgIGNvcmU6Om1lbTo6c2l6ZV9vZjo6PHU2ND4oKQorICAgICAg
ICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAgICAgICBjb3JlOjptZW06OnNpemVfb2Y6Ojx1MzI+
KCkKKyAgICAgICAgICAgIH0KKyAgICApOworfTsKKworLy8gQW5kIGBsb25nIGxvbmdgIG1heSBi
ZSA2NC1iaXQgb3IgMTI4LWJpdC4KK2NvbnN0IF86ICgpID0geworICAgIGFzc2VydCEoCisgICAg
ICAgIGNvcmU6Om1lbTo6c2l6ZV9vZjo6PGNfbG9uZ2xvbmc+KCkKKyAgICAgICAgICAgID09IGlm
IGNmZyEoQ09ORklHXzY0QklUKSB7CisgICAgICAgICAgICAgICAgY29yZTo6bWVtOjpzaXplX29m
Ojo8dTY0PigpCisgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAgIGNvcmU6Om1l
bTo6c2l6ZV9vZjo6PHUxMjg+KCkKKyAgICAgICAgICAgIH0KKyAgICApOworfTsKKwogcHViIHVz
ZSBjb3JlOjpmZmk6OmNfdm9pZDsKCmJhc2UtY29tbWl0OiBkN2I4ZjhlMjA4MTNmMDE3OWQ4ZWY1
MTk1NDFhMzUyN2U3NjYxZDNhCi0tIAoyLjUwLjEKCg==
--000000000000e0c02e0639a78652--
