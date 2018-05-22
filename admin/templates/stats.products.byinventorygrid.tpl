<a name="productsByInventoryAnchor"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'ProductsPerPage' %}:
		<select onchange="ChangeProductsByInventoryPerPage(this.options[this.selectedIndex].value)">
			<option {{ IsShowPerPage5|raw }} value="5">5</option>
			<option {{ IsShowPerPage10|raw }} value="10">10</option>
			<option {{ IsShowPerPage20|raw }} value="20">20</option>
			<option {{ IsShowPerPage30|raw }} value="30">30</option>
			<option {{ IsShowPerPage50|raw }} value="50">50</option>
			<option {{ IsShowPerPage100|raw }} value="100">100</option>
		</select>
	</div>
	{{ Paging|raw }}
	<br style="clear:left;" />
</div>
<br />
<table width="100%" border=0 cellspacing=1 cellpadding=5 class="text">
	<tr class="Heading3">
		<td align="left">
			{% lang 'ProductID' %} &nbsp;
			{{ SortLinksProductId|raw }}
		</td>
		<td align="left">
			{% lang 'ProductSKU' %} &nbsp;
			{{ SortLinksCode|raw }}
		</td>
		<td align="left">
			{% lang 'Item' %} &nbsp;
			{{ SortLinksName|raw }}
		</td>
		<td align="left">
			<span onmouseover="ShowQuickHelp(this, '{% lang 'TrackingMethod' %}', '{% lang 'TrackingMethodHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'TrackingMethod' %}</span>
		</td>
		<td align="left">
			<span onmouseover="ShowQuickHelp(this, '{% lang 'StatsInStock' %}', '{% lang 'StatsInStockHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'StatsInStock' %}</span> &nbsp;
			{{ SortLinksStock|raw }}
		</td>
		<td align="left">
			{% lang 'Action' %}</span>
		</td>
	</tr>
	{{ OrderGrid|raw }}
</table>
