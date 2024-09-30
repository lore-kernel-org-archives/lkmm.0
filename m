Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com [14.137.139.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE73188733
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.137.139.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688836; cv=none; b=fRJ3Sw4+hwareWP1X0AGCCbv/8wF0IHZtTDHSzsiRCtO/enw6WOslxKKp7SBjO8c4BYYG+ppbZGunivR0N0fnNKs3+j7x7sFvghOcf+GXFZwcYXb35PwBKpg34TTid1S/6Fw0Q8FD7Z04CrywJKN8sH/RPVaaKX1o2an/x7fyRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688836; c=relaxed/simple;
	bh=ttw3/7AfZzhAFU54uuXkNQKKqdfEwEj/HVqjJllteuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+XkgJe1jmoZ38qELRTTsFaJ5Qf7S0sySywkEEbEJ4esto85AhNtESIiRJZC4nuLtOSvsHnNkgqN+sDpzAxsl/DAS+o+DaSKpSSKVd20K3ysrgfgAMeQV9Hcwe5tlxOF19sMx7l5p9gaOeZ+LTJQfCyRRWYqlyHrPR+p2HU7y5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=14.137.139.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.18.186.51])
	by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4XHFkC2q6lz9v7NY
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 17:13:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.27])
	by mail.maildlp.com (Postfix) with ESMTP id 7D7F0140381
	for <lkmm@lists.linux.dev>; Mon, 30 Sep 2024 17:33:45 +0800 (CST)
Received: from [10.81.211.60] (unknown [10.81.211.60])
	by APP2 (Coremail) with SMTP id GxC2BwD3psdocPpmCvLwAQ--.5053S2;
	Mon, 30 Sep 2024 10:33:44 +0100 (CET)
Message-ID: <c2e5b1ee-eeee-4614-9b42-d6bbf7a67162@huaweicloud.com>
Date: Mon, 30 Sep 2024 11:33:26 +0200
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] compiler.h: Introduce ptr_eq() to preserve address
 dependency
To: Alan Huang <mmpgouride@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Stultz <jstultz@google.com>, Neeraj upadhyay <Neeraj.Upadhyay@amd.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com,
 Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>,
 RCU <rcu@vger.kernel.org>, linux-mm@kvack.org, lkmm@lists.linux.dev
References: <20240928135128.991110-1-mathieu.desnoyers@efficios.com>
 <20240928135128.991110-2-mathieu.desnoyers@efficios.com>
 <02c63e79-ec8c-4d6a-9fcf-75f0e67ea242@rowland.harvard.edu>
 <2091628c-2d96-4492-99d9-0f6a61b08d1d@efficios.com>
 <d2c87672-af75-4210-bd96-d7f38f2f63ac@rowland.harvard.edu>
 <d49f5d9f-559d-449b-b330-9e5a57d9b438@efficios.com>
 <D31AF4E7-B9D5-4D2F-A4B9-1E12B5E69549@gmail.com>
 <8d20cf79-9fa5-4ced-aa91-232ccd545b59@huaweicloud.com>
 <EEAE4623-DCD7-4BBE-8E06-7F6FF6E3070B@gmail.com>
 <E2551572-494D-46A0-A1D5-DF91DDB8B9F9@gmail.com>
From: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
In-Reply-To: <E2551572-494D-46A0-A1D5-DF91DDB8B9F9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwD3psdocPpmCvLwAQ--.5053S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1kKw48GFyUtrWxCFy3Jwb_yoW8Ar1Dpr
	W7Kay7KFn7XF4YyFWUtw18Cw1jqFZaqa90v3Z5Ar1xCFZ0k3WfCr4xtryUCa43u397J340
	vrWY934Ig3W5AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIF
	4iUUUUU
X-CM-SenderInfo: 5mrqt2oorev25kdx2v3u6k3tpzhluzxrxghudrp/



Am 9/30/2024 um 11:27 AM schrieb Alan Huang:
> 2024年9月30日 17:15，Alan Huang <mmpgouride@gmail.com> 写道：
>>
>> 2024年9月30日 16:57，Jonas Oberhauser <jonas.oberhauser@huaweicloud.com> 写道：
>>>
>>>
>>>
>>> Am 9/29/2024 um 12:26 AM schrieb Alan Huang:
>>>> 2024年9月28日 23:55，Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote：
>>>>>
>>>>> The motivation for introducing ptr_eq() is indeed because the
>>>>> compiler barrier is not sufficient to prevent the compiler from
>>>>> using one pointer instead of the other.
>>>> barrier_data(&b) prevents that.
>>>
>>> I don't think one barrier_data can garantuee preventing this, because right after doing the comparison, the compiler still could do b=a.
>>>
>>> In that case you would be guaranteed to use the value in b, but that value is not the value loaded into b originally but rather the value loaded into a, and hence your address dependency goes to the wrong load still.
>>
>> After barrier_data(&b), *b will be loaded from memory, you mean even if *b is loaded from memory, the address dependency goes to the wrong load still?
> 
> Sorry, *b should b.

That's exactly what I meant to say. In my understanding, it can happen 
like this:

a = READ_ONCE(*p);
...
b = READ_ONCE(*p);
if (a == b) {
    b = a; // inserted by compiler

    barrier_data(&b);

    foo(*b); // compiler definitely use the current value in b
}



In the end, the address dependency is from the first load, and the CPU 
can speculatively (with register renaming, forwarding etc) execute

a = READ_ONCE(*p);
b2 = a; // speculatively
tmp = load *b2 // speculatively
b1 = READ_ONCE(*p);
if (a == b1) { // confirmed
    foo(tmp);
}


best wishes,
   jonas

