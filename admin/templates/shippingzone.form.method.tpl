<tr class="GridRow" onmouseover="$(this).addClass('GridRowOver');" onmouseout="$(this).removeClass('GridRowOver');">
	<td style="text-align: center; width: 1px;"><input type="checkbox" name="methods[]" class="check" value="{{ MethodId|raw }}" /></td>
	<td><img src="images/shippingmethod.gif" alt="" /></td>
	<td>{{ MethodName|raw }}</td>
	<td>{{ MethodModule|raw }}</td>
	<td style="text-align: center;">{{ MethodStatus|raw }}</td>
	<td style="width: 200px;">
		<a href="index.php?ToDo=editShippingZoneMethod&amp;methodId={{ MethodId|raw }}">{% lang 'Edit' %}</a>
		<a href="#" onclick="openwin('index.php?ToDo=testShippingProvider&methodId={{ MethodId|raw }}', {{ MethodId|raw }}, 550, {{ TestQuoteHeight|raw }}); return false;" style="{{ HideTestQuoteLink|raw }}">{% lang 'GetQuote' %}</a>
	</td>
</tr>