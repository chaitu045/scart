			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%; margin-top:10px">
				<tr align="right">
					<td colspan="6" style="padding:6px 0px 6px 0px" class="PagingNav">
						{{ Nav|raw }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center">
					<input type="checkbox" id="checkalltemplates" onclick="$('.EbayTemplate').attr('checked', this.checked);">
				</td>
				<td>&nbsp;</td>
				<td>
					{% lang 'TemplateName' %} &nbsp;
					{{ SortLinksName|raw }}
				</td>
				<td>
					{% lang 'TemplateDate' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td align="center" style="width:100px;">
					{% lang 'TemplateEnabled' %} &nbsp;
					{{ SortLinksEnabled|raw }}
				</td>
				<td style="width:100px;">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ EbayTemplateGrid|raw }}
			<tr align="right">
				<td colspan="6" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ Nav|raw }}
				</td>
			</tr>
		</table>