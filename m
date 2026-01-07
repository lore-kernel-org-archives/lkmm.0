Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020099.outbound.protection.outlook.com [52.101.191.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD113328F0
	for <lkmm@lists.linux.dev>; Wed,  7 Jan 2026 20:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767816262; cv=fail; b=Tm/r4Y0127gs1QlbytBZT8F2j74I6r1F+tr9DkYM5RI1CzCftZoGPIUEWnby1kcmF/OY/0TWLO9qL/aLBhdxHDJkxru31b4bIEsGSI3w894J8BP0uGENKjWdqIO7JEJcqqvybOAJng9rJ8YKEDWX22Yz30BDjHYcywm0dzs8jAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767816262; c=relaxed/simple;
	bh=Chn3vUyBHK/nGsYF6G+PUN0CtaAWuw6iS91ZaBiqW3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EKNvhall/Mmo0+9v19gl9kwgezXntWz334GBggH3RQYY4gSHL9At0uVT2G7zzSlRTfItJz6Yr4QdtZzHYnp5zEn7qJvd9AUDaDPizLg6D0IhuKB7dyPr+vrtQdg+65junWTH4aK6CJM/SAmhZaH1YMztkFHLkwJPS4+OIEXCjVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=YRo59po+; arc=fail smtp.client-ip=52.101.191.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="YRo59po+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc/mdfCJWbHQV2V/cgY5tBj6eJhEvmLgeYoiYbvX0AarRPhypIoAqdXMs8cRoq5tgCnojcB9NA3mP37qS8ujjI1z/6VLF/E06CY0wB3lIfGiMx2hJfDJkLHImuk3elEbNM5S6PwgIEkoPQnEVsZJKu4mtMCGvWbZg/GAWyJEsQlzCVyY8MCWZkt2u6YrNG/tou4e3tRP2VYGXNbWKUjKrp/eNvoRYKh1BkZ+gwVP4Uka0v6TeUR/oDu1g/PwHJmdx2/lh0KJtydF7yXluDCq1pJl+o4lXV6MPG+R3+imGt/cCzojzkHfhg73C7EtpmOAW9QfOQH26DzOAFtJXn6oRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBuuWMKJE6gQChKNPm1Hf83VgJqPUK0Jxv3WZKG6D/E=;
 b=BrnCaSZ1FEeLTigLpBEh1SmrGvvvzcp31GbouHf3m1n5zFpOgrmcyIS3W1XkvNLYniFKLwfbWodY7Vz8pD+Bb8pTFwkjQyy7PXY/GES+rDB52V1wZvNxuu71JwNtpkde5Xa0nrT9N4A8ju4cA07py/xEDlgrMmkdTMZ4thsdrcSA4DZ5P0hzaKPFkyuTRo5aZieAqHg69nnmwkM2f8OjAtIP5pntbsooIVLAuJDFzVJO9kMHC915pq6/CaHwJX+dK6l0VSRZF+rZN4dGfnbqSh4fEGqpu3FtumFshwe7NqBA/RgYB2jUEbduMJxtAcdxFbjzelg8nlpQiZ9iGovGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBuuWMKJE6gQChKNPm1Hf83VgJqPUK0Jxv3WZKG6D/E=;
 b=YRo59po+y6vPOn7V3GVKjCROplKDuryRZ1sBExx+rE1McTQnHVpRu7IAuJxg9d7wcAd0wIoKAJJ6gxE3niDum1MdIUEETuyp6SI5rkSxmsew5UGBrQEnRR3CTs/mrmsZwX6nk3ZOghDd7+kcGcQF/4+igsJfS5Lt56myGA+nnko5kvmQawsJMKshytk0qwNEpJyRMJCM7sklVMAjf3ValQozD4MvB1xBSizkv94Z/yzJSSSLmMe2qTtB2oTJb2tzvWt4prkKA/rzp0CLgnx/eS2s7adjcy9hBjEZq2k+AMz+ul3a06cAAV+CbdC1cNDgENjCPAMZD3NFFHYkG+iluQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a0::18)
 by YT2PPFE7189E232.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::49a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:04:14 +0000
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31]) by YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5ebf:cd84:eeab:fe31%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 20:04:14 +0000
Message-ID: <2e8b6065-cbbd-441b-b888-1eea26f716b7@efficios.com>
Date: Wed, 7 Jan 2026 15:04:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
To: paulmck@kernel.org
Cc: Jonas Oberhauser <jonas.oberhauser@huawei.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 "lkmm@lists.linux.dev" <lkmm@lists.linux.dev>,
 Olivier Dion <odion@efficios.com>
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
 <13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
 <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
 <c7464e0027f9403191d0d3638558bccd@huawei.com>
 <9b839ad6-eeb4-4b95-b471-ff1058e1ecd8@efficios.com>
 <c284bd91-c27a-4e12-8d7d-82def9798fc8@paulmck-laptop>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <c284bd91-c27a-4e12-8d7d-82def9798fc8@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::27) To YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a0::18)
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB9171:EE_|YT2PPFE7189E232:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9fe20d-ac22-4d3a-0e0d-08de4e27ee28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlNrNXhDTmVQbnppR0N5Z1ZUWEYwSWlLNFpNdkN5eGxtcG1SVENlN2M1VlhZ?=
 =?utf-8?B?MkRCVHhBZGxwS2w3dmR2MW1iQ3BGbzJCblFmRUlFaU5tODd0VGEvUUg1UlVZ?=
 =?utf-8?B?MnY2REdjZ3VreW12ODdXRWNSemJFRFNId0NHZ3NBa2I1OGNUYXRUZTJnWTZU?=
 =?utf-8?B?cXBkR04zbTI1b3lvckdRNFVqTEZRTWJrYWlneXFFeFpjREQzUjRhNGNzRWtG?=
 =?utf-8?B?aGdJUVJPcVBBNS9LM2U2WW0vK05uQnhqMFdZeXdRVUNFQmRFVVoxLytaTS9z?=
 =?utf-8?B?L0lKcmNTYzVyQy9STHdISG1rdlgzVWRwRUloeG1tWTY5SHVyT3RObzFmbFFp?=
 =?utf-8?B?ZGdlKzFqWlZyR1F6UU1xZUhtcWdYajVnTVZrNFpDdWNYV1d4TXA0VWZYcGM5?=
 =?utf-8?B?Uzc4MlhwRnF5Q3lWeXIyYnhaL3BORDlaWGR2eDZ2RmE1WVJzaEJxOTdwLzc5?=
 =?utf-8?B?K2k3N1lXTDdzOHRObG1oU3hJUEI3WXp4ZVN6K3kyWTR4aG1Mc1krUHJoa0Q5?=
 =?utf-8?B?MHpUekhOUGttMHRDK3FIRHZpOE9xZElFbEdXQnY4elhoRjBudDdKRytFSjZv?=
 =?utf-8?B?Z045Mno5SkpVN2FzNVIreFhMYS9LcUNkR3VFTks0ZkorQi9waG1UQnRja1B5?=
 =?utf-8?B?NlF4S3lPY1ExZkZsUUpmOWlvb3RMaWhEVHhhUld6MUxPTGJRSUUwK0J2UW1Y?=
 =?utf-8?B?Sk1aRDg2NXNxTm1ibjB0bVhpTkplYUNkem15bktvclVaQ1NLWklFbWNQZ2ov?=
 =?utf-8?B?SE1iRkRPM0NtSjRIWTRwUGs3OUJiTFo3VWN0NlJOcmhUb0h2M080ZEtXSjlQ?=
 =?utf-8?B?b0FhSmVER1p4aEY3T1N1MU9FL1dnamY2WUN2dDhqaHR6YWpsTGJ0RXZVS3Ax?=
 =?utf-8?B?UlBmV09IdVUzMTBYUkh3N3IwbFJ2TkR5Ky9NNFEyK1ljOUNJTkJnSWVFV2Js?=
 =?utf-8?B?bjhDM2pKTldLNEJjcXNZelFGYzFpZFFkMUREWGd1REpvaXcxdm9HV1h3eFNY?=
 =?utf-8?B?YlZFNWlKUk5UMlQ3LytqUnZBKzcwMXZ5YUROUW5aR28zUkVtSnZQZ2xoczZq?=
 =?utf-8?B?OWM0NldFd2xzeUFUbFJVdDVocTREaUtDYWRqR3d5UEVkQmE4YWd5R1NTRFds?=
 =?utf-8?B?V00wZDhUNlFoc09Ldk1ZMWx6UkRqOFJ2Yk1jclpyc3hSdjdkZjFOTi9qQ2da?=
 =?utf-8?B?b3JTcGNzSEpHVUEvZFU2b0pRSVZJMlV6UHY5VERpZlUzWW1PUmp4R04rTzFF?=
 =?utf-8?B?Ky9qRTNKM3V3RG4vZ241eno0OEJUT3VIdTFuUWVGbmFRamRRanBIMXI2YUFv?=
 =?utf-8?B?WG42L1ZOTlhKZ2lJSHBYZkQ2UCt0elNacnJzVXgzNElMdG1jcVZ5Ny9rdzls?=
 =?utf-8?B?UjV5NEdHd3lqZ1RXMS83NFJhN0daRm0wK3I2NVc4UVpjdklBTWtCSkcwNG56?=
 =?utf-8?B?d0xpeGYwUEZnRnY4Y3hxanE3aVlNSWxqNEFjZDFiemxncTB1R09Sd3Zab3lZ?=
 =?utf-8?B?RmtjSE9UTnNCT3lWL09XaXRBWFZpazJ0OWEvc3cwS0Y2UmtKUnpJUVB5UHQ3?=
 =?utf-8?B?UlNHWGMvWXNISkhKM2RhS05HTDc3ekNtNG9XeVk3cUpJUFdmMkhxZmllZE1C?=
 =?utf-8?B?Nmd2UWdmK0kwcDlsZWZuckgvSXRWeGxVYlVibisrNnlmV0orSDE2VWxCMGcy?=
 =?utf-8?B?ZFJvRnlKUXVXK2FNcVZBRkdKNDhjQUZUd3N3ckE1bWcvZkhRVWZYRzFURzNV?=
 =?utf-8?B?Y0NWRGZnZldsVmZJOTBVZjJSNXJSbzZJZkFLWkJaZW5JV0FLZngvbU1Vb1NH?=
 =?utf-8?B?V1ltekpadFBMeE04VXE5dzRVeDNVM0RHN0orWlVuckpSSGZlQkNyQlliNXRY?=
 =?utf-8?B?eThVVStkT08vd1lOdjc3UitrcThzc2FnOExvdFBhSklicFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUViMzU0ME1QbDk1VU4rR1M5ZitzM0t4b2dQM2NKTWNGcWtTTlNhVjBlTC9R?=
 =?utf-8?B?azBaeTFUZzI2bFE0aGZhY3VYVHBMajJpb3MvL0ZpcDBtNnVubHJkV3oveVVi?=
 =?utf-8?B?YUxlaVJUTlpSTEtJWXpvRFpPSU5uajJNcHFndzF3aWpXZE00cHdELzJJYjY4?=
 =?utf-8?B?NDM3OUdzWHpSbXp0QnU0aWdqRnFwMzNuK3JtZHNIbUMvM2NDcDNXd29Xby9P?=
 =?utf-8?B?ZVAwWS81WFo2cHg0UUZnc25HU0VnWmZvZ2NmYnhQaTRSbFo5aFpqS09LeERj?=
 =?utf-8?B?R1R1VkR1dHNVRnVibUZpZXBiQzhHT1NueFJsSXJsRGZ2NXFWaXk0YjVta3Bi?=
 =?utf-8?B?TWhvdm1VL2ZsU3pOQzl3RXhUc3hkM24xQ2FybHNpMVRHdjFSV0h1UFVnT1Fv?=
 =?utf-8?B?UmRNV0hGUGIrcUkrTENzTVpZbFNpVGZmV29nUzBIQ21WbGVqWXkvRWtrN2xk?=
 =?utf-8?B?Qjd0ZWV5eG1nM21WaWh4dC83K2ZuT0ltMEh2Tm40Zmw5dTZic29YT1VzdkVM?=
 =?utf-8?B?WmtrWnBOZDJrRTNYZkJ5dGVybUl6TTdGeTA1ZmFJL3NPUWlQODFGcExheG5C?=
 =?utf-8?B?VmFYT2VJMDBMZXFYd3hHZ3F0QU80R3NFNFV1UjNHK2xuQnFEaFFOOC8xbERW?=
 =?utf-8?B?Rzd3VUowNkFHTzNpRmVrcFJGQlpCYThWU2lUdGQ2WjdFS0RDN1B6T2dvM0VJ?=
 =?utf-8?B?YWgxSnJLM0taeVdqdlJXczZCenBtVTVUUEFGSWo4NDh1cDdlVDU5VThCOVpl?=
 =?utf-8?B?WkYxS0tXcFRTay9KbHU3dnBDeHE1ZGZWYllSUkVYdU40S1pyK0ZFYW1vZmsy?=
 =?utf-8?B?cWtlUGowVk41TitnY1cvcnpWWmsyOWtiUkF2RFJ3eENRVEV6djRGT3FwQU9o?=
 =?utf-8?B?QlE0T3JqZzlpbks5QWZHRm5wM2ZUeDk4dktlVFZDV1I3V1NJMUJlU2d3RFUw?=
 =?utf-8?B?SnhSS3JIYjBsbVVkY2VZVW5SVDdkVzdHcFhzU3h2NDh1UmFSMXpBWHhHa1FU?=
 =?utf-8?B?M1dDZ2Noc3RweFhjcUhDYnhFQ1JkT21rRjhpMWxMYUN1emNRMUoyZEdWa21O?=
 =?utf-8?B?NXZWek1GaExjeGZ2KzhVMEExZ1lnMGtHdmp3b0M1R1JHSHBUYnBjNktUNVV1?=
 =?utf-8?B?alJPeG1XbTJOSXJpZGVsclEydGJueUx4YTRoYzRLTW1qdS9KYjI5NE5WTUZH?=
 =?utf-8?B?MURMc04zNktyQllPcEdiYjEwUFNmdHdsM0Z5bjJrTklyZUoxU3BJamxlSm0y?=
 =?utf-8?B?OURhaGpBUy9uU01pQUhhempWQW9HcVVRRDY4b3dBenc5Z3JwLzIzL01XdzZh?=
 =?utf-8?B?NlBtRE9CTG1aTnpDZTR2TC9yc3g1ekhoR3ZJWDNmcFJrZDQ5ZUlGTDZWU2pk?=
 =?utf-8?B?SjVyK1ZjaFFUazFFUjQvT2dpTnMvYi92QnhwSDd3WEthdjRHcGsxSHlWQVhZ?=
 =?utf-8?B?M2R2djZIQUIxbGw3RW9SY21jWlJPcFVSa1lvVGFFZksyMldYNjZhWGpqQVlT?=
 =?utf-8?B?cVlWNnZOY0dZUk42WU9KbXZocDQ3eEVHK3BQOHc0YjRTWW1sNGtLenpmdDI2?=
 =?utf-8?B?NmlLZDVreEFPTFBNZXJvbTY5bndVUnp2cFJ1VFk4VmtJYW5OQ0ErS0V3aUJG?=
 =?utf-8?B?M01UbWN4V3cyT0luSTVqZXIyVWVOR3FXUXhodndCeG1uRjQ2KzBSaEdSVnRW?=
 =?utf-8?B?MTZRRFp6d2NwS2tVUHkyRzJBQW5oWlFXeXJvanBKMmVNNTFCZ2ppVVZRSzI5?=
 =?utf-8?B?amNNZklSQm10eHQ0M1VsU2ZldEZhTmN6dVlZVmNCemloWWtGTFViZ0RyQ3ZP?=
 =?utf-8?B?bWJOam5hVm9wSm1BVitNRG8wZXd0Q211UWRjTzBuVXVsS3VLOC9IL05Od2hk?=
 =?utf-8?B?UUtwTnpZcUxzQkhadHhIeDcxc1Z4bEIxMFdhRjQ1ZkJSRHYwSlZwZzcyZjBT?=
 =?utf-8?B?RGxNWXRxVld1OHdNV2x3R0VTajVFQ3dyLzQvazJmWGRSV2l2U3M5YW54eDcx?=
 =?utf-8?B?bVdyNHg5WTRReXdnajFzTGpSbGh6NURWaVFvUXNkaUI4U241dklzQVIySGU2?=
 =?utf-8?B?KzhuTlR6TnVyK3cxVWhlL3paMGFsZUNhblorNEprQkRCcExyZUJMSHk1S0o1?=
 =?utf-8?B?c3lsb09hRi83YWVHYWJ1dVFNWkRrb1JyS2lkcDExaml0dGpsamlSNmpDNkZM?=
 =?utf-8?B?WG9manFlOG91aE1aSGRaN1BSa2hFclYvQzRlZW1oWUVmalE2d3hrOUgyNDFK?=
 =?utf-8?B?V0xtYXZYTjlwMDFwSWJYbHUwV21mN3Z2RkJtTFprWU5zOWZtVUgvMk5uMGFs?=
 =?utf-8?B?WFZRdTNrTGJMWW43TG5HTUVCak9ZVlgrckxrWk1EOGY2VGhtOWh1Sm9YTktB?=
 =?utf-8?Q?cj1JMAXjbPLmR80E=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9fe20d-ac22-4d3a-0e0d-08de4e27ee28
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:04:14.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvn5DBOYTFH0Mf0057/afcK0DLUNFPo6N7+nYjhoSg/miNw1/jfrqC41fD7atLaCE+BsFJ3cLEyc5Mo6qh7egV2UaRHNZjWUwYm4tL95ock=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PPFE7189E232

