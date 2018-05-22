	<li id="{{ RowId|raw }}" class="SortableRow"  style="width:100%;">
		<table class="GridPanel SortablePanel" cellspacing="0" cellpadding="0" border="0" style="width : 100%;">
		<tr class="GridRow">
		<td align="left" width="10px">
			<input class="DiscountsIdx" type="checkbox" name="discount[]" value="{{ DiscountId|raw }}" />
			<input type="hidden" class="DiscountSortOrder" value="{{ SortOrder|raw }}" />
		</td>
		<td align="left" width="30px">
			<img src='images/discountrule.gif'>
		</td>
		<td class="{{ SortedFieldNameClass|raw }} DragMouseDown sort-handle">
			{{ Name|raw }}
		</td>
		<td align="left" class="{{ SortedFieldMaxUsesClass|raw }}" width="100px">
			{{ MaxUses|raw }}
		</td>
		<td align="left" class="{{ SortedFieldCurrentUsesClass|raw }}" width="100px">
			{{ CurrentUses|raw }}
		</td>
		<td align="left" class="{{ SortedFieldExpiryDateClass|raw }}" width="98px">
			{{ ExpiryDate|raw }}
		</td>
		<td align="left" class="{{ SortedFieldEnabledClass|raw }}" width="80px">
			{{ Enabled|raw }}
		</td>
		<td align="left" class="{{ SortedFieldHaltClass|raw }}" width="130px">
			{{ Halt|raw }}
		</td>
		<td nowrap="nowrap" width="80px">
			{{ EditDiscountLink|raw }}
			{{ DeleteDiscountLink|raw }}
		</td>
		</tr>
		</table>
	</li>