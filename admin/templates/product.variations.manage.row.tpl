<tr id="tr{{ VariationId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="variations[]" value="{{ VariationId|raw }}">
	</td>
	<td align="center" style="width:20px">
		<img src="images/product_variation.gif" alt="product" height="16" width="16" />
	</td>
	<td class="{{ SortedFieldNameClass|raw }}">
		{{ Name|raw }}
	</td>
	<td class="{{ SortedFieldOptionsClass|raw }}">
		{{ NumOptions|raw }}
	</td>
	<td class="{{ SortedFieldOptionsClass|raw }}">
		{{ Edit|raw }}
	</td>
</tr>