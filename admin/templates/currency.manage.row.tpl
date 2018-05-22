	<tr class="{{ ClassName|raw }}" onmouseover="this.className='{{ ClassName|raw }}Over'" onmouseout="this.className='{{ ClassName|raw }}'">
		<td width="20" align="center">
			<input type="checkbox" name="currencies[]" value="{{ CurrencyId|raw }}" {{ DeleteStatus|raw }}/>
		</td>
		<td align="center" style="width:18px;">
			<img src='images/tax.gif' />
		</td>
		<td>
			{{ CurrencyName|raw }}
		</td>
		<td>
			{{ CurrencyCode|raw }}
		</td>
		<td>
			<div id="currencyexchangerate-{{ CurrencyId|raw }}">{{ CurrencyRate|raw }}</div>
		</td>
		<td align="center">
			{{ Status|raw }}
		</td>
		<td>
			{{ CurrencyLinks|raw }}
		</td>
	</tr>
