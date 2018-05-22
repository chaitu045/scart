<table class="GridPanel" cellspacing="0" cellpadding="0" border="0" style="width: 100%; margin-bottom: 10px;">
	<tr class="Heading3">
		<td align="center" style="{{ HideCheckAll|raw }}"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
		<td>&nbsp;</td>
		<td>
			{% lang 'ExportTemplateTitle' %} &nbsp;
			{{ SortLinksTitle|raw }}
		</td>
		<td>
			<span class="HelpText" onmouseout="HideQuickHelp(this);" onmouseover="ShowQuickHelp(this, '{% lang 'TemplateType' %}', '{% lang 'TemplateTypeHelp' %}');">{% lang 'TemplateType' %}</span>&nbsp;
			{{ SortLinksType|raw }}
		</td>
		<td {{ HideVendorColumn|raw }}>
			{{ VendorLabel|raw }} &nbsp;
			{{ SortLinksVendor|raw }}
		</td>
		<td style="width:100px;">
			{% lang 'Action' %} &nbsp;
			{{ SortLinksAction|raw }}
		</td>
	</tr>
	{{ ExportTemplateGridData|raw }}
</table>