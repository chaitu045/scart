<a name="customersByDateAnchor"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'CustomersPerPage' %}:
		<select onchange="ChangeCustomersByDatePerPage(this.options[this.selectedIndex].value)">
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
			{% lang 'CustomerID' %} &nbsp;
			{{ SortLinksCustId|raw }}
		</td>
		<td align="left">
			{% lang 'StatsCustomerName' %} &nbsp;
			{{ SortLinksCust|raw }}
		</td>
		<td align="left">
			{% lang 'StatsEmail' %} &nbsp;
			{{ SortLinksEmail|raw }}
		</td>
		<td align="left">
			{% lang 'StatsDateJoined' %} &nbsp;
			{{ SortLinksDate|raw }}
		</td>
		<td align="right">
			<span onmouseover="ShowQuickHelp(this, '{% lang 'StatsOrders' %}', '{% lang 'RevenuePerCustomerOrdersHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'StatsOrders' %}</span> &nbsp;
			{{ SortLinksNumOrders|raw }}
		</td>
		<td align="right">
			<span onmouseover="ShowQuickHelp(this, '{% lang 'StatsAmountSpent' %}', '{% lang 'RevenuePerCustomerAmountSpentHelp' %}');" onmouseout="HideQuickHelp(this);" class="HelpText">{% lang 'StatsAmountSpent' %}</span> &nbsp;
			{{ SortLinksAmountSpent|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Action' %}
		</td>
	</tr>
	{{ CustomerGrid|raw }}
</table>
{{ JumpToCustomersByDateGrid|raw }}
