<tr class="{{ ZoneClass|raw }}" onmouseover="$(this).addClass('{{ ZoneClass|raw }}Over');" onmouseout="$(this).removeClass('{{ ZoneClass|raw }}Over');">
	<td style="text-align: center;"><input type="checkbox" class="check" {{ ZoneDeleteCheckbox|raw }} name="zones[]" value="{{ ZoneId|raw }}" /></td>
	<td><img src="images/zone.gif" alt="" /></td>
	<td>{{ ZoneName|raw }}</td>
	<td>{{ ZoneType|raw }}</td>
	<td style="text-align: center;">{{ ZoneStatus|raw }}</td>
	<td>
		<a href="index.php?ToDo=editShippingZone&amp;zoneId={{ ZoneId|raw }}">{% lang 'EditSettings' %}</a>
		<a href="index.php?ToDo=editShippingZone&amp;zoneId={{ ZoneId|raw }}&amp;currentTab=1">{% lang 'EditMethods' %}</a>
		<a href="index.php?ToDo=copyShippingZone&amp;zoneId={{ ZoneId|raw }}">{% lang 'Copy' %}</a>
		<a href="index.php?ToDo=deleteShippingZones&amp;zones[]={{ ZoneId|raw }}" onclick="return ConfirmDeleteZone();" style="{{ HideDeleteZone|raw }}">{% lang 'Delete' %}</a>
	</td>
</tr>