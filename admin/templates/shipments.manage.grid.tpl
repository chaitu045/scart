<table class="GridPanel SortableGrid AutoExpand" cellspacing="0" cellpadding="0" border="0" style="width:100%;">
	<tr style="text-align: right">
		<td colspan="{% if orderView == true %}8{% else %}9{% endif %}" style="padding:6px 0px 6px 0px" class="PagingNav">
			{{ Nav|raw }}
		</td>
	</tr>
	<tr class="Heading3">
		{% if orderView == false %}
			<td align="center"><input type="checkbox" onclick="$(this.form).find('input:checkbox').not(':disabled').attr('checked', this.checked);" /></td>
		{% endif %}
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td nowrap="nowrap" style="width: 120px;">
			{% lang 'ShipmentId' %} &nbsp;
			{{ SortLinksId|raw }}
		</td>
		<td>
			{% lang 'ShippedTo' %} &nbsp;
			{{ SortLinksName|raw }}
		</td>
		<td nowrap="nowrap">
			{% lang 'DateShipped' %} &nbsp;
			{{ SortLinksDate|raw }}
		</td>
		<td nowrap="nowrap" style="width: 120px;">
			{% lang 'TrackingNo' %} &nbsp;
			{{ SortLinksTrackingNo|raw }}
		</td>
		<td nowrap="nowrap">
			{% lang 'ShipmentOrderDate' %} &nbsp;
			{{ SortLinksOrderDate|raw }}
		</td>
		<td style="width:100px">
			{% lang 'Action' %}
		</td>
	</tr>
	{{ ShipmentGrid|raw }}
	<tr style="text-align: right">
		<td colspan="{% if orderView == true %}8{% else %}9{% endif %}" style="padding:6px 0px 6px 0px" class="PagingNav">
			{{ Nav|raw }}
		</td>
	</tr>
</table>
<script type="text/javascript" charset="utf-8">
	lang.Saving = "{% jslang 'Saving' %}";
	lang.ErrorSavingTrackingNo = "{% jslang 'ErrorSavingTrackingNo' %}";
</script>