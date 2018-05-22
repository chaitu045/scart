<a name="ordersByDateAnchor"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'OrdersPerPage' %}:
		<select onchange="ChangeOrdersByDatePerPage(this.options[this.selectedIndex].value)">
			<option {{ IsShowPerPage5|raw }} value="5">5</option>
			<option {{ IsShowPerPage10|raw }} value="10">10</option>
			<option {{ IsShowPerPage20|raw }} value="20">20</option>
			<option {{ IsShowPerPage30|raw }} value="30">30</option>
			<option {{ IsShowPerPage50|raw }} value="50">50</option>
			<option {{ IsShowPerPage100|raw }} value="100">100</option>
			<option {{ IsShowPerPage200|raw }} value="200">200</option>
		</select>
	</div>
	{{ Paging|raw }}
</div>
<br />
<table width="100%" border=0 cellspacing=1 cellpadding=5 class="text">
	<tr class="Heading3">
		<td nowrap align="left">
			{% lang 'OrderID' %} &nbsp;
			{{ SortLinksId|raw }}
		</td>

		<td nowrap align="left">
			{% lang 'Customer' %} &nbsp;
			{{ SortLinksCust|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Date' %} &nbsp;
			{{ SortLinksDate|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Total' %} &nbsp;
			{{ SortLinksTotal|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Action' %}
		</td>
	</tr>
	{{ OrderGrid|raw }}
</table>
{{ JumpToOrdersByDateGrid|raw }}
