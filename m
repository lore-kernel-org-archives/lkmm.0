Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597462DEA8F
	for <lkmm@lists.linux.dev>; Wed,  5 Nov 2025 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332516; cv=fail; b=SPwSIxDLKcmsSoT3VlMofgBGmFDuNiCU2UHyctrroV9nPtpVZqe1UC0ZIFVoYS5jIm6HroNcgcb2gpbl0R7Hr9Vgrew0aWQh8yoxMcOQvsFjPPnsdfZsio2gAUHBpWLNpjFQp9Oj1hJbhT5tvqa8Krghr65HpMPjVlQwExsX50k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332516; c=relaxed/simple;
	bh=1x6XVmzabo4tQxNc1E64+rkm7/F13zkRjiM5URtL5YM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kA8xt/w9ub1Q7Yt6dvN/zCgHPXpq1NLBPvFwdoquDmTxMiQUesnEgCSpmp0/n/Y4EWpl7vZ25JA/tcThI4Bmd5zxeFWGuIe2KPH3xuSMcSws0LP5Ksctxys2XrC9xNwmZ8gf7Lq/SP+npUkuZTunOIpIL996hfpuzcTDR3UzCYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D7QA15tf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xfeKSLTC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D7QA15tf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xfeKSLTC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A58ibk6028526;
	Wed, 5 Nov 2025 08:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1x6XVmzabo4tQxNc1E64+rkm7/F13zkRjiM5URtL5YM=; b=
	D7QA15tfuTICEcINs2WoQLaeQ0eYAtInT8yXrYLqxH4K3JRiBhIX69kkcVGGOzCq
	F601alm9EeExBz8vx85GpsMDLt2A3xNqsmnNHk4Qvrg1NBWhOcGWHJuTvQLYbxPt
	5QlJUQC78egMH6zDxaVY8QGIRf5AOqmCXD3QH7EMJ7HALYuzV4NvOOXJ/A5IsWt4
	0XlNbfNjs4PN8Sjx0U+7fLeAnvl/AXK39N5xLIttoATHRp4VfLnTncxwYYVnoHfV
	W6Q2b+Cc+cE6xM1Fpgouisc2+agRhZe4w9RHwrucZPzbV8C2pgsaw1bI5MRlhcij
	+VRWg++QpGhoEvpbXsKMKQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a83b7009b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Nov 2025 08:48:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5A58OPdh038264;
	Wed, 5 Nov 2025 08:48:29 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a58ne90rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Nov 2025 08:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcb5+dkYa5ww9j2DvOrVrSTE+aD21yqaeV2WBho2cGX/sKAZdJqELFcNYE28og3I2LsHcH98V6w8tQnDkLWjkQ8Nb7VXgsGv89lglTlVZdpzsyBlDRI+ia3J2KwS5FS1jqK6OmOpYSux7Pxwt8ZD9yULjyKXZ0BlSp8pKuBh01+KyE7yz6PjXoTRy+YpUsIYnNhRyvOo5W17WU06/CEzwuqZIsmSfk2lTwV+KuUISPa3mnS10w+LIqn8lmBm1N4UfEZ+yBPs1VCZGhwfkEqaAJi4NUiFl8XmBb6Qg15ArPTokEnVY91QieCKRF4nCV8O+uJlY0QOLxvIwuBmhx9LGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x6XVmzabo4tQxNc1E64+rkm7/F13zkRjiM5URtL5YM=;
 b=s3txFc1QCBvuygNPe0oNUArF0CC6F7qFDziddOqtIsDm6VSNNNdd5WFFaFSrOvKwy5Hwlviqyo0nHvS8QXgJwNWb48GGbyqcm2iI9iBpC7rM9QEBYSW5ATEigHCWrp3idx3UQdX4fwb+V+8mEAty1h3FE1CYJwa61Kn98vdY50l7oyQcQPERMawlHEfa1O7Yj2YmiTooHmCHC7xyGRCSne76c4tJLyNbmjelCs7LFvn6sARqYnvoV8EPKd2dx/x5YwHwxNCUbbmXAXaLIH2GneVqhPjVYuYR/BKMIeoAWj9XTpghGC3+MceMVFzt2lEW6DlpyBawD5IaoUZkq5kCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x6XVmzabo4tQxNc1E64+rkm7/F13zkRjiM5URtL5YM=;
 b=xfeKSLTCqQPL2NddJyHvEx7gFNLswpu37JdZ9gweeRf9dur6kGSFpCgWHhE3fqWo/agGykOC9hreRcUezvqSuaMU9inGSvKmBu3HkSPRyBs8WFRfVSLHfa5VdO3P53C+Ww9vVY05koBIwephYVNyetVM+6de4JvFkqt5pc+l95k=
