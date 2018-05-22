<tr id="tr{{ ProductId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="products[]" value="{{ ProductId|raw }}">
	</td>
	<td align="center" style="width:15px; display: {{ HideInventoryOptions|raw }}">
		{{ StockExpand|raw }}
	</td>
	<td align="center" style="width:20px">
		<img src="images/product.gif" alt="product" height="16" width="16" />
	</td>
	<td style="width:50px" nowrap class="ImageField" align="center">
		{{ ProductImage|raw }}
	</td>
	<td style="width:100px" class="{{ SortedFieldCodeClass|raw }}">
		{{ SKU|raw }}
	</td>
	<td id="InStock{{ ProductId|raw }}" class="{{ SortedFieldStockClass|raw }} {{ LowStockStyle|raw }}" style="display: {{ HideInventoryOptions|raw }}">
		{{ StockInfo|raw }}
	</td>
	<td colspan="{{ ProductNameSpan|raw }}" class="{{ SortedFieldNameClass|raw }}">
		{{ Name|raw }}
	</td>
	<td style="text-align: right;" class="{{ SortedFieldPriceClass|raw }}">
		{{ Price|raw }}
	</td>
	<td style="padding-left: 15px;" class="{{ SortedFieldStatusClass|raw }}">
		{{ Status }}
	</td>
	<td align="center" class="{{ SortedFieldVisibleClass|raw }}">
		{{ Visible|raw }}
	</td>
	<td align="center" class="{{ SortedFieldFeaturedClass|raw }}">
		{{ Featured|raw }}
	</td>
	<td>
		{{ EditProductLink|raw }}
		{{ CopyProductLink|raw }}
	</td>
</tr>
<tr id="trQ{{ ProductId|raw }}" style="display:none">
	<td colspan="6">
		&nbsp;
	</td>
	<td colspan="2" class="ProductQuickView QuickView" id="tdQ{{ ProductId|raw }}">
	</td>
	<td colspan="3">
		&nbsp;
	</td>
</tr>