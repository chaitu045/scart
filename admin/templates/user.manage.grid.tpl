			<table class="GridPanel SortableGrid" cellspacing="0" cellpadding="0" border="0" id="IndexGrid" style="width:100%; display: {{ DisplayGrid|raw }}">
				<tr align="right">
					<td colspan="8" style="padding:6px 0px 6px 0px" class="PagingNav">
						{{ Nav|raw }}
					</td>
				</tr>
			<tr class="Heading3">
				<td align="center"><input type="checkbox" onclick="ToggleDeleteBoxes(this.checked)"></td>
				<td>&nbsp;</td>
				<td>
					{% lang 'UserName1' %} &nbsp;
					{{ SortLinksUser|raw }}
				</td>
				<td style="width:30%">
					{% lang 'Name' %} &nbsp;
					{{ SortLinksName|raw }}
				</td>
				<td>
					{% lang 'UserEmail' %} &nbsp;
					{{ SortLinksEmail|raw }}
				</td>
				<td style="width: 150px; {{ HideVendorColumn|raw }}">
					{% lang 'Vendor' %} &nbsp;
					{{ SortLinksVendor|raw }}
				</td>
				<td style="width:80px; display: {{ StatusField|raw }}">
					{% lang 'UserStatus' %} &nbsp;
					{{ SortLinksStatus|raw }}
				</td>
				<td style="width:70px">
					{% lang 'Action' %}
				</td>
			</tr>
			{{ UserGrid|raw }}
			<tr align="right">
				<td colspan="8" style="padding:6px 0px 6px 0px" class="PagingNav">
					{{ Nav|raw }}
				</td>
			</tr>
		</table>