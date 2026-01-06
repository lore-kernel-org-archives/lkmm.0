Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020089.outbound.protection.outlook.com [52.101.189.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E5B3346B2
	for <lkmm@lists.linux.dev>; Tue,  6 Jan 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767711163; cv=fail; b=UqlPLjKCoQfBiv9dEr4jV/JChDngKmYd/xbxiyNm1RkQxkYBlfASJKSS4vQIs+ti7YmpuC0CuUKeoPWUFzLA3lzdJZEHvdymisUJaUDgdTSvEIvtD57VkTg0+SI/26SgX/HGrH7C3RP4WPKDcS/8KwIFRLT16+9yJjlWHZQAYiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767711163; c=relaxed/simple;
	bh=cFcQaT3djrshL4uP/3iWeCTDPmSoUsAP1+t3FIlpt28=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Deh8KmMv3jlpiWDpAyUcgsmEKp9T8ArbZqT2iGCauQTukuVfmL5TRQXmYdwmKLgB07xexflrVsAVBYxyQtyYWFvnXMlsZEP4gWOR24zHHhLTfHk8nx9Dv2sVVEuNrELocVV9CKlsI7wrbRpEbazc6nuZsnj7AOpNvY4st62AqTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=mXMTiTrz; arc=fail smtp.client-ip=52.101.189.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="mXMTiTrz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYmLUbKus9fyCT41lE24lhKAOx3BYmtrpg1fqjXK05AAAuB/nI5RRCvehOmaHFJL9MmJkBRM33KEjdvFQEGCgmZrZ5PPGy0mhxvnxZS3G4VJyTaPH8+9n7vYKygqU0zDAoOCuStd9fXCDZn/HXYR/DcnV5m8nx8kO4k+xYCTUluw2q/aRRi/Rjt/HSNwbUbbGNVaWvAlGurNM410SYGgs2CKLIPH3HQ7x+/zNWUoRcvMTOnAMzHnkGvQLg5MHzPRU3PKMAGKUy5rMpA9yLJoWCI7YPagj9HoJkTm0aSIeeGTGskSTNni6Q5DnPmYBe4cnrMCEpyjWFfDXRXjuG3MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBUbDf+fLNCg1NpbFLPp/AxnzaFnx7ZsucuxTYltR04=;
 b=AMZISpnpZWgHyEN/LGB8VLZ7z5PPOn1bb+c4VcQeHudy29rBybB8tRLRZNNCI8sOLR/EZyYIaAQUKI8RT4+Jydtypd0XPeuGKlqQmHoFMmdQIe1RQdXAqY9AEoE0l5KfU93hzWnZS4Rrrz0FbGhTSA/3CY6lsvE3dpFc/yi4fOfpAKU6blEnjc/a6Vu3yb+7XvqmT8pD5fR2txgCKGcYpj/dV6PTo8PQnNG7lGRhcrwmZCdvFX5mw2xobMjNHjfjfEAmuE9mU5Dk0EmvPxXarvw9ZtTURQIyFVLY6y84YCbfzOrUggpkRwS78nBvVLJQFWVcapsyK7FDvlkOQ/Yb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBUbDf+fLNCg1NpbFLPp/AxnzaFnx7ZsucuxTYltR04=;
 b=mXMTiTrzk+2OlmEwMVtVmPAEGrzWwh93KJXfBgmMrGE3PcP9eaXlEFHMriNEdF+TAC7SRa9+wfuzkHloia3VeNKbEURAouA5fVx7viGMOgRlP+NJF2mwXPBg+cz5LOgBuKqtCqJQ6q4Wkuum1nr7jjY3qxUghLOZn6nmSQS218hIkeUkpRctL12zHvPfNvgIn1b4AhDVkT59pbyU+S4bbdKmLwKMfion4gKciqUllpe4iGSHD5Nx1pja8hjw9kPBtDWytPu3KbfBFOvjhpHYcjoSFNb77LIaF3P/Rkon+0plFsvnRF3bH2fxfqgacB0vs7pSf9i2lhtiko03hOec/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a0::18)
 by YQYPR01MB11654.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 14:52:38 +0000
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31]) by YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:52:37 +0000
Message-ID: <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
Date: Tue, 6 Jan 2026 09:52:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkmm@lists.linux.dev, Olivier Dion <odion@efficios.com>
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
 <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
