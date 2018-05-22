<a name="ordersByAbandonAnchor"></a>
<div style="text-align:right">
	<div style="padding-bottom:10px">
		{% lang 'OrdersPerPage' %}:
		<select onchange="ChangeOrdersByAbandonPerPage(this.options[this.selectedIndex].value)">
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
			{{ SortLinksOrderId|raw }}
		</td>

		<td nowrap align="left">
			{% lang 'Customer' %} &nbsp;
			{{ SortLinksCustomerName|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Email' %} &nbsp;
			{{ SortLinksCustomerEmail|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Phone' %} &nbsp;
			{{ SortLinksCustomerPhone|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'Date' %} &nbsp;
			{{ SortLinksDate|raw }}
		</td>
		<td nowrap align="left">
			{% lang 'OrdersByAbandonTotalOrderAmount' %} &nbsp;
			{{ SortLinksOrderTotal|raw }}
		</td>
	</tr>
	{{ OrderGrid|raw }}
</table>
{{ JumpToOrdersByAbandonGrid|raw }}
<script type="text/javascript" language="javascript">//<![CDATA[
$(function(){
	$('#abandonedTotals > .MessageBox').show().html({{ AbandonedSummary|raw }});
});
//]]></script>
