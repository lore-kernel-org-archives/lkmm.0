Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742027056F;
	Thu, 10 Jul 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157632; cv=none; b=Ukq7sJcVPFsnpJ14EgbWAxfoBoSNKVQLWcNSkEv3dwl6KiqbFeOkydckfmpUC3kZJoBqOOPoYPU8DNUYaxQWPBJ6dfTGlVcampPKqLRRyHBL8yWhe3m8F4YIWiQ1jOXU0bPP3A28SL6dIZ02zxHR/BYzmom8VIv4ajYMtf0NprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157632; c=relaxed/simple;
	bh=SE9IOhUv1MNCCrAdQ80BgU7INBJblvB5g5BNAJCOdvY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=PPFlT0U64DaGq4nQ0el1UfjQwpD4/2NnDgBFnJE4B89F/tSHFcDH7cTSSkeXUU70+5OoXh9hlYXCnIWr0uNjQaLmqmUYRqw5hl2av+p3KiSGLznIJnKmNSPIXRQg/8uJjCJ0BmZLMmnFzvCsmQlxQECMJUb1+IfwXA7MFmJMiPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M07WGiVk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M07WGiVk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1450608f8f.0;
        Thu, 10 Jul 2025 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752157629; x=1752762429; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+aeDuNjHdMlA3YEkviB2IrzxUH9ijDL9rPE1bZjJuQ=;
        b=M07WGiVkjpW78j2ws13tRcGNiIkBALlLARsxtiIW3A1cM5touhJMs4ry7N2poScguy
         dIV0S33REYOBCfAGxirs3WZOdaZIPFT803B4l5HbJC/z5ObDFRn0sCTTX0aWGXwA54dl
         VT7K8djW7UuwQaMH6ufdfoV7WZu0FoOsx0M7OMYZMFrALgDf0X/iJZPpNc12WBTjixdl
         ay+ySUg8wMp1F5zgvPBh/Sja32sOq/C+f4g6HSFi2k4V/bvNH7iOlB2f6RX9HQq2bf4i
         MQo0i2FrWvqyjhw979LisxIPbr8bjSHsJ2LbM3rWpXuk0plz9pwtVeePqLmdIVKIi3FW
         DcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752157629; x=1752762429;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+aeDuNjHdMlA3YEkviB2IrzxUH9ijDL9rPE1bZjJuQ=;
        b=iwsUYTX4uLILbMZoehiEXghmRPsV84P1x4r2wmZhx/VfGxAmQv/GLYFYdYiLA95Pbe
         qwsh02Rd0GGJu+pZcs80rMkAIDpSd+rMa6yTinKDUDgat/NKURkdQfxMsn2h++KR1WJT
         hw5d5JMGmHjwTUiAF+sIiETkUrCr4g2IP3PBR7H6e0RXkgAM9sWeBC4J94Al7VXbvq+N
         r46sycsXihXKPkg5FSjAhbAY2OpHB4nWJqhPWGWXnIHN7CK7cxuUfbftrPa99ZbZ2sTe
         rerj5wxr0IQAt09+9JQJsNscojJENfCiCSi6xFqNsMGuFwwX1ZMP2mXQh89UWiVrU6RM
         k4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVWuHuvHCDXB9hmAxcexE9/cp3TKFPLHcWURDb5FwWBXf555pKJkVubfUUA/OFc8Uumnh6xtA==@lists.linux.dev, AJvYcCX9GOQ25Mfsm3mNlUPcQlTnTOI+9nY+6hu0bt4oWHSzGyCttjx4+B+PVRNoQtvh9F7aJO7CAa2Z7lEtGNlCpUAudc+msg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDAFJf7WVPEWza0buCKjWGrHx4vO+DllyVuCbJWoJJE9fFhquR
	MLm1QKDkVBpz4pMjtGK3D/04uxLw77pt9ZcD+Ue0GvZv0HXxMoMd830k