Content-Language: en-US
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::20) To YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a0::18)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB9171:EE_|YQYPR01MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf30a32-920b-4f58-9c79-08de4d333be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE10cDdLSFBJbzcvYjF4VktDWkJtR0xXTmoyd3dXcFoxbU9qWEZkR1ZoVGJj?=
 =?utf-8?B?czJ5dGhnZEtBTTdiRGNGaEY4TmlmY2lPR01qTmE4UFIrQVAxbEdTSE1TQ1Rn?=
 =?utf-8?B?YlVtVENBakpma2tWYnlnK09GekFHUmJpWkJGclh6Z2gwZFowVDlnYUxoeVN5?=
 =?utf-8?B?QTZlWU5Tb2FRdnZQRWlUdWcrREI3cVJ5OVVvTm4zRU4zSEREemgwNGpWdWVZ?=
 =?utf-8?B?MWdndkRobmlpSzBVazRmbzhTdGwrb2xWT3VjczRuZzFxVDlOR09hMWV1UzNL?=
 =?utf-8?B?SWZ5djV5WEJuVzVQYlo3LzZwMlFHMFJadkRlaUZkQlYrbkJrU3QybzU4anpI?=
 =?utf-8?B?UEx0dGZRWVZzYnovd1dJQklXVlkzSGNSY1FQT1F3b1Z4OW9ZYXJXM3M3Ni9M?=
 =?utf-8?B?c0lCUDRUN1JsN1BVZ0s5bHNtMHZidXV2WHF0OFkweXlHNjY3K1hjak9vL2lT?=
 =?utf-8?B?aGdZY3JuREpWWGpROUp4THByejY0bmVlOC9Kem9GTm9VZ3Y1Ni9lNFlqZWxL?=
 =?utf-8?B?aTM2R2pMUXlqSThWYmpDeC9sZlVNSUE5MmlxR2I5SXJGRWw5RFdSWlQxSlVa?=
 =?utf-8?B?RjF3R1BOVWlNMjFTMVR2STFmMFlDTTVIWkJNdWg4OWdBVVJwWWJsRDJudmVa?=
 =?utf-8?B?NmJMd0ZaNWtMaHJ3S1l3M09LMmlma21VVHNvdVhWUWdvRFE2Tlp6TkZnNTV3?=
 =?utf-8?B?R3pNemNzR1VZNUtqL3hMeU9wbEpEaURRdXR6dXJBZmNRQ0FiRUFOSVVldjFH?=
 =?utf-8?B?MkFycmlFS3JVVndaWU9EenBXUWowWnJrL0Z2aXVTTHdHQjREV0ZnSU05K1Uv?=
 =?utf-8?B?bi91S0w3QVhoMnc0bzVGNW1kbEFma1VaZ3NRSTZYZ09iWTVrRG5hU2pzWW9W?=
 =?utf-8?B?MXk3TkoxY2lDeUNMVEpQNkp1eDI2RlNNQ0hyMzArcWVPQmU2aS9PVzRoa3dF?=
 =?utf-8?B?dm85RE05SmU0bFRXaVdNdEpWYlZiL3VsUXEyYlhBZlQrMkdNb2YxWVduZVVm?=
 =?utf-8?B?bFY0bHBaeUhOUzk3K0s4RHlHWFJyZngyRmtseVZwY1Q0cXR6S3ZwbFpzUyt6?=
 =?utf-8?B?TE9QSENGekVWejdBUGxzYy9MMFFYa1VUVEtraDZrT0hVc2pVb2hEeHlBZmNx?=
 =?utf-8?B?Rm5HNmpLcUFHcHdFekZ6eXlzajRjS3FKZWNiM25sdEUzajFCNTJvZGRlSjhH?=
 =?utf-8?B?c3RaUHNRSFBXSzRGM01oZlRKY296UEczMWg1ZW9OU0p3MzBPeitkYUErVjRF?=
 =?utf-8?B?VUJCNlBQTGh0SFpnNFBCbXR0T1JMajdwSHVvK0wxb1YyS0NWS1NrK1VzY0Vu?=
 =?utf-8?B?R1ZGNzVPZUZvcVpVeVZ3QXJldkZ6TU0rb0hxUU9sRDdYZW9GUnAzd1hQbXlw?=
 =?utf-8?B?TTJIN2MrVFNncEg3Y3NZY3RZS25ndnhhWGtMWGdRUmErNHM0TElwRHFQUk00?=
 =?utf-8?B?ak83MzBudy9MUFpSRk9DWCtlRU8yU2ZWRTZNS3BGbzcxcmtlRFF1YlBLWWh3?=
 =?utf-8?B?NDJTTFFyWlVSdGdwOWV2ZXdOc3J5UFNIYVZNTFAyTExJL3BvY2M2MWtISWI4?=
 =?utf-8?B?S3FXVTh5QjhvUU5zbE1KRDhFb2pxTFkwV0l3aDBZQ21PelhFZVRsRGNkOFgz?=
 =?utf-8?B?Y0RrN2pvMmppbXB5ZkdKL1lPSGZFU25zQU1KdHBLMmN2aEVySENoaWxyQTA1?=
 =?utf-8?B?RnBuakZoQUg4MEhIWE8zTysySGxPZ1lYUG1JOGJ5emdubTgySnl2NUEwY2Ro?=
 =?utf-8?B?MUxkeExGVzJoRHV1djlmVHhOMC9tYm9HY1YwTjlwdHRqcG5YZWR0OWtlNFhJ?=
 =?utf-8?B?MEhJVmNWaVBjblBoVTFRL2VXSEE1TWZwOW1pV3hiaUtHdWxKOU1CcWppK0hL?=
 =?utf-8?B?WkUwKzNsYWt4MXByQkZaRWF5VWxod2dkT1U2dlZkZWg5R3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmpPa0xQV0ZtRWIrTW1CclR1cktPRXhFdHQ0UUlaTjlhVWw5WG42K1RzL2RD?=
 =?utf-8?B?alVMekFyR1FtVjRwZXcvZitGRkNkRDUrbEJCQUkzMjFjd01zRGo2eHJQdkFI?=
 =?utf-8?B?TTRGOGJOL0RVdXh1YVE4bFovalovc1AvSnNmWUpFNWs1dDNrTnpFU2gvek96?=
 =?utf-8?B?NnZDWmpNaGZRN0lTc2FpbUU3elpHZVROT3RaNWt4QWp1THVneXhnaWQ0cm9y?=
 =?utf-8?B?dkMyaHhaZVhBZFpIZTAvYlR3aTdWL1F4US9ybVU1blpTUE9rV2UyOXB0N2c3?=
 =?utf-8?B?M09YMjhZQVh3dlZUWFA1RGNaZ3JHNnN2dHdodHAxaDZITzFwV2syS1hya0Vx?=
 =?utf-8?B?RjlUU1pZb25SM0FqZnpZNUk0VXBuTmN6T01UYkpqOUJDdUs3VVBQYXc1YlEw?=
 =?utf-8?B?aEdWN2lSRGEyMnJvVFE3ZXN6SFN6UE45MURWT1pvSHU3L2xrZHJDK3orbGQy?=
 =?utf-8?B?VGowVWlqWlE4Y2FxeUVnQTJrMG1BMEFzalBaNEdRZ0FROTlaVDVxYVl6aXR1?=
 =?utf-8?B?d1g1ekxYSVB5OFUwMk5GWldsQ052UmcyMkhpdlY4L1lYazhGUlVFVU9GM1Bl?=
 =?utf-8?B?MDZIWnBoaWJXYnI3RndxYUNBNUtCMGJrckdmS3NrKzl1cklhSUl5ME4wbHMw?=
 =?utf-8?B?NkRCSHdsd3UzMTdINUI4aXpqVVlaUWVra013N2xDSkJkS05BTnRWQUFZeFds?=
 =?utf-8?B?TUR1RVA3Vmx6bEZYTks4bmowRU9RWGlBUFhjZU5wM2hXU09hNEp2dXA1Vklt?=
 =?utf-8?B?VWI3VmV3VHZZSWcxdDVQdzhldjJtTFpvRDhVeVE2QllsdTkrclJVQ0p2cUFG?=
 =?utf-8?B?VlpxMWMvajNLclNDYXk2UW82b1cyWXJhNW44OWVPY0tKMDhoTmR2bjdJeGVV?=
 =?utf-8?B?dFY5YW94MFlENjJEM1JwS2Qwckp5UWtCN0Z5bnlqRWN2QkY4LzR1c0J1R1M1?=
 =?utf-8?B?RWRqMGZNeFdNb1hRMlBVeU85YUN3eCtMQjVIQVpsOUtEL2NPUUNhWlRMWDlL?=
 =?utf-8?B?bmZPaHIydFJtVlczOWg4aU5qZG1QWGwwQTNrNkkvWVFOMGI1aURwVXJiNG9y?=
 =?utf-8?B?eFN5YVJ4SFNGU2kyN0lBOWtNWmVwaUQ2MWlCWnc0RlVKL1cxTGZVRzRuUzIx?=
 =?utf-8?B?YzkrdXU2NHRiZFd5YzBJemNNQTBXTDVqeXVPcVgwVnZjbVBTd2F1Mk1OZUpL?=
 =?utf-8?B?cXd6MGc2L3A2aFcxZWZpVVNVSmZCdjlWSlBpSkwvMnF0SGVmT2FGa1AyczIw?=
 =?utf-8?B?NGVSVXNRSnI1NTB5Sm94S0IvdzNTNzl1REY3aCtlYittT1NSVmJkTHRkUXNN?=
 =?utf-8?B?MU5UQUdCdktKcmNweUxHVGYvcHpEd2tvcGhuOVpFblRHczRmdko4UG5mZUZM?=
 =?utf-8?B?eDRGLzQ5MllHSzFoRVJmSFNHUlZjRVpQcUMzUFBWMjJkUkRxdWhCSVNKWFl2?=
 =?utf-8?B?S1kzdXQycGJVelJkVkVza1BxdFhhL1dGT2UzdVFqMUp3UXB4Ri9WK2Uxc0RQ?=
 =?utf-8?B?bmhCdkFsa1huMDU4eGc4M0E0dERzZGdWT09IMXhEWUdvc1FZWUMxYXNzbGkr?=
 =?utf-8?B?Q3BWU2pxanlGemJPQXFpSVlnR0FqQVI1RlVvdU43ZjZ2NGl0MmR2RVVtS01F?=
 =?utf-8?B?a3dXSEk1b2RPSy9rWlljekkvcGRLTTJMa2MrVnNYdmpjN1Q0c2hteDM0a3JR?=
 =?utf-8?B?Q1I3ZDBFcWZpSDJmMWg5VUhLT1NuZlpBTTRaZ0lNOWNuRm5YcXNjM2JrdTlD?=
 =?utf-8?B?TnAvaVRxY2NJZFRxNytPSS82TXFtUE8xbHdjVkRsSFdXZHlwaElPWGdhM3pn?=
 =?utf-8?B?WlBuTmg4ci9BRStPdVJsNk1tS2ZHejB3WHlobElVR3lPU0F6bzNYc1VKOEts?=
 =?utf-8?B?TFhiOCt3MDVNeGNOeUtENGZhOGJzeGppcHB3MnltZGhjRVpZSThiakRlRkhS?=
 =?utf-8?B?TWw5OXdRRDZrTGp3Ym9Pa2hqMXc4ek9RTWl3R21FeEkzU2tYNFAxM3YycFRL?=
 =?utf-8?B?UVljQ1cyb1NtM0N5Zm5pNVpFZXhuZUtPVW1BOFFzTXl3ZVhlMjNmUWVlUUkz?=
 =?utf-8?B?ejdRSjYweE1UYk9nVGVVdENmVFpScUkvSTB5cmFPWTJWdWJpMVBLYVpBVFlE?=
 =?utf-8?B?aW9DNWpCRkJsekp3eHVlYlVsL3I0UGV2ZWlDMTNXbjBkVmJoNmV1bzdwdlJK?=
 =?utf-8?B?L093ejRNb1FKL0lNQi9NOG5jSHhnVDZIamt1R0hwSlZsLy8rTTAxa0ZXbXU4?=
 =?utf-8?B?Nld0RXMxTTY5TUhVT2dGcUROTk44YzRlSXpmWG9SdUNaeFJjWUpLWDQzekNu?=
 =?utf-8?B?aTI2UW1NM2trQ1JMTThSeVdqQmFLeHVSV2xHdTNSNWYyTldyd3NOMmc4ZFpJ?=
 =?utf-8?Q?BJn4QkDMGipLEgpE7HgSoGZW6O9Ezr+X5Yyei?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf30a32-920b-4f58-9c79-08de4d333be7
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:52:37.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFeneQF1GiWMauo23tVuwHcoMid20gGBYjPrsGpH8Fx8L92C7WQGtiTuIwITGMgiCCTuNPwQoUpwl+9vZbQeIs9xW2+Q+RDc6KXx0jx7pbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQYPR01MB11654

On 2024-09-30 09:31, Jonas Oberhauser wrote:
> [dropping a lot of CC]
> 
> Am 9/21/2024 um 6:42 PM schrieb Mathieu Desnoyers:
>>
>> Porting it to the Linux kernel should be straightforward. 
> 
> 
> Btw, what is the relation between uatomics and LKMM?
> 
> Should I assume that they intend to have LKMM semantics modulo whatever 
> is explained here:
> 
> https://github.com/urcu/userspace-rcu/blob/master/doc/uatomic-api.md
> 
> Because on C11 model, dependencies are generally not considered

Sorry for the (very) late reply. :)

liburcu uatomics and "cmm_*" API initially aimed to replicate the LKMM
in userspace (note: this was done circa 2009). However, starting from
liburcu 0.15, we extended the uatomics API to support the C11 model,
with an additional "CMM_SEQ_CST_FENCE" which aims to fill the gap
between LKMM and C11.

Starting from liburcu 0.15, you can configure the library with:

--enable-compiler-atomic-builtins: Enable the use of compiler
                                    atomic builtins.

Without this configure flag, the legacy custom assembly atomics
are still used.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
