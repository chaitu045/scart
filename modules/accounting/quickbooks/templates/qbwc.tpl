<?xml version="1.0"?>
	<QBWCXML>
		<AppID></AppID>
		<AppName>{{ AppName|raw }}</AppName>
		<AppURL>{{ AppURL|raw }}</AppURL>
		<CertURL>{{ CertURL|raw }}</CertURL>
		<AppDescription>{{ AppDescription|raw }}</AppDescription>
		<AppSupport>{{ AppSupportURL|raw }}</AppSupport>
		<UserName>{{ Username|raw }}</UserName>
		<OwnerID>{{ OwnerID|raw }}</OwnerID>
		<FileID>{{ FileID|raw }}</FileID>
		<QBType>{{ QBType|raw }}</QBType>
		<IsReadOnly>false</IsReadOnly>
		{{ Scheduler|raw }}
	</QBWCXML>
