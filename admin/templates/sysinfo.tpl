	<div class="BodyContainer">
	<table cellSpacing="0" cellPadding="0" width="100%" style="margin-left: 4px; margin-top: 8px;">
	<tr>
		<td class="Heading1">{% lang 'SystemInfo' %}</td>
	</tr>
	<tr>
		<td class="Intro">
			<p>{% lang 'SystemInfoIntro' %}</p>
			{{ Message|raw }}
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" class="Panel">
			<tr>
				<td class="Heading2" colspan="2"><div class="FloatRight"><a href="index.php?ToDo=phpSystemInfo" target="_blank">{% lang 'ViewPHPInfo' %}</a></div>{% lang 'SystemInfo' %}</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'ProductVersion' %}:
				</td>
				<td style="padding: 6px 0">
					{{ ProductVersion|raw }}
				</td>
			</tr>
			<tr style="display: {{ HideEdition|raw }}">
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'ProductEdition' %}:
				</td>
				<td style="padding: 6px 0">
					{{ ProductEdition|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'HostingProvider' %}:
				</td>
				<td style="padding: 6px 0">
					{{ HostingProvider|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'PHPVersion' %}:
				</td>
				<td style="padding: 6px 0">
					{{ PHPVersion|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'MySQLVersion' %}:
				</td>
				<td style="padding: 6px 0">
					{{ MySQLVersion|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'ServerSoftware' %}:
				</td>
				<td style="padding: 6px 0">
					{{ ServerSoftware|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'OperatingSystem' %}:
				</td>
				<td style="padding: 6px 0">
					{{ OperatingSystem|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'GDVersion' %}:
				</td>
				<td style="padding: 6px 0">
					{{ GDVersion|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">
					&nbsp;&nbsp; {% lang 'SafeMode' %}:
				</td>
				<td style="padding: 6px 0">
					{{ SafeMode|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel" valign="top">
					&nbsp;&nbsp; {% lang 'RemoteConnections' %}:
				</td>
				<td style="padding: 6px 0">
					{{ RemoteConnections|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel" valign="top">
					&nbsp;&nbsp; {% lang 'MultiByteFunctions' %}:
				</td>
				<td style="padding: 6px 0">
					{{ MultiByteFunctions|raw }}
				</td>
			</tr>
			<tr>
				<td class="FieldLabel" valign="top">
					&nbsp;&nbsp; {% lang 'PSpellFunctionality' %}:
				</td>
				<td style="padding: 6px 0">
					{{ PSpell|raw }}
				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
	</div>