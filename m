Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767A13541B
	for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737140558; cv=none; b=AYst4RpfVF47UvJcsu8s4sH+SFoHKRfj1fAZX1+JwedvXCI6QIh14S/47AwGc0EwSrbiM+8SxPMXrb0Y8VPTA9YtfMK/scCnLfxyjHOBA3aIJznm2WSOPK65N/9bd8akmdTyFDE/9yd0acdJhR92r9MiPeu/rLBTboXGGthJ0SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737140558; c=relaxed/simple;
	bh=h/4P543LOiYl3jq8pLJh4t6GJH6pYZnNPxLFqK0L2i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPH7WFln1wv6zEfDxSq1y2yCsWAp+xLov4qc2qTpQl0zg5vxLKNfAe1XS1KAHqEMXGX9jD5dbBE4wnYDvYXFqYd0oxrHAblb8WSk1I9ofoW+HB1js1QCc5mpINaSn5WMRf3l2rhDLDh2DjgjzUe9mqu//MySUBGqy5PKNjLuh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eN6tWiOj; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eN6tWiOj"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6ea711805so322438485a.1
        for <lkmm@lists.linux.dev>; Fri, 17 Jan 2025 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737140555; x=1737745355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGrLQnLVfNiw1Wq815AmaAzNCroDu4CN9YGiD5eLsgI=;
        b=eN6tWiOjuXhLub8OM4u2UaS9CTpQfijw119czwxfeMjDWcsnymj1y+yPIiHFh2vnaM
         uShbVCKEBRHtIsicTs/oCKxvnpKThvNzBbyI1Ar5JTxDDr/DsaVB28wrLn5b8nsrND4z
         AC/JOSTvpE1P/7DPxUxC56VSnjy7vmssiqoQ0IWzdB2bVg5wIHLA8fm36YyvMQMPiWFP
         0p/Zg4SlB3hynneSe/vqWkD55oThx7sgMp9fOYMRBCqiHo4xJUwQaE4X3pFgUbpj8Glc
         cZnbP3UNbw0pMaP29gCH/oAe5GWMJGY2yk5DWjAsP3Jw3CvUC1sOV9mHe+mEc1LqQSpF
         Xp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737140555; x=1737745355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGrLQnLVfNiw1Wq815AmaAzNCroDu4CN9YGiD5eLsgI=;
        b=YQpyHgGHeh7YJgM+DTDhBD/qvQRZXt7SVcYuHg9/WKJr3immstXUNdzzm+ukahnMCR
         qYI2NJuOxENCb8t9OcIPVhFPZs8iF45nahGUifGhn5+Z2L/M736Kp6MGNLwiaZgsM3YU
         Glov+F904IHgyvFgnoibatHl8EfWAzgiojiPsH0zm2Nu4l0UPw8Wdbp3ui8k+yh1/OMC
         tFSCuCxsb91O21a3cwz3JmBxokS89A0HwMJw2r+oS/WjrQAa9HNYhcvdS2bdKRNKjM9Q
         l8BW1DJYNc2iu7NR7NxBbjeABsKA3IpJL1vi1QlMCj3+IILTLZ/U/GoQB6cML//ZpTt7
         2AfA==
X-Forwarded-Encrypted: i=1; AJvYcCWQmzP24tH9t/5KvWYKr5vwW/7TEoLNaku4+9Sqgy63URXnq0oKi7pDGntfc/GJSEpyOumg@lists.linux.dev
X-Gm-Message-State: AOJu0YzKcqG8AdtZXOAiZx2vM60d7YdOG5/Qa+9J+9N/N4xk7Xa/zzPV
	ow+yOtwUMZ8BoUnB1Gf7zu6fq++Lekp8xCR3A2C3sRhDOoJ57S/csIynu6In1g==
X-Gm-Gg: ASbGncu+ZrCSrTB6nP+asCfH2XlNq0Md6hd3VHqY2F5H+8jfgeDkSgXpkAv6OYtoibJ
	JdVRpiFGHjsMIT/RddKbGK9PIsu8Us2hTHH0rAWEVK2eRBQp/+VABXpeJFu0GN7kLFp8v8l4u3v
	huy/AoQNhQB0Al7+88XR4sXDEPSnlx45zi0BxJ5OeOzI30XrhRn6wJVfrUYhrDVjMRCZUDJwgcC
	oWvQYe9Yd99XxNN0us8J4Ubj2obUn7XI+Y6tt78OGdoH+j5GhRipEnErKjn0Ycg0Z2wgRF5E+K5
	JvSuHjqMhkL+Y4rYeWt2AVBwkFjGpYrUAHsH/uvBxjVVRRpFqw==
