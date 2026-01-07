Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020079.outbound.protection.outlook.com [52.101.189.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E66346FBE
	for <lkmm@lists.linux.dev>; Wed,  7 Jan 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796867; cv=fail; b=p1/blUAW72SsqgIUeI6jSggaoz8386mUAjPo8MP+Lu+/dQIGY8ZCMzZB/833Y/YEUhksAofjra1kbYBg1cWe+TnKJtWnpM3mE+ew6rBKPKF3KGt7wZET/4Pzb4mbEVJXBf6MW/Lezv7bEf9PjO2/PBzGQO2/11RaDzn1fy97qBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796867; c=relaxed/simple;
	bh=MMMP+TWNSc1DsBekcqydcbbBRvxfvMYjAJd3dYY48Zs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bn1KsoooSFUAbdd4qPlv9iGMrM0H0JrF8BYe+wZvQOLgOqZOP0y+P9/8Tm/D8E6N2Bh5Pyd29sPRJ1dYtXxwIK+Mj1srf3uj+xoDsVmQssq2WGHRgFDFdbJYoprZwkCJEdd7/sahLfwnCj6XnGqxaFmTeue8l5f939pEHQyHggY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=X36ne0ef; arc=fail smtp.client-ip=52.101.189.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="X36ne0ef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=busFPawBKA4gdIRpGglkKHzuSqQpWtrcBowr5ddxbV1W1CQ31FRWL4NoFX8kroNGm6SDA7LqJePNfyFTOtTC53Ke8dcmXx/TbbHsziHuJYEEGZIwnFpCOY16FjVZ7UVT/paaPZUT+qiKWZ5rb86ldhDg9+lrkddjYH1HYpCTNOHN5OrPYbbc7mqKwGtl5nsbMsnVT6PSa95k7bHZ81aUUcofxqe2K/06PasB2mNrIdY2dAYeCxajbmJRQHtJBORdgm6PWyvUzPD/xV0dUsLN3HICK/I5vS2ayst3C+FmUCWZR9Kky9T7MuYV9hl2oi6ASkBNfWQEiPNAO1EjZgTbXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NKGBpBRLOlqktywV7FeEeIclGTPUPMb7n8Kgpg9JtA=;
 b=BLGKKEC3IgidoKIKyZJ1bCuveKfowjhfpCOSN05NdC0VB5Q1LrCRWMY081+PL7RUwAIQfNArq+UGrusfdkQgqukeBE5MyXsVL0+5L19J/SO0ztR6JOu5+VGV3QIHGEFFOzQRhmITCc64LwarDjFBD3E1aBYUTsDhMQQrl4YaeLTsjW3NkiLBM1vdkO3iYlJ9TR/Fq20AAGslBeo4ofckOJ3wznsQtfxgywfXJitoVr7IzkvNFnv6OFyIpdZh4yGYFkumoK/ggaI95QxCCU3Dbeu00+LyEyesK6m14+TBR8wMb2vO8qEx8T9bN8KaWUTbv3fb3chh91VXcRG6UyuxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NKGBpBRLOlqktywV7FeEeIclGTPUPMb7n8Kgpg9JtA=;
 b=X36ne0efEAvgqWTV4epwbW7ezlUa9zjyDD3G2c6lmB8ayuDKGJLno6Ftnb1E7NENFN0irLyXm+XgfV2FXDgAU/dRYI5wP/PsxntVJQ6tZ/wIMinNvLmhRkrffsKcl3LENgJh7Zy2YvHz1EJjtcV9Gd/16UsLJkB4zcApP/LNqzN1ysUnmjEHRDq5s8KqG8FD85aZNWPMhIGcuyAW5G4Vy+/IfqN3entLhVm7Kocax5Y0UI0X1c+WGncBWqVLAyhIvqthl0R28Cxbr+v9d5CQSrIaamx0PL57BI6yo28LSw1R7fYc5k7itQAMRSWSMzLS7NpE4JAZCF84sUUkFK7Sqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a0::18)
 by YT3PR01MB6406.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:71::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:41:01 +0000
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31]) by YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 14:41:00 +0000
Message-ID: <9b839ad6-eeb4-4b95-b471-ff1058e1ecd8@efficios.com>
Date: Wed, 7 Jan 2026 09:40:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
To: Jonas Oberhauser <jonas.oberhauser@huawei.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: "lkmm@lists.linux.dev" <lkmm@lists.linux.dev>,
 Olivier Dion <odion@efficios.com>
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
 <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
 <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
 <c7464e0027f9403191d0d3638558bccd@huawei.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <c7464e0027f9403191d0d3638558bccd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::10) To YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a0::18)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB9171:EE_|YT3PR01MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 0768a0ef-4594-491f-84b6-08de4dfac63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eC9XMGRNTjMwRDVCQ0ZLQytmVnRwYWtJV3pvVHBPcjJEVHEwSjdvU3NYTHJy?=
 =?utf-8?B?K0lic3BRNFJvZjBsUnFJSkF1N0tOYUV0SHNYL00zSm5raEVlUHZja1o4TUt2?=
 =?utf-8?B?bWxqR2FNUGRXS0I4Tlh3aXIxWVZZSDJ4MXhoeVI2ZmlwK2srdkRZMVNjNUxq?=
 =?utf-8?B?MFEzY3B6RktZZFdzeHNSSk9QNTQvQ1dlbHdzNmp2Q01idyt1cFQ0eWg5MnNk?=
 =?utf-8?B?Vnc2TUVtZFhjOTNXdWdkQ1BqZzdJZm80bklTNGFZcGxqOUdVVHNha2pNbldl?=
 =?utf-8?B?RWRpeTFGT25ZU3d6aFJJeThpVjdJc2ZIbHdCbkJqUjJQaGZJcnM1cUJtbFJR?=
 =?utf-8?B?TW9MTDlheE1hQXBiamY3MGFPbzFJVkx2d1hOdjVTaFAvMjUzQ3JscE9YeWVG?=
 =?utf-8?B?S1dMK25GeE4xNE1pNjRHMlBMSHp2bzJqb2JsczZZclBKSHRXMDdkL2NoOTVF?=
 =?utf-8?B?Ry9pcU5Td0R1Y1Ywa3VrcHFPdHBrMTZmbjd4SENZQkt1aWFiaFgzYTJkRitJ?=
 =?utf-8?B?eWxYZ1lFMEFJU2R1TklWMFl5bDMrWERsYnNDTmxnYnZ5UGlHUitvVldhckpa?=
 =?utf-8?B?UzZSU2VOWmhORUp5QUU3M0t6Z2FUejN1eEZnN2x6UHlSUlFOWTI5SWZNQXpw?=
 =?utf-8?B?MWQ5Si9yem44TTU2bEdMVG9Vdyt5alg0aXhwUXdROUZsbXQ3a2hyMWp6WWdv?=
 =?utf-8?B?c2dwbzdRTDlsRHNyTnlTc3BMM0kySDB1MjRjZnRscVpYVElmbzg4eUdBZ0VZ?=
 =?utf-8?B?Uzdma1JQZzhiRWh0Y0tleFljaVNDMXlHczZSSVc1QWRqUWhkams3SHZraXZq?=
 =?utf-8?B?OGlyTTdwTERVbUhxeExtV0pPSDVHaWQwV29MUGxWeWJrVTJxNERWZ2toOVdt?=
 =?utf-8?B?czVUUVNlSjJkZ1hMY1pRLzBqbUM5Y0xuZk1Tb1NtditRaDdSblJ0TDFiOXhU?=
 =?utf-8?B?dzVsd2ZrZ1l1L0pCUGhQOVQzdUJPTEZCa1pBTXNPb0pHaVZ2c0wxbzlBc2w2?=
 =?utf-8?B?elZWMmhoTTFSUGtERHZRNWtqaERrcXNyQzcrbHI1MUJxTXZDT0hZNmd6MDla?=
 =?utf-8?B?UTE4cmNrMEdpNDI3RURCQnl0Vi9JSEkyNWFWNkhtM0ZKZlFQUldvOCtlZUM0?=
 =?utf-8?B?bzh1VzdGSkJXYkJCWWpMN0dDNVNwdlRWdHF1QVRGTjRXVWprQ1VtS0MxUzhq?=
 =?utf-8?B?RWNXMHpxRXlnb2E1K2luZzQzVzRydVAzSmhMYnVNbnFPYmw0NHl6aHJteGhs?=
 =?utf-8?B?cXAzUnVMbUFBNWNXVklrYzFSUUJTRFR3VnRiTG5uV3ZoUXo0M1NHdk1Ddm41?=
 =?utf-8?B?dzNZN2hIWDZCVEFwRnpkaHFCUm9wNHFXU3I0SnlBaFhrT1d6MjBEVXB0Z1lx?=
 =?utf-8?B?aHp0SW92cGcxc3JaZTViRUI1cWpzVHpaTkJib1BBcjVpSkRZcUpWMzNjMUs3?=
 =?utf-8?B?TW5lYVoxbFU5ZWdHL3hVME5CdURRSnFKN1NsQXNDMWl4MEtRb1dEM0NrUnpX?=
 =?utf-8?B?S1l5TWlUM2xsaWVkNEUza0c2NGlYZ1VLSzhtTm9aZ3V2S29MNUZHZ1ZqV1VT?=
 =?utf-8?B?UWpyZUx4ci83RHNVbG9BaFhML2h4d1ZMd1pkUlh3c3Q4SW94cy9Keng2a2FM?=
 =?utf-8?B?eGxoVEY5UlBMTU1Sa0lIdnhXdUk3OGtDajdQRk9ZYWxWVS8vRkNUUUQwSlZm?=
 =?utf-8?B?NHlHSGxrVWFNSFgyejNEcXZBN1hSM0ZoMEh2Z0xILzBtVG9EUVBDQzhpY2hK?=
 =?utf-8?B?anl4d1RNdk9QOUx2Qmd6VFJTWnZVM0NZNlJHcWhJZTRJMTNZd2E3Ky8zUTNZ?=
 =?utf-8?B?ZThDM29MZGRLYnIzK2d6UDB1UTVOOXRzZklsMVFrZzF2ZVp2cnVndyt6Y1l3?=
 =?utf-8?B?RzhEaFVtNFlSK2ZtSmRoa1N6M1ZuYVBVdnAxVFJORVBHOXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZDbDNtS3J0NlA5RzRnTTkxbXh5MDI3YXQ5Z3RIQkp4OGN4d0IwTU9MQ1ZC?=
 =?utf-8?B?RDVPVGVqUmVoZGVNVC90dGJxT3lIUDZPb0xNWFFjc3RlSzJ4eWtmSlhOaE5i?=
 =?utf-8?B?bGdkNkY0WS85Q3BocTMrOUM0azRlR2dDbzI5SHJscXdSUGVBZ3YraWYwbVE2?=
 =?utf-8?B?Y21GV2s4RURYOWg0Zm1ITlNqL2czMWRmS1Rjd210bU9ET0YvUmZEQW1tS2VO?=
 =?utf-8?B?UVU3YkxGNzU5MTJmRFhtdUZkNGNYUjRGM2cwcTFhNXUyZ1ZwRmlCQW9uektn?=
 =?utf-8?B?V3BOSWN1bVpMMm9ySGMzUkcrMTExZjRMb3E0UXRFNWpvWm4yVXJpcUdJT0NN?=
 =?utf-8?B?SG8wTTJvMEsvcVdUbWdxN1JGNytTbHBqWThnaXJtamtobGdHclhuQmphU1Mr?=
 =?utf-8?B?aGNETDZMOEFPeSt2QzY4a1JTcFAwZzE2c2F3NXhORFN1SDN1N3Z6WkxBbzFB?=
 =?utf-8?B?OFZ0Qkd6bCtDOS83Mm10SnppYUt3UXhIOUtyOUVlZFp2L2tma2lDd2FhUzZ6?=
 =?utf-8?B?Mlo1OTZTSXlTV1BlTnBQMjBUZ0RQVGoxcTluSFBUZGVhSDB4a3YycW52OVI4?=
 =?utf-8?B?SytYb004SlF0N2JldERSMjd2QjFGeTBndjI5MkUwdFcvVkRJRm9rYTRiTHQv?=
 =?utf-8?B?QythOTI0aGNpTXRzYzNwZndiUW42ek9IaXdENitNNjlpaTd0aGcxSnpmM3ZK?=
 =?utf-8?B?RmZGbGtpY3J3TnlKNzFTS1FhZ2R4OEl1TUdSYllIWnpxd08yblVMZkk2b1RU?=
 =?utf-8?B?bi9qYUl5elFHWVVxcnhQOVltblNQY2dmSGN0V1BlTFluVCs1S0o2bHhRODBr?=
 =?utf-8?B?OFF1ZitIcHlxSFV6bVZBNTM3QTFFYytLWXU3ck9VbnNVeUg3Yi9zYzhPbk1y?=
 =?utf-8?B?THpUUWNrRi9tMTNPTGJVM3A3OGJzKytGNngvSFBnNkhPZXYzbmZXalZSNFhn?=
 =?utf-8?B?cmJYRmlNR3NENWtWQzF1SklQWmFkT3VreVRTVXNGSnVuOTY5WFpxZmtFYWxZ?=
 =?utf-8?B?VXF4djFGN1ZSR3dhK3hSNWNvdHZVdC9rYjlNaVBDWXhBenNpZHlpOXNYRXlq?=
 =?utf-8?B?eEJralFMNFV4RDRYbTdRNFhWYmpjdTg1Z2k5MlgrY1QxdEEreUZUaFNod0c5?=
 =?utf-8?B?L2Rrbm42NkJ3YmFRSmIweFBjTGxENmpCRXFVWThaWUkza0w1czNlZEs3TGFO?=
 =?utf-8?B?alAzak9UY3lVY0t6OUpmOXo5L1lWcnhvS2U2UXNMNlRzNmEvcnF4ZlI3cHZa?=
 =?utf-8?B?enZTQkdidStQaDdNUWNETUVPTk8xVGpjT1Z4ZC85MG5JbTE3SmFTMlRLSVp1?=
 =?utf-8?B?K0Z6dWIvakR6NWVFbVRFYndXeE8zRHdBaGxScG1ZV01ZaVl3MGdkMEZCTXl3?=
 =?utf-8?B?NC9LYjNTZ2I3VFZPdm1DNUw3WUZHRmdNZzFRZy9nbXdxUUYwc2NYOTViMDNv?=
 =?utf-8?B?RGhZYkxyWFFTN1plSCtBVE5tVDdkZnErYjQxbzVINDEzN2dXRVZMWklLMVUz?=
 =?utf-8?B?NTRzUDdJaWc5T0MxZTBxOTRCbEtGWGc3YTczVEdzUm9hMEY3YjNIMjV2c2pq?=
 =?utf-8?B?VzF5dGw1QnB3anVhNVZWYTRWZDREMkFPSWhzSlYrcFRrdDEramJwWWpYWWNh?=
 =?utf-8?B?ckRxUnVLR0ptenhURDRHdkxwT1pHNXJMTzFHU0x4U2MyTWFGcklpbWRJNkdu?=
 =?utf-8?B?bC9nQm9lODFRalFQVzVpQlNaNzI5eVhlSEJ5Rld1ZDI0dVJ0M2dVZDNObWN6?=
 =?utf-8?B?c0JPdUl2ZG9KQWZDZFl4UE5pb0lwaW5qd0lzYzFnQitUTDQ3ci8zSy9uNmE0?=
 =?utf-8?B?WW14RzRHY09xb0VQdzRXQ1ZTbmlZMytzUFRJMytFU2E5dlNYQWxCN3J0Wndz?=
 =?utf-8?B?czhRR3dqa2U1ZW1HcmZrdEczRU5jUXZyVmpEWkxIQ3R1VnUzT2dZQXUvNjZV?=
 =?utf-8?B?V3lCekxFTXBFZmtyUnNOQWN3dVQ4Tk83V29ITlZ1NnZHbGYwOEFUaERhV29J?=
 =?utf-8?B?UndBK1c2TFZBMmZyU25HVkpYc1p6T2RlSzdzbmczZzBoSS9jSlI0OVdGN3Ux?=
 =?utf-8?B?Ym1odTBzdWF5WlkwdFk2MUVjT1M5bHlsZ1FzdVRhSzcwUWVBQS84bkdpcnRY?=
 =?utf-8?B?OHd5K2hPczlpN3ZsUVFDUVhWb1JPeEtMVDRaQk9wOEhoNjQ5Y1FKeGZ2Q2g1?=
 =?utf-8?B?YVFDcTRub0hKdTBBMUtGTThuU1NFM3pXekFBZGFjSzgvLzBQNEJDRkxhaGVi?=
 =?utf-8?B?WjNIN3cxYldmVUpsMFZudFZJVjhFOWx1Y0xuMko2YnJxWlJXU0JpVUUzNnV6?=
 =?utf-8?B?Sy9nMDJSVktJMThnS21DZThPZlFFa1dKZ2tXNU1qMmNnRU9yTHdLWk1PQ2pL?=
 =?utf-8?Q?0e1QGw9U/ZEGDmjw=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0768a0ef-4594-491f-84b6-08de4dfac63a
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:40:59.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZFT5rn+9E2v+eRr46v9B76dPnYIvupRdNlYTh1g6IO0/t3oE4csbAXbmcMiBh4E8D7tCX9atWTLrqK3UkC6XqjnQPGg9NqTlFv1Y2aRU3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6406

