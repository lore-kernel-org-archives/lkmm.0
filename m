Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAA230D1E
	for <lkmm@lists.linux.dev>; Wed,  7 Jan 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778739; cv=none; b=bH8HsgcUI649Yrj9piQjV5DD0izs2h6Na6kmy4LjLPUvUuur96r+DbtBk9OzJ19W5/hHnBZJHaibGWBfOuaBfKfQhGOj/mGYJ5IzfeQGv3Igrn8PHv9STzdgwCMNtGvlsQ5Vcdg9ILLv0Nm2Xmm5Kkt3fkOu35WtO3A1d1wa3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778739; c=relaxed/simple;
	bh=bafGdPTKgVK4L5oCNcRPOlxzymvp7rYrPftGfPLRTn4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Azh4Bo8vhasxStnw6wVCCqbWc8IbNgOXTuLy/aYE7M+dbSBcODx1xtCZTY6Zd4dPuTskcDh3q0wjjJjlyc3+v3bNle5vA1B7sjf0io+DtMobMMtlCLl7wi103wug82dY5tlpGrH1NXARkEoiLiSS8Q8wVKIZjiG2xDm+GBiNU2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dmNJp3YMqzJ46FB;
	Wed,  7 Jan 2026 17:38:50 +0800 (CST)
Received: from frapema100003.china.huawei.com (unknown [7.182.19.100])
	by mail.maildlp.com (Postfix) with ESMTPS id 81A2840565;
	Wed,  7 Jan 2026 17:38:53 +0800 (CST)
