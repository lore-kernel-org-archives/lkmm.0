Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6971EE003
	for <lkmm@lists.linux.dev>; Tue,  7 Jan 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266206; cv=none; b=aug1TyrLfDqmB+5nNIIg6azM/CiotApeEAfv8MsfZy2a+VbBalW/gUdhGNgiHWk0Ul9QWimNgP73knoQg3qjvPkujYz5VUr+vRcsBIri83naw8ZxXdo0JcdnOm7f71kuVtaOKDp9zKIdxYLUPZzDsT90VgX5dx+RIhX5lD4yhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266206; c=relaxed/simple;
	bh=bDJscXv1RXC2286ZEvBuxPoo00Q6pAo7GSGUN3kp5bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enhChqDDkn6YE7cqCpdxQbhOGzCQrlSYUPjoQ9e+fR4phTMnnbuQJxdugpPLxDmSWXQGg5/nJCwgzgWkNtdGM+vHiC2lotMds/McWWjcy5wkhXT8lkjMMe2OSzBhSGGTKlwx+gEqXW4PZstVcB5W0Q8V8r94TcCiNu3ruNd+/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SJ9Hzrj0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SJ9Hzrj0"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e8814842so1355374885a.0
        for <lkmm@lists.linux.dev>; Tue, 07 Jan 2025 08:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736266203; x=1736871003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LvIDWeluTdCgXCnx0predLJUANZH+mX5VnGU6NYk94=;
        b=SJ9Hzrj0X9I7n0RhQRVdawuzlM5RskQ9M9UR2UttfqyCCyKVF4bs8Y9xYkBPBMQ6YT
         9/Z3hQ8tpdBIPINnDHbznbdidkI0RcO0Rso7b8T9cVvmx4+QWL3xmjipt3oNet3LlvEW
         b9zrAQL2Y/9jJv8wjZxY3EuTa/vojI5YzPNpNREeKP+91i0KogYWEP9eVMrQac+K+Ncr
         1AHEpRNAuyCnXhwAZRfAqFJlR8gGNR0purHGYbz829VR/3M0BsUDhoc58tkGUMk1Hn9r
         4rorZ73GwHY6/CpnqrihPtDIfQI7AfjxdzzJfII2LkJGq/+n5glJSpiLpdKtaWirMBHj
         Kiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266203; x=1736871003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LvIDWeluTdCgXCnx0predLJUANZH+mX5VnGU6NYk94=;
        b=YEtSuXtK20dfrNNOvHfuU4kL2CKOiG46QSi80/PJ/XHEBcADJMePov6Y60SOQj+9+v
         w530nWqKC4AceKNti0qHN7e5pJbCbG5TVTgZJnvfQRsQLMxN226u0KgFDz2W0f8yE0On
         h+NMxwxmvPyO2INBWeFj+FGYv1KCjFGZP7W4ILndLVlDYIkcaGVTIY9nYqknoFRT82oO
         /YSkmUbX2sk01NMf8FUZu4tAFlP/8v3Chzun2HNlfJAmrbOMAQHw+Uq2X5W3PrdodH5R
         t/DavPGdEPdLM9XL+S0HM9VXWgW5n6+C9fCQ2qqTwtJtpQeovNeWOBRxFR+OFhx+MJ5n
         /CbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMyU7jy2Y/evk3X0uS3mhpeLhMTDaRiLf8sYk9ASe56OU8IBZXkYFaeDSeyR+EJRlVALzq@lists.linux.dev
X-Gm-Message-State: AOJu0YzEql3bfvBjJ0BR6uu+TQKao+616BZq9nWpyFgBcHJaa0AffTqk
	LkjbHk+EVndaYLuoLMl+eCTm67a4VSXHJzR5ZGuvrWI9L9WRGvgYwS3fisWO0w==
X-Gm-Gg: ASbGnctJHV272HNpEK+KwTxQ+1urC99gc0p/24oUIBjewg3Ee1EqXkG4BkTvwgebvjZ
	XTckVDlbc2X44VBF6plpL7Yo6jkD4cBeBwzpN1mohkVX9e7DKiuWsJzaCuFjiVCmrGBL22axaka
	Huw4c+4GMMH2URE8kl4KZF7+S3AtRUOq2nyDERy8GK+VS5RDFwWsVnitMfco9HmF57mhl971DmZ
	TNujcg0Mm131PetgguyLD2NLXmoJtH6CnF9zl5oVbwRms+yJfN8XxKBCRHRUxh0WHeUps1zHZE=
