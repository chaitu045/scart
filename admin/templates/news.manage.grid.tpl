			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%; margin-top:10px">
				<tr align="right">
					<td colspan="9" style="padding:6px 0px 6px 0px" class="PagingNav">
						{{ Nav|raw }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>
					{% lang 'NewsTitle' %} &nbsp;
					{{ SortLinksTitle|raw }}
				</td>
				<td>
					{% lang 'Date' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td style="width:70px;">
					{% lang 'Visible' %} &nbsp;
					{{ SortLinksVisible|raw }}
				</td>
				<td style="width:100px;">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ NewsGrid|raw }}
			<tr align="right">
				<td colspan="9" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ Nav|raw }}
				</td>
			</tr>
		</table>