
	<tr id="tr{{ CustomerId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:25px">
			<input type="checkbox" name="customers[]" value="{{ CustomerId|raw }}" class="exportSelectableItem" />
		</td>
		<td align="center" style="width:15px">
			<a href="#" onclick="OrderView('{{ CustomerId|raw }}');" style="display:{{ HideExpand|raw }}"><img id="expand{{ CustomerId|raw }}" class="ExpandLink"  src="images/plus.gif" align="left" width="19" height="16" title="{% lang 'ExpandCustQuickView' %}" style="vertical-align: middle;" border="0"></a>
		</td>
		<td align="center" style="width:18px">
			<img src="images/customer.gif" width="16" height="16">
		</td>
		<td class="{{ SortedFieldNameClass|raw }}">
			{{ Name|raw }}
		</td>
		<td class="{{ SortedFieldEmailClass|raw }}">
			{{ Email|raw }}
		</td>
		<td class="{{ SortedFieldPhoneClass|raw }}">
			{{ Phone|raw }}
		</td>
		<td class="{{ SortedFieldGroup|raw }}" style="display: {{ HideGroup|raw }}">
			{{ Group|raw }}
		</td>
		<td nowrap="nowrap" class="{{ SortedFieldStoreCreditClass|raw }}" style="display: {{ HideStoreCredit|raw }}">
			{{ StoreCredit|raw }}
		</td>
		<td class="{{ SortedFieldDateClass|raw }}">
			{{ Date|raw }}
		</td>
		<td class="{{ SortedFieldNumOrdersClass|raw }}">
			{{ NumOrders|raw }}
		</td>
		<td>
			{{ LoginLink|raw }}
			{{ ViewNotesLink|raw }}
			{{ EditCustomerLink|raw }}
		</td>
	</tr>
	<tr id="trQ{{ CustomerId|raw }}" style="display:none">
		<td colspan="2"></td>
		<td colspan="3" id="tdQ{{ CustomerId|raw }}" class="QuickView"></td>
		<td colspan="5"></td>
	</tr>
