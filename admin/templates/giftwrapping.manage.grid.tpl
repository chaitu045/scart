<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0">
	<tr style="{{ HidePaging|raw }}">
		<td colspan="6" style="text-align: right; padding: 0 0 6px 0;" class="PagingNav">
			{{ Nav|raw }}
		</td>
	</tr>
	<tr class="Heading3">
		<td style="text-align: center; width: 10px;"><input type="checkbox" onclick="$(this.form).find('input:checkbox').not(':disabled').attr('checked', this.checked);" /></td>
		<td style="width: 10px;">&nbsp;</td>
		<td>
			{% lang 'WrapName' %}
			{{ SortLinksWrapName|raw }}
		</td>
		<td style="width: 150px;">
			{% lang 'Price' %}
			{{ SortLinksWrapPrice|raw }}
		</td>
		<td style="width: 80px; text-align: center;">
			{% lang 'Visible' %}
			{{ SortLinksWrapVisible|raw }}
		</td>
		<td style="width: 160px;">{% lang 'Action' %}</td>
	</tr>
	{{ GiftWrapGrid|raw }}
	<tr>
		<td colspan="6" style="text-align: right; padding: 6px 0;" class="PagingNav">
			{{ Nav|raw }}
		</td>
	</tr>
</table>