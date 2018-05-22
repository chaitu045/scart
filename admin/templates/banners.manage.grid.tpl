			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%;">
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>
					{% lang 'BannerName' %} &nbsp;
					{{ SortLinksName|raw }}
				</td>
				<td>
					{% lang 'BannerLocation' %} &nbsp;
					{{ SortLinksLocation|raw }}
				</td>
				<td>
					{% lang 'DateCreated' %} &nbsp;
					{{ SortLinksDate|raw }}
				</td>
				<td style="width:70px;">
					{% lang 'Visible' %} &nbsp;
					{{ SortLinksStatus|raw }}
				</td>
				<td style="width:80px;">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ BannerGrid|raw }}
		</table>