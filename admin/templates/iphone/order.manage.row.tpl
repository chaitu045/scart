<li class="orderManageRow {% if order.deleted %}orderManageRowDeleted{% endif %}">
<a href="{{ ShopPath|raw }}/admin/index.php?ToDo=viewSingleOrder&amp;o={{ OrderId|raw }}" target="_self">
    <span class="orderId">{% lang 'Order' %} #{{ OrderId|raw }}</span> <div style="display:{{ HideMessages|raw }}" class="newIcon">{{ NumMessages|raw }}</div>
    <div class="orderStatus" style="width:150px; font-size:13px; background-color:{{ StatusCol|raw }}">
	    {{ OrderStatusText|raw }}
    </div>
    <div style="font-size:11px; color:gray; font-weight:normal">
	{% lang 'OrderedOn' %} {{ Date|raw }}<br />
	{% lang 'ByWord' %} {{ Customer|raw }}<br />
	{% lang 'TotalIs' %} {{ Total|raw }}
    </div>
</a>
</li>
