
	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:25px">
			<input class="EbayTemplate" type="checkbox" name="templates[]" value="{{ Id|raw }}">
		</td>
		<td align="center" style="width:18px">
			<img width="16" height="16" alt="product" src="images/application_form.png">
		</td>
		<td width="550" class="{{ SortedFieldNameClass|raw }}">
			{{ Name|raw }}
		</td>
		<td style="width:250px" class="{{ SortedFieldDateClass|raw }}">
			{{ Date|raw }}
		</td>
		<td align="center" class="{{ SortedFieldEnabledClass|raw }}">
			{{ Enabled|raw }}
		</td>
		<td>
			{{ EditTemplateLink|raw }}&nbsp;&nbsp;&nbsp;
		</td>
	</tr>