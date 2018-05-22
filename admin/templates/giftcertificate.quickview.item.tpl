<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td valign="top">
			<h5 style="margin: 0pt 0pt 5pt 10px"><a href="index.php?ToDo=viewOrders&amp;searchQuery={{ OrderId|raw }}" target="_blank">{% lang 'OrderNo' %}{{ OrderPrefix|raw }}{{ OrderId|raw }}</a></h5>
			<table width="95%" border="0" align="right">
				<tr>
					<td width="150" class="text">{% lang 'OrderDate1' %}:</td>
					<td class="text">{{ OrderDate|raw }}</td>
				</tr>
				<tr>
					<td width="150" class="text">{% lang 'Customer' %}:</td>
					<td class="text"><a href="index.php?ToDo=viewCustomers&amp;searchQuery={{ CustomerId|raw }}" target="_blank">{{ CustomerName|raw }}</a></td>
				</tr>
				<tr>
					<td class="text">{% lang 'BalanceUsed' %}:</td>
					<td class="text">{{ BalanceUsed|raw }} ({{ BalanceRemaining|raw }} {% lang 'Remaining' %})</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br />