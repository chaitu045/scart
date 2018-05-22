	<tr id="tr{{ GiftCertificateId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center" style="width:23px">
			<input type="checkbox" name="certificates[]" value="{{ GiftCertificateId|raw }}" class="DeleteCheck">
		</td>
		<td align="center" style="width:15px">
			<a href="#" onclick="QuickGiftCertificateView('{{ GiftCertificateId|raw }}'); return false;">
				<img id="expand{{ GiftCertificateId|raw }}" src="images/plus.gif" class="ExpandLink" align="left" width="19" height="16" title="{% lang 'ExpandGiftCertificateQuickView' %}" border="0">
			</a>
		</td>
		<td align="center" style="width:18px">
			<img src='images/giftcertificate.gif' height="16" width="16" />
		</td>
		<td class="{{ SortedFieldCodeClass|raw }}">
			{{ GiftCertificateCode|raw }}
		</td>
		<td class="{{ SortedFieldCustClass|raw }}">
			<a href="index.php?ToDo=viewCustomers&amp;searchQuery={{ GiftCertificateCustomerId|raw }}" target="_blak">{{ GiftCertificateCustomerName|raw }}</a>
		</td>
		<td class="{{ SortedFieldCertificateAmountClass|raw }}">
			{{ GiftCertificateAmount|raw }}
		</td>
		<td class="{{ SortedFieldCertificateBalanceClass|raw }}">
			{{ GiftCertificateBalance|raw }}
		</td>
		<td class="{{ SortedFieldPurchaseDateClass|raw }}">
			{{ GiftCertificatePurchaseDate|raw }}
		</td>
		<td class="{{ SortedFieldStatusClass|raw }}">
			<select name="certificate_status_{{ GiftCertificateId|raw }}" id="status_{{ GiftCertificateId|raw }}" class="Field" onchange="UpdateGiftCertificateStatus({{ GiftCertificateId|raw }}, this.options[this.selectedIndex].value, this.options[this.selectedIndex].text)">
				{{ GiftCertificateStatusOptions|raw }}
			</select>
			&nbsp;
		</td>
	</tr>
	<tr id="trQ{{ GiftCertificateId|raw }}" style="display: none;">
		<td colspan="3">&nbsp;</td>
		<td colspan="2" id="tdQ{{ GiftCertificateId|raw }}" class="QuickView">
		</td>
		<td colspan="3">&nbsp;</td>
	</tr>
