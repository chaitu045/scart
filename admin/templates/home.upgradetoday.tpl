<table width="100%" cellspacing="0" cellpadding="0" class="DashboardPanel UpgradeNotice">
	<tr>
		<td class="Heading2">
			<div class="PanelHeader" id="HomeUpgradeTitle">{% lang 'UpgradeStoreToday' %}</div>
		</td>
	</tr>
	<tr>
		<td class="PanelContent">
			{{ ExpiryMessage|raw }}
			<div style="{{ HideUpgradeDetails|raw }}">
				<p>{{ UpgradeCurrentlyRunning|raw }} {% lang 'UpgradeToday' %}</p>
				{% lang 'UpgradeTodayFeatures' %}
			</div>
			<p style="text-align: left;"><img src="images/learnMore.gif" alt="" border="0" /></p>
		</td>
	</tr>
</table>