X-Gm-Gg: ASbGncvNbwNN5V60OfF7XSUYuDwDffJqdCWBQDAeVGSXGc86SOtqRmKWTpZnI1CTSR+
	wIXjbEBtZMExXfPj8vbBCNPQQOu31Jvv7VRxI9WdMplIf8B68SYsiz/kRUUEzmuWI/HplHmq2VO
	yySro+nJYscbDjwcthXvjNjfNB3Z77FWbN2iH/JocEfnM9h4DJkpSPmOfmNyFPzXJ4V/w9rD3Mr
	N/d4Nsw7raAXn6X6ScMGdysTGW+6gNWpDjYyCOnVactan66fPxNeVdby5mKiEk5zUhLOBnIcy1Z
	g2KI1wknuNlXOxvLm7zx5bAelCBUI9Kr+w6UBbJuYlC11/gHWvSs9xb6L1inTJi3RsmChrW0V7Q
	=
X-Google-Smtp-Source: AGHT+IGbhb1Zio9W5HRGTNs7ZDqwVrGP0s2avBpyUCsXHGSEKkLCgpXpwSHo+05QvzlMF+IRw+s3EQ==
X-Received: by 2002:a05:6000:2283:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3b5e7f0efe6mr3140716f8f.8.1752157629028;
        Thu, 10 Jul 2025 07:27:09 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:a8bc:3071:67a5:abea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2147sm2051192f8f.32.2025.07.10.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:27:08 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  "Akira Yokosawa" <akiyks@gmail.com>,  "Breno Leitao"
 <leitao@debian.org>,  "David S. Miller" <davem@davemloft.net>,  "Eric
 Dumazet" <edumazet@google.com>,  "Ignacio Encinas Rubio"
 <ignacio@iencinas.com>,  "Jan Stancek" <jstancek@redhat.com>,  "Marco
 Elver" <elver@google.com>,  "Paolo Abeni" <pabeni@redhat.com>,  "Randy
 Dunlap" <rdunlap@infradead.org>,  "Ruben Wauters" <rubenru09@aol.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  Jakub Kicinski
 <kuba@kernel.org>,  Simon Horman <horms@kernel.org>,
  joel@joelfernandes.org,  linux-kernel-mentees@lists.linux.dev,
  linux-kernel@vger.kernel.org,  lkmm@lists.linux.dev,
  netdev@vger.kernel.org,  peterz@infradead.org,  stern@rowland.harvard.edu
Subject: Re: [PATCH v9 12/13] docs: parser_yaml.py: add support for line
 numbers from the parser
In-Reply-To: <m2zfdc5ltn.fsf@gmail.com>
Date: Thu, 10 Jul 2025 15:25:20 +0100
Message-ID: <m2ms9c5din.fsf@gmail.com>
References: <cover.1752076293.git.mchehab+huawei@kernel.org>
	<3b18b30b1b50b01a014fd4b5a38423e529cde2fb.1752076293.git.mchehab+huawei@kernel.org>
	<m2zfdc5ltn.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Donald Hunter <donald.hunter@gmail.com> writes:

>>              # Parse message with RSTParser
>> -            for i, line in enumerate(msg.split('\n')):
>> -                result.append(line, document.current_source, i)
>> +            lineoffset = 0;
>> +            for line in msg.split('\n'):
>> +                match = self.re_lineno.match(line)
>> +                if match:
>> +                    lineoffset = int(match.group(1))
>> +                    continue
>> +
>> +                result.append(line, document.current_source, lineoffset)
>
> I expect this would need to be source=document.current_source, offset=lineoffset

Ignore that. I see it's not kwargs. It's just the issue below.

>>              rst_parser = RSTParser()
>>              rst_parser.parse('\n'.join(result), document)
>
> But anyway this discards any line information by just concatenating the
> lines together again.

Looks to me like there's no Parser() API that works with ViewList() so
it would be necessary to directly use the docutils RSTStateMachine() for
this approach to work.
