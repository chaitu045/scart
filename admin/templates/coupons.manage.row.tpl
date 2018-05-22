	<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
		<td align="center">
			<input type="checkbox" name="coupon[]" value="{{ CouponId|raw }}">
		</td>
		<td align="center" style="width:18px;">
			<img src='images/coupon.gif'>
		</td>
		<td class="{{ SortedFieldNameClass|raw }}">
			{{ Name|raw }}
		</td>
		<td class="{{ SortedFieldCouponClass|raw }}">
			<input type="text" value="{{ Coupon|raw }}" class="Field100" />
		</td>
		<td class="{{ SortedFieldDiscountClass|raw }}">
			{{ Discount|raw }}
		</td>
		<td class="{{ SortedFieldExpiryClass|raw }}">
			{{ Date|raw }}
		</td>
		<td class="{{ SortedFieldNumUsesClass|raw }}">
			{{ NumUses|raw }}
		</td>
		<td align="center" class="{{ SortedFieldEnabledClass|raw }}">
			{{ Enabled|raw }}
		</td>
		<td nowrap="nowrap">
			{{ EditCouponLink|raw }}&nbsp;&nbsp;&nbsp;
			<a title='{% lang 'CopyCouponClip' %}' href="javascript:CouponClipboard('{{ Coupon|raw }}')">{% lang 'CopyToClipboard' %}</a>
			{{ ViewOrdersLink|raw }}
		</td>
	</tr>