On 2026-01-07 12:48, Paul E. McKenney wrote:
> On Wed, Jan 07, 2026 at 09:40:56AM -0500, Mathieu Desnoyers wrote:
[...]
> 
>> * RCU grace period guarantee:
>>
>> For the read-side critical section (rcu_read_{lock,unlock}) pairing with
>> synchronize_rcu, we've updated the liburcu read lock/unlock
>> implementation to use either atomic thread fence as full barrier or
>> SEQ_CST stores. We've also introduced a urcu/annotate.h header to help
>> annotating memory access groups. This helps threadsanitizer track the
>> dependency ordering inherent to RCU grace periods.
> 
> The atomic thread fence is for threadsanitizer's benefit?  In the MB
> rcu_read_lock() and rcu_read_unlock() case, is barrier() or a light-weight
> asymmetric fence still used?

For urcu-memb and urcu-bp, we use a lightweight compiler cmm_barrier()
in rcu_read_{lock,unlock}() paired with membarrier(2) within
synchronize_rcu() when membarrier is available, else we fallback
on cmm_smp_mb() everywhere.

For urcu-mb and urcu-qsbr, we previously (before 0.15) had the more
heavyweight cmm_smp_mb(). When compiling with the atomic builtins
configure flag, this just maps to atomic thread fence. AFAIK
TSAN does not model atomic thread fence, so we need to rely on
explicit TSAN annotations of happens-before relationships of
relaxed memory accesses ordered by atomic thread fence (or
barrier+membarrier pairing trick) in those scenarios.