On 2026-01-07 04:38, Jonas Oberhauser wrote:
> 
>> liburcu uatomics and "cmm_*" API initially aimed to replicate the LKMM in userspace (note: this was done circa 2009). However, starting from liburcu 0.15, we extended the uatomics API to support the C11 model
> 
> I expect the C11-style-semantics will have a lot of friction with RCU (at the least because of missing dependency ordering).

* RCU publication guarantee:

C11 has the "consume" MO (which we call CMM_CONSUME in liburcu) for the
dependency required by rcu_dereference. AFAIK it is implemented as the
stronger "acquire" MO on most toolchains today though. For those who
really want to keep using a volatile access for rcu_dereference in
liburcu for performance reasons, we introduced the
URCU_DEREFERENCE_USE_VOLATILE define in liburcu. This pairs with a C11
store-release on rcu_assign_pointer.

Note that the CONSUME MO with store-release pairing is required to
let threadsanitizer know about RCU publication guarantee ordering.

* RCU grace period guarantee:

For the read-side critical section (rcu_read_{lock,unlock}) pairing with
synchronize_rcu, we've updated the liburcu read lock/unlock
implementation to use either atomic thread fence as full barrier or
SEQ_CST stores. We've also introduced a urcu/annotate.h header to help
annotating memory access groups. This helps threadsanitizer track the
dependency ordering inherent to RCU grace periods.

> Things like rmb and wmb may also not have a clean formalization in a C11-style semantics.

Right. We've been moving away from cmm_smp_rmb() and cmm_smp_wmb() in
favor of explicit C11 acquire/release dependency chains within the
liburcu implementation as of liburcu 0.15. This facilitates integration
with tools like threadsanitizer. The rmb/wmb APIs are still there for
legacy reasons, but users are encouraged to move to a acquire/release
model when it makes sense.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
