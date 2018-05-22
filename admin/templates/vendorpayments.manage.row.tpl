<tr id="tr{{ PaymentId|raw }}" class="GridRow">
	<td style="text-align: center; width: 23px;">
		<input type="checkbox" name="payments[]" value="{{ PaymentId|raw }}" />
	</td>
	<td style="text-align: center; width: 15px;">
		<a href="#" onclick="VendorPayments.Expand('{{ PaymentId|raw }}'); return false;" style="{{ HideExpandLink|raw }}">
			<img id="expand{{ PaymentId|raw }}" src="images/plus.gif" align="left" width="19" class="ExpandLink" height="16" title="{% lang 'ExpandQuickView' %}" border="0" />
		</a>
	</td>
	<td style="text-align: center; width: 18px;">
		<img src="images/payment.gif" alt="" />
	</td>
	<td class="{{ SortedFieldIdClass|raw }}">
		{{ PaymentId|raw }}
	</td>
	<td class="{{ SortedFieldVendorClass|raw }}">
		{{ Vendor|raw }}
	</td>
	<td class="{{ SortedFieldDateClass|raw }}">
		{{ PaymentFrom|raw }} - {{ PaymentTo|raw }}
	</td>
	<td class="{{ SortedFieldAmountClass|raw }}">
		{{ PaymentAmount|raw }}
	</td>
	<td class="{{ SortedFieldPaymentDateClass|raw }}">
		{{ PaymentDate|raw }}
	</td>
	<td class="{{ SortedFieldMethodClass|raw }}">
		{{ PaymentMethod|raw }}
	</td>
</tr>
<tr id="trQ{{ PaymentId|raw }}" style="display: none">
	<td>&nbsp;</td>
	<td colspan="8" class="QuickView">
		<h5>{% lang 'Comments' %}:</h5>
		<blockquote>{{ PaymentComments|raw }}</blockquote>
	</td>
</tr>