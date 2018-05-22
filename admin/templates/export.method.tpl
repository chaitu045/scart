<tr>
	<td>
		<label>
			<input type="radio" id="csv" name="format" value="{{ MethodName|raw }}" {{ MethodChecked|raw }}/>
			{{ MethodTitle|raw }}
		</label>
	</td>
	<td>
		<img onmouseout="HideHelp('d{{ MethodName|raw }}');" onmouseover="ShowHelp('d{{ MethodName|raw }}', '{{ MethodName|raw }}', '{{ MethodHelp|raw }}')" src="images/help.gif" width="24" height="16" border="0">
		<div style="display:none" id="d{{ MethodName|raw }}"></div>
	</td>
</tr>