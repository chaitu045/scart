<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top" width="33%" class="QuickViewPanel">
			<h5>{% lang 'BillingDetails' %}</h5>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="text" width="120" valign="top"=>{% lang 'CustomerDetails' %}:</td>
					<td class="text">
						{{ BillingAddress|raw }}
					</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'Email' %}:</td>
					<td class="text">{{ BillingEmail|raw }}</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'PhoneNumber' %}:</td>
					<td class="text">{{ BillingPhone|raw }}</td>
				</tr>
				<tr>
					<td class="text">{% lang 'ShipmentOrderId' %}</td>
					<td class="text"><a href="index.php?ToDo=viewOrders&amp;orderId={{ OrderId|raw }}" target="_blank">#{{ OrderId|raw }}</a>
				<tr>
					<td class="text" valign="top">{% lang 'ShipmentOrderDate' %}:</td>
					<td class="text">{{ OrderDate|raw }}</td>
				</tr>
				<tr style="{{ HideVendor|raw }}">
					<td class="text" valign="top">{% lang 'Vendor' %}:</td>
					<td class="text">{{ VendorName|raw }}</td>
				</tr>

			</table>
		</td>
		<td valign="top" width="33%" class="QuickViewPanel" style="padding-left:15px">
			<h5>{% lang 'ShippingDetails' %}</h5>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="text" valign="top">{% lang 'CustomerDetails' %}:</td>
					<td class="text">
						{{ ShippingAddress|raw }}
					</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'Email' %}:</td>
					<td class="text">{{ ShippingEmail|raw }}</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'PhoneNumber' %}:</td>
					<td class="text">{{ ShippingPhone|raw }}</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'ShippingMethod' %}:</td>
					<td class="text">{{ ShippingMethod|raw }}</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'ShippingDate' %}:</td>
					<td class="text">{{ ShipmentDate|raw }}</td>
				</tr>
				<tr>
					<td class="text" valign="top">{% lang 'TrackingNumber' %}:</td>
					<td class="text">{{ TrackingNo|raw }}</td>
				</tr>
			</table>
		</td>
		<td valign="top" width="33%" style="padding-left:10px">
			<h5>{% lang 'ShippedItems' %}</h5>
			{{ ProductsTable|raw }}
			<div style="{{ HideShipmentComments|raw }}">
				<h5 style="margin-top: 10px;">{% lang 'ShipmentComments' %}</h5>
				<div style="margin-left: 20px;">
					{{ ShipmentComments|raw }}
				</div>
			</div>
		</td>
	</tr>
</table>