X-Google-Smtp-Source: AGHT+IGrfPW/Ks9ewf3rzTm6Ef8ndHCxWugM2+qhRJdkDeZoQMs9nxf16HxvEQqu4Gb3JUrv9LlHIA==
X-Received: by 2002:a05:6214:2401:b0:6d8:a32e:8430 with SMTP id 6a1803df08f44-6e1b216983emr76775866d6.8.1737140555549;
        Fri, 17 Jan 2025 11:02:35 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afce467fsm14110016d6.105.2025.01.17.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:02:34 -0800 (PST)
Date: Fri, 17 Jan 2025 14:02:32 -0500
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
Message-ID: <329f1d75-1d4f-42dc-8d28-9674def6f27f@rowland.harvard.edu>
References: <1daba0ea-0dd6-4e67-923e-fd3c1a62b40b@huaweicloud.com>
 <c27c4210-3d20-42af-a1f7-a49d04828a8e@paulmck-laptop>
 <cda52bac-1c59-4c56-b5e2-937f2008a768@huaweicloud.com>
 <21ec2b32-69ce-46bf-8d44-06149e71ba6c@paulmck-laptop>
 <0c0fcfb7-dbef-426b-ac54-583c85fbba9d@huaweicloud.com>
 <1cea1fcd-827c-455e-93b7-f4d606bf4993@paulmck-laptop>
 <1147ad3e-e3ad-4fa1-9a63-772ba136ea9a@huaweicloud.com>
 <1668d0b4-4060-4eac-b8b1-46ca0d1dbce9@rowland.harvard.edu>
 <b0bac412-cfc4-4334-8d8e-2fb080fe6e3e@rowland.harvard.edu>
 <a1019624-7f82-4897-a1f2-3a381794b2ad@huaweicloud.com>
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1019624-7f82-4897-a1f2-3a381794b2ad@huaweicloud.com>

On Fri, Jan 17, 2025 at 05:45:50PM +0100, Jonas Oberhauser wrote:
> 
> 
> Am 1/17/2025 um 4:52 PM schrieb Alan Stern:
> > On Thu, Jan 16, 2025 at 06:02:18PM -0500, Alan Stern wrote:
> > > On Thu, Jan 16, 2025 at 08:08:22PM +0100, Jonas Oberhauser wrote:
> > This is a slight variation of the example on page 19 (section 4.3) of
> > the paper.  (Pretend this is actually C++ code, the shared variables are
> > all atomic, and their accesses are all relaxed.)
> > 
> > bool x, y, z;
> > 
> > void P0(bool *x, bool *y, bool *z) {
> > 	bool r1, r2;
> > 
> > 	r1 = *x;
> > 	r2 = *y;
> > 
> > 	*z = (r1 != r2);
> > }
> > 
> > The paper points out that although there is an apparent semantic
> > dependency from the load of x to the store to z, if the compiler is
> > allowed not to handle atomics as quasi volatile then the dependency
> > can be broken.  Nevertheless, I am not able to think of a program that
> > could exhibit OOTA as a result of breaking the semantic dependency.  The
> > best I can come up with is this:
> > 
> > [P0 as above]
> > 
> > void P1(bool *x, bool *y, bool *z) {
> > 	bool r3;
> > 
> > 	r3 = z;
> > 	x = r3;
> > }
> > 
> > void P2(bool *x, bool *y, bool *z) {
> > 	y = true;
> > }
> > 
> > exists (x=true /\ z=true)
> > 
> > If P2 were not present, this result could not occur in any physical
> > execution, even if the dependency in P0 is broken.  With P2 this result
> > isn't OOTA, even in executions where P0 ends up storing z before loading
> > x, because P2 could have executed first, then P0, then P1.
> > 
> > So perhaps this is an example of what you were talking about -- a
> > dependency which may or may not be semantic, but either way cannot lead
> > to OOTA.
> 
> Yes, that looks like an example of what I have in mind.
> 
> If at the model level we just say "yes there is a dependency, but no it does
> not give any ordering guarantee", then the compiler is still free to break
> the dependency like in your example.
> 
> A thread P3 { r1 = z; atomic_thread_fence(); r2 = y; }
> could still observe r2 == false, r1 == true, "showing" that the dependency
> was broken.

That wouldn't prove anything unless P0 had its own memory barrier 
somewhere before it stored z.

At any rate, I don't have any ideas on how to characterize semantic 
dependencies that can be broken without risking OOTA.  (Some people 
would say that if a dependency can be broken at all, that demonstrates 
it wasn't semantic to begin with.)

Alan