Received: from frapema500003.china.huawei.com (7.182.19.114) by
 frapema100003.china.huawei.com (7.182.19.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 7 Jan 2026 10:38:53 +0100
Received: from frapema500003.china.huawei.com ([7.182.19.114]) by
 frapema500003.china.huawei.com ([7.182.19.114]) with mapi id 15.02.1544.011;
 Wed, 7 Jan 2026 10:38:53 +0100
From: Jonas Oberhauser <jonas.oberhauser@huawei.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonas Oberhauser
	<jonas.oberhauser@huaweicloud.com>, Boqun Feng <boqun.feng@gmail.com>, "Paul
 E. McKenney" <paulmck@kernel.org>
CC: "lkmm@lists.linux.dev" <lkmm@lists.linux.dev>, Olivier Dion
	<odion@efficios.com>
Subject: RE: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
Thread-Topic: [RFC PATCH 1/1] hpref: Hazard Pointers with Reference Counter
Thread-Index: AQHcfxyeM8aWg2aakUi+8BsejhokZrVGcb+Q
Date: Wed, 7 Jan 2026 09:38:53 +0000
Message-ID: <c7464e0027f9403191d0d3638558bccd@huawei.com>
References: <20240921164210.256278-1-mathieu.desnoyers@efficios.com>
	<13bc8b46-d391-4f58-b021-481e57d2ac1f@huaweicloud.com>
 <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
In-Reply-To: <4d234ab6-de1a-4959-81f7-37c5b41c6c66@efficios.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: lkmm@lists.linux.dev
List-Id: <lkmm.lists.linux.dev>
List-Subscribe: <mailto:lkmm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:lkmm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

PiBTb3JyeSBmb3IgdGhlICh2ZXJ5KSBsYXRlIHJlcGx5LiA6KQ0KDQpBIGJsYXN0IGZyb20gdGhl
IHBhc3QgOikpIFRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlLg0KDQo+IGxpYnVyY3UgdWF0b21pY3Mg
YW5kICJjbW1fKiIgQVBJIGluaXRpYWxseSBhaW1lZCB0byByZXBsaWNhdGUgdGhlIExLTU0gaW4g
dXNlcnNwYWNlIChub3RlOiB0aGlzIHdhcyBkb25lIGNpcmNhIDIwMDkpLiBIb3dldmVyLCBzdGFy
dGluZyBmcm9tIGxpYnVyY3UgMC4xNSwgd2UgZXh0ZW5kZWQgdGhlIHVhdG9taWNzIEFQSSB0byBz
dXBwb3J0IHRoZSBDMTEgbW9kZWwNCg0KSSBleHBlY3QgdGhlIEMxMS1zdHlsZS1zZW1hbnRpY3Mg
d2lsbCBoYXZlIGEgbG90IG9mIGZyaWN0aW9uIHdpdGggUkNVIChhdCB0aGUgbGVhc3QgYmVjYXVz
ZSBvZiBtaXNzaW5nIGRlcGVuZGVuY3kgb3JkZXJpbmcpLiBUaGluZ3MgbGlrZSBybWIgYW5kIHdt
YiBtYXkgYWxzbyBub3QgaGF2ZSBhIGNsZWFuIGZvcm1hbGl6YXRpb24gaW4gYSBDMTEtc3R5bGUg
c2VtYW50aWNzLg0KDQo+IHdpdGggYW4gYWRkaXRpb25hbCAiQ01NX1NFUV9DU1RfRkVOQ0UiIHdo
aWNoIGFpbXMgdG8gZmlsbCB0aGUgZ2FwIGJldHdlZW4gTEtNTSBhbmQgQzExLg0KDQpJIHNlZSwg
dGhhbmtzIQ0KDQpIYXZlIGEgbG90IG9mIGZ1biwNCiAgam9uYXMNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1LmRlc25veWVyc0Bl
ZmZpY2lvcy5jb20+IA0KU2VudDogVHVlc2RheSwgSmFudWFyeSA2LCAyMDI2IDM6NTMgUE0NClRv
OiBKb25hcyBPYmVyaGF1c2VyIDxqb25hcy5vYmVyaGF1c2VyQGh1YXdlaWNsb3VkLmNvbT47IEJv
cXVuIEZlbmcgPGJvcXVuLmZlbmdAZ21haWwuY29tPjsgUGF1bCBFLiBNY0tlbm5leSA8cGF1bG1j
a0BrZXJuZWwub3JnPg0KQ2M6IGxrbW1AbGlzdHMubGludXguZGV2OyBPbGl2aWVyIERpb24gPG9k
aW9uQGVmZmljaW9zLmNvbT4NClN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDEvMV0gaHByZWY6IEhh
emFyZCBQb2ludGVycyB3aXRoIFJlZmVyZW5jZSBDb3VudGVyDQoNCk9uIDIwMjQtMDktMzAgMDk6
MzEsIEpvbmFzIE9iZXJoYXVzZXIgd3JvdGU6DQo+IFtkcm9wcGluZyBhIGxvdCBvZiBDQ10NCj4g
DQo+IEFtIDkvMjEvMjAyNCB1bSA2OjQyIFBNIHNjaHJpZWIgTWF0aGlldSBEZXNub3llcnM6DQo+
Pg0KPj4gUG9ydGluZyBpdCB0byB0aGUgTGludXgga2VybmVsIHNob3VsZCBiZSBzdHJhaWdodGZv
cndhcmQuIA0KPiANCj4gDQo+IEJ0dywgd2hhdCBpcyB0aGUgcmVsYXRpb24gYmV0d2VlbiB1YXRv
bWljcyBhbmQgTEtNTT8NCj4gDQo+IFNob3VsZCBJIGFzc3VtZSB0aGF0IHRoZXkgaW50ZW5kIHRv
IGhhdmUgTEtNTSBzZW1hbnRpY3MgbW9kdWxvIA0KPiB3aGF0ZXZlciBpcyBleHBsYWluZWQgaGVy
ZToNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS91cmN1L3VzZXJzcGFjZS1yY3UvYmxvYi9tYXN0
ZXIvZG9jL3VhdG9taWMtYXBpLm1kDQo+IA0KPiBCZWNhdXNlIG9uIEMxMSBtb2RlbCwgZGVwZW5k
ZW5jaWVzIGFyZSBnZW5lcmFsbHkgbm90IGNvbnNpZGVyZWQNCg0KbGlidXJjdSB1YXRvbWljcyBh
bmQgImNtbV8qIiBBUEkgaW5pdGlhbGx5IGFpbWVkIHRvIHJlcGxpY2F0ZSB0aGUgTEtNTSBpbiB1
c2Vyc3BhY2UgKG5vdGU6IHRoaXMgd2FzIGRvbmUgY2lyY2EgMjAwOSkuIEhvd2V2ZXIsIHN0YXJ0
aW5nIGZyb20gbGlidXJjdSAwLjE1LCB3ZSBleHRlbmRlZCB0aGUgdWF0b21pY3MgQVBJIHRvIHN1
cHBvcnQgdGhlIEMxMSBtb2RlbCwgd2l0aCBhbiBhZGRpdGlvbmFsICJDTU1fU0VRX0NTVF9GRU5D
RSIgd2hpY2ggYWltcyB0byBmaWxsIHRoZSBnYXAgYmV0d2VlbiBMS01NIGFuZCBDMTEuDQoNClN0
YXJ0aW5nIGZyb20gbGlidXJjdSAwLjE1LCB5b3UgY2FuIGNvbmZpZ3VyZSB0aGUgbGlicmFyeSB3
aXRoOg0KDQotLWVuYWJsZS1jb21waWxlci1hdG9taWMtYnVpbHRpbnM6IEVuYWJsZSB0aGUgdXNl
IG9mIGNvbXBpbGVyDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhdG9taWMg
YnVpbHRpbnMuDQoNCldpdGhvdXQgdGhpcyBjb25maWd1cmUgZmxhZywgdGhlIGxlZ2FjeSBjdXN0
b20gYXNzZW1ibHkgYXRvbWljcyBhcmUgc3RpbGwgdXNlZC4NCg0KVGhhbmtzLA0KDQpNYXRoaWV1
DQoNCi0tDQpNYXRoaWV1IERlc25veWVycw0KRWZmaWNpT1MgSW5jLg0KaHR0cHM6Ly93d3cuZWZm
aWNpb3MuY29tDQoNCg0K