X-Google-Smtp-Source: AGHT+IG+ycHwyLukwgsBXT6niw1ql2jpnYH+aLV9PPiHxlOrb704y6W2dcgu1wdH7ULWrUqyatgdNw==
X-Received: by 2002:a05:620a:4145:b0:7b6:67a6:5adb with SMTP id af79cd13be357-7b9ba784a1dmr12181682885a.21.1736266202963;
        Tue, 07 Jan 2025 08:10:02 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ce6aasm1605198685a.117.2025.01.07.08.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:10:02 -0800 (PST)
Date: Tue, 7 Jan 2025 11:09:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: paulmck@kernel.org, parri.andrea@gmail.com, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, npiggin@gmail.com,
	dhowells@redhat.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr,
	akiyks@gmail.com, dlustig@nvidia.com, joel@joelfernandes.org,
	urezki@gmail.com, quic_neeraju@quicinc.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, lkmm@lists.linux.dev,
	hernan.poncedeleon@huaweicloud.com
Subject: Re: [RFC] tools/memory-model: Rule out OOTA
Message-ID: <a3bf910f-509a-4ad3-a1cc-4b14ef9b3259@rowland.harvard.edu>
References: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106214003.504664-1-jonas.oberhauser@huaweicloud.com>

On Mon, Jan 06, 2025 at 10:40:03PM +0100, Jonas Oberhauser wrote:
> The current LKMM allows out-of-thin-air (OOTA), as evidenced in the following
> example shared on this list a few years ago:
> 
>   P0(int *a, int *b, int *x, int *y) {
>   	int r1;
> 
>   	r1 = READ_ONCE(*x);
>   	smp_rmb();
>   	if (r1 == 1) {
>   		*a = *b;
>   	}
>   	smp_wmb();
>   	WRITE_ONCE(*y, 1);
>   }
> 
>   P1(int *a, int *b, int *x, int *y) {
>   	int r1;
> 
>   	r1 = READ_ONCE(*y);
>   	smp_rmb();
>   	if (r1 == 1) {
>   		*b = *a;
>   	}
>   	smp_wmb();
>   	WRITE_ONCE(*x, 1);
>   }
> 
>   exists b=42
> 
> The root cause is an interplay between plain accesses and rw-fences, i.e.,
> smp_rmb() and smp_wmb(): while smp_rmb() and smp_wmb() provide sufficient
> ordering for plain accesses to rule out data races, they do not in the current
> formalization generally actually order the plain accesses, allowing, e.g., the
> load and stores to *b to proceed in any order even if P1 reads from P0; and in
> particular, the marked accesses around those plain accesses are also not
> ordered, which causes this OOTA.

That's right.  The memory model deliberately tries to avoid placing 
restrictions on plain accesses, whenever it can.

In the example above, for instance, I think it's more interesting to ask

	exists 0:r1=1 /\ 1:r1=1

than to concentrate on a and b.

OOTA is a very difficult subject.  It can be approached only by making 
the memory model take all sorts of compiler optimizations into account, 
and doing this for all possible optimizations is not feasible.

(For example, in a presentation to the C++ working group last year, Paul 
and I didn't try to show how to extend the C++ memory model to exclude 
OOTA [other than by fiat, as it does now].  Instead we argued that with 
the existing memory model, no reasonable compiler would ever produce an 
executable that could exhibit OOTA and so the memory model didn't need 
to be changed.)

> In this patch, we choose the rather conservative approach of forcing only the
> order of these marked accesses, specifically, when a marked read r is
> separated from a plain read r' by an smp_rmb() (or r' has an address
> dependency on r or is r'), on which a write w' depends, and w' is either plain
> and seperated by a subsequent write w by an smp_wmb() (or w' is w), then r
> precedes w in ppo.

Is this really valid?  In the example above, if there were no other 
references to a or b in the rest of the program, the compiler could 
eliminate them entirely.  (Whether the result could count as OOTA is 
open to question, but that's not the point.)  Is it not possible that a 
compiler might find other ways to defeat your intentions?

In any case, my feeling is that memory models for higher languages 
(i.e., anything above the assembler level) should not try very hard to 
address the question of OOTA.  And for LKMM, OOTA involving _plain_ 
accesses is doubly out of bounds.

Your proposed change seems to add a significant complication to the 
memory model for a not-very-clear benefit.

Alan
