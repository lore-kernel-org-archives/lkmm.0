Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDA3FE4
	for <lkmm@lists.linux.dev>; Tue, 18 Mar 2025 02:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742264628; cv=none; b=ZhXf8sSyP1TJBUtOgaIQ01T46dgWPJvPM7Wv4vsdVx+O5CLn8Sw9VyeVEzIcpDSBtW3nTelvZ/OLZiGZA7nHDtKakdGUT7+sz1//cDObB8/5EDTir8LiA7dzoU87TK0vSIYk0GTDxHsnnADQFL11bLLjlzyBOLj5Uzym2eDfFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742264628; c=relaxed/simple;
	bh=jc0lAPAclON7kRSCV6C73rnqzf5Kjt9ZKSY8hP/u2Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZUrM2uxC02uwPaKgUOWsDhJrj0X6illidjJPhreVnnsOWCjAHPuVVsEBibPGGI7o15ooDQlPUXqrVGT9DtqCHDYnA1g/6AQDtBm3r47A6PP0KUhrzsY6v/xsI1LUwMMjKvjeryyL9H+gx51wmsLaoxULTjiQA79oNohKfUVdFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABpKxlr6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABpKxlr6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-226185948ffso31115895ad.0
        for <lkmm@lists.linux.dev>; Mon, 17 Mar 2025 19:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742264625; x=1742869425; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R908TbU0RdBzTfPxUZoyN24Bc01K0uuprAGrl2ZfkFU=;
        b=ABpKxlr6iUbdxvJnAsOY5/l8dA1Di+oDKUzzv03Krpk75TlYmJOxEVwQoy+irOnY5P
         E4PbyirLLlUf3r2cLjSTlhxZDjNeuUTWr/8gSNuoszQrORcakRSzboBdGEgrKP0PtzWq
         79BZUTGi6Z/fN/E3dz+Ab2SXGeWJA8HjpsEIR7Y48age+6oibkAu0mzr0Ddr+oSODs02
         Ld1HKSZh64czz21xKKyGw1loMKaBSNKgK06eR3w8fP+k9a7QCzpuhqjgEPdKl7krlWuk
         MPmei4+V5YniAI+ZXiRxs2OVmJc7hpEl2L276CDkCocl/krpteq7X/V2yVxaJadBRN9I
         G2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742264625; x=1742869425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R908TbU0RdBzTfPxUZoyN24Bc01K0uuprAGrl2ZfkFU=;
        b=rWeFOlM2vpFbAXt+KWATTV6tMqarThMYT0H6HeJe0QdswPnmlmtgY52hWciYEN2McS
         KyjXVHxEowdLF7Un90LfHmRYoAO7gL4gqYHVpdvTPQaluGiQ1YnZQiWD3XDch0SbSuIp
         3Kbcl/8SHUNztRPMlJdtrygkMMSOTaisZIyGT9azjLnZ/WHQ0NtiTQSbGE6PyghX0MfN
         oFWKxYMkMf5PHOFVA2489GhVJ/OY4xCql9Eu/uzp82lHo0g6lomIxNU6T9xZna27jP4F
         aQ6dbBb72QX8S7M13YP6ts/FUANdusIRKcJEqXuTLjHtI6P5p3x6VM6HNt5sRfiFplm+
         CSIw==
X-Gm-Message-State: AOJu0YyYwWgZ74Tja5NtSZQa5J/9xPQOIZzIaFrID5Gt5cFleuZ9nmHC
	Ld/wY467TdQPn8S1rr6+eZdyQK+eJho6+zACS92Qe0uN+TfgJiAj
X-Gm-Gg: ASbGnctcXl1KmKSFHjyof99PRgfU7beDJFLjehinQdkXbIR05RcUGtqxmLfGEk57Fx/
	r76KinQVxf8iQe0iCcAliyAKM+c0GpxJP8wxLa0DeCqmUNDoCtmJXXIlzCtaqPYwIGB4htFmPby
	/g48pW9VmMBSU4ZHDf03Adx/dG8sgslcrBNeRKFOXAIO5lssPNBNHQJ81zkVwNyhoA1iDg5rJkT
	9cF/w0LiuKp5P/vYNJ3dr2e2b1XuaKkAWt7DulgefKZT007XMZb6fwOsD4hpnA1+piKMdCXL6T+
	iT7UdvBqX3JaB6ziPgWKl6yDv83jj2u5oqPRSBoeW9taeBbg66sOrewk4V8XtMCj5qN4rkt+Edp
	4DYG493cWfNwrGCOkPQSpwOiiVw==
X-Google-Smtp-Source: AGHT+IHZXAUnoBdWCtcGCTtetk7bh34qp9vIXEjUoIVxxV806u5tKB/aOZk7zfS8WF0+Yrc245ggBQ==
X-Received: by 2002:a05:6a21:680b:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-1fa44194a8bmr2572606637.13.1742264625040;
        Mon, 17 Mar 2025 19:23:45 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116955e6sm8574093b3a.136.2025.03.17.19.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 19:23:44 -0700 (PDT)
Message-ID: <62fec120-c95a-4fd2-b7c5-9c24dc58104e@gmail.com>
Date: Tue, 18 Mar 2025 11:10:17 +0900
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] tools/memory-model: Documentation updates and fixes
To: paulmck@kernel.org
Cc: lkmm@lists.linux.dev, Andrea Parri <parri.andrea@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Akira Yokosawa <akiyks@gmail.com>
References: <c3f8f79d-b815-44ec-908a-7eea36f52b3f@gmail.com>
 <5e70aa5f-2c4c-4c0c-971e-82c5bf356cbb@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5e70aa5f-2c4c-4c0c-971e-82c5bf356cbb@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 17 Mar 2025 16:26:34 -0700, Paul E. McKenney wrote:
> On Fri, Mar 14, 2025 at 08:08:24PM +0900, Akira Yokosawa wrote:
>> Hi,
>>
>> While re-reading LKMM documents, I noticed minor issues here and there.
>>
>> This patch set is a collection of updates and fixes resolving them.
>>
>> Patch 1/4 clarifies the relation of locking.txt and recipes.txt.
>> Patches 2/4 and 3/4 are trivial fixes of typos.
>> Patch 4/4 removes a link of MIPS doc which does not work.
> 
> Queued and pushed, thank you!  I did a bit of wordsmithing and also
> updated to the 2024 LWN API article, so could you please check to see
> whether I messed anything up?

All look good to me!

Thanks, Akira

