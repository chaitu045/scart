	<tr id="tr{{ ReturnId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:23px">
			<input type="checkbox" name="returns[]" value="{{ ReturnId|raw }}" class="DeleteCheck">
		</td>
		<td align="center" style="width:15px">
			<a href="#" onclick="QuickReturnView('{{ ReturnId|raw }}'); return false;">
				<img id="expand{{ ReturnId|raw }}" src="images/plus.gif" class="ExpandLink" align="left" width="19" height="16" title="{% lang 'ExpandReturnQuickView' %}" border="0">
			</a>
		</td>
		<td align="center" style="width:18px">
			<img src='images/return.gif' height="16" width="16" />
		</td>
		<td class="{{ SortedFieldIdClass|raw }}">
			{{ ReturnId|raw }}
		</td>
		<td class="{{ SortedFieldReturnItemClass|raw }}">
			{{ ReturnQty|raw }}<a href="{{ ProductLink|raw }}" target="_blank">{{ ProdName|raw }}</a>
			{{ ReturnedProductOptions|raw }}
		</td>
		<td class="{{ SortedFieldOrderClass|raw }}">
			<a href="index.php?ToDo=viewOrders&amp;searchQuery={{ OrderId|raw }}">{% lang 'OrderNo' %}{{ OrderId|raw }}</a> {% if not return.order_orderid or return.order_deleted %}<span class="light">({% lang 'deleted' %})</span>{% endif %}
		</td>
		<td class="{{ SortedFieldCustClass|raw }}">
			<a href="index.php?ToDo=viewCustomers&amp;searchQuery={{ CustomerId|raw }}">{{ Customer|raw }}</a>
		</td>
		<td nowrap="nowrap" class="{{ SortedFieldDateClass|raw }}">
			{{ Date|raw }}
		</td>
		<td class="{{ SortedFieldStatusClass|raw }}">
			<select {{ ReturnStatusDisabled|raw }} name="return_status_{{ ReturnId|raw }}" id="status_{{ ReturnId|raw }}" class="Field returnStatusSelect">
				{{ ReturnStatusOptions|raw }}
			</select>
			<img id="ajax_status_{{ ReturnId|raw }}" src="images/ajax-loader.gif" style="visibility: hidden;" />
		</td>
		<td>
			{{ IssueCreditLink|raw }}
		</td>
	</tr>
	<tr id="trQ{{ ReturnId|raw }}" style="display:none">
		<td colspan="3">
			&nbsp;
		</td>
		<td colspan="6" id="tdQ{{ ReturnId|raw }}" class="QuickView">
		</td>
		<td colspan="1">&nbsp;</td>
	</tr>