Now that I review the urcu-mb and urcu-qsbr 0.15 code again, I suspect
we're missing ordering between the seq-cst store to rcu_reader.ctr
and relaxed load of the futex state. I have prepared the following
commits to address this:

https://review.lttng.org/c/userspace-rcu/+/16151 urcu-mb: Use CMM_SEQ_CST_FENCE for _urcu_mb_read_unlock_update_and_wakeup
https://review.lttng.org/c/userspace-rcu/+/16152 urcu-qsbr: Use CMM_SEQ_CST_FENCE for quiescent state update and offline

We're also missing a TSAN acquire annotation for the urcu_mb_gp.ctr load
in _urcu_mb_read_lock_update. This is only relevant for TSAN analyses:

https://review.lttng.org/c/userspace-rcu/+/16156 urcu-mb: Add missing TSAN annotation to _urcu_mb_read_lock_update

And for the sake of combining the store+cmm_smp_mb() pattern into
a CMM_SEQ_CST_FENCE which can be optimized by architectures,
the following commits:

https://review.lttng.org/c/userspace-rcu/+/16153 urcu-mb: Use CMM_SEQ_CST_FENCE for _urcu_mb_read_lock_update
https://review.lttng.org/c/userspace-rcu/+/16154 urcu-qsbr: Use CMM_SEQ_CST_FENCE for _urcu_qsbr_thread_online

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
