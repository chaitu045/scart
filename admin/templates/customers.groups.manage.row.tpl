
	<tr id="tr{{ CustomerId|raw }}" class="GridRow {{ GridRowSel|raw }}" onmouseover="this.className='GridRowOver {{ GridRowSelOver|raw }}'" onmouseout="this.className='GridRow {{ GridRowSel|raw }}'">
		<td align="center" style="width:25px">
			<input type="checkbox" name="groups[]" value="{{ CustomerGroupId|raw }}">
		</td>
		<td align="center" style="width:18px">
			<img src="images/customer_group.gif" width="16" height="16">
		</td>
		<td class="{{ SortedFieldGroupNameClass|raw }}">
			{{ GroupName|raw }} {{ DefaultText|raw }}
		</td>
		<td class="{{ SortedFieldDiscountClass|raw }}">
			{{ Discount|raw }}
		</td>
		<td class="{{ SortedFieldDiscountRulesClass|raw }}">
			{{ DiscountRules|raw }}
		</td>
		<td class="{{ SortedFieldCustomersInGroupClass|raw }}">
			{{ CustomersInGroup|raw }}
		</td>
		<td class="{{ SortedFieldNumOrdersClass|raw }}">
			{{ EditLink|raw }}
		</td>
	</tr>
