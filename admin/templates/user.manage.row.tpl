
	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:23px">
			<input type="checkbox" name="users[]" value="{{ UserId|raw }}" {{ CheckDisabled|raw }}>
		</td>
		<td align="center" style="width:18px;">
			<img src="images/user.gif" />
		</td>
		<td class="{{ SortedFieldUserClass|raw }}">
			{{ Username|raw }}
		</td>
		<td class="{{ SortedFieldNameClass|raw }}">
			{{ Name|raw }}
		</td>
		<td class="{{ SortedFieldEmailClass|raw }}">
			{{ Email|raw }}
		</td>
		<td style="width: 150px; {{ HideVendorColumn|raw }}" class="{{ SortedFieldVendorClass|raw }}">
			{{ Vendor|raw }}
		</td>
		<td align="center" style="display: {{ StatusField|raw }}" class="{{ SortedFieldStatusClass|raw }}">
			{{ Status|raw }}
		</td>
		<td>
			{{ EditUserLink|raw }}&nbsp;&nbsp;&nbsp;
			{{ CopyUserLink|raw }}
		</td>
	</tr>
