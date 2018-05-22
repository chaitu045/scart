<a name="productsByInventoryAnchor"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'ItemsPerPage' %}:
		<select onchange="ChangeTaxByDatePerPage(this.options[this.selectedIndex].value)">
			<option {{ IsShowPerPage5|raw }} value="5">5</option>
			<option {{ IsShowPerPage10|raw }} value="10">10</option>
			<option {{ IsShowPerPage20|raw }} value="20">20</option>
			<option {{ IsShowPerPage30|raw }} value="30">30</option>
			<option {{ IsShowPerPage50|raw }} value="50">50</option>
			<option {{ IsShowPerPage100|raw }} value="100">100</option>
		</select>
	</div>
	{{ Paging|raw }}
</div>
<br />
<table width="100%" border=0 cellspacing=1 cellpadding=5 class="text">
	<tr class="Heading3">
		<td align="left">
			{% lang 'Period' %} &nbsp;
			{{ SortLinksPeriod|raw }}
		</td>
		<td align="left">
			{% lang 'TaxType' %} &nbsp;
			{{ SortLinksTaxType|raw }}
		</td>
		<td align="center">
			{% lang 'Rate' %} &nbsp;
			{{ SortLinksTaxRate|raw }}
		</td>
		<td align="center">
			{% lang 'NumberOfOrders' %} &nbsp;
			{{ SortLinksNumOrders|raw }}
		</td>
		<td align="left" width="100">
			{% lang 'TaxAmount' %} &nbsp;
			{{ SortLinksTaxAmount|raw }}
		</td>
	</tr>
	{{ TaxGrid|raw }}
</table>