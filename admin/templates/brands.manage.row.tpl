<tr class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width:25px">
		<input type="checkbox" name="brands[]" value="{{ BrandId|raw }}">
	</td>
	<td align="center" style="width:18px;">
		<img src='images/brand.gif' width="15" height="15">
	</td>
	<td class="{{ SortedFieldBrandClass|raw }}">
		{{ BrandName|raw }}
	</td>
	<td class="{{ SortedFieldProductsClass|raw }}">
		{{ Products|raw }}
	</td>
	<td>
		{{ EditBrandLink|raw }}
	</td>
</tr>