Received: from DM4PR10MB6839.namprd10.prod.outlook.com (2603:10b6:8:105::10)
 by DS4PPFA9F6DBE23.namprd10.prod.outlook.com (2603:10b6:f:fc00::d3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 08:48:05 +0000
Received: from DM4PR10MB6839.namprd10.prod.outlook.com
 ([fe80::dc16:2669:e9f9:4c9e]) by DM4PR10MB6839.namprd10.prod.outlook.com
 ([fe80::dc16:2669:e9f9:4c9e%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 08:48:05 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Akira Yokosawa <akiyks@gmail.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>,
        "lkmm@lists.linux.dev"
	<lkmm@lists.linux.dev>
Subject: Re: [PATCH] memory-barriers.txt: Sort wait_event* and wait_on_bit*
 list alphabetically
Thread-Topic: [PATCH] memory-barriers.txt: Sort wait_event* and wait_on_bit*
 list alphabetically
Thread-Index: AQHcTgK8d2nQPmKNoEe2e4b1jZsjubTjxboA
Date: Wed, 5 Nov 2025 08:48:05 +0000
Message-ID: <5B57FD50-9F10-41E6-8EF4-87577E57DAD2@oracle.com>
References: <d06d8be2-5661-4926-8734-d12c30c9e03c@gmail.com>
In-Reply-To: <d06d8be2-5661-4926-8734-d12c30c9e03c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR10MB6839:EE_|DS4PPFA9F6DBE23:EE_
x-ms-office365-filtering-correlation-id: 72c4e8bc-c969-4732-e493-08de1c480953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vjd2NG5QVDU2MzhXMENHNFlETENJVU5tSHl2Ry90QmlHRHRuTWsxRGVsZldi?=
 =?utf-8?B?TXJGV3VQVnBjSm92dFNyU2I0MGlzbmZ2WHFyTEJoSTdrV1dWbXc5RG9iRFdG?=
 =?utf-8?B?Y1RUZGJ5Nks3MkFNenpkcmwyZUZPQnBVZUc5dDJhSTZtZlBUUHEyZ1Q0MFJw?=
 =?utf-8?B?aWhWWDRyZFl4bnZtR2h3Mjl1YTdPUGdtOVNnQVAwUEo1ZzBCaWNEaUZiemJD?=
 =?utf-8?B?Tnl4ay95cVhzVEhMNVdsN0NqRzNLYVZ4RXhpODFyMmMxWEtZM29mVTcwS2tJ?=
 =?utf-8?B?VXZuWCtCWVgrZ25sdkI1THU0K0dRRWhXNUc5WVdxOE42ZkxEVy91STI5cVRF?=
 =?utf-8?B?ZUl6MERiQlFNVkFQd3lOeHVhQTVaTFZ1M0llaGVBc2hjcE1rRVRCN29sbTY1?=
 =?utf-8?B?MHFEN002NWRiNWlKQnVWVnlZTmtweGVSRzVTTWdwT3VrV3p2NWxDRDQ4b3hN?=
 =?utf-8?B?MTdCS29sYTFCdmRab1FNTlFrMGFGQWw1TDFSU1dlN0R1RjM3ZFd0NTNyOEli?=
 =?utf-8?B?VG1mMWtYR0JxSW55eWtFU2QzSWxFdFo2NnVQL2pHVjBMeW1LaTFDbjk2V0x0?=
 =?utf-8?B?bEpaY3B3V2tXeU9KZUd4Ly9xbFE2L1pwQktjWHpNSTdDWURzQkVIRWpnSWtW?=
 =?utf-8?B?T1RTVnIrb1BBbHBQNmxjS1dzUEdodkJkcVdRdExPd01obEhSdU1qUklaaDFq?=
 =?utf-8?B?Slo0MG9KRXV0YUVENkRqSy91SE9wamc2ZlFIYnI1eExEL0xlK3k2R09CU1ds?=
 =?utf-8?B?UWxuazMvYWVtQ3ExM1JZVjI2Y1VJY2YrWHlqMWpZUlJmUEVvZW5JRy90N0lu?=
 =?utf-8?B?VzVTeVN3ZldHaURtWEJEM29qY0JUVzdhOVlOcThEQ1Y4dkRqKzl4by9jN095?=
 =?utf-8?B?aUtPeWxzS2s5SHdQYklXRVd1dzllRXpRWEp3cGl6cm9IZFYwV215eU1GR1lp?=
 =?utf-8?B?aHNMNUg4cUM3WGZ6dVF5SWQwL3dGUVNneTcyRDFtNEZaTm5mSDFLQ1o5QVFL?=
 =?utf-8?B?cjJsUHVRbXNidm1xeEJxT1JLNkxPU3dKR2I5YkhaSzV6ZUlVODFWRFFaSDl1?=
 =?utf-8?B?MGgzTUtNSUo0R2NhZWhMd3lsSmdhNyt2bExmUi9oYmtoSzhBeTF2WTB6SnV5?=
 =?utf-8?B?UThzVTlmM0JyeDBmU2xaREpHdzFsR1JucnFxZlM2QTU1WE40ZUFKK1NKNGdy?=
 =?utf-8?B?UDlRNmE0SlFkQVB4OUJuWVpzd3g2RlZuOVUwU2x3TUl0a0ExZWVYeDgxcjZp?=
 =?utf-8?B?ckdublFrSFVKdW0rL1BtL1RKd0dCS3hkSEpJZFNLbFppZDIzTklEMEFKbGc4?=
 =?utf-8?B?ZHFHenNNTlRTTW9nOUdKV0pQUnhYVmk2OUJkWjRGMUw5RVRtd3ROZ3hZTnZV?=
 =?utf-8?B?bVlOMkcrVzJid1k1SjJ0VWhlYk1HZVhxYkF2QVZTNmtlaWZuZGs5NDdjTWRv?=
 =?utf-8?B?WTFzaVgwNGtDeURvM1dTUTk2Q05rOE1uSnQ2NWlDNmxSczg1WkRjME9uUmU5?=
 =?utf-8?B?T3FId1RpVkpHNWI1UGxQVGNmQllNVlpIY3htM002VkRud0ZLaVpldDA2VlN1?=
 =?utf-8?B?di9lZlF4dC9TMURZLzFUdzlQeTlzVTFTZ3Y1bjdqa2prTzFKOU5ueTRhSUhm?=
 =?utf-8?B?UnNmVnN1T211VVc1NXFWay9uVGxLSTVxWlNIRWp0VUt5VHB0b0FXOWlremY3?=
 =?utf-8?B?VXZPUVkxWTkyS1llNTZlM2pSMXlESnJOQ0EyM0dpMThNbXpzRWplMVZUSWVT?=
 =?utf-8?B?TWRsQ2NqT2tlT2NrMnVER0VNdE0vTmR4ZWppL3FjL2V2VjZmblJqQzJOYmZu?=
 =?utf-8?B?Zm0wbjFoZWhMV1VUKzA5Ly9pbnQwVG52YWFrM0tFTUJITTR1OWxsSERpbXVZ?=
 =?utf-8?B?ekd0UEZJWjdYcHJVT0ljN2h0QUptRWV0VXlIaVFxYXlud1Bqbk9TMzQ3MnM2?=
 =?utf-8?B?d0w3QXhDcmpleHVqRTAxZEFLUTJOYnNuRUh6QjRjZml6RFRMWm1ncDFVb20x?=
 =?utf-8?B?MGhNTnlzemoxM21UU1gvcWo1dTFQNUg1SDlZQUJXSHV5RHh2eVlYOWZSODdQ?=
 =?utf-8?Q?ccr8iM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6839.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXRTNnp0ckRoTWR6K3d0K1ozMll4NVZ5c2tvL2l6bVE3OHpyRDU5THYwT0Nz?=
 =?utf-8?B?bEoxd3Y5WlR4UjMrMUQ3SzFKMDdsc3N6azNsc0ExK1pIQ1N6M3ZDMDdWRFd5?=
 =?utf-8?B?S1Q5YXJTd0tLbTRrZVh5QzN3dHZEemh2Szc3Y1lpcW9KOU1rWmlkYjRjM2V6?=
 =?utf-8?B?WjM4TzNIS2pJWGxDVjlBY0ZlUWJPRlBXTGFLMkR5T2NmcEMvOXQ3TWRXU1Zu?=
 =?utf-8?B?amx1N3l4SkJ6WXgvVmhDQUZ3dm04V1pydFdFNVJEeFg2QndPMlpyVFFnZnhK?=
 =?utf-8?B?MjAreFhvR2FLY0k0cVlwY2kvL2k3c21TY1Ntd1A0ZG84cTYxa04xSHBMOElI?=
 =?utf-8?B?UkhUYTN4NkZZY0l1b1FPVzBJeFhyZG8zM0p4SHpJVU1sYVZSK3dxZ2paUTIw?=
 =?utf-8?B?aUZkQkR5dWJJQVdxNTRwcm9ZOFhmRkFheUhzV3puOTk4aDlUMGQzbWJVZTV0?=
 =?utf-8?B?cmhhc1E5b0NMSkRkQ21mVUxIZ1FQTkxva0lMOU5zVkw1SnRQWnQzdU1JSXBh?=
 =?utf-8?B?aXR0WnhBV3VOd3BQZjMraWNSQkkxY2tWNHF6NlNKTzFtNHZWWXFDcVdCSEVZ?=
 =?utf-8?B?b0Vqb3R4UXNmdEdXM2FtOE02N3c2STRtcklaZkJXNGxjTTNSRURIWVdmSEdm?=
 =?utf-8?B?K3hPcHAyTVRFRUduVUtaNmJ1cWdZbGlkWFZrVHJlcVR3blBTSlBPZlJCWGFW?=
 =?utf-8?B?UDRmUjVjMnZ0dGpwZktObGxNY3g4MGUraWRjOVBUMFBrRUVaSzZ2eG1lNTVo?=
 =?utf-8?B?SlZHSk54N1FzeXpqczVNMU40MnNDWFh1TlVYMDhzcVNGM0hMK1FBTHduL0Rr?=
 =?utf-8?B?eDdZaWN0V0ZMMHM4NGx4dlRQYlVqQ0xMbWZaSXhidkhvMzV1VVlQM1ZOVGdI?=
 =?utf-8?B?d1d0RzdCS05DeEU2MGdPSlpwMFdaY1ZoOXJwaS9NdTRoVUVoREFaeUJUQWlG?=
 =?utf-8?B?cDMwZEhua0h5M3VEY0RzQS9VRVpHUDVpSXV0SzluUWFNM3lveUo2cHhxRkdK?=
 =?utf-8?B?bVZtTm91QlBNRlpUWGhlMVdEOFNEeHFYUDNuQ2ZqQXZ0N1hNNXZoUTlUbzRX?=
 =?utf-8?B?Qk5HdmdPL29nZmluVS84VU9nVHg5WWhMa1RzRWJWcDNoajZ3eEIwc2M1L0lr?=
 =?utf-8?B?dTFNMis3dnZTS2ZpQThpdGJEL0YrWVVLWGFsZFZPQU5aQUdsZ0N6UUY2NWJP?=
 =?utf-8?B?NmROYThRS2R5dmdkOENlZ0JmYW5SMi8rR1NhUnBBSXo3ZnZLTmtHbWkxcTRr?=
 =?utf-8?B?VG9EcXI2VndCVG5KWHJ1Yk03c3QrNktvN1pyYlRCMTZrbEhjQmtrdDQ3RGps?=
 =?utf-8?B?SEpHZ2VleDVRUEtYUDM0d2tFSFY4OEdmWklhbllYUGppTlFVenFKYndCQVF5?=
 =?utf-8?B?eUdVQTNKSzB2N0dvemgvZldDMmJpS0s1OUdFazRvNWUvRHdualgvYVJ1cmZs?=
 =?utf-8?B?L1BwQkowKzNra0oxSEVFVnZGaXZ0YURkREVhUER4SDUrNTMzQmJKR1lNSC9D?=
 =?utf-8?B?UUF4dktkQTVzNzhNazdZQVZVYzNJYlN0WUEweHFSbjRETmt4dGxNY1Q5bi9p?=
 =?utf-8?B?NXI1YTNWTmd2SUJXcDgybjcvcHhCV0xzY0tZaVp5RzVXdzRaUGEvd0pPakZm?=
 =?utf-8?B?Q2dVTFAzaHlvQS9oN21zY2RRL1I0VTV5S3hqNy9WWkUxYkRiTWlJM2hPYlMv?=
 =?utf-8?B?Q2k2bnFsTGhSVEVaNWUremRScUJ0Zkd6UzRTWngyVzlUQ3NEWDVISCswSlgx?=
 =?utf-8?B?R2xCMFBkKzdoZmFzdWFFQi91VnhKUWJpVUQvMk44MTFrU3Z2M0w4VSs2d1lx?=
 =?utf-8?B?NmxrNlJMbHRucHZ4enpsTUlzang4SWRESlgvam5VeE9zVUFDMlVKQ0Q4cXRN?=
 =?utf-8?B?UjgwdVBHZ2MzVm5MVEtrODJRMWFoSXVkeWpLTTFMSXRTOThMdGZhOVdzUkJO?=
 =?utf-8?B?elF6UERLV3FtUmU5anhER2l0dDhDQktTZktrYVZ0c1EwcXZDNlNLVkdXM2VF?=
 =?utf-8?B?MzlHMFVkamZtYURSbEdGSXFqd1U4Q0tIYzdJbW5OYXE1YndQN3VSeFQ3VkhZ?=
 =?utf-8?B?bnFiVmN2aGFqOEFsLy9JS21HSE0zWmdDZDBHSmEwaEpuWldnQTBsamQ3cGx5?=
 =?utf-8?B?WFNZTlZiSDNtb253UTM4RTlHM3k4ZERPOEo5enRORGZJMW1hdkRyekZWK1Zy?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B5EFD0314105146AE4185EDFBC32270@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+uflflpZ9oY07GQnxim8G120SvBcslW5PJk2dYEATELLbD6xmxsyFjE+Fy6yiwmqcxaw0zAekRCsQeLwrViTq7vxN7FcvYlsC2RDL5FBpm9m9RgbXYo9TufTgIvGFv0vj/OnN5OOZfIIN2Yvw1kaLz3dDwKAFr/7DriRZyVqW5VvRnwtoXSs0WuBcRI7/vNXPNKwcIgTFsAF43cyhWfLYJHc5ScMV/bgcvK9oGlTZ8ef8kTqU85lXl0liPHY9H/hFsYNO1lPtM3Gikw7W4lvOJdQ4lfrOAMnc57ykbxYPQiFe4UyM5a1F7bxUAvr15lhvfF1mx6si2U4qB/DqGoFkkdvV254wfbZrGCZnwb5RFAZQKzAV1MyMsyyulAz5A58yeh/vAS7UPrB0SJtmb/rnVbNKQsENPiAEbmqJ3/2x9Ki2inaJ4IjVThzsiB6JV4pBc7y1qybEom/iexcjLvXHznMvNbzKEm1adKyk6h8o4eTPeotcybMEzcsaQFeEMLHb92cBARCc98kFWZsTAaNpCG7DnkbPEC1pUivzNmUjFscuOs+b/8Mw4YYvUSslqQuh/QaykCh6Jioxmm+oNDrhiRh9SpiQ2pUCVhPmx7cyO4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6839.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c4e8bc-c969-4732-e493-08de1c480953
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 08:48:05.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJW9R0xgYPYefGlix7LcOwN29YsfLdc+vmGZJx54zSO0ooJRq/aslHUiXchZ0Yr2ntQfJEvIAiHRrmRRxIpoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA9F6DBE23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511050065
X-Proofpoint-GUID: hpS3cvtWTUvswBgub9H57PE31ZJR17Dg
X-Authority-Analysis: v=2.4 cv=Q5LfIo2a c=1 sm=1 tr=0 ts=690b0f5e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8
 a=lDJOdLdaFqF9iCQgGTkA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13657
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2MyBTYWx0ZWRfX3sUB+KtTWost
 8A7TYJrvJQzG6upXDnLKbsn+xTze7V8t1Wb7jwHUcpgoXmCvNmPlqdLSOJEx31os8xcJssjbxvk
 nCUdmEMFvQMTKOO1w8PYvFL7c4jlTD6cHid6kRuaIPIRJe44n1d5IxjnKjfhz9fqvS7zsKVqf7q
 l9SpFdphOU45p4Txl1wETHA66vDIS/X16RAPn8poCNjT8FQ+g8N4fWwIL26DGEkZnzvA2zPjg/3
 O62FGEgZWS6DOdQCua6tAzbAlbvMERDFTuSSmUwW6HMi+mupMXTktWXeOJzRua05oT84xDyYC2n
 zN/G+STWmOYq0ouwYO54jQYiLHWQR4EYWfnqsobb5oFJQzd8GaKU+/vuykuUpcK3GfVbB3IUO6h
 y6huLRt2YbhSs9OEhS2C+4jDK/+VBYc5O94/vMg4JCksV+xGXBk=
X-Proofpoint-ORIG-GUID: hpS3cvtWTUvswBgub9H57PE31ZJR17Dg

SGkgQWtpcmEtc2FuLA0KDQo+IE9uIDUgTm92IDIwMjUsIGF0IDA0OjE3LCBBa2lyYSBZb2tvc2F3
YSA8YWtpeWtzQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBDb21taXQgODgxNzI3MDA0MjNjICgi
ZG9jcy9tZW1vcnktYmFycmllcnMudHh0OiBBZGQgd2FpdF9ldmVudF9jbWQoKQ0KPiBhbmQgd2Fp
dF9ldmVudF9leGNsdXNpdmVfY21kKCkiKSBhZGRlZCB0d28gQVBJcyB3aXRob3V0IHRha2luZyBj
YXJlDQo+IG9mIHRoZSBsaXN0IG9yZGVyLiAgU29ydCB0aGUgbGlzdCBmb3IgcmVhZGFiaWxpdHku
DQo+IA0KPiBXaGlsZSB0aGVyZSwgbWFrZSBpdCBjbGVhciB0aGF0IHRoaXMgaXMgaW5jb21wbGV0
ZSBieSBzYXlpbmcNCj4gImZvciBleGFtcGxlIi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFraXJh
IFlva29zYXdhIDxha2l5a3NAZ21haWwuY29tPg0KDQpMR1RNLCBzbzoNCg0KUmV2aWV3ZWQtYnk6
IEjDpWtvbiBCdWdnZSA8aGFha29uLmJ1Z2dlQG9yYWNsZS5jb20+DQoNClRoeHMsIEjDpWtvbg0K
DQoNCj4gLS0tDQo+IEhpIFBhdWwsDQo+IA0KPiBMb29rcyBsaWtlIHRoZXJlIGlzIG5vIHBlbmRp
bmcgY2hhbmdlIGZvciB2Ni4xOSBpbiBMS01NLg0KPiANCj4gSSB0aGluayB0aGlzIG1pbm9yIHR3
ZWFrIGlzIHdvcnRoIGhhdmluZywgaWYgaXQgaXMgbm90IHRvbyBsYXRlLg0KPiANCj4gICAgICAg
IFRoYW5rcywgQWtpcmENCj4gLS0NCj4gRG9jdW1lbnRhdGlvbi9tZW1vcnktYmFycmllcnMudHh0
IHwgNiArKystLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50
eHQgYi9Eb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50eHQNCj4gaW5kZXggMWQxNjRlMDA1
Nzc2Li42MWI3MzE3YmNmMmUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vbWVtb3J5LWJh
cnJpZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50eHQNCj4g
QEAgLTIxODIsOSArMjE4MiwxMSBAQCBzZXRfY3VycmVudF9zdGF0ZSgpIG1heSBiZSB3cmFwcGVk
IGJ5Og0KPiANCj4gd2hpY2ggdGhlcmVmb3JlIGFsc28gaW1wbHkgYSBnZW5lcmFsIG1lbW9yeSBi
YXJyaWVyIGFmdGVyIHNldHRpbmcgdGhlIHN0YXRlLg0KPiBUaGUgd2hvbGUgc2VxdWVuY2UgYWJv
dmUgaXMgYXZhaWxhYmxlIGluIHZhcmlvdXMgY2FubmVkIGZvcm1zLCBhbGwgb2Ygd2hpY2gNCj4g
LWludGVycG9sYXRlIHRoZSBtZW1vcnkgYmFycmllciBpbiB0aGUgcmlnaHQgcGxhY2U6DQo+ICtp
bnRlcnBvbGF0ZSB0aGUgbWVtb3J5IGJhcnJpZXIgaW4gdGhlIHJpZ2h0IHBsYWNlLCBmb3IgZXhh
bXBsZToNCj4gDQo+IHdhaXRfZXZlbnQoKTsNCj4gKyB3YWl0X2V2ZW50X2NtZCgpOw0KPiArIHdh
aXRfZXZlbnRfZXhjbHVzaXZlX2NtZCgpOw0KPiB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKTsN
Cj4gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX2V4Y2x1c2l2ZSgpOw0KPiB3YWl0X2V2ZW50X2lu
dGVycnVwdGlibGVfdGltZW91dCgpOw0KPiBAQCAtMjE5Miw4ICsyMTk0LDYgQEAgaW50ZXJwb2xh
dGUgdGhlIG1lbW9yeSBiYXJyaWVyIGluIHRoZSByaWdodCBwbGFjZToNCj4gd2FpdF9ldmVudF90
aW1lb3V0KCk7DQo+IHdhaXRfb25fYml0KCk7DQo+IHdhaXRfb25fYml0X2xvY2soKTsNCj4gLSB3
YWl0X2V2ZW50X2NtZCgpOw0KPiAtIHdhaXRfZXZlbnRfZXhjbHVzaXZlX2NtZCgpOw0KPiANCj4g
DQo+IFNlY29uZGx5LCBjb2RlIHRoYXQgcGVyZm9ybXMgYSB3YWtlIHVwIG5vcm1hbGx5IGZvbGxv
d3Mgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+IGJhc2UtY29tbWl0OiA0MzU2YWJjNjM2ODdj
NjVhODZhYjcwOWRiOTY0NzA1NDA0NDFlODIyDQo+IC0tIA0KPiAyLjQzLjANCj4gDQoNCg==
