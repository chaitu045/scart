	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td width="20" align="center">
			<input type="checkbox" name="taxrates[]" value="{{ TaxRateId|raw }}" />
		</td>
		<td align="center" style="width:18px;">
			<img src='images/tax.gif' />
		</td>
		<td>
			{{ TaxName|raw }}
		</td>
		<td>
			{{ TaxRate|raw }}%
		</td>
		<td style="width:300px">
			{{ AppliesTo|raw }}
		</td>
		<td align="center">
			{{ Status|raw }}
		</td>
		<td>
			{{ EditRateLink|raw }}
		</td>
	</tr>
