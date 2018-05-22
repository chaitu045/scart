<tr id="tr{{ ExportTemplateId|raw }}" class="GridRow" onmouseover="this.className='GridRowOver'" onmouseout="this.className='GridRow'">
	<td align="center" style="width: 25px; {{ HideCheckAll|raw }}">
		{{ CheckTemplate|raw }}
	</td>
	<td align="center" style="width:18px">
		<img src="images/application_form.png" width="12" height="15" />
	</td>
	<td colspan="{{ ProductNameSpan|raw }}" class="{{ SortedFieldNameClass|raw }}">
		{{ ExportTemplateName|raw }}
	</td>
	<td>
		{{ TemplateType|raw }}
	</td>
	<td {{ HideVendorColumn|raw }}>
		{{ VendorName|raw }}
	</td>
	<td>
		<select id="select{{ ExportTemplateId|raw }}" style="width: 160px;" onchange="PerformAction(this);">
			<option value="">{% lang 'ChooseAnAction' %}</option>
			{{ TemplateActions|raw }}
		</select>
	</td>
</tr>