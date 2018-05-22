<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'" id="CustomerAddress{{ AddressId|raw }}">
	<td width="20" align="center">
		<input type="checkbox" name="addresses[]" value="{{ AddressId|raw }}" /><input type="hidden" name="addressDisplayStatus[]" value="display" />
	</td>
	<td style="width:15%;">
		{{ FullName|raw }}
	</td>
	<td style="width:10%;">
		{{ Phone|raw }}
	</td>
	<td style="width:55%;">
		{{ StreetAddress|raw }}<br />
		{{ City|raw }}, {{ State|raw }} {{ PostCode|raw }}<br />
		{{ Country|raw }} {{ CountryImg|raw }}
	</td>
	<td>
		{{ EditCustomerLink|raw }}
		{{ DeleteCustomerLink|raw }}
	</td>
</tr>