<a name="productsByNumViews"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'ProductsPerPage' %}:
		<select onchange="ChangeProductsByNumViewsPerPage(this.options[this.selectedIndex].value)">
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
			<span onmouseover="ShowQuickHelp(this, '{% lang 'StatsViews' %}', '{% lang 'ProductsByNumViewsHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'StatsViews' %}</span> &nbsp;
			{{ SortLinksViews|raw }}
		</td>
		<td align="left">
			{% lang 'AverageRating' %} &nbsp;
			{{ SortLinksAverageRating|raw }}
		</td>
	</tr>
	{{ OrderGrid|raw }}
</table>
{{ JumpToOrdersByItemsViewsGrid|raw }}
